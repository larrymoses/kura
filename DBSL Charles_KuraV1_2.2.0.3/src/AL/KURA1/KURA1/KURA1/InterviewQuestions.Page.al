#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69813 "Interview Questions"
{
    PageType = ListPart;
    SourceTable = "Candidate Interview Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Category";"Question Category")
                {
                    ApplicationArea = Basic;
                }
                field("Question ID";"Question ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Question Type";"Question Type")
                {
                    ApplicationArea = Basic;
                }
                field(Rating;Rating)
                {
                    ApplicationArea = Basic;
                }
                field(Weight;Weight)
                {
                    ApplicationArea = Basic;
                }
                field("Score Code";"Score Code")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Comments";"Evaluation Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Raw Score";"Maximum Raw Score")
                {
                    ApplicationArea = Basic;
                }
                field("Weighted Score %";"Weighted Score %")
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
