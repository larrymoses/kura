page 99541 "Town Workplan Card"
{
    Caption = 'Urban Area Workplan';
    PageType = Card;
    SourceTable = "RAM Workplan Header";
    DataCaptionFields = "Workplan Type", Description, "Region Name", "Shortcut Dimension 5 Code";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Post,Navigate,Generate Payment Certificate,Generate Invoice';
    PopulateAllFields=true;
    SourceTableView = WHERE("Workplan Type" = CONST(Town),
                            Consolidated = CONST(false));
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
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
                }
                field("Road Planner Name"; Rec."Road Planner Name")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field("Urban Area Code";Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                  field("Funding Source Type";Rec."Funding Source Type")
                {
                     ApplicationArea = Basic;
                    // ShowMandatory = true;
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                     ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
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
            part("RAM Workplan Lines"; "Town WorkPlan Lines")
            {
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
    actions{
        area(Processing)
        {
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
                         //Rec.TestField("Submission Status",Rec."Submission Status"::Submitted);
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
            action("Post to Region")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    Rec.TestField("Submission Status",Rec."Submission Status"::Submitted);
                    Rec.TestField(Status,Rec.Status::Approved);
                    RMSManagement.FnConsolidateTownRAMWorkplans(Rec);
                    //RMSManagement.FnConsolidateToEastRAMWorkplans(Rec);
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
                begin
                    Rec.RESET;
                    Rec.SETRANGE("Document No", Rec."Document No");
                    REPORT.RUN(Report::"APRP Summary", TRUE, TRUE, Rec);
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
        Rec."Workplan Type" := Rec."Workplan Type"::Town;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Workplan Type" := Rec."Workplan Type"::Town;
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


    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable(false);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;

}
