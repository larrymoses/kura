#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80348 "BR Survey Questions"
{
    PageType = ListPart;
    SourceTable = "BR Survey Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Question;Question)
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type";"Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Option Text Response Type";"Option Text Response Type")
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
        area(processing)
        {
            action("BR Survey Score Guide")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "BR Survey Score Guide";
                RunPageLink = "Survey ID"=field("Survey ID"),
                              "Section Code"=field("Section Code"),
                              "Question ID"=field("Question ID");
            }
        }
    }
}

