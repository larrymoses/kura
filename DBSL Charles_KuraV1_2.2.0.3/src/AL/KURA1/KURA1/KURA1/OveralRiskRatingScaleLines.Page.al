#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95087 "Overal Risk Rating Scale Lines"
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
                field("Min Overall Rating";"Min Overall Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Max Overall Rating";"Max Overall Rating")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Heat Zone";"Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Risk Response Actions";"No. of Risk Response Actions")
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
                action("Overall Response Actions")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Overal Risk Response Actions";
                    RunPageLink = "Risk Rating Scale Type"=field("Risk Rating Scale Type"),
                                  "Rating Scale ID"=field("Rating Scale ID"),
                                  Code=field(Code);
                }
            }
        }
    }
}

