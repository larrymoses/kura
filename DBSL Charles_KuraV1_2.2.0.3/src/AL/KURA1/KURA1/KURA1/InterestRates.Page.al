#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54007 "Interest Rates"
{
    Editable = false;
    PageType = List;
    SourceTable = "Investment History";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Current Market Value";"Current Market Value")
                {
                    ApplicationArea = Basic;
                }
                field("Valuation Factor";"Valuation Factor")
                {
                    ApplicationArea = Basic;
                }
                field("Gain/Loss";"Gain/Loss")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(POST)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    
                    if Posted then
                    Error('This Revaluation has been Posted');
                    
                    if Property.Get(No) then
                    begin
                    
                    Property.SetRange("Date Filter",0D,Date);
                    Property.CalcFields("Current Value","No.Of Units",Cost,Revaluations,"Revaluations (FCY)","Acquisition Cost (FCY)");
                    //MESSAGE('CURRENT VALUE=%1 %2',Property."Current Value",EquityRec.Revaluations);
                    
                    EquityRec.Copy(Property);
                    EquityRec.SetRange("Date Filter",0D,EndYear(Date));
                    EquityRec.CalcFields(EquityRec.Revaluations,EquityRec."Revaluations (FCY)","Acquisition Cost (FCY)");
                    //MESSAGE('CURRENT VALUE=%1',EquityRec.Revaluations);
                    
                    //Reverse Previous
                    
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='GENERAL';
                    GenJnlLine."Journal Batch Name":='JVS';
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";
                    
                    if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                    GenJnlLine."Account No.":=InvestmentPostingGrp."Investment Revaluation Account"
                    else
                    Error('You must specify Investment Posting Group for Property %1',No);
                    
                    if "Currency Code"='' then begin
                    
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=CopyStr('JV-'+No+'-'+Format(GenJnlLine."Posting Date"),1,20);
                    //GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=(Property.Revaluations-EquityRec.Revaluations);
                    //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description:=Property.Description + '' + 'Revaluation Reversal' ;
                    GenJnlLine."Investment Code":=No;
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Revaluation;
                    //GenJnlLine."No. Of Units":="No. Of Units";
                    //GenJnlLine."Expected Receipt date":="Schedule Date";
                    
                    
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    /*
                    IF InvestmentPostingGrp."Capital Reserve Account"<>'' THEN
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Capital Reserve Account"
                    ELSE
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Revaluation Gain/Loss";
                    */
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Investment Cost Account";
                    /*
                    GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                    GenJnline."Fund Code":=Property."Fund Code";
                    GenJnline."Custodian Code":=Property."Custodian Code";
                    GenJnline.Validate(GenJnline."Fund Code");
                    GenJnline.Validate(GenJnline."Custodian Code");
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert(true);
                    
                    end else begin
                    
                    //Foreign Currency
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=GenJnlLine."Line No."+10000;
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=CopyStr('JV-'+No+'-'+Format(GenJnlLine."Posting Date"),1,20);
                    //GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":="Currency Code";
                    GenJnlLine.Validate("Currency Code");
                    GenJnlLine.Amount:=(Property."Revaluations (FCY)"-EquityRec."Revaluations (FCY)");
                    //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description:=Property.Description + '' + 'Revaluation Reversal' ;
                    GenJnlLine."Investment Code":=No;
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Revaluation;
                    //GenJnlLine."No. Of Units":="No. Of Units";
                    //GenJnlLine."Expected Receipt date":="Schedule Date";
                    
                    
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    
                    /*
                    IF InvestmentPostingGrp."Capital Reserve Account"<>'' THEN
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Capital Reserve Account"
                    ELSE
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Revaluation Gain/Loss";
                    */
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Investment Cost Account";
                    
                    /*
                    GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                    GenJnline."Fund Code":=Property."Fund Code";
                    GenJnline."Custodian Code":=Property."Custodian Code";
                    GenJnline.Validate(GenJnline."Fund Code");
                    GenJnline.Validate(GenJnline."Custodian Code");
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert(true);
                    
                     //*******end Foreign Currency
                    end;
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //End the reversal
                    
                    
                    
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='GENERAL';
                    GenJnlLine."Journal Batch Name":='JVS';
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";
                    
                    if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                    GenJnlLine."Account No.":=InvestmentPostingGrp."Investment Revaluation Account"
                    else
                    Error('You must specify Investment Posting Group for Property %1',No);
                    
                    if "Currency Code"='' then begin
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=70000;
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=CopyStr('JV-'+No+'-'+Format(GenJnlLine."Posting Date"),1,20);
                    
                    GenJnlLine.Amount:=-(((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations);
                    
                    //GenJnlLine."External Document No.":="Cheque No";
                    //GenJnlLine.Amount:=-(((Property."No.Of Units"*"Current Market Value")-Property."Acquisition Cost (FCY)")-
                    //EquityRec."Revaluations (FCY)");
                    //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description:=Property.Description + '' + 'Revaluation' ;
                    GenJnlLine."Investment Code":=No;
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Revaluation;
                    //GenJnlLine."No. Of Units":="No. Of Units";
                    //GenJnlLine."Expected Receipt date":="Schedule Date";
                    /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                    GenJnline."Fund Code":=Property."Fund Code";
                    GenJnline."Custodian Code":=Property."Custodian Code";
                    GenJnline.Validate(GenJnline."Fund Code");
                    GenJnline.Validate(GenJnline."Custodian Code");
                    
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    /*
                    IF InvestmentPostingGrp."Capital Reserve Account"<>'' THEN
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Capital Reserve Account"
                    ELSE
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Revaluation Gain/Loss";
                    */
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Investment Cost Account";
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert(true);
                    
                    end else begin
                    
                    //Foreign Currency.
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=70000;
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":=Date;
                    GenJnlLine."Document No.":=CopyStr('JV-'+No+'-'+Format(GenJnlLine."Posting Date"),1,20);
                    //GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":="Currency Code";
                    GenJnlLine.Validate("Currency Code");
                    
                    GenJnlLine.Amount:=-(((Property."No.Of Units"*"Current Market Value")-Property."Acquisition Cost (FCY)")-
                    EquityRec."Revaluations (FCY)");
                    
                    //GenJnlLine.Amount:=-(((Property."No.Of Units"*"Current Market Value")-Property.Cost)-EquityRec.Revaluations);
                    //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description:=Property.Description + '' + 'Revaluation' ;
                    GenJnlLine."Investment Code":=No;
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Revaluation;
                    //GenJnlLine."No. Of Units":="No. Of Units";
                    //GenJnlLine."Expected Receipt date":="Schedule Date";
                    /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    GenJnlLine."Dimension Set ID":="Dimension Set ID";
                    GenJnlLine.Validate(GenJnlLine."Dimension Set ID");
                    GenJnline."Fund Code":=Property."Fund Code";
                    GenJnline."Custodian Code":=Property."Custodian Code";
                    GenJnline.Validate(GenJnline."Fund Code");
                    GenJnline.Validate(GenJnline."Custodian Code");
                    
                    GenJnlLine."Bal. Account Type":=GenJnlLine."bal. account type"::"G/L Account";
                    
                    /*
                    IF InvestmentPostingGrp."Capital Reserve Account"<>'' THEN
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Capital Reserve Account"
                    ELSE
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Revaluation Gain/Loss";
                     */
                    
                    GenJnlLine."Bal. Account No.":= InvestmentPostingGrp."Investment Cost Account";
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert(true);
                    
                    //end foreign currency
                    
                    end;
                    end
                    else
                    Error('The Property has not been defined');
                    
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'JVS');
                    if GenJnlLine.Find('-') then
                    repeat
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                    //GenJnline.MODIFY;
                    
                    until GenJnlLine.Next=0;
                    
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'JVS');
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnlLine);
                    
                    Posted:=true;
                    Modify;

                end;
            }
            action("Revaluation Surplus/Deficit")
            {
                ApplicationArea = Basic;
                Image = Recalculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
            }
        }
    }

    var
        GenJnline: Record "Gen. Journal Line";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Investment History";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        InvestmentPostingGrp: Record "Investment Posting Group";
        BFRevaluation: Decimal;
        EquityRec: Record "Investment Asset";
        Equities: Record "Investment Asset";
        InvestmentHistory: Record "Investment History";
        InstitutionAction: Record "Institutional Actions";
        Institution: Record Customer;
        DefaultBatch: Record "Gen. Journal Batch";


    procedure EndYear(var PostDate: Date) EndYearDate: Date
    var
        Year: Integer;
    begin
        Year:=Date2dmy(PostDate,3);
        Year:=Year-1;
        Evaluate(EndYearDate,'3112'+Format(Year));
        //MESSAGE('%1',EndYearDate);
    end;
}

