#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95094 "Risk Status Report"
{
    PageType = Card;
    SourceTable = "Risk M&E Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Risk Register Type"; "Risk Register Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; "Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Report Start Date"; "Report Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Report End Date"; "Report End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                    //             }
                    //         }
                    //         part(Control20;"Risk Status Report Lines")
                    //         {
                    //             Caption = 'Open Risk Status';
                    //             SubPageLink = "Document Type"=field("Document Type"),
                    //                           "Document No"=field("Document No");
                    //         }
                    //         part(Control14;"RMP Line Response Actions")
                    //         {
                    //             Caption = 'Risk Response Action Status';
                    //             SubPageLink = "Document Type"=field("Document Type"),
                    //                           "Document No"=field("Document No");
                    //         }
                    //     }
                    // }

                    // actions
                    // {
                    //     area(navigation)
                    //     {
                    //         action("Suggest Open Risks")
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = Suggest;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;

                    //             trigger OnAction()
                    //             begin
                    //                 RiskManagement.FnSuggestOpenRisks(RiskStatusReportLine,Rec);
                    //                 RiskManagement.FnSuggestOpenRSRRiskResponseActionStatus(RiskStatusReportLine,Rec,RiskStatusRptRespAction);
                    //                 Message('Suggested successfully');
                    //             end;
                    //         }
                    //         action("Log New Risk Incidents")
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = Log;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;
                    //         }
                    //         action(Approvals)
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = Approvals;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;

                    //             trigger OnAction()
                    //             begin
                    //                 Message('Success');
                    //             end;
                    //         }
                    //         action(Release)
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = ReleaseDoc;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;

                    //             trigger OnAction()
                    //             begin
                    //                 Message('Success');
                    //             end;
                    //         }
                    //         action(Reopen)
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = ReOpen;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;

                    //             trigger OnAction()
                    //             begin
                    //                 Message('Success');
                    //             end;
                    //         }
                    //         action(Post)
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = Post;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;

                    //             trigger OnAction()
                    //             begin
                    //                  TestField(Posted,false);
                    //                  TestField("Risk Management Plan ID");
                    //                  TestField(Status,Status::Released);
                    //                 RiskManagement.FnUpdateRMPFromRSR(RiskManagementPlanLine,Rec,NewRiskVoucherLine,RiskStatusReportLine);
                    //                 //RiskManagement.FnUpdateRiskOwnership(Rec,NewRiskVoucherLine,RiskStatusReportLine,NewRiskLineOwnership);
                    //                 RiskManagement.FnUpdateRiskResponseActionsRSR(Rec,NewRiskVoucherLine,RiskStatusReportLine,NewRiskLineResponseAction,RiskStatusRptRespAction);
                    //                 RiskManagement.FnUpdateRiskRILedgerEntry(Rec,NewRiskVoucherLine,RiskStatusReportLine,NewRiskLineResponseAction,RiskStatusRptRespAction,RiskStatusRptIncident);
                    //                 Message('Document %1 posted successfully',"Document No");
                    //                 Message('RMP %1 updated successfully',"Risk Management Plan ID");

                    //                 Posted:=true;
                    //                 "Posting Date":=Today;
                    //                 Modify;
                    //             end;
                    //         }
                    //         action(Print)
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = Print;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;

                    //             trigger OnAction()
                    //             begin
                    //                 Reset;
                    //                 SetRange("Document No","Document No");
                    //                 Report.Run(95007,true,true,Rec);
                    //             end;
                    //         }
                    //         action(Dimensions)
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = Dimensions;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;

                    //             trigger OnAction()
                    //             begin
                    //                 Message('Success');
                    //             end;
                    //         }
                    //         action("Risk Incident Ledger Entries")
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = LedgerEntries;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;
                    //         }
                    //         action("Send Approval Request")
                    //         {
                    //             ApplicationArea = Basic;
                    //             Ellipsis = true;
                    //             Image = SendApprovalRequest;
                    //             Promoted = true;
                    //             PromotedCategory = Category4;
                    //             PromotedIsBig = true;
                    //             PromotedOnly = true;

                    //             trigger OnAction()
                    //             begin
                    //                 TestField(Status,Status::Open);
                    //                 RecVariant:=Rec;
                    //                 RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVariant,"Project ID",Documenttype::"Work Execution Plan","Project ID",ApprovalEntry."document type"::PCO,0,RecordId,FnGetTableNo());
                    //                 Status:=Status::"Pending Approval";
                    //                 Modify(true);
                    //                 EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEntry,"Project ID");
                    //                 Message(TXT0001);
                    //             end;
                    //         }
                    //         action("Cancel Approval Request")
                    //         {
                    //             ApplicationArea = Basic;
                    //             Ellipsis = true;
                    //             Image = CancelApprovalRequest;
                    //             Promoted = true;
                    //             PromotedCategory = Category4;
                    //             PromotedIsBig = true;
                    //             PromotedOnly = true;

                    //             trigger OnAction()
                    //             var
                    //                 RecRef: RecordRef;
                    //                 CustomApprovalEntry: Record "Custom Approval Entry";
                    //                 OldStatus: Option;
                    //             begin
                    //                 TestField(Status,Status::"Pending Approval");
                    //                 TestField("Created By",UserId);

                    //                 CustomApprovalEntry.Reset;
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
                    //                 CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                    //                 if CustomApprovalEntry.FindSet then
                    //                   repeat
                    //                     OldStatus := ApprovalEntry.Status;
                    //                     CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Canceled;
                    //                     CustomApprovalEntry.Modify(true);
                    //                    until CustomApprovalEntry.Next=0;

                    //                 //Notify The User
                    //                 EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                    //                 Status:=Status::Open;
                    //                 Modify(true);

                    //                 Message(TXT0002);
                    //             end;
                    //         }
                    //         action("Project Approvals")
                    //         {
                    //             ApplicationArea = Basic;
                    //             Ellipsis = true;
                    //             Image = Approvals;
                    //             Promoted = true;
                    //             PromotedCategory = Category4;
                    //             PromotedIsBig = true;
                    //             PromotedOnly = true;

                    //             trigger OnAction()
                    //             begin
                    //                 ApprovalsMgmt.FnOpenApprovalEntriesPage(RecordId);
                    //             end;
                    //         }
                    //         action(Approve)
                    //         {
                    //             ApplicationArea = Suite;
                    //             Caption = 'Approve';
                    //             Image = Approve;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;
                    //             Scope = Repeater;
                    //             ToolTip = 'Approve the requested changes.';

                    //             trigger OnAction()
                    //             var
                    //                 CustomApprovalEntry: Record "Custom Approval Entry";
                    //                 ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //             begin
                    //                 //CurrPage.SETSELECTIONFILTER(CustomApprovalEntry);
                    //                 ApprovalsMgmt.FnApproveRecordApprovalRequest(RecordId);

                    //                 CustomApprovalEntry.Reset;
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry.Status,CustomApprovalEntry.Status::Approved);
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.",FnGetLargestSequenceNoFromApprovalEntry("Project ID"));
                    //                 Message(Format(FnGetLargestSequenceNoFromApprovalEntry("Project ID")));
                    //                 if CustomApprovalEntry.FindFirst then
                    //                   begin
                    //                 //      ReleaseApprovalDocument.ReleaseSAVReq(Rec);
                    //                    end;
                    //             end;
                    //         }
                    //         action(Reject)
                    //         {
                    //             ApplicationArea = Suite;
                    //             Caption = 'Reject';
                    //             Image = Reject;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;
                    //             Scope = Repeater;
                    //             ToolTip = 'Reject the approval request.';

                    //             trigger OnAction()
                    //             var
                    //                 ApprovalEntry: Record "Custom Approval Entry";
                    //                 ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //                 currentRecEntryNo: Integer;
                    //                 CustomApprovalEntryChange: Record "Custom Approval Entry History";
                    //             begin
                    //                 //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //                 //Added
                    //                 //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //                 //Added
                    //                 CustomApprovalEntry.Reset;
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry.Status,CustomApprovalEntry.Status::Open);
                    //                 if CustomApprovalEntry.FindSet then begin
                    //                    currentRecEntryNo:=CustomApprovalEntry."Sequence No.";
                    //                 end;//Added

                    //                 ApprovalsMgmt.FnRejectRecordApprovalRequest(RecordId);

                    //                 CustomApprovalEntry.Reset;
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
                    //                 //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                    //                 if CustomApprovalEntry.FindSet then
                    //                   repeat
                    //                     CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Rejected;
                    //                     CustomApprovalEntry.Modify(true);
                    //                   until CustomApprovalEntry.Next=0;

                    //                 Status:=Status::Open;
                    //                 Modify(true);

                    //                 //Added part 2
                    //                 if currentRecEntryNo>1 then begin
                    //                 CustomApprovalEntry.Reset;
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
                    //                 CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.",currentRecEntryNo);
                    //                 if CustomApprovalEntry.FindSet then begin
                    //                   repeat
                    //                    UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                    //                    CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Created;
                    //                    CustomApprovalEntry.Modify();
                    //                   until CustomApprovalEntry.Next=0;
                    //                 end;

                    //                 end;

                    //                 if currentRecEntryNo>1 then begin
                    //                     CustomApprovalEntry.Reset;
                    //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
                    //                     CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
                    //                     CustomApprovalEntry.SetFilter(CustomApprovalEntry."Sequence No.",'<%1',currentRecEntryNo);
                    //                     if CustomApprovalEntry.FindSet then begin
                    //                       repeat

                    //                         if (CustomApprovalEntry."Sequence No."=(currentRecEntryNo-1)) then begin
                    //                            CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Open;
                    //                         end
                    //                         else if (CustomApprovalEntry."Sequence No.">currentRecEntryNo) then begin
                    //                            CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Created;
                    //                         end else begin
                    //                            CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Approved;
                    //                         end;
                    //                         UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                    //                        CustomApprovalEntry.Modify();

                    //                       until CustomApprovalEntry.Next=0;
                    //                     end;
                    //                 end;
                    //                 if currentRecEntryNo=1 then begin
                    //                   CustomApprovalEntry.Reset;
                    //                   CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
                    //                   CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
                    //                   //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                    //                   if CustomApprovalEntry.FindSet then
                    //                     repeat
                    //                       CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Rejected;
                    //                       CustomApprovalEntry.Modify(true);
                    //                     until CustomApprovalEntry.Next=0;

                    //                   Status:=Status::Open;
                    //                   Modify(true);
                    //                 end;
                    //                 //Added part 2

                    //                 EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);


                    //                 Find
                    //             end;
                    //         }
                    //         action(Delegate)
                    //         {
                    //             ApplicationArea = Suite;
                    //             Caption = 'Delegate';
                    //             Image = Delegate;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;
                    //             Scope = Repeater;
                    //             ToolTip = 'Delegate the approval to a substitute approver.';

                    //             trigger OnAction()
                    //             var
                    //                 ApprovalEntry: Record "Custom Approval Entry";
                    //                 ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //                 Selected: Integer;
                    //                 USetup: Record "User Setup";
                    //                 Options: Text;
                    //                 "Count": Integer;
                    //                 SelectedUser: Code[50];
                    //                 Region: Text;
                    //             begin
                    //                 //Added
                    //                     Options:='Default Substitute,';
                    //                     //Get Region
                    //                     USetup.Reset;
                    //                     USetup.SetRange("User ID",UserId);
                    //                     if USetup.Find('-') then begin
                    //                         Region:=SelectedUser;
                    //                     end;

                    //                     USetup.Reset;
                    //                     USetup.SetRange("Region Code",Region);
                    //                     if USetup.Find('-') then begin
                    //                       repeat

                    //                       Options:=Options+USetup."User ID"+',';

                    //                     until USetup.Next=0;
                    //                     end;


                    //                 Selected := Dialog.StrMenu(Options, 1, 'Select User');

                    //                     USetup.Reset;
                    //                     USetup.SetRange("Region Code",Region);
                    //                     if USetup.Find('-') then begin repeat
                    //                        Count:=Count+1;
                    //                       if Selected = Count+1 then begin
                    //                         SelectedUser:=USetup."User ID";
                    //                       end;
                    //                     until USetup.Next=0;
                    //                     end;

                    //                     USetup.Reset;
                    //                     USetup.SetRange("User ID",UserId);
                    //                     if USetup.Find('-') then begin
                    //                         USetup."Substitute Selected":=true;
                    //                         USetup."Selected Substitute":=SelectedUser;
                    //                         USetup.Modify();
                    //                     end;
                    //                 //Added

                    //                 //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //                 ApprovalsMgmt.FnDelegateRecordApprovalRequest(RecordId);
                    //                 EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);
                    //             end;
                    //         }
                    //         action("Reject Document")
                    //         {
                    //             ApplicationArea = Basic;
                    //             Image = Reject;
                    //             Promoted = true;
                    //             PromotedCategory = Process;
                    //             PromotedIsBig = true;

                    //             trigger OnAction()
                    //             begin
                    //                 /*TESTFIELD("Rejection Remarks");
                    //                 Rejected:=TRUE;
                    //                 "Rejected By":=USERID;
                    //                 MODIFY();
                    //                 MESSAGE('Document Rejected.');*/

                    //             end;
                    //         }
                    //     }
                    // }

                    // trigger OnNewRecord(BelowxRec: Boolean)
                    // begin
                    //     "Document Type":="document type"::"Risk Status Report";
                    // end;

                    // var
                    //     RiskManagement: Codeunit "Risk Management";
                    //     RiskManagementPlanLine: Record "Risk Management Plan Line";
                    //     RiskMEHeader: Record "Risk M&E Header";
                    //     NewRiskVoucherLine: Record "New Risk Voucher Line";
                    //     RiskStatusReportLine: Record "Risk Status Report Line";
                    //     NewRiskLineOwnership: Record "New Risk Line Ownership";
                    //     NewRiskLineResponseAction: Record "New Risk Line Resp. Action";
                    //     NewRiskLineJobTask: Record "New Risk Line Job Task";
                    //     RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action";
                    //     RiskStatusRptIncident: Record "Risk Status Rpt Incident";
                    //     ObjRiskMgt: Codeunit "Risk Management";
                    //     RMPLine: Record "Risk Management Plan Line";
                    //     DMSManagement: Codeunit "DMS Management";
                    //     ProcProcess: Codeunit "Procurement Processing";
                    //     DocType: Record "DMS Documents";
                    //     OpenApprovalEntriesExistCurrUser: Boolean;
                    //     OpenApprovalEntriesExist: Boolean;
                    //     OpenApprovalEntriesExistForCurrUser: Boolean;
                    //     CanCancelApprovalForRecord: Boolean;
                    //     CanRequestApprovalForFlow: Boolean;
                    //     CanCancelApprovalForFlow: Boolean;
                    //     RMS: Codeunit "RMS Management";
                    //     ShowWorkflowStatus: Boolean;
                    //     PRN: Record "Purchase Header";
                    //     ProcCommType: Record "Procurement Committee Types";
                    //     IfsCommitteMembers: Record "IFS Tender Committee Member";
                    //     NoOfMembers: Integer;
                    //     ProjectStaffAppointment: Record "Project Staff Appointment";
                    //     ProjectStaffAppointList: Page "Project Staff Appoint. List";
                    //     ProjectStaffVoucher: Record "Project Staff Voucher";
                    //     ProjectStaffTerminationLine: Record "Project Staff Termination Line";
                    //     ProcurementProcessing: Codeunit "Procurement Processing";
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //     ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
                    //     PCOInternalProjectTeam: Record "PCO Internal Project Team";
                    //     PCORequiredDocument: Record "PCO Required Document";
                    //     ProjectDocumentTemplate: Record "Project Document Template";
                    //     ProjectDocumentTemplateLine: Record "Project Document Template Line";
                    //     ObjJob: Record Job;
                    //     ProjectMobilizationHeader: Record "Project Mobilization Header";
                    //     WEPExecutionSchedule: Record "WEP Execution Schedule";
                    //     JobPlanningLine: Record "Job Planning Line";
                    //     NoSeriesManagement: Codeunit NoSeriesManagement;
                    //     RoadManagementSetup: Record "Road Management Setup";
                    //     ProjectMeetingRegister: Record "Project Meeting Register";
                    //     PCOPlannedMeeting: Record "PCO Planned Meeting";
                    //     SMTPMailSetup: Record "Email Account";
                    //     SMTPMail: Codeunit Mail;
                    //     EmailBody: Text[250];
                    //     acknowledgementtabvisible: Boolean;
                    //     ProjectMeetingAgendaTemp: Record "Project Meeting Agenda Temp";
                    //     MeetingAgendaItemTemplate: Record "Meeting Agenda Item Template";
                    //     ProjectMeetingAgenda: Record "Project Meeting Agenda";
                    //     ProjectMeetingSummary: Record "Project Meeting Summary";
                    //     CompanyInformation: Record "Company Information";
                    //     HumanResourcesSetup: Record "Human Resources Setup";
                    //     Window: Dialog;
                    //     BodyText: Text[250];
                    //     mymail: Codeunit Mail;
                    //     WindowisOpen: Boolean;
                    //     FileDialog: Codeunit Mail;
                    //     SendingDate: Date;
                    //     SendingTime: Time;
                    //     Counter: Integer;
                    //     cu400: Codeunit Mail;
                    //     SenderAddress: Text[100];
                    //     RequesterName: Text[100];
                    //     RequesterEmail: Text[100];
                    //     emailhdr: Text[100];
                    //     SenderMessage: Text[1000];
                    //     FileDirectory: Text[100];
                    //     FileName: Text[100];
                    //     CustEmail: Text[100];
                    //     ProcNote: Text[1000];
                    //     LoginDetails: Text[1000];
                    //     CompanyDetails: Text[250];
                    //     SupplierDetails: Text[1000];
                    //     Vendors: Record Vendor;
                    //     ProjectApprovalSetup: Record "Project Approval Setup";
                    //     ApprovalEntry: Record "Approval Entry";
                    //     InternalProjectResource: Record "Internal Project Resource";
                    //     Employee: Record Employee;
                    //     RMSManagement: Codeunit "RMS Management";
                    //     RecVariant: Variant;
                    //     RecID: RecordID;
                    //     ReleaseApprovalDocument: Codeunit "Release Approval Document";
                    //     UserSetup: Record "User Setup";
                    //     EmailNotifications: Codeunit "Email Notifications";
                    //     CustomApprovalEntry: Record "Custom Approval Entry";
                    //     DocumentType: Option " ","Commenncement Order","Communication Plan","Staff Appointments","Internal Staff Disengement","Staff Disengagement","Mobilization Checklist","Mobilization Checklist Status Report","Professional Indemnity","Work Execution Plan","HSE Plan",RMP,QMP,"Contract Supervision Requirement","Site Agent Nomination","Contractor Key Personnel Appointment","Equipment Delivery To Site","Insurance of Works","Advance Payment Guarantee","Performance Guarantee","Equipment Tracking";
                    //     TXT0001: label 'An approval request has been sent and approvers notified successfully.';
                    //     TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';

                    // local procedure FnSuggestProjectTeam()
                    // begin
                    //     FnSuggestProjectTeams();
                    // end;

                    // local procedure FnGetTableNo(): Integer
                    // var
                    //     RecID: RecordID;
                    //     RecRef: RecordRef;
                    // begin
                    //     RecRef.Open(Database::"Project Mobilization Header");
                    //     if RecRef.Find('-') then begin
                    //       RecID := RecRef.RecordId;
                    //       end;
                    //       exit(RecID.TableNo);
                    // end;

                    // procedure FnGetLargestSequenceNoFromApprovalEntry(DocumentNo: Code[50]): Integer
                    // var
                    //     CustomApprovalEntry: Record "Custom Approval Entry";
                    // begin
                    //     CustomApprovalEntry.Reset;
                    //     CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.",DocumentNo);
                    //     if CustomApprovalEntry.FindLast then
                    //       exit(CustomApprovalEntry."Sequence No.");
                    // end;

                    // local procedure FnNotifyRejectionEmailCustom()
                    // begin
                    //     CompanyInformation.Get;
                    //     ApprovalEntry.Reset;
                    //     ApprovalEntry.SetRange(ApprovalEntry."Document No.",Rec."Project ID");
                    //     ApprovalEntry.SetRange(ApprovalEntry.Status,ApprovalEntry.Status::Rejected);
                    //     if ApprovalEntry.FindSet then begin
                    //       if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                    //         if UserSetup."E-Mail" <> '' then begin
                    //            EmailNotifications.FnSendEmail(CompanyInformation."E-Mail",COMPANYNAME,UserSetup."E-Mail",'REJECTION APROVALS:','This approval has been rejected.'+ ' '+ApprovalEntry."Document No.");
                    //           end;
                    //         end;
                    //       end;
                    // end;

                    // local procedure FnNotifyDelegationEmailCustom()
                    // begin
                    //     CompanyInformation.Get;
                    //     ApprovalEntry.Reset;
                    //     ApprovalEntry.SetRange(ApprovalEntry."Document No.","Project ID");
                    //     ApprovalEntry.SetRange(ApprovalEntry.Status,ApprovalEntry.Status::Rejected);
                    //     if ApprovalEntry.FindSet then begin
                    //       if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                    //         if UserSetup."E-Mail" <> '' then begin
                    //            EmailNotifications.FnSendEmail(CompanyInformation."E-Mail",COMPANYNAME,UserSetup."E-Mail",'DELEGATION APROVALS:','This approval has been delegated.'+ ' '+ApprovalEntry."Document No.");
                    //           end;
                    //         end;
                    //       end;
                    // end;

                    // local procedure UpdateCustomApprovalEntryHistory(CustomApprovalEntry: Record "Custom Approval Entry")
                    // var
                    //     CustomApprovalEntryHistory: Record "Custom Approval Entry History";
                    // begin
                    //           CustomApprovalEntryHistory.Init;
                    //           CustomApprovalEntryHistory."Entry No.":=0;
                    //           CustomApprovalEntryHistory."Old Entry No":=CustomApprovalEntry."Entry No.";
                    //           CustomApprovalEntryHistory."Table ID":=CustomApprovalEntry."Table ID";
                    //           CustomApprovalEntryHistory."Document Type":=CustomApprovalEntry."Document Type";
                    //           CustomApprovalEntryHistory."Document No.":=CustomApprovalEntry."Document No.";
                    //           CustomApprovalEntryHistory."Sender ID":=CustomApprovalEntry."Sender ID";
                    //           CustomApprovalEntryHistory."Date-Time Sent for Approval":=CustomApprovalEntry."Date-Time Sent for Approval";
                    //           CustomApprovalEntryHistory."Last Modified By User ID":=CustomApprovalEntry."Last Modified By User ID";
                    //           CustomApprovalEntryHistory."Last Date-Time Modified":=CustomApprovalEntry."Last Date-Time Modified";
                    //           CustomApprovalEntryHistory."Due Date":=CustomApprovalEntry."Due Date";
                    //           CustomApprovalEntryHistory.Amount:=CustomApprovalEntry.Amount;
                    //           CustomApprovalEntryHistory."Record ID to Approve":=CustomApprovalEntry."Record ID to Approve";
                    //           CustomApprovalEntryHistory."Approval Type":=CustomApprovalEntry."Approval Type";
                    //           CustomApprovalEntryHistory."Sequence No.":=CustomApprovalEntry."Sequence No.";
                    //           CustomApprovalEntryHistory.Status:=CustomApprovalEntry.Status;
                    //           CustomApprovalEntryHistory."Approver ID":=CustomApprovalEntry."Approver ID";
                    //           CustomApprovalEntryHistory.Insert(true);
                    // end;

                    // local procedure FnSuggestProjectTeams()
                    // begin
                    //     /*ProjectStaffAppointmentLine.RESET;
                    //     ProjectStaffAppointmentLine.SETRANGE(ProjectStaffAppointmentLine."Document No.","Staff Appointment Voucher No.");
                    //     IF ProjectStaffAppointmentLine.FINDSET THEN
                    //       REPEAT
                    //         PCOInternalProjectTeam.INIT;
                    //         PCOInternalProjectTeam."Commencement Order No.":="Document No.";
                    //         PCOInternalProjectTeam."Resource No.":=ProjectStaffAppointmentLine."Resource No.";
                    //         PCOInternalProjectTeam.Name:=ProjectStaffAppointmentLine.Name;
                    //         PCOInternalProjectTeam.Email:=ProjectStaffAppointmentLine.Email;
                    //         PCOInternalProjectTeam.Designation:=ProjectStaffAppointmentLine.Designation;
                    //         PCOInternalProjectTeam."Role Code":=ProjectStaffAppointmentLine."Role Code";
                    //         PCOInternalProjectTeam.INSERT(TRUE);
                    //       UNTIL ProjectStaffAppointmentLine.NEXT =0;*/

                    // end;
                }
            }
        }
    }
}
//   var
//       PurchaseRequisitionTemplate: Record "Purchase Requisition Template";
//       NoSeriesManagement: Codeunit NoSeriesManagement;
//       ProcurementSetup: Record "Procurement Setup";
//       RoadWorkProgram: Record "Road Work Program";
//       ProjectRoadLink: Record "Project Road Link";
//       ObjProjectRoadLink: Record "Project Road Link";
//       ExcelBuf: Record "Excel Buffer" temporary;
//       TotalNet: Decimal;
//       BanknameEFT: Option "   ",NIC,CBA,EQUITY;
//       TempExcelBuffer: Record "Excel Buffer" temporary;
//       datestring: Text[20];
//       KBABranchCode: Code[10];
//       RowNo: Integer;
//       GLBudgetEntry: Record "G/L Budget Entry";
//       ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//       NSMgt: Codeunit NoSeriesManagement;


//   procedure FnSuggestRICSExistingRoadLinks(RICSCounty: Record "RICS County"; RoadInventory: Record "Road Inventory"; RICSExistingRoadLinkLine: Record "RICS Existing Road Link Line"; RICSExistingRoadLink: Record "RICS Existing Road Link"; RICSNo: Code[50])
//   begin
//       with RICSCounty do begin
//           repeat
//               RoadInventory.Reset;
//               RoadInventory.SetRange(RoadInventory."Primary Region ID", RICSCounty."Region Code");
//               if RoadInventory.FindSet then
//                   repeat
//                       RICSExistingRoadLinkLine.Init;
//                       RICSExistingRoadLinkLine."RICS No." := RICSNo;
//                   //RICSExistingRoadLinkLine.
//                   until RoadInventory.Next = 0;

//           until RICSCounty.Next = 0;
//       end;
//   end;


//   procedure PostStaffAppointment(StaffAppointment: Record "Project Staff Voucher")
//   var
//       InternalProjectResources: Record "Internal Project Resource";
//       ProjectStaffLines: Record "Project Staff Appointment Line";
//   begin
//       InternalProjectResources.Reset;
//       InternalProjectResources.SetRange("Project ID", StaffAppointment."Project ID");
//       if InternalProjectResources.FindSet then begin
//           InternalProjectResources.DeleteAll;
//       end;
//       ProjectStaffLines.Reset;
//       ProjectStaffLines.SetRange("Document No.", StaffAppointment."Document No.");
//       if ProjectStaffLines.FindSet then begin
//           repeat
//               InternalProjectResources.Init;
//               InternalProjectResources."Project ID" := StaffAppointment."Project ID";
//               InternalProjectResources."Resource No." := ProjectStaffLines."Resource No.";
//               InternalProjectResources.Name := ProjectStaffLines.Name;
//               InternalProjectResources.Email := ProjectStaffLines.Email;
//               InternalProjectResources."Resource Type" := InternalProjectResources."resource type"::Person;
//               InternalProjectResources."Role Code" := ProjectStaffLines."Role Code";
//               InternalProjectResources.Designation := ProjectStaffLines.Designation;
//               InternalProjectResources."Staff Category" := ProjectStaffLines."Staff Category";
//               InternalProjectResources."Project Manager" := ProjectStaffLines."Project Manager";
//               InternalProjectResources."User ID" := ProjectStaffLines."User ID";
//               InternalProjectResources.Telephone := ProjectStaffLines.Telephone;
//               InternalProjectResources.Status := InternalProjectResources.Status::Active;
//               InternalProjectResources."Appointment Document No." := StaffAppointment."Document No.";
//               InternalProjectResources."Appointment Date" := StaffAppointment."Document Date";
//               InternalProjectResources.Active := true;
//               InternalProjectResources.Insert(true);
//           until ProjectStaffLines.Next = 0;

//       end;
//       StaffAppointment.Posted := true;
//       StaffAppointment.Modify;
//       //notify the appointed members
//       FnSendProjectStaffAppointmentNotification(StaffAppointment);

//       Message('Project Staff Appointment register No: %1 Has been been posted Successfully', StaffAppointment."Document No.");
//   end;


//   // procedure FnSendProjectStaffAppointmentNotification(StaffAppointment: Record "Project Staff Voucher")
//   var
//       SupplierReq: Record Contact;
//       LastFieldNo: Integer;
//       FooterPrinted: Boolean;
//       FileDirectory: Text[100];
//       FileName: Text[100];
//       ReportID: Integer;
//       "Object": Record "Object";
//       Window: Dialog;
//       RunOnceFile: Text[1000];
//       TimeOut: Integer;
//       Customer2: Record Customer;
//       Cust: Record Customer;
//       cr: Integer;
//       lf: Integer;
//       EmailBody: array[2] of Text[30];
//       BodyText: Text[250];
//       mymail: Codeunit Mail;
//       DefaultPrinter: Text[200];
//       WindowisOpen: Boolean;
//       //FileDialog: Codeunit Mail;
//       SendingDate: Date;
//       SendingTime: Time;
//       Counter: Integer;
//       // cu400: Codeunit Mail;
//       DocLog: Record "Document E-mail Log";
//       BranchName: Code[80];
//       DimValue: Record "Dimension Value";
//       SenderAddress: Text[100];
//       CustEmail: Text[100];
//       UserSetup: Record "User Setup";
//       HRSetup: Record "Company Information";
//       Emp: Record Vendor;
//       PayrollMonth: Date;
//       PayrollMonthText: Text[30];
//       PayPeriodtext: Text;
//       PayPeriod: Record "Payroll PeriodX";
//       CompInfo: Record "Company Information";
//       DateFilter: Text;
//       FromDate: Date;
//       ToDate: Date;
//       FromDateS: Text;
//       ToDateS: Text;
//       vend: Record Vendor;
//       StartDate: Date;
//       EndDAte: Date;
//       EmailVerifier: Codeunit Payroll3;
//       IsEmailValid: Boolean;
//       PPayableSetup: Record "Procurement Setup";
//       RequesterName: Text[100];
//       RequesterEmail: Text[100];
//       emailhdr: Text[100];
//       CompanyDetails: Text[250];
//       SupplierDetails: Text[1000];
//       SenderMessage: Text[1000];
//       ProcNote: Text[1000];
//       LoginDetails: Text[1000];
//       PortalUser: Record "Dynasoft Portal User";
//       Password: Text[50];
//       ActivationDetails: Text[1000];
//       StaffAppointmentLine: Record "Project Staff Appointment Line";
//       IFS: Record "Standard Purchase Code";
//       CommitteType: Record "Procurement Committee Types";
//   begin
//       ///Notifying Procurement Team on supplier Request
//          CompInfo.Get;
//          HRSetup.Get;
//          PPayableSetup.Get;

//       StaffAppointmentLine.Reset;
//       StaffAppointmentLine.SetRange(StaffAppointmentLine."Document No.",StaffAppointment."Document No.");
//       //StaffAppointmentLine.SETRANGE(StaffAppointmentLine."Resource No.",StaffAppointmentLine."Resource No.");
//       if StaffAppointmentLine.FindSet then
//         repeat
//       StaffAppointmentLine.TestField(Email);
//       RequesterEmail:=StaffAppointmentLine.Email;
//       RequesterName:=StaffAppointmentLine.Name;
//       Window.Open('Notifying the Team...',StaffAppointmentLine.Name);
//       WindowisOpen := true;
//       Counter:=Counter+1;

//       //Create message
//       if HRSetup."E-Mail"='' then
//         Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
//        SenderAddress:=HRSetup."E-Mail";
//       if PPayableSetup."Default Proc Email Contact" = '' then
//         Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
//         CustEmail:=PPayableSetup."Default Proc Email Contact";

//       CompanyDetails:='Dear,  '+ RequesterName;
//       SenderMessage:='<BR>You have been successfully appointed to serve on the project below, appointment No:'+StaffAppointment."Document No."+'</BR>';
//       SupplierDetails:='<BR>Appointment Reference No:'+StaffAppointment."Document No."+'</BR>'+'<BR> Type:'+Format(StaffAppointment."Document Type")+'</BR>'+
//       '<BR>Role: '+Format(StaffAppointmentLine."Role Code")+'</BR>'+
//       '<BR>Designation: '+Format(StaffAppointmentLine.Designation)+'</BR>'+
//       '<BR>Appointment Effective Date: '+Format(StaffAppointment."Document Date")+'</BR>'+
//       '<BR>Start Date: '+Format(StaffAppointment."Project Start Date")+'</BR>'+
//       '<BR>End Date: '+Format(StaffAppointment."Project End Date")+'</BR>'+
//       '<BR>Project Name: '+StaffAppointment."Project Name"+'</BR>'+
//       //'<BR>Road: '+StaffAppointment."Road Code"+'</BR>'+
//       //'<BR>Start Date: '+StaffAppointment."Road Section No."+'</BR>'+
//       '<BR>Appointing Authority: '+StaffAppointment."Appointing Authority"+'</BR>';

//       LoginDetails:='Attached herein, please find an e-copy of your appointment letter';


//       ProcNote:='<BR> If you require any assistance, please contact the technical team';

//       FileDirectory :=  'C:\DOCS\';
//       FileName := 'AppointmentLetter_'+StaffAppointmentLine."Document No."+'.pdf';
//        Report.SaveAsPdf(72003,FileDirectory+FileName,StaffAppointmentLine);



//       if CustEmail='' then
//        exit;

//       //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
//       emailhdr:='Project Appointment (Reference No: '+StaffAppointment."Document No."+')';

//       cu400.CreateMessage(CompInfo.Name,SenderAddress,CustEmail,emailhdr,
//       CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);
//       cu400.AddCC(RequesterEmail);
//       cu400.AddAttachment(FileDirectory+FileName,FileName);
//       cu400.AddBodyline(ProcNote);
//       cu400.Send;
//       SendingDate:=Today;
//       SendingTime:=Time;
//       StaffAppointmentLine."Notified on Email":=true;
//       StaffAppointmentLine."Date/Time Notified":=CurrentDatetime;
//       StaffAppointmentLine.Modify(true);
//       Sleep(1000);
//       Window.Close;
//       until StaffAppointmentLine.Next=0;
//       //END;
//   end;


//   procedure SuggestStaffTermination(RMS: Record "Project Staff Voucher")
//   var
//       AppointmentLine: Record "Project Staff Appointment Line";
//       TerminationLine: Record "Project Staff Termination Line";
//       Appointment: Record "Project Staff Voucher";
//   begin
//       TerminationLine.Reset;
//       TerminationLine.SetRange("Document No.",RMS."Document No.");
//       if TerminationLine.FindSet then begin
//         TerminationLine.DeleteAll;
//         end;
//       Appointment.Reset;
//       Appointment.SetRange("Project ID",RMS."Project ID");
//       if Appointment.FindSet then begin
//       AppointmentLine.Reset;
//       AppointmentLine.SetRange("Document No.",Appointment."Document No.");
//       if AppointmentLine.FindSet then begin
//         repeat
//           TerminationLine.Init;
//           TerminationLine."Document No.":=RMS."Document No.";
//           //TerminationLine."Line No":=AppointmentLine.
//           TerminationLine."Resource No.":=AppointmentLine."Resource No.";
//           TerminationLine.Name:=AppointmentLine.Name;
//           TerminationLine."Termination  Date":=RMS."Document Date";
//           //TerminationLine."Termination Category":=
//           //TerminationLine."Termination Details":=
//           TerminationLine.Email:=AppointmentLine.Email;
//           TerminationLine."Appointment Document No.":=AppointmentLine."Document No.";
//           TerminationLine."Project Start Date":=Appointment."Project Start Date";
//           TerminationLine."Project End Date":=Appointment."Project End Date";
//           TerminationLine."Role Code":=AppointmentLine."Role Code";
//           TerminationLine.Designation:=AppointmentLine.Designation;
//           TerminationLine."Staff Category":=AppointmentLine."Staff Category";
//           TerminationLine.Insert(true);
//         until AppointmentLine.Next=0;
//         end;
//       end;
//   end;


//   procedure FnSuggestMeasurementLines(ObjJobPlanningLines: Record "Job Planning Line";ObjMPHeader: Record "Measurement &  Payment Header";MeasurementPaymentHeader: Record "Measurement &  Payment Header")
//   var
//       MeasurementPaymentLine: Record "Measurement & Payment Line";
//       MeasurementSheetBillCode: Record "Measurement Sheet Bill Code";
//   begin
//       with ObjJobPlanningLines do begin
//         MeasurementSheetBillCode.Reset;
//         MeasurementSheetBillCode.SetRange(MeasurementSheetBillCode."Bill Item Category Code",'BILL04');
//         if MeasurementSheetBillCode.Find('-') then begin
//           ObjMPHeader.Reset;
//           ObjMPHeader.SetRange("Project ID",ObjJobPlanningLines."Job No.");
//           if ObjMPHeader.FindSet then begin
//           repeat
//             MeasurementPaymentLine.Init;
//             MeasurementPaymentLine."Document Type":=MeasurementPaymentLine."document type"::"Measurement Sheet";
//             MeasurementPaymentLine."Document No":=ObjMPHeader."Document No.";
//             MeasurementPaymentLine."Job No.":=ObjMPHeader."Project ID";
//             MeasurementPaymentLine."Job Task No.":="Job Task No.";
//             MeasurementPaymentLine."Line No.":="Line No.";
//             MeasurementPaymentLine.Type:=MeasurementPaymentLine.Type::" ";
//             MeasurementPaymentLine."No.":="No.";
//             Message(MeasurementPaymentLine."No.");
//             MeasurementPaymentLine.Description:=Description;
//             MeasurementPaymentLine."Unit of Measure Code":="Unit of Measure";
//             MeasurementPaymentLine.Validate("Unit of Measure Code");
//             MeasurementPaymentLine."Contract Quantity":="Unit Cost";
//             MeasurementPaymentLine."Bill Item Category Code":="Road Activity Categories";
//             MeasurementPaymentLine."Direct Unit Cost (LCY)":="Unit Cost";
//             MeasurementPaymentLine."Gen. Prod. Posting Group":="Gen. Prod. Posting Group";
//             MeasurementPaymentLine."Technology Type":="Road Technology";
//             MeasurementPaymentLine.Insert(true);
//           until MeasurementSheetBillCode.Next =0;
//           end;
//           end;
//         end;
//         Message('Success');
//   end;


//   procedure FnPostMeasurementSheet(ObjMPEntry: Record "Measurement & Payment Entry";ObjMPLine: Record "Measurement & Payment Line";ObjMPHeader: Record "Measurement &  Payment Header")
//   begin
//       with ObjMPHeader do begin
//       ObjMPLine.Reset;
//       ObjMPLine.SetRange(ObjMPLine."Document Type",ObjMPHeader."Document Type");
//       ObjMPLine.SetRange(ObjMPLine."Document No",ObjMPHeader."Document No.");
//       if ObjMPLine.Find('-') then
//         repeat
//           ObjMPEntry.Init;
//           ObjMPEntry.TransferFields(ObjMPLine);
//           ObjMPEntry.Reset;
//           ObjMPEntry.SetRange("Document No","Document No.");
//           if  ObjMPEntry.FindLast then
//           ObjMPEntry."Entry No":=ObjMPEntry."Entry No"+100;
//           ObjMPEntry."Posting Date":="Document Date";
//           ObjMPEntry."Posted By":=UpperCase(UserId);
//           ObjMPEntry.Posted:=true;
//           ObjMPEntry.Insert(true);
//           until ObjMPLine.Next =0;
//           //MESSAGE(FORMAT(ObjMPEntry));
//         ObjMPHeader.Posted:=true;
//         ObjMPHeader.Validate(Posted);
//        ObjMPHeader."Posted By":=UpperCase(UserId);
//       end;
//   end;


//   procedure FnSuggestWEPSchedule(WEPExecutionSchedule: Record "WEP Execution Schedule";WorkExecutionPlan: Record "Project Mobilization Header")
//   var
//       JobPlanningLine: Record "Job Planning Line";
//   begin
//         JobPlanningLine.Reset;
//         JobPlanningLine.SetRange(JobPlanningLine."Job No.",WorkExecutionPlan."Project ID");
//         if JobPlanningLine.FindSet then begin
//           WEPExecutionSchedule.Reset;
//           WEPExecutionSchedule.SetRange("Document No",WorkExecutionPlan."Document No.");
//           if WEPExecutionSchedule.FindSet then
//             WEPExecutionSchedule.DeleteAll;
//           repeat
//             WEPExecutionSchedule.Init;
//             WEPExecutionSchedule."Document Type":=WEPExecutionSchedule."document type"::"Work Execution Programme";
//             WEPExecutionSchedule."Document No":=WorkExecutionPlan."Document No.";
//             WEPExecutionSchedule."Line No":=WEPExecutionSchedule.Count+100;
//             WEPExecutionSchedule."Job No":=WorkExecutionPlan."Project ID";
//             WEPExecutionSchedule."Job Task No":=JobPlanningLine."Job Task No.";
//             WEPExecutionSchedule."Job Task Type":=WEPExecutionSchedule."job task type"::Posting;
//             WEPExecutionSchedule.Description:=JobPlanningLine.Description;
//             WEPExecutionSchedule."Budget (Total Cost)":=JobPlanningLine."Unit Cost";
//             WEPExecutionSchedule.Insert(true);
//            until JobPlanningLine.Next=0;
//         end;
//   end;


//   procedure FnSuggestContractorPaymentRequests(MeasurementPaymentHeader: Record "Measurement &  Payment Header";MeasurementPaymentLine: Record "Measurement & Payment Line")
//   var
//       MeasurementPaymentEntry: Record "Measurement & Payment Entry";
//   begin
//       with MeasurementPaymentHeader do begin
//         MeasurementPaymentEntry.Reset;
//         MeasurementPaymentEntry.SetRange("Posting Date","From Date","To Date");
//         if MeasurementPaymentEntry.FindSet then
//           repeat
//             MeasurementPaymentLine.Init;
//             MeasurementPaymentLine."Document No":="Document No.";
//             MeasurementPaymentLine."Document Type":="Document Type";
//             MeasurementPaymentLine."Job No.":=MeasurementPaymentEntry."Job No.";
//             MeasurementPaymentLine."Job Task No.":=MeasurementPaymentEntry."Job Task No.";
//             MeasurementPaymentLine.Reset;
//             MeasurementPaymentLine.SetRange(MeasurementPaymentLine."Document No","Document No.");
//             if MeasurementPaymentLine.FindSet then begin
//               MeasurementPaymentLine."Line No.":=MeasurementPaymentLine."Line No."+100;
//               end;
//             MeasurementPaymentLine.Type:=MeasurementPaymentLine.Type::" ";
//             MeasurementPaymentLine."No.":=MeasurementPaymentEntry."No.";
//             MeasurementPaymentLine.Description:=MeasurementPaymentEntry.Description;
//             MeasurementPaymentLine."Unit of Measure Code":=MeasurementPaymentEntry."Unit of Measure Code";
//             MeasurementPaymentLine."Measurement Type":=MeasurementPaymentEntry."Measurement Type";
//             MeasurementPaymentLine."Linear/Unit Quantity":=MeasurementPaymentEntry."Linear/Unit Quantity";
//             MeasurementPaymentLine."Length (m)":=MeasurementPaymentEntry."Length (m)";
//             MeasurementPaymentLine."Width (m)":=MeasurementPaymentEntry."Width (m)";
//             MeasurementPaymentLine."Height/Depth (m)":=MeasurementPaymentEntry."Height/Depth (m)";
//             MeasurementPaymentLine.Insert(true);

//           until MeasurementPaymentEntry.Next=0;
//         end;
//   end;


//   procedure SuggestBoQTemplateLines(BoQ: Record "Purchase Requisition Template")
//   var
//       BoQLines: Record "Requisition Template Line";
//       BoQBillCodes: Record "BoQ Template Bill Code";
//       items: Record Item;
//       EntryNo: Integer;
//   begin
//       BoQLines.Reset;
//       if BoQLines.FindLast then
//       EntryNo:=BoQLines."Line No.";

//       BoQLines.Reset;
//       BoQLines.SetRange("Requisition Template ID",BoQ.Code);
//       if BoQLines.FindSet then
//         BoQLines.DeleteAll;

//       BoQBillCodes.Reset;
//       BoQBillCodes.SetRange("BoQ Template Code",BoQ.Code);
//       if BoQBillCodes.FindSet then begin
//         repeat
//           items.Reset;
//           items.SetRange("Item Category Code",BoQBillCodes."Bill Item Category Code");
//           if items.FindSet then begin
//             repeat
//               BoQLines.Init;
//               BoQLines."Requisition Template ID":=BoQ.Code;
//               BoQLines."Line No.":=EntryNo+1;
//               BoQLines.Type:=BoQLines.Type::Item;
//               BoQLines."No.":=items."No.";
//               BoQLines.Description:=items.Description;
//               //BoQLines.Quantity:=1;
//               BoQLines."Unit of Measure Code":=items."Base Unit of Measure";
//               //BoQLines."Technology Type":=
//               //BoQLines."Unit Amount Excl. VAT":=
//               BoQLines."Shortcut Dimension 1 Code":=items."Global Dimension 1 Code";
//               BoQLines."Shortcut Dimension 2 Code":=items."Global Dimension 2 Code";
//               //BoQLines."Variant Code":=item
//               //BoQLines."Dimension Set ID":=items.dim
//               BoQLines."Item Category Code":=items."Item Category Code";
//               //BoQLines."Default Contingency %":=
//               BoQLines."Gen. Prod. Posting Group":=items."Gen. Prod. Posting Group";
//               BoQLines."VAT Prod. Posting Group":=items."VAT Prod. Posting Group";
//               BoQLines."Default Job Task No.":=BoQBillCodes."Default Job Task No";
//               BoQLines.Insert(true);
//               EntryNo+=1;
//               until items.Next=0;
//             end;

//           until BoQBillCodes.Next=0;

//       end;
//   end;


//   procedure copyPurchaseRequisition(RequisitionTemp: Record "Purchase Requisition Template";TemplateID: Code[20])
//   var
//       WorkCategory: Record "BoQ Template Work Category";
//       PurchWorkCategory: Record "BoQ Template Work Category";
//       BoQBillCodes: Record "BoQ Template Bill Code";
//       PurchBillCodes: Record "BoQ Template Bill Code";
//       RequisitionLines: Record "Requisition Template Line";
//       PurchRequisitionLines: Record "Requisition Template Line";
//   begin

//       WorkCategory.Reset;
//       WorkCategory.SetRange("BoQ Template Code",TemplateID);
//       if WorkCategory.FindSet then begin
//         repeat
//         PurchWorkCategory.Init;
//         PurchWorkCategory.TransferFields(WorkCategory);
//         PurchWorkCategory."BoQ Template Code":=RequisitionTemp.Code;
//         PurchWorkCategory.Insert(true);
//         until WorkCategory.Next=0;
//         end;

//       BoQBillCodes.Reset;
//       BoQBillCodes.SetRange("BoQ Template Code",TemplateID);
//       if BoQBillCodes.FindSet then begin
//         repeat
//           PurchBillCodes.Init;
//           PurchBillCodes.TransferFields(BoQBillCodes);
//           PurchBillCodes."BoQ Template Code":=RequisitionTemp.Code;
//           PurchBillCodes.Insert(true);
//           until BoQBillCodes.Next=0;

//         end;


//       RequisitionLines.Reset;
//       RequisitionLines.SetRange("Requisition Template ID",TemplateID);
//       if RequisitionLines.FindSet then begin
//         repeat

//           PurchRequisitionLines.Init;
//           PurchRequisitionLines.TransferFields(RequisitionLines);
//           PurchRequisitionLines."Requisition Template ID":=RequisitionTemp.Code;
//           PurchRequisitionLines.Insert(true);
//           until RequisitionLines.Next=0;

//         end;

//       Message('Document Copied Successfully');
//   end;


//   procedure FnUpdateRoadProgramBudget(RoadProgram: Record "Road Work Program";Budget: Code[20])
//   var
//       RoadBudget: Record "Road Program G/L budget";
//       RoadBudgetSetup: Record "Road G/L budget Setup";
//   begin
//       RoadBudget.Reset;
//       RoadBudget.SetRange("Road Work Program",RoadProgram.Code);
//       if RoadBudget.FindSet then
//         RoadBudget.DeleteAll;

//       RoadBudgetSetup.Reset;
//       RoadBudgetSetup.SetRange("Road Project Category",RoadBudgetSetup."road project category"::"Maitenance Works");
//       RoadBudgetSetup.SetFilter("G/L Account No.",'<>%1','');
//       if RoadBudgetSetup.FindSet then begin
//       repeat
//         RoadBudget.Init;
//         RoadBudget."Road Work Program":=RoadProgram.Code;
//         RoadBudget."G/L Account No.":=RoadBudgetSetup."G/L Account No.";
//         RoadBudget."Road Project Category":=RoadBudgetSetup."Road Project Category";
//         RoadBudget."G/L Budget ID":=Budget;
//         RoadBudget.Insert(true);
//         until RoadBudgetSetup.Next=0;
//         end;

//       RoadBudgetSetup.Reset;
//       RoadBudgetSetup.SetRange("Road Project Category",RoadBudgetSetup."road project category"::"Construction Works");
//       RoadBudgetSetup.SetFilter("G/L Account No.",'<>%1','');
//       if RoadBudgetSetup.FindSet then begin
//       repeat
//         RoadBudget.Init;
//         RoadBudget."Road Work Program":=RoadProgram.Code;
//         RoadBudget."G/L Account No.":=RoadBudgetSetup."G/L Account No.";
//         RoadBudget."Road Project Category":=RoadBudgetSetup."Road Project Category";
//         RoadBudget."G/L Budget ID":=Budget;
//         RoadBudget.Insert(true);
//         until RoadBudgetSetup.Next=0;
//         end;
//   end;


//   procedure CheckBudgetCeiling(RoadProgram: Record "Road Work Program")
//   var
//       RoadBudget: Record "Road Program G/L budget";
//       RoadBudgetSetup: Record "Road G/L budget Setup";
//       ToatalGLAmount: Decimal;
//   begin
//       ToatalGLAmount:=0;
//       RoadBudget.Reset;
//       RoadBudget.SetRange("Road Work Program",RoadProgram.Code);
//       RoadBudget.SetRange("Road Project Category",RoadProgram."Road Project Category");
//       if RoadBudget.FindSet then
//        begin
//         repeat
//           RoadBudget.CalcFields("Budgeted Amount");
//           ToatalGLAmount+=RoadBudget."Budgeted Amount"
//         until RoadBudget.Next=0;
//        end;

//       RoadProgram.CalcFields("Total Budget Ceiling") ;
//       RoadProgram."Total Financial Budget":=ToatalGLAmount;
//       RoadProgram.Modify(true);

//       if RoadProgram."Total Budget Ceiling" > RoadProgram."Total Financial Budget" then
//         Error('The amount on Budget lines must not be more than Financial Budget ');
//   end;


//   procedure fnUpdateMaintenanceWorkplan(RoadProgram: Record "Road Work Program")
//   var
//       RoadBudget: Record "Road Program G/L budget";
//       RoadBudgetSetup: Record "Road G/L budget Setup";
//       ToatalGLAmount: Decimal;
//       WorkpLan: Record "Road Work Program";
//   begin
//       WorkpLan.Reset;
//       WorkpLan.SetRange("Global Budget Book Id",RoadProgram."Global Budget Book Id");
//       if not WorkpLan.FindSet then
//         begin
//           WorkpLan.Init;
//           WorkpLan.TransferFields(RoadProgram);
//           WorkpLan.Code:='';
//           WorkpLan."Document Type":=WorkpLan."document type"::"Global Budget Book";
//           WorkpLan."Road Project Category":=WorkpLan."road project category"::"Maitenance Works";
//           WorkpLan.Insert(true);
//          end;
//   end;


//   procedure FnCheckWorkPlanLinesExist(RWPackage: Record "New Road Work Program Package";RWPNo: Code[50])
//   begin
//       RWPackage.Reset;
//       RWPackage.SetRange(RWPackage."Road Work Program ID",RWPNo);
//       if not RWPackage.FindLast then
//         Error('Please enter atleast one line');
//   end;


//   procedure fnUpdateConstructionWorkplan(RoadProgram: Record "Road Work Program")
//   var
//       RoadBudget: Record "Road Program G/L budget";
//       RoadBudgetSetup: Record "Road G/L budget Setup";
//       ToatalGLAmount: Decimal;
//       WorkpLan: Record "Road Work Program";
//   begin
//       WorkpLan.Reset;
//       WorkpLan.SetRange("Global Budget Book Id",RoadProgram."Global Budget Book Id");
//       if not WorkpLan.FindSet then
//         begin
//           WorkpLan.Init;
//           WorkpLan.TransferFields(RoadProgram);
//           WorkpLan.Code:='';
//           WorkpLan."Document Type":=WorkpLan."document type"::"Global Budget Book";
//           WorkpLan."Road Project Category":=WorkpLan."road project category"::"Construction Works";
//           WorkpLan.Insert(true);
//          end;
//   end;


//   procedure FnCreateJobsFromWorkPlanLines(ObjRWPlanL: Record "Road WorkPlan Package";Job: Record Job;ObjRWProgramH: Record "Road Work Program")
//   var
//       JobTask: Record "Job Task";
//       JobPlanningLine: Record "Job Planning Line";
//       RMSSetup: Record "Road Management Setup";
//       NewRoadWorkProgramTask: Record "New Road Work Program Task";
//       NewRoadWorkProgramActivity: Record "New Road Work Program Activity";
//   begin
//       ObjRWPlanL.Reset;
//       ObjRWPlanL.SetRange(ObjRWPlanL."Road Work Program ID",ObjRWProgramH.Code);
//       if ObjRWPlanL.FindSet then begin
//         repeat
//           Job.Init;
//           Job."No.":=ObjRWPlanL."Project No";//Should pick from table
//           Job.Description:=ObjRWPlanL."Package Name";
//           Job.Validate(Description);
//           Job."Road Code":=ObjRWPlanL."Road Code";
//           Job.Validate("Road Code");
//           Job."Road Section No":=ObjRWPlanL."Road Section No.";
//           Job."KeRRA Budget Code":=ObjRWPlanL."KeRRA Budget Code";
//           Job."Global Budget Book ID":=ObjRWPlanL."Road Work Program ID";
//           Job.Validate("Road Section No");
//           Job.Status:=Job.Status::Planned;
//           Job."Job Posting Group":=ObjRWProgramH."Job Posting Group";
//           Job."Bill-to Customer No.":=ObjRWProgramH."Contractor Advance Account ID";
//           Job."Type of Project":=ObjRWPlanL."Road Project Category";
//           ObjRWPlanL.CalcFields("Contract Sum");
//           Job."Tender Sum Inc Taxes (LCY)":=ObjRWPlanL."Contract Sum";
//           Job.Validate("Bill-to Customer No.");
//           Job."Contractor No.":=ObjRWProgramH."Contractor No";
//           Job.Validate("Contractor No.");
//           Job."Funding Source":=ObjRWProgramH."Funding Source ID";
//           Job."Road Class ID":=ObjRWPlanL."Road Class";
//           Job."Purchase Contract ID":=ObjRWProgramH."Contract ID";
//           Job.Validate("Purchase Contract ID");
//           ObjRWPlanL.CalcFields("Total Project Cost Exc. VAT");
//           Job."Total Project Cost Excl. VAT":=ObjRWPlanL."Total Project Cost Exc. VAT";
//           Job."Total Project Cost Incl. VAT":=ObjRWPlanL."Total Project Cost Inc. VAT";
//           Job."Contingency Amount":=ObjRWPlanL."Bid Sum 1 Contingency Amount"+ObjRWPlanL."Bid Sum 2 Contingency Amount";
//           Job."Variation of Price Amount":=ObjRWPlanL."Bid Sum 1 VoP Amount"+ObjRWPlanL."Bid Sum 2 VoP Amount";
//           Job."Starting Date":=ObjRWProgramH."Start Date";
//           Job."Ending Date":=ObjRWProgramH."End Date";
//           Job."Global Dimension 1 Code":=ObjRWPlanL."Global Dimension 1 Code";
//           Job."Global Dimension 2 Code":=ObjRWPlanL."Global Dimension 2 Code";
//           Job."Project Location ID":=ObjRWPlanL."Project Location ID";
//           Job."Directorate Code":=ObjRWPlanL."Directorate ID";
//           Job."Department ID":=ObjRWPlanL."Department ID";
//           Job."Type of Project":=ObjRWPlanL."Road Project Category";
//           Job."Workplanned Length":=ObjRWPlanL."Workplanned Length (Km)";
//           Job."Year Code":=ObjRWProgramH."Financial Year Code";
//           Job."Study/Survey Type":=ObjRWPlanL."Study/Survey Type";
//           Job."Request No":=ObjRWPlanL."Request No";
//           Job.Insert(true);

//           //FnCreateTasksFromBOQTemplate(ObjRWPlanL,Job,JobTask,ObjRWProgramH);

//           FnCreateTasksFromT72134(ObjRWPlanL,Job,JobTask,ObjRWProgramH,NewRoadWorkProgramTask,NewRoadWorkProgramActivity);

//           //FnCreateJobPlanningLinesFromBOQTemplates(ObjRWPlanL,Job,JobPlanningLine,ObjRWProgramH,NewRoadWorkProgramActivity);

//           //FnCreateJobPlanningLinesFromT72135(ObjRWPlanL,Job,JobPlanningLine,ObjRWProgramH,NewRoadWorkProgramActivity);

//           until ObjRWPlanL.Next=0;
//           end;




//           ProjectRoadLink.Reset;
//           ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code",ObjRWProgramH.Code);
//           ProjectRoadLink.SetRange(ProjectRoadLink."KeRRA Budget Code",ObjRWProgramH."KeRRA Budget Code");
//           if ProjectRoadLink.FindSet then
//             repeat
//               ObjProjectRoadLink.Init;
//               ObjProjectRoadLink.TransferFields(ProjectRoadLink);
//               ObjProjectRoadLink."KeRRA Budget Code":=ObjRWProgramH."KeRRA Budget Code";
//               ObjProjectRoadLink."Global Budget Book Code":=ObjRWProgramH.Code;
//               if not ProjectRoadLink.Insert(true) then
//                 ProjectRoadLink.Modify(true);
//             until ProjectRoadLink.Next=0;
//   end;


//   procedure FnCreateTasksFromBOQTemplate(ObjRWPL: Record "Road WorkPlan Package";Job: Record Job;JobTask: Record "Job Task";ObjRWPH: Record "Road Work Program")
//   var
//       PRTempH: Record "Purchase Requisition Template";
//       RTLine: Record "Requisition Template Line";
//       ItemCategory: Record "Item Category";
//   begin
//       ObjRWPL.Reset;
//       ObjRWPL.SetRange(ObjRWPL."Road Work Program ID",ObjRWPH.Code);
//       if ObjRWPL.FindSet then
//         begin
//           RTLine.Reset;
//           RTLine.SetRange(RTLine."Requisition Template ID",ObjRWPL."BoQ Template Code" );
//           if RTLine.FindSet then
//             begin
//               repeat
//                 JobTask.Init;
//                 JobTask."Job No.":=Job."No.";
//                 JobTask."Region ID":=ObjRWPH."Region ID";
//                 JobTask."Global Dimension 1 Code":=ObjRWPH."Global Dimension 1 Code";
//                 JobTask.Location:=ObjRWPH."Project Location ID";
//                 ItemCategory.Reset;
//                 ItemCategory.SetRange(ItemCategory."Bill Item Group",true);
//                 if ItemCategory.FindFirst then
//                   begin
//                   JobTask."Job Task No.":=ItemCategory.Code;
//                   JobTask.Description:=ItemCategory.Description;
//                 end;
//                 JobTask.Validate(Description);
//                 JobTask."Job Task Type":=JobTask."job task type"::"Begin-Total";
//                 if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
//                 JobTask.Insert(true);

//                 JobTask.Init;
//                 JobTask."Job No.":=Job."No.";
//                 JobTask."Region ID":=ObjRWPH."Region ID";
//                 JobTask."Global Dimension 1 Code":=ObjRWPH."Global Dimension 1 Code";
//                 JobTask."Job Task No.":=RTLine."Item Category Code";
//                 JobTask.Location:=ObjRWPH."Project Location ID";
//                 ItemCategory.Reset;
//                 ItemCategory.SetRange(ItemCategory.Code,RTLine."Item Category Code");
//                 if ItemCategory.FindSet then
//                 JobTask.Description:=ItemCategory.Description;
//                 JobTask.Validate(Description);
//                 JobTask."Job Task Type":=JobTask."job task type"::Posting;
//                 if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
//                 JobTask.Insert(true);

//                 JobTask.Init;
//                 JobTask."Job No.":=Job."No.";
//                 JobTask."Region ID":=ObjRWPH."Region ID";
//                 JobTask."Global Dimension 1 Code":=ObjRWPH."Global Dimension 1 Code";
//                 JobTask.Location:=ObjRWPH."Project Location ID";
//                 ItemCategory.Reset;
//                 ItemCategory.SetRange(ItemCategory."Bill Item Group",true);
//                 if ItemCategory.FindLast then
//                   begin
//                   JobTask."Job Task No.":=ItemCategory.Code;
//                   JobTask.Description:=ItemCategory.Description;
//                 end;
//                 JobTask.Validate(Description);
//                 JobTask."Job Task Type":=JobTask."job task type"::"End-Total";
//                 if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
//                 JobTask.Insert(true);
//               until RTLine.Next=0;
//             end;
//            end;
//   end;


//   procedure FnCreateJobPlanningLinesFromBOQTemplates(ObjRWPL: Record "Road WorkPlan Package";Job: Record Job;ObjJobPlanLine: Record "Job Planning Line";ObjRWPH: Record "Road Work Program";NewRoadWorkProgramActivity: Record "New Road Work Program Activity")
//   var
//       PRTempH: Record "Purchase Requisition Template";
//       RTLine: Record "Requisition Template Line";
//       ItemCategory: Record "Item Category";
//   begin
//       ObjRWPL.Reset;
//       ObjRWPL.SetRange(ObjRWPL."Road Work Program ID",ObjRWPH.Code);
//       if ObjRWPL.FindSet then
//         begin
//           NewRoadWorkProgramActivity.Reset;
//           NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID",ObjRWPH.Code );
//           NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."BoQ Template Code",ObjRWPL."BoQ Template Code");
//           if NewRoadWorkProgramActivity.FindSet then
//             begin
//               repeat
//                 ObjJobPlanLine.Init;
//                 ObjJobPlanLine."Job No.":=Job."No.";
//                 ObjJobPlanLine."Job Task No.":=NewRoadWorkProgramActivity."Bill Item Category Code";
//                 ObjJobPlanLine."Line No.":=NewRoadWorkProgramActivity."Entry No";
//                 ObjJobPlanLine.Type:=ObjJobPlanLine.Type::Item;
//                 ObjJobPlanLine."No.":=NewRoadWorkProgramActivity."Activity Code";
//                 ObjJobPlanLine.Validate("No.");
//                 ObjJobPlanLine."Line Type":=ObjJobPlanLine."line type"::"Both Budget and Billable";
//                 ObjJobPlanLine.Description:=NewRoadWorkProgramActivity.Description;
//                 ObjJobPlanLine.Validate(Description);
//                 ObjJobPlanLine."Road Activity Sub-Category":=NewRoadWorkProgramActivity."Bill Item Category Code";
//                 ObjJobPlanLine.Quantity:=NewRoadWorkProgramActivity."Planned Quantity";
//                 ObjJobPlanLine.Validate(Quantity);
//                 ObjJobPlanLine."Unit Cost":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
//                 ObjJobPlanLine.Validate("Unit Cost");
//                 ObjJobPlanLine."Direct Unit Cost (LCY)":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
//                 ObjJobPlanLine.Validate("Direct Unit Cost (LCY)");
//                 ObjJobPlanLine."Planning Date":=Today;
//                 ObjJobPlanLine."Document No.":=ObjRWPH.Code;
//                 ObjJobPlanLine."Document Date":=ObjRWPH."Document Date";
//                 ObjJobPlanLine."Road Technology":=NewRoadWorkProgramActivity."Technology Type";
//                 ObjJobPlanLine.Validate("Road Technology");
//                 ObjJobPlanLine."Bill Item No":=NewRoadWorkProgramActivity."Activity Code";
//                 ObjJobPlanLine."Line Type":=ObjJobPlanLine."line type"::"Both Budget and Billable";
//                 ObjJobPlanLine."VAT Bus. Posting Group":=NewRoadWorkProgramActivity."Gen. Prod. Posting Group";
//                 ObjJobPlanLine.Validate("VAT Bus. Posting Group");
//                 ObjJobPlanLine."VAT Prod. Posting Group":=NewRoadWorkProgramActivity."VAT Prod. Posting Group";
//                 ObjJobPlanLine.Validate("VAT Prod. Posting Group");
//                 if not ObjJobPlanLine.Get(ObjJobPlanLine."Job No.",ObjJobPlanLine."Job Task No.",ObjJobPlanLine."Line No.") then
//                 ObjJobPlanLine.Insert(true);
//               until NewRoadWorkProgramActivity.Next=0;
//             end;
//            end;
//   end;


//   procedure FnCreateRWProgramTasksFromBOQTemplate(ObjRWPL: Record "Road WorkPlan Package";Job: Record Job;JobTask: Record "New Road Work Program Task";ObjRWPH: Record "Road Work Program")
//   var
//       PRTempH: Record "Purchase Requisition Template";
//       RTLine: Record "Requisition Template Line";
//       ItemCategory: Record "Item Category";
//   begin
//        ObjRWPL.Reset;
//        ObjRWPL.SetRange(ObjRWPL."Road Work Program ID",ObjRWPH.Code);
//        if ObjRWPL.FindSet then
//         begin
//           repeat
//           RTLine.Reset;
//           RTLine.SetRange(RTLine."Requisition Template ID",ObjRWPL."BoQ Template Code");
//           if RTLine.FindSet  then
//             begin
//                repeat
//                 JobTask.Init;
//                 JobTask."Road Work Program ID":=ObjRWPL."Road Work Program ID";
//                 JobTask."Package No.":=ObjRWPL."Project No";
//                 JobTask."BoQ Template Code":=ObjRWPL."BoQ Template Code";
//                 JobTask."Bill Item Category Code":=RTLine."Item Category Code";
//                 JobTask."Entry No":=JobTask.Count+1;
//                 ItemCategory.Reset;
//                 ItemCategory.SetRange(Code,RTLine."Item Category Code");
//                 if ItemCategory.FindSet then
//                 JobTask.Description:=ItemCategory.Description;
//                 if not JobTask.Get(JobTask."Road Work Program ID",JobTask."Package No.",JobTask."BoQ Template Code", JobTask."Bill Item Category Code") then
//                 JobTask.Insert() ;
//               until RTLine.Next=0;
//             end;
//             until ObjRWPL.Next=0;
//            end;
//   end;


//   procedure FnCreateRWPPlanningLinesFromBOQTemplates(ObjRWPL: Record "Road WorkPlan Package";Job: Record Job;ObjJobPlanLine: Record "New Road Work Program Activity";ObjRWPH: Record "Road Work Program")
//   var
//       PRTempH: Record "Purchase Requisition Template";
//       RTLine: Record "Requisition Template Line";
//       ItemCategory: Record "Item Category";
//   begin
//       ObjRWPL.Reset;
//       ObjRWPL.SetRange(ObjRWPL."Road Work Program ID",ObjRWPH.Code);
//       if ObjRWPL.FindSet then
//         begin
//           repeat
//           RTLine.Reset;
//           RTLine.SetRange(RTLine."Requisition Template ID",ObjRWPL."BoQ Template Code" );
//           if RTLine.FindSet then
//             begin
//                repeat
//                 ObjJobPlanLine.Init;
//                 ObjJobPlanLine."Road Work Program ID":=ObjRWPL."Road Work Program ID";
//                 ObjJobPlanLine."Budget Entry No":=ObjRWPL."Budget Entry No";
//                 ObjJobPlanLine."Project No":=ObjRWPL."Project No";
//                 ObjJobPlanLine."BoQ Template Code":=ObjRWPL."BoQ Template Code";
//                 ObjJobPlanLine."Bill Item Category Code":=RTLine."Item Category Code";
//                 ObjJobPlanLine."Activity Code":=RTLine."No.";
//                 ObjJobPlanLine."Entry No":=ObjJobPlanLine.Count+1;
//                 ObjJobPlanLine.Description:=RTLine.Description;
//                 ObjJobPlanLine.Validate(Description);
//                 ObjJobPlanLine."Planned Quantity":=RTLine.Quantity;
//                 ObjJobPlanLine.Validate("Planned Quantity");
//                 ObjJobPlanLine."Planned Rate (Unit Cost)":=RTLine."Unit Amount Excl. VAT";
//                 ObjJobPlanLine.Validate("Packaged Quantity");
//                 ObjJobPlanLine."Engineer's Rate (Unit Cost)":=RTLine."Unit Amount Excl. VAT";
//                 ObjJobPlanLine.Validate("Engineer's Rate (Unit Cost)");
//                 ObjJobPlanLine."Technology Type":=RTLine."Technology Type";
//                 ObjJobPlanLine.Validate("Technology Type");
//                 ObjJobPlanLine."Gen. Prod. Posting Group":=ObjRWPL."VAT Bus. Posting Group";
//                 ObjJobPlanLine."VAT Prod. Posting Group":=ObjRWPL."VAT Prod. Posting Group";
//                 ObjJobPlanLine."Unit of Measure Code":=RTLine."Unit of Measure Code";
//                 ObjJobPlanLine.Validate("Unit of Measure Code");
//                 ObjJobPlanLine."Contract Type":=ObjJobPlanLine."contract type"::Construction;
//                 //added for reversion type
//                 ObjJobPlanLine."Reversion Type":= RTLine."Reversion Type";
//                 if not ObjJobPlanLine.Insert(true) then
//                 ObjJobPlanLine.Modify(true);
//               until RTLine.Next=0;
//             end;
//             until ObjRWPL.Next=0;
//            end;
//   end;


//   procedure FnPostToProcPlan(ProcPlan: Record "Procurement Plan";ProcPlanLines: Record "Procurement Plan Lines";ProcPlanEntry: Record "Procurement Plan Entry";RWPacage: Record "Road WorkPlan Package";RWProgram: Record "Road Work Program")
//   begin
//       ProcPlanLines.Reset;
//       ProcPlanLines.SetRange("Procurement Plan ID",RWPacage."Procurement Plan ID");
//       if not ProcPlanLines.FindSet then begin

//         end;
//   end;


//   procedure copyToBoQTemplateNew(RequisitionTemp: Record "Purchase Requisition Template";TemplateID: Code[20])
//   var
//       WorkCategory: Record "BoQ Template Work Category";
//       PurchWorkCategory: Record "BoQ Template Work Category";
//       BoQBillCodes: Record "BoQ Template Bill Code";
//       PurchBillCodes: Record "BoQ Template Bill Code";
//       RequisitionLines: Record "Requisition Template Line";
//       PurchRequisitionLines: Record "Requisition Template Line";
//   begin
//       ProcurementSetup.Get;
//       //PurchaseRequisitionTemplate.RESET;
//       // PurchaseRequisitionTemplate.SETRANGE(PurchaseRequisitionTemplate.Code,RequisitionTemp.Code);
//       // IF NOT PurchaseRequisitionTemplate.FINDSET THEN BEGIN
//         PurchaseRequisitionTemplate.Init;
//         PurchaseRequisitionTemplate.TransferFields(RequisitionTemp);
//         PurchaseRequisitionTemplate.Code:=NoSeriesManagement.GetNextNo(ProcurementSetup."Bid Req Template No. Series",Today,true);
//         PurchaseRequisitionTemplate.Blocked:=false;
//         PurchaseRequisitionTemplate."Created By":=UserId;
//         PurchaseRequisitionTemplate."Created Date":=Today;
//         PurchaseRequisitionTemplate."Created Time":=Time;
//         PurchaseRequisitionTemplate.Insert(true);
//         Message(Format(PurchaseRequisitionTemplate));
//         Message(PurchaseRequisitionTemplate.Code);
//       //  END;
//       WorkCategory.Reset;
//       WorkCategory.SetRange("BoQ Template Code",PurchaseRequisitionTemplate.Code);
//       if WorkCategory.FindSet then begin
//         repeat
//         PurchWorkCategory.Init;
//         PurchWorkCategory.TransferFields(WorkCategory);
//         PurchWorkCategory."BoQ Template Code":=PurchaseRequisitionTemplate.Code;
//         PurchWorkCategory.Insert(true);
//         until WorkCategory.Next=0;
//         end;

//       BoQBillCodes.Reset;
//       BoQBillCodes.SetRange("BoQ Template Code",PurchaseRequisitionTemplate.Code);
//       if BoQBillCodes.FindSet then begin
//         repeat
//           PurchBillCodes.Init;
//           PurchBillCodes.TransferFields(BoQBillCodes);
//           PurchBillCodes."BoQ Template Code":=PurchaseRequisitionTemplate.Code;
//           PurchBillCodes.Insert(true);
//           until BoQBillCodes.Next=0;

//         end;


//       RequisitionLines.Reset;
//       RequisitionLines.SetRange("Requisition Template ID",PurchaseRequisitionTemplate.Code);
//       if RequisitionLines.FindSet then begin
//         repeat
//           PurchRequisitionLines.Init;
//           PurchRequisitionLines.TransferFields(RequisitionLines);
//           PurchRequisitionLines."Requisition Template ID":=PurchaseRequisitionTemplate.Code;
//           PurchRequisitionLines.Insert(true);
//           until RequisitionLines.Next=0;

//         end;

//       Message('Document Copied Successfully');
//   end;


//   procedure SuggstFromMultiYearBudget(NewRoadWorkProgramPackage: Record "New Road Work Program Package";DetailedMulti_YearLine: Record "Detailed Multi_Year Line";FinancialYear: Code[50];RoadWorkProgramID: Code[20];RoadWorkProgram: Record "Road Work Program")
//   var
//       ProjectFundingSource: Record "Project Funding Source";
//       ObjProjectFundingSource: Record "Project Funding Source";
//   begin
//       with NewRoadWorkProgramPackage do begin
//         DetailedMulti_YearLine.Reset;
//         //DetailedMulti_YearLine.SETRANGE("Road Work Program ID",RoadWorkProgram."Multi Year Budget ID");
//         DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Financial Year Code",RoadWorkProgram."Financial Year Code");
//        DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Approval Status",DetailedMulti_YearLine."approval status"::Released);
//        DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine.Closed,false);
//         if DetailedMulti_YearLine.FindSet then
//           begin
//                    repeat
//                   "Road Work Program ID":=RoadWorkProgram.Code;
//                   "Package No.":=DetailedMulti_YearLine."Package No.";
//                   "KeRRA Budget Code":=DetailedMulti_YearLine."KeRRA Budget Code";
//                   "Package Name":=DetailedMulti_YearLine."Package Name";
//                   "Road Class":=DetailedMulti_YearLine."Road Class";
//                   "Road Section No.":=DetailedMulti_YearLine."Road Section No.";
//                   "Section Name":=DetailedMulti_YearLine."Section Name";
//                   "Road Works Category":=DetailedMulti_YearLine."Road Works Category";
//                   "Pavement Surface Type":=DetailedMulti_YearLine."Pavement Surface Type";
//                   "Funding Source ID":=DetailedMulti_YearLine."Funding Source ID";
//                   "Start Chainage":=DetailedMulti_YearLine."Start Chainage";
//                   "End Chainage":=DetailedMulti_YearLine."End Chainage";
//                   "Road Project Category":=DetailedMulti_YearLine."Road Project Category";
//                    DetailedMulti_YearLine.CalcFields("Current Budget Amount");
//                   "Total Budget Cost":=DetailedMulti_YearLine."Current Budget Amount";
//                   "County ID":=DetailedMulti_YearLine."County ID";
//                   "Region ID":=DetailedMulti_YearLine."Region ID";
//                    "Constituency ID":=DetailedMulti_YearLine."Constituency ID";
//                    if not Insert(true) then
//                      Modify(true);

//                 //Project funding source
//                 ProjectFundingSource.Reset;
//                 ProjectFundingSource.SetRange(ProjectFundingSource."Road Work Program ID",DetailedMulti_YearLine."Road Work Program ID");
//                 ProjectFundingSource.SetRange(ProjectFundingSource."KeRRA Budget Code",DetailedMulti_YearLine."KeRRA Budget Code");
//                 if ProjectFundingSource.FindSet then begin
//                   repeat
//                     ObjProjectFundingSource.Init;
//                     ObjProjectFundingSource.TransferFields(ProjectFundingSource);
//                     ObjProjectFundingSource."Road Work Program ID":=RoadWorkProgram.Code;
//                     ObjProjectFundingSource."KeRRA Budget Code":=NewRoadWorkProgramPackage."KeRRA Budget Code";
//                     if not ObjProjectFundingSource.Get(ObjProjectFundingSource."Road Work Program ID",ObjProjectFundingSource."KeRRA Budget Code",ObjProjectFundingSource."Funding Source ID") then
//                     ObjProjectFundingSource.Insert(true);
//                   until ProjectFundingSource.Next=0;
//                   end;

//             //Insert the Project Road Links
//             ProjectRoadLink.Reset;
//             ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code",DetailedMulti_YearLine."Road Work Program ID");
//             ProjectRoadLink.SetRange(ProjectRoadLink."KeRRA Budget Code",DetailedMulti_YearLine."KeRRA Budget Code");
//             if ProjectRoadLink.FindSet(true) then
//                repeat
//                  ObjProjectRoadLink.Init;
//                  ObjProjectRoadLink.TransferFields(ProjectRoadLink);
//                  ObjProjectRoadLink."KeRRA Budget Code":=DetailedMulti_YearLine."KeRRA Budget Code";
//                  ObjProjectRoadLink."Global Budget Book Code":=RoadWorkProgram.Code;
//                   if not ObjProjectRoadLink.Insert(true) then
//                    ObjProjectRoadLink.Modify(true);
//                 until ProjectRoadLink.Next=0;




//            until DetailedMulti_YearLine.Next=0;
//            end;
//         end;
//   end;

//   procedure FnPostDailyWorkRecord()
//   begin
//       //FnostDWPLedger...Daily Work Progress Ledger
//       //Daily Weather Condition Ledger
//       //Daily Equipment Ledger
//       //Daily Material Ledger
//       //Daily contractor staff ledger
//       //Daily Labour Register
//       //Daily Visitor Ledger
//       //Project Meeting Register
//       //Risk Incident Ledger
//       //
//   end;

//   procedure FnPostDailyWorkProgressLedger(DailyWorkRecord: Record "Daily Work Record";DailyWorkRecordExecution: Record "Daily Work Record Execution")
//   var
//       DailyWorksProgressLedger: Record "Daily Works Progress Ledger";
//   begin
//       DailyWorkRecordExecution.Reset;
//       DailyWorkRecordExecution.SetRange(DailyWorkRecordExecution."Document No.",DailyWorkRecord."Document No.");
//       if DailyWorkRecordExecution.FindSet then
//         repeat
//           DailyWorksProgressLedger.Init;
//           DailyWorksProgressLedger."Entry No.":=DailyWorksProgressLedger.Count+1;
//           DailyWorksProgressLedger."Daily Work Record ID":=DailyWorkRecord."Document No.";
//           DailyWorksProgressLedger."Job No.":=DailyWorkRecordExecution."Job No.";
//           DailyWorksProgressLedger."Job Task No.":=DailyWorkRecordExecution."Job Task No.";
//           DailyWorksProgressLedger."Line No.":=DailyWorkRecordExecution."Line No.";
//           DailyWorksProgressLedger.Type:=DailyWorkRecordExecution.Type;
//           DailyWorksProgressLedger."No.":=DailyWorkRecordExecution."No.";
//           DailyWorksProgressLedger.Description:=DailyWorkRecordExecution.Description;
//           DailyWorksProgressLedger."Unit of Measure Code":=DailyWorkRecordExecution."Unit of Measure Code";
//           DailyWorksProgressLedger."Bill Item Category Code":=DailyWorkRecordExecution."Bill Item Category Code";
//           DailyWorksProgressLedger."Contract Quantity":=DailyWorkRecordExecution."Contract Quantity";
//           DailyWorksProgressLedger."Quantity Done":=DailyWorkRecordExecution."Quantity Done";
//           DailyWorksProgressLedger."Works Start Chainage":=DailyWorkRecordExecution."Works Start Chainage";
//           DailyWorksProgressLedger."Works End Chainage":=DailyWorkRecordExecution."Works End Chainage";
//           DailyWorksProgressLedger."Additional Comments/Note":=DailyWorkRecordExecution."Additional Comments/Notes";
//           DailyWorksProgressLedger."Photo No.":=DailyWorkRecordExecution."Photo No.";
//           DailyWorksProgressLedger."Posting Date":=DailyWorkRecordExecution."Document Date";
//           DailyWorksProgressLedger."Work Execution Programme ID":=DailyWorkRecord."Work Execution Programme ID";
//           if not DailyWorksProgressLedger.Insert(true) then
//             DailyWorksProgressLedger.Modify(true);
//       until DailyWorkRecordExecution.Next=0;
//   end;

//   procedure FnPostDailyWeatherConditionLedger(DailyWorkRecord: Record "Daily Work Record")
//   var
//       DailyWeatherConditionLedger: Record "Daily Weather Condition Ledger";
//   begin

//       DailyWeatherConditionLedger.Init;
//       DailyWeatherConditionLedger."Entry No.":=DailyWeatherConditionLedger.Count+1;
//       DailyWeatherConditionLedger."Daily Work Record ID":=DailyWorkRecord."Document No.";
//       DailyWeatherConditionLedger."Job No.":=DailyWorkRecord."Project ID";
//       DailyWeatherConditionLedger."Average Temperature":=DailyWorkRecord."Average Temperature";
//       DailyWeatherConditionLedger."Rainfall (mm)":=DailyWorkRecord."Rainfall (mm)";
//       DailyWeatherConditionLedger."Other Weather Condition":=DailyWorkRecord."Other Weather Condition";
//       DailyWeatherConditionLedger."Posting Date":=DailyWorkRecord."Document Date";
//       DailyWeatherConditionLedger."Work Execution Programme ID":=DailyWorkRecord."Work Execution Programme ID";
//       if not DailyWeatherConditionLedger.Insert(true) then
//         DailyWeatherConditionLedger.Modify(true);
//   end;

//   procedure FnPostDailyEquipemtLedger(DailyWorkRecordEquipment: Record "Daily Work Record Equipment";DailyWorkRecord: Record "Daily Work Record")
//   var
//       DailyEquipmentLedger: Record "Daily Equipment Ledger";
//   begin
//       DailyWorkRecordEquipment.Reset;
//       DailyWorkRecordEquipment.SetRange(DailyWorkRecordEquipment."Document No.",DailyWorkRecord."Document No.");
//       if DailyWorkRecordEquipment.FindSet then
//         repeat
//             DailyEquipmentLedger.Init;
//             DailyEquipmentLedger."Entry No.":=DailyEquipmentLedger.Count+1;
//             DailyEquipmentLedger."Daily Work Record ID":=DailyWorkRecord."Document No.";
//             DailyEquipmentLedger."Job No.":=DailyWorkRecord."Project ID";
//             DailyEquipmentLedger."Equipment No.":=DailyWorkRecordEquipment."Equipment No.";
//             DailyEquipmentLedger."Equipment Type Code":=DailyWorkRecordEquipment."Equipment Type Code";
//             DailyEquipmentLedger.Description:=DailyWorkRecordEquipment.Description;
//             DailyEquipmentLedger."Serial/Registration No.":=DailyWorkRecordEquipment."Serial/Registration No.";
//             DailyEquipmentLedger."Photo No.":=DailyWorkRecordEquipment."Photo No.";
//             DailyEquipmentLedger."Equipment Utilization":=DailyWorkRecordEquipment."Equipment Utilization";
//             DailyEquipmentLedger."Equipment Usage Hours":=DailyWorkRecordEquipment."Equipment Usage Hours";
//             DailyEquipmentLedger.Remarks:=DailyWorkRecordEquipment.Remarks;
//             DailyEquipmentLedger."Work Execution Programme ID":=DailyWorkRecordEquipment."Work Execution Programme ID";
//             DailyEquipmentLedger."Posting Date":=DailyWorkRecord."Document Date";
//             if not DailyEquipmentLedger.Insert(true) then
//               DailyEquipmentLedger.Modify(true);
//       until DailyWorkRecordEquipment.Next=0
//   end;

//   procedure FnPostDailyMaterialLedger(DailyWorkRecord: Record "Daily Work Record";DailyWorkRecordMaterial: Record "Daily Work Record Material")
//   var
//       DailyMaterialLedger: Record "Daily Material Ledger";
//   begin
//       DailyWorkRecordMaterial.Reset;
//       DailyWorkRecordMaterial.SetRange(DailyWorkRecordMaterial."Document No.",DailyWorkRecord."Document No.");
//       if DailyWorkRecordMaterial.FindSet then
//         repeat
//           DailyMaterialLedger.Init;
//           DailyMaterialLedger."Entry No.":=DailyMaterialLedger.Count+1;
//           DailyMaterialLedger."Daily Work Record ID":=DailyWorkRecord."Document No.";
//           DailyMaterialLedger."Job No.":=DailyWorkRecord."Project ID";
//           DailyMaterialLedger."Movement Type":=DailyWorkRecordMaterial."Movement Type";
//           DailyMaterialLedger."Material ID":=DailyWorkRecordMaterial."Material ID";
//           DailyMaterialLedger.Description:=DailyWorkRecordMaterial.Description;
//           DailyMaterialLedger."Base Unit of Measure":=DailyWorkRecordMaterial."Base Unit of Measure";
//           DailyMaterialLedger.Quantity:=DailyWorkRecordMaterial.Quantity;
//           DailyMaterialLedger."Photo No.":=DailyWorkRecordMaterial."Photo No.";
//           DailyMaterialLedger."Material Test Record ID":=DailyWorkRecordMaterial."Material Test Record ID";
//           DailyMaterialLedger."Test Lead No.":=DailyWorkRecordMaterial."Test Lead No.";
//           DailyMaterialLedger."Site Name":=DailyWorkRecordMaterial."Site Name";
//           DailyMaterialLedger."Final Test Result":=DailyWorkRecordMaterial."Final Test Result";
//           DailyMaterialLedger."Posting Date":=DailyWorkRecordMaterial."Document Date";
//           DailyMaterialLedger."Work Execution Programme ID":=DailyWorkRecord."Work Execution Programme ID";
//           if not DailyMaterialLedger.Insert(true) then
//             DailyMaterialLedger.Modify(true);
//       until DailyWorkRecordMaterial.Next=0;
//   end;

//   procedure FnPostDailyContractorStaffLedger(DailyWorkRecord: Record "Daily Work Record";DailyWorkRecordKeyTeam: Record "Daily Work Record Key Team")
//   var
//       DailyContractorStaffLedger: Record "Daily Contractor Staff Ledger";
//   begin
//       DailyWorkRecordKeyTeam.Reset;
//       DailyWorkRecordKeyTeam.SetRange(DailyWorkRecordKeyTeam."Document No.",DailyWorkRecord."Document No.");
//       if DailyWorkRecordKeyTeam.FindSet then
//         repeat
//           DailyContractorStaffLedger.Init;
//           DailyContractorStaffLedger."Entry No.":=DailyContractorStaffLedger.Count+1;
//           DailyContractorStaffLedger."Daily Work Record ID":=DailyWorkRecord."Document No.";
//           DailyContractorStaffLedger."Job No.":=DailyWorkRecord."Project ID";
//           DailyContractorStaffLedger."Contractor Staff No.":=DailyWorkRecordKeyTeam."Contractor Staff No.";
//           DailyContractorStaffLedger.Name:=DailyWorkRecordKeyTeam.Name;
//           DailyContractorStaffLedger."Role Code":=DailyWorkRecordKeyTeam."Role Code";
//           DailyContractorStaffLedger.Designation:=DailyWorkRecordKeyTeam.Designation;
//           DailyContractorStaffLedger."Estimate ManHours Worked":=DailyWorkRecordKeyTeam."Estimate ManHours Worked";
//           DailyContractorStaffLedger."Work Execution Programme ID":=DailyWorkRecord."Work Execution Programme ID";
//           DailyContractorStaffLedger."Posting Date":=DailyWorkRecord."Document Date";
//           if not DailyContractorStaffLedger.Insert(true) then
//             DailyContractorStaffLedger.Modify(true);
//       until DailyWorkRecordKeyTeam.Next=0;
//   end;

//   procedure FnPostDailyLabourRegister(DailyWorkRecord: Record "Daily Work Record";DailyWorkRecordLabor: Record "Daily Work Record Labor")
//   var
//       DailyLaborLedger: Record "Daily Labor Ledger";
//   begin
//       DailyWorkRecordLabor.Reset;
//       DailyWorkRecordLabor.SetRange(DailyWorkRecordLabor."Document No.",DailyWorkRecord."Document No.");
//       if DailyWorkRecordLabor.FindSet then
//         repeat
//           DailyLaborLedger.Init;
//           DailyLaborLedger."Entry No.":=DailyLaborLedger.Count+1;
//           DailyLaborLedger."Daily Work Record ID":=DailyWorkRecord."Document No.";
//           DailyLaborLedger."Job No.":=DailyWorkRecord."Project ID";
//           DailyLaborLedger.Gender:=DailyWorkRecordLabor.Gender;
//           DailyLaborLedger.Description:=DailyWorkRecordLabor.Description;
//           DailyLaborLedger."Total No. of Staff":=DailyWorkRecordLabor."Total No. of Staff";
//           DailyLaborLedger."Average ManHours Worked":=DailyWorkRecordLabor."Average ManHours Worked";
//           DailyLaborLedger."Estimate Total Wages Paid":=DailyWorkRecordLabor."Estimate Total Wages Paid";
//           DailyLaborLedger."Work Execution Programme ID":=DailyWorkRecord."Work Execution Programme ID";
//           DailyLaborLedger."Posting Date":=DailyWorkRecord."Document Date";
//           if not DailyLaborLedger.Insert(true) then
//             DailyLaborLedger.Modify(true);
//       until DailyWorkRecordLabor.Next=0;
//   end;

//   procedure FnPostDailyVisitorRegister(DailyWorkRecord: Record "Daily Work Record";DailyWorkRecordVisitor: Record "Daily Work Record Visitor")
//   var
//       DailyVisitorLedger: Record "Daily Visitor Ledger";
//   begin
//       DailyWorkRecordVisitor.Reset;
//       DailyWorkRecordVisitor.SetRange(DailyWorkRecordVisitor."Document No.",DailyWorkRecord."Document No.");
//       if DailyWorkRecordVisitor.FindSet then
//         repeat
//             DailyVisitorLedger.Init;
//             DailyVisitorLedger."Entry No.":=DailyVisitorLedger.Count+1;
//             DailyVisitorLedger."Daily Work Record ID":=DailyWorkRecord."Document No.";
//             DailyVisitorLedger."Job No.":=DailyWorkRecord."Project ID";
//             DailyVisitorLedger."Visitor Name":=DailyWorkRecordVisitor."Visitor Name";
//             DailyVisitorLedger.Organization:=DailyWorkRecordVisitor.Organization;
//             DailyVisitorLedger."Time In":=DailyWorkRecordVisitor."Time In";
//             DailyVisitorLedger."Time Out":=DailyWorkRecordVisitor."Time Out";
//             DailyVisitorLedger."Purpose of Visit":=DailyWorkRecordVisitor."Purpose of Visit";
//             DailyVisitorLedger."Telephone No.":=DailyWorkRecordVisitor."Telephone No.";
//             DailyVisitorLedger."ID/Passport No.":=DailyWorkRecordVisitor."ID/Passport No.";
//             DailyVisitorLedger."Visitor Email":=DailyWorkRecordVisitor."Visitor Email";
//             DailyVisitorLedger."Site Induction Done":=DailyWorkRecordVisitor."Site Induction Done";
//             DailyVisitorLedger.Remarks:=DailyWorkRecordVisitor.Remarks;
//             DailyVisitorLedger."Posting Date":=DailyWorkRecord."Document Date";
//             if not DailyVisitorLedger.Insert(true) then
//               DailyVisitorLedger.Modify(true);
//       until DailyWorkRecordVisitor.Next=0;
//   end;

//   procedure FnPostProjectMeetingRegister(DailyWorkRecord: Record "Daily Work Record";DailyWorkRecordMeeting: Record "Daily Work Record Meeting";DWRMeetingAttendance: Record "DWR Meeting Attendance";DWRMeetingAgenda: Record "DWR Meeting Agenda";DWRMeetingSummary: Record "DWR Meeting Summary")
//   var
//       ProjectMeetingRegister: Record "Project Meeting Register";
//       RoadManagementSetup: Record "Road Management Setup";
//       NoSeriesManagement: Codeunit NoSeriesManagement;
//       ProjectMeetingAttendance: Record "Project Meeting Attendance";
//       ProjectMeetingAgenda: Record "Project Meeting Agenda";
//       ProjectMeetingSummary: Record "Project Meeting Summary";
//   begin
//       DailyWorkRecordMeeting.Reset;
//       DailyWorkRecordMeeting.SetRange(DailyWorkRecordMeeting."Document No.",DailyWorkRecord."Document No.");
//       if DailyWorkRecordMeeting.FindSet then begin
//         repeat
//         RoadManagementSetup.Get();
//         ProjectMeetingRegister.Init;
//         ProjectMeetingRegister."Meeting ID":=NoSeriesManagement.GetNextNo(RoadManagementSetup."Meeting Register Nos",
//         Today,true);
//         ProjectMeetingRegister."Meeting Type":=DailyWorkRecordMeeting."Meeting Type";
//         ProjectMeetingRegister."Project ID":=DailyWorkRecord."Project ID";
//         ProjectMeetingRegister.Description:=DailyWorkRecordMeeting.Description;
//         ProjectMeetingRegister."Region ID":=DailyWorkRecord."Region ID";
//         ProjectMeetingRegister."All Day Event":=DailyWorkRecordMeeting."All Day Event";
//         ProjectMeetingRegister."Start Date":=DailyWorkRecordMeeting."Start Date";
//         ProjectMeetingRegister."Start Time":=DailyWorkRecordMeeting."Start Time";
//         ProjectMeetingRegister."End Date":=DailyWorkRecordMeeting."End Date";
//         ProjectMeetingRegister."End Time":=DailyWorkRecordMeeting."End Time";
//         ProjectMeetingRegister."Venue/Location":=DailyWorkRecordMeeting."Venue/Location";
//         ProjectMeetingRegister."Project Manager":=DailyWorkRecordMeeting."Meeting Organizer ID";
//         ProjectMeetingRegister."Meeting Status":=DailyWorkRecordMeeting."Meeting Status";
//         ProjectMeetingRegister."Created By":=UserId;
//         ProjectMeetingRegister."Created DateTime":=CreateDatetime(Today,Time);
//         if not ProjectMeetingRegister.Insert(true) then
//           ProjectMeetingRegister.Modify(true);

//         //Populate with Attendance
//         DWRMeetingAttendance.Reset;
//         DWRMeetingAttendance.SetRange(DWRMeetingAttendance."Document No.",DailyWorkRecord."Document No.");
//         if DWRMeetingAttendance.FindSet then begin
//           repeat
//             ProjectMeetingAttendance.Init;
//             ProjectMeetingAttendance."Meeting ID":=ProjectMeetingRegister."Meeting ID";
//             ProjectMeetingAttendance."Attendee Type":=DWRMeetingAttendance."Attendee Type";
//             ProjectMeetingAttendance."No.":=DWRMeetingAttendance."No.";
//             ProjectMeetingAttendance."Representative Name":=DWRMeetingAttendance."Representative Name";
//             ProjectMeetingAttendance.Designation:=DWRMeetingAttendance.Designation;
//             ProjectMeetingAttendance."Representative Email":=DWRMeetingAttendance."Representative Email";
//             ProjectMeetingAttendance."Representative Tel No":=DWRMeetingAttendance."Representative Tel No";
//             ProjectMeetingAttendance."Notified on Email":=DWRMeetingAttendance."Notified on Email";
//             ProjectMeetingAttendance."DateTime Notified":=DWRMeetingAttendance."Date/Time Notified";
//             ProjectMeetingAttendance."Contractor No":=DailyWorkRecord."Contractor No.";
//             ProjectMeetingAttendance."Project No":=DailyWorkRecord."Project ID";
//             if not ProjectMeetingAttendance.Insert(true) then
//               ProjectMeetingAttendance.Modify(true);
//           until DWRMeetingAttendance.Next=0;
//           end;

//          //Populate Meeting Agenda
//         DWRMeetingAgenda.Reset;
//         DWRMeetingAgenda.SetRange(DWRMeetingAgenda."Document No.",DailyWorkRecord."Document No.");
//         if DWRMeetingAgenda.FindSet then begin
//           repeat
//             ProjectMeetingAgenda.Init;
//             ProjectMeetingAgenda."Meeting ID":=ProjectMeetingRegister."Meeting ID";
//             ProjectMeetingAgenda."Agenda Code":=DWRMeetingAgenda."Agenda Code";
//             ProjectMeetingAgenda."Agenda Description":=DWRMeetingAgenda."Agenda Description";
//             ProjectMeetingAgenda.Owner:=DWRMeetingAgenda.Owner;
//             ProjectMeetingAgenda."Estimate Time (Minutes)":=DWRMeetingAgenda."Estimate Time (Minutes)";
//             if not ProjectMeetingAgenda.Insert(true) then
//               ProjectMeetingAgenda.Modify(true);
//           until DWRMeetingAgenda.Next=0;
//           end;

//            //Populate Meeting Agenda Items
//            DWRMeetingSummary.Reset;
//            DWRMeetingSummary.SetRange(DWRMeetingSummary."Document No.",DailyWorkRecord."Document No.");
//            if DWRMeetingSummary.FindSet then begin
//              repeat
//                ProjectMeetingSummary.Init;
//                ProjectMeetingSummary."Meeting ID":=ProjectMeetingRegister."Meeting ID";
//                ProjectMeetingSummary."Agenda Code":=DWRMeetingSummary."Agenda Code";
//                ProjectMeetingSummary."Agenda Item No.":=DWRMeetingSummary."Agenda Item No.";
//                ProjectMeetingSummary."Line No.":=DWRMeetingSummary."Line No.";
//                ProjectMeetingSummary."Item Discussed":=DWRMeetingSummary."Item Discussed";
//                ProjectMeetingSummary."Summary Notes":=DWRMeetingSummary."Summary Notes";
//                /*ProjectMeetingSummary."Task Description":=DWRMeetingSummary.
//                ProjectMeetingSummary."Responsibility Category":=DWRMeetingSummary.
//                ProjectMeetingSummary."Task Owner ID":=DWRMeetingSummary.
//                ProjectMeetingSummary.Name:=DWRMeetingSummary.
//                ProjectMeetingSummary."Due Date":=DWRMeetingSummary.
//                ProjectMeetingSummary."Contractor No":=DWRMeetingSummary.
//                ProjectMeetingSummary."Contributor No":=DWRMeetingSummary.*/
//                if not ProjectMeetingSummary.Insert(true) then
//                ProjectMeetingSummary.Modify(true);
//              until DWRMeetingSummary.Next=0;
//              end;
//         until ProjectMeetingRegister.Next=0;
//         end;

//   end;

//   procedure FnPostRiskIncidentLedger(DailyWorkRecord: Record "Daily Work Record";DailyWorkRecordIncident: Record "Daily Work Record Incident")
//   var
//       RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry";
//   begin
//       DailyWorkRecordIncident.Reset;
//       DailyWorkRecordIncident.SetRange(DailyWorkRecordIncident."Document No.",DailyWorkRecord."Document No.");
//       if DailyWorkRecordIncident.FindSet then begin
//         repeat
//           RiskIncidentLedgerEntry.Init;
//           RiskIncidentLedgerEntry."Entry No":=RiskIncidentLedgerEntry.Count+1;
//           RiskIncidentLedgerEntry."Posting Date":=DailyWorkRecord."Document Date";
//           RiskIncidentLedgerEntry."Posted By":=UserId;
//           RiskIncidentLedgerEntry."Incident Document Type":=RiskIncidentLedgerEntry."incident document type"::Project;
//           RiskIncidentLedgerEntry."HSE Management Plan ID":=DailyWorkRecordIncident."HSE Plan ID";
//           RiskIncidentLedgerEntry."Hazard ID":=DailyWorkRecordIncident."Hazard ID";
//           RiskIncidentLedgerEntry."Risk Management Plan ID":=DailyWorkRecordIncident."Risk Management Plan ID";
//           RiskIncidentLedgerEntry."Risk ID":=DailyWorkRecordIncident."Risk ID";
//           RiskIncidentLedgerEntry."Risk Incident Category":=DailyWorkRecordIncident."Risk Incident Category";
//           RiskIncidentLedgerEntry."Source Document Type":=RiskIncidentLedgerEntry."source document type"::"Progress of Works Voucher";
//           RiskIncidentLedgerEntry."Source Document No.":=DailyWorkRecord."Document No.";
//           RiskIncidentLedgerEntry."Incident Description":=DailyWorkRecordIncident."Incident Description";
//           RiskIncidentLedgerEntry."Severity Level":=DailyWorkRecordIncident."Severity Level";
//           RiskIncidentLedgerEntry."Occurrence Type":=DailyWorkRecordIncident."Occurrence Type";
//           RiskIncidentLedgerEntry."Incident Date":=DailyWorkRecordIncident."Incident Date";
//           RiskIncidentLedgerEntry."Incident Start Time":=DailyWorkRecordIncident."Incident Start Time";
//           RiskIncidentLedgerEntry."Incident End Time":=DailyWorkRecordIncident."Incident End Time";
//           RiskIncidentLedgerEntry."Incident Location Details":=DailyWorkRecordIncident."Incident Location Details";
//           RiskIncidentLedgerEntry."Primary Trigger ID":=DailyWorkRecordIncident."Primary Trigger ID";
//           RiskIncidentLedgerEntry."Root Cause Summary":=DailyWorkRecordIncident."Root Cause Summary";
//           RiskIncidentLedgerEntry."Category of Person Reporting":=DailyWorkRecordIncident."Category of Person Reporting";
//           RiskIncidentLedgerEntry."Reported By (Name)":=DailyWorkRecordIncident."Reported By (Name)";
//           RiskIncidentLedgerEntry."Actual Financial Impact (LCY)":=DailyWorkRecordIncident."Actual Financial Impact (LCY)";
//           RiskIncidentLedgerEntry."Actual Schedule Delay(Days)":=DailyWorkRecordIncident."Actual Delay Disruption (Days)";
//           RiskIncidentLedgerEntry."Actual No. Injured Persons":=DailyWorkRecordIncident."Actual No. Injured Persons";
//           RiskIncidentLedgerEntry."Actual No. of Fatalities":=DailyWorkRecordIncident."Actual No. of Fatalities";
//           RiskIncidentLedgerEntry."Police Report Reference No.":=DailyWorkRecordIncident."Police Report Reference No.";
//           RiskIncidentLedgerEntry."Police Report Date":=DailyWorkRecordIncident."Police Report Date";
//           RiskIncidentLedgerEntry."Police Station":=DailyWorkRecordIncident."Police Station";
//           RiskIncidentLedgerEntry."Reporting Officer":=DailyWorkRecordIncident."Reporting Officer";
//           RiskIncidentLedgerEntry."Incident Class":=DailyWorkRecordIncident."Incident Class";
//           RiskIncidentLedgerEntry."Project ID":=DailyWorkRecord."Project ID";
//           if not RiskIncidentLedgerEntry.Insert(true ) then
//             RiskIncidentLedgerEntry.Modify(true);
//       until DailyWorkRecordIncident.Next=0;
//       end;
//   end;

// //  procedure FnPostEOT(JobPlanningLine: Record "Job Planning Line";ExtensionofTimeLine: Record "Extension of Time Line";ProjectVariationHeader: Record "Project Variation Header")
//   begin
//       ExtensionofTimeLine.Reset;
//       ExtensionofTimeLine.SetRange(ExtensionofTimeLine."Document Type",ProjectVariationHeader."Document Type");
//       ExtensionofTimeLine.SetRange(ExtensionofTimeLine."Document No.",ProjectVariationHeader."Document No.");
//       if ExtensionofTimeLine.FindSet then
//         repeat
//           JobPlanningLine.Reset;
//           JobPlanningLine.SetRange(JobPlanningLine."Job No.",ProjectVariationHeader."Project ID");
//           JobPlanningLine.SetRange(JobPlanningLine."Job Task No.",ExtensionofTimeLine."Job Task No.");
//           JobPlanningLine.SetRange(JobPlanningLine."Line No.",ExtensionofTimeLine."Line No.");
//           if JobPlanningLine.FindSet then
//             repeat
//               JobPlanningLine."Planning Date":=ExtensionofTimeLine."Revised Planning Date";
//               JobPlanningLine."Planned Delivery Date":=ExtensionofTimeLine."Revised Planning Date";
//               if not JobPlanningLine.Insert(true) then
//                JobPlanningLine.Modify(true);
//             until JobPlanningLine.Next=0;
//         until ExtensionofTimeLine.Next=0;
//   end;

//   procedure FnNotifyContractorRepDecline(ProjectVariationHeader: Record "Project Variation Header")
//   var
//       SupplierReq: Record Contact;
//       LastFieldNo: Integer;
//       FooterPrinted: Boolean;
//       FileDirectory: Text[100];
//       FileName: Text[100];
//       ReportID: Integer;
//       "Object": Record "Object";
//       Window: Dialog;
//       RunOnceFile: Text[1000];
//       TimeOut: Integer;
//       Customer2: Record Customer;
//       Cust: Record Customer;
//       cr: Integer;
//       lf: Integer;
//       EmailBody: array [2] of Text[30];
//       BodyText: Text[250];
//       mymail: Codeunit Mail;
//       DefaultPrinter: Text[200];
//       WindowisOpen: Boolean;
//       FileDialog: Codeunit Mail;
//       SendingDate: Date;
//       SendingTime: Time;
//       Counter: Integer;
//       cu400: Codeunit Mail;
//       DocLog: Record "Document E-mail Log";
//       BranchName: Code[80];
//       DimValue: Record "Dimension Value";
//       SenderAddress: Text[100];
//       CustEmail: Text[100];
//       UserSetup: Record "User Setup";
//       HRSetup: Record "Company Information";
//       Emp: Record Vendor;
//       PayrollMonth: Date;
//       PayrollMonthText: Text[30];
//       PayPeriodtext: Text;
//       PayPeriod: Record "Payroll PeriodX";
//       CompInfo: Record "Company Information";
//       DateFilter: Text;
//       FromDate: Date;
//       ToDate: Date;
//       FromDateS: Text;
//       ToDateS: Text;
//       vend: Record Vendor;
//       StartDate: Date;
//       EndDAte: Date;
//       EmailVerifier: Codeunit Payroll3;
//       IsEmailValid: Boolean;
//       PPayableSetup: Record "Procurement Setup";
//       RequesterName: Text[100];
//       RequesterEmail: Text[100];
//       emailhdr: Text[100];
//       CompanyDetails: Text[250];
//       SupplierDetails: Text[1000];
//       SenderMessage: Text[1000];
//       ProcNote: Text[1000];
//       LoginDetails: Text[1000];
//       PortalUser: Record "Dynasoft Portal User";
//       Password: Text[50];
//       ActivationDetails: Text[1000];
//       StaffAppointmentLine: Record "Project Staff Appointment Line";
//       IFS: Record "Standard Purchase Code";
//       CommitteType: Record "Procurement Committee Types";
//   begin
//       ///Notifying Procurement Team on supplier Request
//          CompInfo.Get;
//          HRSetup.Get;
//          PPayableSetup.Get;


//       ProjectVariationHeader.TestField("Contractor Rep Email");
//       RequesterEmail:=ProjectVariationHeader."Contractor Rep Email";
//       RequesterName:=ProjectVariationHeader."Contractor Name";
//       Window.Open('Notifying the contractor representative...',ProjectVariationHeader."Contractor Representative");
//       WindowisOpen := true;
//       Counter:=Counter+1;
//       CompanyDetails:='Dear,  '+ RequesterName;
//       SenderMessage:='<BR>Your '+Format(ProjectVariationHeader."Document Type")+' Number: '+ProjectVariationHeader."Document No."+'</BR>';
//       SupplierDetails:='<BR>submitted on '+' '+Format(ProjectVariationHeader."Document Date")+' has been rejected with reason: '+ProjectVariationHeader."Review Rejection Notes"+'</BR>';
//       emailhdr:=UpperCase(Format(ProjectVariationHeader."Document Type"))+' '+'RESPONSE:';
//       cu400.CreateMessage(CompInfo.Name,CompInfo."Administrator Email",RequesterEmail,emailhdr,
//       CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);
//       cu400.Send;
//       SendingDate:=Today;
//       SendingTime:=Time;
//       Sleep(1000);
//       Window.Close;
//   end;

//   procedure FnCreateVariationOrder(ProjectVariationHeader: Record "Project Variation Header";ProjectVariationLine: Record "Project Variation Line";ProjectVariationSection: Record "Project Variation Section";ProjectVariationCommittee: Record "Project Variation Committee")
//   var
//       ObjProjectVariationHeader: Record "Project Variation Header";
//       ObjProjectVariationLine: Record "Project Variation Line";
//       ObjProjectVariationSection: Record "Project Variation Section";
//       ObjProjectVariationCommittee: Record "Project Variation Committee";
//       RoadManagementSetup: Record "Road Management Setup";
//       NoSeriesManagement: Codeunit NoSeriesManagement;
//   begin
//       //Populate Header
//       RoadManagementSetup.Get();
//       ObjProjectVariationHeader.Init;
//       ObjProjectVariationHeader.TransferFields(ProjectVariationHeader);
//       ObjProjectVariationHeader."Document Type":=ObjProjectVariationHeader."document type"::"Project Variation Order";
//       ObjProjectVariationHeader."Document No.":=NoSeriesManagement.GetNextNo(RoadManagementSetup."Project Variation Order Nos",Today,true);
//       ObjProjectVariationHeader."Document Date":=Today;
//       ObjProjectVariationHeader."Created By":=UserId;
//       ObjProjectVariationHeader."Created Date/Time":=CreateDatetime(Today,Time);
//       ObjProjectVariationHeader.Validate("Project ID");
//       ObjProjectVariationHeader."Contractor Variation Req No.":=ProjectVariationHeader."Document No.";
//       if not ObjProjectVariationHeader.Insert(true) then
//         ObjProjectVariationHeader.Modify(true);


//       //Populate Lines
//       ProjectVariationLine.Reset;
//       //ProjectVariationLine.SETRANGE(ProjectVariationLine."Document Type",ProjectVariationHeader."Document Type");
//       ProjectVariationLine.SetRange(ProjectVariationLine."Document No.",ProjectVariationHeader."Document No.");
//       if ProjectVariationLine.FindSet then
//         repeat
//           ObjProjectVariationLine.Init;
//           ObjProjectVariationLine.TransferFields(ProjectVariationLine);
//           ObjProjectVariationLine."Document Type":=ObjProjectVariationHeader."Document Type";
//           ObjProjectVariationLine."Document No.":=ObjProjectVariationHeader."Document No.";
//           if not ObjProjectVariationLine.Insert(true) then
//             ObjProjectVariationLine.Modify(true);
//         until ProjectVariationLine.Next=0;

//       //Populate Sections
//       ProjectVariationSection.Reset;
//       ProjectVariationSection.SetRange(ProjectVariationSection."Document No.",ProjectVariationHeader."Document No.");
//       if ProjectVariationSection.FindSet then
//         repeat
//           ObjProjectVariationSection.Init;
//           ObjProjectVariationSection.TransferFields(ProjectVariationSection);
//           ObjProjectVariationSection."Document Type":=ObjProjectVariationHeader."Document Type";
//           ObjProjectVariationSection."Document No.":=ObjProjectVariationHeader."Document No.";
//           if not ObjProjectVariationSection.Insert(true) then
//             ObjProjectVariationSection.Modify(true);
//          until ProjectVariationSection.Next=0;


//       //Populate Committee
//       ProjectVariationCommittee.Reset;
//       ProjectVariationCommittee.SetRange(ProjectVariationCommittee."Document No.",ProjectVariationHeader."Document No.");
//       if ProjectVariationCommittee.FindSet then
//         repeat
//           ObjProjectVariationCommittee.Init;
//           ObjProjectVariationCommittee.TransferFields(ProjectVariationCommittee);
//           ObjProjectVariationCommittee."Document Type":=ObjProjectVariationHeader."Document Type";
//           ObjProjectVariationCommittee."Document No.":=ObjProjectVariationHeader."Document No.";
//           if not ObjProjectVariationCommittee.Insert(true) then
//             ObjProjectVariationCommittee.Modify(true);
//         until ProjectVariationCommittee.Next=0;

//       //Update the important fields
//       // ProjectVariationHeader."Review Status":=ProjectVariationHeader."Review Status"::Approved;
//       // //ProjectVariationHeader.Posted:=TRUE;
//       // ProjectVariationHeader."Project Variation Order No.":=ObjProjectVariationHeader."Document No.";
//       // ProjectVariationHeader.MODIFY(TRUE);

//       Message('Document %1 created successfully',ObjProjectVariationHeader."Document No.");
//   end;

//   procedure FnPostVariationOrder(ProjectVariationLine: Record "Project Variation Line";ProjectVariationHeader: Record "Project Variation Header")
//   var
//       JobPlanningLine: Record "Job Planning Line";
//       ContractVariationLedger: Record "Contract Variation Ledger";
//   begin
//       ProjectVariationLine.Reset;
//       ProjectVariationLine.SetRange(ProjectVariationLine."Document No.",ProjectVariationHeader."Document No.");
//       ProjectVariationLine.SetRange(ProjectVariationLine."Job No.",ProjectVariationHeader."Project ID");
//       if ProjectVariationLine.FindSet then
//         repeat
//           JobPlanningLine.Init;
//           JobPlanningLine."Job No.":=ProjectVariationLine."Job No.";
//           JobPlanningLine."Job Task No.":=ProjectVariationLine."Job Task No.";
//           JobPlanningLine."Line No.":=JobPlanningLine.Count()+10000;
//           JobPlanningLine."Planning Date":=ProjectVariationHeader."Document Date";
//           JobPlanningLine."Document No.":=ProjectVariationHeader."Document No.";
//           JobPlanningLine."Line Type":=JobPlanningLine."line type"::"Both Budget and Billable";
//           JobPlanningLine.Type:=ProjectVariationLine.Type;
//           JobPlanningLine."No.":=ProjectVariationLine."No.";
//           JobPlanningLine.Validate("No.");
//           JobPlanningLine.Description:=ProjectVariationLine.Description;
//           if ProjectVariationLine."Net Change (Quantity)" <> 0 then
//           JobPlanningLine.Quantity:=ProjectVariationLine."Net Change (Quantity)";
//           JobPlanningLine.Validate(Quantity);
//           JobPlanningLine."Direct Unit Cost (LCY)":=ProjectVariationLine."Unit Cost (LCY)";
//           JobPlanningLine.Validate("Direct Unit Cost (LCY)");
//           JobPlanningLine."Unit Cost":=ProjectVariationLine."Unit Cost (LCY)";
//           JobPlanningLine.Validate("Unit Cost");
//           JobPlanningLine."Unit Cost (LCY)":=ProjectVariationLine."Unit Cost (LCY)";
//           JobPlanningLine."Total Cost (LCY)":=ProjectVariationLine."Net Change (Total Cost LCY)";
//           JobPlanningLine."Unit of Measure":=ProjectVariationLine."Unit of Measure Code";
//           //JobPlanningLine."Unit of Measure Code":=ProjectVariationLine."Unit of Measure Code";
//           JobPlanningLine."Gen. Bus. Posting Group":=ProjectVariationLine."Gen. Bus. Posting Group";
//           //JobPlanningLine.VALIDATE("Gen. Bus. Posting Group");
//           JobPlanningLine."Gen. Prod. Posting Group":=ProjectVariationLine."Gen. Prod. Posting Group";
//           //JobPlanningLine.VALIDATE("Gen. Prod. Posting Group");
//            //JobPlanningLine."Road Technology":=ProjectVariationLine
//           JobPlanningLine."Road Activity Categories":=ProjectVariationLine."Bill Item Category Code";
//           JobPlanningLine."Last Proj Variation Order No.":=ProjectVariationHeader."Document No.";
//           if not JobPlanningLine.Insert(true) then
//             JobPlanningLine.Modify(true);
//          until ProjectVariationLine.Next=0;

//          //Populate Contract Variation Ledger Entry
//          ProjectVariationLine.Reset;
//          ProjectVariationLine.SetRange(ProjectVariationLine."Document No.",ProjectVariationHeader."Document No.");
//          ProjectVariationLine.SetRange(ProjectVariationLine."Job No.",ProjectVariationHeader."Project ID");
//          if ProjectVariationLine.FindSet then
//            repeat
//              ContractVariationLedger.Init;
//              ContractVariationLedger."Entry No.":=ContractVariationLedger.Count()+1;
//              ContractVariationLedger."Source Document Type":=ContractVariationLedger."source document type"::"Project Variation Order";
//              ContractVariationLedger."Source Document No.":=ProjectVariationHeader."Document No.";
//              ContractVariationLedger."Job No.":=ProjectVariationHeader."Project ID";
//              ContractVariationLedger."Job Task No.":=ProjectVariationLine."Job Task No.";
//              ContractVariationLedger."Line No.":=ProjectVariationLine."Line No.";
//              ContractVariationLedger.Type:=ProjectVariationLine.Type;
//              ContractVariationLedger."No.":=ProjectVariationLine."No.";
//              ContractVariationLedger.Description:=ProjectVariationLine.Description;
//              ContractVariationLedger."Original Quantity":=ProjectVariationLine."Original Quantity";
//              ContractVariationLedger."Unit Cost (LCY)":=ProjectVariationLine."Unit Cost (LCY)";
//              ContractVariationLedger."Original Total Cost (LCY)":=ProjectVariationLine."Original Total Cost (LCY)";
//              ContractVariationLedger."Unit of Measure Code":=ProjectVariationLine."Unit of Measure Code";
//              ContractVariationLedger."New Quantity":=ProjectVariationLine."New Quantity";
//              ContractVariationLedger."New Total Cost (LCY)":=ProjectVariationLine."New Total Cost (LCY)";
//              ContractVariationLedger."Net Change (Quantity)":=ProjectVariationLine."Net Change (Quantity)";
//              ContractVariationLedger."Net Change (Total Cost LCY)":=ProjectVariationLine."Net Change (Total Cost LCY)";
//              ContractVariationLedger."Gen. Prod. Posting Group":=ProjectVariationLine."Gen. Prod. Posting Group";
//              ContractVariationLedger."Bill Item Category Code":=ProjectVariationLine."Bill Item Category Code";
//              ContractVariationLedger."Purchase Contract ID":=ProjectVariationLine."Purchase Contract ID";
//              ContractVariationLedger."Contractor No.":=ProjectVariationLine."Contractor No.";
//              if not ContractVariationLedger.Insert(true) then
//                ContractVariationLedger.Modify(true);
//            until ProjectVariationLine.Next=0;
//   end;


//   procedure FnCreateTasksFromT72134(ObjRWPL: Record "Road WorkPlan Package";Job: Record Job;JobTask: Record "Job Task";ObjRWPH: Record "Road Work Program";NewRoadWorkProgramTask: Record "New Road Work Program Task";NewRoadWorkProgramActivity: Record "New Road Work Program Activity")
//   var
//       PRTempH: Record "Purchase Requisition Template";
//       RTLine: Record "Requisition Template Line";
//       ItemCategory: Record "Item Category";
//   begin
//        ObjRWPL.Reset;
//        ObjRWPL.SetRange(ObjRWPL."Road Work Program ID",ObjRWPH.Code);
//        if ObjRWPL.FindSet then
//         begin
//           NewRoadWorkProgramTask.Reset;
//           NewRoadWorkProgramTask.SetRange(NewRoadWorkProgramTask."Road Work Program ID",ObjRWPH.Code);
//           if NewRoadWorkProgramTask.FindSet then begin
//              repeat
//                 JobTask.Init;
//                 JobTask."Job No.":=Job."No.";
//                 JobTask."Region ID":=ObjRWPH."Region ID";
//                 JobTask."Global Dimension 1 Code":=ObjRWPL."Global Dimension 1 Code";
//                 JobTask.Location:=ObjRWPL."Project Location ID";
//                 JobTask."Global Dimension 2 Code":=ObjRWPL."Global Dimension 2 Code";
//                 ItemCategory.Reset;
//                 ItemCategory.SetRange(ItemCategory."Bill Item Group",true);
//                 if ItemCategory.FindFirst then
//                   begin
//                   JobTask."Job Task No.":=ItemCategory.Code;
//                   JobTask.Description:=ItemCategory.Description;
//                 end;
//                 JobTask.Validate(Description);
//                 JobTask."Job Task Type":=JobTask."job task type"::"Begin-Total";
//                 if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
//                 JobTask.Insert(true);

//                 JobTask.Init;
//                 JobTask."Job No.":=Job."No.";
//                 JobTask."Region ID":=ObjRWPH."Region ID";
//                 JobTask."Job Task No.":=NewRoadWorkProgramTask."Bill Item Category Code";
//                 JobTask."Global Dimension 1 Code":=ObjRWPL."Global Dimension 1 Code";
//                 JobTask.Location:=ObjRWPL."Project Location ID";
//                 JobTask."Global Dimension 2 Code":=ObjRWPL."Global Dimension 2 Code";
//                 ItemCategory.Reset;
//                 ItemCategory.SetRange(ItemCategory.Code,NewRoadWorkProgramTask."Bill Item Category Code");
//                 if ItemCategory.FindSet then
//                 JobTask.Description:=ItemCategory.Description;
//                 JobTask.Validate(Description);
//                 JobTask."Job Task Type":=JobTask."job task type"::Posting;
//                 if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
//                 JobTask.Insert(true);

//                 JobTask.Init;
//                 JobTask."Job No.":=Job."No.";
//                 JobTask."Region ID":=ObjRWPH."Region ID";
//                 JobTask."Global Dimension 1 Code":=ObjRWPL."Global Dimension 1 Code";
//                 JobTask.Location:=ObjRWPL."Project Location ID";
//                 JobTask."Global Dimension 2 Code":=ObjRWPL."Global Dimension 2 Code";
//                 ItemCategory.Reset;
//                 ItemCategory.SetRange(ItemCategory."Bill Item Group",true);
//                 if ItemCategory.FindLast then
//                   begin
//                   JobTask."Job Task No.":=ItemCategory.Code;
//                   JobTask.Description:=ItemCategory.Description;
//                 end;
//                 JobTask.Validate(Description);
//                 JobTask."Job Task Type":=JobTask."job task type"::"End-Total";
//                 if not JobTask.Get(JobTask."Job No.",JobTask."Job Task No.") then
//                 JobTask.Insert(true);
//               until NewRoadWorkProgramTask.Next=0;
//             end;
//            end;
//   end;


//   procedure FnCreateJobPlanningLinesFromT72135(ObjRWPL: Record "Road WorkPlan Package";Job: Record Job;ObjJobPlanLine: Record "Job Planning Line";ObjRWPH: Record "Road Work Program";NewRoadWorkProgramActivity: Record "New Road Work Program Activity")
//   var
//       PRTempH: Record "Purchase Requisition Template";
//       RTLine: Record "Requisition Template Line";
//       ItemCategory: Record "Item Category";
//   begin
//           NewRoadWorkProgramActivity.Reset;
//           NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID",ObjRWPH.Code);
//           if NewRoadWorkProgramActivity.FindSet then
//             begin
//               repeat
//                 ObjJobPlanLine.Init;
//                 ObjJobPlanLine."Job No.":=NewRoadWorkProgramActivity."Project No";
//                 ObjJobPlanLine."Job Task No.":=NewRoadWorkProgramActivity."Bill Item Category Code";
//                 ObjJobPlanLine."Line No.":=NewRoadWorkProgramActivity."Entry No";
//                 ObjJobPlanLine.Type:=ObjJobPlanLine.Type::Item;
//                 ObjJobPlanLine."No.":=NewRoadWorkProgramActivity."Activity Code";
//                 ObjJobPlanLine.Validate("No.");
//                 ObjJobPlanLine."Line Type":=ObjJobPlanLine."line type"::"Both Budget and Billable";
//                 ObjJobPlanLine.Description:=NewRoadWorkProgramActivity.Description;
//                 ObjJobPlanLine.Validate(Description);
//                 ObjJobPlanLine."Road Activity Sub-Category":=NewRoadWorkProgramActivity."Bill Item Category Code";
//                 ObjJobPlanLine.Quantity:=NewRoadWorkProgramActivity."Planned Quantity";
//                 ObjJobPlanLine.Validate(Quantity);
//                 ObjJobPlanLine."Unit Cost":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
//                 ObjJobPlanLine.Validate("Unit Cost");
//                 ObjJobPlanLine."Direct Unit Cost (LCY)":=NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
//                 ObjJobPlanLine.Validate("Direct Unit Cost (LCY)");
//                 ObjJobPlanLine."Planning Date":=Today;
//                 ObjJobPlanLine."Document No.":=ObjRWPH.Code;
//                 ObjJobPlanLine."Document Date":=ObjRWPH."Document Date";
//                 ObjJobPlanLine."Road Technology":=NewRoadWorkProgramActivity."Technology Type";
//                 ObjJobPlanLine.Validate("Road Technology");
//                 ObjJobPlanLine."Bill Item No":=NewRoadWorkProgramActivity."Activity Code";
//                 ObjJobPlanLine."Line Type":=ObjJobPlanLine."line type"::"Both Budget and Billable";
//                 ObjJobPlanLine."VAT Bus. Posting Group":=NewRoadWorkProgramActivity."Gen. Prod. Posting Group";
//                 ObjJobPlanLine.Validate("VAT Bus. Posting Group");
//                 ObjJobPlanLine."VAT Prod. Posting Group":=NewRoadWorkProgramActivity."VAT Prod. Posting Group";
//                 ObjJobPlanLine.Validate("VAT Prod. Posting Group");
//                 ObjJobPlanLine."Contract Type":=NewRoadWorkProgramActivity."Contract Type";
//                 //added for reversion type
//                 ObjJobPlanLine."Reversion Type":=NewRoadWorkProgramActivity."Reversion Type";
//                 if ObjJobPlanLine."Contract Type"=ObjJobPlanLine."contract type"::Construction then
//                  ObjJobPlanLine.Active:=true;
//                  if not ObjJobPlanLine.Insert(true) then
//                 ObjJobPlanLine.Modify(true);
//               until NewRoadWorkProgramActivity.Next=0;
//             end;
//            //END;
//   end;

//   procedure FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask: Record "Contractor Request Task";ContractorRequestPlanLine: Record "Contractor Request Plan Line";MeasurementPaymentHeader: Record "Measurement &  Payment Header")
//   var
//       Job: Record Job;
//       JobTask: Record "Job Task";
//       JobPlanningLine: Record "Job Planning Line";
//   begin
//       //Insert Job Tasks
//       JobTask.Reset;
//       JobTask.SetRange(JobTask."Job No.",MeasurementPaymentHeader."Project ID");
//       if JobTask.FindSet then
//         repeat
//           ContractorRequestTask.Init;
//           ContractorRequestTask."Document Type":=MeasurementPaymentHeader."Document Type";
//           ContractorRequestTask."Document No.":=MeasurementPaymentHeader."Document No.";
//           ContractorRequestTask."Job No.":=MeasurementPaymentHeader."Project ID";
//           ContractorRequestTask."Job Task No.":=JobTask."Job Task No.";
//           ContractorRequestTask.Description:=JobTask.Description;
//           ContractorRequestTask."Job Task Type":=JobTask."Job Task Type";
//           if not ContractorRequestTask.Insert(true) then
//             ContractorRequestTask.Modify(true);
//          until JobTask.Next=0;


//        //Insert Planning Lines
//       JobPlanningLine.Reset;
//       JobPlanningLine.SetRange(JobPlanningLine."Job No.",MeasurementPaymentHeader."Project ID");
//       if JobPlanningLine.FindSet then begin
//         repeat
//           ContractorRequestPlanLine.Init;
//           ContractorRequestPlanLine."Document Type":=MeasurementPaymentHeader."Document Type";
//           ContractorRequestPlanLine."Document No":=MeasurementPaymentHeader."Document No.";
//           ContractorRequestPlanLine."Document No.":=MeasurementPaymentHeader."Document No.";
//           ContractorRequestPlanLine."Job No.":=MeasurementPaymentHeader."Project ID";
//           ContractorRequestPlanLine."Job Task No.":=JobPlanningLine."Job Task No.";
//           ContractorRequestPlanLine."Line No.":=JobPlanningLine."Line No.";
//           ContractorRequestPlanLine."Line Type":=ContractorRequestPlanLine."line type"::"Both Budget and Billable";
//           ContractorRequestPlanLine.Type:=ContractorRequestPlanLine.Type::Item;;
//           ContractorRequestPlanLine."No.":=JobPlanningLine."No.";
//           ContractorRequestPlanLine.Description:=JobPlanningLine.Description;
//           ContractorRequestPlanLine.Quantity:=JobPlanningLine.Quantity;
//           ContractorRequestPlanLine.Validate(Quantity);
//           if JobPlanningLine.Quantity > 0 then
//           ContractorRequestPlanLine."Remaining Qty.":=JobPlanningLine."Remaining Qty.";
//       //    ContractorRequestPlanLine.VALIDATE("Qty. to Order");
//           ContractorRequestPlanLine."Unit Cost":=JobPlanningLine."Unit Cost";
//           ContractorRequestPlanLine.Validate("Unit Cost");
//           ContractorRequestPlanLine."Direct Unit Cost (LCY)":=JobPlanningLine."Direct Unit Cost (LCY)";
//           ContractorRequestPlanLine.Validate("Direct Unit Cost (LCY)");
//           ContractorRequestPlanLine."Planning Date":=Today;
//           ContractorRequestPlanLine."VAT Bus. Posting Group":=JobPlanningLine."VAT Bus. Posting Group";
//           ContractorRequestPlanLine.Validate("VAT Bus. Posting Group");
//           ContractorRequestPlanLine."VAT Prod. Posting Group":=JobPlanningLine."VAT Prod. Posting Group";
//           ContractorRequestPlanLine.Validate("VAT Prod. Posting Group");
//           ContractorRequestPlanLine."Total Cost Incl. VAT":=0;
//           ContractorRequestPlanLine."User ID":=UserId;
//           if not ContractorRequestPlanLine.Insert(true) then
//             ContractorRequestPlanLine.Modify(true);
//         until JobPlanningLine.Next=0;
//         end;
//   end;

//   procedure FnPostCashRequest(CashRequestHeader: Record "Cash Request Header")
//   begin
//   end;

//   procedure FnSuggestCashRequestReceiptLines(ReceiptsHeader1: Record "Receipts Header1";CashRequestLines: Record "Cash Request Lines")
//   var
//       ReceiptLines1: Record "Receipt Lines1";
//   begin
//       CashRequestLines.Reset;
//       CashRequestLines.SetRange(CashRequestLines."Document No",ReceiptsHeader1."Cash Request No");
//       if CashRequestLines.FindSet then
//         repeat
//           ReceiptLines1.Init;
//           ReceiptLines1."Receipt No.":=ReceiptsHeader1."No.";
//           ReceiptLines1."Line No":=ReceiptLines1.Count+1;
//           ReceiptLines1."Account Type":=ReceiptLines1."account type"::Customer;
//           ReceiptLines1."Account No.":=ReceiptsHeader1."Funding Agency ID";
//           ReceiptLines1.Validate("Account No.");
//           ReceiptLines1.Description:=CashRequestLines."Reference No. (Cert No.)";
//           ReceiptLines1."Gross Amount":=CashRequestLines."Net GoK Current Request";
//           ReceiptLines1.Amount:=CashRequestLines."Net GoK Current Request";
//           ReceiptLines1."Applies to Doc. No":=ReceiptsHeader1."Cash Request No";
//           ReceiptLines1."Project No":=CashRequestLines."Project Code";
//           ReceiptLines1.Validate("Project No");
//           ReceiptLines1."Contractor No":=CashRequestLines."Contractor ID";
//           ReceiptLines1.Validate("Contractor No");
//           if not ReceiptLines1.Insert(true) then
//             ReceiptLines1.Modify(true);
//          until CashRequestLines.Next=0;
//   end;

//   procedure FnSuggestCashRequestLinesFromVLedgerEntry(CashRequestHeader: Record "Cash Request Header";CashRequestLines: Record "Cash Request Lines")
//   var
//       VendorLedgerEntry: Record "Vendor Ledger Entry";
//   begin
//       CashRequestLines.Reset;
//       CashRequestLines.SetRange(CashRequestLines."Document No",CashRequestHeader."Document No");
//       if CashRequestLines.FindSet then
//       CashRequestLines.DeleteAll();


//       VendorLedgerEntry.Reset;
//       VendorLedgerEntry.SetRange(VendorLedgerEntry.Open,true);
//       VendorLedgerEntry.SetRange(VendorLedgerEntry."Document Type",VendorLedgerEntry."document type"::Invoice);
//       VendorLedgerEntry.SetRange(VendorLedgerEntry."Vendor Posting Group",'CONTRACTORS');
//       VendorLedgerEntry.SetFilter(VendorLedgerEntry."Remaining Amount",'<>%1',0);
//       if VendorLedgerEntry.FindSet then
//         begin

//           VendorLedgerEntry.CalcFields("Remaining Amount",Amount);
//           CashRequestLines.CalcFields("Supplementary Budget Amount","Net GoK Budgeted Amount","Net Exchequer Issued to Date");
//           repeat
//             CashRequestLines.Init;
//             CashRequestLines."Document No":=CashRequestHeader."Document No";
//             CashRequestLines."Line No":=CashRequestLines.Count+1;
//             CashRequestLines."Contractor ID":=VendorLedgerEntry."Vendor No.";
//             CashRequestLines.Validate("Contractor ID");

//             CashRequestLines."Project Code":=VendorLedgerEntry."Project No";
//             CashRequestLines.Validate("Project Code");
//             GLBudgetEntry.Reset;
//             GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name",CashRequestHeader."Financial Budget");
//             GLBudgetEntry.SetRange(GLBudgetEntry."Project Code",CashRequestLines."Project Code");
//             if GLBudgetEntry.FindSet then begin
//               CashRequestLines."IFMIS CODE":=GLBudgetEntry."KeRRA Budget Code";
//               end;
//             CashRequestLines."Cert Amount":=Abs(VendorLedgerEntry.Amount);
//             CashRequestLines."Amount Outstanding":=VendorLedgerEntry."Remaining Amount";
//             CashRequestLines."Reference No. (Cert No.)":=VendorLedgerEntry."Document No.";
//             if CashRequestLines."Net GoK Budgeted Amount"<> 0 then
//             CashRequestLines."Net GoK Budget Balance":=CashRequestLines."Net GoK Budgeted Amount"-CashRequestLines."Net Exchequer Issued to Date";
//             if CashRequestLines."Supplementary Budget Amount"<> 0 then
//             CashRequestLines."Net GoK Budget Balance":=CashRequestLines."Supplementary Budget Amount"-CashRequestLines."Net Exchequer Issued to Date";
//             if not CashRequestLines.Insert(true) then
//               CashRequestLines.Modify(true);
//            until VendorLedgerEntry.Next=0;
//         end;

//          Message('Lines Suggested Successfully');
//   end;

//   procedure FnInsertProjectRoadLinksToTheJob()
//   begin
//   end;

//   procedure FnPostAdvancePaymentRequest(CashRequestHeader: Record "Cash Request Header")
//   begin
//   end;

//   procedure FnPostQualityInspection(InspectionPlanLine: Record "Inspection Plan Line";InspectionHeadersss: Record "Inspection Headersss";InspectionLine: Record "Inspection Line")
//   var
//       CorrectiveOrdersHeader: Record "Corrective Orders Header";
//       CorrectiveOrderLine: Record "Corrective Order Line";
//   begin
//       InspectionPlanLine.Reset;
//       InspectionPlanLine.SetRange(InspectionPlanLine."Inspection No",InspectionHeadersss."Inspection No");
//       InspectionPlanLine.SetRange(InspectionPlanLine."Issue Corrective Order",true);
//       if InspectionPlanLine.FindSet then
//         repeat
//           CorrectiveOrdersHeader.Init;
//           CorrectiveOrdersHeader."Order No":='';
//           //MESSAGE(CorrectiveOrdersHeader."Order No");
//           CorrectiveOrdersHeader."Document Type":=CorrectiveOrdersHeader."document type"::"Corrective Order";
//           CorrectiveOrdersHeader."Document Date":=Today;
//           CorrectiveOrdersHeader."Project ID":=InspectionHeadersss."Project ID";
//           CorrectiveOrdersHeader.Validate("Project ID");
//           CorrectiveOrdersHeader."Source Inspection No":=InspectionHeadersss."Inspection No";
//           CorrectiveOrdersHeader."Project Name":=InspectionHeadersss."Project Name";
//           CorrectiveOrdersHeader."Contractor No":=InspectionHeadersss."Contractor No";
//           CorrectiveOrdersHeader."Purchase Contract ID":=InspectionHeadersss."Contract ID";
//           CorrectiveOrdersHeader.Validate("Purchase Contract ID");
//           CorrectiveOrdersHeader."Works Start Chainage":=InspectionHeadersss."Works Start Chainage";
//           CorrectiveOrdersHeader."Works End Chainage":=InspectionHeadersss."Works End Chainage";
//           CorrectiveOrdersHeader."Created By":=UserId;
//           CorrectiveOrdersHeader."Created DateTime":=CreateDatetime(Today,Time);
//           CorrectiveOrdersHeader.Status:=CorrectiveOrdersHeader.Status::Open;
//           if not CorrectiveOrdersHeader.Insert(true) then
//             CorrectiveOrdersHeader.Modify(true);
//         until InspectionPlanLine.Next=0;
//   end;

//   procedure FnSuggestProjectsFromBudgetEntries(RoadWorkProgram: Record "Road Work Program";DocumentType: Option " ","Road Work Plan","Global Budget Book","Multi-Year Programs","New Job Voucher")
//   var
//       GLBudgetEntry: Record "G/L Budget Entry";
//       Multi_YearWork: Record "Multi_Year Work";
//       DetailedMulti_YearLine: Record "Detailed Multi_Year Line";
//   begin
//       GLBudgetEntry.Reset;
//       GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name",RoadWorkProgram."Financial Budget ID");
//       GLBudgetEntry.SetRange(GLBudgetEntry."Project Type",DocumentType);
//       if GLBudgetEntry.FindSet then
//         begin
//           repeat
//             Multi_YearWork.Init;
//             Multi_YearWork."Road Work Program ID":=RoadWorkProgram.Code;
//             Multi_YearWork."KeRRA Budget Code":=GLBudgetEntry."KeRRA Budget Code";
//             Multi_YearWork.Description:=GLBudgetEntry.Description;
//             Multi_YearWork."Global Dimension Code 2":=GLBudgetEntry."Global Dimension 2 Code";
//             if not Multi_YearWork.Insert(true) then
//               Multi_YearWork.Modify(true);
//           until GLBudgetEntry.Next=0;
//         end;
//   end;

//   procedure FnSuggestProjectsFromBudgetEntriesWorksType(RoadWorkProgram: Record "Road Work Program";DocumentType: Option " ","Road Work Plan","Global Budget Book","Multi-Year Programs","New Job Voucher";WorksType: Option " ",Maintenance,"Road Construction","Survey/Study","Structure Construction")
//   var
//       GLBudgetEntry: Record "G/L Budget Entry";
//       Multi_YearWork: Record "Multi_Year Work";
//       DetailedMulti_YearLine: Record "Detailed Multi_Year Line";
//       NewRoadWorkProgramPackage: Record "New Road Work Program Package";
//   begin
//       GLBudgetEntry.Reset;
//       GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name",RoadWorkProgram."Financial Budget ID");
//       GLBudgetEntry.SetRange(GLBudgetEntry."Project Type",DocumentType);
//       GLBudgetEntry.SetRange(GLBudgetEntry."Works Type",WorksType);
//       if GLBudgetEntry.FindSet then
//         begin
//           repeat
//             NewRoadWorkProgramPackage.Init;
//             NewRoadWorkProgramPackage."Road Work Program ID":=RoadWorkProgram.Code;
//             NewRoadWorkProgramPackage."Package No.":=GLBudgetEntry."Entry No.";
//             NewRoadWorkProgramPackage.Validate("Package No.");
//             NewRoadWorkProgramPackage."KeRRA Budget Code":=GLBudgetEntry."KeRRA Budget Code";
//             NewRoadWorkProgramPackage."Package Name":=GLBudgetEntry.Description;
//             NewRoadWorkProgramPackage."Funding Source":=GLBudgetEntry."Global Dimension 2 Code";
//             NewRoadWorkProgramPackage."Funding Source ID":=GLBudgetEntry."Global Dimension 2 Code";
//             NewRoadWorkProgramPackage.Validate("Funding Source ID");
//             NewRoadWorkProgramPackage."Region ID":=RoadWorkProgram."Region ID";
//             NewRoadWorkProgramPackage."Directorate ID":=RoadWorkProgram."Directorate Code";
//             NewRoadWorkProgramPackage."Department ID":=RoadWorkProgram."Department Code";
//             if WorksType=Workstype::Maintenance then
//               NewRoadWorkProgramPackage."Road Project Category":=NewRoadWorkProgramPackage."road project category"::"Studies and Surveys";
//             if WorksType=Workstype::"Road Construction" then
//               NewRoadWorkProgramPackage."Road Project Category":=NewRoadWorkProgramPackage."road project category"::"Construction Works";
//             if WorksType=Workstype::"Survey/Study" then
//               NewRoadWorkProgramPackage."Road Project Category":=NewRoadWorkProgramPackage."road project category"::"Maintenance Works";
//             if not NewRoadWorkProgramPackage.Insert(true) then
//               NewRoadWorkProgramPackage.Modify(true);
//           until GLBudgetEntry.Next=0;
//         end;
//   end;

//   procedure FnSuggestFundingSourcesFromBudgetEntries(RoadWorkProgram: Record "Road Work Program";DocumentType: Option " ","Road Work Plan","Global Budget Book","Multi-Year Programs","New Job Voucher")
//   var
//       GLBudgetEntry: Record "G/L Budget Entry";
//       Multi_YearWork: Record "Multi_Year Work";
//       DetailedMulti_YearLine: Record "Detailed Multi_Year Line";
//       ProjectFundingSource: Record "Project Funding Source";
//   begin
//       GLBudgetEntry.Reset;
//       GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name",RoadWorkProgram."Financial Budget ID");
//       GLBudgetEntry.SetRange(GLBudgetEntry."Project Type",DocumentType);
//       if GLBudgetEntry.FindSet then
//         begin
//           repeat
//             ProjectFundingSource.Init;
//             ProjectFundingSource."Road Work Program ID":=RoadWorkProgram.Code;
//             ProjectFundingSource."KeRRA Budget Code":=GLBudgetEntry."KeRRA Budget Code";
//             ProjectFundingSource."Funding Source ID":=GLBudgetEntry."Global Dimension 2 Code";
//             ProjectFundingSource.Validate("Funding Source ID");
//             if not ProjectFundingSource.Insert(true) then
//               ProjectFundingSource.Modify(true);
//           until GLBudgetEntry.Next=0;
//         end;
//   end;

//   procedure FnCreateProjectRoadLinksFromPlanToJob(ObjRoadWorkProgram: Record "Road Work Program";RoadWorkPlanPackage: Record "Road WorkPlan Package")
//   var
//       ProjectRoadLink: Record "Project Road Link";
//       ObjProjectRoadLink: Record "Project Road Link";
//       Layer: Record Layer;
//       ProjectRoadLinkConstituency: Record "Project Road Link Constituency";
//       ObjLayer: Record Layer;
//       ObjProjectRoadLinkConstituency: Record "Project Road Link Constituency";
//   begin
//       RoadWorkPlanPackage.Reset;
//       RoadWorkPlanPackage.SetRange(RoadWorkPlanPackage."Road Work Program ID",ObjRoadWorkProgram.Code);
//       if RoadWorkPlanPackage.FindSet then begin
//         repeat
//       ProjectRoadLink.Reset;
//       ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code",ObjRoadWorkProgram.Code);
//       ProjectRoadLink.SetRange(ProjectRoadLink."KeRRA Budget Code",RoadWorkPlanPackage."KeRRA Budget Code");
//       if ProjectRoadLink.FindSet then
//         repeat
//           ObjProjectRoadLink.Init;
//           ObjProjectRoadLink.TransferFields(ProjectRoadLink);
//           ObjProjectRoadLink."Global Budget Book Code":=RoadWorkPlanPackage."Project No";
//           ObjProjectRoadLink."KeRRA Budget Code":=RoadWorkPlanPackage."KeRRA Budget Code";
//           ObjProjectRoadLink."Line No":=ObjProjectRoadLink.Count+1;
//           if not ObjProjectRoadLink.Insert(true) then
//             ObjProjectRoadLink.Modify(true);





//          until ProjectRoadLink.Next=0;
//          until RoadWorkPlanPackage.Next=0;
//          end;
//   end;

//   procedure FnCreateProjectScopeOfWorks(ObjRoadWorkProgram: Record "Road Work Program";RoadWorkPlanPackage: Record "Road WorkPlan Package";ProjectRoadLink: Record "Project Road Link")
//   var
//       Layer: Record Layer;
//       ObjLayer: Record Layer;
//   begin
//       //Start Insert Scope of Works
//       /*ProjectRoadLink.RESET;
//       ProjectRoadLink.SETRANGE(ProjectRoadLink."Global Budget Book Code",ObjRoadWorkProgram.Code);
//       IF ProjectRoadLink.FINDSET THEN BEGIN
//         REPEAT
//          Layer.RESET;
//          Layer.SETRANGE(Layer."Road Code",ProjectRoadLink."Road Code");
//          IF Layer.FINDSET THEN
//            REPEAT
//              ObjLayer.INIT;
//              ObjLayer.TRANSFERFIELDS(Layer);
//              ObjLayer."Road Code":=ProjectRoadLink."Road Code";
//              ObjLayer."Line No":=ObjLayer.COUNT+1;
//              IF NOT ObjLayer.INSERT(TRUE) THEN
//                ObjLayer.MODIFY(TRUE);
//              UNTIL Layer.NEXT=0;
//              UNTIL ProjectRoadLink.NEXT=0;
//              END;*/
//            //End Insert Scope of Works

//   end;

//   procedure FnCreateProjectConstituencies(ObjRoadWorkProgram: Record "Road Work Program";RoadWorkPlanPackage: Record "Road WorkPlan Package";ProjectRoadLink: Record "Project Road Link")
//   var
//       ProjectRoadLinkConstituency: Record "Project Road Link Constituency";
//       ObjProjectRoadLinkConstituency: Record "Project Road Link Constituency";
//   begin
//       //Insert Road Constituencies
//          ProjectRoadLink.Reset;
//          ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code",ObjRoadWorkProgram.Code);
//          if ProjectRoadLink.FindSet then begin
//            repeat
//          ProjectRoadLinkConstituency.Reset;
//          ProjectRoadLinkConstituency.SetRange(ProjectRoadLinkConstituency."Road Code",ProjectRoadLink."Road Code");
//          if ProjectRoadLinkConstituency.FindSet then
//            repeat
//              ObjProjectRoadLinkConstituency.Init;
//              ObjProjectRoadLinkConstituency.TransferFields(ProjectRoadLinkConstituency);
//              ObjProjectRoadLinkConstituency."Road Code":=ProjectRoadLink."Road Code";
//              ObjProjectRoadLinkConstituency."Global Budget Book ID":=ProjectRoadLink."Global Budget Book Code";
//              ObjProjectRoadLinkConstituency."KeRRA Budget Code":=ProjectRoadLink."KeRRA Budget Code";
//              if not ObjProjectRoadLinkConstituency.Insert(true) then
//                ObjProjectRoadLinkConstituency.Modify(true);
//              until ProjectRoadLinkConstituency.Next=0;
//              until ProjectRoadLink.Next=0;
//              end;
//            //End Road Constituencies
//   end;

//   procedure FnUpdateMobilizationChecklist(ProjectMobilizationHeader: Record "Project Mobilization Header")
//   var
//       MobilizationChecklist: Record "Mobilization Checklist";
//       ChecklistStatusReport: Record "Checklist Status Report";
//   begin
//       //  MobilizationChecklist.RESET;
//       //  MobilizationChecklist.SETRANGE(MobilizationChecklist."Document No.",ProjectMobilizationHeader."Mobilization Checklist No");
//       //  MobilizationChecklist.SETRANGE(MobilizationChecklist."Document Type",MobilizationChecklist."Document Type"::"Mobilization Checklist");
//       //  IF MobilizationChecklist.FINDSET THEN BEGIN
//       //    REPEAT
//             ChecklistStatusReport.Reset;
//             ChecklistStatusReport.SetRange(ChecklistStatusReport."Mobilization Checlist No.",ProjectMobilizationHeader."Mobilization Checklist No");
//             ChecklistStatusReport.SetRange(ChecklistStatusReport."Document No.",ProjectMobilizationHeader."Document No.");
//             ChecklistStatusReport.SetRange(ChecklistStatusReport."Document Type",ProjectMobilizationHeader."Document Type");
//             if ChecklistStatusReport.FindSet then begin
//               repeat
//                 MobilizationChecklist.Status:=ChecklistStatusReport.Status;
//                 MobilizationChecklist."Percentage Completion":=ChecklistStatusReport."Percentage Completion";
//                 MobilizationChecklist."Additional Remarks/Comments":=ChecklistStatusReport."Additional Remarks/Comments";
//                 MobilizationChecklist."Date of Completion":=ChecklistStatusReport."Date of Completion";
//                 MobilizationChecklist.Modify(true);

//           until ChecklistStatusReport.Next=0;
//           end;
//           //UNTIL MobilizationChecklist.NEXT=0;
//              // END;

//   end;

//   procedure FnSuggestSubContractorRequiredDocuments(SubcontractingHeader: Record "Subcontracting Header")
//   var
//       SubcontractingRequiredDoc: Record "Subcontracting Required Doc";
//       ProjectDocumentTemplate: Record "Project Document Template";
//       ProjectDocumentTemplateLine: Record "Project Document Template Line";
//   begin
//       ProjectDocumentTemplateLine.Reset;
//       ProjectDocumentTemplateLine.SetRange(ProjectDocumentTemplateLine."Template ID",SubcontractingHeader."Required Documents Template ID");
//       if ProjectDocumentTemplateLine.FindSet then
//         repeat
//           SubcontractingRequiredDoc.Init;
//           SubcontractingRequiredDoc."Document No.":=SubcontractingHeader."Document No";
//           SubcontractingRequiredDoc."Document Type":=ProjectDocumentTemplateLine."Document Type";
//           SubcontractingRequiredDoc.Description:=ProjectDocumentTemplateLine.Description;
//           SubcontractingRequiredDoc."Requirement Type":=ProjectDocumentTemplateLine."Requirement Type";
//           SubcontractingRequiredDoc."Guidelines/Instructions":=ProjectDocumentTemplateLine."Guidelines/Instructions";
//           SubcontractingRequiredDoc."Due Date":=Today;
//           if not SubcontractingRequiredDoc.Insert(true) then
//             SubcontractingRequiredDoc.Modify(true);
//           until ProjectDocumentTemplateLine.Next=0;
//   end;

//   procedure FNPostPOP(JobPlanningLine: Record "Job Planning Line";ExtensionofTimeLine: Record "Project Eval Time Line";ProjectVariationHeader: Record "Project Evaluation Header")
//   begin
//       ExtensionofTimeLine.Reset;
//       ExtensionofTimeLine.SetRange(ExtensionofTimeLine."Document Type",ProjectVariationHeader."Document Type");
//       ExtensionofTimeLine.SetRange(ExtensionofTimeLine."Document No.",ProjectVariationHeader."Document No.");
//       if ExtensionofTimeLine.FindSet then
//         repeat
//           JobPlanningLine.Reset;
//           JobPlanningLine.SetRange(JobPlanningLine."Job No.",ProjectVariationHeader."Project ID");
//           JobPlanningLine.SetRange(JobPlanningLine."Job Task No.",ExtensionofTimeLine."Job Task No.");
//           JobPlanningLine.SetRange(JobPlanningLine."Line No.",ExtensionofTimeLine."Line No.");
//           if JobPlanningLine.FindSet then
//             repeat
//               JobPlanningLine."Planning Date":=ExtensionofTimeLine."Revised Planning Date";
//               JobPlanningLine."Planned Delivery Date":=ExtensionofTimeLine."Revised Planning Date";
//               if not JobPlanningLine.Insert(true) then
//                JobPlanningLine.Modify(true);
//             until JobPlanningLine.Next=0;
//         until ExtensionofTimeLine.Next=0;
//   end;

//   procedure FnPostEOTIME(ProjectVariationHeader: Record "Project Variation Header")
//   var
//       ProjectEvaluationHeader: Record "Project Evaluation Header";
//       ProjectEvaluationLines: Record "Project Evaluation Lines";
//       ProjectEvaluationSection: Record "Project Evaluation Section";
//       ExtensionofTimeReason: Record "Extension of Time Reason";
//       ProjectVariationSection: Record "Project Variation Section";
//       ProjectEvaluationCommittee: Record "Project Evaluation Committee";
//       ProjectVariationCommittee: Record "Project Variation Committee";
//   begin
//       ProjectEvaluationHeader.TestField(Posted,false);
//       ProjectEvaluationHeader.TestField(ProjectEvaluationHeader.Status,ProjectEvaluationHeader.Status::Released);
//       ProjectEvaluationHeader.Init;
//       ProjectEvaluationHeader."Document No.":=ProjectEvaluationHeader."Document No.";
//       ProjectEvaluationHeader."Document Type":=ProjectEvaluationHeader."document type"::"Evaluation Report";
//       ProjectEvaluationHeader.Description:=ProjectVariationHeader."Document No."+' Evaluation Report';
//       ProjectEvaluationHeader."Document Date":=Today;
//       ProjectEvaluationHeader."Project ID":=ProjectVariationHeader."Project ID";
//       ProjectEvaluationHeader."Extension Reason Code":=ProjectVariationHeader."Extension Reason Code";
//       ProjectEvaluationHeader."Variation Reason Code":=ProjectVariationHeader."Variation Reason Code";
//       ProjectEvaluationHeader."Executive Summary":=ProjectVariationHeader."Executive Summary";
//       ProjectEvaluationHeader."Original Value of Work (LCY)":=ProjectVariationHeader."Original Value of Work (LCY)";
//       ProjectEvaluationHeader."New Varied Works Value (LCY)":=ProjectVariationHeader."New Varied Works Value (LCY)";
//       ProjectEvaluationHeader."Net Change Value of Work (LCY)":=ProjectVariationHeader."Net Change Value of Work (LCY)";
//       ProjectEvaluationHeader."Project Name":=ProjectVariationHeader."Project Name";
//       ProjectEvaluationHeader."Road Code":=ProjectVariationHeader."Road Code";
//       ProjectEvaluationHeader."Road Section No.":=ProjectVariationHeader."Road Section No.";
//       ProjectEvaluationHeader."Region ID":=ProjectVariationHeader."Region ID";
//       ProjectEvaluationHeader."Directorate ID":=ProjectVariationHeader."Directorate ID";
//       ProjectEvaluationHeader."Department ID":=ProjectVariationHeader."Department ID";
//       ProjectEvaluationHeader."Purchase Contract ID":=ProjectVariationHeader."Purchase Contract ID";
//       ProjectEvaluationHeader."External Contract Reference":=ProjectVariationHeader."External Contract Reference";
//       ProjectEvaluationHeader."Contractor No.":=ProjectVariationHeader."Contractor No.";
//       ProjectEvaluationHeader."Contractor Name":=ProjectVariationHeader."Contractor Name";
//       ProjectEvaluationHeader."Contractor Representative":=ProjectVariationHeader."Contractor Representative";
//       ProjectEvaluationHeader."Contractor Rep Email":=ProjectVariationHeader."Contractor Rep Email";
//       ProjectEvaluationHeader."Award Tender Sum Inc Taxes":=ProjectVariationHeader."Award Tender Sum Inc Taxes";
//       ProjectEvaluationHeader."Original Project Ending Date":=ProjectVariationHeader."Original Project Ending Date";
//       ProjectEvaluationHeader."Original Project Starting Date":=ProjectVariationHeader."Original Project Starting Date";
//       ProjectEvaluationHeader."Requested Extension Period":=ProjectVariationHeader."Requested Extension Period";
//       ProjectEvaluationHeader."Extended Project End Date":=ProjectVariationHeader."Extended Project End Date";
//       ProjectEvaluationHeader."Contractor Variation Req No.":=ProjectVariationHeader."Contractor Variation Req No.";
//       ProjectEvaluationHeader."Value of Work Added":=ProjectVariationHeader."Value of Work Added";
//       ProjectEvaluationHeader."Value of Work Omitted":=ProjectVariationHeader."Value of Work Omitted";
//       ProjectEvaluationHeader."Project Engineer No.":=ProjectVariationHeader."Project Engineer No.";
//       ProjectEvaluationHeader."Project Manager":=ProjectVariationHeader."Project Manager";
//       ProjectEvaluationHeader."Review Status":=ProjectVariationHeader."Review Status";
//       ProjectEvaluationHeader."Review Rejection Notes":=ProjectVariationHeader."Review Rejection Notes";
//       ProjectEvaluationHeader."Project Variation Order No.":=ProjectVariationHeader."Project Variation Order No.";
//       ProjectEvaluationHeader."Dimension Set ID":=ProjectVariationHeader."Dimension Set ID";
//       ProjectEvaluationHeader."Shortcut Dimension 1 Code":=ProjectVariationHeader."Shortcut Dimension 1 Code";
//       ProjectEvaluationHeader."Shortcut Dimension 2 Code":=ProjectVariationHeader."Shortcut Dimension 2 Code";
//       ProjectEvaluationHeader."Variation Percentage(%)":=ProjectVariationHeader."Variation Percentage(%)";
//       ProjectEvaluationHeader."Total Project Cost Excl. VAT":=ProjectVariationHeader."Total Project Cost Excl. VAT";
//       ProjectEvaluationHeader."Total Project Cost Incl. VAT":=ProjectVariationHeader."Total Project Cost Incl. VAT";
//       ProjectEvaluationHeader."Contingency Amount":=ProjectVariationHeader."Contingency Amount";
//       ProjectEvaluationHeader."Variation of Price Amount":=ProjectVariationHeader."Variation of Price Amount";
//       ProjectEvaluationHeader."Variation Order No":=ProjectVariationHeader."Variation Order No";
//       ProjectEvaluationHeader."Contract Sum Variation %":=ProjectVariationHeader."Contract Sum Variation %";
//       ProjectEvaluationHeader."Grounds For EOT Request":=ProjectVariationHeader."Grounds For EOT Request";
//       // ProjectEvaluationHeader."Evaluation Remarks":=ProjectVariationHeader."Extended Project End Date
//       // ProjectEvaluationHeader."Professional Opinion":=
//       ProjectEvaluationHeader."EOT No":=ProjectVariationHeader."Document No.";
//       if ProjectEvaluationHeader.Insert(true) then begin
//         ExtensionofTimeReason.Reset;
//         ExtensionofTimeReason.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         //ExtensionofTimeReason.SETRANGE("Document Type",ExtensionofTimeReason."Document Type"::"Extension of Time Request");
//         if ExtensionofTimeReason.FindSet then begin
//         repeat
//           ProjectEvaluationLines.Init;
//           ProjectEvaluationLines."Document Type":=ProjectEvaluationLines."document type"::"Evaluation Report";
//           ProjectEvaluationLines."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationLines."Line No.":=ProjectEvaluationLines."Line No."+1;
//           ProjectEvaluationLines."Cause of Delay":=ExtensionofTimeReason."Cause of Delay";
//           ProjectEvaluationLines."EOT Requested Days":=ExtensionofTimeReason."EOT Requested Days";
//           ProjectEvaluationLines."Job No.":=ExtensionofTimeReason."Job No.";
//           ProjectEvaluationLines."Job Task No.":=ExtensionofTimeReason."Job Task No.";
//           ProjectEvaluationLines."Dimension Set ID":=ExtensionofTimeReason."Dimension Set ID";
//           ProjectEvaluationLines."Shortcut Dimension 1 Code":=ExtensionofTimeReason."Shortcut Dimension 1 Code";
//           ProjectEvaluationLines."Shortcut Dimension 2 Code":=ExtensionofTimeReason."Shortcut Dimension 2 Code";
//           ProjectEvaluationLines.Insert(true);
//       until ExtensionofTimeReason.Next=0;
//       end;
//       ProjectVariationSection.Reset;
//       ProjectVariationSection.SetRange("Document No.",ProjectVariationHeader."Document No.");
//       //ProjectVariationSection.SETRANGE("Document Type",ProjectVariationHeader."Document Type"::"Extension of Time Request");
//       if ProjectVariationSection.FindSet then begin
//         repeat
//           ProjectEvaluationSection.Init;
//           ProjectEvaluationSection."Document Type":=ProjectEvaluationSection."document type"::"Evaluation Report";
//           ProjectEvaluationSection."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationSection.Section:=ProjectVariationSection.Section;
//           ProjectEvaluationSection."Line No.":=ProjectEvaluationSection."Line No."+1;
//           ProjectEvaluationSection.Description:=ProjectVariationSection.Description;
//           ProjectEvaluationSection.Insert(true);
//           until ProjectVariationSection.Next=0;
//         end;
//           ProjectVariationCommittee.Reset;
//         ProjectVariationCommittee.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         if ProjectVariationCommittee.FindSet then begin
//           repeat
//             ProjectEvaluationCommittee.Init;
//             ProjectEvaluationCommittee."Document Type":=ProjectEvaluationCommittee."document type"::"Evaluation Report";
//             ProjectEvaluationCommittee."Document No.":=ProjectEvaluationHeader."Document No.";
//             ProjectEvaluationCommittee."Resource No.":=ProjectVariationCommittee."Resource No.";
//             ProjectEvaluationCommittee.Name:=ProjectVariationCommittee.Name;
//             ProjectEvaluationCommittee.Email:=ProjectVariationCommittee.Email;
//             ProjectEvaluationCommittee.Role:=ProjectVariationCommittee.Role;
//             ProjectEvaluationCommittee.Insert(true);
//             until ProjectVariationCommittee.Next=0;
//             end;
//       Message('EOT %1 posted successfully',ProjectEvaluationHeader."Document No.");
//       Page.Run(72664,ProjectEvaluationHeader);
//       end;
//   end;

//   procedure FnPostProjectEvaluationReport(ProjectVariationHeader: Record "Project Evaluation Header")
//   var
//       ProjectEvaluationHeader: Record "Project Evaluation Header";
//       ProjectEvaluationLines: Record "Project Evaluation Lines";
//       ProjectEvaluationSection: Record "Project Evaluation Section";
//       ExtensionofTimeReason: Record "Project Evaluation Lines";
//       ProjectVariationSection: Record "Project Evaluation Section";
//       ProjectEvaluationCommittee: Record "Project Evaluation Committee";
//       ProjectVariationCommittee: Record "Project Evaluation Committee";
//       ProjectVariationLine: Record "Project Variation Line";
//   begin
//       ProjectEvaluationHeader.TestField(Posted,false);
//       ProjectEvaluationHeader.Init;
//       ProjectEvaluationHeader."Document No.":=ProjectEvaluationHeader."Document No.";
//       ProjectEvaluationHeader."Document Type":=ProjectEvaluationHeader."document type"::"Professional Opinion";
//       ProjectEvaluationHeader.Description:=ProjectVariationHeader."Document No."+' Professional Opinion';
//       ProjectEvaluationHeader."Document Date":=Today;
//       ProjectEvaluationHeader."Project ID":=ProjectVariationHeader."Project ID";
//       ProjectEvaluationHeader."Extension Reason Code":=ProjectVariationHeader."Extension Reason Code";
//       ProjectEvaluationHeader."Variation Reason Code":=ProjectVariationHeader."Variation Reason Code";
//       ProjectEvaluationHeader."Executive Summary":=ProjectVariationHeader."Executive Summary";
//       ProjectEvaluationHeader."Original Value of Work (LCY)":=ProjectVariationHeader."Original Value of Work (LCY)";
//       ProjectEvaluationHeader."New Varied Works Value (LCY)":=ProjectVariationHeader."New Varied Works Value (LCY)";
//       ProjectEvaluationHeader."Net Change Value of Work (LCY)":=ProjectVariationHeader."Net Change Value of Work (LCY)";
//       ProjectEvaluationHeader."Project Name":=ProjectVariationHeader."Project Name";
//       ProjectEvaluationHeader."Road Code":=ProjectVariationHeader."Road Code";
//       ProjectEvaluationHeader."Road Section No.":=ProjectVariationHeader."Road Section No.";
//       ProjectEvaluationHeader."Region ID":=ProjectVariationHeader."Region ID";
//       ProjectEvaluationHeader."Directorate ID":=ProjectVariationHeader."Directorate ID";
//       ProjectEvaluationHeader."Department ID":=ProjectVariationHeader."Department ID";
//       ProjectEvaluationHeader."Purchase Contract ID":=ProjectVariationHeader."Purchase Contract ID";
//       ProjectEvaluationHeader."External Contract Reference":=ProjectVariationHeader."External Contract Reference";
//       ProjectEvaluationHeader."Contractor No.":=ProjectVariationHeader."Contractor No.";
//       ProjectEvaluationHeader."Contractor Name":=ProjectVariationHeader."Contractor Name";
//       ProjectEvaluationHeader."Contractor Representative":=ProjectVariationHeader."Contractor Representative";
//       ProjectEvaluationHeader."Contractor Rep Email":=ProjectVariationHeader."Contractor Rep Email";
//       ProjectEvaluationHeader."Award Tender Sum Inc Taxes":=ProjectVariationHeader."Award Tender Sum Inc Taxes";
//       ProjectEvaluationHeader."Original Project Ending Date":=ProjectVariationHeader."Original Project Ending Date";
//       ProjectEvaluationHeader."Original Project Starting Date":=ProjectVariationHeader."Original Project Starting Date";
//       ProjectEvaluationHeader."Requested Extension Period":=ProjectVariationHeader."Requested Extension Period";
//       ProjectEvaluationHeader."Extended Project End Date":=ProjectVariationHeader."Extended Project End Date";
//       ProjectEvaluationHeader."Contractor Variation Req No.":=ProjectVariationHeader."Contractor Variation Req No.";
//       ProjectEvaluationHeader."Value of Work Added":=ProjectVariationHeader."Value of Work Added";
//       ProjectEvaluationHeader."Value of Work Omitted":=ProjectVariationHeader."Value of Work Omitted";
//       ProjectEvaluationHeader."Project Engineer No.":=ProjectVariationHeader."Project Engineer No.";
//       ProjectEvaluationHeader."Project Manager":=ProjectVariationHeader."Project Manager";
//       ProjectEvaluationHeader."Review Status":=ProjectVariationHeader."Review Status";
//       ProjectEvaluationHeader."Review Rejection Notes":=ProjectVariationHeader."Review Rejection Notes";
//       ProjectEvaluationHeader."Project Variation Order No.":=ProjectVariationHeader."Project Variation Order No.";
//       ProjectEvaluationHeader."Dimension Set ID":=ProjectVariationHeader."Dimension Set ID";
//       ProjectEvaluationHeader."Shortcut Dimension 1 Code":=ProjectVariationHeader."Shortcut Dimension 1 Code";
//       ProjectEvaluationHeader."Shortcut Dimension 2 Code":=ProjectVariationHeader."Shortcut Dimension 2 Code";
//       ProjectEvaluationHeader."Variation Percentage(%)":=ProjectVariationHeader."Variation Percentage(%)";
//       ProjectEvaluationHeader."Total Project Cost Excl. VAT":=ProjectVariationHeader."Total Project Cost Excl. VAT";
//       ProjectEvaluationHeader."Total Project Cost Incl. VAT":=ProjectVariationHeader."Total Project Cost Incl. VAT";
//       ProjectEvaluationHeader."Contingency Amount":=ProjectVariationHeader."Contingency Amount";
//       ProjectEvaluationHeader."Variation of Price Amount":=ProjectVariationHeader."Variation of Price Amount";
//       ProjectEvaluationHeader."Variation Order No":=ProjectVariationHeader."Variation Order No";
//       ProjectEvaluationHeader."Contract Sum Variation %":=ProjectVariationHeader."Contract Sum Variation %";
//       ProjectEvaluationHeader."Grounds For EOT Request":=ProjectVariationHeader."Grounds For EOT Request";
//       ProjectEvaluationHeader."Evaluation Remarks":=ProjectVariationHeader."Evaluation Remarks";
//       ProjectEvaluationHeader."Professional Opinion":=ProjectVariationHeader."Professional Opinion";
//       ProjectEvaluationHeader."EOT No":=ProjectVariationHeader."EOT No";
//       if ProjectEvaluationHeader.Insert(true) then begin
//         ExtensionofTimeReason.Reset;
//         ExtensionofTimeReason.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         //ExtensionofTimeReason.SETRANGE("Document Type",ExtensionofTimeReason."Document Type"::"Extension of Time Request");
//         if ExtensionofTimeReason.FindSet then begin
//         repeat
//           ProjectEvaluationLines.Init;
//           ProjectEvaluationLines."Document Type":=ProjectEvaluationLines."document type"::"Professional Opinion";
//           ProjectEvaluationLines."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationLines."Line No.":=ProjectEvaluationLines."Line No."+1;
//           ProjectEvaluationLines."Cause of Delay":=ExtensionofTimeReason."Cause of Delay";
//           ProjectEvaluationLines."EOT Requested Days":=ExtensionofTimeReason."EOT Requested Days";
//           ProjectEvaluationLines."Job No.":=ExtensionofTimeReason."Job No.";
//           ProjectEvaluationLines."Job Task No.":=ExtensionofTimeReason."Job Task No.";
//           ProjectEvaluationLines."Dimension Set ID":=ExtensionofTimeReason."Dimension Set ID";
//           ProjectEvaluationLines."Shortcut Dimension 1 Code":=ExtensionofTimeReason."Shortcut Dimension 1 Code";
//           ProjectEvaluationLines."Shortcut Dimension 2 Code":=ExtensionofTimeReason."Shortcut Dimension 2 Code";
//           ProjectEvaluationLines."Evaluation Remarks":=ExtensionofTimeReason."Evaluation Remarks";
//           ProjectEvaluationLines."Professional Opinion":=ExtensionofTimeReason."Professional Opinion";
//           ProjectEvaluationLines."EOT Recommended Days":=ExtensionofTimeReason."EOT Recommended Days";
//           ProjectEvaluationLines.Insert(true);
//       until ExtensionofTimeReason.Next=0;
//       end;
//       ProjectVariationSection.Reset;
//       ProjectVariationSection.SetRange("Document No.",ProjectVariationHeader."Document No.");
//       //ProjectVariationSection.SETRANGE("Document Type",ProjectVariationHeader."Document Type"::"Extension of Time Request");
//       if ProjectVariationSection.FindSet then begin
//         repeat
//           ProjectEvaluationSection.Init;
//           ProjectEvaluationSection."Document Type":=ProjectEvaluationSection."document type"::"Professional Opinion";
//           ProjectEvaluationSection."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationSection.Section:=ProjectVariationSection.Section;
//           ProjectEvaluationSection."Line No.":=ProjectEvaluationSection."Line No."+1;
//           ProjectEvaluationSection.Description:=ProjectVariationSection.Description;
//           ProjectEvaluationSection.Insert(true);
//           until ProjectVariationSection.Next=0;
//         end;
//         ProjectVariationCommittee.Reset;
//         ProjectVariationCommittee.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         if ProjectVariationCommittee.FindSet then begin
//           repeat
//             ProjectEvaluationCommittee.Init;
//             ProjectEvaluationCommittee."Document Type":=ProjectEvaluationCommittee."document type"::"Professional Opinion";
//             ProjectEvaluationCommittee."Document No.":=ProjectEvaluationHeader."Document No.";
//             ProjectEvaluationCommittee."Resource No.":=ProjectVariationCommittee."Resource No.";
//             ProjectEvaluationCommittee.Name:=ProjectVariationCommittee.Name;
//             ProjectEvaluationCommittee.Email:=ProjectVariationCommittee.Email;
//             ProjectEvaluationCommittee.Role:=ProjectVariationCommittee.Role;
//             ProjectEvaluationCommittee.Insert(true);
//             until ProjectVariationCommittee.Next=0;
//             end;
//       Message('Posted successfully');
//       Page.Run(72669,ProjectEvaluationHeader);
//       end;
//   end;


//   procedure FnCreateRWProgramTasksFromBOQTemplatePBRM(ObjRWPL: Record "Road WorkPlan Package";Job: Record Job;JobTask: Record "New Road Work Program Task";ObjRWPH: Record "Road Work Program")
//   var
//       PRTempH: Record "Purchase Requisition Template";
//       RTLine: Record "Requisition Template Line";
//       ItemCategory: Record "Item Category";
//   begin
//        ObjRWPL.Reset;
//        ObjRWPL.SetRange(ObjRWPL."Road Work Program ID",ObjRWPH.Code);
//        if ObjRWPL.FindSet then
//         begin
//           repeat
//           RTLine.Reset;
//           RTLine.SetRange(RTLine."Requisition Template ID",ObjRWPL."PBRM BoQ Template Code");
//           if RTLine.FindSet  then
//             begin
//                repeat
//                 JobTask.Init;
//                 JobTask."Road Work Program ID":=ObjRWPL."Road Work Program ID";
//                 JobTask."Package No.":=ObjRWPL."Project No";
//                 JobTask."BoQ Template Code":=ObjRWPL."PBRM BoQ Template Code";
//                 JobTask."Bill Item Category Code":=RTLine."Item Category Code";
//                 JobTask."Entry No":=JobTask.Count+1;
//                 ItemCategory.Reset;
//                 ItemCategory.SetRange(Code,RTLine."Item Category Code");
//                 if ItemCategory.FindSet then
//                 JobTask.Description:=ItemCategory.Description;
//                 if not JobTask.Get(JobTask."Road Work Program ID",JobTask."Package No.",JobTask."BoQ Template Code", JobTask."Bill Item Category Code") then
//                 JobTask.Insert() ;
//               until RTLine.Next=0;
//             end;
//             until ObjRWPL.Next=0;
//            end;
//   end;


//   procedure FnCreateRWPPlanningLinesFromBOQTemplatesPBRM(ObjRWPL: Record "Road WorkPlan Package";Job: Record Job;ObjJobPlanLine: Record "New Road Work Program Activity";ObjRWPH: Record "Road Work Program")
//   var
//       PRTempH: Record "Purchase Requisition Template";
//       RTLine: Record "Requisition Template Line";
//       ItemCategory: Record "Item Category";
//   begin
//       ObjRWPL.Reset;
//       ObjRWPL.SetRange(ObjRWPL."Road Work Program ID",ObjRWPH.Code);
//       if ObjRWPL.FindSet then
//         begin
//           repeat
//           RTLine.Reset;
//           RTLine.SetRange(RTLine."Requisition Template ID",ObjRWPL."PBRM BoQ Template Code");
//           if RTLine.FindSet then
//             begin
//                repeat
//                 ObjJobPlanLine.Init;
//                 ObjJobPlanLine."Road Work Program ID":=ObjRWPL."Road Work Program ID";
//                 ObjJobPlanLine."Budget Entry No":=ObjRWPL."Budget Entry No";
//                 ObjJobPlanLine."Project No":=ObjRWPL."Project No";
//                 ObjJobPlanLine."BoQ Template Code":=ObjRWPL."PBRM BoQ Template Code";
//                 ObjJobPlanLine."Bill Item Category Code":=RTLine."Item Category Code";
//                 ObjJobPlanLine."Activity Code":=RTLine."No.";
//                 ObjJobPlanLine."Entry No":=ObjJobPlanLine.Count+1;
//                 ObjJobPlanLine.Description:=RTLine.Description;
//                 ObjJobPlanLine.Validate(Description);
//                 ObjJobPlanLine."Planned Quantity":=RTLine.Quantity;
//                 ObjJobPlanLine.Validate("Planned Quantity");
//                 ObjJobPlanLine."Planned Rate (Unit Cost)":=RTLine."Unit Amount Excl. VAT";
//                 ObjJobPlanLine.Validate("Packaged Quantity");
//                 ObjJobPlanLine."Engineer's Rate (Unit Cost)":=RTLine."Unit Amount Excl. VAT";
//                 ObjJobPlanLine.Validate("Engineer's Rate (Unit Cost)");
//                 ObjJobPlanLine."Technology Type":=RTLine."Technology Type";
//                 ObjJobPlanLine.Validate("Technology Type");
//                 ObjJobPlanLine."Gen. Prod. Posting Group":=ObjRWPL."VAT Bus. Posting Group";
//                 ObjJobPlanLine."VAT Prod. Posting Group":=ObjRWPL."VAT Prod. Posting Group";
//                 ObjJobPlanLine."Unit of Measure Code":=RTLine."Unit of Measure Code";
//                 ObjJobPlanLine.Validate("Unit of Measure Code");
//                 ObjJobPlanLine."Contract Type":=ObjJobPlanLine."contract type"::PBRM;
//                 //added for reversion type
//                 ObjJobPlanLine."Reversion Type":= RTLine."Reversion Type";
//                 if not ObjJobPlanLine.Insert(true) then
//                 ObjJobPlanLine.Modify(true);
//               until RTLine.Next=0;
//             end;
//             until ObjRWPL.Next=0;
//            end;
//   end;

//   procedure FnPostAdvanceGuaranteeToContract(InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header")
//   var
//       Bid_ContractSecurityRegister: Record "Bid_Contract Security Register";
//       PurchaseHeader: Record "Purchase Header";
//   begin
//           Bid_ContractSecurityRegister.Reset;
//           Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."No.",InsuranceGuaranteeHeader."Purchase Contract ID");
//           Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."Security Type",Bid_ContractSecurityRegister."security type"::"Advance Payment Security");
//           //Bid_ContractSecurityRegister.SETRANGE(Bid_ContractSecurityRegister."Reference No",InsuranceGuaranteeHeader."Advance Document No To Revise");
//           Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister.Blocked,false);
//           if Bid_ContractSecurityRegister.FindSet then
//             begin
//               repeat
//                   Bid_ContractSecurityRegister.Blocked:=true;
//                   Bid_ContractSecurityRegister.Modify(true);
//               until Bid_ContractSecurityRegister.Next=0;
//               end;


//           Bid_ContractSecurityRegister.Init;
//           Bid_ContractSecurityRegister."Security ID":=Bid_ContractSecurityRegister.Count()+10;
//           Bid_ContractSecurityRegister."Vendor No.":=InsuranceGuaranteeHeader."Contractor ID";
//           Bid_ContractSecurityRegister."No.":=InsuranceGuaranteeHeader."Purchase Contract ID";
//           Bid_ContractSecurityRegister."Reference No":=InsuranceGuaranteeHeader."Policy/Guarantee No";
//           Bid_ContractSecurityRegister."Guarantee Expiry Notification":=InsuranceGuaranteeHeader."Expiry Date";
//           Bid_ContractSecurityRegister."Second Expiry Notification Dat":=InsuranceGuaranteeHeader."Expiry Notification Date";

//           PurchaseHeader.Reset;
//           PurchaseHeader.SetRange(PurchaseHeader."Document Type",PurchaseHeader."document type"::"Blanket Order");
//           PurchaseHeader.SetRange(PurchaseHeader."No.",InsuranceGuaranteeHeader."Purchase Contract ID");
//           if PurchaseHeader.FindSet then
//           Bid_ContractSecurityRegister."IFS No":=PurchaseHeader."IFS Code";

//           Bid_ContractSecurityRegister."Document Type":=Bid_ContractSecurityRegister."document type"::Quote;
//           Bid_ContractSecurityRegister."Form of Security":=InsuranceGuaranteeHeader."Form of Security";
//           Bid_ContractSecurityRegister."Security Type":=Bid_ContractSecurityRegister."security type"::"Advance Payment Security";
//           Bid_ContractSecurityRegister."Issuer Institution Type":=InsuranceGuaranteeHeader."Issuer Institution Type";
//           Bid_ContractSecurityRegister."Issuer/Guarantor Name":=InsuranceGuaranteeHeader."Insurer/Guarantor Name";
//           Bid_ContractSecurityRegister."Issuer Registered Offices":=InsuranceGuaranteeHeader."Issuer Registered Offices";
//           Bid_ContractSecurityRegister.Description:=InsuranceGuaranteeHeader.Description;
//           Bid_ContractSecurityRegister."Security Amount (LCY)":=InsuranceGuaranteeHeader."Amount Insured/Guaranteed";
//           Bid_ContractSecurityRegister."Bid Security Effective Date":=InsuranceGuaranteeHeader."Effective Date";
//           Bid_ContractSecurityRegister."Bid Security Validity Expiry":=InsuranceGuaranteeHeader."Expiry Date";
//           Bid_ContractSecurityRegister.Validate("Bid Security Validity Expiry");
//           Bid_ContractSecurityRegister.Insert(true);
//   end;

//   procedure FnSuggestPBRMBoQ(ProjectTransitionHeader: Record "Project Transition Header")
//   var
//       ProjectTransitionLine: Record "Project Transition Line";
//       RequisitionTemplateLine: Record "Requisition Template Line";
//   begin
//       RequisitionTemplateLine.Reset;
//       RequisitionTemplateLine.SetRange(RequisitionTemplateLine."Requisition Template ID",ProjectTransitionHeader."PBRM BoQ Template ID");
//       if RequisitionTemplateLine.FindSet then
//         repeat
//           ProjectTransitionLine.Init;
//           ProjectTransitionLine."Document No.":=ProjectTransitionHeader."Document No.";
//           ProjectTransitionLine."Line No.":=ProjectTransitionLine.Count+1;
//           ProjectTransitionLine."Project ID":=ProjectTransitionHeader."Project ID";
//           ProjectTransitionLine."Contractor No.":=ProjectTransitionHeader."Contractor No.";
//           ProjectTransitionLine."Purchase Contract ID":=ProjectTransitionHeader."Purchase Contract ID";
//           ProjectTransitionLine."PBRM BoQ Template ID":=ProjectTransitionHeader."PBRM BoQ Template ID";
//           ProjectTransitionLine.Type:=RequisitionTemplateLine.Type;
//           ProjectTransitionLine."No.":=RequisitionTemplateLine."No.";
//           ProjectTransitionLine.Description:=RequisitionTemplateLine.Description;
//           ProjectTransitionLine.Quantity:=RequisitionTemplateLine.Quantity;
//           ProjectTransitionLine."Amount Excl. VAT":=RequisitionTemplateLine.Amount;
//           ProjectTransitionLine."Unit of Measure":=RequisitionTemplateLine."Unit of Measure Code";
//           if not ProjectTransitionLine.Insert(true)
//             then ProjectTransitionLine.Modify(true);
//           until RequisitionTemplateLine.Next=0;
//   end;

//   procedure FnPostPerformanceGuaranteeToContract(InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header")
//   var
//       Bid_ContractSecurityRegister: Record "Bid_Contract Security Register";
//       PurchaseHeader: Record "Purchase Header";
//   begin
//           Bid_ContractSecurityRegister.Reset;
//           Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."No.",InsuranceGuaranteeHeader."Purchase Contract ID");
//           Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."Security Type",Bid_ContractSecurityRegister."security type"::"Performance/Contract Security");
//           if Bid_ContractSecurityRegister.FindSet then
//             begin
//               Bid_ContractSecurityRegister.Blocked:=true;
//               Bid_ContractSecurityRegister.Modify(true);
//               end;


//           Bid_ContractSecurityRegister.Init;
//           Bid_ContractSecurityRegister."Security ID":=Bid_ContractSecurityRegister.Count()+10;
//           Bid_ContractSecurityRegister."Vendor No.":=InsuranceGuaranteeHeader."Contractor ID";
//           Bid_ContractSecurityRegister."No.":=InsuranceGuaranteeHeader."Purchase Contract ID";
//           Bid_ContractSecurityRegister."Reference No":=InsuranceGuaranteeHeader."Policy/Guarantee No";
//           Bid_ContractSecurityRegister."Guarantee Expiry Notification":=InsuranceGuaranteeHeader."Expiry Date";
//           Bid_ContractSecurityRegister."Second Expiry Notification Dat":=InsuranceGuaranteeHeader."Expiry Notification Date";

//           PurchaseHeader.Reset;
//           PurchaseHeader.SetRange(PurchaseHeader."Document Type",PurchaseHeader."document type"::"Blanket Order");
//           PurchaseHeader.SetRange(PurchaseHeader."No.",InsuranceGuaranteeHeader."Purchase Contract ID");
//           if PurchaseHeader.FindSet then
//           Bid_ContractSecurityRegister."IFS No":=PurchaseHeader."IFS Code";

//           Bid_ContractSecurityRegister."Document Type":=Bid_ContractSecurityRegister."document type"::Quote;
//           Bid_ContractSecurityRegister."Form of Security":=InsuranceGuaranteeHeader."Form of Security";
//           Bid_ContractSecurityRegister."Security Type":=Bid_ContractSecurityRegister."security type"::"Performance/Contract Security";
//           Bid_ContractSecurityRegister."Issuer Institution Type":=InsuranceGuaranteeHeader."Issuer Institution Type";
//           Bid_ContractSecurityRegister."Issuer/Guarantor Name":=InsuranceGuaranteeHeader."Insurer/Guarantor Name";
//           Bid_ContractSecurityRegister."Issuer Registered Offices":=InsuranceGuaranteeHeader."Issuer Registered Offices";
//           Bid_ContractSecurityRegister.Description:=InsuranceGuaranteeHeader.Description;
//           Bid_ContractSecurityRegister."Security Amount (LCY)":=InsuranceGuaranteeHeader."Amount Insured/Guaranteed";
//           Bid_ContractSecurityRegister."Bid Security Effective Date":=InsuranceGuaranteeHeader."Effective Date";
//           Bid_ContractSecurityRegister."Bid Security Validity Expiry":=InsuranceGuaranteeHeader."Expiry Date";
//           Bid_ContractSecurityRegister.Validate("Bid Security Validity Expiry");
//           Bid_ContractSecurityRegister.Insert(true);



//            //MESSAGE(FORMAT(InsuranceGuaranteeHeader."Document Type")+ 'posted successfully.');
//   end;

//   procedure FnPostInsuranceOfWorksToContract(InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header")
//   var
//       Bid_ContractSecurityRegister: Record "Bid_Contract Security Register";
//       PurchaseHeader: Record "Purchase Header";
//       PurchaseContractInsurance: Record "Purchase Contract Insurance";
//   begin
//           PurchaseContractInsurance.Reset;
//           PurchaseContractInsurance.SetRange(PurchaseContractInsurance."No.",InsuranceGuaranteeHeader."Purchase Contract ID");
//           //PurchaseContractInsurance.SETRANGE(PurchaseContractInsurance."Security Type",PurchaseContractInsurance."Security Type"::);
//           if PurchaseContractInsurance.FindSet then
//             begin
//               //PurchaseContractInsurance.Blocked:=TRUE;
//               PurchaseContractInsurance.Modify(true);
//               end;


//           PurchaseContractInsurance.Init;

//           PurchaseContractInsurance."Document Type":=PurchaseContractInsurance."document type"::Quote;
//           PurchaseContractInsurance."No.":=InsuranceGuaranteeHeader."Purchase Contract ID";
//           PurchaseContractInsurance."Insurance Type":=InsuranceGuaranteeHeader."Insurance Type";
//           PurchaseContractInsurance."Line No":=PurchaseContractInsurance."Line No"+10;
//           PurchaseContractInsurance."Policy Cover Type":=InsuranceGuaranteeHeader."Policy Cover Type";

//       //    PurchaseHeader.RESET;
//       //    PurchaseHeader.SETRANGE(PurchaseHeader."Document Type",PurchaseHeader."Document Type"::"Blanket Order");
//       //    PurchaseHeader.SETRANGE(PurchaseHeader."No.",InsuranceGuaranteeHeader."Purchase Contract ID");
//       //    IF PurchaseHeader.FINDSET THEN
//       //    Bid_ContractSecurityRegister."IFS No":=PurchaseHeader."IFS Code";


//           PurchaseContractInsurance.Description:=InsuranceGuaranteeHeader.Description;
//           PurchaseContractInsurance."Policy Coverage (LCY)":=InsuranceGuaranteeHeader."Amount Insured/Guaranteed";
//           PurchaseContractInsurance."Policy ID":=InsuranceGuaranteeHeader."Policy/Guarantee No";
//           //PurchaseContractInsurance."Issuer/Guarantor Name":=InsuranceGuaranteeHeader."Insurer/Guarantor Name";
//           PurchaseContractInsurance."Insurance Company":=InsuranceGuaranteeHeader."Insurer/Guarantor Name";
//           PurchaseContractInsurance.Description:=InsuranceGuaranteeHeader.Description;
//           //PurchaseContractInsurance."Security Amount (LCY)":=InsuranceGuaranteeHeader."Amount Insured/Guaranteed";
//           PurchaseContractInsurance."Expiry Date":=InsuranceGuaranteeHeader."Expiry Date";
//           PurchaseContractInsurance."Expiry Norification Date":=InsuranceGuaranteeHeader."Expiry Notification Date";
//           PurchaseContractInsurance."Second Expiry Notification Dat":=InsuranceGuaranteeHeader."Second Expiry Notification Dat";
//           PurchaseContractInsurance.Insert(true);
//   end;


//   procedure FNGenerateProjectBoq(BoQ: Record "Purchase Requisition Template")
//   var
//       BoQLines: Record "Requisition Template Line";
//       BoQBillCodes: Record "BoQ Template Bill Code";
//       items: Record Item;
//       EntryNo: Integer;
//       BoQLines1: Record "Requisition Template Line";
//       BoQBillCodes1: Record "BoQ Template Bill Code";
//       BoQ1: Record "Purchase Requisition Template";
//       RMS: Codeunit "RMS Management";
//       NewDocumentNo: Code[100];
//       RMSSetup: Record "Road Management Setup";
//       ProcSetup: Record "Procurement Setup";
//   begin
//       // NewDocumentNo:='';
//       RMSSetup.Get();
//       ProcSetup.Get();
//       BoQ1.Init;
//       BoQ1.Code:=BoQ1.Code;
//       //NewDocumentNo:=NSMgt.GetNextNo(ProcSetup."Bid Req Template No. Series",TODAY,TRUE);
//       //MESSAGE(NewDocumentNo);
//       BoQ1.Description:=BoQ.Description+'Copy';
//       BoQ1."Procurement Type":=BoQ."Procurement Type";
//       BoQ1.Type:=BoQ1.Type::Standard;
//       BoQ1."Template Type":=BoQ."Template Type";
//       BoQ1."Effective Start Date":=Today;
//       if BoQ1.Insert(true) then begin
//       BoQBillCodes.Reset;
//       BoQBillCodes.SetRange("BoQ Template Code",BoQ.Code);
//       if BoQBillCodes.FindSet then begin
//         repeat
//         BoQBillCodes1.Init;
//         BoQBillCodes1."BoQ Template Code":=BoQ1.Code;
//         BoQBillCodes1."Bill Item Category Code":=BoQBillCodes."Bill Item Category Code";
//         BoQBillCodes1.Description:=BoQBillCodes.Description;
//         BoQBillCodes1."Default Job Task No":=BoQBillCodes."Default Job Task No";
//         BoQBillCodes1.Insert(true);
//         until BoQBillCodes.Next=0;
//         end;
//       BoQLines.Reset;
//       BoQLines.SetRange("Requisition Template ID",BoQ.Code);
//       if BoQLines.FindSet then begin
//         repeat
//         BoQLines1.Init;
//         BoQLines1."Requisition Template ID":=BoQ1.Code;
//         BoQLines1."Line No.":=BoQLines1."Line No."+1;
//         BoQLines1.Type:=BoQLines.Type;
//         BoQLines1."No.":=BoQLines."No.";
//         BoQLines1.Description:=BoQLines.Description;
//               //BoQLines.Quantity:=1;
//         BoQLines1."Unit of Measure Code":=BoQLines."Unit of Measure Code";
//               //BoQLines."Technology Type":=
//               //BoQLines."Unit Amount Excl. VAT":=
//         BoQLines1."Shortcut Dimension 1 Code":=BoQLines."Shortcut Dimension 1 Code";
//         BoQLines1."Shortcut Dimension 2 Code":=BoQLines."Shortcut Dimension 2 Code";
//               //BoQLines."Variant Code":=item
//               //BoQLines."Dimension Set ID":=items.dim
//         BoQLines1."Item Category Code":=BoQLines."Item Category Code";
//               //BoQLines."Default Contingency %":=
//         BoQLines1."Gen. Prod. Posting Group":=BoQLines."Gen. Prod. Posting Group";
//         BoQLines1."VAT Prod. Posting Group":=BoQLines."VAT Prod. Posting Group";
//         BoQLines1."Default Job Task No.":=BoQLines."Default Job Task No.";
//         //added for reversion type
//         BoQLines1."Reversion Type":=BoQLines."Reversion Type";
//         BoQLines1.Insert(true);

//       until BoQLines.Next=0;
//         end;

//       //RMS.FnCopyRecordLinks(BoQ.Code,BoQ.RECORDID,NewDocumentNo);

//       Message('Generated Successfully');
//       Page.Run(72183,BoQ1)
//       end;
//   end;


//   procedure FNGenerateEngEst(BoQ: Record "Purchase Requisition Template")
//   var
//       BoQLines: Record "Requisition Template Line";
//       BoQBillCodes: Record "BoQ Template Bill Code";
//       items: Record Item;
//       EntryNo: Integer;
//       BoQLines1: Record "Requisition Template Line";
//       BoQBillCodes1: Record "BoQ Template Bill Code";
//       BoQ1: Record "Purchase Requisition Template";
//   begin
//       BoQ1.Init;
//       BoQ1.Code:=BoQ1.Code;
//       BoQ1.Description:=BoQ.Description+'Copy';
//       BoQ1."Procurement Type":=BoQ."Procurement Type";
//       BoQ1."PBRM BoQ":=BoQ."PBRM BoQ";
//       BoQ1."Template Type":=BoQ."Template Type";
//       BoQ1."Effective Start Date":=Today;
//       if BoQ1.Insert(true) then begin
//       BoQBillCodes.Reset;
//       BoQBillCodes.SetRange("BoQ Template Code",BoQ.Code);
//       if BoQBillCodes.FindSet then begin
//         repeat
//         BoQBillCodes1.Init;
//         BoQBillCodes1."BoQ Template Code":=BoQ1.Code;
//         BoQBillCodes1."Bill Item Category Code":=BoQBillCodes."Bill Item Category Code";
//         BoQBillCodes1.Description:=BoQBillCodes.Description;
//         BoQBillCodes1."Default Job Task No":=BoQBillCodes."Default Job Task No";
//         BoQBillCodes1.Insert(true);
//         until BoQBillCodes.Next=0;
//         end;
//       BoQLines.Reset;
//       BoQLines.SetRange("Requisition Template ID",BoQ.Code);
//       if BoQLines.FindSet then begin
//         repeat
//         BoQLines1.Init;
//         BoQLines1."Requisition Template ID":=BoQ1.Code;
//         BoQLines1."Line No.":=BoQLines1."Line No."+1;
//         BoQLines1.Type:=BoQLines.Type;
//         BoQLines1."No.":=BoQLines."No.";
//         BoQLines1.Description:=BoQLines.Description;
//         BoQLines1.Quantity:=BoQLines.Quantity;
//         BoQLines1."Unit of Measure Code":=BoQLines."Unit of Measure Code";
//               //BoQLines."Technology Type":=
//               //BoQLines."Unit Amount Excl. VAT":=
//         BoQLines1."Shortcut Dimension 1 Code":=BoQLines."Shortcut Dimension 1 Code";
//         BoQLines1."Shortcut Dimension 2 Code":=BoQLines."Shortcut Dimension 2 Code";
//               //BoQLines."Variant Code":=item
//               //BoQLines."Dimension Set ID":=items.dim
//         BoQLines1."Item Category Code":=BoQLines."Item Category Code";
//               //BoQLines."Default Contingency %":=
//         BoQLines1."Gen. Prod. Posting Group":=BoQLines."Gen. Prod. Posting Group";
//         BoQLines1."VAT Prod. Posting Group":=BoQLines."VAT Prod. Posting Group";
//         BoQLines1."Default Job Task No.":=BoQLines."Default Job Task No.";
//         BoQLines1.Insert(true);

//       until BoQLines.Next=0;
//         end;
//       Message('Generated Successfully');
//       Page.Run(72183,BoQ1)
//       end;
//   end;

//   local procedure "*********Start Excel Generation**********************"()
//   begin
//   end;


//   procedure FnMakeExcelHeader()
//   var
//       BlankFiller: Text[250];
//   begin
//       FnEnterCell(1,1,'Type','',true);
//       FnEnterCell(1,2,'No.','',true);
//       FnEnterCell(1,3,'Description','',true);
//       FnEnterCell(1,4,'Quantity','',true);
//       FnEnterCell(1,5,'Unit Cost','',true);
//       FnEnterCell(1,6,'Total Amount','',true);
//       FnEnterCell(1,7,'Total Amount Incl. VAT','',true);
//   end;

//   local procedure FnEnterCell(RowNo: Integer;ColumnNo: Integer;CellValue: Text[2048];NumberFormat: Text[30];Bold: Boolean)
//   begin
//       TempExcelBuffer.Init;
//       TempExcelBuffer.Validate("Row No.",RowNo);
//       TempExcelBuffer.Validate("Column No.",ColumnNo);
//       if NumberFormat <> '' then
//         begin
//           TempExcelBuffer."Cell Type":=TempExcelBuffer."cell type"::Number;
//           TempExcelBuffer.NumberFormat:=NumberFormat;
//        end else
//           TempExcelBuffer."Cell Type":=TempExcelBuffer."cell type"::Text;
//           TempExcelBuffer."Cell Value as Text":=CellValue;
//           TempExcelBuffer.Bold := Bold;
//           if not TempExcelBuffer.Get(RowNo,ColumnNo) then
//           TempExcelBuffer.Insert(true);
//   end;


//   procedure FnOpenExcelFile(SheetName: Text;FileName: Text)
//   var
//       Text001: label 'GIFI';
//   begin
//       TempExcelBuffer.CreateBookAndOpenExcel('',SheetName,Text001,COMPANYNAME,UserId);
//   end;


//   procedure FnCreateExcelLines(Type: Text;No: Code[40];Description: Text[2048];Quantity: Decimal;UnitCost: Decimal;TotalAmount: Decimal;TotalAmountInclVAT: Decimal;RowNo: Integer)
//   begin
//       FnEnterCell(RowNo,1,Type,'',false);
//       FnEnterCell(RowNo,2,No,'',false);
//       FnEnterCell(RowNo,3,Description,'',false);
//       FnEnterCell(RowNo,4,Format(Quantity),'0.00',false);
//       FnEnterCell(RowNo,5,Format(UnitCost),'0.00',false);
//       FnEnterCell(RowNo,6,Format(TotalAmount),'0.00',false);
//       FnEnterCell(RowNo,7,Format(TotalAmountInclVAT),'0.00',false);
//   end;


//   procedure FnCreatePrnpersonelExcelLines(Type: Text;DocumentNo: Code[30];StaffRole: Text;Title: Text[2048];StaffCategory: Text;Staff: Integer;RowNo: Integer)
//   begin
//       FnEnterCell(RowNo,1,Type,'',false);
//       FnEnterCell(RowNo,2,DocumentNo,'',false);
//       FnEnterCell(RowNo,3,StaffRole,'',false);
//       FnEnterCell(RowNo,4,Title,'',false);
//       FnEnterCell(RowNo,5,StaffCategory,'',false);
//       FnEnterCell(RowNo,6,Format(Staff),'0.00',false);
//       FnEnterCell(RowNo,7,Format(RowNo),'0',false);
//   end;


//   procedure FnMakePrnpersonelExcelHeader()
//   var
//       BlankFiller: Text[250];
//   begin
//       FnEnterCell(1,1,'Document Type','',true);
//       FnEnterCell(1,2,'Document No.','',true);
//       FnEnterCell(1,3,'Staff Role Code','',true);
//       FnEnterCell(1,4,'Title/Designation Description','',true);
//       FnEnterCell(1,5,'Staff Category','',true);
//       FnEnterCell(1,6,'Min No. of Recomm Staff','',true);
//   end;

//   procedure FnPopulateMaterialsOnSite(MPHeader: Record "Measurement &  Payment Header")
//   var
//       MaterialOnsite: Record "Material On site";
//       MaterialOnSiteSetup: Record "Material On Site Setup";
//   begin
//       with MaterialOnSiteSetup do begin
//         repeat
//           MaterialOnsite.Init;
//           MaterialOnsite."Document Type":=MPHeader."Document Type";
//           MaterialOnsite."Document No.":=MPHeader."Document No.";
//           MaterialOnsite."Line No.":=MaterialOnsite.Count+1;
//           MaterialOnsite."Material Code":=MaterialOnSiteSetup."Material Code";
//           MaterialOnsite."Material Description":=MaterialOnSiteSetup."Material Description";
//           MaterialOnsite."Unit Of Measure":=MaterialOnSiteSetup."Unit Of Measure Code";
//           if not MaterialOnsite.Insert(true) then
//             MaterialOnsite.Modify(true);
//           until MaterialOnSiteSetup.Next=0;
//         end;
//       //MaterialOnsite
//   end;

//   procedure FnPopulateApprovalEntryCustomeWorkflow(Variant: Variant;ProjectID: Code[100];DocumentType: Option " ","Commenncement Order","Communication Plan","Staff Appointments","Internal Staff Disengement","Staff Disengagement","Mobilization Checklist","Mobilization Checklist Status Report","Professional Indemnity","Work Execution Plan","HSE Plan",RMP,QMP,"Contract Supervision Requirement","Site Agent Nomination","Contractor Key Personnel Appointment","Equipment Delivery To Site","Insurance of Works","Advance Payment Guarantee","Performance Guarantee","Equipment Tracking";DocumentNo: Code[40];ApprovalEntryDocumentType: Option ".Quote","Order",Invoice,"Credit Memo","Blanket Order","Return Order","Imprest Memo","staff Claims","Payment Voucher","Petty Cash",Imprest,Surrender,Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition",Sclaims,"Salary Voucher","Grant Funding Application",Procurement,"Salary Advance","File Movement","Receipt Processing",RFI,"Vend Debarment","Project Funding Request","Temp Salary Voucher","AIE Funds Transfer","Training Plan","Training Application","Bank Rec","Asset Transfer","Road Work Program",PCO,WEP,IPH,"Cash Request","Bill Discounting",Maintenance,FuelReq,SAV,"Recruitment Header","Driver Out Of Office Req","Batch Payment",SubContract,"WEP Submission","Site Intructions",RMP,TSR,"Insurance/Guarantee","Meeting Register",DWR,"Variation Header","Evaluation Header","QM Plan Header","M&E Header","Risk Incident Log","Measurement & Payment","Inspection Header","Final Account";Amount: Decimal;RecordIDToApprove: RecordID;TableID: Integer)
//   var
//       ProjectApprovalSetup: Record "Project Approval Setup";
//       ApprovalEntry: Record "Custom Approval Entry";
//       InternalProjectResource: Record "Internal Project Resource";
//       Employee: Record Employee;
//       EntryNo: Integer;
//       ProjectApprovalSetupMatrix: Record "Project Approval Setup Matrix";
//   begin
//       ProjectApprovalSetupMatrix.Reset;
//       ProjectApprovalSetupMatrix.SetRange(ProjectApprovalSetupMatrix."Project ID",ProjectID);
//       ProjectApprovalSetupMatrix.SetRange(ProjectApprovalSetupMatrix."Document Type",DocumentType);
//       if ProjectApprovalSetupMatrix.FindSet then begin
//         repeat
//            EntryNo:=0;
//            ApprovalEntry.Reset;
//            if ApprovalEntry.FindLast then
//              EntryNo:=ApprovalEntry."Entry No."+1;
//            if EntryNo=0 then
//              EntryNo:=1;
//             ApprovalEntry.Init;
//             ApprovalEntry."Entry No.":=EntryNo;
//             ApprovalEntry."Table ID":=TableID;
//             ApprovalEntry."Document Type":=ApprovalEntryDocumentType;
//             ApprovalEntry."Document No.":=DocumentNo;
//             ApprovalEntry."Project Document Type":=Format(DocumentType);
//             ApprovalEntry."Sender ID":=UserId;
//             ApprovalEntry."Date-Time Sent for Approval":=CurrentDatetime;
//             ApprovalEntry."Last Modified By User ID":=UserId;
//             ApprovalEntry."Last Date-Time Modified":=CurrentDatetime;
//             ApprovalEntry."Due Date":=Today;
//             ApprovalEntry.Amount:=Amount;
//             ApprovalEntry."Project ID":=ProjectID;
//             ApprovalEntry.Validate("Project ID");
//             ApprovalEntry."Record ID to Approve":=RecordIDToApprove;
//             ApprovalEntry."Approval Type":=ApprovalEntry."approval type"::Approver;
//             ApprovalEntry."Sequence No.":=ProjectApprovalSetupMatrix."Sequence No.";
//             case ApprovalEntry."Sequence No." of
//               1:
//               begin
//                 ApprovalEntry.Status:=ApprovalEntry.Status::Open;
//                 ApprovalEntry.Validate(Status);
//               end;
//               else
//                 ApprovalEntry.Status:=ApprovalEntry.Status::Created;
//                 ApprovalEntry.Validate(Status);
//              end;
//             ApprovalEntry."Approver ID":=ProjectApprovalSetupMatrix."Approver ID";
//             if ApprovalEntry."Approver ID"=UserId then
//               ApprovalEntry.Status:=ApprovalEntry.Status::Approved;
//               ApprovalEntry.Validate(Status);
//               if not ApprovalEntry.Insert(true) then
//                 ApprovalEntry.Modify(true);
//            until ProjectApprovalSetupMatrix.Next=0;
//                    end;

//   end;

//   procedure FnGetLargestSequenceNoFromApprovalEntry(DocumentNo: Code[50]): Integer
//   var
//       CustomApprovalEntry: Record "Custom Approval Entry";
//   begin
//       CustomApprovalEntry.Reset;
//       CustomApprovalEntry.SetCurrentkey("Document No.");
//       CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.",DocumentNo);
//       if CustomApprovalEntry.FindLast then
//         exit(CustomApprovalEntry."Sequence No.");
//   end;

//   local procedure "...........End................"()
//   begin
//   end;

//   procedure FnPostEngineerVariationRequest(ProjectVariationHeader: Record "Project Variation Header")
//   var
//       ProjectEvaluationHeader: Record "Project Evaluation Header";
//       ProjectEvaluationLines: Record "Project Evaluation Lines";
//       ProjectEvaluationSection: Record "Project Evaluation Section";
//       ExtensionofTimeReason: Record "Extension of Time Reason";
//       ProjectVariationSection: Record "Project Variation Section";
//       ProjectEvaluationCommittee: Record "Project Evaluation Committee";
//       ProjectVariationCommittee: Record "Project Variation Committee";
//       ProjectVariationLine: Record "Project Variation Line";
//   begin
//       ProjectEvaluationHeader.TestField(Posted,false);
//       ProjectVariationHeader.TestField(ProjectVariationHeader.Status,ProjectVariationHeader.Status::Released);
//       ProjectEvaluationHeader.Init;
//       ProjectEvaluationHeader."Document No.":=ProjectEvaluationHeader."Document No.";
//       ProjectEvaluationHeader."Variation Type":=ProjectEvaluationHeader."variation type"::EVR;
//       ProjectEvaluationHeader."Document Type":=ProjectEvaluationHeader."document type"::"Evaluation Report";
//       ProjectEvaluationHeader.Description:=ProjectVariationHeader."Document No."+' Evaluation Report';
//       ProjectEvaluationHeader."Document Date":=Today;
//       ProjectEvaluationHeader."Project ID":=ProjectVariationHeader."Project ID";
//       ProjectEvaluationHeader."Extension Reason Code":=ProjectVariationHeader."Extension Reason Code";
//       ProjectEvaluationHeader."Variation Reason Code":=ProjectVariationHeader."Variation Reason Code";
//       ProjectEvaluationHeader."Executive Summary":=ProjectVariationHeader."Executive Summary";
//       ProjectEvaluationHeader."Original Value of Work (LCY)":=ProjectVariationHeader."Original Value of Work (LCY)";
//       ProjectEvaluationHeader."New Varied Works Value (LCY)":=ProjectVariationHeader."New Varied Works Value (LCY)";
//       ProjectEvaluationHeader."Net Change Value of Work (LCY)":=ProjectVariationHeader."Net Change Value of Work (LCY)";
//       ProjectEvaluationHeader."Project Name":=ProjectVariationHeader."Project Name";
//       ProjectEvaluationHeader."Road Code":=ProjectVariationHeader."Road Code";
//       ProjectEvaluationHeader."Road Section No.":=ProjectVariationHeader."Road Section No.";
//       ProjectEvaluationHeader."Region ID":=ProjectVariationHeader."Region ID";
//       ProjectEvaluationHeader."Directorate ID":=ProjectVariationHeader."Directorate ID";
//       ProjectEvaluationHeader."Department ID":=ProjectVariationHeader."Department ID";
//       ProjectEvaluationHeader."Purchase Contract ID":=ProjectVariationHeader."Purchase Contract ID";
//       ProjectEvaluationHeader."External Contract Reference":=ProjectVariationHeader."External Contract Reference";
//       ProjectEvaluationHeader."Contractor No.":=ProjectVariationHeader."Contractor No.";
//       ProjectEvaluationHeader."Contractor Name":=ProjectVariationHeader."Contractor Name";
//       ProjectEvaluationHeader."Contractor Representative":=ProjectVariationHeader."Contractor Representative";
//       ProjectEvaluationHeader."Contractor Rep Email":=ProjectVariationHeader."Contractor Rep Email";
//       ProjectEvaluationHeader."Award Tender Sum Inc Taxes":=ProjectVariationHeader."Award Tender Sum Inc Taxes";
//       ProjectEvaluationHeader."Original Project Ending Date":=ProjectVariationHeader."Original Project Ending Date";
//       ProjectEvaluationHeader."Original Project Starting Date":=ProjectVariationHeader."Original Project Starting Date";
//       ProjectEvaluationHeader."Requested Extension Period":=ProjectVariationHeader."Requested Extension Period";
//       ProjectEvaluationHeader."Extended Project End Date":=ProjectVariationHeader."Extended Project End Date";
//       ProjectEvaluationHeader."Contractor Variation Req No.":=ProjectVariationHeader."Contractor Variation Req No.";
//       ProjectEvaluationHeader."Value of Work Added":=ProjectVariationHeader."Value of Work Added";
//       ProjectEvaluationHeader."Value of Work Omitted":=ProjectVariationHeader."Value of Work Omitted";
//       ProjectEvaluationHeader."Project Engineer No.":=ProjectVariationHeader."Project Engineer No.";
//       ProjectEvaluationHeader."Project Manager":=ProjectVariationHeader."Project Manager";
//       ProjectEvaluationHeader."Review Status":=ProjectVariationHeader."Review Status";
//       ProjectEvaluationHeader."Review Rejection Notes":=ProjectVariationHeader."Review Rejection Notes";
//       ProjectEvaluationHeader."Project Variation Order No.":=ProjectVariationHeader."Project Variation Order No.";
//       ProjectEvaluationHeader."Dimension Set ID":=ProjectVariationHeader."Dimension Set ID";
//       ProjectEvaluationHeader."Shortcut Dimension 1 Code":=ProjectVariationHeader."Shortcut Dimension 1 Code";
//       ProjectEvaluationHeader."Shortcut Dimension 2 Code":=ProjectVariationHeader."Shortcut Dimension 2 Code";
//       ProjectEvaluationHeader."Variation Percentage(%)":=ProjectVariationHeader."Variation Percentage(%)";
//       ProjectEvaluationHeader."Total Project Cost Excl. VAT":=ProjectVariationHeader."Total Project Cost Excl. VAT";
//       ProjectEvaluationHeader."Total Project Cost Incl. VAT":=ProjectVariationHeader."Total Project Cost Incl. VAT";
//       ProjectEvaluationHeader."Contingency Amount":=ProjectVariationHeader."Contingency Amount";
//       ProjectEvaluationHeader."Variation of Price Amount":=ProjectVariationHeader."Variation of Price Amount";
//       ProjectEvaluationHeader."Variation Order No":=ProjectVariationHeader."Variation Order No";
//       ProjectEvaluationHeader."Contract Sum Variation %":=ProjectVariationHeader."Contract Sum Variation %";
//       ProjectEvaluationHeader."Grounds For EOT Request":=ProjectVariationHeader."Grounds For EOT Request";
//       // ProjectEvaluationHeader."Evaluation Remarks":=ProjectVariationHeader."Extended Project End Date
//       // ProjectEvaluationHeader."Professional Opinion":=
//       ProjectEvaluationHeader."EOT No":=ProjectVariationHeader."Document No.";
//       if ProjectEvaluationHeader.Insert(true) then begin
//         ProjectVariationLine.Reset;
//         ProjectVariationLine.SetRange("Document No.",ProjectVariationHeader."Document No.");
//          if ProjectVariationLine.FindSet then begin
//         repeat
//           ProjectEvaluationLines.Init;
//           ProjectEvaluationLines."Document Type":=ProjectEvaluationLines."document type"::"Evaluation Report";
//           ProjectEvaluationLines."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationLines."Line No.":=ProjectEvaluationLines."Line No."+1;
//           ProjectEvaluationLines."Job No.":=ProjectVariationLine."Job No.";
//           ProjectEvaluationLines."Job Task No.":=ProjectVariationLine."Job Task No.";
//           ProjectEvaluationLines.Type:=ProjectVariationLine.Type;
//           ProjectEvaluationLines."No.":=ProjectVariationLine."No.";
//           ProjectEvaluationLines.Description:=ProjectVariationLine.Description;
//           ProjectEvaluationLines."Original Quantity":=ProjectVariationLine."Original Quantity";
//           ProjectEvaluationLines."Unit Cost (LCY)":=ProjectVariationLine."Unit Cost (LCY)";
//           ProjectEvaluationLines."Unit of Measure Code":=ProjectVariationLine."Unit of Measure Code";
//           ProjectEvaluationLines."Original Total Cost (LCY)":=ProjectVariationLine."Original Total Cost (LCY)";
//           ProjectEvaluationLines."New Quantity":=ProjectVariationLine."New Quantity";
//           ProjectEvaluationLines."Approved Quantity":=ProjectVariationLine."New Quantity";
//           ProjectEvaluationLines.Validate("Approved Quantity");
//           ProjectEvaluationLines."Shortcut Dimension 1 Code":=ProjectEvaluationHeader."Shortcut Dimension 1 Code";
//           ProjectEvaluationLines."Shortcut Dimension 2 Code":=ProjectEvaluationHeader."Shortcut Dimension 2 Code";
//           ProjectEvaluationLines."Dimension Set ID":=ProjectEvaluationHeader."Dimension Set ID";
//           ProjectEvaluationLines.Validate("Dimension Set ID");
//           ProjectEvaluationLines."New Total Cost (LCY)":=ProjectVariationLine."New Total Cost (LCY)";
//           ProjectEvaluationLines."Net Change (Quantity)":=ProjectVariationLine."Net Change (Quantity)";
//           ProjectEvaluationLines."Net Change (Total Cost LCY)":=ProjectVariationLine."Net Change (Total Cost LCY)";
//           ProjectEvaluationLines."Purchase Contract ID":=ProjectVariationLine."Purchase Contract ID";
//           ProjectEvaluationLines.Validate("Purchase Contract ID");
//           ProjectEvaluationLines.Insert(true);
//       until ProjectVariationLine.Next=0;
//       end;
//       ProjectVariationSection.Reset;
//       ProjectVariationSection.SetRange("Document No.",ProjectVariationHeader."Document No.");
//       //ProjectVariationSection.SETRANGE("Document Type",ProjectVariationHeader."Document Type"::"Extension of Time Request");
//       if ProjectVariationSection.FindSet then begin
//         repeat
//           ProjectEvaluationSection.Init;
//           ProjectEvaluationSection."Document Type":=ProjectEvaluationSection."document type"::"Evaluation Report";
//           ProjectEvaluationSection."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationSection.Section:=ProjectVariationSection.Section;
//           ProjectEvaluationSection."Line No.":=ProjectEvaluationSection."Line No."+1;
//           ProjectEvaluationSection.Description:=ProjectVariationSection.Description;
//           ProjectEvaluationSection.Insert(true);
//           until ProjectVariationSection.Next=0;
//         end;
//           ProjectVariationCommittee.Reset;
//         ProjectVariationCommittee.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         if ProjectVariationCommittee.FindSet then begin
//           repeat
//             ProjectEvaluationCommittee.Init;
//             ProjectEvaluationCommittee."Document Type":=ProjectEvaluationCommittee."document type"::"Evaluation Report";
//             ProjectEvaluationCommittee."Document No.":=ProjectEvaluationHeader."Document No.";
//             ProjectEvaluationCommittee."Resource No.":=ProjectVariationCommittee."Resource No.";
//             ProjectEvaluationCommittee.Name:=ProjectVariationCommittee.Name;
//             ProjectEvaluationCommittee.Email:=ProjectVariationCommittee.Email;
//             ProjectEvaluationCommittee.Role:=ProjectVariationCommittee.Role;
//             ProjectEvaluationCommittee.Insert(true);
//             until ProjectVariationCommittee.Next=0;
//             end;
//       Message(Format(ProjectVariationHeader."Document Type")+ ' %1 posted successfully',ProjectEvaluationHeader."Document No.");
//       Page.Run(72769,ProjectEvaluationHeader);
//       end;
//   end;

//   procedure FnPostContractorVariationRequest(ProjectVariationHeader: Record "Project Variation Header")
//   var
//       ProjectEvaluationHeader: Record "Project Evaluation Header";
//       ProjectEvaluationLines: Record "Project Evaluation Lines";
//       ProjectEvaluationSection: Record "Project Evaluation Section";
//       ExtensionofTimeReason: Record "Extension of Time Reason";
//       ProjectVariationSection: Record "Project Variation Section";
//       ProjectEvaluationCommittee: Record "Project Evaluation Committee";
//       ProjectVariationCommittee: Record "Project Variation Committee";
//       ProjectVariationLine: Record "Project Variation Line";
//   begin
//       ProjectEvaluationHeader.TestField(Posted,false);
//       ProjectVariationHeader.TestField(ProjectVariationHeader.Status,ProjectVariationHeader.Status::Released);
//       ProjectEvaluationHeader.Init;
//       ProjectEvaluationHeader."Document No.":=ProjectEvaluationHeader."Document No.";
//       ProjectEvaluationHeader."Variation Type":=ProjectEvaluationHeader."variation type"::EVR;
//       ProjectEvaluationHeader."Document Type":=ProjectEvaluationHeader."document type"::"Evaluation Report";
//       ProjectEvaluationHeader.Description:=ProjectVariationHeader."Document No."+' Evaluation Report';
//       ProjectEvaluationHeader."Document Date":=Today;
//       ProjectEvaluationHeader."Project ID":=ProjectVariationHeader."Project ID";
//       ProjectEvaluationHeader."Extension Reason Code":=ProjectVariationHeader."Extension Reason Code";
//       ProjectEvaluationHeader."Variation Reason Code":=ProjectVariationHeader."Variation Reason Code";
//       ProjectEvaluationHeader."Executive Summary":=ProjectVariationHeader."Executive Summary";
//       ProjectEvaluationHeader."Original Value of Work (LCY)":=ProjectVariationHeader."Original Value of Work (LCY)";
//       ProjectEvaluationHeader."New Varied Works Value (LCY)":=ProjectVariationHeader."New Varied Works Value (LCY)";
//       ProjectEvaluationHeader."Net Change Value of Work (LCY)":=ProjectVariationHeader."Net Change Value of Work (LCY)";
//       ProjectEvaluationHeader."Project Name":=ProjectVariationHeader."Project Name";
//       ProjectEvaluationHeader."Road Code":=ProjectVariationHeader."Road Code";
//       ProjectEvaluationHeader."Road Section No.":=ProjectVariationHeader."Road Section No.";
//       ProjectEvaluationHeader."Region ID":=ProjectVariationHeader."Region ID";
//       ProjectEvaluationHeader."Directorate ID":=ProjectVariationHeader."Directorate ID";
//       ProjectEvaluationHeader."Department ID":=ProjectVariationHeader."Department ID";
//       ProjectEvaluationHeader."Purchase Contract ID":=ProjectVariationHeader."Purchase Contract ID";
//       ProjectEvaluationHeader."External Contract Reference":=ProjectVariationHeader."External Contract Reference";
//       ProjectEvaluationHeader."Contractor No.":=ProjectVariationHeader."Contractor No.";
//       ProjectEvaluationHeader."Contractor Name":=ProjectVariationHeader."Contractor Name";
//       ProjectEvaluationHeader."Contractor Representative":=ProjectVariationHeader."Contractor Representative";
//       ProjectEvaluationHeader."Contractor Rep Email":=ProjectVariationHeader."Contractor Rep Email";
//       ProjectEvaluationHeader."Award Tender Sum Inc Taxes":=ProjectVariationHeader."Award Tender Sum Inc Taxes";
//       ProjectEvaluationHeader."Original Project Ending Date":=ProjectVariationHeader."Original Project Ending Date";
//       ProjectEvaluationHeader."Original Project Starting Date":=ProjectVariationHeader."Original Project Starting Date";
//       ProjectEvaluationHeader."Requested Extension Period":=ProjectVariationHeader."Requested Extension Period";
//       ProjectEvaluationHeader."Extended Project End Date":=ProjectVariationHeader."Extended Project End Date";
//       ProjectEvaluationHeader."Contractor Variation Req No.":=ProjectVariationHeader."Contractor Variation Req No.";
//       ProjectEvaluationHeader."Value of Work Added":=ProjectVariationHeader."Value of Work Added";
//       ProjectEvaluationHeader."Value of Work Omitted":=ProjectVariationHeader."Value of Work Omitted";
//       ProjectEvaluationHeader."Project Engineer No.":=ProjectVariationHeader."Project Engineer No.";
//       ProjectEvaluationHeader."Project Manager":=ProjectVariationHeader."Project Manager";
//       ProjectEvaluationHeader."Review Status":=ProjectVariationHeader."Review Status";
//       ProjectEvaluationHeader."Review Rejection Notes":=ProjectVariationHeader."Review Rejection Notes";
//       ProjectEvaluationHeader."Project Variation Order No.":=ProjectVariationHeader."Project Variation Order No.";
//       ProjectEvaluationHeader."Dimension Set ID":=ProjectVariationHeader."Dimension Set ID";
//       ProjectEvaluationHeader."Shortcut Dimension 1 Code":=ProjectVariationHeader."Shortcut Dimension 1 Code";
//       ProjectEvaluationHeader."Shortcut Dimension 2 Code":=ProjectVariationHeader."Shortcut Dimension 2 Code";
//       ProjectEvaluationHeader."Variation Percentage(%)":=ProjectVariationHeader."Variation Percentage(%)";
//       ProjectEvaluationHeader."Total Project Cost Excl. VAT":=ProjectVariationHeader."Total Project Cost Excl. VAT";
//       ProjectEvaluationHeader."Total Project Cost Incl. VAT":=ProjectVariationHeader."Total Project Cost Incl. VAT";
//       ProjectEvaluationHeader."Contingency Amount":=ProjectVariationHeader."Contingency Amount";
//       ProjectEvaluationHeader."Variation of Price Amount":=ProjectVariationHeader."Variation of Price Amount";
//       ProjectEvaluationHeader."Variation Order No":=ProjectVariationHeader."Variation Order No";
//       ProjectEvaluationHeader."Contract Sum Variation %":=ProjectVariationHeader."Contract Sum Variation %";
//       ProjectEvaluationHeader."Grounds For EOT Request":=ProjectVariationHeader."Grounds For EOT Request";
//       // ProjectEvaluationHeader."Evaluation Remarks":=ProjectVariationHeader."Extended Project End Date
//       // ProjectEvaluationHeader."Professional Opinion":=
//       ProjectEvaluationHeader."EOT No":=ProjectVariationHeader."Document No.";
//       if ProjectEvaluationHeader.Insert(true) then begin
//         ProjectVariationLine.Reset;
//         ProjectVariationLine.SetRange("Document No.",ProjectVariationHeader."Document No.");
//          if ProjectVariationLine.FindSet then begin
//         repeat
//           ProjectEvaluationLines.Init;
//           ProjectEvaluationLines."Document Type":=ProjectEvaluationLines."document type"::"Evaluation Report";
//           ProjectEvaluationLines."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationLines."Line No.":=ProjectEvaluationLines."Line No."+1;
//           ProjectEvaluationLines."Job No.":=ProjectVariationLine."Job No.";
//           ProjectEvaluationLines."Job Task No.":=ProjectVariationLine."Job Task No.";
//           ProjectEvaluationLines.Type:=ProjectVariationLine.Type;
//           ProjectEvaluationLines."No.":=ProjectVariationLine."No.";
//           ProjectEvaluationLines.Description:=ProjectVariationLine.Description;
//           ProjectEvaluationLines."Original Quantity":=ProjectVariationLine."Original Quantity";
//           ProjectEvaluationLines."Unit Cost (LCY)":=ProjectVariationLine."Unit Cost (LCY)";
//           ProjectEvaluationLines."Unit of Measure Code":=ProjectVariationLine."Unit of Measure Code";
//           ProjectEvaluationLines."Original Total Cost (LCY)":=ProjectVariationLine."Original Total Cost (LCY)";
//           ProjectEvaluationLines."New Quantity":=ProjectVariationLine."New Quantity";
//           ProjectEvaluationLines."Approved Quantity":=ProjectVariationLine."New Quantity";
//           ProjectEvaluationLines.Validate("Approved Quantity");
//           ProjectEvaluationLines."Shortcut Dimension 1 Code":=ProjectEvaluationHeader."Shortcut Dimension 1 Code";
//           ProjectEvaluationLines."Shortcut Dimension 2 Code":=ProjectEvaluationHeader."Shortcut Dimension 2 Code";
//           ProjectEvaluationLines."Dimension Set ID":=ProjectEvaluationHeader."Dimension Set ID";
//           ProjectEvaluationLines.Validate("Dimension Set ID");
//           ProjectEvaluationLines."New Total Cost (LCY)":=ProjectVariationLine."New Total Cost (LCY)";
//           ProjectEvaluationLines."Net Change (Quantity)":=ProjectVariationLine."Net Change (Quantity)";
//           ProjectEvaluationLines."Net Change (Total Cost LCY)":=ProjectVariationLine."Net Change (Total Cost LCY)";
//           ProjectEvaluationLines."Purchase Contract ID":=ProjectVariationLine."Purchase Contract ID";
//           ProjectEvaluationLines.Validate("Purchase Contract ID");
//           ProjectEvaluationLines.Insert(true);
//       until ProjectVariationLine.Next=0;
//       end;
//       ProjectVariationSection.Reset;
//       ProjectVariationSection.SetRange("Document No.",ProjectVariationHeader."Document No.");
//       //ProjectVariationSection.SETRANGE("Document Type",ProjectVariationHeader."Document Type"::"Extension of Time Request");
//       if ProjectVariationSection.FindSet then begin
//         repeat
//           ProjectEvaluationSection.Init;
//           ProjectEvaluationSection."Document Type":=ProjectEvaluationSection."document type"::"Evaluation Report";
//           ProjectEvaluationSection."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationSection.Section:=ProjectVariationSection.Section;
//           ProjectEvaluationSection."Line No.":=ProjectEvaluationSection."Line No."+1;
//           ProjectEvaluationSection.Description:=ProjectVariationSection.Description;
//           ProjectEvaluationSection.Insert(true);
//           until ProjectVariationSection.Next=0;
//         end;
//           ProjectVariationCommittee.Reset;
//         ProjectVariationCommittee.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         if ProjectVariationCommittee.FindSet then begin
//           repeat
//             ProjectEvaluationCommittee.Init;
//             ProjectEvaluationCommittee."Document Type":=ProjectEvaluationCommittee."document type"::"Evaluation Report";
//             ProjectEvaluationCommittee."Document No.":=ProjectEvaluationHeader."Document No.";
//             ProjectEvaluationCommittee."Resource No.":=ProjectVariationCommittee."Resource No.";
//             ProjectEvaluationCommittee.Name:=ProjectVariationCommittee.Name;
//             ProjectEvaluationCommittee.Email:=ProjectVariationCommittee.Email;
//             ProjectEvaluationCommittee.Role:=ProjectVariationCommittee.Role;
//             ProjectEvaluationCommittee.Insert(true);
//             until ProjectVariationCommittee.Next=0;
//             end;
//       Message(Format(ProjectVariationHeader."Document Type")+ ' %1 posted successfully',ProjectEvaluationHeader."Document No.");
//       Page.Run(72768,ProjectEvaluationHeader);
//       end;
//   end;

//   procedure FnPostCostClaim(ProjectVariationHeader: Record "Project Variation Header")
//   var
//       ProjectEvaluationHeader: Record "Project Evaluation Header";
//       ProjectEvaluationLines: Record "Project Evaluation Lines";
//       ProjectEvaluationSection: Record "Project Evaluation Section";
//       ExtensionofTimeReason: Record "Extension of Time Reason";
//       ProjectVariationSection: Record "Project Variation Section";
//       ProjectEvaluationCommittee: Record "Project Evaluation Committee";
//       ProjectVariationCommittee: Record "Project Variation Committee";
//   begin
//       ProjectEvaluationHeader.TestField(Posted,false);
//       ProjectVariationHeader.TestField(ProjectVariationHeader.Status,ProjectVariationHeader.Status::Released);
//       ProjectEvaluationHeader.Init;
//       ProjectEvaluationHeader."Document No.":=ProjectEvaluationHeader."Document No.";
//       ProjectEvaluationHeader."Document Type":=ProjectEvaluationHeader."document type"::"Evaluation Report";
//       ProjectEvaluationHeader.Description:=ProjectVariationHeader."Document No."+' Evaluation Report';
//       ProjectEvaluationHeader."Document Date":=Today;
//       ProjectEvaluationHeader."Project ID":=ProjectVariationHeader."Project ID";
//       ProjectEvaluationHeader."Extension Reason Code":=ProjectVariationHeader."Extension Reason Code";
//       ProjectEvaluationHeader."Variation Reason Code":=ProjectVariationHeader."Variation Reason Code";
//       ProjectEvaluationHeader."Executive Summary":=ProjectVariationHeader."Executive Summary";
//       ProjectEvaluationHeader."Original Value of Work (LCY)":=ProjectVariationHeader."Original Value of Work (LCY)";
//       ProjectEvaluationHeader."New Varied Works Value (LCY)":=ProjectVariationHeader."New Varied Works Value (LCY)";
//       ProjectEvaluationHeader."Net Change Value of Work (LCY)":=ProjectVariationHeader."Net Change Value of Work (LCY)";
//       ProjectEvaluationHeader."Project Name":=ProjectVariationHeader."Project Name";
//       ProjectEvaluationHeader."Road Code":=ProjectVariationHeader."Road Code";
//       ProjectEvaluationHeader."Road Section No.":=ProjectVariationHeader."Road Section No.";
//       ProjectEvaluationHeader."Variation Type":=ProjectEvaluationHeader."variation type"::CC;
//       ProjectEvaluationHeader."Region ID":=ProjectVariationHeader."Region ID";
//       ProjectEvaluationHeader."Directorate ID":=ProjectVariationHeader."Directorate ID";
//       ProjectEvaluationHeader."Department ID":=ProjectVariationHeader."Department ID";
//       ProjectEvaluationHeader."Purchase Contract ID":=ProjectVariationHeader."Purchase Contract ID";
//       ProjectEvaluationHeader."External Contract Reference":=ProjectVariationHeader."External Contract Reference";
//       ProjectEvaluationHeader."Contractor No.":=ProjectVariationHeader."Contractor No.";
//       ProjectEvaluationHeader."Contractor Name":=ProjectVariationHeader."Contractor Name";
//       ProjectEvaluationHeader."Contractor Representative":=ProjectVariationHeader."Contractor Representative";
//       ProjectEvaluationHeader."Contractor Rep Email":=ProjectVariationHeader."Contractor Rep Email";
//       ProjectEvaluationHeader."Award Tender Sum Inc Taxes":=ProjectVariationHeader."Award Tender Sum Inc Taxes";
//       ProjectEvaluationHeader."Original Project Ending Date":=ProjectVariationHeader."Original Project Ending Date";
//       ProjectEvaluationHeader."Original Project Starting Date":=ProjectVariationHeader."Original Project Starting Date";
//       ProjectEvaluationHeader."Requested Extension Period":=ProjectVariationHeader."Requested Extension Period";
//       ProjectEvaluationHeader."Extended Project End Date":=ProjectVariationHeader."Extended Project End Date";
//       ProjectEvaluationHeader."Contractor Variation Req No.":=ProjectVariationHeader."Contractor Variation Req No.";
//       ProjectEvaluationHeader."Value of Work Added":=ProjectVariationHeader."Value of Work Added";
//       ProjectEvaluationHeader."Value of Work Omitted":=ProjectVariationHeader."Value of Work Omitted";
//       ProjectEvaluationHeader."Project Engineer No.":=ProjectVariationHeader."Project Engineer No.";
//       ProjectEvaluationHeader."Project Manager":=ProjectVariationHeader."Project Manager";
//       ProjectEvaluationHeader."Review Status":=ProjectVariationHeader."Review Status";
//       ProjectEvaluationHeader."Review Rejection Notes":=ProjectVariationHeader."Review Rejection Notes";
//       ProjectEvaluationHeader."Project Variation Order No.":=ProjectVariationHeader."Project Variation Order No.";
//       ProjectEvaluationHeader."Dimension Set ID":=ProjectVariationHeader."Dimension Set ID";
//       ProjectEvaluationHeader."Shortcut Dimension 1 Code":=ProjectVariationHeader."Shortcut Dimension 1 Code";
//       ProjectEvaluationHeader."Shortcut Dimension 2 Code":=ProjectVariationHeader."Shortcut Dimension 2 Code";
//       ProjectEvaluationHeader."Variation Percentage(%)":=ProjectVariationHeader."Variation Percentage(%)";
//       ProjectEvaluationHeader."Total Project Cost Excl. VAT":=ProjectVariationHeader."Total Project Cost Excl. VAT";
//       ProjectEvaluationHeader."Total Project Cost Incl. VAT":=ProjectVariationHeader."Total Project Cost Incl. VAT";
//       ProjectEvaluationHeader."Contingency Amount":=ProjectVariationHeader."Contingency Amount";
//       ProjectEvaluationHeader."Variation of Price Amount":=ProjectVariationHeader."Variation of Price Amount";
//       ProjectEvaluationHeader."Variation Order No":=ProjectVariationHeader."Variation Order No";
//       ProjectEvaluationHeader."Contract Sum Variation %":=ProjectVariationHeader."Contract Sum Variation %";
//       ProjectEvaluationHeader."Grounds For EOT Request":=ProjectVariationHeader."Grounds For EOT Request";
//       // ProjectEvaluationHeader."Evaluation Remarks":=ProjectVariationHeader."Extended Project End Date
//       // ProjectEvaluationHeader."Professional Opinion":=
//       ProjectEvaluationHeader."EOT No":=ProjectVariationHeader."Document No.";
//       if ProjectEvaluationHeader.Insert(true) then begin
//         ExtensionofTimeReason.Reset;
//         ExtensionofTimeReason.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         //ExtensionofTimeReason.SETRANGE("Document Type",ExtensionofTimeReason."Document Type"::"Extension of Time Request");
//         if ExtensionofTimeReason.FindSet then begin
//         repeat
//           ProjectEvaluationLines.Init;
//           ProjectEvaluationLines."Document Type":=ProjectEvaluationLines."document type"::"Evaluation Report";
//           ProjectEvaluationLines."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationLines."Line No.":=ProjectEvaluationLines."Line No."+1;
//           ProjectEvaluationLines."Cause of Delay":=ExtensionofTimeReason."Cause of Delay";
//           ProjectEvaluationLines."EOT Requested Days":=ExtensionofTimeReason."EOT Requested Days";
//           ProjectEvaluationLines."Job No.":=ExtensionofTimeReason."Job No.";
//           ProjectEvaluationLines."Job Task No.":=ExtensionofTimeReason."Job Task No.";
//           ProjectEvaluationLines."Dimension Set ID":=ExtensionofTimeReason."Dimension Set ID";
//           ProjectEvaluationLines."Shortcut Dimension 1 Code":=ExtensionofTimeReason."Shortcut Dimension 1 Code";
//           ProjectEvaluationLines."Shortcut Dimension 2 Code":=ExtensionofTimeReason."Shortcut Dimension 2 Code";
//           ProjectEvaluationLines.Insert(true);
//       until ExtensionofTimeReason.Next=0;
//       end;
//       ProjectVariationSection.Reset;
//       ProjectVariationSection.SetRange("Document No.",ProjectVariationHeader."Document No.");
//       //ProjectVariationSection.SETRANGE("Document Type",ProjectVariationHeader."Document Type"::"Extension of Time Request");
//       if ProjectVariationSection.FindSet then begin
//         repeat
//           ProjectEvaluationSection.Init;
//           ProjectEvaluationSection."Document Type":=ProjectEvaluationSection."document type"::"Evaluation Report";
//           ProjectEvaluationSection."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationSection.Section:=ProjectVariationSection.Section;
//           ProjectEvaluationSection."Line No.":=ProjectEvaluationSection."Line No."+1;
//           ProjectEvaluationSection.Description:=ProjectVariationSection.Description;
//           ProjectEvaluationSection.Insert(true);
//           until ProjectVariationSection.Next=0;
//         end;
//           ProjectVariationCommittee.Reset;
//         ProjectVariationCommittee.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         if ProjectVariationCommittee.FindSet then begin
//           repeat
//             ProjectEvaluationCommittee.Init;
//             ProjectEvaluationCommittee."Document Type":=ProjectEvaluationCommittee."document type"::"Evaluation Report";
//             ProjectEvaluationCommittee."Document No.":=ProjectEvaluationHeader."Document No.";
//             ProjectEvaluationCommittee."Resource No.":=ProjectVariationCommittee."Resource No.";
//             ProjectEvaluationCommittee.Name:=ProjectVariationCommittee.Name;
//             ProjectEvaluationCommittee.Email:=ProjectVariationCommittee.Email;
//             ProjectEvaluationCommittee.Role:=ProjectVariationCommittee.Role;
//             ProjectEvaluationCommittee.Insert(true);
//             until ProjectVariationCommittee.Next=0;
//             end;
//       Message(Format(ProjectVariationHeader."Document Type")+ ' %1 posted successfully',ProjectVariationHeader."Document No.");
//       Page.Run(72664,ProjectEvaluationHeader);
//       end;
//   end;

//   procedure FnPostProjectVariationOrder(ProjectVariationHeader: Record "Project Variation Header")
//   var
//       ProjectEvaluationHeader: Record "Project Evaluation Header";
//       ProjectEvaluationLines: Record "Project Evaluation Lines";
//       ProjectEvaluationSection: Record "Project Evaluation Section";
//       ExtensionofTimeReason: Record "Extension of Time Reason";
//       ProjectVariationSection: Record "Project Variation Section";
//       ProjectEvaluationCommittee: Record "Project Evaluation Committee";
//       ProjectVariationCommittee: Record "Project Variation Committee";
//   begin
//       ProjectEvaluationHeader.TestField(Posted,false);
//       ProjectVariationHeader.TestField(ProjectVariationHeader.Status,ProjectVariationHeader.Status::Released);
//       ProjectEvaluationHeader.Init;
//       ProjectEvaluationHeader."Document No.":=ProjectEvaluationHeader."Document No.";
//       ProjectEvaluationHeader."Document Type":=ProjectEvaluationHeader."document type"::"Evaluation Report";
//       ProjectEvaluationHeader.Description:=ProjectVariationHeader."Document No."+' Evaluation Report';
//       ProjectEvaluationHeader."Document Date":=Today;
//       ProjectEvaluationHeader."Project ID":=ProjectVariationHeader."Project ID";
//       ProjectEvaluationHeader."Extension Reason Code":=ProjectVariationHeader."Extension Reason Code";
//       ProjectEvaluationHeader."Variation Reason Code":=ProjectVariationHeader."Variation Reason Code";
//       ProjectEvaluationHeader."Executive Summary":=ProjectVariationHeader."Executive Summary";
//       ProjectEvaluationHeader."Original Value of Work (LCY)":=ProjectVariationHeader."Original Value of Work (LCY)";
//       ProjectEvaluationHeader."New Varied Works Value (LCY)":=ProjectVariationHeader."New Varied Works Value (LCY)";
//       ProjectEvaluationHeader."Net Change Value of Work (LCY)":=ProjectVariationHeader."Net Change Value of Work (LCY)";
//       ProjectEvaluationHeader."Project Name":=ProjectVariationHeader."Project Name";
//       ProjectEvaluationHeader."Road Code":=ProjectVariationHeader."Road Code";
//       ProjectEvaluationHeader."Road Section No.":=ProjectVariationHeader."Road Section No.";
//       ProjectEvaluationHeader."Region ID":=ProjectVariationHeader."Region ID";
//       ProjectEvaluationHeader."Directorate ID":=ProjectVariationHeader."Directorate ID";
//       ProjectEvaluationHeader."Department ID":=ProjectVariationHeader."Department ID";
//       ProjectEvaluationHeader."Purchase Contract ID":=ProjectVariationHeader."Purchase Contract ID";
//       ProjectEvaluationHeader."External Contract Reference":=ProjectVariationHeader."External Contract Reference";
//       ProjectEvaluationHeader."Contractor No.":=ProjectVariationHeader."Contractor No.";
//       ProjectEvaluationHeader."Contractor Name":=ProjectVariationHeader."Contractor Name";
//       ProjectEvaluationHeader."Contractor Representative":=ProjectVariationHeader."Contractor Representative";
//       ProjectEvaluationHeader."Contractor Rep Email":=ProjectVariationHeader."Contractor Rep Email";
//       ProjectEvaluationHeader."Award Tender Sum Inc Taxes":=ProjectVariationHeader."Award Tender Sum Inc Taxes";
//       ProjectEvaluationHeader."Original Project Ending Date":=ProjectVariationHeader."Original Project Ending Date";
//       ProjectEvaluationHeader."Original Project Starting Date":=ProjectVariationHeader."Original Project Starting Date";
//       ProjectEvaluationHeader."Requested Extension Period":=ProjectVariationHeader."Requested Extension Period";
//       ProjectEvaluationHeader."Extended Project End Date":=ProjectVariationHeader."Extended Project End Date";
//       ProjectEvaluationHeader."Contractor Variation Req No.":=ProjectVariationHeader."Contractor Variation Req No.";
//       ProjectEvaluationHeader."Value of Work Added":=ProjectVariationHeader."Value of Work Added";
//       ProjectEvaluationHeader."Value of Work Omitted":=ProjectVariationHeader."Value of Work Omitted";
//       ProjectEvaluationHeader."Project Engineer No.":=ProjectVariationHeader."Project Engineer No.";
//       ProjectEvaluationHeader."Project Manager":=ProjectVariationHeader."Project Manager";
//       ProjectEvaluationHeader."Review Status":=ProjectVariationHeader."Review Status";
//       ProjectEvaluationHeader."Review Rejection Notes":=ProjectVariationHeader."Review Rejection Notes";
//       ProjectEvaluationHeader."Project Variation Order No.":=ProjectVariationHeader."Project Variation Order No.";
//       ProjectEvaluationHeader."Dimension Set ID":=ProjectVariationHeader."Dimension Set ID";
//       ProjectEvaluationHeader."Shortcut Dimension 1 Code":=ProjectVariationHeader."Shortcut Dimension 1 Code";
//       ProjectEvaluationHeader."Shortcut Dimension 2 Code":=ProjectVariationHeader."Shortcut Dimension 2 Code";
//       ProjectEvaluationHeader."Variation Percentage(%)":=ProjectVariationHeader."Variation Percentage(%)";
//       ProjectEvaluationHeader."Total Project Cost Excl. VAT":=ProjectVariationHeader."Total Project Cost Excl. VAT";
//       ProjectEvaluationHeader."Total Project Cost Incl. VAT":=ProjectVariationHeader."Total Project Cost Incl. VAT";
//       ProjectEvaluationHeader."Contingency Amount":=ProjectVariationHeader."Contingency Amount";
//       ProjectEvaluationHeader."Variation of Price Amount":=ProjectVariationHeader."Variation of Price Amount";
//       ProjectEvaluationHeader."Variation Order No":=ProjectVariationHeader."Variation Order No";
//       ProjectEvaluationHeader."Contract Sum Variation %":=ProjectVariationHeader."Contract Sum Variation %";
//       ProjectEvaluationHeader."Grounds For EOT Request":=ProjectVariationHeader."Grounds For EOT Request";
//       // ProjectEvaluationHeader."Evaluation Remarks":=ProjectVariationHeader."Extended Project End Date
//       // ProjectEvaluationHeader."Professional Opinion":=
//       ProjectEvaluationHeader."EOT No":=ProjectVariationHeader."Document No.";
//       if ProjectEvaluationHeader.Insert(true) then begin
//         ExtensionofTimeReason.Reset;
//         ExtensionofTimeReason.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         //ExtensionofTimeReason.SETRANGE("Document Type",ExtensionofTimeReason."Document Type"::"Extension of Time Request");
//         if ExtensionofTimeReason.FindSet then begin
//         repeat
//           ProjectEvaluationLines.Init;
//           ProjectEvaluationLines."Document Type":=ProjectEvaluationLines."document type"::"Evaluation Report";
//           ProjectEvaluationLines."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationLines."Line No.":=ProjectEvaluationLines."Line No."+1;
//           ProjectEvaluationLines."Cause of Delay":=ExtensionofTimeReason."Cause of Delay";
//           ProjectEvaluationLines."EOT Requested Days":=ExtensionofTimeReason."EOT Requested Days";
//           ProjectEvaluationLines."Job No.":=ExtensionofTimeReason."Job No.";
//           ProjectEvaluationLines."Job Task No.":=ExtensionofTimeReason."Job Task No.";
//           ProjectEvaluationLines."Dimension Set ID":=ExtensionofTimeReason."Dimension Set ID";
//           ProjectEvaluationLines."Shortcut Dimension 1 Code":=ExtensionofTimeReason."Shortcut Dimension 1 Code";
//           ProjectEvaluationLines."Shortcut Dimension 2 Code":=ExtensionofTimeReason."Shortcut Dimension 2 Code";
//           ProjectEvaluationLines.Insert(true);
//       until ExtensionofTimeReason.Next=0;
//       end;
//       ProjectVariationSection.Reset;
//       ProjectVariationSection.SetRange("Document No.",ProjectVariationHeader."Document No.");
//       //ProjectVariationSection.SETRANGE("Document Type",ProjectVariationHeader."Document Type"::"Extension of Time Request");
//       if ProjectVariationSection.FindSet then begin
//         repeat
//           ProjectEvaluationSection.Init;
//           ProjectEvaluationSection."Document Type":=ProjectEvaluationSection."document type"::"Evaluation Report";
//           ProjectEvaluationSection."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationSection.Section:=ProjectVariationSection.Section;
//           ProjectEvaluationSection."Line No.":=ProjectEvaluationSection."Line No."+1;
//           ProjectEvaluationSection.Description:=ProjectVariationSection.Description;
//           ProjectEvaluationSection.Insert(true);
//           until ProjectVariationSection.Next=0;
//         end;
//           ProjectVariationCommittee.Reset;
//         ProjectVariationCommittee.SetRange("Document No.",ProjectVariationHeader."Document No.");
//         if ProjectVariationCommittee.FindSet then begin
//           repeat
//             ProjectEvaluationCommittee.Init;
//             ProjectEvaluationCommittee."Document Type":=ProjectEvaluationCommittee."document type"::"Evaluation Report";
//             ProjectEvaluationCommittee."Document No.":=ProjectEvaluationHeader."Document No.";
//             ProjectEvaluationCommittee."Resource No.":=ProjectVariationCommittee."Resource No.";
//             ProjectEvaluationCommittee.Name:=ProjectVariationCommittee.Name;
//             ProjectEvaluationCommittee.Email:=ProjectVariationCommittee.Email;
//             ProjectEvaluationCommittee.Role:=ProjectVariationCommittee.Role;
//             ProjectEvaluationCommittee.Insert(true);
//             until ProjectVariationCommittee.Next=0;
//             end;
//       Message('EOT %1 posted successfully',ProjectEvaluationHeader."Document No.");
//       Page.Run(72664,ProjectEvaluationHeader);
//       end;
//   end;

//   procedure FnPostAdvanceGuaranteeToContractRevised(InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header")
//   var
//       Bid_ContractSecurityRegister: Record "Bid_Contract Security Register";
//       PurchaseHeader: Record "Purchase Header";
//   begin
//           Bid_ContractSecurityRegister.Reset;
//           Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."No.",InsuranceGuaranteeHeader."Purchase Contract ID");
//           //Bid_ContractSecurityRegister.SETRANGE(Bid_ContractSecurityRegister."Security Type",Bid_ContractSecurityRegister."Security Type"::"Advance Payment Security");
//           Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister."Reference No",InsuranceGuaranteeHeader."Advance Document No To Revise");
//           Bid_ContractSecurityRegister.SetRange(Bid_ContractSecurityRegister.Blocked,false);
//           if Bid_ContractSecurityRegister.FindSet then
//             begin
//               repeat
//                   Bid_ContractSecurityRegister.Blocked:=true;
//                   Bid_ContractSecurityRegister.Modify(true);
//               until Bid_ContractSecurityRegister.Next=0;
//               end;


//           Bid_ContractSecurityRegister.Init;
//           Bid_ContractSecurityRegister."Security ID":=Bid_ContractSecurityRegister."Security ID"+10;
//           Bid_ContractSecurityRegister."Vendor No.":=InsuranceGuaranteeHeader."Contractor ID";
//           Bid_ContractSecurityRegister."No.":=InsuranceGuaranteeHeader."Purchase Contract ID";
//           Bid_ContractSecurityRegister."Reference No":=InsuranceGuaranteeHeader."Policy/Guarantee No";
//           Bid_ContractSecurityRegister."Guarantee Expiry Notification":=InsuranceGuaranteeHeader."Expiry Date";
//           Bid_ContractSecurityRegister."Second Expiry Notification Dat":=InsuranceGuaranteeHeader."Expiry Notification Date";

//           PurchaseHeader.Reset;
//           PurchaseHeader.SetRange(PurchaseHeader."Document Type",PurchaseHeader."document type"::"Blanket Order");
//           PurchaseHeader.SetRange(PurchaseHeader."No.",InsuranceGuaranteeHeader."Purchase Contract ID");
//           if PurchaseHeader.FindSet then
//           Bid_ContractSecurityRegister."IFS No":=PurchaseHeader."IFS Code";

//           Bid_ContractSecurityRegister."Document Type":=Bid_ContractSecurityRegister."document type"::Quote;
//           Bid_ContractSecurityRegister."Form of Security":=InsuranceGuaranteeHeader."Form of Security";
//           Bid_ContractSecurityRegister."Security Type":=Bid_ContractSecurityRegister."security type"::"Advance Payment Security";
//           Bid_ContractSecurityRegister."Issuer Institution Type":=InsuranceGuaranteeHeader."Issuer Institution Type";
//           Bid_ContractSecurityRegister."Issuer/Guarantor Name":=InsuranceGuaranteeHeader."Insurer/Guarantor Name";
//           Bid_ContractSecurityRegister."Issuer Registered Offices":=InsuranceGuaranteeHeader."Issuer Registered Offices";
//           Bid_ContractSecurityRegister.Description:=InsuranceGuaranteeHeader.Description;
//           if InsuranceGuaranteeHeader."Revised Guaranteed Amount"<> 0 then
//           Bid_ContractSecurityRegister."Security Amount (LCY)":=InsuranceGuaranteeHeader."Revised Guaranteed Amount";
//           Bid_ContractSecurityRegister."Bid Security Effective Date":=InsuranceGuaranteeHeader."Effective Date";
//           Bid_ContractSecurityRegister."Bid Security Validity Expiry":=InsuranceGuaranteeHeader."Expiry Date";
//           Bid_ContractSecurityRegister.Validate("Bid Security Validity Expiry");
//           Bid_ContractSecurityRegister.Insert(true);
//   end;

//   procedure FnPostSubcontractingHeader(SubH: Record "Subcontracting Header")
//   var
//       ProjectEvaluationHeader: Record "Project Evaluation Header";
//       ProjectEvaluationLines: Record "Project Evaluation Lines";
//       ProjectEvaluationSection: Record "Project Evaluation Section";
//       ExtensionofTimeReason: Record "Extension of Time Reason";
//       ProjectVariationSection: Record "Project Variation Section";
//       ProjectEvaluationCommittee: Record "Project Evaluation Committee";
//       ProjectVariationCommittee: Record "Project Variation Committee";
//       SubcontractingLines: Record "Subcontracting Lines";
//   begin
//       ProjectEvaluationHeader.TestField(Posted,false);
//       ProjectEvaluationHeader.Validate(ProjectEvaluationHeader.Status,ProjectEvaluationHeader.Status::Released);
//       ProjectEvaluationHeader.Init;
//       ProjectEvaluationHeader."Document No.":=ProjectEvaluationHeader."Document No.";
//       ProjectEvaluationHeader."Document Type":=ProjectEvaluationHeader."document type"::"Evaluation Report";
//       ProjectEvaluationHeader.Description:=SubH."Document No"+' Evaluation Report';
//       ProjectEvaluationHeader."Document Date":=Today;
//       ProjectEvaluationHeader."Project ID":=SubH."Project Code";
//       ProjectEvaluationHeader.Validate("Project ID");
//       // ProjectEvaluationHeader."Extension Reason Code":=ProjectVariationHeader."Extension Reason Code";
//       // ProjectEvaluationHeader."Variation Reason Code":=ProjectVariationHeader."Variation Reason Code";
//       // ProjectEvaluationHeader."Executive Summary":=ProjectVariationHeader."Executive Summary";
//       // ProjectEvaluationHeader."Original Value of Work (LCY)":=ProjectVariationHeader."Original Value of Work (LCY)";
//       // ProjectEvaluationHeader."New Varied Works Value (LCY)":=ProjectVariationHeader."New Varied Works Value (LCY)";
//       // ProjectEvaluationHeader."Net Change Value of Work (LCY)":=ProjectVariationHeader."Net Change Value of Work (LCY)";
//       ProjectEvaluationHeader."Project Name":=SubH."Project Name";
//       ProjectEvaluationHeader."Directorate ID":=FnGetDirectorate(SubH);
//       /*ProjectEvaluationHeader."Road Code":=ProjectVariationHeader."Road Code";
//       ProjectEvaluationHeader."Road Section No.":=ProjectVariationHeader."Road Section No.";
//       ProjectEvaluationHeader."Region ID":=SubH.;
//       ProjectEvaluationHeader."Directorate ID":=ProjectVariationHeader."Directorate ID";
//       ProjectEvaluationHeader."Department ID":=ProjectVariationHeader."Department ID";*/
//       ProjectEvaluationHeader."Purchase Contract ID":=SubH."Purchase Contract ID";
//       //ProjectEvaluationHeader."External Contract Reference":=SubH;
//       ProjectEvaluationHeader."Contractor No.":=SubH."Main Contractor No.";
//       ProjectEvaluationHeader."Contractor Name":=SubH."Main Contractor Name";
//       //ProjectEvaluationHeader."Contractor Representative":=ProjectVariationHeader."Contractor Representative";
//       /*ProjectEvaluationHeader."Contractor Rep Email":=ProjectVariationHeader."Contractor Rep Email";
//       ProjectEvaluationHeader."Award Tender Sum Inc Taxes":=ProjectVariationHeader."Award Tender Sum Inc Taxes";
//       ProjectEvaluationHeader."Original Project Ending Date":=ProjectVariationHeader."Original Project Ending Date";
//       ProjectEvaluationHeader."Original Project Starting Date":=ProjectVariationHeader."Original Project Starting Date";
//       ProjectEvaluationHeader."Requested Extension Period":=ProjectVariationHeader."Requested Extension Period";
//       ProjectEvaluationHeader."Extended Project End Date":=ProjectVariationHeader."Extended Project End Date";
//       ProjectEvaluationHeader."Contractor Variation Req No.":=ProjectVariationHeader."Contractor Variation Req No.";
//       ProjectEvaluationHeader."Value of Work Added":=ProjectVariationHeader."Value of Work Added";
//       ProjectEvaluationHeader."Value of Work Omitted":=ProjectVariationHeader."Value of Work Omitted";
//       ProjectEvaluationHeader."Project Engineer No.":=ProjectVariationHeader."Project Engineer No.";
//       ProjectEvaluationHeader."Project Manager":=ProjectVariationHeader."Project Manager";
//       ProjectEvaluationHeader."Review Status":=ProjectVariationHeader."Review Status";
//       ProjectEvaluationHeader."Review Rejection Notes":=ProjectVariationHeader."Review Rejection Notes";
//       ProjectEvaluationHeader."Project Variation Order No.":=ProjectVariationHeader."Project Variation Order No.";
//       ProjectEvaluationHeader."Dimension Set ID":=ProjectVariationHeader."Dimension Set ID";
//       ProjectEvaluationHeader."Shortcut Dimension 1 Code":=ProjectVariationHeader."Shortcut Dimension 1 Code";
//       ProjectEvaluationHeader."Shortcut Dimension 2 Code":=ProjectVariationHeader."Shortcut Dimension 2 Code";
//       ProjectEvaluationHeader."Variation Percentage(%)":=ProjectVariationHeader."Variation Percentage(%)";
//       ProjectEvaluationHeader."Total Project Cost Excl. VAT":=ProjectVariationHeader."Total Project Cost Excl. VAT";
//       ProjectEvaluationHeader."Total Project Cost Incl. VAT":=ProjectVariationHeader."Total Project Cost Incl. VAT";
//       ProjectEvaluationHeader."Contingency Amount":=ProjectVariationHeader."Contingency Amount";
//       ProjectEvaluationHeader."Variation of Price Amount":=ProjectVariationHeader."Variation of Price Amount";
//       ProjectEvaluationHeader."Variation Order No":=ProjectVariationHeader."Variation Order No";
//       ProjectEvaluationHeader."Contract Sum Variation %":=ProjectVariationHeader."Contract Sum Variation %";
//       ProjectEvaluationHeader."Grounds For EOT Request":=ProjectVariationHeader."Grounds For EOT Request";*/
//       // ProjectEvaluationHeader."Evaluation Remarks":=ProjectVariationHeader."Extended Project End Date
//       // ProjectEvaluationHeader."Professional Opinion":=
//       ProjectEvaluationHeader."EOT No":=SubH."Document No";
//       if ProjectEvaluationHeader.Insert(true) then begin
//         SubcontractingLines.Reset;
//         SubcontractingLines.SetRange(SubcontractingLines."Document No",SubH."Document No");
//         //ExtensionofTimeReason.SETRANGE("Document Type",ExtensionofTimeReason."Document Type"::"Extension of Time Request");
//         if SubcontractingLines.FindSet then begin
//         repeat
//           ProjectEvaluationLines.Init;
//           ProjectEvaluationLines."Document Type":=ProjectEvaluationLines."document type"::"Evaluation Report";
//           ProjectEvaluationLines."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationLines."Line No.":=ProjectEvaluationLines."Line No."+1;
//           ProjectEvaluationLines."Project ID":=SubcontractingLines."Project ID";
//           ProjectEvaluationLines."Subcontractor No":=SubcontractingLines."Subcontractor No";
//           ProjectEvaluationLines."Subcontractor Name":=SubcontractingLines."Subcontractor Name";
//           ProjectEvaluationLines."KRA PIN":=SubcontractingLines."KRA PIN";
//           ProjectEvaluationLines.Payee:=SubcontractingLines."KRA PIN";
//           ProjectEvaluationLines."Vendor No":=SubcontractingLines."Vendor No";
//           ProjectEvaluationLines."Scope of Subcontracting":=SubcontractingLines."Scope of Subcontracting";
//           ProjectEvaluationLines.Insert(true);
//       until SubcontractingLines.Next=0;
//       end;

//       /*ProjectVariationSection.RESET;
//       ProjectVariationSection.SETRANGE("Document No.",ProjectVariationHeader."Document No.");
//       //ProjectVariationSection.SETRANGE("Document Type",ProjectVariationHeader."Document Type"::"Extension of Time Request");
//       IF ProjectVariationSection.FINDSET THEN BEGIN
//         REPEAT
//           ProjectEvaluationSection.INIT;
//           ProjectEvaluationSection."Document Type":=ProjectEvaluationSection."Document Type"::"Evaluation Report";
//           ProjectEvaluationSection."Document No.":=ProjectEvaluationHeader."Document No.";
//           ProjectEvaluationSection.Section:=ProjectVariationSection.Section;
//           ProjectEvaluationSection."Line No.":=ProjectEvaluationSection."Line No."+1;
//           ProjectEvaluationSection.Description:=ProjectVariationSection.Description;
//           ProjectEvaluationSection.INSERT(TRUE);
//           UNTIL ProjectVariationSection.NEXT=0;
//         END;*/

//         /*ProjectVariationCommittee.RESET;
//         ProjectVariationCommittee.SETRANGE("Document No.",ProjectVariationHeader."Document No.");
//         IF ProjectVariationCommittee.FINDSET THEN BEGIN
//           REPEAT
//             ProjectEvaluationCommittee.INIT;
//             ProjectEvaluationCommittee."Document Type":=ProjectEvaluationCommittee."Document Type"::"Evaluation Report";
//             ProjectEvaluationCommittee."Document No.":=ProjectEvaluationHeader."Document No.";
//             ProjectEvaluationCommittee."Resource No.":=ProjectVariationCommittee."Resource No.";
//             ProjectEvaluationCommittee.Name:=ProjectVariationCommittee.Name;
//             ProjectEvaluationCommittee.Email:=ProjectVariationCommittee.Email;
//             ProjectEvaluationCommittee.Role:=ProjectVariationCommittee.Role;
//             ProjectEvaluationCommittee.INSERT(TRUE);
//             UNTIL ProjectVariationCommittee.NEXT=0;
//             END;*/
//       Message('EOT %1 posted successfully',ProjectEvaluationHeader."Document No.");
//       Page.Run(72664,ProjectEvaluationHeader);
//       end;

//   end;

//   procedure FnGetDirectorate(SubcontractingHeader: Record "Subcontracting Header"): Text
//   var
//       ObjJob: Record Job;
//   begin
//       ObjJob.Reset;
//       ObjJob.SetRange(ObjJob."No.",SubcontractingHeader."Project Code");
//       ObjJob.SetFilter(ObjJob."Directorate Code",'<>%1','');
//       if ObjJob.FindSet then
//        exit(ObjJob."Directorate Code");


//   end;

//   procedure FnSuggestProjectsFromProcPlanEntry(RoadWorkProgram: Record "Road Work Program";DocumentType: Option " ","Road Work Plan","Global Budget Book","Multi-Year Programs","New Job Voucher")
//   var
//       GLBudgetEntry: Record "G/L Budget Entry";
//       Multi_YearWork: Record "Multi_Year Work";
//       DetailedMulti_YearLine: Record "Detailed Multi_Year Line";
//       ProcurementPlanEntry: Record "Procurement Plan Entry";
//       ProcurementSetup: Record "Procurement Setup";
//   begin
//       ProcurementSetup.Get();
//       ProcurementPlanEntry.Reset;
//       ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Procurement Plan ID",ProcurementSetup."Effective Procurement Plan");
//       ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Project Type",DocumentType);
//       if ProcurementPlanEntry.FindSet then
//         begin
//           repeat
//             Multi_YearWork.Init;
//             Multi_YearWork."Road Work Program ID":=RoadWorkProgram.Code;
//             Multi_YearWork."KeRRA Budget Code":=ProcurementPlanEntry."KeRRA Budget Code";
//             Multi_YearWork.Description:=ProcurementPlanEntry.Description;
//             Multi_YearWork."Global Dimension Code 2":=ProcurementPlanEntry."Global Dimension 2 Code";
//             if not Multi_YearWork.Insert(true) then
//               Multi_YearWork.Modify(true);
//           until ProcurementPlanEntry.Next=0;
//         end;
//   end;

//   procedure FnSuggestFundingSourcesFromProcPlanEntry(RoadWorkProgram: Record "Road Work Program";DocumentType: Option " ","Road Work Plan","Global Budget Book","Multi-Year Programs","New Job Voucher")
//   var
//       GLBudgetEntry: Record "G/L Budget Entry";
//       Multi_YearWork: Record "Multi_Year Work";
//       DetailedMulti_YearLine: Record "Detailed Multi_Year Line";
//       ProjectFundingSource: Record "Project Funding Source";
//       ProcurementPlanEntry: Record "Procurement Plan Entry";
//       ProcurementSetup: Record "Procurement Setup";
//   begin
//       ProcurementSetup.Get();
//       GLBudgetEntry.Reset;
//       ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Procurement Plan ID",ProcurementSetup."Effective Procurement Plan");
//       ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Project Type",DocumentType);
//       if ProcurementPlanEntry.FindSet then
//         begin
//           repeat
//             ProjectFundingSource.Init;
//             ProjectFundingSource."Road Work Program ID":=RoadWorkProgram.Code;
//             ProjectFundingSource."KeRRA Budget Code":=ProcurementPlanEntry."KeRRA Budget Code";
//             ProjectFundingSource."Funding Source ID":=ProcurementPlanEntry."Global Dimension 2 Code";
//             ProjectFundingSource.Validate("Funding Source ID");
//             if not ProjectFundingSource.Insert(true) then
//               ProjectFundingSource.Modify(true);
//           until ProcurementPlanEntry.Next=0;
//         end;
//   end;

//   local procedure "....................................."()
//   begin
//   end;

//   procedure FnCopyRecordLinks(DocumentNo: Code[100];NewDocumentNo: Code[100];PRTemp: Record "Purchase Requisition Template")
//   var
//       RecordLink: Record "Record Link";
//       ObjRecordLink: Record "Record Link";
//       LinkIDNo: Integer;
//   begin
//       RecordLink.Reset;
//       RecordLink.SetCurrentkey("Document No");
//       RecordLink.SetRange(RecordLink."Document No",DocumentNo);
//       if RecordLink.FindSet then
//         //BEGIN
//          repeat
//               ObjRecordLink.Init;
//               ObjRecordLink."Link ID":=0;
//               ObjRecordLink."Record ID":=PRTemp.RecordId;
//               ObjRecordLink.URL1:=RecordLink.URL1;
//               ObjRecordLink.URL2:=RecordLink.URL2;
//               ObjRecordLink.URL3:=RecordLink.URL3;
//               ObjRecordLink.URL4:=RecordLink.URL4;
//               ObjRecordLink.Description:=RecordLink.Description;
//               ObjRecordLink.Type:=RecordLink.Type;
//               ObjRecordLink.Note:=RecordLink.Note;
//               ObjRecordLink.Created:=CurrentDatetime;
//               ObjRecordLink."User ID":=UserId;
//               ObjRecordLink.Company:=COMPANYNAME;
//               ObjRecordLink.Notify:=RecordLink.Notify;
//               ObjRecordLink."To User ID":=RecordLink."To User ID";
//               ObjRecordLink."Base URL":=RecordLink."Base URL";
//               ObjRecordLink."Document No":=NewDocumentNo;
//               ObjRecordLink."Fetch To Sharepoint":=RecordLink."Fetch To Sharepoint";
//               ObjRecordLink."Uploaded To SharePoint":=RecordLink."Uploaded To SharePoint";
//               ObjRecordLink."SP URL Returned":=RecordLink."SP URL Returned";
//               ObjRecordLink.Polled:=RecordLink.Polled;
//               ObjRecordLink."Failure reason":=RecordLink."Failure reason";
//               ObjRecordLink.LocalUrl:=RecordLink.LocalUrl;
//               ObjRecordLink.Insert(true);

//       //        MESSAGE(FORMAT(ObjProjectRoadLink));
//         until RecordLink.Next=0;
//       //END;
//   end;

