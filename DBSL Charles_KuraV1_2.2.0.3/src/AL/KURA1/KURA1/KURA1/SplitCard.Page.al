#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57080 "Split Card"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Split Header";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control8; "Share Split Lines")
            {
                SubPageLink = "Header No" = field("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Shares")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //  RunObject = XMLport UnknownXMLport54003;
            }
            action("Post Split ")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SplitLines.Reset;
                    SplitLines.SetRange("Header No", "No.");
                    if SplitLines.Find('-') then begin
                        repeat

                            GenJnlLine.Reset;
                            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                            GenJnlLine.DeleteAll;


                            if Property.Get(SplitLines."Investment No") then begin
                                Property.SetRange("Date Filter", 0D, SplitLines."Expected Interest Date");
                                Property.CalcFields("Current Value", "No.Of Units", "Acquisition Cost");
                                GenJnlLine.Init;
                                GenJnlLine."Journal Template Name" := 'GENERAL';
                                GenJnlLine."Journal Batch Name" := 'JVS';
                                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

                                if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                                    GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
                                else
                                    Error('You must specify Investment Posting Group for Property %1', SplitLines."Investment No");

                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                GenJnlLine."Line No." := 10000;
                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                GenJnlLine."Posting Date" := SplitLines."Expected Interest Date";
                                GenJnlLine."Document No." := CopyStr('JV-' + SplitLines."Investment No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                                //GenJnlLine."External Document No.":="Cheque No";
                                GenJnlLine."Currency Code" := Property."Currency Code";
                                GenJnlLine.Validate(GenJnlLine."Currency Code");
                                if GenJnlLine."Currency Code" = '' then
                                    GenJnlLine.Amount := -Property."Acquisition Cost"
                                else
                                    GenJnlLine.Amount := -Property."Acquisition Cost (FCY)";
                                GenJnlLine.Validate(GenJnlLine.Amount);
                                GenJnlLine.Description := Property.Description + ' ' + 'Share Split';
                                GenJnlLine."Investment Code" := SplitLines."Investment No";
                                GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::"Share-split";
                                GenJnlLine."No. Of Units" := Property."No.Of Units";
                                //GenJnlLine."Expected Receipt date":="Schedule Date";
                                /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
                                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                                GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
                                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                                GenJnline."Fund Code" := Property."Fund Code";
                                GenJnline."Custodian Code" := Property."Custodian Code";
                                GenJnline.Validate(GenJnline."Fund Code");
                                GenJnline.Validate(GenJnline."Custodian Code");


                                if GenJnlLine.Amount <> 0 then
                                    GenJnlLine.Insert;

                                GenJnlLine.Init;
                                GenJnlLine."Journal Template Name" := 'GENERAL';
                                GenJnlLine."Journal Batch Name" := 'JVS';
                                GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

                                if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                                    GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
                                else
                                    Error('You must specify Investment Posting Group for Property %1', SplitLines."Investment No");

                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                GenJnlLine."Line No." := 20000;
                                GenJnlLine.Validate(GenJnlLine."Account No.");
                                GenJnlLine."Posting Date" := SplitLines."Expected Interest Date";
                                GenJnlLine."Document No." := CopyStr('JV-' + SplitLines."Investment No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                                //GenJnlLine."External Document No.":="Cheque No";

                                GenJnlLine."Currency Code" := Property."Currency Code";
                                GenJnlLine.Validate(GenJnlLine."Currency Code");
                                if GenJnlLine."Currency Code" = '' then
                                    GenJnlLine.Amount := Property."Acquisition Cost"
                                else
                                    GenJnlLine.Amount := -Property."Acquisition Cost (FCY)";

                                GenJnlLine.Validate(GenJnlLine.Amount);
                                GenJnlLine.Description := Property.Description + ' ' + 'Share Split';
                                GenJnlLine."Investment Code" := SplitLines."Investment No";
                                GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::"Share-split";
                                GenJnlLine."No. Of Units" := SplitLines."New No. of Units";
                                //GenJnlLine."Expected Receipt date":="Schedule Date";
                                /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
                                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                                GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
                                GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                                GenJnline."Fund Code" := Property."Fund Code";
                                GenJnline."Custodian Code" := Property."Custodian Code";
                                GenJnline.Validate(GenJnline."Fund Code");
                                GenJnline.Validate(GenJnline."Custodian Code");

                                if GenJnlLine.Amount <> 0 then
                                    GenJnlLine.Insert;






                            end
                            else
                                Error('The Property has not been defined');
                            GenJnlLine.Reset;
                            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');

                            GenJnlLine.Reset;
                            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                            if GenJnline.Find('-') then
                                repeat
                                    /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
                                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
                                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                                    GenJnlLine.MODIFY;*/

                                    GenJnline."Fund Code" := Property."Fund Code";
                                    GenJnline."Custodian Code" := Property."Custodian Code";
                                    GenJnline.Validate(GenJnline."Fund Code");
                                    GenJnline.Validate(GenJnline."Custodian Code");
                                until GenJnline.Next = 0;


                            Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

                            GenJnlLine.Reset;
                            GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                            GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                            if GenJnlLine.Find('-') then
                                exit;
                            Posted := true;


                        until SplitLines.Next = 0;
                    end;

                end;
            }
        }
    }

    var
        SplitHeader: Record "Split Header";
        SplitLines: Record "Split Lines";
        GenJnline: Record "Gen. Journal Line";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Receipts and Payment Types";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        InvestmentPostingGrp: Record "Investment Posting Group";
}

