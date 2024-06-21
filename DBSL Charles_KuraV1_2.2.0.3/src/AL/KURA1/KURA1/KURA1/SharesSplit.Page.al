#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 54010 "Shares Split"
{
    PageType = List;
    SourceTable = "Expected Interest1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Expected Split Date";"Expected Interest Date")
                {
                    ApplicationArea = Basic;
                }
                field("Old Ratio";"Old Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("New Ratio";"New Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("New No. of Units";"New No. of Units")
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
            action("Post Split")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'JVS');
                    GenJnlLine.DeleteAll;
                    
                    
                    if Property.Get("Investment No") then
                    begin
                    Property.SetRange("Date Filter",0D,"Expected Interest Date");
                    Property.CalcFields("Current Value","No.Of Units","Acquisition Cost");
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='GENERAL';
                    GenJnlLine."Journal Batch Name":='JVS';
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";
                    
                    if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                    GenJnlLine."Account No.":=InvestmentPostingGrp."Investment Cost Account"
                    else
                    Error('You must specify Investment Posting Group for Property %1',"Investment No");
                    
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=10000;
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":="Expected Interest Date";
                    GenJnlLine."Document No.":=CopyStr('JV-'+"Investment No"+'-'+Format(GenJnlLine."Posting Date"),1,20);
                    //GenJnlLine."External Document No.":="Cheque No";
                    GenJnlLine."Currency Code":=Property."Currency Code";
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    if GenJnlLine."Currency Code"='' then
                    GenJnlLine.Amount:=-Property."Acquisition Cost"
                    else
                    GenJnlLine.Amount:=-Property."Acquisition Cost (FCY)";
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description:=Property.Description + ' ' + 'Share Split' ;
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::"Share-split";
                    GenJnlLine."No. Of Units":=Property."No.Of Units";
                    //GenJnlLine."Expected Receipt date":="Schedule Date";
                    /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    
                    GenJnline."Fund Code":=Property."Fund Code";
                    GenJnline."Custodian Code":=Property."Custodian Code";
                    GenJnline.Validate(GenJnline."Fund Code");
                    GenJnline.Validate(GenJnline."Custodian Code");
                    
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name":='GENERAL';
                    GenJnlLine."Journal Batch Name":='JVS';
                    GenJnlLine."Account Type":=GenJnlLine."account type"::"G/L Account";
                    
                    if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                    GenJnlLine."Account No.":=InvestmentPostingGrp."Investment Cost Account"
                    else
                    Error('You must specify Investment Posting Group for Property %1',"Investment No");
                    
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Line No.":=20000;
                    GenJnlLine.Validate(GenJnlLine."Account No.");
                    GenJnlLine."Posting Date":="Expected Interest Date";
                    GenJnlLine."Document No.":=CopyStr('JV-'+"Investment No"+'-'+Format(GenJnlLine."Posting Date"),1,20);
                    //GenJnlLine."External Document No.":="Cheque No";
                    
                    GenJnlLine."Currency Code":=Property."Currency Code";
                    GenJnlLine.Validate(GenJnlLine."Currency Code");
                    if GenJnlLine."Currency Code"='' then
                    GenJnlLine.Amount:=Property."Acquisition Cost"
                    else
                    GenJnlLine.Amount:=-Property."Acquisition Cost (FCY)";
                    
                    GenJnlLine.Validate(GenJnlLine.Amount);
                    GenJnlLine.Description:=Property.Description + ' ' + 'Share Split' ;
                    GenJnlLine."Investment Code":="Investment No";
                    GenJnlLine."Investment Transcation Type":=GenJnlLine."investment transcation type"::"Share-split";
                    GenJnlLine."No. Of Units":="New No. of Units";
                    //GenJnlLine."Expected Receipt date":="Schedule Date";
                    /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/
                    
                    GenJnline."Fund Code":=Property."Fund Code";
                    GenJnline."Custodian Code":=Property."Custodian Code";
                    GenJnline.Validate(GenJnline."Fund Code");
                    GenJnline.Validate(GenJnline."Custodian Code");
                    
                    if GenJnlLine.Amount<>0 then
                    GenJnlLine.Insert;
                    
                    
                    
                    
                    
                    
                    end
                    else
                    Error('The Property has not been defined');
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'JVS');
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'JVS');
                    if GenJnline.Find('-') then
                    repeat
                    /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.MODIFY;*/
                    
                    GenJnline."Fund Code":=Property."Fund Code";
                    GenJnline."Custodian Code":=Property."Custodian Code";
                    GenJnline.Validate(GenJnline."Fund Code");
                    GenJnline.Validate(GenJnline."Custodian Code");
                    until GenJnline.Next=0;
                    
                    
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnlLine);
                    
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name",'JVS');
                    if GenJnlLine.Find('-') then
                    exit;
                    Posted:=true;

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type:=Type::"Share Split";
    end;

    var
        GenJnline: Record "Gen. Journal Line";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Receipts and Payment Types";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        InvestmentPostingGrp: Record "Investment Posting Group";
}

