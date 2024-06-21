#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
//Page 69460 "HSE Plan Calendar"
//{
//     // PageType = Card;
//     // SourceTable = UnknownTable69429;

//     // layout
//     // {
//     //     area(content)
//     //     {
//     //         group(General)
//     //         {
//     //             field("Plan I D";"Plan ID")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("OSH Activity Typ e";"OSH Activity Type")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Line No .";"Line No.")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field(Descripti on;Description)
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Primary Missio n";"Primary Mission")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field(Responsibili ty;Responsibility)
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Overall Owner I D";"Overall Owner ID")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Planned Start Dat e";"Planned Start Date")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Planned Due Dat e";"Planned Due Date")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Action Statu s";"Action Status")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("% Complet e";"% Complete")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Activity Priorit y";"Activity Priority")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Actual Date Don e";"Actual Date Done")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Venue/Locatio n";"Venue/Location")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Meeting Mediu m";"Meeting Medium")
//     //             {
//     //                 ApplicationArea = Basic;
//     //             }
//     //             field("Evacuation Event I D";"Evacuation Event ID")
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
//     //                 /*TESTFIELD(Status,Status::Open);
//     //                 RecVariant:=Rec;
//     //                 RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVariant,"Project ID",DocumentType::"Work Execution Plan","Project ID",ApprovalEntry."Document Type"::PCO,0,RECORDID,FnGetTableNo());
//     //                 Status:=Status::"Pending Approval";
//     //                 MODIFY(TRUE);
//     //                 EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEntry,"Project ID");
//     //                 MESSAGE(TXT0001);*/

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
//     //                 /*TESTFIELD(Status,Status::"Pending Approval");
//     //                 TESTFIELD("Created By",USERID);

//     //                 CustomApprovalEntry.RESET;
//     //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Document No.","Project ID");
//     //                 CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Record ID to Approve",RECORDID);
//     //                 CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
//     //                 IF CustomApprovalEntry.FINDSET THEN
//     //                   REPEAT
//     //                     OldStatus := ApprovalEntry.Status;
//     //                     CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Canceled;
//     //                     CustomApprovalEntry.MODIFY(TRUE);
//     //                    UNTIL CustomApprovalEntry.NEXT=0;

//     //                 //Notify The User
//     //                 EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
//     //                 Status:=Status::Open;
//     //                 MODIFY(TRUE);

//     //                 MESSAGE(TXT0002);*/

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
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Project ID");
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry.Stat us,CustomApprovalEntry.Status::Approved);
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No .",FnGetLargestSequenceNoFromApprovalEntry("Project ID"));
//     //                 Message(Format(FnGetLargestSequenceNoFromApprovalEntry("Project ID")));
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
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Project ID");
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approv e",RecordId);
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry.Stat us,CustomApprovalEntry.Status::Open);
//     //                 if CustomApprovalEntry.FindSet then begin
//     //                  currentRecEntryNo := o:=CustomApprovalEntry."Sequence No.";
//     //                 end;//Added

//     //                 ApprovalsMgmt.FnRejectRecordApprovalRequest(RecordId);

//     //                 CustomApprovalEntry.Reset;
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Project ID");
//     //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approv e",RecordId);
//     //                 //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
//     //                 if CustomApprovalEntry.FindSet then
//     //                  repeat
//         //                     CustomApprovalEntry.Sta := s:=CustomApprovalEntry.Status::Rejected;
//     //                         CustomApprovalEntry.Modify(true);
//     //                     until CustomApprovalEntry.N = xt=0;

//     //                 //Status:=Status::Open;
//     //                 Modify(true);

//     //                 //Added part 2
//     //                 if currentRecEntr > No>1 then begin
//     //                     CustomApprovalEntry.Reset;
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Project ID");
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
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Project ID");
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
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No .","Project ID");
//     //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approv e",RecordId);
//     //                  //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
//       //                   if CustomApprovalEntry.FindSet then
//     //                      repeat
//           //                       CustomApprovalEntry.Sta := s:=CustomApprovalEntry.Status::Rejected;
//     //                             CustomApprovalEntry.Modify(true);
//     //                         until CustomApprovalEntry.N = 0;

//                         //Status:=Status::Open;
//       //                   Modify(true);
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
//     //         action("Reject Document")
//     //         {
//     //             ApplicationArea = Basic;
//     //             Image = Reject;
//     //             Promoted = true;
//     //             PromotedCategory = Process;
//     //             PromotedIsBig = true;

//     //             trigger OnAction()
//     //             begin
//     //                 /*TESTFIELD("Rejection Remarks");
//     //                 Rejected:=TRUE;
//     //                 "Rejected By":=USERID;
//     //                 MODIFY();
//     //                 MESSAGE('Document Rejected.');*/

//     //             end;
//     //         }
//     //     }
//     // }

//     // var
//     //     PavementChartEntry: Record "Pavement Chart Entry";
//     //     DetailedPavemetTestLine: Record "Detailed Pavemet Test Line";
//     //     DMSManagement: Codeunit "DMS Management";
//     //     ProcProcess: Codeunit "Procurement Processing";
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
//     //     DocumentType: Option " ","Commenncement Order","Communication Plan","Staff Appointments","Internal Staff Disengement","Staff Disengagement","Mobilization Checklist","Mobilization Checklist Status Report","Professional Indemnity","Work Execution Plan","HSE Plan",RMP,QMP,"Contract Supervision Requirement","Site Agent Nomination","Contractor Key Personnel Appointment","Equipment Delivery To Site","Insurance of Works","Advance Payment Guarantee","Performance Guarantee","Equipment Tracking";
//     //     TXT0001: label 'An approval request has been sent and approvers notified successfully.';
//     //     TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';
//     //     "Document No.": Code[10];
//     //     "Project ID": Code[10];
//     //     "Contract ID": Code[10];

//     // local procedure FnPostPavementTest()
//     // begin
//     //     DetailedPavemetTestLine.Reset;
//     //     DetailedPavemetTestLine.SetRange(DetailedPavemetTestLine."Document No .","Document No.");
//     //     if DetailedPavemetTestLine.FindSet then
//     //      repeat
//         //         PavementChartEntry.Init;
//     //             PavementChartEntry."Enrty N := ":=PavementChartEntry.Co + 1;
//         //         PavementChartEntry."Project  := "Project ID";
//         //         PavementChartEntry."Contractor  := "Contract ID";
//         //         PavementChartEntry."Test Da := ":=DetailedPavemetTestLine."Test Date";
//     //             PavementChartEntry."Survey Da := ":=DetailedPavemetTestLine."Survey Date";
//     //             PavementChartEntry."Layer Co := ":=DetailedPavemetTestLine."Layer Code";
//     //             PavementChartEntry."Layer Descripti := ":=DetailedPavemetTestLine."Layer Description";
//     //             PavementChartEntry."Layer Test Co := ":=DetailedPavemetTestLine."Layer Test Code";
//     //             PavementChartEntry."Test Descripti := ":=DetailedPavemetTestLine."Layer Test Description";
//     //             PavementChartEntry.Res := t:=DetailedPavemetTestLine."Test Result";
//     //             PavementChartEntry."Deviation(m := ":=DetailedPavemetTestLine."Level Deviation";
//     //             PavementChartEntry."Layer Toleran := ":=DetailedPavemetTestLine."Layer Tolerance";
//     //             PavementChartEntry.Chain := e:=DetailedPavemetTestLine."Chainage(KM)";
//     //             if PavementChartEntry.Res <> 0 then
//             //         PavementChartEntry.Insert(true);
//     //         until DetailedPavemetTestLine.N = xt=0;
//     // end;

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
//     //     CompanyInformation.Get;
//     //     ApprovalEntry.Reset;
//     //     ApprovalEntry.SetRange(ApprovalEntry."Document No .","Project ID");
//     //     ApprovalEntry.SetRange(ApprovalEntry.Stat us,ApprovalEntry.Status::Rejected);
//     //     if ApprovalEntry.FindSet then begin
//     //         if UserSetup.Get(ApprovalEntry."Sender ID") then begin
//     //             if UserSetup."E-Mail" <> '' then begin
//     //                 EmailNotifications.FnSendEmail(CompanyInformation."E-Mai COMPANYNAME, ME,UserSetup."E-Mai 'REJECTION APROVALS:', 'This approval has been rejected.' + ' ' +  '+ApprovalEntry."Document No.");
//     //             end;
//     //         end;
//     //     end;
//     // end;

//     // local procedure FnNotifyDelegationEmailCustom()
//     // begin
//     //     CompanyInformation.Get;
//     //     ApprovalEntry.Reset;
//     //     ApprovalEntry.SetRange(ApprovalEntry."Document No .","Project ID");
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

