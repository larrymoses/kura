#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69463 "HSE Plan Safety Rule Categorie"
{
    CardPageID = "HSE Plan Safety Rule Category";
    PageType = List;
    SourceTable = 69431;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; "Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Category Code"; "Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Rules & Regulations"; "No. of Rules & Regulations")
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
