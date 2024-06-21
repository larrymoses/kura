#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72573 "Inspection Inspection Line"
{
    PageType = Card;
    SourceTable = "Inspection Line";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No";"Inspection No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Inspection Type";"Inspection Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Category ID";"Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
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

