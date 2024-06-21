/// <summary>
/// Report Conference Fees Report (ID 50034).
/// </summary>
report 50034 "Conference Fees Report"
{
    Caption = 'Conference Course Fees Report';
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SubscriptionConferenceFees.rdl';

    dataset
    {
        dataitem(SubscriptionsConferencesH; "Subscriptions Conferences H")
        {
            RequestFilterFields = "No.";
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(ConferenceDate; "Conference Date")
            {
            }
            column(ConferenceEndDate; "Conference End Date")
            {
            }
            column(ConferenceHost; "Conference Host")
            {
            }
            column(ConferenceVenue; "Conference Venue")
            {
            }
            column(PointsPerMember; "Points Per Member")
            {
            }
            column(TotalCourseFees; "Total Course Fees")
            {
            }
            column(TotalPointsEarned; "Total Points Earned")
            {
            }
            column(MembersAttended; "Members Attended")
            {
            }
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
            column(CompanyMotto; CompanyInformation.Motto)
            {

            }
            dataitem("Subscription Conference Lines"; "Subscription Conference Lines")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");
                column(Document_No_; "Document No.")
                {

                }
                column(Member; Member)
                {

                }
                column(Member_Name; "Member Name")
                {

                }
                column(Member_No_; "Member No.")
                {

                }
                column(Feedback; Feedback)
                {

                }
                column(Course_Fee; "Course Fee")
                {

                }
                column(Points_Earned; "Points Earned")
                {

                }
                column(Professional_Body_Code; "Professional Body Code")
                {

                }
                column(Professional_Body_Name; "Professional Body Name")
                {

                }
                trigger OnAfterGetRecord()
                var
                begin
                    CompanyInformation.get();
                    CompanyInformation.CalcFields(Picture);
                    FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
}
