#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59006 "Vehicle Accidents"
{
    PageType = ListPart;
    SourceTable = "Vehicle Accident Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
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
                field(RegNo;RegNo)
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Description";"Vehicle Description")
                {
                    ApplicationArea = Basic;
                }
                field("Accident date";"Accident date")
                {
                    ApplicationArea = Basic;
                }
                field("Accident Details";"Accident Details")
                {
                    ApplicationArea = Basic;
                }
                field("Police Abstract No";"Police Abstract No")
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

