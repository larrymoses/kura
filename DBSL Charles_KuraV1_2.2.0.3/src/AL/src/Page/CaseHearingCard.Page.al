#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56100 "Case Hearing Card"
{
    PageType = Card;
    SourceTable = "Case Hearing";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case Entry";"Case Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Last Hearing Date";"Last Hearing Date")
                {
                    ApplicationArea = Basic;
                }
                field(Progress;Progress)
                {
                    ApplicationArea = Basic;
                }
                field("Next Hearing Date";"Next Hearing Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8;Outlook)
            {
            }
            systempart(Control9;Notes)
            {
            }
            systempart(Control10;MyNotes)
            {
            }
            systempart(Control11;Links)
            {
            }
        }
    }

    actions
    {
    }
}

