#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95085 "Impact Risk Rating Scale Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Rating Scale Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Rating Scale Type";"Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Rating Scale ID";"Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Rating Score";"Rating Score")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Criteria";"No. of Criteria")
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
            group(Line)
            {
                Caption = '&Line';
                action("Impact Criteria")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Risk Rating Criteria";
                    RunPageLink = "Risk Rating Scale Type"=filter("Impact Rating"),
                                  "Rating Scale ID"=field("Rating Scale ID"),
                                  Code=field(Code);
                }
            }
        }
    }
}
