#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54038 "New Schedule"
{
    PageType = List;
    SourceTable = "Institutional Actions";
    SourceTableView = where(Posted=const(false),
                            Type=filter(Dividend|"Share Split"|Bonus));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Institution Code";"Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Date";"Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Books Closure Date";"Books Closure Date")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Per Share";"Amount Per Share")
                {
                    ApplicationArea = Basic;
                }
                field("New Ratio";"New Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("Old Ratio";"Old Ratio")
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
        area(creation)
        {
            action(post)
            {
                ApplicationArea = Basic;
                Image = post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    Equities.Reset;
                    Equities.SetRange(Equities.Institution,"Institution Code");
                    if Equities.Find('-') then
                    repeat
                    Equities.SetRange(Equities."Date Filter",0D,Date);
                    Equities.CalcFields(Equities."No.Of Units");
                    //MESSAGE('%1',Equities."No.");

                    GenJnline.Reset;
                    GenJnline.SetRange(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SetRange(GenJnline."Journal Batch Name",'DIVIDEND');
                    GenJnline.DeleteAll;


                    GenJnline.Init;
                    GenJnline."Journal Template Name":='GENERAL';
                    if Type=Type::Dividend then
                    GenJnline."Journal Batch Name":='DIVIDEND';

                    if Type=Type::"Share Split" then
                    GenJnline."Journal Batch Name":='SPLIT';

                    GenJnline."Line No.":=GenJnline."Line No."+10000;
                    GenJnline."Account Type":=GenJnline."account type"::"G/L Account";
                    if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                    GenJnline."Account No.":=InvestmentPostingGrp."Dividend Receivable AC"
                    else
                    Error('You must specify Investment Posting Group for Equity %1',Equities."No.");
                    GenJnline.Validate(GenJnline."Account No.");
                    GenJnline."Posting Date":=Date;
                    GenJnline."Document No.":=CopyStr('JV-'+Equities."No."+'-'+Format(GenJnline."Posting Date"),1,20);
                    if Type=Type::Dividend then
                    GenJnline.Amount:=Equities."No.Of Units"*"Amount Per Share";
                    if Type=Type::"Share Split" then
                    GenJnline.Amount:=Equities."No.Of Units"*("New Ratio"/"Old Ratio");
                    GenJnline.Validate(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Receivable' ;
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."investment transcation type"::Dividend;
                    GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 2 Code");
                    GenJnline."Books Closure Date":="Books Closure Date";
                    GenJnline."Payment Date":="Payment Date";
                    if GenJnline.Amount<>0 then
                    GenJnline.Insert(true);

                    GenJnline.Init;
                    GenJnline."Journal Template Name":='GENERAL';
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    GenJnline."Account Type":=GenJnline."account type"::"G/L Account";
                    if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                    GenJnline."Account No.":=InvestmentPostingGrp."Dividend Income AC"
                    else
                    Error('You must specify Investment Posting Group for Equity %1',Equities."No.");

                    GenJnline.Validate(GenJnline."Account No.");
                    GenJnline."Line No.":=GenJnline."Line No."+10000;
                    GenJnline.Validate(GenJnline."Account No.");
                    GenJnline."Posting Date":=Date;
                    GenJnline."Document No.":=CopyStr('JV-'+Equities."No."+'-'+Format(GenJnline."Posting Date"),1,20);
                    //GenJnline."External Document No.":="Cheque No";
                    if Type=Type::Dividend then
                    GenJnline.Amount:=-Equities."No.Of Units"*"Amount Per Share";
                    GenJnline.Validate(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Recievable';
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."investment transcation type"::Dividend;
                    GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 2 Code");

                    if GenJnline.Amount<>0 then
                    GenJnline.Insert(true);
                    until Equities.Next=0;






                    GenJnline.Reset;
                    GenJnline.SetRange(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SetRange(GenJnline."Journal Batch Name",'DIVIDEND');
                    if GenJnline.Find('-') then
                    repeat
                    GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 2 Code");
                    GenJnline.Modify;
                    until GenJnline.Next=0;





                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnline);

                    GenJnline.Reset;
                    GenJnline.SetRange(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SetRange(GenJnline."Journal Batch Name",'DIVIDEND');
                    if GenJnline.Find('-') then
                    exit;
                    Posted:=true;
                end;
            }
        }
    }

    var
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
}

