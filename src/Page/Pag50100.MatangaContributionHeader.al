/// <summary>
/// Page Matanga Contribution Header (ID 50100).
/// </summary>
page 50100 "Matanga Contribution Header"
{
    Caption = 'Matanga Contribution Header';
    PageType = Card;
    SourceTable = "Hr Welfare Header";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Welfare No."; Rec."Welfare No.")
                {
                }
                field("Welfare Type"; Rec."Welfare Type")
                {
                    Editable = false;
                }
                field("Raised By"; Rec."Raised By")
                {
                }
                field("Raisee Name"; Rec."Raisee Name")
                {
                    Editable = false;
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                }
                field("Welfare Category"; Rec."Welfare Category")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Created On"; Rec."Created On")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
            part("Welfare Lines"; "Welfare Lines")
            {
                SubPageLink = "Welfare Header No." = FIELD("Welfare No.");
            }
        }
        area(factboxes)
        {
            systempart(Outlook; Outlook)
            {
            }
            systempart(Notes; Notes)
            {
            }
            systempart(MyNotes; MyNotes)
            {
            }
            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Contributions")
            {
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    // SETRANGE("Welfare No.", "Welfare No.");
                    // WelfareImport.GetVariables(Rec);
                    // WelfareImport.RUN();
                end;
            }
            action(Dimensions)
            {
                Caption = 'Dimensions';
                Image = Dimensions;
                Promoted = true;
                PromotedIsBig = true;
                ShortCutKey = 'Shift+Ctrl+D';
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page 658;
                begin
                    ApprovalEntries.SetRecordFilters(DATABASE::"Purchase Header", 14, Rec."Welfare No.");
                    ApprovalEntries.RUN;
                end;
            }
            action("Co&mments")
            {
                Caption = 'Co&mments';
                Image = ViewComments;
                RunObject = Page 66;
            }
        }
        area(Processing)
        {
            group("&Release")
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                // separator()
                // {
                // }
                action(Release)
                {
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit 415;
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit 415;
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                // separator()
                // {
                // }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        /*IF ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                          */

                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit 1535;
                    begin
                        //ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Welfare Report")
            {
                Caption = 'Welfare Report';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                // RunObject = Report 69026;

                trigger OnAction()
                begin
                    // Rec.SETRANGE("Welfare No.", Rec."Welfare No.");
                    // REPORT.RUN(69026, TRUE, TRUE, Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Welfare Type" := Rec."Welfare Type"::Contribution;
    end;

    var
        // WelfareImport: XMLport "69001";
}

