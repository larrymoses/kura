#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72652 "Inspection Snag List"
{
    PageType = List;
    SourceTable = "Inspection Snag List";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No";"Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type";"Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field("Item No";"Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Code";"Bill Item Code")
                {
                    ApplicationArea = Basic;
                }
                field("Plan Line No";"Plan Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Bill No";"Bill No")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Description";"Bill Description")
                {
                    ApplicationArea = Basic;
                }
                field("Item Description";"Item Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Works Start Chainage";"Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage";"Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments";"Additional Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
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

