/// <summary>
/// Page Request Welfare Membership (ID 50095).
/// </summary>
page 50095 "Request Welfare Membership"
{
    Caption = 'Request Welfare Membership';
    PageType = Card;
    SourceTable = "Hr Welfare Header";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Welfare No.";Rec."Welfare No.")
                {
                    Editable = false;
                }
                field("Welfare Type";Rec."Welfare Type")
                {
                    Editable = false;
                }
                field("Raised By";Rec."Raised By")
                {
                }
                field("Raisee Name";Rec."Raisee Name")
                {
                    Editable = false;
                }
                field(Description;Rec.Description)
                {
                }
                field("Global Dimension 1";Rec."Global Dimension 1")
                {
                    Editable = false;
                }
                field("Global Dimension 2";Rec."Global Dimension 2")
                {
                    Editable = false;
                }
                field("Created By";Rec."Created By")
                {
                    Editable = false;
                }
                field("Created On";Rec."Created On")
                {
                    Editable = false;
                }
                field(Status;Rec.Status)
                {
                    Editable = true;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Leave Application")
            {
                Caption = 'Leave Application';
                Image = "Order";
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
                        ApprovalEntries.SetRecordFilters(DATABASE::"Hr Welfare Header",20,Rec."Welfare No.");
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
                        /*IF ApprovalsMgmt.CheckWelfareBenefitApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendBenefitForApproval(Rec);*/
                          MESSAGE('');

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
                        //ApprovalsMgmt.OnCancelBenefitForApproval(Rec);
                          MESSAGE('');
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Welfare Type":=Rec."Welfare Type"::Application;
    end;
}

