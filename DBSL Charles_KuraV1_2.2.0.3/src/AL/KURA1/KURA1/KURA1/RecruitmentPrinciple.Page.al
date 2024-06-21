#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69622 "Recruitment Principle"
{
    PageType = ListPart;
    SourceTable = "Recruitment Plan Principle";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Recruitment Plan ID";"Recruitment Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Guiding Principle ID";"Guiding Principle ID")
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

