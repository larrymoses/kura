#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
//Page 69447 "HSE Plans"
//{
//     // ApplicationArea = Basic;
//     // CardPageID = "HSE Plan";
//     // Editable = false;
//     // PageType = List;
//     // SourceTable = "HSE Plan";
//     // SourceTableView = where("Plan Ty = e"=filter(Project));
//     // UsageCategory = Documents;

//     // layout
//     // {
//     //     area(content)
//     //     {
//     //         repeater(Group)
//     //         {
//     //             field("Plan I D";"Plan ID")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Plan Typ e";"Plan Type")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Document Dat e";"Document Date")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Risk Management Plan I D";"Risk Management Plan ID")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field(Descripti on;Description)
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Safety Rules&Regulations Tem p";"Safety Rules&Regulations Temp")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Primary Missio n";"Primary Mission")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Overall Safety Manage r";"Overall Safety Manager")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Planning Start Dat e";"Planning Start Date")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Planning End Dat e";"Planning End Date")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Dimension Set I D";"Dimension Set ID")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field(Block ed;Blocked)
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field(Stat us;Status)
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Created B y";"Created By")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Created Date/Tim e";"Created Date/Time")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //         }
//     //     }
//     // }

//     // actions
//     // {
//     //     area(creation)
//     //     {
//     //         action("Send Approval Request")
//     //         {
//     //             ApplicationArea = Basic;
//     //             Ellipsis = true;
//     //             Image = SendApprovalRequest;
//     //             Promoted = true;
//     //             PromotedCategory = Category4;
//     //             PromotedIsBig = true;
//     //             PromotedOnly = true;

//     //             trigger OnAction()
//     //             begin
//     //                 TestField(Stat us,Status::Open);
//     //                 RecVari := t:=Rec;
//     //                 RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVaria nt,Rec."Project I D",Documenttype::"HSE Pla "Plan ID", D",ApprovalEntry."document type"::P 0, RecordId, Id,FnGetTableNo());
//     //                 Sta := s:=Status::"Pending Approval";
//     //                 Modify(true);
//     //                 EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEnt ry,"Plan ID");
//     //                 Message(TXT0001);
//     //             end;
//     //         }
//     //         action("Cancel Approval Request")
//     //         {
//     //             ApplicationArea = Basic;
//     //             Ellipsis = true;
//     //             Image = CancelApprovalRequest;
//     //             Promoted = true;
//     //             PromotedCategory = Category4;
//     //             PromotedIsBig = true;
//     //             PromotedOnly = true;

//     //             trigger OnAction()
//     //             var
//     //                 RecRef: RecordRef;
//     //                 CustomApprovalEntry: Record "Custom Approval Entry";
//     //                 OldStatus: Option;
//     //             begin
//     //                 TestField(Stat us,Status::"Pending Approval");
//     //                 TestField("Created B y",UserId);

//     //                 CustomApprovalEntry.Reset;
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Plan ID");
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approv e",RecordId);
//     //                 CustomApprovalEntry.SetFilter(CustomApprovalEntry.Stat '<>%1|<>%2', 2',CustomApprovalEntry.Status::Cancel ed,CustomApprovalEntry.Status::Rejected);
//     //                 if CustomApprovalEntry.FindSet then
//     //                  repeat
//         //                     OldStatus := ApprovalEntry.Status;
//     //                         CustomApprovalEntry.Sta := s:=CustomApprovalEntry.Status::Canceled;
//     //                         CustomApprovalEntry.Modify(true);
//     //                     until CustomApprovalEntry.N = xt=0;

//     //                 //Notify The User
//     //                 EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
//     //                 Sta := s:=Status::Open;
//     //                 Modify(true);

//     //                 Message(TXT0002);
//     //             end;
//     //         }
//     //         action("Project Approvals")
//     //         {
//     //             ApplicationArea = Basic;
//     //             Ellipsis = true;
//     //             Image = Approvals;
//     //             Promoted = true;
//     //             PromotedCategory = Category4;
//     //             PromotedIsBig = true;
//     //             PromotedOnly = true;

//     //             trigger OnAction()
//     //             begin
//     //                 ApprovalsMgmt.FnOpenApprovalEntriesPage(RecordId);
//     //             end;
//     //         }
//     //         action(Approve)
//     //         {
//     //             ApplicationArea = Suite;
//     //             Caption = 'Approve';
//     //             Image = Approve;
//     //             Promoted = true;
//     //             PromotedCategory = Process;
//     //             PromotedIsBig = true;
//     //             Scope = Repeater;
//     //             ToolTip = 'Approve the requested changes.';

//     //             trigger OnAction()
//     //             var
//     //                 CustomApprovalEntry: Record "Custom Approval Entry";
//     //                 ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     //             begin
//     //                 //CurrPage.SETSELECTIONFILTER(CustomApprovalEntry);
//     //                 ApprovalsMgmt.FnApproveRecordApprovalRequest(RecordId);

//     //                 CustomApprovalEntry.Reset;
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Plan ID");
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry.Stat us,CustomApprovalEntry.Status::Approved);
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No .",FnGetLargestSequenceNoFromApprovalEntry("Plan ID"));
//     //                 Message(Format(FnGetLargestSequenceNoFromApprovalEntry("Plan ID")));
//     //                 if CustomApprovalEntry.FindFirst t begin
//                         //      ReleaseApprovalDocument.ReleaseSAVReq(Rec);
//  //                    end;
//     //             end;
//     //         }
//     //         action(Reject)
//     //         {
//     //             ApplicationArea = Suite;
//     //             Caption = 'Reject';
//     //             Image = Reject;
//     //             Promoted = true;
//     //             PromotedCategory = Process;
//     //             PromotedIsBig = true;
//     //             Scope = Repeater;
//     //             ToolTip = 'Reject the approval request.';

//     //             trigger OnAction()
//     //             var
//     //                 ApprovalEntry: Record "Custom Approval Entry";
//     //                 ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     //                 currentRecEntryNo: Integer;
//     //                 CustomApprovalEntryChange: Record "Custom Approval Entry History";
//     //             begin
//     //                 //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
//     //                 //Added
//     //                 //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
//     //                 //Added
//     //                 CustomApprovalEntry.Reset;
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Plan ID");
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approv e",RecordId);
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry.Stat us,CustomApprovalEntry.Status::Open);
//     //                 if CustomApprovalEntry.FindSet then begin
//     //                  currentRecEntryNo := o:=CustomApprovalEntry."Sequence No.";
//     //                 end;//Added

//     //                 ApprovalsMgmt.FnRejectRecordApprovalRequest(RecordId);

//     //                 CustomApprovalEntry.Reset;
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Plan ID");
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approv e",RecordId);
//     //                 //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
//     //                 if CustomApprovalEntry.FindSet then
//     //                  repeat
//         //                     CustomApprovalEntry.Sta := s:=CustomApprovalEntry.Status::Rejected;
//     //                         CustomApprovalEntry.Modify(true);
//     //                     until CustomApprovalEntry.N = xt=0;

//     //                 Sta := s:=Status::Open;
//     //                 Modify(true);

//     //                 //Added part 2
//     //                 if currentRecEntr > No>1 then begin
//     //                     CustomApprovalEntry.Reset;
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Plan ID");
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approv e",RecordId);
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No .",currentRecEntryNo);
//     //                     if CustomApprovalEntry.FindSet then begin
//     //                      repeat
//              //                    UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
//     //                             CustomApprovalEntry.Sta := s:=CustomApprovalEntry.Status::Created;
//     //                             CustomApprovalEntry.Modify();
//     //                         until CustomApprovalEntry.N = 0;
//         //                 end;

//     //                 end;

//     //                 if currentRecEntr > No>1 then begin
//     //                     CustomApprovalEntry.Reset;
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Plan ID");
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approv e",RecordId);
//     //                     CustomApprovalEntry.SetFilter(CustomApprovalEntry."Sequence No '<%1', 1',currentRecEntryNo);
//     //                     if CustomApprovalEntry.FindSet then begin
//     //                      repeat

//         //                         if (CustomApprovalEntry."Sequence N = (currentRecEntryNo - No-1)) then begin
//     //                                 CustomApprovalEntry.Sta := s:=CustomApprovalEntry.Status::Open;
//     //                          end
//                                 else
//                                    lse if (CustomApprovalEntry."Sequence N > .">currentRecEntryNo) then begin
//     //                                     CustomApprovalEntry.Sta := s:=CustomApprovalEntry.Status::Created;
//     //                                 end else begin
//     //                                     CustomApprovalEntry.Sta := s:=CustomApprovalEntry.Status::Approved;
//     //                              end;
//         //                         UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
//     //                             CustomApprovalEntry.Modify();

//     //                         until CustomApprovalEntry.N = xt=0;
//     //                     end;
//     //                 end;
//     //                 if currentRecEntr = No=1 then begin
//     //                     CustomApprovalEntry.Reset;
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Plan ID");
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approv e",RecordId);
//     //                  //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
//       //                   if CustomApprovalEntry.FindSet then
//     //                      repeat
//           //                       CustomApprovalEntry.Sta := s:=CustomApprovalEntry.Status::Rejected;
//     //                             CustomApprovalEntry.Modify(true);
//     //                         until CustomApprovalEntry.N = 0;

//                         Status := s:=Status::Open;
//     //                     Modify(true);
//     //                 end;
//     //                 //Added part 2

//     //                 EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);


//     //                 Find
//     //             end;
//     //         }
//     //         action(Delegate)
//     //         {
//     //             ApplicationArea = Suite;
//     //             Caption = 'Delegate';
//     //             Image = Delegate;
//     //             Promoted = true;
//     //             PromotedCategory = Process;
//     //             PromotedIsBig = true;
//     //             Scope = Repeater;
//     //             ToolTip = 'Delegate the approval to a substitute approver.';

//     //             trigger OnAction()
//     //             var
//     //                 ApprovalEntry: Record "Custom Approval Entry";
//     //                 ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     //                 Selected: Integer;
//     //                 USetup: Record "User Setup";
//     //                 Options: Text;
//     //                 "Count": Integer;
//     //                 SelectedUser: Code[50];
//     //                 Region: Text;
//     //             begin
//     //                 //Added
//     //              Options := 'Default Substitute,';
//                     //Get Region
// //                     USetup.Reset;
//     //                 USetup.SetRange("User I D",UserId);
//     //                 if USetup.Find('-') then begin
//     //                  Region := SelectedUser;
//                     end;

// //                     USetup.Reset;
//     //                 USetup.SetRange("Region Cod e",Region);
//     //                 if USetup.Find('-') then begin
//     //                  repeat

//                             Options := Options + ns+USetup."User  + D"+',';

//     //                     until USetup.N = 0;
// //                     end;


//     //                 Selected := Dialog.StrMenu(Options, 1, 'Select User');

//     //                 USetup.Reset;
//     //                 USetup.SetRange("Region Cod e",Region);
//     //                 if USetup.Find('-') then be
//                         repeat
//                             Count := Count + 1;
//       //                       if Selected = Co + nt+1 then begin
//     //                          SelectedUser := r:=USetup."User ID";
//     //                         end;
//     //                     until USetup.N = 0;
//                     end;

// //                     USetup.Reset;
//     //                 USetup.SetRange("User I D",UserId);
//     //                 if USetup.Find('-') then begin
//     //                     USetup."Substitute Select := true;
// //                         USetup."Selected Substitu := SelectedUser;
// //                         USetup.Modify();
//     //                 end;
//     //                 //Added

//     //                 //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
//     //                 ApprovalsMgmt.FnDelegateRecordApprovalRequest(RecordId);
//     //                 EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);
//     //             end;
//     //         }
//     //     }
//     // }

//     // trigger OnNewRecord(BelowxRec: Boolean)
//     // begin
//     //     "Plan Ty := ":="plan type"::Project;
//     // end;

//     // var
//     //     DMSManagement: Codeunit "DMS Management";
//     //     DocType: Record "DMS Documents";
//     //     OpenApprovalEntriesExistCurrUser: Boolean;
//     //     OpenApprovalEntriesExist: Boolean;
//     //     OpenApprovalEntriesExistForCurrUser: Boolean;
//     //     CanCancelApprovalForRecord: Boolean;
//     //     CanRequestApprovalForFlow: Boolean;
//     //     CanCancelApprovalForFlow: Boolean;
//     //     RMS: Codeunit "RMS Management";
//     //     ShowWorkflowStatus: Boolean;
//     //     PRN: Record "Purchase Header";
//     //     ProcCommType: Record "Procurement Committee Types";
//     //     IfsCommitteMembers: Record "IFS Tender Committee Member";
//     //     NoOfMembers: Integer;
//     //     ProjectStaffAppointment: Record "Project Staff Appointment";
//     //     ProjectStaffAppointList: Page "Project Staff Appoint. List";
//     //     ProjectStaffVoucher: Record "Project Staff Voucher";
//     //     ProjectStaffTerminationLine: Record "Project Staff Termination Line";
//     //     ProcurementProcessing: Codeunit "Procurement Processing";
//     //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     //     ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
//     //     PCOInternalProjectTeam: Record "PCO Internal Project Team";
//     //     PCORequiredDocument: Record "PCO Required Document";
//     //     ProjectDocumentTemplate: Record "Project Document Template";
//     //     ProjectDocumentTemplateLine: Record "Project Document Template Line";
//     //     ObjJob: Record Job;
//     //     ProjectMobilizationHeader: Record "Project Mobilization Header";
//     //     WEPExecutionSchedule: Record "WEP Execution Schedule";
//     //     JobPlanningLine: Record "Job Planning Line";
//     //     NoSeriesManagement: Codeunit NoSeriesManagement;
//     //     RoadManagementSetup: Record "Road Management Setup";
//     //     ProjectMeetingRegister: Record "Project Meeting Register";
//     //     PCOPlannedMeeting: Record "PCO Planned Meeting";
//     //     SMTPMailSetup: Record "Email Account";
//     //     SMTPMail: Codeunit Mail;
//     //     EmailBody: Text[250];
//     //     acknowledgementtabvisible: Boolean;
//     //     ProjectMeetingAgendaTemp: Record "Project Meeting Agenda Temp";
//     //     MeetingAgendaItemTemplate: Record "Meeting Agenda Item Template";
//     //     ProjectMeetingAgenda: Record "Project Meeting Agenda";
//     //     ProjectMeetingSummary: Record "Project Meeting Summary";
//     //     CompanyInformation: Record "Company Information";
//     //     HumanResourcesSetup: Record "Human Resources Setup";
//     //     Window: Dialog;
//     //     BodyText: Text[250];
//     //     mymail: Codeunit Mail;
//     //     WindowisOpen: Boolean;
//     //     FileDialog: Codeunit Mail;
//     //     SendingDate: Date;
//     //     SendingTime: Time;
//     //     Counter: Integer;
//     //     cu400: Codeunit Mail;
//     //     SenderAddress: Text[100];
//     //     RequesterName: Text[100];
//     //     RequesterEmail: Text[100];
//     //     emailhdr: Text[100];
//     //     SenderMessage: Text[1000];
//     //     FileDirectory: Text[100];
//     //     FileName: Text[100];
//     //     CustEmail: Text[100];
//     //     ProcNote: Text[1000];
//     //     LoginDetails: Text[1000];
//     //     CompanyDetails: Text[250];
//     //     SupplierDetails: Text[1000];
//     //     Vendors: Record Vendor;
//     //     ProjectApprovalSetup: Record "Project Approval Setup";
//     //     ApprovalEntry: Record "Approval Entry";
//     //     InternalProjectResource: Record "Internal Project Resource";
//     //     Employee: Record Employee;
//     //     RMSManagement: Codeunit "RMS Management";
//     //     RecVariant: Variant;
//     //     RecID: RecordID;
//     //     ReleaseApprovalDocument: Codeunit "Release Approval Document";
//     //     UserSetup: Record "User Setup";
//     //     EmailNotifications: Codeunit "Email Notifications";
//     //     CustomApprovalEntry: Record "Custom Approval Entry";
//     //     TXT0001: label 'An approval request has been sent and approvers notified successfully.';
//     //     TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';
//     //     DocumentType: Option " ","Commenncement Order","Communication Plan","Staff Appointments","Internal Staff Disengement","Staff Disengagement","Mobilization Checklist","Mobilization Checklist Status Report","Professional Indemnity","Work Execution Plan","HSE Plan",RMP,QMP,"Contract Supervision Requirement","Site Agent Nomination","Contractor Key Personnel Appointment","Equipment Delivery To Site","Insurance of Works","Advance Payment Guarantee","Performance Guarantee","Equipment Tracking";

//     // local procedure FnSuggestProjectTeam()
//     // begin
//     //     FnSuggestProjectTeams();
//     // end;

//     // local procedure FnGetTableNo(): Integer
//     // var
//     //     RecID: RecordID;
//     //     RecRef: RecordRef;
//     // begin
//     //     RecRef.Open(Database::"Project Mobilization Header");
//     //     if RecRef.Find('-') then begin
//     //         RecID := RecRef.RecordId;
//     //  end;
//   //       exit(RecID.TableNo);
//     // end;

//     // procedure FnGetLargestSequenceNoFromApprovalEntry(DocumentNo: Code[50]): Integer
//     // var
//     //     CustomApprovalEntry: Record "Custom Approval Entry";
//     // begin
//     //     CustomApprovalEntry.Reset;
//     //     CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .",DocumentNo);
//     //     if CustomApprovalEntry.FindLast then
//     //         exit(CustomApprovalEntry."Sequence No.");
//     // end;

//     // local procedure FnNotifyRejectionEmailCustom()
//     // begin
//     //     /*CompanyInformation.GET;
//     //     ApprovalEntry.RESET;
//     //     ApprovalEntry.SETRANGE(ApprovalEntry.{"Document No""Document No");}
//     //     ApprovalEntry.SETRANGE(ApprovalEntry.Status,ApprovalEntry.Status::Rejected);
//     //     IF ApprovalEntry.FINDSET THEN BEGIN
//     //       IF UserSetup.GET(ApprovalEntry."Sender ID") THEN BEGIN
//     //         IF UserSetup."E-Mail" <> '' THEN BEGIN
//     //            EmailNotifications.FnSendEmail(CompanyInformation."E-Mail",COMPANYNAME,UserSetup."E-Mail",'REJECTION APROVALS:','This approval has been rejected.'+ ' '+ApprovalEntry."Document No.");
//     //           END;
//     //         END;
//     //       END;*/

//     // end;

//     // local procedure FnNotifyDelegationEmailCustom()
//     // begin
//     //     CompanyInformation.Get;
//     //     ApprovalEntry.Reset;
//     //     ApprovalEntry.SetRange(ApprovalEntry."Document No .","Plan ID");
//     //     ApprovalEntry.SetRange(ApprovalEntry.Stat us,ApprovalEntry.Status::Rejected);
//     //     if ApprovalEntry.FindSet then begin
//     //         if UserSetup.Get(ApprovalEntry."Sender ID") then begin
//     //             if UserSetup."E-Mail" <> '' then begin
//     //                 EmailNotifications.FnSendEmail(CompanyInformation."E-Mai COMPANYNAME, ME,UserSetup."E-Mai 'DELEGATION APROVALS:', 'This approval has been delegated.' + ' ' +  '+ApprovalEntry."Document No.");
//     //             end;
//     //         end;
//     //     end;
//     // end;

//     // local procedure UpdateCustomApprovalEntryHistory(CustomApprovalEntry: Record "Custom Approval Entry")
//     // var
//     //     CustomApprovalEntryHistory: Record "Custom Approval Entry History";
//     // begin
//     //     CustomApprovalEntryHistory.Init;
//     //     CustomApprovalEntryHistory."Entry N := 0;
//            CustomApprovalEntryHistory."Old Entry  := ":=CustomApprovalEntry."Entry No.";
//     //     CustomApprovalEntryHistory."Table  := ":=CustomApprovalEntry."Table ID";
//     //     CustomApprovalEntryHistory."Document Ty := ":=CustomApprovalEntry."Document Type";
//     //     CustomApprovalEntryHistory."Document N := ":=CustomApprovalEntry."Document No.";
//     //     CustomApprovalEntryHistory."Sender  := ":=CustomApprovalEntry."Sender ID";
//     //     CustomApprovalEntryHistory."Date-Time Sent for Approv := ":=CustomApprovalEntry."Date-Time Sent for Approval";
//     //     CustomApprovalEntryHistory."Last Modified By User  := ":=CustomApprovalEntry."Last Modified By User ID";
//     //     CustomApprovalEntryHistory."Last Date-Time Modifi := ":=CustomApprovalEntry."Last Date-Time Modified";
//     //     CustomApprovalEntryHistory."Due Da := ":=CustomApprovalEntry."Due Date";
//     //     CustomApprovalEntryHistory.Amo := t:=CustomApprovalEntry.Amount;
//     //     CustomApprovalEntryHistory."Record ID to Appro := ":=CustomApprovalEntry."Record ID to Approve";
//     //     CustomApprovalEntryHistory."Approval Ty := ":=CustomApprovalEntry."Approval Type";
//     //     CustomApprovalEntryHistory."Sequence N := ":=CustomApprovalEntry."Sequence No.";
//     //     CustomApprovalEntryHistory.Sta := s:=CustomApprovalEntry.Status;
//     //     CustomApprovalEntryHistory."Approver  := ":=CustomApprovalEntry."Approver ID";
//     //     CustomApprovalEntryHistory.Insert(true);
//     // end;

//     // local procedure FnSuggestProjectTeams()
//     // begin
//     //     /*ProjectStaffAppointmentLine.RESET;
//     //     ProjectStaffAppointmentLine.SETRANGE(ProjectStaffAppointmentLine."Document No.","Staff Appointment Voucher No.");
//     //     IF ProjectStaffAppointmentLine.FINDSET THEN
//     //       REPEAT
//     //         PCOInternalProjectTeam.INIT;
//     //         PCOInternalProjectTeam."Commencement Order No.":="Document No.";
//     //         PCOInternalProjectTeam."Resource No.":=ProjectStaffAppointmentLine."Resource No.";
//     //         PCOInternalProjectTeam.Name:=ProjectStaffAppointmentLine.Name;
//     //         PCOInternalProjectTeam.Email:=ProjectStaffAppointmentLine.Email;
//     //         PCOInternalProjectTeam.Designation:=ProjectStaffAppointmentLine.Designation;
//     //         PCOInternalProjectTeam."Role Code":=ProjectStaffAppointmentLine."Role Code";
//     //         PCOInternalProjectTeam.INSERT(TRUE);
//     //       UNTIL ProjectStaffAppointmentLine.NEXT =0;*/

//     // end;
//}

