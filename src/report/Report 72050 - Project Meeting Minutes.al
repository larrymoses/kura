/// <summary>
/// Report Project Meeting Minutes (ID 72050).
/// </summary>
report 72050 "Project Meeting Minutes"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Project Meeting Minutes.rdl';

    dataset
    {
        dataitem("Project Meeting Register"; "Project Meeting Register")
        {
            column(CompanyPicture; CompanyInformation.Picture)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(CIName; CompanyInformation.Name)
            {
            }
            column(CIAddress; CompanyInformation.Address)
            {
            }
            column(CIAddress2; CompanyInformation."Address 2")
            {
            }
            column(CICity; CompanyInformation.City)
            {
            }
            column(CompanyCountry; CompanyInformation."Country/Region Name")
            {

            }
            column(CompanyPhone; CompanyInformation."Phone No." + '/' + CompanyInformation."Phone No. 2" + '/' + CompanyInformation."Tel Phone")
            {

            }
            column(CompanyWeb; CompanyInformation."E-Mail" + '  ' + CompanyInformation."Home Page")
            {

            }

            column(CIPicture; CompanyInformation.Picture)
            {
            }
            column(MeetingTypeName; MeetingTypeName)
            {
            }
            column(MeetingID_ProjectMeetingRegister; "Project Meeting Register"."Meeting ID")
            {
            }
            column(MeetingType_ProjectMeetingRegister; "Project Meeting Register"."Meeting Type")
            {
            }
            column(ProjectID_ProjectMeetingRegister; "Project Meeting Register"."Project ID")
            {
            }
            column(Description_ProjectMeetingRegister; "Project Meeting Register".Description)
            {
            }
            column(AllDayEvent_ProjectMeetingRegister; "Project Meeting Register"."All Day Event")
            {
            }
            column(StartDate_ProjectMeetingRegister; FORMAT("Project Meeting Register"."Start Date"))
            {
            }
            column(StartTime_ProjectMeetingRegister; FORMAT("Project Meeting Register"."Start Time"))
            {
            }
            column(Duration_ProjectMeetingRegister; "Project Meeting Register".Duration)
            {
            }
            column(EndDate_ProjectMeetingRegister; FORMAT("Project Meeting Register"."End Date"))
            {
            }
            column(EndTime_ProjectMeetingRegister; FORMAT("Project Meeting Register"."End Time"))
            {
            }
            column(VenueLocation_ProjectMeetingRegister; "Project Meeting Register"."Venue/Location")
            {
            }
            column(ProjectManager_ProjectMeetingRegister; "Project Meeting Register"."Project Manager")
            {
            }
            column(CreatedBy_ProjectMeetingRegister; "Project Meeting Register"."Created By")
            {
            }
            column(CreatedDateTime_ProjectMeetingRegister; "Project Meeting Register"."Created DateTime")
            {
            }
            column(RegionID_ProjectMeetingRegister; "Project Meeting Register"."Region ID")
            {
            }
            column(NoSeries_ProjectMeetingRegister; "Project Meeting Register"."No Series")
            {
            }
            column(ProjectName_ProjectMeetingRegister; "Project Meeting Register"."Project Name")
            {
            }
            column(MeetingStatus_ProjectMeetingRegister; "Project Meeting Register"."Meeting Status")
            {
            }
            dataitem("Project Meeting Attendance"; "Project Meeting Attendance")
            {
                DataItemLink = "Meeting ID" = FIELD("Meeting ID");
                column(Organization; Organization)
                {

                }
                column(MeetingID_ProjectMeetingAttendance; "Project Meeting Attendance"."Meeting ID")
                {
                }
                column(AttendeeType_ProjectMeetingAttendance; "Project Meeting Attendance"."Attendee Type")
                {
                }
                column(No_ProjectMeetingAttendance; "Project Meeting Attendance"."No.")
                {
                }
                column(RepresentativeName_ProjectMeetingAttendance; "Project Meeting Attendance"."Representative Name")
                {
                }
                column(Designation_ProjectMeetingAttendance; "Project Meeting Attendance".Designation)
                {
                }
                column(RepresentativeEmail_ProjectMeetingAttendance; "Project Meeting Attendance"."Representative Email")
                {
                }
                column(RepresentativeTelNo_ProjectMeetingAttendance; "Project Meeting Attendance"."Representative Tel No")
                {
                }
                column(NotifiedonEmail_ProjectMeetingAttendance; "Project Meeting Attendance"."Notified on Email")
                {
                }
                column(DateTimeNotified_ProjectMeetingAttendance; "Project Meeting Attendance"."DateTime Notified")
                {
                }
                column(ContractorNo_ProjectMeetingAttendance; "Project Meeting Attendance"."Contractor No")
                {
                }
                column(ProjectNo_ProjectMeetingAttendance; "Project Meeting Attendance"."Project No")
                {
                }
            }
            dataitem("Project Meeting Summary"; "Project Meeting Summary")
            {
                DataItemLink = "Meeting ID" = FIELD("Meeting ID");
                column(MeetingID_ProjectMeetingSummary; "Project Meeting Summary"."Meeting ID")
                {
                }
                column(AgendaCode_ProjectMeetingSummary; "Project Meeting Summary"."Agenda Code")
                {
                }
                column(AgendaItemNo_ProjectMeetingSummary; "Project Meeting Summary"."Agenda Item No.")
                {
                }
                column(LineNo_ProjectMeetingSummary; "Project Meeting Summary"."Line No.")
                {
                }
                column(ItemDiscussed_ProjectMeetingSummary; "Project Meeting Summary"."Item Discussed")
                {
                }
                column(SummaryNotes_ProjectMeetingSummary; "Project Meeting Summary"."Summary Notes")
                {
                }
                column(TaskDescription_ProjectMeetingSummary; "Project Meeting Summary"."Task Description")
                {
                }
                column(ResponsibilityCategory_ProjectMeetingSummary; "Project Meeting Summary"."Responsibility Category")
                {
                }
                column(TaskOwnerID_ProjectMeetingSummary; "Project Meeting Summary"."Task Owner ID")
                {
                }
                column(Name_ProjectMeetingSummary; "Project Meeting Summary".Name)
                {
                }
                column(DueDate_ProjectMeetingSummary; "Project Meeting Summary"."Due Date")
                {
                }
                column(ContractorNo_ProjectMeetingSummary; "Project Meeting Summary"."Contractor No")
                {
                }
                column(ProjectNo_ProjectMeetingSummary; "Project Meeting Summary"."Project No")
                {
                }
                column(ContributorNo_ProjectMeetingSummary; "Project Meeting Summary"."Contributor No")
                {
                }
                column(ContributorName_ProjectMeetingSummary; "Project Meeting Summary"."Contributor Name")
                {
                }
            }
            dataitem("Project Meeting Agenda"; "Project Meeting Agenda")
            {
                DataItemLinkReference = "Project Meeting Register";
                DataItemLink = "Meeting ID" = FIELD("Meeting ID");
                column(Agenda_Code; "Agenda Code")
                {

                }
                column(Agenda_Description; "Agenda Description")
                {

                }
            }
            dataitem("Approval Entry";"Approval Entry")
            {
                DataItemLinkReference = "Project Meeting Register";
                DataItemLink = "Document No." = field("Meeting ID");
                column(Approver_ID; "Approver ID")
                {

                }
                column(Last_Modified_By_User_ID;"Last Modified By User ID")
                {
                    
                }
                column(Approver_Name; ApproverName)
                {

                }
                column(Sequence_No_; "Sequence No.")
                {

                }
                column(Approval_Date; "Last Date-Time Modified")
                {

                }
                dataitem("User Setup"; "User Setup")
                {
                    DataItemLink = "User ID" = field("Approver ID");
                    DataItemLinkReference = "Approval Entry";
                    column(Designation;Designation)
                    {

                    }
                    column(User_Signature; "User Signature")
                    {

                    }
                    trigger OnAfterGetRecord()
                    begin
                        CalcFields("User Signature");
                    end;
                }

                trigger OnPreDataItem()
                begin
                    SetRange("Approver ID", "Last Modified By User ID");
                end;

                trigger OnAfterGetRecord()
                begin
                    Users.Reset();
                    Users.SetRange("User Name", "Approver ID");
                    if Users.FindFirst() then
                        ApproverName := Users."Full Name";

                end;
            }

            trigger OnAfterGetRecord()
            begin
                CompanyInformation.Get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Region ID", ResponsibilityCenter, CompanyInformation, CompanyAddr);

                ProjectMeetingType.RESET;
                ProjectMeetingType.SETRANGE(ProjectMeetingType.Code, "Project Meeting Register"."Meeting Type");
                IF ProjectMeetingType.FINDSET THEN
                    MeetingTypeName := UPPERCASE(ProjectMeetingType.Description);
            end;

            trigger OnPostDataItem()
            begin
                ProjectMeetingType.RESET;
                ProjectMeetingType.SETRANGE(ProjectMeetingType.Code, "Project Meeting Register"."Meeting Type");
                IF ProjectMeetingType.FINDSET THEN
                    MeetingTypeName := UPPERCASE(ProjectMeetingType.Description);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin

    end;

    trigger OnPreReport()
    begin

    end;

    var
        CompanyInformation: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        ProjectMeetingType: Record "Project Meeting Type";
        MeetingTypeName: Text[250];
        ApproverName: Text[100];
        Users: Record User;
        UserSetup: Record "User Setup";
        FormatAddress: Codeunit "Format Address";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
}

