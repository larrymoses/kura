#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72140 "Legislation Ammendment"
{
    PageType = ListPart;
    SourceTable = "Legislation Amendment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Amendment ID";"Amendment ID")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Gazette Supplement No.";"Gazette Supplement No.")
                {
                    ApplicationArea = Basic;
                }
                field("National Assembly Bill No.";"National Assembly Bill No.")
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

