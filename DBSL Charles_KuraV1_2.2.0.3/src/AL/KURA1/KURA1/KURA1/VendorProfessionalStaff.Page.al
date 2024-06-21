#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75037 "Vendor Professional Staff"
{
    PageType = List;
    SourceTable = "Vendor Professional Staff";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; "Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Number"; "Staff Number")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Name"; "Staff Name")
                {
                    ApplicationArea = Basic;
                }
                field(Proffesion; Proffesion)
                {
                    ApplicationArea = Basic;
                }
                field("Current Designation"; "Current Designation")
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
                field(Nationality; Nationality)
                {
                    ApplicationArea = Basic;
                }
                field("Citizenship Type"; "Citizenship Type")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; "Employment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; "Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth"; "Date of Birth")
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
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Joining Date"; "Joining Date")
                {
                    ApplicationArea = Basic;
                }
                field("Years With the Firm"; "Years With the Firm")
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
            action("Vendor Staff Qualification")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Staff Qualification";
                //   RunPageLink = "Staff Id"=field("Entry No.");
            }
            action("Vendor Staff Experience")
            {
                ApplicationArea = Basic;
                Image = Skills;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Staff Experience";
                //RunPageLink = "Staff ID"=field("Entry No.");
            }
            action("Vendor Staff Employment")
            {
                ApplicationArea = Basic;
                Image = EmployeeAgreement;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Vendor Staff Employment";
                // RunPageLink = "Staff ID"=field("Entry No.");
            }
        }
    }
}

