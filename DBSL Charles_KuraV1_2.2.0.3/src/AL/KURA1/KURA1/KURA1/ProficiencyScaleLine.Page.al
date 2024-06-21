#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80061 "Proficiency Scale Line"
{
    PageType = ListPart;
    SourceTable = "Proficiency Scale Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Proficiency Scale ID";"Proficiency Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Level ID";"Level ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Default Score Value";"Default Score Value")
                {
                    ApplicationArea = Basic;
                }
                field("Behavioral Indicator";"Behavioral Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("General Recommendations";"General Recommendations")
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

