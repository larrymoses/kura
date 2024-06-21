#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72208 "Project Commencement Order"
{
    PageType = Card;
    SourceTable = "Project Mobilization Header";
    PromotedActionCategories = 'New,Process,Report,Request Approval,Contract,Post';
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
                field("Purchase Contract ID"; Rec."Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract No';
                }
                field("Order to Commence Reference"; Rec."Order to Commence Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project No';
                }
                field("Project Description"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Description';
                }
                field("Staff Appointment Voucher No."; Rec."Staff Appointment Voucher No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Appointment Requisition No.';
                    Visible = false;
                }
                field("Default CheckList Template ID"; Rec."Default CheckList Template ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project CheckList Template ID';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Required Documents Template ID"; Rec."Required Documents Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Commencement Period"; Rec."Commencement Period")
                {
                    ApplicationArea = Basic;
                }
                field("Commencement Date"; Rec."Commencement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Time for Completion"; Rec."Time for Completion")
                {
                    ApplicationArea = Basic;
                }
                field("Project End  Date"; Rec."Project End  Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Possession of Site Issued"; Rec."Possession of Site Issued")
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
                field("User Group"; Rec."User Group")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control16; "PCO Internal Project Team")
            {
                Caption = ' Internal Project Team';
                SubPageLink = "Commencement Order No." = field("Document No.");
                Visible = false;
            }
            part(Control77; "PCO Project Road Links")
            {
                Caption = 'Project Road Links';
                SubPageLink = "Document No" = field("Document No."),
                              "Document Type" = field("Document Type");
            }
            group("Possession of Site Details")
            {
                Caption = 'Possession of Site Details';
                Visible = Rec.Posted;//acknowledgementtabvisible;
                field("Possession of Site Reference";
                Rec."Possession of Site Reference")
                {
                    ApplicationArea = Basic;
                    Caption = 'Possession of Site Reference No';
                }
                field("Possession of Site Date"; Rec."Possession of Site Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Contract Summary")
            {
                Caption = 'Contract Summary';
                field("Contractor No."; Rec."Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address"; Rec."Vendor Address")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address 2"; Rec."Vendor Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Post Code"; Rec."Vendor Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Primary E-mail"; Rec."Primary E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation For Supply"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Summary")
            {
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Engineer Representative No."; Rec."Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resident Engineer No';
                }
                field("Engineer Representative Name"; Rec."Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resident Engineer Name';
                }
                field("Implementing Agency ID"; Rec."Implementing Agency ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Award Tend Sum Inc Taxes (LCY)"; Rec."Award Tend Sum Inc Taxes (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Site Details")
            {
                field("Project Site Description"; Rec."Project Site Description")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End  Chainage"; Rec."End  Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Start Point Longitude"; Rec."Start Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("Start  Point Latitude"; Rec."Start  Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Latitude"; Rec."End Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("End  Point Longitude"; Rec."End  Point Longitude")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Acknowledgement Details")
            {
                Visible = acknowledgementtabvisible;
                field("Representative ID"; Rec."Representative ID")
                {
                    ApplicationArea = Basic;
                }
                field("Representative Name"; Rec."Representative Name")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Signing Role"; Rec."Contract Signing Role")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Acknowledgement Status"; Rec."Acknowledgement Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Acknowledgement Date"; Rec."Acknowledgement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Acknowledged By"; Rec."Acknowledged By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group("Assignment/Review")
            {
                Caption = 'Assignment/Review';
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control1906354007; "Document Attachment Factbox")
            {

                SubPageLink = "Table ID" = const(72157),
                              //"Document Type" = field("Document Type"),
                              "No." = field("Document No.");
                //   Visible = false;
            }
            systempart(Control88; Links)
            {
                Visible = false;
            }
            systempart(Control87; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Kick-Off Meeting")
            {
                ApplicationArea = Basic;
                Caption = 'Planned Meetings';
                Ellipsis = true;
                Image = MachineCenter;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "PCO Planned Meeting";
                RunPageLink = "Notice No." = field("Document No."),
                              "Project Stage" = filter(Mobilization);

                trigger OnAction()
                begin
                    //MESSAGE('Sucess');
                end;
            }
            action("Site Takeover Instructions")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Insert;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    Mail: Codeunit "Email Message";
                    Email: Codeunit Email;
                    Body: Text;
                    Job2: Record Job;
                    Emp2: Record Employee;
                    Recipients: List of [Text];
                    CCRecipients: List of [Text];
                    BCCRecipients: List of [Text];
                    TempBlob: Codeunit "Temp Blob";
                    DocStream: Instream;
                    Outs: Outstream;
                    RecRef: RecordRef;
                    fref: FieldRef;
                begin
                    if Rec.Posted then
                        Error('Already posted');
                    Rec.TestField(Status, Rec.Status::Released);
                    ObjJob.Reset;
                    ObjJob.SetRange("No.", Rec."Project ID");
                    if ObjJob.FindSet then begin
                        ObjJob.Status := ObjJob.Status::Ongoing;
                        ObjJob.Modify;

                    end;
                    //Convert to WEP
                    RoadManagementSetup.Get;
                    ProjectMobilizationHeader.Init;
                    ProjectMobilizationHeader.TransferFields(Rec);
                    ProjectMobilizationHeader."Document Type" := ProjectMobilizationHeader."document type"::"Work Execution Programme";
                    ProjectMobilizationHeader."Document No." := NoSeriesManagement.GetNextNo(RoadManagementSetup."Work Execution Plan  Nos", Today, true);
                    ProjectMobilizationHeader."Commencement Order ID" := Rec."Document No.";
                    ProjectMobilizationHeader.Status := ProjectMobilizationHeader.Status::Open;
                    ProjectMobilizationHeader.Insert(true);

                    //Update Project with WEP
                    ObjJob.Reset;
                    ObjJob.SetRange("No.", Rec."Project ID");
                    if ObjJob.FindSet then begin
                        ObjJob.Status := ObjJob.Status::Ongoing;
                        ObjJob."Work Execution Plan ID" := ProjectMobilizationHeader."Document No.";
                        ObjJob."Commencement Date" := ProjectMobilizationHeader."Commencement Date";
                        ObjJob."Starting Date" := ProjectMobilizationHeader."Project Start Date";
                        ObjJob."Ending Date" := ProjectMobilizationHeader."Project End  Date";
                        ObjJob."Project Start Date" := ProjectMobilizationHeader."Project Start Date";
                        ObjJob."Project End Date" := ProjectMobilizationHeader."Project End  Date";
                        ObjJob.Modify;
                    end;


                    /* JobPlanningLine.Reset;
                     JobPlanningLine.SetRange("Job No.", Rec."Project ID");
                     if JobPlanningLine.FindSet then
                         repeat
                             WEPExecutionSchedule.Init;
                             WEPExecutionSchedule."Document Type" := ProjectMobilizationHeader."Document Type";
                             WEPExecutionSchedule."Document No" := ProjectMobilizationHeader."Document No.";
                             WEPExecutionSchedule."Job No" := JobPlanningLine."Job No.";
                             WEPExecutionSchedule."Line No" := WEPExecutionSchedule.Count + 1;
                             WEPExecutionSchedule."Job Task No" := JobPlanningLine."Job Task No.";
                             WEPExecutionSchedule.Description := JobPlanningLine.Description;
                             WEPExecutionSchedule."Job Task Type" := JobPlanningLine.Type;
                             WEPExecutionSchedule.Insert;
                         until JobPlanningLine.Next = 0;*/




                    //Create Planned Kick off meeting//Update meeting register
                    PCOPlannedMeeting.Reset;
                    PCOPlannedMeeting.SetRange("Notice No.", Rec."Document No.");
                    if PCOPlannedMeeting.FindSet then begin
                        repeat
                            ProjectMeetingRegister.Init;
                            ProjectMeetingRegister."Meeting ID" := NoSeriesManagement.GetNextNo(RoadManagementSetup."Meeting Register Nos", Today, true);
                            ProjectMeetingRegister."Meeting Type" := PCOPlannedMeeting."Meeting Type";
                            ProjectMeetingRegister."Project ID" := Rec."Project ID";
                            ProjectMeetingRegister.Description := PCOPlannedMeeting.Description;
                            ProjectMeetingRegister."Start Date" := PCOPlannedMeeting."Start Date";
                            ProjectMeetingRegister."End Date" := PCOPlannedMeeting."End Date";
                            ProjectMeetingRegister."Start Time" := PCOPlannedMeeting."Start Time";
                            ProjectMeetingRegister."End Time" := PCOPlannedMeeting."End Time";
                            ProjectMeetingRegister."Created By" := UserId;
                            ProjectMeetingRegister."Created DateTime" := CreateDatetime(Today, Time);
                            ProjectMeetingRegister."Venue/Location" := PCOPlannedMeeting."Venue/Location";
                            ProjectMeetingRegister.Insert(true);

                            //Populate the agenda
                            ProjectMeetingAgendaTemp.Reset;
                            ProjectMeetingAgendaTemp.SetRange("Project Meeting Type", PCOPlannedMeeting."Meeting Type");
                            if ProjectMeetingAgendaTemp.FindSet then
                                repeat
                                    ProjectMeetingAgenda.Init;
                                    ProjectMeetingAgenda."Meeting ID" := ProjectMeetingRegister."Meeting ID";
                                    ProjectMeetingAgenda."Agenda Code" := ProjectMeetingAgendaTemp."Agenda Code";
                                    ProjectMeetingAgenda."Agenda Description" := ProjectMeetingAgendaTemp."Agenda Description";
                                    ProjectMeetingAgenda.Owner := ProjectMeetingAgendaTemp.Owner;
                                    ProjectMeetingAgenda."Estimate Time (Minutes)" := ProjectMeetingAgendaTemp."Estimate Time (Minutes)";
                                    ProjectMeetingAgenda.Insert(true);
                                until ProjectMeetingAgendaTemp.Next = 0;

                            //Insert Agenda Items
                            MeetingAgendaItemTemplate.Reset;
                            MeetingAgendaItemTemplate.SetRange(MeetingAgendaItemTemplate."Project Meeting Type", PCOPlannedMeeting."Meeting Type");
                            if MeetingAgendaItemTemplate.FindSet then
                                repeat
                                    ProjectMeetingSummary.Init;
                                    ProjectMeetingSummary."Meeting ID" := ProjectMeetingRegister."Meeting ID";
                                    ProjectMeetingSummary."Agenda Code" := MeetingAgendaItemTemplate."Agenda Code";
                                    ProjectMeetingSummary."Agenda Item No." := MeetingAgendaItemTemplate."Item Code";
                                    ProjectMeetingSummary."Item Discussed" := MeetingAgendaItemTemplate.Description;
                                    ProjectMeetingSummary.Insert(true);
                                until MeetingAgendaItemTemplate.Next = 0;

                        until PCOPlannedMeeting.Next = 0;
                        PCOPlannedMeeting."Project Meeting ID" := ProjectMeetingRegister."Meeting ID";
                        PCOPlannedMeeting.Modify;
                    end;
                    Job2.Reset;
                    Job2.SetRange("No.", Rec."Project ID");
                    if Job2.Findfirst() then begin
                        Job2.TestField("Global Dimension 1 Code");
                        Emp2.Reset();
                        Emp2.SetRange("Global Dimension 1 Code", Job2."Global Dimension 1 Code");
                        Emp2.SetRange("Regional Manager", true);
                        if Emp2.FindFirst() then
                            CCRecipients.ADD(Emp2."E-Mail");
                    end;
                    //Notify the contractor guided by a setup and the contractor has a valid mail
                    RoadManagementSetup.Get;
                    if RoadManagementSetup."PCO Notification Enabled" = true then begin
                        // SMTPMail.CheckValidEmailAddresses(Rec."Primary E-mail");
                        //  if "Primary E-mail" <> '' then begin

                        Body := '<br><br>' + 'Dear ' + ' ' + Rec."Contractor Name" + '<br><br>' +
                         'You are hereby notified to commence with project No ' + ' ' + Rec."Project ID" + '- ' + Rec."Project Name" + ' starting on  ' + Format(Rec."Project Start Date") + ' to ' + Format(Rec."Project End  Date") + '<br><br>' + 'In accordance with the contract sub-clause' + '<br><br>' + 'Kindly Login to the Contractors Hub and Acknowledge receipt and acceptance of this Order to Commence' + '<br><br> ' + 'Thanks & Regards' + '<br><br>' + '<br><br>' + '<HR>' + 'This is a system generated mail.Do not reply to it.' + '<br><br>';


                        Recipients.Add(Rec."Primary E-mail");
                        TempBlob.CreateOutstream(Outs);
                        recRef.Open(Database::"Project Mobilization Header");
                        fref := RecRef.field(2);
                        fref.setrange(Rec."Document No.");
                        Report.SaveAs(Report::"Orders to Commence Letter", '', ReportFormat::PDF, Outs, RecRef);
                        TempBlob.CreateInstream(DocStream);

                        Mail.Create(Recipients, 'PROJECT COMMENCEMENT ORDER FOR' + ' ' + Rec."Project ID", Body, true, CCRecipients, BCCRecipients);
                        Mail.AddAttachment('Order to Commence.pdf', 'PDF', DocStream);
                        Email.Send(Mail);
                    end;

                    Message('Posted successfully');
                    Rec.Posted := true;
                    Rec.Modify;
                    CurrPage.Close;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print Order to Commence';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    // ;
                    //Report.Run(72061, true, true, Rec);
                    Report.Run(Report::"Orders to Commence Letter", true, true, Rec);
                    Rec.Reset;
                end;
            }
            action("Suggest Project Team")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    FnSuggestProjectTeam();
                end;
            }
            action("PCO Required Document")
            {
                ApplicationArea = Basic;
                Caption = ' Required Document';
                Ellipsis = true;
                Image = Documents;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "PCO Required Document";
                RunPageLink = "Notice No." = field("Document No.");
            }
            action("Suggest Required Documents")
            {
                ApplicationArea = Basic;
                Image = SuggestBin;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    PCORequiredDocument.Reset;
                    PCORequiredDocument.SetRange("Notice No.", Rec."Document No.");
                    if PCORequiredDocument.FindSet then
                        PCORequiredDocument.DeleteAll;

                    ProjectDocumentTemplate.Reset;
                    //ProjectDocumentTemplate.SETRANGE("Template ID","Required Documents Template ID");
                    if ProjectDocumentTemplate.FindSet then begin
                        ProjectDocumentTemplateLine.Reset;
                        //ProjectDocumentTemplateLine.SETRANGE("Template ID","Required Documents Template ID");
                        if ProjectDocumentTemplateLine.FindSet then
                            repeat
                                PCORequiredDocument.Init;
                                PCORequiredDocument."Notice No." := Rec."Document No.";
                                PCORequiredDocument."Document Type" := ProjectDocumentTemplateLine."Document Type";
                                PCORequiredDocument.Description := ProjectDocumentTemplateLine.Description;
                                PCORequiredDocument."Requirement Type" := ProjectDocumentTemplateLine."Requirement Type";
                                PCORequiredDocument."Guidelines/Instructions" := ProjectDocumentTemplateLine."Guidelines/Instructions";
                                PCORequiredDocument.Insert(true);
                            until ProjectDocumentTemplateLine.Next = 0;
                        Message('Documents inserted successfully');
                    end;
                end;
            }
            action("Contract Securities")
            {
                ApplicationArea = Basic;
                Caption = 'Filed Contract Security';
                Image = SocialSecurity;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "Bid_Contract Security Register";
                RunPageLink = "No." = field("Purchase Contract ID"),
                              "Security Type" = filter("Performance/Contract Security" | "Advance Payment Security");
                RunPageMode = View;
            }
            action("Contract Sub Clauses")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Contract Sub Clauses";
                RunPageLink = "Contract No" = field("Purchase Contract ID"),
                              "Document Type" = filter(PCO);
            }
             action("Possession of Site Sub Clauses")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Contract Sub Clauses";
                RunPageLink = "Contract No" = field("Purchase Contract ID"),
                              "Document Type" = filter("Possession of Site");
            }
            action("Print Possession Of Site")
            {
                ApplicationArea = Basic;
                //Enabled = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                Enabled = Rec.Posted;
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(Report::"Possession Of Site", true, true, Rec);
                    // Rec.Reset;
                end;
            }
            action("Issue Posession of Site Letter")
            {
                ApplicationArea = Basic;
                Enabled = Rec.Posted;
                Image = SendToMultiple;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    Mail: Codeunit "Email Message";
                    Email: Codeunit Email;
                    Body: Text;
                    Job2: Record Job;
                    Emp2: Record Employee;
                    Recipients: List of [Text];
                    CCRecipients: List of [Text];
                    BCCRecipients: List of [Text];
                    TempBlob: Codeunit "Temp Blob";
                    DocStream: Instream;
                    Outs: Outstream;
                    RecRef: RecordRef;
                    fref: FieldRef;
                    RequesterName: Text;
                    CompanyDetails: Text;
                    SenderMessage: Text;
                    emailhdr: Text;
                    ProcNote: Text;
                    LoginDetails: Text;
                    CustEmail: Text;
                    CompanyInformation: Record "Company Information";
                    HumanResourcesSetup: Record "Human Resources Setup";
                begin
                    if Rec."Possession of Site Issued" then
                        Error('Possession of Site Already Issued');
                    Rec.TestField("Primary E-mail");
                    Rec.TestField("Possession of Site Date");
                    Rec.TestField("Possession of Site Reference");

                    CompanyInformation.Get;
                    HumanResourcesSetup.Get;
                    RequesterName := Rec."Primary E-mail";

                    //Create Message

                    Recipients.add(Rec."Primary E-mail");
                    CompanyDetails := 'Dear ' + Rec."Contractor Name" + ',';
                    SenderMessage := '<BR>This is to notify you of Issuance of Possession of Site for Project No.' + Rec."Project ID" + '<BR>' + 'effective date' + ' ' + Format(Rec."Possession of Site Date") + '<BR>';
                    LoginDetails := 'Attached is the Possession of Site Letter<BR>';
                    ProcNote := '<BR> If you require any assistance, please contact the Resident Engineer Office';

                    emailhdr := 'POSSESSION OF SITE' + '(' + Rec."Project ID" + ')';

                    Body := CompanyDetails + SenderMessage + LoginDetails;

                    TempBlob.CreateOutstream(Outs);
                    recRef.Open(Database::"Project Mobilization Header");
                    fref := RecRef.field(2);
                    fref.setrange(Rec."Document No.");
                    Report.SaveAs(Report::"Possession Of Site", '', ReportFormat::PDF, Outs, RecRef);
                    TempBlob.CreateInstream(DocStream);
                    Mail.Create(RequesterName, emailhdr, Body, TRUE);
                    Mail.AddAttachment('Possession of Site.pdf', 'PDF', DocStream);
                    if Email.Send(Mail) then begin
                        // Rec.SendingTime := Time;
                        Message('Contractor' + ' ' + Rec."Contractor Name" + ' ' + 'Notified Successfully');
                        Rec."Possession of Site Issued" := true;
                        Rec.modify();
                    end;

                end;
            }

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
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
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
                    PromotedCategory = Category9;
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
                      PromotedCategory = Category9;

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
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        // acknowledgementtabvisible := false;
        // if Posted in [Posted::"1"] then begin
        //     acknowledgementtabvisible := true;
        // end;
    end;
    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Order-To-Commence";
    end;

    var
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
        //EmailNotifications: Codeunit "Email Notifications";
        CustomApprovalEntry: Record "Custom Approval Entry";
        TXT0001: label 'An approval request has been sent and approvers notified successfully.';
        TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';
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

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;
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
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", Rec."Document No.");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
            if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                if UserSetup."E-Mail" <> '' then begin
                    //EmailNotifications.FnSendEmail(CompanyInformation."E-Mail", COMPANYNAME, UserSetup."E-Mail", 'REJECTION APROVALS:', 'This approval has been rejected.' + ' ' + ApprovalEntry."Document No.");
                end;
            end;
        end;
    end;

    local procedure FnNotifyDelegationEmailCustom()
    begin
        CompanyInformation.Get;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", Rec."Document No.");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
            if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                if UserSetup."E-Mail" <> '' then begin
                    //EmailNotifications.FnSendEmail(CompanyInformation."E-Mail", COMPANYNAME, UserSetup."E-Mail", 'DELEGATION APROVALS:', 'This approval has been delegated.' + ' ' + ApprovalEntry."Document No.");
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
        ProjectStaffAppointmentLine.Reset;
        ProjectStaffAppointmentLine.SetRange(ProjectStaffAppointmentLine."Document No.", Rec."Staff Appointment Voucher No.");
        if ProjectStaffAppointmentLine.FindSet then
            repeat
                PCOInternalProjectTeam.Init;
                PCOInternalProjectTeam."Commencement Order No." := Rec."Document No.";
                PCOInternalProjectTeam."Resource No." := ProjectStaffAppointmentLine."Resource No.";
                PCOInternalProjectTeam.Name := ProjectStaffAppointmentLine.Name;
                PCOInternalProjectTeam.Email := ProjectStaffAppointmentLine.Email;
                PCOInternalProjectTeam.Designation := ProjectStaffAppointmentLine.Designation;
                PCOInternalProjectTeam."Role Code" := ProjectStaffAppointmentLine."Role Code";
                PCOInternalProjectTeam.Insert(true);
            until ProjectStaffAppointmentLine.Next = 0;
    end;
}

#pragma implicitwith restore

