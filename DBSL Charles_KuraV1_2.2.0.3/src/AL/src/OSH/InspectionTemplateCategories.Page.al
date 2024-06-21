#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69441 "Inspection Template Categories"
{
    CardPageID = "Inspection Template Category";
    PageType = List;
    SourceTable = 69419;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Category Code"; "Category Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Compliance Requirements"; "No. of Compliance Requirements")
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
