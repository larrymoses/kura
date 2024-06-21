#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72728 "Materials On site"
{
    PageType = List;
    SourceTable = "Material On site";

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
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Material Code";"Material Code")
                {
                    ApplicationArea = Basic;
                }
                field("Material Description";"Material Description")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Of Measure";"Unit Of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Rate;Rate)
                {
                    ApplicationArea = Basic;
                }
                  field("Current Quantty";"Current Quantty")
                {
                    ApplicationArea = Basic;
                }
                  field("Previos Quantity";"Previos Quantity")
                {
                    ApplicationArea = Basic;
                }
                  field("Total Amount";"Total Amount")
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

