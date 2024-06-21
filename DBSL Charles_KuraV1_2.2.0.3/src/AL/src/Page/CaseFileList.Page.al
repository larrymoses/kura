#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56037 "Case File List"
{
    ApplicationArea = Basic;
    CardPageID = "Case File Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Case File";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case ID";"Case ID")
                {
                    ApplicationArea = Basic;
                }
                field("Court Case no";"Court Case no")
                {
                    ApplicationArea = Basic;
                }
                field("Case Title";"Case Title")
                {
                    ApplicationArea = Basic;
                }
                field("Case Brief";"Case Brief")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Name";"Accused Name")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Address";"Accused Address")
                {
                    ApplicationArea = Basic;
                }
                field("Accused Phone No";"Accused Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Name";"Complainant Name")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Address";"Complainant Address")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Phone No";"Complainant Phone No")
                {
                    ApplicationArea = Basic;
                }
                field("Court Station";"Court Station")
                {
                    ApplicationArea = Basic;
                }
                field("Main Investigator No";"Main Investigator No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Case Types";"Case Types")
                {
                    ApplicationArea = Basic;
                }
                field("Court Rank";"Court Rank")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit No";"Exhibit No")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No";"Serial No")
                {
                    ApplicationArea = Basic;
                }
                field("Case No";"Case No")
                {
                    ApplicationArea = Basic;
                }
                field("Date Removed";"Date Removed")
                {
                    ApplicationArea = Basic;
                }
                field("Date brought back";"Date brought back")
                {
                    ApplicationArea = Basic;
                }
                field("Final Disposal Date";"Final Disposal Date")
                {
                    ApplicationArea = Basic;
                }
                field("Exhibit Details";"Exhibit Details")
                {
                    ApplicationArea = Basic;
                }
                field("Current Case File Location";"Current Case File Location")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

