#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69719 "Pre-Screening Lines"
{
    PageType = ListPart;
    SourceTable = "Pre-Screen Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("Close Ended Qn Type";"Close Ended Qn Type")
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
            group(Options)
            {
                action("Answer Options")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Template Line Options";
                    RunPageLink = "Template ID"=field("Template ID"),
                                  "Question ID"=field("Question Id");
                }
            }
        }
    }
}

