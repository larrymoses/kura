#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72619 "Proj. Mobilization Checklist C"
{
    PageType = Card;
    SourceTable = "Project Mobilization Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; "Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract No';
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project No';
                }
                field("<Project Description"; "Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Description';
                }
                field("Default CheckList Template ID"; "Default CheckList Template ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project CheckList Template ID';
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End  Date"; "Project End  Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control16; "Mobilization Checklist SubPage")
            {
                Caption = 'Mobilization Checklist';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
            group("Contract Summary")
            {
                Caption = 'Contract Summary';
                Editable = false;
                field("Contractor No."; "Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address"; "Vendor Address")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Address 2"; "Vendor Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Post Code"; "Vendor Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("Primary E-mail"; "Primary E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; "Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; "Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Invitation For Supply"; "IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; "Tender Name")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Summary")
            {
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer No."; "Project Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer Name"; "Project Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; "Project Manager")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Engineer Representative No."; "Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resident Engineer No';
                }
                field("Engineer Representative Name"; "Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resident Engineer Name';
                }
                field("Implementing Agency ID"; "Implementing Agency ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Code"; "Road Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Road Section No."; "Road Section No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Award Tend Sum Inc Taxes (LCY)"; "Award Tend Sum Inc Taxes (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Section Name"; "Section Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Constituency ID"; "Constituency ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Directorate ID"; "Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; "Department ID")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Site Details")
            {
                field("Project Site Description"; "Project Site Description")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage"; "Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("End  Chainage"; "End  Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Start Point Longitude"; "Start Point Longitude")
                {
                    ApplicationArea = Basic;
                }
                field("Start  Point Latitude"; "Start  Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Latitude"; "End Point Latitude")
                {
                    ApplicationArea = Basic;
                }
                field("End  Point Longitude"; "End  Point Longitude")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control40)
            {
                field("Assigned To:"; "Assigned To:")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Site Takeover Instructions")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Insert;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = PostBatch;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if Posted then
                        Error('Already posted');
                    TestField(Status, Status::Released);
                    ObjJob.Reset;
                    ObjJob.SetRange("No.", "Project ID");
                    if ObjJob.FindSet then begin
                        //    ObjJob.Status := ObjJob.Status:"Completed/Under DLP";
                        ObjJob.Modify;

                    end;
                    //Convert to WEP
                    RoadManagementSetup.Get;
                    ProjectMobilizationHeader.Init;
                    ProjectMobilizationHeader.TransferFields(Rec);
                    ProjectMobilizationHeader."Document Type" := ProjectMobilizationHeader."document type"::"Work Execution Programme";
                    ProjectMobilizationHeader."Document No." := NoSeriesManagement.GetNextNo(RoadManagementSetup."Work Execution Plan  Nos", Today, true);
                    ProjectMobilizationHeader."Commencement Order ID" := "Document No.";
                    ProjectMobilizationHeader.Status := ProjectMobilizationHeader.Status::Open;
                    ProjectMobilizationHeader.Insert(true);

                    //Update Project with WEP
                    ObjJob.Reset;
                    ObjJob.SetRange("No.", "Project ID");
                    if ObjJob.FindSet then begin
                        // ObjJob.Status := ObjJob.Status::"Completed/Under DLP";
                        ObjJob."Work Execution Plan ID" := ProjectMobilizationHeader."Document No.";
                        ObjJob.Modify;
                    end;


                    JobPlanningLine.Reset;
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
                        until JobPlanningLine.Next = 0;




                    //Create Planned Kick off meeting//Update meeting register
                    PCOPlannedMeeting.Reset;
                    PCOPlannedMeeting.SetRange("Notice No.", "Document No.");
                    if PCOPlannedMeeting.FindSet then begin
                        repeat
                            ProjectMeetingRegister.Init;
                            ProjectMeetingRegister."Meeting ID" := NoSeriesManagement.GetNextNo(RoadManagementSetup."Meeting Register Nos", Today, true);
                            ProjectMeetingRegister."Meeting Type" := PCOPlannedMeeting."Meeting Type";
                            ProjectMeetingRegister."Project ID" := "Project ID";
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





                    //Notify the contractor guided by a setup and the contractor has a valid mail
                    RoadManagementSetup.Get;
                    ;
                    SMTPMailSetup.Get;
                    if RoadManagementSetup."PCO Notification Enabled" = true then begin
                        // SMTPMail.CheckValidEmailAddresses("Primary E-mail");
                        if "Primary E-mail" <> '' then begin
                            // //SMTPMail.CreateMessage(COMPANYNAME, SMTPMailSetup."Email Address", "Primary E-mail", 'PROJECT COMMENCEMENT ORDER FOR' + ' ' + "Project ID", '', true);
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('Dear ' + ' ' + "Contractor Name");
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('You are hereby notified to commence with project No ' + ' ' + "Project ID" + '- ' + "Project Name" + ' starting on  ' + Format("Project Start Date") + ' to ' + Format("Project End  Date"));
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('In accordance with the contract sub-clause');
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('Kindly Login to the Contractors Hub and Acknowledge receipt and acceptance of this Order to Commence');
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('Thanks & Regards');
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //          //SMTPMail.AddBodyline(SenderName);
                            // //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.AddBodyline('<HR>');
                            // //SMTPMail.AddBodyline('This is a system generated mail.Do not reply to it.');
                            // //          //SMTPMail.AddBodyline('<br><br>');
                            // //          //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kerra.go.ke');
                            // //          //SMTPMail.AddBodyline('<br><br>');
                            // //SMTPMail.Send;
                        end;
                    end;
                    //Contractor to acknowledge once the PCO has been published
                    //
                    Message('Posted successfully');
                    Posted := true;
                    Modify;
                    CurrPage.Close;
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
                    Reset;
                    SetRange("Document No.", "Document No.");
                    ;
                    Report.Run(72026, true, true, Rec);
                end;
            }
            action("Contract Sub Clauses")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Contract Sub Clauses";
                RunPageLink = "Contract No" = field("Purchase Contract ID"),
                              "Document Type" = filter(PCO);
            }
            action("Print Possession Of Site")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document No.", "Document No.");
                    ;
                    Report.Run(Report::"Possession Of Site", true, true, Rec);
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
                    TestField(Status, Status::Open);
                    RecVariant := Rec;
                    //RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVariant, Rec."Project ID", "Document Type", "Document No.", ApprovalEntry."document type"::PCO, 0, RecordId, FnGetTableNo());
                    Status := Status::"Pending Approval";
                    Modify(true);
                    // EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEntry, "Document No.");
                    Message(TXT0001);
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
                    TestField(Status, Status::"Pending Approval");
                    TestField("Created By", UserId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", "Document No.");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", RecordId);
                    CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                    if CustomApprovalEntry.FindSet then
                        repeat
                            OldStatus := ApprovalEntry.Status;
                            CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                            CustomApprovalEntry.Modify(true);
                        until CustomApprovalEntry.Next = 0;

                    //Notify The User
                    // EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                    Status := Status::Open;
                    Modify(true);

                    Message(TXT0002);
                end;
            }
            action("Project Approvals")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //    ApprovalsMgmt.FnOpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Approve)
            {
                ApplicationArea = Suite;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Approve the requested changes.';

                trigger OnAction()
                var
                    CustomApprovalEntry: Record "Custom Approval Entry";
                //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //  //CurrPage.SETSELECTIONFILTER(CustomApprovalEntry);
                    // ApprovalsMgmt.FnApproveRecordApprovalRequest(RecordId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", "Document No.");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry.Status, CustomApprovalEntry.Status::Approved);
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.", FnGetLargestSequenceNoFromApprovalEntry("Document No."));
                    Message(Format(FnGetLargestSequenceNoFromApprovalEntry("Document No.")));
                    if CustomApprovalEntry.FindFirst then begin
                        //ReleaseApprovalDocument.ReleaseSAVReq(Rec);
                    end;
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
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    currentRecEntryNo: Integer;
                    CustomApprovalEntryChange: Record "Custom Approval Entry History";
                begin
                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //Added
                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //Added
                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", "Document No.");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", RecordId);
                    CustomApprovalEntry.SetRange(CustomApprovalEntry.Status, CustomApprovalEntry.Status::Open);
                    if CustomApprovalEntry.FindSet then begin
                        currentRecEntryNo := CustomApprovalEntry."Sequence No.";
                    end;//Added

                    //  ApprovalsMgmt.FnRejectRecordApprovalRequest(RecordId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", "Document No.");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", RecordId);
                    //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                    if CustomApprovalEntry.FindSet then
                        repeat
                            CustomApprovalEntry.Status := CustomApprovalEntry.Status::Rejected;
                            CustomApprovalEntry.Modify(true);
                        until CustomApprovalEntry.Next = 0;

                    Status := Status::Open;
                    Modify(true);

                    //Added part 2
                    if currentRecEntryNo > 1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", "Document No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", RecordId);
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.", currentRecEntryNo);
                        if CustomApprovalEntry.FindSet then begin
                            repeat
                                UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Created;
                                CustomApprovalEntry.Modify();
                            until CustomApprovalEntry.Next = 0;
                        end;

                    end;

                    if currentRecEntryNo > 1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", "Document No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry."Sequence No.", '<%1', currentRecEntryNo);
                        if CustomApprovalEntry.FindSet then begin
                            repeat

                                if (CustomApprovalEntry."Sequence No." = (currentRecEntryNo - 1)) then begin
                                    CustomApprovalEntry.Status := CustomApprovalEntry.Status::Open;
                                end
                                else
                                    if (CustomApprovalEntry."Sequence No." > currentRecEntryNo) then begin
                                        CustomApprovalEntry.Status := CustomApprovalEntry.Status::Created;
                                    end else begin
                                        CustomApprovalEntry.Status := CustomApprovalEntry.Status::Approved;
                                    end;
                                UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                                CustomApprovalEntry.Modify();

                            until CustomApprovalEntry.Next = 0;
                        end;
                    end;
                    if currentRecEntryNo = 1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", "Document No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", RecordId);
                        //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Rejected;
                                CustomApprovalEntry.Modify(true);
                            until CustomApprovalEntry.Next = 0;

                        Status := Status::Open;
                        Modify(true);
                    end;
                    //Added part 2

                    //EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);


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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    Selected: Integer;
                    USetup: Record "User Setup";
                    Options: Text;
                    "Count": Integer;
                    SelectedUser: Code[50];
                    Region: Text;
                begin
                    //Added
                    Options := 'Default Substitute,';
                    //Get Region
                    USetup.Reset;
                    USetup.SetRange("User ID", UserId);
                    if USetup.Find('-') then begin
                        Region := SelectedUser;
                    end;

                    USetup.Reset;
                    USetup.SetRange("Region Code", Region);
                    if USetup.Find('-') then begin
                        repeat

                            Options := Options + USetup."User ID" + ',';

                        until USetup.Next = 0;
                    end;


                    Selected := Dialog.StrMenu(Options, 1, 'Select User');

                    USetup.Reset;
                    USetup.SetRange("Region Code", Region);
                    if USetup.Find('-') then begin
                        repeat
                            Count := Count + 1;
                            if Selected = Count + 1 then begin
                                SelectedUser := USetup."User ID";
                            end;
                        until USetup.Next = 0;
                    end;

                    USetup.Reset;
                    USetup.SetRange("User ID", UserId);
                    if USetup.Find('-') then begin
                        USetup."Substitute Selected" := true;
                        USetup."Selected Substitute" := SelectedUser;
                        USetup.Modify();
                    end;
                    //Added

                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //   ApprovalsMgmt.FnDelegateRecordApprovalRequest(RecordId);
                    //  EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        acknowledgementtabvisible := false;
        if Posted = true then begin
            acknowledgementtabvisible := true;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Mobilization Checklist";
    end;

    var
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
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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

    local procedure FnSuggestProjectTeam()
    begin
        ProjectStaffAppointmentLine.Reset;
        ProjectStaffAppointmentLine.SetRange(ProjectStaffAppointmentLine."Document No.", "Staff Appointment Voucher No.");
        if ProjectStaffAppointmentLine.FindSet then
            repeat
                PCOInternalProjectTeam.Init;
                PCOInternalProjectTeam."Commencement Order No." := "Document No.";
                PCOInternalProjectTeam."Resource No." := ProjectStaffAppointmentLine."Resource No.";
                PCOInternalProjectTeam.Name := ProjectStaffAppointmentLine.Name;
                PCOInternalProjectTeam.Email := ProjectStaffAppointmentLine.Email;
                PCOInternalProjectTeam.Designation := ProjectStaffAppointmentLine.Designation;
                PCOInternalProjectTeam."Role Code" := ProjectStaffAppointmentLine."Role Code";
                PCOInternalProjectTeam.Insert(true);
            until ProjectStaffAppointmentLine.Next = 0;
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
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", "Document No.");
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
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", "Document No.");
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
        ProjectStaffAppointmentLine.SetRange(ProjectStaffAppointmentLine."Document No.", "Staff Appointment Voucher No.");
        if ProjectStaffAppointmentLine.FindSet then
            repeat
                PCOInternalProjectTeam.Init;
                PCOInternalProjectTeam."Commencement Order No." := "Document No.";
                PCOInternalProjectTeam."Resource No." := ProjectStaffAppointmentLine."Resource No.";
                PCOInternalProjectTeam.Name := ProjectStaffAppointmentLine.Name;
                PCOInternalProjectTeam.Email := ProjectStaffAppointmentLine.Email;
                PCOInternalProjectTeam.Designation := ProjectStaffAppointmentLine.Designation;
                PCOInternalProjectTeam."Role Code" := ProjectStaffAppointmentLine."Role Code";
                PCOInternalProjectTeam.Insert(true);
            until ProjectStaffAppointmentLine.Next = 0;
    end;
}

