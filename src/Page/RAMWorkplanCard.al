
page 99664 "Regional RAM Workplan Card"
{
    PageType = Card;
    SourceTable = "RAM Workplan Header";
    Editable =false;
     PromotedActionCategories = 'New,Process,Report,Request Approval,Notify,Post,Navigate,Generate Payment Certificate,Generate Invoice';
    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = PlanEditable;
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan Type"; Rec."Workplan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan Ref No"; Rec."Workplan Ref No")
                {
                    ApplicationArea = Basic;
                }
                field("Workplan No"; Rec."Workplan No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Workplan Number';
                }
                field("Consolidated Workplan No"; Rec."Consolidated Workplan No")
                {
                    ApplicationArea = Basic;
                    Visible = Rec.Consolidated = True;
                }
                field("Consolidate To"; Rec."Consolidate To")
                {
                    ApplicationArea = Basic;
                    Visible=false;
                }

                field("Road Planner No"; Rec."Road Planner No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Planner Name"; Rec."Road Planner Name")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                  field("Funding Source Type";Rec."Funding Source Type")
                {
                     ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                     ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("County Code"; Rec."County Code")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Ceiling Amount"; Rec."Budget Ceiling Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Workplan Amount"; Rec."Total Workplan Amount")
                {
                    ApplicationArea = Basic;
                }
                field("No of Projects"; Rec."No of Projects")
                {
                    ApplicationArea = Basic;
                }

                field("No of Funding Sources"; Rec."No of Funding Sources")
                {
                    ApplicationArea = Basic;
                }
                field("Regional Director No"; Rec."Regional Director No")
                {
                    ApplicationArea = Basic;
                }
                field("Regional Director Name"; Rec."Regional Director Name")
                {
                    ApplicationArea = Basic;
                }
              
               
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                }
                field("Submission Status"; Rec."Submission Status")
                {
                    ApplicationArea = Basic;
                }
                field(Consolidated; Rec.Consolidated)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                }
            }

            part("RAM Workplan Lines"; "RAM Workplan Lines")
            {
                 Editable = PlanEditable;
                ApplicationArea = Basic;
                SubPageLink = "Document No" = FIELD("Document No"),
                              "Workplan Type" = FIELD("Workplan Type");
            }
            group("Assignment/Review")
            {
                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = Basic;
                }
                field("Assignment Remarks"; Rec."Assignment Remarks")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Bil Items From Template")
            {
                Caption = 'Generate Project BoQ';
                Image = SuggestCustomerBill;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    RMSManagement.FnUpdateBoQDetailsOnRAMWorkplan(Rec);
                    RMSManagement.FnCreateRWPlanSummaryOfBillsFromBOQTemplate(Rec);
                    RMSManagement.FnCreateRWPPlanBillItemLinesFromBOQTemplates(Rec);
                    MESSAGE('Bill Items inserted successfully');
                end;
            }
            action(Release)
            {
                Caption = 'Approve';
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    MESSAGE('Workplan Ref No %1 has been approved', Rec."Workplan Ref No");
                    Rec.Status := Rec.Status::Approved;
                    Rec.MODIFY;
                end;
            }

            action("Submit to Regional WorkPlan")
            {
                Caption = 'Submit to HQ';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible=false;
                trigger OnAction()
                begin
                    RMSManagement.FnSubmitRegionalWorkplanToHQ(Rec);
                    ResponsibilityCenter.RESET;
                    ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, Rec."Responsibility Center");
                    IF ResponsibilityCenter.FINDSET THEN
                        ResponsibilityCenter."No of RAM Workplans" := Rec."Workplan No";
                    Rec."Submission Status" := Rec."Submission Status"::Submitted;
                    Rec.MODIFY(TRUE);
                    MESSAGE('Regional Workplan for %1 Submitted Successfully to Region', Rec."Financial Year Code");

                    RoadManagementSetup.GET;
                    RoadManagementSetup.TESTFIELD("Workplan Recall Expiry Period");
                    Rec."Recall Expiry Date" := CALCDATE(RoadManagementSetup."Workplan Recall Expiry Period", TODAY);
                    MESSAGE('Workplan No: %1 has been submitted successfully,Please note you have a period of upto %2 to recall the workplan for any ammendments', Rec."Workplan Ref No", Rec."Recall Expiry Date");
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';
                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant)
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the approval request.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = All;
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
            action("Post to Consolidated")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Enabled = Rec.Status= Rec.Status::Approved;
                trigger OnAction()
                begin
                    Rec.TestField("Submission Status",Rec."Submission Status"::Submitted);
                    Rec.TestField(Status,Rec.Status::Approved);
                    RMSManagement.FnConsolidateRAMWorkplans(Rec);
                    //RMSManagement.FnConsolidateToEastRAMWorkplans(Rec);
                    //Add Workplan Consultancy Projects
                end;
            }
            action("Post to Consolidated West")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = False;//Rec."Consolidate To" = Rec."Consolidate To"::West;

                trigger OnAction()
                begin
                    //RMSManagement.FnConsolidateRAMWorkplans(Rec);
                    //RMSManagement.FnConsolidateToEastRAMWorkplans(Rec);
                    RMSManagement.FnConsolidateToWestRAMWorkplans(Rec);
                    //Add Workplan Consultancy Projects
                end;
            }
            action(Print)
            {
                Caption = 'APRP Summary';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = false;
                trigger OnAction()
                var

                begin
                    Rec.RESET;
                    Rec.SETRANGE("Document No", Rec."Document No");
                    REPORT.RUN(Report::"APRP Summary", TRUE, TRUE, Rec);
                end;
            }
              action(ARWP)
            {
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                ApplicationArea = Basic;
                trigger OnAction()
                var
                    ARWP: Record "RAM Workplan Header";
                begin
                    ARWP.RESET;
                    ARWP.SETRANGE("Document No", Rec."Document No");
                    ARWP.SetRange("Workplan Type", Rec."Workplan Type");
                    REPORT.RUN(Report::ARWP, TRUE, TRUE, ARWP);
                end;
            }
            action("ARWP Summary")
            {
                Promoted = true;
                PromotedCategory = Report;
                PromotedIsBig = true;
                ApplicationArea = Basic;
                trigger OnAction()
                var
                    ARWP: Record "RAM Workplan Header";
                begin
                    ARWP.RESET;
                    ARWP.SETRANGE("Document No", Rec."Document No");
                    ARWP.SetRange("Workplan Type", Rec."Workplan Type");
                    REPORT.RUN(Report::"ARWP Summary", TRUE, TRUE, ARWP);
                end;
            }
          
            action("Print Summary")
            {
                Caption = 'Print Workplan Summary';
                Image = PrintAttachment;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = false;
                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.SETRANGE("Document No", Rec."Document No");
                    REPORT.RUN(Report::"RAM Work Plan Summary", TRUE, TRUE, Rec);
                end;
            }
            action("Assign To Notification")
            {
                Caption = 'Send Assign To Notification';
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    RMSManagement.FnSendAssignToNotificationOnRAWWorkplans(Rec);
                end;
            }
            action("Assignment Completion")
            {
                Caption = 'Send Assignment Completion Notification';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TESTFIELD("Assignment Remarks");
                    RMSManagement.FnSendAssignmentCompletionNotificationnOnRAMWorkplans(Rec);
                end;
            }
            action("Recall Workplan")
            {
                Enabled = Rec.Consolidated = FALSE;
                Image = CancelAllLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = Rec."Submission Status" = Rec."Submission Status"::Submitted;

                trigger OnAction()
                begin
                    IF Rec."Recall Expiry Date" > TODAY THEN BEGIN
                        ERROR('The Workplan Recall Perion has lapsed. You arae not allowed to recall the workplan past %1', Rec."Recall Expiry Date");
                    END
                    ELSE BEGIN
                        ResponsibilityCenter.RESET;
                        ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, Rec."Responsibility Center");
                        IF ResponsibilityCenter.FINDSET THEN BEGIN
                            ResponsibilityCenter."No of RAM Workplans" := Rec."Workplan No" - 1;
                        END;
                        Rec."Submission Status" := Rec."Submission Status"::Draft;
                        Rec.MODIFY(TRUE);
                    END;
                    MESSAGE('Workplan No: %1 has been recalled successfully', Rec."Workplan Ref No");
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Workplan Type" := Rec."Workplan Type"::Regional;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Workplan Type" := Rec."Workplan Type"::Regional;
    end;

    var
        RMSManagement: Codeunit "RMS Management";
        ResponsibilityCenter: Record "Responsibility Center";
        RoadManagementSetup: Record "Road Management Setup";
        TXT0001: Label 'You cannot exceed your budget ceiling %1';
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        PlanEditable: Boolean;


    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        PlanEditable := false;
        if Rec."Workplan Type" = Rec."Workplan Type"::Town then
            PlanEditable := true
        else
            CurrPage.Editable(false);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
}



