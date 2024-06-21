page 50008 "Posted Adv Payment Cert"
{
    Caption = 'Posted Adv Payment Cert';
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.Description := 'Advance Payment Request' + ' ' + Rec."Project ID";
                    end;
                }
                field("IPC Number"; Rec."IPC Number")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reason For Reversal"; Rec."Reason For Reversal")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed By"; Rec."Reversed By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Contract Sum"; Rec."Total Contract Sum")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Advance Payment Security ID"; Rec."Advance Payment Security ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Payment Guar. Ref';
                }
                field("Advance Pmt Gua. Expiry Date"; Rec."Advance Pmt Gua. Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Security ID"; Rec."Performance Security ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Sec. Expiry Date"; Rec."Performance Sec. Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Payment Amount(LCY)"; Rec."Advance Payment Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Requested Advance Payment(LCY)"; Rec."Requested Advance Payment(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Request No"; Rec."Advance Request No")
                {
                    ApplicationArea = BASIC;
                    Editable = true;
                }
                field("Advance Payment Settled(LCY)"; Rec."Advance Payment Settled(LCY)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advance Paid to Date';
                }
                field("Approved Advance Amount"; Rec."Approved Advance Amount")
                {
                    ApplicationArea = Basic;
                    Caption = ' Advance Amount to pay';
                }
                field("Outstanding Balance to Date"; Rec."Outstanding Balance to Date")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Payment G/L Account"; Rec."Advance Payment G/L Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Advance Customer No"; Rec."Advance Customer No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Advance Customer Name"; Rec."Advance Customer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Rejection Remarks"; Rec."Rejection Remarks")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative No."; Rec."Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative Name"; Rec."Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Portal Status"; Rec."Portal Status")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Plans for the Advance Payment")
            {
                Caption = 'Plans for the Advance Payment';
                field("Advance Payment Justification"; Rec."Advance Payment Justification")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                    MultiLine = true;
                    ShowMandatory = true;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {

            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(RecID);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    ;
                    Report.Run(75005, true, true, Rec);
                end;
            }


        }
    }



    var
        PurchaseHeader: Record "Purchase Header";
        PaymentCertificateLine: Record "Payment Certificate Line";
        PurchaseLine: Record "Purchase Line";
        PurchaseInvoice: Page "Purchase Invoice";
        PurchNo: Code[20];
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        PaymentsPost: Codeunit "Payments-Post";
        Job: Record Job;
        RiskManagement: Codeunit "Risk Management";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        //RiskStatusReportLine: Record "Risk Status Report Line";
        NewRiskLineOwnership: Record "New Risk Line Ownership";
        NewRiskLineResponseAction: Record "New Risk Line Resp. Action";
        NewRiskLineJobTask: Record "New Risk Line Job Task";
        RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action";
        RiskStatusRptIncident: Record "Risk Status Rpt Incident";
        ObjRiskMgt: Codeunit "Risk Management";
        RMPLine: Record "Risk Management Plan Line";
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
        //NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        ProjectMeetingRegister: Record "Project Meeting Register";
        PCOPlannedMeeting: Record "PCO Planned Meeting";
        //SMTPMailSetup: Record "Email Account";
        //SMTPMail: Codeunit Mail;
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
        mymail: Codeunit "Mail Management";
        WindowisOpen: Boolean;
        //FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        //cu400: Codeunit Mail;
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

}
