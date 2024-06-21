
Page 72689 "Material Test Cert. Submission"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Material Test Record";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Material Delivery Date"; Rec."Material Delivery Date")
                {
                    ApplicationArea = Basic;
                }
                field("Testing Date"; Rec."Testing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    OptionCaption = 'Open,Pending Approval,Released';
                }
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Caption = 'Submitted';
                }
            }
            part(Control6;"Material Test Certificate Line")
            {
                Caption = 'Material Test Details';
                SubPageLink = Code=field(Code);
                         //   =field("Document Type");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadPaymentsDocuments(Rec.Code, 'Material Test Record', Rec.RecordId, Rec."Region ID");
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    Message('Please finish up');
                    //Notify RE from the Internal Project Resource I-RE
                end;
            }
            action("Notify RE")
            {
                ApplicationArea = Basic;
                Image = Notes;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ProcProcess.FnNotifyRETestMaterialCert(Rec);
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
                    // TestField(Status,Status::Open);
                    // RecVariant:=Rec;
                    // RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVariant,"Project ID",Documenttype::"Work Execution Plan","Project ID",ApprovalEntry."document type"::PCO,0,RecordId,FnGetTableNo());
                    // Status:=Status::"Pending Approval";
                    // Modify(true);
                    // EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEntry,"Project ID");
                    // Message(TXT0001);
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
            //         TestField(Status,Status::"Pending Approval");
            //         TestField("Created By",UserId);

            //         CustomApprovalEntry.Reset;
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.","Project ID");
            //         CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve",RecordId);
            //         CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
            //         if CustomApprovalEntry.FindSet then
            //           repeat
            //             OldStatus := ApprovalEntry.Status;
            //             CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Canceled;
            //             CustomApprovalEntry.Modify(true);
            //            until CustomApprovalEntry.Next=0;

            //         //Notify The User
            //         EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
            //         Status:=Status::Open;
            //         Modify(true);

            //         Message(TXT0002);
            //     end;
            // }
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
                end;
            }
            action(Reject)
            {
                ApplicationArea = Suite;
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Reject the approval request.';

                trigger OnAction()
                var
                    ApprovalEntry: Record "Custom Approval Entry";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    currentRecEntryNo: Integer;
                    CustomApprovalEntryChange: Record "Custom Approval Entry History";
                begin
                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //Added
                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //Added
                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    CustomApprovalEntry.SetRange(CustomApprovalEntry.Status,CustomApprovalEntry.Status::Open);
                    if CustomApprovalEntry.FindSet then begin
                       currentRecEntryNo:=CustomApprovalEntry."Sequence No.";
                    end;//Added

                    //ApprovalsMgmt.FnRejectRecordApprovalRequest(RecordId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                    if CustomApprovalEntry.FindSet then
                      repeat
                        CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Rejected;
                        CustomApprovalEntry.Modify(true);
                      until CustomApprovalEntry.Next=0;

                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);

                    //Added part 2
                    if currentRecEntryNo>1 then begin
                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.",currentRecEntryNo);
                    if CustomApprovalEntry.FindSet then begin
                      repeat
                       UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                       CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Created;
                       CustomApprovalEntry.Modify();
                      until CustomApprovalEntry.Next=0;
                    end;

                    end;

                    if currentRecEntryNo>1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry."Sequence No.",'<%1',currentRecEntryNo);
                        if CustomApprovalEntry.FindSet then begin
                          repeat

                            if (CustomApprovalEntry."Sequence No."=(currentRecEntryNo-1)) then begin
                               CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Open;
                            end
                            else if (CustomApprovalEntry."Sequence No.">currentRecEntryNo) then begin
                               CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Created;
                            end else begin
                               CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Approved;
                            end;
                            UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                           CustomApprovalEntry.Modify();

                          until CustomApprovalEntry.Next=0;
                        end;
                    end;
                    if currentRecEntryNo=1 then begin
                      CustomApprovalEntry.Reset;
                      CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                      CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                      //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                      if CustomApprovalEntry.FindSet then
                        repeat
                          CustomApprovalEntry.Status:=CustomApprovalEntry.Status::Rejected;
                          CustomApprovalEntry.Modify(true);
                        until CustomApprovalEntry.Next=0;

                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                    end;
                    //Added part 2

                    EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);


                    Find
                end;
            }
            action(Delegate)
            {
                ApplicationArea = Suite;
                Caption = 'Delegate';
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Delegate the approval to a substitute approver.';

                trigger OnAction()
                var
                    ApprovalEntry: Record "Custom Approval Entry";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    Selected: Integer;
                    USetup: Record "User Setup";
                    Options: Text;
                    "Count": Integer;
                    SelectedUser: Code[50];
                    Region: Text;
                begin
                    //Added
                        Options:='Default Substitute,';
                        //Get Region
                        USetup.Reset;
                        USetup.SetRange("User ID",UserId);
                        if USetup.Find('-') then begin
                            Region:=SelectedUser;
                        end;

                        USetup.Reset;
                        USetup.SetRange("Region Code",Region);
                        if USetup.Find('-') then begin
                          repeat

                          Options:=Options+USetup."User ID"+',';

                        until USetup.Next=0;
                        end;


                    Selected := Dialog.StrMenu(Options, 1, 'Select User');

                        USetup.Reset;
                        USetup.SetRange("Region Code",Region);
                        if USetup.Find('-') then begin repeat
                           Count:=Count+1;
                          if Selected = Count+1 then begin
                            SelectedUser:=USetup."User ID";
                          end;
                        until USetup.Next=0;
                        end;

                        USetup.Reset;
                        USetup.SetRange("User ID",UserId);
                        if USetup.Find('-') then begin
                            USetup."Substitute Selected":=true;
                            USetup."Selected Substitute":=SelectedUser;
                            USetup.Modify();
                        end;
                    //Added

                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    // ApprovalsMgmt.FnDelegateRecordApprovalRequest(RecordId);
                    // EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);
                end;
            }
            action("Reject Document")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*TESTFIELD("Rejection Remarks");
                    Rejected:=TRUE;
                    "Rejected By":=USERID;
                    MODIFY();
                    MESSAGE('Document Rejected.');*/

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Material Test Certificate";
    end;

    var
        DMSManagement: Codeunit "DMS Management";
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
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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
        TXT0001: label 'An approval request has been sent and approvers notified successfully.';
        TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';

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
        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.",DocumentNo);
        if CustomApprovalEntry.FindLast then
          exit(CustomApprovalEntry."Sequence No.");
    end;

    local procedure FnNotifyRejectionEmailCustom()
    begin
        CompanyInformation.Get;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Document No.",Rec."Project ID");
        ApprovalEntry.SetRange(ApprovalEntry.Status,ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
          if UserSetup.Get(ApprovalEntry."Sender ID") then begin
            if UserSetup."E-Mail" <> '' then begin
               EmailNotifications.FnSendEmail(CompanyInformation."E-Mail",COMPANYNAME,UserSetup."E-Mail",'REJECTION APROVALS:','This approval has been rejected.'+ ' '+ApprovalEntry."Document No.");
              end;
            end;
          end;
    end;

    local procedure FnNotifyDelegationEmailCustom()
    begin
        CompanyInformation.Get;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", Rec."Project ID");
        ApprovalEntry.SetRange(ApprovalEntry.Status,ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
          if UserSetup.Get(ApprovalEntry."Sender ID") then begin
            if UserSetup."E-Mail" <> '' then begin
               EmailNotifications.FnSendEmail(CompanyInformation."E-Mail",COMPANYNAME,UserSetup."E-Mail",'DELEGATION APROVALS:','This approval has been delegated.'+ ' '+ApprovalEntry."Document No.");
              end;
            end;
          end;
    end;

    local procedure UpdateCustomApprovalEntryHistory(CustomApprovalEntry: Record "Custom Approval Entry")
    var
        CustomApprovalEntryHistory: Record "Custom Approval Entry History";
    begin
              CustomApprovalEntryHistory.Init;
              CustomApprovalEntryHistory."Entry No.":=0;
              CustomApprovalEntryHistory."Old Entry No":=CustomApprovalEntry."Entry No.";
              CustomApprovalEntryHistory."Table ID":=CustomApprovalEntry."Table ID";
              CustomApprovalEntryHistory."Document Type":=CustomApprovalEntry."Document Type";
              CustomApprovalEntryHistory."Document No.":=CustomApprovalEntry."Document No.";
              CustomApprovalEntryHistory."Sender ID":=CustomApprovalEntry."Sender ID";
              CustomApprovalEntryHistory."Date-Time Sent for Approval":=CustomApprovalEntry."Date-Time Sent for Approval";
              CustomApprovalEntryHistory."Last Modified By User ID":=CustomApprovalEntry."Last Modified By User ID";
              CustomApprovalEntryHistory."Last Date-Time Modified":=CustomApprovalEntry."Last Date-Time Modified";
              CustomApprovalEntryHistory."Due Date":=CustomApprovalEntry."Due Date";
              CustomApprovalEntryHistory.Amount:=CustomApprovalEntry.Amount;
              CustomApprovalEntryHistory."Record ID to Approve":=CustomApprovalEntry."Record ID to Approve";
              CustomApprovalEntryHistory."Approval Type":=CustomApprovalEntry."Approval Type";
              CustomApprovalEntryHistory."Sequence No.":=CustomApprovalEntry."Sequence No.";
              CustomApprovalEntryHistory.Status:=CustomApprovalEntry.Status;
              CustomApprovalEntryHistory."Approver ID":=CustomApprovalEntry."Approver ID";
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


