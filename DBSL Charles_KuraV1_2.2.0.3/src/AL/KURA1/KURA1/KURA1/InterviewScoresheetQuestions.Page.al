#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69806 "Interview Scoresheet Questions"
{
    PageType = ListPart;
    SourceTable = "Hr Screening Template Line";

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
                field("Question Id";"Question Id")
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
                field("Minimum Points Accepted";"Minimum Points Accepted")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Points Accepted";"Maximum Points Accepted")
                {
                    ApplicationArea = Basic;
                }
                field("Default Rating Scale";"Default Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field(Weight;Weight)
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
            group(Guide)
            {
                action("Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = AddWatch;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Template Score Guide";
                    RunPageLink = "Template Type"=field("Template Type"),
                                  "Template ID"=field("Template ID"),
                                  "Question Category"=field("Question Category"),
                                  "Question ID"=field("Question Id");
                }
                action("Comments/Instructions")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Template Line Comment";
                    RunPageLink = "Question ID"=field("Question Id"),
                                  "Template Type"=field("Template Type"),
                                  "Template ID"=field("Template ID"),
                                  "Question Category"=field("Question Category");
                }
            }
        }
    }
}

