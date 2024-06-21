#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72116 "Details Of Road Activities"
{
    PageType = List;
    SourceTable = "Details Of Road Activities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Section Code";"Section Code")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name";"Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Link Name";"Road Link Name")
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
                field("Rate(LCY)";"Rate(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Item Amount(LCY)";"Bill Item Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Start Chainage(Km)";"Start Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("End Chainage(Km)";"End Chainage(Km)")
                {
                    ApplicationArea = Basic;
                }
                field(Technology;Technology)
                {
                    ApplicationArea = Basic;
                }
                field("Labour(%)";"Labour(%)")
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

