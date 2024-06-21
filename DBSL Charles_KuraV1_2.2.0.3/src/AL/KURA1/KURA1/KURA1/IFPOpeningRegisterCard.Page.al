#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75332 "IFP Opening Register Card"
{
    PageType = Card;
    SourceTable = "Bid Opening Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field("IFP Code"; "IFP Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; "Primary Region")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appointed Bid Opening Com"; "Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Bid Opening Date"; "Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Opening Date';
                }
                field("Bid Opening Start Time"; "Bid Opening Start Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Opening Start Time';
                }
                field("Bid Opening Venue"; "Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                    Caption = 'Opening Venue';
                }
                field("Opening Person 1"; "Opening Person 1")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 2"; "Opening Person 2")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 3"; "Opening Person 3")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 4"; "Opening Person 4")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 5"; "Opening Person 5")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Purchaser Code"; "Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                }
                field("Document Status"; "Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control28; "IFP Response Lines")
            {
                SubPageLink = "RFI Document No." = field("IFP Code"),
                              "Document Status" = const(Opened);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup30)
            {
                action("Attendance Register")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Opening Bidder Attendance";
                    RunPageLink = Code = field(Code);
                }
                action("Bid Opening Tender Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Opening  Committee';
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid Opening Tender Committee";
                    RunPageLink = "Document No." = field(Code);
                }
                action("Tender Opening Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Opening Summary';
                    Image = WIPEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Tender Opening Summary Note";
                    RunPageLink = "Register ID" = field(Code);
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Opening Register';
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";
                    Visible = true;

                    trigger OnAction()
                    begin
                        Reset;
                        SetRange(Code, Code);
                        Report.Run(70040, true, true, Rec);
                    end;
                }
                action("Print Minutes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Minutes';
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Reset;
                        SetRange(Code, Code);
                        Report.Run(70100, true, true, Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Procurement.PostIFPOpeningRegister(Rec)
                    end;
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                 //       DMSManagement.UploadTenderopeningregisterDocuments(Cod 'Opening Register', RecordId, d,"Primary Region");
                    end;
                }
                action("Unseal Bid")
                {
                    ApplicationArea = Basic;
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        BidOpeningRegisterLine1: Record "Bid Opening Register Line";
                    begin
                        Procurement.UnsealIFP(Rec, BidOpeningRegisterLine1);
                    end;
                }
                action("Send Bid Opening Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Bid Opening Codes';
                    Image = OpenJournal;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Procurement.FnSendSecretCodeOnIFSBidOpening(Rec)
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                    //    ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                     //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                    //    if ApprovalsMgmt.CheckBidOpeningApprovalPossible(Rec) then
                     //       ApprovalsMgmt.OnSendBidOpeningForApproval(Rec);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                      //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                      //  WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                      //  ApprovalsMgmt.OnCancelBidOpeningApprovalRequest(Rec);
                      //  WorkflowWebhookMgt.FindAndCancel(RecordId);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Technical;
        "Process Type" := "process type"::IFP;
    end;

    var
        Procurement: Codeunit "Procurement Processing";
        Text001: label 'Do you want to post?';
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
}

