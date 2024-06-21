#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59029 "Fuel Card Lines"
{
    PageType = ListPart;
    SourceTable = "Vehicle Fuel Card Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reciept No";"Reciept No")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Other Expenses";"Other Expenses")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Fueling";"Date of Fueling")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle RegNo";"Vehicle RegNo")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Vehicles List";
                }
                field("vehicle Make";"vehicle Make")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Driver;Driver)
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Drivers List";
                }
                field("Driver Names";"Driver Names")
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

