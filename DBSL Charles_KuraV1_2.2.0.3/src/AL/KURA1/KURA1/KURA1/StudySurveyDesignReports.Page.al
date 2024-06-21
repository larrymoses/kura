#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72748 "Study/Survey/Design Reports"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Studies/Surveys&Design Report";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Type";"Project Type")
                {
                    ApplicationArea = Basic;
                }
                field("Report Type";"Report Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

