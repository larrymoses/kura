#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69780 "Ability Test Question"
{
    PageType = ListPart;
    SourceTable = "Test Response Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Response ID";"Response ID")
                {
                    ApplicationArea = Basic;
                }
                field("Test ID";"Test ID")
                {
                    ApplicationArea = Basic;
                }
                field("Question ID";"Question ID")
                {
                    ApplicationArea = Basic;
                }
                field(Question;Question)
                {
                    ApplicationArea = Basic;
                }
                field("Selected Answer";"Selected Answer")
                {
                    ApplicationArea = Basic;
                }
                field("Pass/Fail";"Pass/Fail")
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

