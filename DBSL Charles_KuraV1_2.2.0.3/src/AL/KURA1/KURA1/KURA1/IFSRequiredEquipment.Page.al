#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75249 "IFS Required Equipment"
{
    PageType = List;
    SourceTable = "IFS Required Equipment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Equipment Type Code";"Equipment Type Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Required Qty";"Minimum Required Qty")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
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

