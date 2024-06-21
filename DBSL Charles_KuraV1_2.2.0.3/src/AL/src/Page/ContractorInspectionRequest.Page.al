#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72649 "Contractor Inspection Request"
{
    Caption = 'Contractor Inspection/Test Request Form';
    PageType = Card;
    SourceTable = "Contractor Inspection Request";

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requires Lab Test"; Rec."Requires Lab Test")
                {
                    ApplicationArea = Basic;
                }
                field("Requires Survey"; Rec."Requires Survey")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Name"; Rec."Contract Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Daily/Weekly/Monthly W/Plan No"; Rec."Daily/Weekly/Monthly W/Plan No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Resident Engineer ID"; Rec."Resident Engineer ID")
                {
                    ApplicationArea = Basic;
                }
                field("Residnet Engineer Name"; Rec."Residnet Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent No."; Rec."Site Agent No.")
                {
                    ApplicationArea = Basic;
                }
                field("Site Agent Name"; Rec."Site Agent Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                }
                field("Last Modified By"; Rec."Last Modified By")
                {
                    ApplicationArea = Basic;
                }
                field("Last Modified Date Time"; Rec."Last Modified Date Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22; "Test Request Line Subpage")
            {
                Caption = 'Contractor Inspection/Test Request Activities';
                SubPageLink = "Document No." = field("Document No.");
            }
            group(Inspectorate)
            {
                Caption = 'Inspectorate';
                field("Inspectorate Remarks"; Rec."Inspectorate Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Inspected By"; Rec."Inspected By")
                {
                    ApplicationArea = Basic;
                }
                field("Inspected Date Time"; Rec."Inspected Date Time")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Survey Department")
            {
                Caption = 'Survey Department';
                Visible = Rec."Requires Survey" = true;
                field("Survey Remarks"; Rec."Survey Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Remarks By"; Rec."Survey Remarks By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Surveyed Remarks By';
                }
                field("Survey Remarks Date Time Enter"; Rec."Survey Remarks Date Time Enter")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Lab Section/Department")
            {
                Caption = 'Lab Section/Department';
                Visible = Rec."Requires Lab Test" = true;
                field("Lab Remarks"; Rec."Lab Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Lab Remarks By"; Rec."Lab Remarks By")
                {
                    ApplicationArea = Basic;
                }
                field("Lab Remarks DateTime Entered"; Rec."Lab Remarks DateTime Entered")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Resident Engineer's Remarks")
            {
                Caption = 'Resident Engineer''s Remarks';
                field("RE Remarks"; Rec."RE Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("RE Remarks Datetime Entered"; Rec."RE Remarks Datetime Entered")
                {
                    ApplicationArea = Basic;
                }
                field("RE Remarks By"; Rec."RE Remarks By")
                {
                    ApplicationArea = Basic;
                }
                field(Inspected; Rec.Inspected)
                {
                    ApplicationArea = Basic;
                }
                field(Tested; Rec.Tested)
                {
                    ApplicationArea = Basic;
                }
                field(Measured; Rec.Measured)
                {
                    ApplicationArea = Basic;
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = Basic;
                }
                field("Inspected But Not Approved"; Rec."Inspected But Not Approved")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(FactBoxes)
        {
            part(Control1906354007; "Document Attachment Factbox")
            {

                SubPageLink = "Table ID" = const(72318),
                              "No." = field("Document No.");

            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Survey Quality Checks';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Document No.", 'Testing', Rec.RecordId, '');
                    Rec.Modify();
                end;
            }
            action("Attach Docs2")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Material Test Records';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Document No.", 'Testing', Rec.RecordId, '');
                    Rec.Modify();
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    /*TESTFIELD(Status,Status::Open);
                    RecVariant:=Rec;
                    RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVariant,"Project ID",DocumentType::"Work Execution Plan","Project ID",ApprovalEntry."Document Type"::PCO,0,RECORDID,FnGetTableNo());
                    Status:=Status::"Pending Approval";
                    MODIFY(TRUE);
                    EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEntry,"Project ID");
                    MESSAGE(TXT0001);*/

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    RecRef: RecordRef;
                    CustomApprovalEntry: Record "Custom Approval Entry";
                    OldStatus: Option;
                begin
                    /*TESTFIELD(Status,Status::"Pending Approval");
                    TESTFIELD("Created By",USERID);
                    
                    CustomApprovalEntry.RESET;
                    CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Document No.","Project ID");
                    CustomApprovalEntry.SETRANGE(CustomApprovalEntry."Record ID to Approve",RECORDID);
                    CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                    IF CustomApprovalEntry.FINDSET THEN
                      REPEAT
                        OldStatus := ApprovalEntry.Status;
                        CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Canceled;
                        CustomApprovalEntry.MODIFY(TRUE);
                       UNTIL CustomApprovalEntry.NEXT=0;
                    
                    //Notify The User
                    EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                    Status:=Status::Open;
                    MODIFY(TRUE);
                    
                    MESSAGE(TXT0002);*/

                end;
            }
            // action("Project Approvals")
            // {
            //     ApplicationArea = Basic;
            //     Ellipsis = true;
            //     Image = Approvals;
            //     Promoted = true;
            //     PromotedCategory = Category4;
            //     PromotedIsBig = true;
            //     PromotedOnly = true;

            //     trigger OnAction()
            //     begin
            //         ApprovalsMgmt.FnOpenApprovalEntriesPage(RecordId);
            //     end;
            // }
            // action(Approve)
            // {
            //     ApplicationArea = Suite;
            //     Caption = 'Approve';
            //     Image = Approve;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     Scope = Repeater;
            //     ToolTip = 'Approve the requested changes.';

            //     trigger OnAction()
            //     var
            //         CustomApprovalEntry: Record "Custom Approval Entry";
            //         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
            //     begin
            //         //CurrPage.SETSELECTIONFILTER(CustomApprovalEntry);
            //         ApprovalsMgmt.FnApproveRecordApprovalRequest(RecordId);

            //         CustomApprovalEntry.Reset;
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry.Status,CustomApprovalEntry.Status::Approved);
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.",FnGetLargestSequenceNoFromApprovalEntry("Project ID"));
            //         Message(Format(FnGetLargestSequenceNoFromApprovalEntry("Project ID")));
            //         if CustomApprovalEntry.FindFirst then
            //           begin
            //         //      ReleaseApprovalDocument.ReleaseSAVReq(Rec);
            //            end;
            //     end;
            // }
            // action(Reject)
            // {
            //     ApplicationArea = Suite;
            //     Caption = 'Reject';
            //     Image = Reject;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     Scope = Repeater;
            //     ToolTip = 'Reject the approval request.';

            //     trigger OnAction()
            //     var
            //         ApprovalEntry: Record "Custom Approval Entry";
            //         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
            //         currentRecEntryNo: Integer;
            //         CustomApprovalEntryChange: Record "Custom Approval Entry History";
            //     begin
            //         //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
            //         //Added
            //         //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
            //         //Added
            //         CustomApprovalEntry.Reset;
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry.Status,CustomApprovalEntry.Status::Open);
            //         if CustomApprovalEntry.FindSet then begin
            //            currentRecEntryNo:=CustomApprovalEntry."Sequence No.";
            //         end;//Added

            //         ApprovalsMgmt.FnRejectRecordApprovalRequest(RecordId);

            //         CustomApprovalEntry.Reset;
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
            //         //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
            //         if CustomApprovalEntry.FindSet then
            //           repeat
            //             CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Rejected;
            //             CustomApprovalEntry.Modify(true);
            //           until CustomApprovalEntry.Next=0;

            //         // /
            //         Modify(true);

            //         //Added part 2
            //         if currentRecEntryNo>1 then begin
            //         CustomApprovalEntry.Reset;
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.",currentRecEntryNo);
            //         if CustomApprovalEntry.FindSet then begin
            //           repeat
            //            UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
            //            CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Created;
            //            CustomApprovalEntry.Modify();
            //           until CustomApprovalEntry.Next=0;
            //         end;

            //         end;

            //         if currentRecEntryNo>1 then begin
            //             CustomApprovalEntry.Reset;
            //             CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
            //             CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
            //             CustomApprovalEntry.SetFilter(CustomApprovalEntry."Sequence No.",'<%1',currentRecEntryNo);
            //             if CustomApprovalEntry.FindSet then begin
            //               repeat

            //                 if (CustomApprovalEntry."Sequence No."=(currentRecEntryNo-1)) then begin
            //                    CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Open;
            //                 end
            //                 else if (CustomApprovalEntry."Sequence No.">currentRecEntryNo) then begin
            //                    CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Created;
            //                 end else begin
            //                    CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Approved;
            //                 end;
            //                 UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
            //                CustomApprovalEntry.Modify();

            //               until CustomApprovalEntry.Next=0;
            //             end;
            //         end;
            //         if currentRecEntryNo=1 then begin
            //           CustomApprovalEntry.Reset;
            //           CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
            //           CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
            //           //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
            //           if CustomApprovalEntry.FindSet then
            //             repeat
            //               CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Rejected;
            //               CustomApprovalEntry.Modify(true);
            //             until CustomApprovalEntry.Next=0;

            //           //Status:=Status::Open;
            //           Modify(true);
            //         end;
            //         //Added part 2

            //         EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);


            //         Find
            //     end;
            // }
            // action(Delegate)
            // {
            //     ApplicationArea = Suite;
            //     Caption = 'Delegate';
            //     Image = Delegate;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     Scope = Repeater;
            //     ToolTip = 'Delegate the approval to a substitute approver.';

            //     trigger OnAction()
            //     var
            //         ApprovalEntry: Record "Custom Approval Entry";
            //         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
            //         Selected: Integer;
            //         USetup: Record "User Setup";
            //         Options: Text;
            //         "Count": Integer;
            //         SelectedUser: Code[50];
            //         Region: Text;
            //     begin
            //         //Added
            //             Options:='Default Substitute,';
            //             //Get Region
            //             USetup.Reset;
            //             USetup.SetRange("User ID",UserId);
            //             if USetup.Find('-') then begin
            //                 Region:=SelectedUser;
            //             end;

            //             USetup.Reset;
            //             USetup.SetRange("Region Code",Region);
            //             if USetup.Find('-') then begin
            //               repeat

            //               Options:=Options+USetup."User ID"+',';

            //             until USetup.Next=0;
            //             end;


            //         Selected := Dialog.StrMenu(Options, 1, 'Select User');

            //             USetup.Reset;
            //             USetup.SetRange("Region Code",Region);
            //             if USetup.Find('-') then begin repeat
            //                Count:=Count+1;
            //               if Selected = Count+1 then begin
            //                 SelectedUser:=USetup."User ID";
            //               end;
            //             until USetup.Next=0;
            //             end;

            //             USetup.Reset;
            //             USetup.SetRange("User ID",UserId);
            //             if USetup.Find('-') then begin
            //                 USetup."Substitute Selected":=true;
            //                 USetup."Selected Substitute":=SelectedUser;
            //                 USetup.Modify();
            //             end;
            //         //Added

            //         //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
            //         ApprovalsMgmt.FnDelegateRecordApprovalRequest(RecordId);
            //         EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);
            //     end;
            // }
            // action("Reject Document")
            // {
            //     ApplicationArea = Basic;
            //     Image = Reject;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;

            //     trigger OnAction()
            //     begin
            //         /*TESTFIELD("Rejection Remarks");
            //         Rejected:=TRUE;
            //         "Rejected By":=USERID;
            //         MODIFY();
            //         MESSAGE('Document Rejected.');*/

            //     end;
            // }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
        TXT0001: label 'An approval request has been sent and approvers notified successfully.';
        TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';
        ProcProcess: Codeunit "Procurement Processing";
        DocType: Record "DMS Documents";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        RMS: Codeunit "RMS Management";
        ShowWorkflowStatus: Boolean;
        PRN: Record "Purchase Header";
        ProcCommType: Record "Procurement Committee Types";
        IfsCommitteMembers: Record "IFS Tender Committee Member";
        NoOfMembers: Integer;
        ProjectStaffAppointment: Record "Project Staff Appointment";
        ProjectStaffAppointList: Page "Project Staff Appoint. List";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectStaffTerminationLine: Record "Project Staff Termination Line";
        ProcurementProcessing: Codeunit "Procurement Processing";
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
        PCOInternalProjectTeam: Record "PCO Internal Project Team";
        PCORequiredDocument: Record "PCO Required Document";
        ProjectDocumentTemplate: Record "Project Document Template";
        ProjectDocumentTemplateLine: Record "Project Document Template Line";
        ObjJob: Record Job;
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        WEPExecutionSchedule: Record "WEP Execution Schedule";
        JobPlanningLine: Record "Job Planning Line";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        ProjectMeetingRegister: Record "Project Meeting Register";
        PCOPlannedMeeting: Record "PCO Planned Meeting";
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        EmailBody: Text[250];
        acknowledgementtabvisible: Boolean;
        ProjectMeetingAgendaTemp: Record "Project Meeting Agenda Temp";
        MeetingAgendaItemTemplate: Record "Meeting Agenda Item Template";
        ProjectMeetingAgenda: Record "Project Meeting Agenda";
        ProjectMeetingSummary: Record "Project Meeting Summary";
        CompanyInformation: Record "Company Information";
        HumanResourcesSetup: Record "Human Resources Setup";
        Window: Dialog;
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit Mail;
        SenderAddress: Text[100];
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        CustEmail: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        Vendors: Record Vendor;
        ProjectApprovalSetup: Record "Project Approval Setup";
        ApprovalEntry: Record "Approval Entry";
        InternalProjectResource: Record "Internal Project Resource";
        Employee: Record Employee;
        RMSManagement: Codeunit "RMS Management";
        RecVariant: Variant;
        RecID: RecordID;
        ReleaseApprovalDocument: Codeunit "Release Approval Document";
        UserSetup: Record "User Setup";
        EmailNotifications: Codeunit "Email Notifications";
        CustomApprovalEntry: Record "Custom Approval Entry";
        DocumentType: Option " ","Commenncement Order","Communication Plan","Staff Appointments","Internal Staff Disengement","Staff Disengagement","Mobilization Checklist","Mobilization Checklist Status Report","Professional Indemnity","Work Execution Plan","HSE Plan",RMP,QMP,"Contract Supervision Requirement","Site Agent Nomination","Contractor Key Personnel Appointment","Equipment Delivery To Site","Insurance of Works","Advance Payment Guarantee","Performance Guarantee","Equipment Tracking";

    local procedure FnSuggestProjectTeam()
    begin
        FnSuggestProjectTeams();
    end;

    local procedure FnGetTableNo(): Integer
    var
        RecID: RecordID;
        RecRef: RecordRef;
    begin
        RecRef.Open(Database::"Project Mobilization Header");
        if RecRef.Find('-') then begin
            RecID := RecRef.RecordId;
        end;
        exit(RecID.TableNo);
    end;

    procedure FnGetLargestSequenceNoFromApprovalEntry(DocumentNo: Code[50]): Integer
    var
        CustomApprovalEntry: Record "Custom Approval Entry";
    begin
        CustomApprovalEntry.Reset;
        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", DocumentNo);
        if CustomApprovalEntry.FindLast then
            exit(CustomApprovalEntry."Sequence No.");
    end;

    local procedure FnNotifyRejectionEmailCustom()
    begin
        CompanyInformation.Get;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", Rec."Project ID");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
            if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                if UserSetup."E-Mail" <> '' then begin
                    // EmailNotifications.FnSendEmail(CompanyInformation."E-Mail", COMPANYNAME, UserSetup."E-Mail", 'REJECTION APROVALS:', 'This approval has been rejected.' + ' ' + ApprovalEntry."Document No.");
                end;
            end;
        end;
    end;

    local procedure FnNotifyDelegationEmailCustom()
    begin
        CompanyInformation.Get;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", Rec."Project ID");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
            if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                if UserSetup."E-Mail" <> '' then begin
                    //  EmailNotifications.FnSendEmail(CompanyInformation."E-Mail", COMPANYNAME, UserSetup."E-Mail", 'DELEGATION APROVALS:', 'This approval has been delegated.' + ' ' + ApprovalEntry."Document No.");
                end;
            end;
        end;
    end;

    local procedure UpdateCustomApprovalEntryHistory(CustomApprovalEntry: Record "Custom Approval Entry")
    var
        CustomApprovalEntryHistory: Record "Custom Approval Entry History";
    begin
        CustomApprovalEntryHistory.Init;
        CustomApprovalEntryHistory."Entry No." := 0;
        CustomApprovalEntryHistory."Old Entry No" := CustomApprovalEntry."Entry No.";
        CustomApprovalEntryHistory."Table ID" := CustomApprovalEntry."Table ID";
        CustomApprovalEntryHistory."Document Type" := CustomApprovalEntry."Document Type";
        CustomApprovalEntryHistory."Document No." := CustomApprovalEntry."Document No.";
        CustomApprovalEntryHistory."Sender ID" := CustomApprovalEntry."Sender ID";
        CustomApprovalEntryHistory."Date-Time Sent for Approval" := CustomApprovalEntry."Date-Time Sent for Approval";
        CustomApprovalEntryHistory."Last Modified By User ID" := CustomApprovalEntry."Last Modified By User ID";
        CustomApprovalEntryHistory."Last Date-Time Modified" := CustomApprovalEntry."Last Date-Time Modified";
        CustomApprovalEntryHistory."Due Date" := CustomApprovalEntry."Due Date";
        CustomApprovalEntryHistory.Amount := CustomApprovalEntry.Amount;
        CustomApprovalEntryHistory."Record ID to Approve" := CustomApprovalEntry."Record ID to Approve";
        CustomApprovalEntryHistory."Approval Type" := CustomApprovalEntry."Approval Type";
        CustomApprovalEntryHistory."Sequence No." := CustomApprovalEntry."Sequence No.";
        CustomApprovalEntryHistory.Status := CustomApprovalEntry.Status;
        CustomApprovalEntryHistory."Approver ID" := CustomApprovalEntry."Approver ID";
        CustomApprovalEntryHistory.Insert(true);
    end;

    local procedure FnSuggestProjectTeams()
    begin
        /*ProjectStaffAppointmentLine.RESET;
        ProjectStaffAppointmentLine.SETRANGE(ProjectStaffAppointmentLine."Document No.","Staff Appointment Voucher No.");
        IF ProjectStaffAppointmentLine.FINDSET THEN
          REPEAT
            PCOInternalProjectTeam.INIT;
            PCOInternalProjectTeam."Commencement Order No.":="Document No.";
            PCOInternalProjectTeam."Resource No.":=ProjectStaffAppointmentLine."Resource No.";
            PCOInternalProjectTeam.Name:=ProjectStaffAppointmentLine.Name;
            PCOInternalProjectTeam.Email:=ProjectStaffAppointmentLine.Email;
            PCOInternalProjectTeam.Designation:=ProjectStaffAppointmentLine.Designation;
            PCOInternalProjectTeam."Role Code":=ProjectStaffAppointmentLine."Role Code";
            PCOInternalProjectTeam.INSERT(TRUE);
          UNTIL ProjectStaffAppointmentLine.NEXT =0;*/

    end;
}

#pragma implicitwith restore

