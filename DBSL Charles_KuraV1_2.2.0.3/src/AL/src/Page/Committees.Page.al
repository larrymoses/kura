#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80158 "Committees"
{
    CardPageID = "SPE Commitee Creation";
    Editable = false;
    PageType = List;
    SourceTable = "SPE Commitee Appointment";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Appointment No";"Appointment No")
                {
                    ApplicationArea = Basic;
                }
                field("Committee ID";"Committee ID")
                {
                    ApplicationArea = Basic;
                }
                field("Committee Name";"Committee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date";"Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("User ID";"User ID")
                {
                    ApplicationArea = Basic;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
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

