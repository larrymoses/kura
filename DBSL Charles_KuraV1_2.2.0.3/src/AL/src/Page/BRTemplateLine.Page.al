#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80335 "BR Template Line"
{
    PageType = ListPart;
    SourceTable = "BR Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Section ID";"Section ID")
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
            action("Template Score Guide")
            {
                ApplicationArea = Basic;
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Template Score GuideSPM";
                RunPageLink = "Template ID"=field("Template ID"),
                              "Section ID"=field("Section ID"),
                              "Question ID"=field("Question ID");
            }
        }
    }
}

