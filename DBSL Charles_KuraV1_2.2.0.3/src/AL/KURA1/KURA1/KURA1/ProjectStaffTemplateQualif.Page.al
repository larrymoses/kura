#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75107 "Project Staff Template Qualif"
{
    PageType = List;
    SourceTable = "Project Staff Template Qualifi";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Key Staff Template ID";"Key Staff Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Role Code";"Project Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Category";"Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Qualification Req";"Minimum Qualification Req")
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
