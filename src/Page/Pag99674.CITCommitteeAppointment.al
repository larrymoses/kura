/// <summary>
/// Page CIT Committee Appointment (ID 99672).
/// </summary>
page 99674 "CIT Committee Appointment"
{
    Caption = 'CIT Committee Appointment';
    PageType = Card;
    SourceTable = "IFS Tender Committee";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Appointed Committee"; Rec."Previous Appointed Committee")
                {
                    ApplicationArea = Basic;
                }
                field("Reference Number"; Rec."Reference Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Appointment Reference No.';
                }
                field("Project ID";Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible =false;
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    Caption = 'Venue';
                    Editable = true;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    Caption = 'Committe Duration(Days)';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Staff Id"; Rec."Staff Id")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Min Required No. of Members"; Rec."Min Required No. of Members")
                {
                    ApplicationArea = Basic;
                }
                field("Actual No. of Committee Memb"; Rec."Actual No. of Committee Memb")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
            part(Control23; "IFS Tender Committee Member")
            {
                Caption = 'Committee Members';
                SubPageLink = "Document No." = field("Document No."),
                              "Committee Type" = field("Committee Type");
            }
        }
        area(factboxes)
        {
            systempart(Control19; Outlook)
            {
            }
            systempart(Control20; Notes)
            {
            }
            systempart(Control21; MyNotes)
            {
            }
            systempart(Control22; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(IFP)
            {
                Caption = 'IFP';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."Document No." <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        //ShowDocDim;
                        //CurrPage.SAVERECORD;
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
                        //   ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    RunPageLink = "No." = field("Document No.");
                    ToolTip = 'View or add comments for the record.';
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
                        //  DMSManagement.UploadIFSCommitteeDocuments("Document No. 'Committee', RecordId, d,"Primary Region");
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    // trigger OnAction()
                    // var
                    //     DocumentAttachmentDetails: Page "Document Attachment Details";
                    //     RecRef: RecordRef;
                    // begin
                    //     RecRef.GetTable(Rec);
                    //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //     DocumentAttachmentDetails.RunModal;
                    // end;
                }
                action("Appointment Letter")
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup33)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Enabled = Rec."Approval Status" = Rec."Approval Status"::open;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //  ReleasePurchDoc.ReleaseTenderCommitte(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec."Approval Status" <> Rec."Approval Status"::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        // ReleasePurchDoc.ReopenTenderCommitte(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Appoint & Notify Appointees")
                {
                    ApplicationArea = Basic;
                    Caption = 'Notify Appointees';
                    Enabled = Rec."Approval Status" = Rec."Approval Status"::Approved;
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        NoOfMembers := 0;
                        ProcCommType.Reset;
                        ProcCommType.SetRange("Committee Type", Rec."Committee Type");
                        if ProcCommType.FindFirst() then begin
                            IfsCommitteMembers.Reset;
                            IfsCommitteMembers.SetRange("Committee Type", Rec."Committee Type");
                            IfsCommitteMembers.SetRange("Document No.", Rec."Document No.");
                            if IfsCommitteMembers.FindSet then begin
                                repeat
                                    NoOfMembers += 1;
                                until IfsCommitteMembers.Next = 0;
                            end;
                            ProcCommType.CalcFields(ProcCommType."Min. No. of Members");
                            Rec.CalcFields("Actual No. of Committee Memb");
                            Message('%1' + ' Appointed Successfully', Rec.Description);
                            if Rec."Actual No. of Committee Memb" < ProcCommType."Min. No. of Members" then
                                Error('The appointed members should be more than the allowed minimum no of members %1', ProcCommType."Min. No. of Members");
                            IFS.Reset;
                            IFS.SetRange(Code, Rec."IFS Code");
                            if IFS.FindSet then begin
                                if Rec."Committee Type" = 'TEC' then
                                    IFS."Bid Evaluation Committe" := Rec."Document No."
                                else
                                    if Rec."Committee Type" = 'TOC' then
                                        IFS."Bid Opening Committe" := Rec."Document No.";
                                IFS.Modify;
                            end;

                        end;


                        if Rec."Committee Type" = 'TEC' then begin
                            Procurement.FnSendTenderCommitteNotification2(Rec);
                        end;
                        if Rec."Committee Type" = 'TOC' then begin
                            Procurement.FnSendTenderCommitteNotification(Rec);

                        end else begin
                            Procurement.FnSendTenderCommitteNotification(Rec);

                        end;

                        Procurement.FnSendTenderCommitteNotification(Rec);
                    end;
                }
                action("Committee Functions")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenterLoad;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Procurement Committee Function";
                    RunPageLink = "Committee Type" = field("Committee Type");

                    trigger OnAction()
                    begin
                        Procurement.FnSendTenderCommitteNotification(Rec);
                    end;
                }
                action("Create Imprest Memo")
                {
                    ApplicationArea = Basic;
                    Image = Invoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //Rec.TESTFIELD("Imprest Created",FALSE);
                        CreateMemo(Rec);
                    end;
                }
                action("Document Sources")
                {
                    ApplicationArea = Basic;
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "IFS Tender Document Source";
                    RunPageLink = "Document No." = field("IFS Code");
                }
                action("Clustered Tenders")
                {
                    ApplicationArea = Basic;
                    Image = SelectEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "IFS Tender Committe Entry";
                    RunPageLink = "Document No." = field("Document No.");
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
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
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
                        CustomApprovalEntry: Record "Custom Approval Entry";
                        OldStatus: Option;
                        ApprovalEntry: Record "Approval Entry";
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(rec."Approval Status", Rec."Approval Status"::"Pending Approval");
                        Rec.TestField("Created By", UserId);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                OldStatus := ApprovalEntry.Status;
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                                CustomApprovalEntry.Modify(true);
                            until CustomApprovalEntry.Next = 0;

                        //Notify The User
                        EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                        Rec."Approval Status" := Rec."Approval Status"::Open;
                        //   REC.Modify(true);
                    end;
                }
            }
            action("Non Association Form")
            {
                ApplicationArea = Suite;
                Caption = 'Non Association Form';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    ;
                    Report.Run(70049, true, true, Rec);
                end;
            }
            action("Print Appointment Letter")
            {
                ApplicationArea = Suite;
                Caption = 'Print Appointment Letter';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    ;
                    Report.Run(70048, true, true, Rec);
                end;
            }
            action("Print  Appointment Letter")
            {
                ApplicationArea = Suite;
                Caption = 'Print Evaluation Appointment Letter';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    ;
                    Report.Run(70105, true, true, Rec);
                end;
            }
            
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::IFS;
        Rec.Modify(true);
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
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";
        ProcCommType: Record "Procurement Committee Types";
        IfsCommitteMembers: Record "IFS Tender Committee Member";
        NoOfMembers: Integer;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        IFS: Record "Standard Purchase Code";
        EmailNotifications: Codeunit "Email Notifications";
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

    local procedure CreateMemo(IFSCommitte: Record "IFS Tender Committee")
    var
        ImprestReq: Record "Imprest Memo";
        ImprestLines: Record "Imprest Lines";
        IFSCommitteMembers: Record "IFS Tender Committee Member";
        Text001: label 'The Imprest  Memo %1 has  been created succesfully';
        Text002: label 'There are no participants who qualify for imprest';
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        //SMTP: Codeunit Mail;
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
        CashMgt: Record "Cash Management Setup";
        //SMTPT: Record "Email Account";
        ProjectMembers: Record "Project Members";
        ImpNo: Code[30];
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
    begin
        ImpNo := '';
        //create memo
        ImprestReq.Init;
        CashMgt.Get;
        CashMgt.TestField("Imprest Memo Nos");
        NoSeriesManagement.InitSeries(CashMgt."Imprest Memo Nos", CashMgt."Imprest Memo Nos", 0D, ImpNo, CashMgt."Imprest Memo Nos");
        ImprestReq."No." := ImpNo;
        ImprestReq."Document Type" := ImprestReq."document type"::"Imprest Memo";
        ImprestReq."Imprest No." := ImprestReq."No.";
        ImprestReq."User ID" := UserId;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            ImprestReq.Requestor := UserSetup."Employee No.";
        end;
        ImprestReq.Validate(Requestor);
        ImprestReq.Date := Today;
        ImprestReq."Start Date" := IFSCommitte."Appointment Effective Date";
        ImprestReq."No. of days" := IFSCommitte.Duration;
        ImprestReq."Imprest Naration" := IFSCommitte.Location;
        ImprestReq."Global Dimension 1 Code" := IFSCommitte."Primary Region";
        ImprestReq."Global Dimension 2 Code" := IFSCommitte."Primary Department";
        ImprestReq.Subject := IFSCommitte.Description;
        ImprestReq.Insert;

        //Team Members
        IFSCommitteMembers.Reset;
        IFSCommitteMembers.SetRange("Document No.", IFSCommitte."Document No.");
        IFSCommitteMembers.SetFilter("Total Amount", '>%1', 0);
        if IFSCommitteMembers.FindSet then begin
            repeat
                ProjectMembers.Init;
                ProjectMembers."Imprest Memo No." := ImprestReq."No.";
                ProjectMembers."Work Type" := IFSCommitteMembers.Destination;
                ProjectMembers."Type of Expense" := IFSCommitteMembers.Type;
                ProjectMembers."No." := IFSCommitteMembers."Member No.";

                //ProjectMembers.VALIDATE("No.");

                ProjectMembers."Time Period" := IFSCommitteMembers."No. of Days";
                ProjectMembers.Name := IFSCommitteMembers."Member Name";
                ProjectMembers.Validate("Work Type");
                ProjectMembers.Validate("Time Period");
                ProjectMembers.Insert;
            //notify every employee
            /*
                    UserSetup.RESET;
                    UserSetup.SETRANGE("Employee No.",TrainingPart."Employee Code");
                    IF UserSetup.FINDSET THEN BEGIN
                        Email:=UserSetup."E-Mail";
                        //send notification email
                        SMTPT.GET;
                        Email2:=SMTPT."Email Sender Address";
                        Body:='IMPREST MEMO FOR'+TrainingRequest.Description;
                        SMTP.CreateMessage('IMPREST MEMO',Email2,
                        Email,'Training  '+'No: '+TrainingRequest.Code,
                        'Dear '+UserSetup."Employee Name"+',<BR><BR>'+'This is to bring to your attention regarding the creation of an imprest memo relating to the training'+
                        ' '+TrainingRequest.Description+' '+'</b> kindly login to'
                        ,TRUE);

                        SMTP.AddBCC(Email2);
                        SMTP.AddBodyline('<BR><BR>Kind Regards,'+'<BR><BR>'+USERID+'<BR>'+'<BR>');
                        SMTP.Send();
                      END;
                      */
            until IFSCommitteMembers.Next = 0;
            Message(Text001, ImprestReq."No.");
            Page.Run(57033, ImprestReq);

            IFSCommitte."Imprest Created" := true;
            IFSCommitte."Memo No." := ImprestReq."No.";
            IFSCommitte.Modify(true);

        end else
            Message(Text002);

    end;
}




