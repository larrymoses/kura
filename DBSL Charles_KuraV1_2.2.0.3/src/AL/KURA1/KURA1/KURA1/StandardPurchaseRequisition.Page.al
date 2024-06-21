#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// Page Standard Purchase Requisition (ID 75237).
/// </summary>
#pragma implicitwith disable
Page 75237 "Standard Purchase Requisition"
{
    Caption = 'Standard Purchase Requisition';
    DeleteAllowed = false;
    Editable = true;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release,Navigate,Create LPO';
    // SourceTableView = where("Document Type" = filter("Purchase Requisition"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PRN Type"; Rec."PRN Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Template ID"; Rec."Requisition Template ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    // Editable = not OpenApprovalEntriesExist;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Priority Level"; Rec."Priority Level")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    visible = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Directorate Name"; Rec."Directorate Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department/Center Code';
                    Editable = true;
                }
                field("Department Name"; Rec."Department Name2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
                    Editable = false;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    visible = false;
                }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Assigned Procument Officer"; Rec."Assigded Procument Officer")
                {
                    ApplicationArea = basic;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'Project ID';
                    ShowMandatory = true;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("PP Planning Category"; Rec."PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("PP Funding Source ID"; Rec."PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Budget"; Rec."PP Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Actual Costs"; Rec."PP Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PP Total Commitments"; Rec."PP Total Commitments")
                {
                    ApplicationArea = Basic;
                }
                field("PP Total Available Budget"; Rec."PP Total Available Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Total PRN Amount"; Rec."Total PRN Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total PRN Amount (LCY)"; Rec."Total PRN Amount (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("PP Solicitation Type"; Rec."PP Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("PP Procurement Method"; Rec."PP Procurement Method")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("PP Preference/Reservation Code"; Rec."PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("PP  Invitation Notice Type"; Rec."PP  Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = All;
                    visible = false;
                }
                field("PRN Conversion Procedure"; Rec."PRN Conversion Procedure")
                {
                    ApplicationArea = Basic;
                }
                field("Ordered PRN"; Rec."Ordered PRN")
                {
                    ApplicationArea = Basic;
                }
                field("Linked IFS No."; Rec."Linked IFS No.")
                {
                    ApplicationArea = Basic;
                }
                field("Linked LPO No."; Rec."Linked LPO No.")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false
;
                    Visible = true;
                }
            }
            part(PurchLines; "Purchase Requisition Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(factboxes)
        {
            part(Control1903326807; "Item Replenishment FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "No." = field("No.");
                Visible = false;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                                          "Document Type" = field("Document Type"),
                                          "Document No." = field("No.");
                Visible = false;
            }
            part(Control3; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                                          "No." = field("No.");//,
                                                               //  "Line No." = field("Line No.");
                visible = false;
                //TO SEE DOCUMENTS ON APPROVAL

            }
            part("Attached Documents1"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(38), "Document Type" = field("Document Type"),
                "No." = FIELD("No.");

            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Purchase Requisition")
            {
                Caption = 'Purchase Requisition';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."No." <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
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
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                              "No." = field("No."),
                                              "Document Line No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //   DMSManagement.UploadStandardPRNDocuments("No.",'Standard Purchase Requisition',RecordId,"Shortcut Dimension 1 Code");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    visible = false;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup21)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //check Budget Control
                        ProcSetup.Get;
                        if ProcSetup."Enforce Strict Proc Budget che" = true then begin
                            if Rec."Total PRN Amount (LCY)" >= Rec."PP Total Available Budget" then
                                Error('There is no enough Budget for No %1 Line No %2 Budget Available %3', Rec."Procurement Plan ID", Rec."Procurement Plan Entry No", Rec."PP Total Available Budget");
                        end;
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal;
                        Clear(CopyPurchDoc);
                        if Rec.Get(Rec."Document Type", Rec."No.") then;
                    end;
                }
                action("Suggest Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Lines From Requisition Template';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = SuggestCapacity;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin

                        Procurement.SuggestLinesFromRequisitionTemplate(Rec);
                    end;
                }
                action("Notify Procurement Officer")
                {
                    ApplicationArea = Basic;
                    Image = Apply;
                    caption = 'Notify Procurement Officer';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    visible = true;

                    trigger OnAction()
                    var
                        Mail: codeunit eMail;
                        EmailMsg: codeunit "Email Message";
                        oustream: outstream;
                        recref: recordref;
                        tempblob: codeunit "Temp Blob";
                        istream: InStream;
                        EmailScenario: enum "Email Scenario";
                        email: text;
                        req1: record 38;
                        SalespersonPurch: Record "Salesperson/Purchaser";
                        Body: Code[150];

                    begin
                        SalespersonPurch.Reset;
                        SalespersonPurch.SetRange(Code, Rec."Assigded Procument Officer");
                        if SalespersonPurch.FindSet then begin
                            //message('%1', SalespersonPurch."E-mail");
                            email := SalespersonPurch."E-Mail";
                        end;
                        Usersetup.RESET;
                        Body := 'You have been assigned a purchase requisition number' + ' ' + Rec."No." + ' ' + ',Kindly login to the ERP and facilitate.';
                        EmailMsg.Create(email, 'Purchase Requisition ' + 'No: ' + Rec."No." + ' ' + rec."Description", '', true);

                        EmailMsg.AppendToBody(Body + '<BR><BR>Kind Regards,' + '<BR><BR>Supply Chain Department.<BR>' + '<BR>');
                        // req1.reset;
                        // req1.setrange("No.", req1."No.");
                        // if req.find('_') then begin



                        //     recref.GetTable(rec);
                        //     tempblob.CreateOutStream(oustream);

                        //     report.saveas(Report::"Purchase Requisition", '', ReportFormat::pdf, oustream, recref);
                        //     tempblob.CreateInStream(istream);
                        //     EmailMsg.addattachment(req."No." + '.pdf', '', istream);
                        // end;

                        mail.Send(emailmsg, EmailScenario::"Sales Invoice");
                        Message('%1', 'Notified Successfully!', mail);
                    end;
                }
                action("Create LPO/LSO")
                {
                    ApplicationArea = Basic;
                    Enabled = TRUE;
                    Image = PrintCover;
                    Promoted = true;
                    PromotedCategory = Category8;
                    Visible = TRUE;   //  Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        //   Rec.TestField("Awarded Bidder No");
                        //  Rec.TestField("Awarded Quote No");
                        Procurement.FnGenerateLPODirect2(Rec);
                        rec."Ordered PRN" := true;
                    end;
                }
                action("Create Request For Invitation")
                {
                    ApplicationArea = Basic;
                    Image = CreateForm;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        Procurement.CreateInvitationNotice(Rec);
                        rec."Ordered PRN" := true;
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = process;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        prnlines: record "Purchase Line";
                    begin
                        //VarVariant := Rec;
                        //cc//18072023
                        //  IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        //    CustomApprovals.OnSendDocForApproval(VarVariant);
                        Rec.TestField("Shortcut Dimension 1 Code");
                        //TESTFIELD("Shortcut Dimension 2 Code");
                        Rec.TestField(Description);
                        rec.TestField("PP Solicitation Type");
                        rec.TestField("PP Procurement Method");
                        rec.TestField("PP Preference/Reservation Code");
                        rec.CalcFields("Total PRN Amount (LCY)");
                        if Rec."PP Total Available Budget" < rec."Total PRN Amount (LCY)" then
                            Error('The total requisitioned amount exceeds the available budget.');
                        //TESTFIELD("Requisition Amount");
                        //checklines
                        prnlines.Reset();
                        prnlines.SetRange("Document No.", rec."No.");
                        if prnlines.findset then begin
                            prnlines.testfield("Gen. Bus. Posting Group");
                            prnlines.testfield("Unit of Measure");
                            prnlines.testfield("Location Code");

                            prnlines.testfield("Gen. Prod. Posting Group");
                        end;
                        //check Budget Control
                        ProcSetup.Get;
                        if ProcSetup."Enforce Strict Proc Budget che" = true then begin
                            Rec.CalcFields("Total PRN Amount", "Total PRN Amount (LCY)");
                            if Rec."Total PRN Amount (LCY)" >= (Rec."PP Total Available Budget" - Rec."PP Total Commitments") then
                                Error('There is no enough Budget for No %1 Line No %2 Budget Available %3', Rec."Procurement Plan ID", Rec."Procurement Plan Entry No", (Rec."PP Total Available Budget" - Rec."PP Total Commitments"));
                        end;
                        if confirm('Kindly Ensure you have Attached Reguired documentation to proceed. Continue?', false) = true then begin

                            if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                                ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                            //Procurement.FnPRNCommittment(Rec);
                        end;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        VarVariant: Variant;
                        RecRef: RecordRef;
                        CustomApprovalEntry: Record "Approval Entry";
                        OldStatus: Option;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        TXT0002: label 'An approval request has been cancelled.';
                    begin
                        // VarVariant := Rec;
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        // if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //cc//cc// ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        //cc//cc// WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                        //Procurement.FnUncommitPRN(Rec);
                        //
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                //   OldStatus :=ApprovalEntry.Status;
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                                CustomApprovalEntry.Modify(true);
                            until CustomApprovalEntry.Next = 0;

                        //Notify The User
                        // EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                        Rec.Status := Rec.Status::Open;
                        Rec."Cancelled?" := true;
                        Rec.Modify(true);
                        Message(TXT0002);
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin

                        /*BCSetup.GET;
                        IF NOT BCSetup.Mandatory THEN
                           EXIT;*/

                        /*F NOT CheckforRequiredFields THEN
                           ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');*/

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        /*IF SomeLinesCommitted THEN BEGIN
                           IF NOT CONFIRM( 'Some or All the Lines Are already Committed do you want to continue',TRUE, "Document Type") THEN
                                ERROR('Budget Availability Check and Commitment Aborted');
                          DeleteCommitment.RESET;
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
                          DeleteCommitment.DELETEALL;
                        END;*/
                        Commitment.CheckLPOCommittment(Rec);

                        //MESSAGE('Commitments done Successfully for Doc. No %1',"No.");

                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        DeleteCommitment.Reset;
                        DeleteCommitment.SetRange(DeleteCommitment."Commitment Type", DeleteCommitment."commitment type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DeleteAll;
                        //Tag all the Purchase Line entries as Uncommitted
                        /*PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
                        PurchLine.SETRANGE(PurchLine."Document No.","No.");
                        IF PurchLine.FIND('-') THEN BEGIN
                           REPEAT
                              PurchLine.Committed:=FALSE;
                              PurchLine.MODIFY;
                           UNTIL PurchLine.NEXT=0;
                        END;*/

                        Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");

                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        /*IF Status<>Status::Released THEN
                        ERROR(Text001);
                        IF Status=Status::Released THEN BEGIN
                        DocPrint.PrintPurchHeader(Rec);
                          END;*/
                        IF REC.Status = REC.STATUS::Released THEN begin
                            Rec.SetRange("No.", Rec."No.");
                            Report.Run(50097, true, true, Rec);
                        end else
                            ERROR('Document Must Be Fully Approved!');
                    end;
                }

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        SetControlAppearance;

        Rec."Document Type" := Rec."document type"::"Purchase Requisition";

        if (Rec.Status = Rec.Status::"Pending Approval") then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        usersetup: Record "User Setup";
        PurchSetup: Record "Procurement Setup";
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        rec."Requester ID" := UserId;

        if usersetup.get(UserId) then
            rec.Region := usersetup."Region Code";
        rec."Request-By No." := usersetup."Employee No.";
        rec."Request-By Name" := usersetup."Employee Name";
        

        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;

        PurchSetup.get;
        PurchSetup.testfield("Effective Procurement Plan");
        rec."Procurement Plan ID" := PurchSetup."Effective Procurement Plan";
        rec."Requester ID" := UserId;

        if usersetup.get(UserId) then begin
            rec.Region := usersetup."Region Code";
            Rec."Shortcut Dimension 1 Code" := UserSetup."Region Code";
            rec."Request-By No." := usersetup."Employee No.";
            rec."Request-By Name" := usersetup."Employee Name"
            ;
            if emp.get(UserSetup."Employee No.") then begin
                rec."Directorate Code" := emp."Directorate Code";
                rec.validate("Directorate Code");
                rec."Department Code" := emp."Department Code";
                rec.validate("Department Code");
                rec.Region := emp.Region;
            end;

            PurchSetup.get;
            PurchSetup.testfield("Effective Procurement Plan");
            rec."Procurement Plan ID" := PurchSetup."Effective Procurement Plan";

            Rec."Document Type" := Rec."document type"::"Purchase Requisition";

            if (Rec.Status = Rec.Status::"Pending Approval") or (Rec.Status = Rec.Status::Released) then begin
                CurrPage.Editable := true; // to edit later
            end;
        end;

        PurchSetup.get;
        PurchSetup.testfield("Effective Procurement Plan");
        rec."Procurement Plan ID" := PurchSetup."Effective Procurement Plan";

    end;

    trigger OnOpenPage()
    var
        PurchSetup: Record "Procurement Setup";
    begin
        // SetControlAppearance;
        // if UserMgt.GetPurchasesFilter <> '' then begin
        //     Rec.FilterGroup(2);
        //     Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
        //     Rec.FilterGroup(0);
        // end;

        PurchSetup.get;
        PurchSetup.testfield("Effective Procurement Plan");
        rec."Procurement Plan ID" := PurchSetup."Effective Procurement Plan";
        // rec."Requester ID" := UserId;

        // if usersetup.get(UserId) then begin
        //cc
        //  rec.SetRange("Requester ID", UserId);
        //cc

        // rec.Region := usersetup."Region Code";
        // Rec."Shortcut Dimension 1 Code" := UserSetup."Region Code";
        // rec."Request-By No." := usersetup."Employee No.";
        // rec."Request-By Name" := usersetup."Employee Name"
        //     ;
        // if emp.get(UserSetup."Employee No.") then begin
        //     rec."Directorate Code" := emp."Directorate Code";
        //     rec.validate("Directorate Code");
        //     rec."Department Code" := emp."Department Code";
        //     rec.validate("Department Code");
        // end;

        //     PurchSetup.get;
        //     PurchSetup.testfield("Effective Procurement Plan");
        //     rec."Procurement Plan ID" := PurchSetup."Effective Procurement Plan";

        //     Rec."Document Type" := Rec."document type"::"Purchase Requisition";

        //  if (Rec.Status = Rec.Status::"Pending Approval") or (Rec.Status = Rec.Status::Released) then begin
        //       CurrPage.Editable := false;
        //     end;
        // end;
        //  end;
    end;


    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        UserSetup: Record "User Setup";
        emp: record Employee;
        UserMgt1: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        [InDataSet]
        JobQueueVisible: Boolean;
        PurchSetupRec: Record "Purchases & Payables Setup";
        ItemJnlTemplate: Record "Item Journal Template";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlLine: Record "Item Journal Line";
        StoreReqHeader: Record "Purchase Header";
        StoreReqLine: Record "Purchase Line";
        IFAPPROVED: TEXT[50];
        ItemGnl: Record "Item Journal Line";
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        Req: Record "Purchase Header";
        AvailableBudget: Decimal;
        Commitment: Codeunit "Procurement Processing";
        DeleteCommitment: Record "Commitment Entries1";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ProcSetup: Record "Procurement Setup";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if Rec.GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                Rec.SetRange("Buy-from Vendor No.");
        CurrPage.Update;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;


    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        //OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

#pragma implicitwith restore




