#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69226 "Training Evaluation Lines"
{
    PageType = ListPart;
    SourceTable = "Training Evaluation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Area";"Evaluation Area")
                {
                    ApplicationArea = Basic;
                }
                field(Rating;Rating)
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

