#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72249 "Project Meeting Types"
{
    ApplicationArea = Basic;
    CardPageID = "Project Meeting Type";
    PageType = List;
    SourceTable = "Project Meeting Type";
    UsageCategory = Administration;

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
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Project Stage";"Project Stage")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Notes";"Additional Notes")
                {
                    ApplicationArea = Basic;
                }
                field("No. Planned";"No. Planned")
                {
                    ApplicationArea = Basic;
                }
                field("No. Held";"No. Held")
                {
                    ApplicationArea = Basic;
                }
                field("No. Cancelled";"No. Cancelled")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

