#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56035 "Complaints Listing"
{
    ApplicationArea = Basic;
    CardPageID = "Complaints Card Page";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Complaints Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Complain ID";"Complain ID")
                {
                    ApplicationArea = Basic;
                }
                field("Complaint Type";"Complaint Type")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Name";"Complainant Name")
                {
                    ApplicationArea = Basic;
                }
                field("Complainant Phone No";"Complainant Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field("Investigating Officer";"Investigating Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Investigating officer  Name";"Investigating officer  Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Action";Action)
                {
                    ApplicationArea = Basic;
                }
                field(Responsiblity;Responsiblity)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Expected Resolution Date";"Expected Resolution Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Resolution Date";"Actual Resolution Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
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
                field("Case file No";"Case file No")
                {
                    ApplicationArea = Basic;
                }
                field("Case description";"Case description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control24;Outlook)
            {
            }
            systempart(Control25;Notes)
            {
            }
            systempart(Control26;Links)
            {
            }
        }
    }

    actions
    {
    }
}

