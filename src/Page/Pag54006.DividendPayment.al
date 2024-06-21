#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54006 "Dividend Payment"
{
    Editable = false;
    PageType = List;
    SourceTable = "Dividend Payment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction Type";"Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field("Dividend Rate";"Dividend Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Books Closure Date";"Books Closure Date")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Date";"Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Shares";"No. of Shares")
                {
                    ApplicationArea = Basic;
                }
                field("Dividend Amount";"Dividend Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Payment posted";"Payment posted")
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

                trigger OnAction()
                begin
                    
                    if Property.Get("Investment No.") then
                    begin
                    Property.SetRange("Date Filter",0D,"Books Closure Date");
                    Property.CalcFields("Current Value","No.Of Units","Acquisition Cost");
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='GENERAL';
                    GenJnlLine."Journal Batch Name":='JVS';
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";
                    
                    if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                    GenJnlLine."Account No.":=InvestmentPostingGrp."Dividend Receivable AC"
                    else
                    Error('You must specify Investment Posting Group for Property %1',"Investment No.");
                    
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=70000;
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":="Books Closure Date";
                    GenJnlLine."Document No.":=CopyStr('JV-'+"Investment No."+'-'+Format(GenJnlLine."Posting Date"),1,20);
                    //GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=-DivAmt;
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description:=Property.Description + ' ' + 'Dividend' ;
                    GenJnlLine."Investment Code":="Investment No.";
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Dividend;
                    GenJnlLine."No. Of Units":=Property."No.Of Units";
                    //GenJnlLine."Expected Receipt date":="Schedule Date";
                    /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    
                    GenJnline."Fund Code":=Property."Fund Code";
                    GenJnline."Custodian Code":=Property."Custodian Code";
                    GenJnline.Validate(GenJnline."Fund Code");
                    GenJnline.Validate(GenJnline."Custodian Code");
                    
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert(true);
                    
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='GENERAL';
                    GenJnlLine."Journal Batch Name":='JVS';
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";
                    
                    if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                    GenJnlLine."Account No.":=InvestmentPostingGrp."Investment Cost Account"
                    else
                    Error('You must specify Investment Posting Group for Property %1',"Investment No.");
                    
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=80000;
                    //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":="Books Closure Date";
                    GenJnlLine."Document No.":=CopyStr('JV-'+"Investment No."+'-'+Format(GenJnlLine."Posting Date"),1,20);
                    //GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine.Amount:=DivAmt;
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description:=Property.Description + ' ' + 'Dividend' ;
                    GenJnlLine."Investment Code":="Investment No.";
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::Dividend;
                    //GenJnlLine."No. Of Units":="New No. of Units";
                    GenJnlLine."Expected Receipt date":="Payment Date";
                    /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    
                    GenJnline."Fund Code":=Property."Fund Code";
                    GenJnline."Custodian Code":=Property."Custodian Code";
                    GenJnline.Validate(GenJnline."Fund Code");
                    GenJnline.Validate(GenJnline."Custodian Code");
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert(true);
                    
                    
                    
                    
                    
                    
                    end
                    else
                    Error('The Property has not been defined');
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'JVS');
                    /*
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'JVS');
                    IF GenJnline.FIND('-') THEN
                    REPEAT
                    GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.MODIFY;
                    UNTIL GenJnline.NEXT=0;
                    */
                    
                    
                    
                    
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnlLine);
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'JVS');
                    if GenJnlLine.Find('-') then
                    exit;
                    //Posted:=TRUE;

                end;
            }
        }
    }

    var
        DivAmt: Decimal;
        FixAssets: Record "Investment Asset";
        "Div Units": Decimal;
        GenJnline: Record "Gen. Journal Line";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Investment History";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        InvestmentPostingGrp: Record "Investment Posting Group";
}

