#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69659 "Committe Appointment Lines"
{
    PageType = ListPart;
    SourceTable = "Commitee Appointed Member";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No.";"Member No.")
                {
                    ApplicationArea = Basic;
                }
                field(Role;Role)
                {
                    ApplicationArea = Basic;
                }
                field("Member Name";"Member Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Member Email";"Member Email")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Telephone No.";"Telephone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Staff No.";"Staff No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ID/Passport No";"ID/Passport No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Tax Registration (PIN) No.";"Tax Registration (PIN) No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Notified on Email";"Notified on Email")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date/Time Notified";"Date/Time Notified")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date";"Expiry Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

