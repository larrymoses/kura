#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69115 "Staff Requisition Card"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    SourceTable = "Vacancy  Requisitions Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    //             }
                    //             field(Description;Description)
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Manpower Plan ID";"Manpower Plan ID")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Manpower Plan Name";"Manpower Plan Name")
                    //             {
                    //                 ApplicationArea = Basic;
                    //                 Editable = false;
                    //             }
                    //             field("Department Code";"Department Code")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Department Name";"Department Name")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Global Dimension 1";"Global Dimension 1")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Global Dimension 1 Name";"Global Dimension 1 Name")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Global Dimension 2";"Global Dimension 2")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Global Dimension 2 Name";"Global Dimension 2 Name")
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //             field("Created By";"Created By")
                    //             {
                    //                 ApplicationArea = Basic;
                    //                 Editable = false;
                    //             }
                    //             field("Created On";"Created On")
                    //             {
                    //                 ApplicationArea = Basic;
                    //                 Editable = false;
                    //             }
                    //             field(Status;Status)
                    //             {
                    //                 ApplicationArea = Basic;
                    //             }
                    //         }
                    //         part(Control15;"Staff Requisition Lines")
                    //         {
                    //             SubPageLink = "Requisition No."=field("No.");
                    //         }
                    //         systempart(Control1102755020;Outlook)
                    //         {
                    //         }
                    //     }
                    // }

                    // actions
                    // {
                    //     area(processing)
                    //     {
                    //         group(ActionGroup1)
                    //         {
                    //             action("Create Vacancies")
                    //             {
                    //                 ApplicationArea = Basic;
                    //                 Image = Alerts;
                    //                 Promoted = true;
                    //                 PromotedCategory = Process;
                    //                 PromotedIsBig = true;

                    //                 trigger OnAction()
                    //                 begin
                    //                     if Status<>Status::Released then
                    //                       Error(Text001);
                    //                     if Confirm(TXT001)=true then begin
                    //                     ShortlistingCriteria.CreateVacancies(Rec);
                    //                     end;
                    //                       Message(TXT002);
                    //                       Rec.Status:=Rec.Status::Completed;
                    //                       Rec.Modify;
                    //                 end;
                    //             }
                    //         }
                    //         group(Approval)
                    //         {
                    //             Caption = 'Approval';
                    //             action(Approve)
                    //             {
                    //                 ApplicationArea = All;
                    //                 Caption = 'Approve';
                    //                 Image = Approve;
                    //                 Promoted = true;
                    //                 PromotedCategory = Category6;
                    //                 ToolTip = 'Approve the requested changes.';

                    //                 trigger OnAction()
                    //                 var
                    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //                 begin
                    //                     ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    //                 end;
                    //             }
                    //             action(Reject)
                    //             {
                    //                 ApplicationArea = All;
                    //                 Caption = 'Reject';
                    //                 Image = Reject;
                    //                 Promoted = true;
                    //                 PromotedCategory = Category6;
                    //                 PromotedOnly = true;
                    //                 ToolTip = 'Reject the approval request.';

                    //                 trigger OnAction()
                    //                 var
                    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //                 begin
                    //                     ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    //                 end;
                    //             }
                    //             action(Delegate)
                    //             {
                    //                 ApplicationArea = All;
                    //                 Caption = 'Delegate';
                    //                 Image = Delegate;
                    //                 Promoted = true;
                    //                 PromotedCategory = Category6;
                    //                 PromotedOnly = true;
                    //                 ToolTip = 'Delegate the approval to a substitute approver.';

                    //                 trigger OnAction()
                    //                 var
                    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //                 begin
                    //                     ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    //                 end;
                    //             }
                    //             action(Comment)
                    //             {
                    //                 ApplicationArea = All;
                    //                 Caption = 'Comments';
                    //                 Image = ViewComments;
                    //                 Promoted = true;
                    //                 PromotedCategory = Category6;
                    //                 PromotedOnly = true;
                    //                 ToolTip = 'View or add comments for the record.';

                    //                 trigger OnAction()
                    //                 var
                    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //                 begin
                    //                     ApprovalsMgmt.GetApprovalComment(Rec);
                    //                 end;
                    //             }
                    //         }
                    //         group("Request Approval")
                    //         {
                    //             Caption = 'Request Approval';
                    //             Image = SendApprovalRequest;
                    //             separator(Action19)
                    //             {
                    //             }
                    //             action(SendApprovalRequest)
                    //             {
                    //                 ApplicationArea = Basic,Suite;
                    //                 Caption = 'Send A&pproval Request';
                    //                 Image = SendApprovalRequest;
                    //                 Promoted = true;
                    //                 PromotedCategory = Category6;
                    //                 PromotedIsBig = true;
                    //                 ToolTip = 'Request approval to change the record.';

                    //                 trigger OnAction()
                    //                 var
                    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //                 begin
                    //                     /*IF ApprovalsMgmt.CheckVacancyRequisitionApprovalWorkflowEnabled(Rec) THEN
                    //                     ApprovalsMgmt.OnSendVacancyRequisitiorForApproval(Rec);
                    //                     */

                    //                 end;
                    //             }
                    //             action(CancelApprovalRequest)
                    //             {
                    //                 ApplicationArea = Basic,Suite;
                    //                 Caption = 'Cancel Approval Re&quest';
                    //                 Image = CancelApprovalRequest;
                    //                 Promoted = true;
                    //                 PromotedCategory = Category6;
                    //                 PromotedIsBig = true;
                    //                 ToolTip = 'Cancel the approval request.';

                    //                 trigger OnAction()
                    //                 var
                    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //                     WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
                    //                 begin
                    //                     TestField(Status,Status::"Pending Approval");
                    //                      /* ApprovalsMgmt.OnCancelVacancyRequisitiorForApprovalRequest(Rec);
                    //                       WorkflowWebhookManagement.FindAndCancel(RECORDID);
                    //                       */

                    //                 end;
                    //             }
                    //         }
                    //     }
                    //     area(navigation)
                    //     {
                    //         action("Vacancy Requisition Report")
                    //         {
                    //             ApplicationArea = Basic;
                    //             Caption = 'Vacancy Requisition Report';
                    //             Image = "Report";
                    //             Promoted = true;
                    //             PromotedCategory = "Report";
                    //             PromotedIsBig = true;
                    //             RunObject = Report "Vacancy Requisition Report";
                    //         }
                    //         action("New Hires")
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = Add;
                    //             //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //             //PromotedCategory = "Report";
                    //             //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //             //PromotedIsBig = true;
                    //         }
                    //     }
                    //     area(reporting)
                    //     {
                    //     }
                    // }

                    // var
                    //     DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL;
                    //     ApprovalEntries: Page "Approval Entries";
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //     OpenApprovalEntriesExistForCurrUser: Boolean;
                    //     OpenApprovalEntriesExist: Boolean;
                    //     HREmpReq: Record "Employee Requisitions";
                    //     SMTP: Codeunit Mail;
                    //     HRSetup: Record "Human Resources Setup";
                    //     CTEXTURL: Text[30];
                    //     HREmp: Record Employee;
                    //     HREmailParameters: Record "Hr E-Mail Parameters";
                    //     ContractDesc: Text[30];
                    //     HRLookupValues: Record "HR Lookup Values";
                    //     [InDataSet]
                    //     "Requisition No.Editable": Boolean;
                    //     [InDataSet]
                    //     "Requisition DateEditable": Boolean;
                    //     [InDataSet]
                    //     "Job IDEditable": Boolean;
                    //     [InDataSet]
                    //     "Responsibility CenterEditable": Boolean;
                    //     [InDataSet]
                    //     "Reason For RequestEditable": Boolean;
                    //     [InDataSet]
                    //     ReasonforRequestOtherEditable: Boolean;
                    //     [InDataSet]
                    //     PriorityEditable: Boolean;
                    //     [InDataSet]
                    //     "Closing DateEditable": Boolean;
                    //     [InDataSet]
                    //     "Requisition TypeEditable": Boolean;
                    //     [InDataSet]
                    //     "Required PositionsEditable": Boolean;
                    //     [InDataSet]
                    //     AnyAdditionalInformationEditab: Boolean;
                    //     [InDataSet]
                    //     TypeofContractRequiredEditable: Boolean;
                    //     DimValue: Record "Dimension Value";
                    //     objEmp: Record Employee;
                    //     Obj: BigText;
                    //     ObjInstr: InStream;
                    //     ObjOutStr: OutStream;
                    //     Obstxt: Text;
                    //     Rectxt: Text;
                    //     Obj1: BigText;
                    //     ObjInstr1: InStream;
                    //     ObjOutStr1: OutStream;
                    //     Obstxt1: Text;
                    //     Text001: label 'The requisition has to be fully approved before being advertised';
                    //     ReqStatus: Boolean;
                    //     ShortlistingCriteria: Codeunit "Shortlisting Criteria";
                    //     TXT001: label 'Are you sure you want to create all vacancies for this requisition';
                    //     TXT002: label 'The vacancies have been created successfully';


                    // procedure TESTFIELDS()
                    // begin
                    // end;


                    // procedure UpdateControls()
                    // begin
                    // end;
                }

            }
        }
    }
}