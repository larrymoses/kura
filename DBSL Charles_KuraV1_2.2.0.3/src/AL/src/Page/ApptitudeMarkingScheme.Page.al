#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69749 "Apptitude Marking Scheme"
{
    PageType = List;
    SourceTable = "Apptitude Qn Marking Scheme";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question ID";"Question ID")
                {
                    ApplicationArea = Basic;
                }
                field("Correct Choice ID";"Correct Choice ID")
                {
                    ApplicationArea = Basic;
                }
                field(Explanation;Explanation)
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

