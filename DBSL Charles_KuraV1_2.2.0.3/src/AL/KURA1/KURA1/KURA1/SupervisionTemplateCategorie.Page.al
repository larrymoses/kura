#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72564 "Supervision Template Categorie"
{
    CardPageID = "Supervision Template Category";
    PageType = List;
    SourceTable = "Supervision Template Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Category ID";"Category ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Requirements";"No. of Requirements")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight";"Total Weight")
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

