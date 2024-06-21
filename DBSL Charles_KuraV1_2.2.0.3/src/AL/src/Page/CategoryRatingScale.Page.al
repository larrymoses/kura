#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69184 "Category Rating Scale"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Category Rating Scale";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Category Code";"Category Code")
                {
                    ApplicationArea = Basic;
                }
                field("Category Description";"Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Code";"Rating Code")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Description";"Rating Description")
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

