#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54035 "Equity Revaluations"
{
    PageType = List;
    SourceTable = "Institutional Actions";
    SourceTableView = where(Type = const(Revaluation),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Institution Code"; "Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("Current Market Price"; "Current Market Price")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Price List Import")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                //  RunObject = XMLport UnknownXMLport54002;
            }
            action("Load NSE Institutions")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    Institution.Reset;
                    Institution.SetRange(Institution."Debtor Type", Institution."debtor type"::Equity);
                    Institution.SetRange(Institution.Stock, true);

                    Institution.SetFilter(Institution.Name, '<>%1', '');
                    if Institution.Find('-') then begin

                        repeat

                            InstitutionAction.Reset;
                            InstitutionAction."Institution Code" := Institution."No.";
                            InstitutionAction.Name := Institution.Name;
                            InstitutionAction.Date := Today;
                            InstitutionAction.Type := InstitutionAction.Type::Revaluation;
                            InstitutionAction.Insert(true);

                        until Institution.Next = 0;

                    end;
                end;
            }
            action("Post Revaluation")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    if Confirm('Are you sure you would like to Revalue these Equity Investments?', false) = true then begin

                        // DELETE ANY LINE ITEM THAT MAY BE PRESENT
                        GenJnlLine.Reset;
                        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                        GenJnlLine.DeleteAll;

                        if DefaultBatch.Get('GENERAL', 'JVS') then
                            DefaultBatch.Delete;

                        DefaultBatch.Reset;
                        DefaultBatch."Journal Template Name" := 'GENERAL';
                        DefaultBatch.Name := 'JVS';
                        DefaultBatch.Insert;



                        InstitutionAction.Reset;
                        InstitutionAction.SetRange(InstitutionAction.Type, InstitutionAction.Type::Revaluation);
                        InstitutionAction.SetRange(InstitutionAction.Posted, false);

                        if InstitutionAction.Find('-') then begin
                            repeat
                                Equities.Reset;
                                Equities.SetRange(Equities.Institution, InstitutionAction."Institution Code");
                                if Equities.Find('-') then
                                    repeat

                                        //Load the investment history with the current market value.
                                        InvestmentHistory.Reset;
                                        InvestmentHistory.No := Equities."No.";
                                        InvestmentHistory.Name := Equities.Description;
                                        InvestmentHistory.Date := InstitutionAction.Date;
                                        InvestmentHistory."Current Market Value" := InstitutionAction."Current Market Price";
                                        InvestmentHistory.Validate(InvestmentHistory."Current Market Value");
                                        InvestmentHistory.Posted := true;
                                        InvestmentHistory.Insert(true);


                                        if Property.Get(Equities."No.") then begin

                                            Property.SetRange("Date Filter", 0D, Date);
                                            Property.CalcFields("Current Value", "No.Of Units", Cost, Revaluations);
                                            //MESSAGE('CURRENT VALUE=%1 %2',Property."Current Value",EquityRec.Revaluations);

                                            EquityRec.Copy(Property);
                                            EquityRec.SetRange("Date Filter", 0D, EndYear(Date));
                                            EquityRec.CalcFields(EquityRec.Revaluations);
                                            //MESSAGE('CURRENT VALUE=%1',EquityRec.Revaluations);





                                            //Reverse Previous

                                            GenJnlLine.Init;
                                            GenJnlLine."Journal Template Name" := 'GENERAL';
                                            GenJnlLine."Journal Batch Name" := 'JVS';
                                            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

                                            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                                                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
                                            else
                                                Error('You must specify Investment Posting Group for Property %1', Equities."No.");

                                            GenJnlLine.Validate(GenJnlLine."Account No.");
                                            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
                                            GenJnlLine.Validate(GenJnlLine."Account No.");
                                            GenJnlLine."Posting Date" := Date;
                                            GenJnlLine."Document No." := CopyStr('JV-' + Equities."No." + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                                            //GenJnlLine."External Document No.":="Cheque No";
                                            GenJnlLine.Amount := -(Property.Revaluations - EquityRec.Revaluations);
                                            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                                            GenJnlLine.Validate(GenJnlLine.Amount);
                                            //GenJnlLine.Description:=Property.Description + '' + 'Revaluation Reversal' ;
                                            GenJnlLine.Description := Property.Description;

                                            GenJnlLine."Investment Code" := Equities."No.";
                                            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
                                            //GenJnlLine."No. Of Units":="No. Of Units";
                                            //GenJnlLine."Expected Receipt date":="Schedule Date";


                                            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";

                                            if InvestmentPostingGrp."Capital Reserve Account" <> '' then
                                                GenJnlLine."Bal. Account No." := InvestmentPostingGrp."Capital Reserve Account"
                                            else
                                                GenJnlLine."Bal. Account No." := InvestmentPostingGrp."Revaluation Gain/Loss";


                                            GenJnlLine."Shortcut Dimension 1 Code" := Property."Fund Code";
                                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                                            GenJnlLine."Shortcut Dimension 2 Code" := Property."Custodian Code";
                                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");

                                            if GenJnlLine.Amount <> 0 then
                                                GenJnlLine.Insert(true);


                                            //End the reversal


                                            GenJnlLine.Init;
                                            GenJnlLine."Journal Template Name" := 'GENERAL';
                                            GenJnlLine."Journal Batch Name" := 'JVS';
                                            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

                                            if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                                                GenJnlLine."Account No." := InvestmentPostingGrp."Investment Revaluation Account"
                                            else
                                                Error('You must specify Investment Posting Group for Property %1', Equities."No.");

                                            GenJnlLine.Validate(GenJnlLine."Account No.");
                                            //GenJnlLine."Line No.":=70000;
                                            GenJnlLine."Line No." := GenJnlLine."Line No." + 10000;
                                            GenJnlLine.Validate(GenJnlLine."Account No.");
                                            GenJnlLine."Posting Date" := Date;
                                            GenJnlLine."Document No." := CopyStr('JV-' + Equities."No." + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                                            //GenJnlLine."External Document No.":="Cheque No";
                                            GenJnlLine.Amount := ((Property."No.Of Units" * InstitutionAction."Current Market Price") - Property.Cost) - EquityRec.Revaluations;
                                            //ERROR('Reval=%1 %2',EquityRec.Revaluations,EndYear(Date));
                                            GenJnlLine.Validate(GenJnlLine.Amount);
                                            GenJnlLine.Description := Property.Description;
                                            //GenJnlLine.Description:=Property.Description + '' + 'Revaluation' ;

                                            GenJnlLine."Investment Code" := Equities."No.";
                                            GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Revaluation;
                                            //GenJnlLine."No. Of Units":="No. Of Units";
                                            //GenJnlLine."Expected Receipt date":="Schedule Date";
                                            GenJnlLine."Shortcut Dimension 1 Code" := Property."Fund Code";
                                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");

                                            GenJnlLine."Shortcut Dimension 2 Code" := Property."Custodian Code";
                                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");


                                            GenJnlLine."Bal. Account Type" := GenJnlLine."bal. account type"::"G/L Account";

                                            if InvestmentPostingGrp."Capital Reserve Account" <> '' then
                                                GenJnlLine."Bal. Account No." := InvestmentPostingGrp."Capital Reserve Account"
                                            else
                                                GenJnlLine."Bal. Account No." := InvestmentPostingGrp."Revaluation Gain/Loss";

                                            if GenJnlLine.Amount <> 0 then
                                                GenJnlLine.Insert(true);
                                        end

                                        else
                                            Error('The Property has not been defined');
                                        GenJnlLine.Reset;
                                        GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                                        GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                                        if GenJnlLine.Find('-') then
                                            repeat
                                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                                                GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                                            //GenJnline.MODIFY;

                                            until GenJnlLine.Next = 0;

                                    /*
                                    GenJnlLine.RESET;
                                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'GENERAL');
                                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'JVS');
                                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnlLine);
                                    */
                                    /*
                                    GenJnlLine.RESET;
                                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'GENERAL');
                                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'JVS');
                                    IF GenJnlLine.FIND('-') THEN
                                    EXIT;
                                    Posted:=TRUE;
                                    MODIFY;
                                    */





                                    until Equities.Next = 0;
                                InstitutionAction.Posted := true;
                                InstitutionAction.Modify;

                            until InstitutionAction.Next = 0;

                            GenJnlLine.Reset;
                            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

                        end;
                    end;


                    /*
                    Equities.RESET;
                    Equities.SETRANGE(Equities.Institution,"Institution Code");
                    
                    IF Equities.FIND('-') THEN
                    REPEAT
                    Equities.SETRANGE(Equities."Date Filter",0D,Date);
                    Equities.CALCFIELDS(Equities."No.Of Units");
                    //MESSAGE('%1',Equities."No.");
                    
                    GenJnline.INIT;
                    GenJnline."Journal Template Name":='GENERAL';
                    IF Type=Type::Dividend THEN
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    
                    IF Type=Type::"Share Split" THEN
                    GenJnline."Journal Batch Name":='SPLIT';
                    
                    GenJnline."Line No.":=GenJnline."Line No."+10000;
                    GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                    IF InvestmentPostingGrp.GET(Equities."Investment Posting Group") THEN
                    GenJnline."Account No.":=InvestmentPostingGrp."Dividend Receivable AC"
                    ELSE
                    ERROR('You must specify Investment Posting Group for Equity %1',Equities."No.");
                    
                    GenJnline.VALIDATE(GenJnline."Account No.");
                    GenJnline."Posting Date":=Date;
                    GenJnline."Document No.":=COPYSTR('JV-'+Equities."No."+'-'+FORMAT(GenJnline."Posting Date"),1,20);
                    IF Type=Type::Dividend THEN
                    GenJnline.Amount:=Equities."No.Of Units"*"Amount Per Share";
                    IF Type=Type::"Share Split" THEN
                    GenJnline.Amount:=Equities."No.Of Units"*("New Ratio"/"Old Ratio");
                    GenJnline.VALIDATE(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Receivable' ;
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Dividend;
                    GenJnline."Shortcut Dimension 1 Code":=Equities."Global Dimension 1 Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Global Dimension 2 Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");
                    IF GenJnline.Amount<>0 THEN
                    GenJnline.INSERT(TRUE);
                    
                    GenJnline.INIT;
                    GenJnline."Journal Template Name":='GENERAL';
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                    IF InvestmentPostingGrp.GET(Equities."Investment Posting Group") THEN
                    GenJnline."Account No.":=InvestmentPostingGrp."Dividend Income AC"
                    ELSE
                    ERROR('You must specify Investment Posting Group for Equity %1',Equities."No.");
                    
                    GenJnline.VALIDATE(GenJnline."Account No.");
                    GenJnline."Line No.":=GenJnline."Line No."+10000;
                    GenJnline.VALIDATE(GenJnline."Account No.");
                    GenJnline."Posting Date":=Date;
                    GenJnline."Document No.":=COPYSTR('JV-'+Equities."No."+'-'+FORMAT(GenJnline."Posting Date"),1,20);
                    //GenJnline."External Document No.":="Cheque No";
                    IF Type=Type::Dividend THEN
                    GenJnline.Amount:=-Equities."No.Of Units"*"Amount Per Share";
                    GenJnline.VALIDATE(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Recievable';
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Dividend;
                    GenJnline."Shortcut Dimension 1 Code":=Equities."Global Dimension 1 Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Global Dimension 2 Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");
                    
                    IF GenJnline.Amount<>0 THEN
                    GenJnline.INSERT(TRUE);
                    UNTIL Equities.NEXT=0;
                    
                    
                    
                    
                    
                    
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
                    IF GenJnline.FIND('-') THEN
                    REPEAT
                    GenJnline."Shortcut Dimension 1 Code":=Equities."Global Dimension 1 Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Global Dimension 2 Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");
                    GenJnline.MODIFY;
                    UNTIL GenJnline.NEXT=0;
                    
                    
                    
                    
                    
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);
                    
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
                    IF GenJnline.FIND('-') THEN
                    EXIT;
                    
                    
                    Posted:=TRUE;
                    
                     */

                end;
            }
        }
    }

    var
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        InvestmentHistory: Record "Investment History";
        InstitutionAction: Record "Institutional Actions";
        Institution: Record Customer;
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        EquityRec: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";


    procedure EndYear(var PostDate: Date) EndYearDate: Date
    var
        Year: Integer;
    begin
        Year := Date2dmy(PostDate, 3);
        Year := Year - 1;
        Evaluate(EndYearDate, '3112' + Format(Year));
        //MESSAGE('%1',EndYearDate);
    end;
}

