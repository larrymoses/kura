#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69237 "Employee Requisitions List"
{
    // ApplicationArea = Basic;
    // CardPageID = "Employee Requisition Card";
    // DelayedInsert = false;
    // DeleteAllowed = false;
    // InsertAllowed = false;
    // ModifyAllowed = false;
    // PageType = List;
    // PromotedActionCategories = 'New,Process,Reports,Job,Functions,Employee';
    // ShowFilter = true;
    // SourceTable = "Employee Requisitions";
    // UsageCategory = Lists;

    // layout
    // {
    //     area(content)
    //     {
    //         repeater(Control1102755000)
    //         {
    //             Editable = false;
    //             field("Requisition No."; "Requisition No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 StyleExpr = true;
    //             }
    //             field("Requisition Date"; "Requisition Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 StyleExpr = true;
    //             }
    //             field("Job Title"; "Job Title")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Requestor; Requestor)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Reason For Request"; "Reason For Request")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Required Positions"; "Required Positions")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Type of Contract Required"; "Type of Contract Required")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Contract';
    //                 Editable = false;
    //             }
    //             field("Closing Date"; "Closing Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Closed; Closed)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Status; Status)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = true;
    //                 Style = StrongAccent;
    //                 StyleExpr = true;
    //             }
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         systempart(Control1102755008; Outlook)
    //         {
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         group(Job)
    //         {
    //             Caption = 'Job';
    //             action(Requirements)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Requirements';
    //                 Image = JobListSetup;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 RunObject = Page "Manpower Plan Header";
    //                 RunPageLink = No = field("Job ID");
    //             }
    //             action(Responsibilities)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Responsibilities';
    //                 Image = JobResponsibility;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 RunObject = Page "Manpower Planning Lines";
    //                 // RunPageLink = "Entry No"=field("Job ID");
    //             }
    //         }
    //         group("Fu&nctions")
    //         {
    //             // Caption = 'Fu&nctions';
    //             // action(Advertise)
    //             // {
    //             //     ApplicationArea = Basic;
    //             //     Caption = 'Advertise';
    //             //     Image = Salutation;
    //             //     Promoted = true;
    //             //     PromotedCategory = Category5;

    //             //     trigger OnAction()
    //             //     begin
    //             /*
    //             HREmp.RESET;
    //             REPEAT
    //             HREmp.TESTFIELD(HREmp."Company E-Mail");
    //             SMTP.CreateMessage('Job Advertisement','dgithahu@coretec.co.ke',HREmp."Company E-Mail",
    //             'URAIA Job Vacancy','A vacancy with the job description' +"Job Description"+'is open for applications',TRUE);
    //             SMTP.Send();
    //             UNTIL HREmp.NEXT=0;
    //             */
    //             //     TestField("Requisition Type","requisition type"::Internal);
    //             //     HREmp.SetRange(HREmp.Status,HREmp.Status::Active);
    //             //     if HREmp.Find('-') then

    //             //     //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
    //             //     HREmailParameters.Reset;
    //             //     HREmailParameters.SetRange(HREmailParameters."Associate With",HREmailParameters."associate with"::"Vacancy Advertisements");
    //             //     if HREmailParameters.Find('-') then
    //             //     begin
    //             //          repeat
    //             //          HREmp.TestField(HREmp."Company E-Mail");
    //             //          SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",HREmp."Company E-Mail",
    //             //          HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
    //             //          HREmailParameters.Body+' '+ "Job Title" +' '+ HREmailParameters."Body 2"+' '+ Format("Closing Date")+'. '+
    //             //          HREmailParameters."Body 3",true);
    //             //          SMTP.Send();
    //             //          until HREmp.Next=0;

    //             //     Message('All Employees have been notified about this vacancy');
    //             //     end;

    //             // end;
    //         }
    //         action("Mark as Closed/Open")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Mark as Closed/Open';
    //             Image = ReopenCancelled;
    //             Promoted = true;
    //             PromotedCategory = Category5;

    //             trigger OnAction()
    //             begin
    //                 if Closed then begin
    //                     if not Confirm('Are you sure you want to Re-Open this Document', false) then exit;
    //                     Closed := false;
    //                     Modify;
    //                     Message('Employee Requisition %1 has been Re-Opened', "Requisition No.");

    //                 end else begin
    //                     if not Confirm('Are you sure you want to close this Document', false) then exit;
    //                     Closed := true;
    //                     Modify;
    //                     Message('Employee Requisition %1 has been marked as Closed', "Requisition No.");
    //                 end;
    //             end;
    //         }
    //         action("&Print")
    //         {
    //             // ApplicationArea = Basic;
    //             // Caption = '&Print';
    //             // Image = PrintReport;
    //             // Promoted = true;
    //             // PromotedCategory = Category5;

    //             // trigger OnAction()
    //             // begin
    //             //     HREmpReq.Reset;
    //             //     HREmpReq.SetRange(HREmpReq."Requisition No.","Requisition No.");
    //             //     if HREmpReq.Find('-') then
    //             //     Report.Run(53918,true,true,HREmpReq);
    //             // end;
    //         }
    //         action("Re-Open")
    //         {
    //             ApplicationArea = Basic;
    //             Caption = 'Re-Open';
    //             Image = ReOpen;
    //             Promoted = true;
    //             PromotedCategory = Category5;
    //             Visible = false;

    //             trigger OnAction()
    //             begin
    //                 Status := Status::New;
    //                 Modify;
    //             end;
    //         }
    //     }
    // }
    //         group("Request Approval")
    //         {
    //             Caption = 'Request Approval';
    //             action(SendApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Send A&pproval Request';
    //                 Enabled = not OpenApprovalEntriesExist;
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category9;

    //                 trigger OnAction()
    //                 begin
    //                     //IF ApprovalsMgmt.CheckSalesApprovalsWorkflowEnabled(Rec) THEN
    //                      // ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
    //                 end;
    //             }
    //             action(CancelApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Cancel Approval Re&quest';
    //                 Enabled = OpenApprovalEntriesExist;
    //                 Image = Cancel;
    //                 Promoted = true;
    //                 PromotedCategory = Category9;

    //                 trigger OnAction()
    //                 begin
    //                     //ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
    //                 end;
    //             }
    //         }
    //     }
    // }

    // var
    //     HREmp: Record Employee;
    //     HREmailParameters: Record "Hr E-Mail Parameters";
    //    // SMTP: Codeunit Mail;
    //     DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition";
    //     // ApprovalEntries: Page "Approval Entries";
    //     // HREmpReq: Record "Employee Requisitions";
    //     // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     // OpenApprovalEntriesExistForCurrUser: Boolean;
    //     // OpenApprovalEntriesExist: Boolean;
    //     // ShowWorkflowStatus: Boolean;


    // procedure TESTFIELDS()
    // begin
    //     // TestField("Job ID");
    //     // TestField("Closing Date");
    //     // TestField("Type of Contract Required");
    //     // TestField("Requisition Type");
    //     // TestField("Required Positions");
    //     // if "Reason For Request"="reason for request"::Other then
    //     // TestField("Reason for Request(Other)");
    // end;
}

