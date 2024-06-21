/// <summary>
/// Page Security Incidence Card (ID 60004).
/// </summary>
page 60004 "Security Incidence Card"
{
    PageType = Card;
    SourceTable = "Security Incidences";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                }
                field("Severity Level"; "Severity Level")
                {
                }
                field("Incident Type"; "Incident Type")
                {
                }
                field("Incident Type Details"; "Incident Type Details")
                {
                }
                field("Time Reported"; "Time Reported")
                {
                }
                field(Stakeholder; Stakeholder)
                {
                }
                field("Approval Status"; "Approval Status")
                {
                    Editable = false;
                }
                field("Incidence Stage"; "Incidence Stage")
                {
                    Editable = false;
                }
                group("Reporter Information")
                {
                    Caption = 'Reporter Information';
                    field("Reported By Type"; "Reported By Type")
                    {
                    }
                    field("Reporter Number"; "Reporter Number")
                    {
                    }
                    field("Reporter Name"; "Reporter Name")
                    {
                    }
                    field("Reporter Phone Number"; "Reporter Phone Number")
                    {
                    }
                    field("Reporter Email Address"; "Reporter Email Address")
                    {
                    }
                    field("Time Occured"; "Time Occured")
                    {
                    }
                }
            }
            group("Incidents Details")
            {
                Caption = 'Incident Details';
                field("Incident Details"; "Incident Details")
                {
                    MultiLine = true;
                }
            }
            part("Incidence Resolution List"; "Incidence Resolutions List")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
            }
            part("Incidence Mitigation Strategy"; "Incidence Mitigation Strategy")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }

            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = true;

                trigger OnAction()
                var
                CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                   Rec.TESTFIELD("Approval Status", Rec."Approval Status"::Open);
                    Rec.TESTFIELD("Reporter Number");
                   Rec.TESTFIELD("Incident Type");

                  
                   VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    // "Approval Status":="Approval Status"::Released;
                    //MODIFY;
                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = true;

                trigger OnAction()
                var
                 CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                      Rec.TestField("Approval Status", Rec."Approval Status"::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);                    
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GETTABLE(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RUNMODAL;
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                Enabled = PendingApp;
                Visible = PendingApp;
            }
            action(Print)
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;
                trigger OnAction()
                var
                    Req: Record "Transport Requisition";
                begin
                    //Req.RESET;
                    //Req.SETRANGE(Req."Transport Requisition No","Transport Requisition No");
                    REPORT.RUN(59018, TRUE, TRUE, Rec);
                end;
            }
            action(AttachDocuments)
            {
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = true;

                trigger OnAction()
                begin
                    //DMSManagement.UploadImprestDocuments(DMSDocuments."Document Type"::"13","Transport Requisition No",'Transport Requisition',RECORDID,"Department Code");
                end;
            }
            action("Submit Incident")
            {
                Enabled = "Incidence Stage" = "Incidence Stage"::New;
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    TESTFIELD("Incidence Stage", "Incidence Stage"::New);
                    "Incidence Stage" := "Incidence Stage"::"In Progress";
                    MESSAGE('Incident Submitted Successfully');
                    //NotifyApplicantEscal();
                    CurrPage.CLOSE;
                end;
            }
            action("Submit Resolution Details")
            {
                Enabled = "Incidence Stage" = "Incidence Stage"::"In Progress";
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    TESTFIELD("Incidence Stage", "Incidence Stage"::"In Progress");
                    "Incidence Stage" := "Incidence Stage"::"Awaiting Closure";
                    MESSAGE('Incident Details Submitted Successfully');
                    NotifyApplicantEscal();
                    CurrPage.CLOSE;
                end;
            }
            action("Resolve/Close")
            {
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    intNo: Integer;
                begin
                    //TESTFIELD("Incidence Stage","Incidence Stage"::"Awaiting Closure");
                    "Incidence Stage" := "Incidence Stage"::Closed;
                    Closed := TRUE;
                    "Closed By" := USERID;
                    "Closed On" := CURRENTDATETIME;
                    NotifyApplicantFeedback();
                    MESSAGE('Incident Resolved');
                    CurrPage.CLOSE;
                end;
            }
        }
    }

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        //SMSMessages: Record "57007";
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        PendingApp: Boolean;
        Email: Codeunit EMail;
        SMTPMail: Codeunit "Email Message";

    procedure NotifyApplicantEscal()
    var
        HRLeaveApp: Record "HR Leave Applications";
        Emp: Record Employee;
        Filename: Text;
        // SMTPSetup: Record "409";
        
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        CompanyInformation: Record "Company Information";
        JobQueueEntry: Record "Job Queue Entry";
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        HumanResourcesSetup: Record "Human Resources Setup";
        Employeerec: Record Employee;
        ReleaverMail: Text;
        // ResourcebookingLines: Record "5379";
        StartTime: Time;
        Enddate: Time;
        Duration: Integer;
        ReasonRec: Code[100];
        Body: Text;
    begin

        ObjCompany.GET();
        HumanResourcesSetup.GET();
        Header := 'CRM Workflow Notification ';
      
        IF Emp."Company E-Mail" <> '' THEN BEGIN

            Body := '<br>'
            + 'Dear Sir/Madam,'
            + '<br>'
            + 'You are registered to receive notifications related to ' + ObjCompany.Name + '. This is a message to notify you that:'
            + '<br><br>'
            + 'The following security Incidence report No.<b>' + "No." + '</b>' + ' has been forwarded for your action.'
            + '<br><br>'
            + '<br>'
            + 'This is a system generated mail.'
            + '<br>';
            SMTPMail.Create(HumanResourcesSetup."HR E-mail Address", Header, Body, TRUE);
            EMail.Send(SMTPMail);
            MESSAGE('Email notification has been sent successfuly!')
        END;
    end;

    procedure NotifyApplicantFeedback()
    var
        HRLeaveApp: Record "HR Leave Applications";
        Emp: Record Employee;
        Filename: Text;

        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        CompanyInformation: Record "User Setup";
        JobQueueEntry: Record "Job Queue Entry";
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        HumanResourcesSetup: Record "Human Resources Setup";
        Employeerec: Record Employee;
        ReleaverMail: Text;

        StartTime: Time;
        Enddate: Time;
        Duration: Integer;
        ReasonRec: Code[100];
        Body: Text;
    begin

        ObjCompany.GET();
        HumanResourcesSetup.GET();
        Header := 'CRM Notification ';
     
        IF Emp."Company E-Mail" <> '' THEN BEGIN
            
            Body := '<br>'
            + 'Dear Sir/Madam,'
            + '<br>'
            + 'You are registered to receive notifications related to ' + ObjCompany.Name + '. This is a message to notify you that:'
            + '<br><br>'
            + 'The following security Incidence report No.<b>' + "No." + '</b>' + ' has been resolved.'
            + '<br><br>'
            + '<br>'
            + 'This is a system generated mail.'
            + '<br>';
            SMTPMail.Create("Reporter Email Address", Header,Body, TRUE);
            EMail.Send(SMTPMail);
            MESSAGE('Email notification has been sent successfuly!')
        END;
    end;
}

