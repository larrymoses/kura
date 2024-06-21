#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75033 "Vendor Business Owner"
{
    PageType = List;
    SourceTable = "Vendor Business Owner";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field("Name 2"; "Name 2")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Nationality ID"; "Nationality ID")
                {
                    ApplicationArea = Basic;
                }
                field("Citizenship Type"; "Citizenship Type")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth"; "Date of Birth")
                {
                    ApplicationArea = Basic;
                }
                field("Entity Ownership %"; "Entity Ownership %")
                {
                    ApplicationArea = Basic;
                }
                field("Share Types"; "Share Types")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Shares"; "No. of Shares")
                {
                    ApplicationArea = Basic;
                }
                field("Total Nominal Value"; "Total Nominal Value")
                {
                    ApplicationArea = Basic;
                }
                field("Nominal Value/Share"; "Nominal Value/Share")
                {
                    ApplicationArea = Basic;
                }
                field("Ownership Effective Date"; "Ownership Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; County)
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("ID/Passport No."; "ID/Passport No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No"; "Registration No")
                {
                    ApplicationArea = Basic;
                }
                field("Entity Type"; "Entity Type")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Type"; "Supplier Type")
                {
                    ApplicationArea = Basic;
                }
                field("KRA PIN"; "KRA PIN")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Company Shareholder Details")
            {
                ApplicationArea = Basic;
                Image = Accounts;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Vendor Company shareholders";
                // RunPageLink = "Record ID"=field("Entry No."),
                //               "Vendor No."=field("Vendor No.");
            }
        }
    }
}

