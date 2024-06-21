#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80354 "BR Response Question"
{
    PageType = List;
    SourceTable = "BR Response Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Survey Response ID";"Survey Response ID")
                {
                    ApplicationArea = Basic;
                }
                field("Section Code";"Section Code")
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
                field("Rating Type";"Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Response Value";"Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("General Response Statement";"General Response Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Weight %";"Assigned Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction";"Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("BR Response Score Guide")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "BR Response Score Guide";
                RunPageLink = "Survey Response ID"=field("Survey Response ID"),
                              "Section Code"=field("Section Code"),
                              "Question ID"=field("Question ID");
            }
        }
    }
}

