#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75248 "Tender Addendum Amendment"
{
    PageType = ListPart;
    SourceTable = "Tender Addendum Amendment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Amendment Type";"Amendment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Amended Section of Tender Doc";"Amended Section of Tender Doc")
                {
                    ApplicationArea = Basic;
                }
                field("Amendment Description";"Amendment Description")
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

