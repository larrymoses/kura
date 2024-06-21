#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72209 "PCO Internal Project Team"
{
    PageType = ListPart;
    SourceTable = "PCO Internal Project Team";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Commencement Order No.";"Commencement Order No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Resource No.";"Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Address 2";"Address 2")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Country/Region Code";"Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Role Code";"Role Code")
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
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

