#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57088 "Dividend Schedule header"
{
    PageType = Card;
    SourceTable = "Casual Labours";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Imprest Memo No."; "Imprest Memo No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("No. Required"; "No. Required")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Work Type"; "Work Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Days"; "No. of Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Activity; Activity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control11; "Dividend Schedule")
            {
                SubPageLink = "Document No" = field("Imprest Memo No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Post Dividend Income")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    Temp.Get(UserId);
                    //  JTemplate:=Temp."Payment Journal Template";JBatch:=Temp."Payment Journal Batch";
                    if JTemplate = '' then begin
                        Error('Ensure the PV Template is set up in Funds User Setup');
                    end;
                    if JBatch = '' then begin
                        Error('Ensure the PV Batch is set up in the Funds User Setup')
                    end;


                    Institutions.Reset;
                    Institutions.SetRange("Document No", "Imprest Memo No.");
                    if Institutions.Find('-') then begin
                        repeat
                            InvestPost.FnPostDividendIncome(Institutions);
                        until Institutions.Next = 0;
                    end;


                    GenJnline.Reset;
                    GenJnline.SetRange(GenJnline."Journal Template Name", JTemplate);
                    GenJnline.SetRange(GenJnline."Journal Batch Name", JBatch);
                    if GenJnline.Find('-') then begin
                        //REPEAT
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnline);
                        //UNTIL GenJnline.NEXT=0;
                    end;

                    InstitutionalActions.Reset;
                    InstitutionalActions.SetRange("Document No", "Imprest Memo No.");
                    if InstitutionalActions.Find('-') then begin
                        repeat
                            InstitutionalActions.Posted := true;
                            InstitutionalActions.Modify;
                        until InstitutionalActions.Next = 0;
                    end;



                    InstitutionalActions.Reset;
                    InstitutionalActions.SetRange("Document No", "Imprest Memo No.");
                    if InstitutionalActions.Find('-') then begin
                        repeat

                            Equities.Reset;
                            Equities.SetRange(Equities.Institution, InstitutionalActions."Institution Code");
                            if Equities.Find('-') then begin
                                repeat

                                    if DivSchedule.Get(Equities."No.", InstitutionalActions."Books Closure Date") then begin
                                        DivSchedule.Posted := true;
                                        DivSchedule.Modify;
                                    end;
                                until Equities.Next = 0;
                            end;
                        until InstitutionalActions.Next = 0;
                    end;

                    // Amount:=true;
                    Modify;


                    /*
                    IF Posted THEN
                    
                    ERROR('This transaction has already been posted.Please check!!');
                    
                    LineNo:=10000;
                    
                    
                    
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
                    GenJnline.DELETEALL;
                    
                    
                    GenJnline.INIT;
                    GenJnline."Journal Template Name":='GENERAL';
                    //IF Type=Type::Dividend THEN
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    
                    
                    Equities.RESET;
                    Equities.SETRANGE(Equities.Institution,"Institution Code");
                    Equities.SETFILTER(Equities."Asset Type",'%1',Equities."Asset Type"::Equity);
                    IF Equities.FIND('-') THEN BEGIN
                    REPEAT
                    
                    Equities.SETRANGE(Equities."Date Filter",0D,"Books Closure Date");
                    Equities.CALCFIELDS(Equities."No.Of Units");
                    //MESSAGE('%1%2%3',Equities."No.",'=',Equities."No.Of Units");
                     {
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
                    GenJnline.DELETEALL;
                    
                    
                    GenJnline.INIT;
                    GenJnline."Journal Template Name":='GENERAL';
                    //IF Type=Type::Dividend THEN
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    }
                    //IF Type=Type::"Share Split" THEN
                    //GenJnline."Journal Batch Name":='SPLIT';
                    
                    GenJnline."Line No.":=LineNo;
                    GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                    IF InvestmentPostingGrp.GET(Equities."Investment Posting Group") THEN
                    GenJnline."Account No.":=InvestmentPostingGrp."Dividend Receivable AC"
                    ELSE
                    ERROR('You must specify Investment Posting Group for Equity %1',Equities."No.");
                    GenJnline.VALIDATE(GenJnline."Account No.");
                    GenJnline."Posting Date":="Books Closure Date";
                    GenJnline."Document No.":=COPYSTR('JV-'+Equities."No."+'-'+FORMAT(GenJnline."Posting Date"),1,20);
                    GenJnline."Currency Code":=Equities."Currency Code";
                    GenJnline.VALIDATE(GenJnline."Currency Code");
                    
                    IF Type=Type::Dividend THEN
                    GenJnline.Amount:=Equities."No.Of Units"*"Amount Per Share";
                    IF Type=Type::"Share Split" THEN
                    GenJnline.Amount:=Equities."No.Of Units"*("New Ratio"/"Old Ratio");
                    GenJnline.VALIDATE(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Income' ;
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Dividend;
                    {GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");}
                    GenJnline."Books Closure Date":="Books Closure Date";
                    GenJnline."Payment Date":="Payment Date";
                    IF GenJnline.Amount<>0 THEN
                    //MESSAGE('%1%2%3',Equities."No.",'=',Equities."No.Of Units");
                    GenJnline.INSERT(TRUE);
                    
                    
                    LineNo:=LineNo+10000;
                    
                    
                    GenJnline.INIT;
                    GenJnline."Journal Template Name":='GENERAL';
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                    IF InvestmentPostingGrp.GET(Equities."Investment Posting Group") THEN
                    GenJnline."Account No.":=InvestmentPostingGrp."Dividend Income AC"
                    ELSE
                    ERROR('You must specify Investment Posting Group for Equity %1',Equities."No.");
                    
                    GenJnline.VALIDATE(GenJnline."Account No.");
                    GenJnline."Line No.":=LineNo;
                    GenJnline.VALIDATE(GenJnline."Account No.");
                    GenJnline."Posting Date":="Books Closure Date";
                    GenJnline."Document No.":=COPYSTR('JV-'+Equities."No."+'-'+FORMAT(GenJnline."Posting Date"),1,20);
                    //GenJnline."External Document No.":="Cheque No";
                    GenJnline."Currency Code":=Equities."Currency Code";
                    GenJnline.VALIDATE(GenJnline."Currency Code");
                    
                    IF Type=Type::Dividend THEN
                    GenJnline.Amount:=-Equities."No.Of Units"*"Amount Per Share";
                    GenJnline.VALIDATE(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Income';
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Dividend;
                    {GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");}
                    
                    IF GenJnline.Amount<>0 THEN
                    GenJnline.INSERT(TRUE);
                    LineNo:=LineNo+10000;
                    
                    //IF GenJnline.Amount<>0 THEN BEGIN
                    //MESSAGE('%1',LineNo);
                     DivSchedule.INIT;
                     DivSchedule."Investment No.":=Equities."No.";
                     DivSchedule."Books Closure Date":="Books Closure Date";
                     DivSchedule."Transaction Type":='Dividend';
                     DivSchedule."Dividend Rate":="Amount Per Share";
                     DivSchedule.VALIDATE("Dividend Rate");
                    
                     DivSchedule."Payment Date":="Payment Date";
                     IF GenJnline.Amount<>0 THEN
                     DivSchedule.INSERT(TRUE);
                    
                    //END;
                    
                    UNTIL Equities.NEXT=0;
                    
                    END;
                    
                    
                    
                    
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
                    IF GenJnline.FIND('-') THEN
                    REPEAT
                    {GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");
                    GenJnline.MODIFY;}
                    UNTIL GenJnline.NEXT=0;
                    
                    IF CONFIRM('Do you really want to post this transaction')=TRUE THEN BEGIN
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);
                    
                    
                    Posted:=TRUE;
                    MODIFY;
                    
                    
                    Equities.RESET;
                    Equities.SETRANGE(Equities.Institution,"Institution Code");
                    IF Equities.FIND('-') THEN BEGIN
                    REPEAT
                    
                    IF DivSchedule.GET(Equities."No.","Books Closure Date") THEN BEGIN
                    DivSchedule.Posted:=TRUE;
                    DivSchedule.MODIFY;
                    END;
                    UNTIL Equities.NEXT=0;
                    
                    END;
                    
                    
                    END;
                    */

                end;
            }
            action("Post Dividend Payment")
            {
                ApplicationArea = Basic;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    Temp.Get(UserId);
                    // JTemplate:=Temp."Payment Journal Template";JBatch:=Temp."Payment Journal Batch";
                    if JTemplate = '' then begin
                        Error('Ensure the PV Template is set up in Funds User Setup');
                    end;
                    if JBatch = '' then begin
                        Error('Ensure the PV Batch is set up in the Funds User Setup')
                    end;

                    Institutions.Reset;
                    Institutions.SetRange("Document No", "Imprest Memo No.");
                    if Institutions.Find('-') then begin
                        repeat
                        //   InvestPost.FnPostDividendPayment(Institutions);
                        until Institutions.Next = 0;
                    end;


                    GenJnline.Reset;
                    GenJnline.SetRange(GenJnline."Journal Template Name", JTemplate);
                    GenJnline.SetRange(GenJnline."Journal Batch Name", JBatch);
                    if GenJnline.Find('-') then begin
                        //REPEAT
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnline);
                        //UNTIL GenJnline.NEXT=0;
                    end;

                    InstitutionalActions.Reset;
                    InstitutionalActions.SetRange("Document No", "Imprest Memo No.");
                    if InstitutionalActions.Find('-') then begin
                        repeat
                            InstitutionalActions."Payment posted" := true;
                            InstitutionalActions.Modify;
                        until InstitutionalActions.Next = 0;
                    end;

                    InstitutionalActions.Reset;
                    InstitutionalActions.SetRange("Document No", "Imprest Memo No.");
                    if InstitutionalActions.Find('-') then begin
                        repeat
                            Equities.Reset;
                            Equities.SetRange(Equities.Institution, InstitutionalActions."Institution Code");
                            if Equities.Find('-') then begin
                                repeat

                                    if DivSchedule.Get(Equities."No.", InstitutionalActions."Books Closure Date") then begin
                                        DivSchedule."Payment posted" := true;
                                        DivSchedule.Modify;
                                    end;
                                until Equities.Next = 0;
                            end;
                        until InstitutionalActions.Next = 0;
                    end;

                    //  Activity:=true;
                    Modify;

                    /*
                    IF "Payment posted" THEN
                    
                    ERROR('This transaction has already been posted.Please check!!');
                    
                    LineNo:=10000;
                    
                    
                    
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
                    GenJnline.DELETEALL;
                    
                    
                    GenJnline.INIT;
                    GenJnline."Journal Template Name":='GENERAL';
                    //IF Type=Type::Dividend THEN
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    
                    
                    Equities.RESET;
                    Equities.SETRANGE(Equities.Institution,"Institution Code");
                    Equities.SETFILTER(Equities."Asset Type",'%1',Equities."Asset Type"::Equity);
                    
                    IF Equities.FIND('-') THEN BEGIN
                    REPEAT
                    
                    Equities.SETRANGE(Equities."Date Filter",0D,"Books Closure Date");
                    Equities.CALCFIELDS(Equities."No.Of Units");
                    //MESSAGE('%1%2%3',Equities."No.",'=',Equities."No.Of Units");
                     {
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
                    GenJnline.DELETEALL;
                    
                    
                    GenJnline.INIT;
                    GenJnline."Journal Template Name":='GENERAL';
                    //IF Type=Type::Dividend THEN
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    }
                    //IF Type=Type::"Share Split" THEN
                    //GenJnline."Journal Batch Name":='SPLIT';
                    
                    GenJnline."Line No.":=LineNo;
                    GenJnline."Account Type":=GenJnline."Account Type"::"G/L Account";
                    IF InvestmentPostingGrp.GET(Equities."Investment Posting Group") THEN
                    GenJnline."Account No.":=InvestmentPostingGrp."Dividend Receivable AC"
                    ELSE
                    ERROR('You must specify Investment Posting Group for Equity %1',Equities."No.");
                    GenJnline.VALIDATE(GenJnline."Account No.");
                    GenJnline."Posting Date":="Payment Date";
                    GenJnline."Document No.":=COPYSTR('JV-'+Equities."No."+'-'+FORMAT(GenJnline."Posting Date"),1,20);
                    GenJnline."Currency Code":=Equities."Currency Code";
                    GenJnline.VALIDATE(GenJnline."Currency Code");
                    
                    IF Type=Type::Dividend THEN
                    GenJnline.Amount:=-Equities."No.Of Units"*"Amount Per Share";
                    IF Type=Type::"Share Split" THEN
                    GenJnline.Amount:=Equities."No.Of Units"*("New Ratio"/"Old Ratio");
                    GenJnline.VALIDATE(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Payment' ;
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Dividend;
                    {GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");}
                    GenJnline."Books Closure Date":="Books Closure Date";
                    GenJnline."Payment Date":="Payment Date";
                    IF GenJnline.Amount<>0 THEN
                    //MESSAGE('%1%2%3',Equities."No.",'=',Equities."No.Of Units");
                    GenJnline.INSERT(TRUE);
                    
                    
                    LineNo:=LineNo+10000;
                    
                    
                    GenJnline.INIT;
                    GenJnline."Journal Template Name":='GENERAL';
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    GenJnline."Account Type":=GenJnline."Account Type"::"Bank Account";
                    
                    //IF InvestmentPostingGrp.GET(Equities."Investment Posting Group") THEN
                    //GenJnline."Account No.":=InvestmentPostingGrp."Dividend Income AC"
                    //ELSE
                    //ERROR('You must specify Investment Posting Group for Equity %1',Equities."No.");
                    Custodian.GET(Equities."Custodian Code");
                    BankAcc.RESET;
                    BankAcc.SETRANGE(BankAcc."No.",Custodian."Bank Code");
                    IF BankAcc.FINDFIRST THEN
                    GenJnline."Account No.":=BankAcc."No."
                    ELSE
                    ERROR('You must specify the custodian for Equity %1',Equities."No.");
                    
                    
                    GenJnline.VALIDATE(GenJnline."Account No.");
                    GenJnline."Line No.":=LineNo;
                    GenJnline.VALIDATE(GenJnline."Account No.");
                    GenJnline."Posting Date":="Payment Date";
                    GenJnline."Document No.":=COPYSTR('JV-'+Equities."No."+'-'+FORMAT(GenJnline."Posting Date"),1,20);
                    //GenJnline."External Document No.":="Cheque No";
                    GenJnline."Currency Code":=Equities."Currency Code";
                    GenJnline.VALIDATE(GenJnline."Currency Code");
                    
                    IF Type=Type::Dividend THEN
                    GenJnline.Amount:=Equities."No.Of Units"*"Amount Per Share";
                    GenJnline.VALIDATE(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Payment';
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."Investment Transcation Type"::Dividend;
                    {GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");}
                    
                    IF GenJnline.Amount<>0 THEN
                    GenJnline.INSERT(TRUE);
                    LineNo:=LineNo+10000;
                     {
                    //IF GenJnline.Amount<>0 THEN BEGIN
                    //MESSAGE('%1',LineNo);
                     DivSchedule.INIT;
                     DivSchedule."Investment No.":=Equities."No.";
                     DivSchedule."Books Closure Date":="Books Closure Date";
                     DivSchedule."Transaction Type":='Dividend';
                     DivSchedule."Dividend Rate":="Amount Per Share";
                     DivSchedule.VALIDATE("Dividend Rate");
                    
                     DivSchedule."Payment Date":="Payment Date";
                     IF GenJnline.Amount<>0 THEN
                     DivSchedule.INSERT(TRUE);
                    
                    //END;
                     }
                    UNTIL Equities.NEXT=0;
                    
                    END;
                    
                    
                    
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
                    IF GenJnline.FIND('-') THEN
                    REPEAT
                    {GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.VALIDATE(GenJnline."Shortcut Dimension 2 Code");
                    GenJnline.MODIFY;}
                    UNTIL GenJnline.NEXT=0;
                    
                    IF CONFIRM('Do you really want to post this transaction')=TRUE THEN BEGIN
                    
                    CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenJnline);
                      {
                    GenJnline.RESET;
                    GenJnline.SETRANGE(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SETRANGE(GenJnline."Journal Batch Name",'DIVIDEND');
                    IF GenJnline.FIND('-') THEN
                    EXIT;
                     }
                    
                    "Payment posted":=TRUE;
                    MODIFY;
                    
                    
                    Equities.RESET;
                    Equities.SETRANGE(Equities.Institution,"Institution Code");
                    IF Equities.FIND('-') THEN BEGIN
                    REPEAT
                    
                    IF DivSchedule.GET(Equities."No.","Books Closure Date") THEN BEGIN
                    DivSchedule."Payment posted":=TRUE;
                    DivSchedule.MODIFY;
                    END;
                    
                    
                    UNTIL Equities.NEXT=0;
                    
                    END;
                    END;
                    */

                end;
            }
        }
    }

    var
        InvestPost: Codeunit "Investment Management";
        Institutions: Record "Institutional Actions";
        GenJnline: Record "Gen. Journal Line";
        JTemplate: Code[50];
        JBatch: Code[50];
        Temp: Record "Petty Cash Lines1";
        InstitutionalActions: Record "Institutional Actions";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
        LineNo: Integer;
        DivSchedule: Record "Dividend Payment";
        BankAcc: Record "Bank Account";
        Custodian: Record "Custodian Code";
}

