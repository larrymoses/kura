#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72131 "Progress Per Road Activity"
{
    PageType = ListPart;
    SourceTable = "Progress Per Road Activity";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No";"Header No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Bill No";"Bill No")
                {
                    ApplicationArea = Basic;
                }
                field("Item Code";"Item Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Of Measure";"Unit Of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Bid Rate(LCY)";"Bid Rate(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Amount(LCY)";"Bill Item Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Quantity";"Previous Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Percantage";"Previous Percantage")
                {
                    ApplicationArea = Basic;
                }
                field("This Quantity";"This Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("This Quantity Percentage";"This Quantity Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Done To Date Quantity";"Done To Date Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Done To Date Percentage";"Done To Date Percentage")
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

