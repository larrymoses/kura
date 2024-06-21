#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59124 "Vehicle Inspection List"
{
    ApplicationArea = Basic;
    CardPageID = "Vehicle Inspection Card";
    PageType = List;
    SourceTable = "Vehicle Inspection";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Inspection No.";"Inspection No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No.";"Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Make;Make)
                {
                    ApplicationArea = Basic;
                }
                field(Model;Model)
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date";"Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Center";"Inspection Center")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
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

