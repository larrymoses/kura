#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69079 "Employee Bank ListT"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Employee Bank AccountXT";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch No.";"Bank Branch No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name";"Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Branch Name";"Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field(Agent;Agent)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No.Of Employees";"No.Of Employees")
                {
                    ApplicationArea = Basic;
                }
                field("No.Of Employees-Guards";"No.Of Employees-Guards")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No.Of Employees-Admin";"No.Of Employees-Admin")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field(Contact;Contact)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("E-Mail";"E-Mail")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Home Page";"Home Page")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019;Notes)
            {
            }
            systempart(Control1000000020;MyNotes)
            {
            }
            systempart(Control1000000021;Links)
            {
            }
        }
    }

    actions
    {
    }
}

