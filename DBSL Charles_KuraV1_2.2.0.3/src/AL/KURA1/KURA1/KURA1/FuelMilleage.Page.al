#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59128 "Fuel Milleage"
{
    PageType = ListPart;
    SourceTable = "Fuel Milleage Req";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Month;Month)
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Drawn";"Fuel Drawn")
                {
                    ApplicationArea = Basic;
                }
                field("Mileage (KM)";"Mileage (KM)")
                {
                    ApplicationArea = Basic;
                }
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
            }
        }
    }

    actions
    {
    }
}

