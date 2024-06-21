#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75262 "Bid Opening Register Card"
{
    PageType = Card;
    SourceTable = "Bid Opening Register";
    PromotedActionCategories = 'New,Process,Report,Attendance,Termination,Codes,Opening Committee,Approvals,Request Approval,Print/Send,Estimates,Evaluation Matrix';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed Bid Opening Com"; Rec."Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Opening Committee Code';
                    Editable = true;
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening Start Time"; Rec."Bid Opening Start Time")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Bid Opening End Date"; Rec."Bid Opening End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Opening End Time"; Rec."Bid Opening End Time")
                {
                    ApplicationArea = Basic;
                   // Editable = false;
                }
                field("Bid Opening Venue"; Rec."Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 1"; Rec."Opening Person 1")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 2"; Rec."Opening Person 2")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 3"; Rec."Opening Person 3")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 4"; Rec."Opening Person 4")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Person 5"; Rec."Opening Person 5")
                {
                    ApplicationArea = Basic;
                }
                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Intention To Bid Vendor"; Rec."No. of Intention To Bid Vendor")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submitted Bids"; Rec."No. of Submitted Bids")
                {
                    ApplicationArea = Basic;
                }
                field("Total Engineer Estimates"; Rec."Total Engineer Estimates")
                {
                    ApplicationArea = Basic;
                }
                field("Required Bid Security Amount"; Rec."Required Bid Security Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control28; "Bid Opening Register Line")
            {
                SubPageLink = Code = field(Code);
            }
            group("Termination Details")
            {
                Caption = 'Termination Details';
                field("Tender Cancellation Reason"; Rec."Tender Cancellation Reason")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Terminated By"; Rec."Terminated By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Terminated"; Rec."Date Terminated")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(70173);
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
                    RunPageLink = Code = field(upperlimit(Code)),
                                  "IFS Code" = field("IFS Code");
                }
                action("Bid Opening Tender Committee")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Bid Opening Tender Committee";
                    RunPageLink = "Document No." = field(Code);
                }
                action("Tender Opening Summary")
                {
                    ApplicationArea = Basic;
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
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
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
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70100, true, true, Rec);
                        FileDirectoryX := 'C:\SCM\Tender\';
                        // //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileNameX := rec."IFS Code" + 'Opening.pdf';
                        IF FILE.EXISTS(FileDirectoryX + FileNameX) THEN
                            FILE.ERASE(FileDirectoryX + FileNameX);//51217
                        //MERGE PDF
                        FileDirectory := 'C:\SCM\Tender\';
                        //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileName := rec."IFS Code" + 'Opening.pdf';
                        REPORT.SAVEASPDF(70100, FileDirectory + FileName, Rec);
                    end;
                }
                action("Print Opening Summary")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Opening Summary';
                    Image = PrintAttachment;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        // MergeFiles.fnCreateFolder("IFS Code");
                        REC.Reset;
                        rec.SetRange(Code, REC.Code);
                        Report.Run(70121, true, true, Rec);
                        FileDirectoryX := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                        //     // //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileNameX := rec."IFS Code" + '_2_Opening.pdf';
                        if FILE.Exists(FileDirectoryX + FileNameX) then
                            FILE.Erase(FileDirectoryX + FileNameX);//51217
                                                                   //     //MERGE PDF
                        FileDirectory := 'C:\SCM\Tender\' + rec."IFS Code" + '\';
                        //     //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileName := rec."IFS Code" + '_2_Opening.pdf';
                        Report.SaveAsPdf(70121, FileDirectory + FileName, Rec);
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
                        Procurement.PostBidOpeningRegister(Rec)
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
                        //DMSManagement.UploadTenderopeningregisterDocuments(Code,'Tender Opening Register',RECORDID,"Primary Region");
                        DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::IFS, Rec.Code, 'Tender Opening', Rec.RecordId, 'R48');
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
                        Procurement.UnsealBid(Rec, BidOpeningRegisterLine1);
                    end;
                }
                action("Send Bid Opening Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Bid Opening Codes';
                    Image = SendToMultiple;
                    Promoted = true;
                    PromotedCategory = Category6;

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
                     ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Initiate Tender Termination")
                {
                    ApplicationArea = Basic;
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure to Terminate the Tender Process ?') = true then begin
                            Procurement.FnPostOpeningTermination(Rec);
                            Message('Process Initiated Successfully, Check on the generated Opinion');
                        end;
                    end;
                }
                action("Engineer Estimates")
                {
                    ApplicationArea = Basic;
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Category11;
                    RunObject = Page "IFS Engineer Estimates";
                    RunPageLink = "Job No." = field("Job No");
                }
                action("Generate Evaluation Matrix")
                {
                    ApplicationArea = Basic;
                    Image = GetEntries;
                    Promoted = true;
                    PromotedCategory = Category12;
                    PromotedIsBig = true;
                    

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange("IFS Code", Rec."IFS Code");
                        Report.Run(70119, true, true, Rec);
                    end;
                }
                action("Import Attendance Register")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Attendance Register';
                    Image = Register;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Config. Package Card";
                    RunPageLink = Code = filter('OPENING');
                    Visible = true;

                    trigger OnAction()
                    begin
                        //DMSManagement.UploadTenderopeningregisterDocuments(Code,'Tender Opening Register',RECORDID,"Primary Region");
                        //DMSManagement.UploadStaffClaimDocuments(DMSDocuments."Document Type"::IFS,Rec.Code,'Tender Opening',RECORDID,'R48');
                    end;
                }
                action("Import Attendance Reg DataPort")
                {
                    ApplicationArea = Basic;
                    Caption = 'Import Attendance Register Uisng DataPort';
                    Image = Register;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    RunObject = Page "Config. Package Card";
                    RunPageLink = Code = filter('OPENING');
                    ToolTip = 'Import Attendance Register Uisng DataPort';
                    Visible = true;

                    trigger OnAction()
                    begin
                        //DMSManagement.UploadTenderopeningregisterDocuments(Code,'Tender Opening Register',RECORDID,"Primary Region");
                        //DMSManagement.UploadStaffClaimDocuments(DMSDocuments."Document Type"::IFS,Rec.Code,'Tender Opening',RECORDID,'R48');
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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                     VarVariant: Variant;
                    begin
                      VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);

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
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                     VarVariant: Variant;
                    begin
                       VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Technical
    end;
    trigger OnOpenPage()
    begin
        SetControlAppearance();
    end;
    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    End;
    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    var
        Procurement: Codeunit "Procurement Processing";
        Text001: label 'Do you want to post?';
         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName: Text;
        FileDirectory: Text;
        MergeFiles: Codeunit MergeCurriculum;
           local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
        CurrPage.Editable(false);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}

#pragma implicitwith restore

