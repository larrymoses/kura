#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69320 "Training Feedback Suggestions"
{
    PageType = ListPart;
    SourceTable = "Training Feedback Suggestions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Category";"Training Category")
                {
                    ApplicationArea = Basic;
                }
                field("Category Description";"Category Description")
                {
                    ApplicationArea = Basic;
                }
                field(Rating;Rating)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
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

