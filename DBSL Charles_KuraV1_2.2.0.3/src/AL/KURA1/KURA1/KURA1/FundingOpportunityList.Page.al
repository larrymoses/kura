#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65043 "Funding Opportunity List"
{
    ApplicationArea = Basic;
    Caption = 'Funding Opportunity Announcement List';
    CardPageID = "Funding Opportunity Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Funding Opportunity";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Call No.";"Call No.")
                {
                    ApplicationArea = Basic;
                }
                field("Organization ID";"Organization ID")
                {
                    ApplicationArea = Basic;
                }
                field("Issuing Organization";"Issuing Organization")
                {
                    ApplicationArea = Basic;
                }
                field("Call Type";"Call Type")
                {
                    ApplicationArea = Basic;
                }
                field("External Announcement No";"External Announcement No")
                {
                    ApplicationArea = Basic;
                }
                field("Release Date";"Release Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application Due Date";"Application Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Application date";"Application date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date";"Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Home Page";"Home Page")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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

