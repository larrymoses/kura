#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69220 "Training Applications"
{
    ApplicationArea = Basic;
    CardPageID = "Training Requisition";
    PageType = List;
    SourceTable = "Training Requests";
    SourceTableView = where(Status=filter(Open|Pending));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Course Title";"Course Title")
                {
                    ApplicationArea = Basic;
                }
                field("Start DateTime";"Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime";"End DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Cost;Cost)
                {
                    ApplicationArea = Basic;
                }
                field(Location;Location)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Year;Year)
                {
                    ApplicationArea = Basic;
                }
                field(Provider;Provider)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Employee No.";"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Application Date";"Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Department";"Employee Department")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Provider Name";"Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Participants";"No. of Participants")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Cost";"Approved Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Start Date";"Actual Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Actual End Date";"Actual End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Cost";"Estimated Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Imprest Created";"Imprest Created")
                {
                    ApplicationArea = Basic;
                }
                field("Training Plan Cost";"Training Plan Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Budget;Budget)
                {
                    ApplicationArea = Basic;
                }
                field(Actual;Actual)
                {
                    ApplicationArea = Basic;
                }
                field(Commitment;Commitment)
                {
                    ApplicationArea = Basic;
                }
                field("GL Account";"GL Account")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Name";"Budget Name")
                {
                    ApplicationArea = Basic;
                }
                field("Available Funds";"Available Funds")
                {
                    ApplicationArea = Basic;
                }
                field("Local";"Local")
                {
                    ApplicationArea = Basic;
                }
                field("Requires Flight";"Requires Flight")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor No.";"Supervisor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name";"Supervisor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Training Plan No.";"Training Plan No.")
                {
                    ApplicationArea = Basic;
                }
                field("Training Responsibility Code";"Training Responsibility Code")
                {
                    ApplicationArea = Basic;
                }
                field("Training Venue Region Code";"Training Venue Region Code")
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

