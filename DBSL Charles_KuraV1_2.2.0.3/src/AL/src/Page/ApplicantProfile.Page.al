#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69329 "Applicant Profile"
{
    PageType = Card;
    SourceTable = "Applicant Profile";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Applicant Type";"Applicant Type")
                {
                    ApplicationArea = Basic;
                }
                field("Staff No.";"Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("National ID";"National ID")
                {
                    ApplicationArea = Basic;
                }
                field("First Name";"First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name";"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name";"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Birth";"Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field("N.H.I.F No";"N.H.I.F No")
                {
                    ApplicationArea = Basic;
                }
                field("Social Security No.";"Social Security No.")
                {
                    ApplicationArea = Basic;
                }
                field("County of Birth";"County of Birth")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N No";"P.I.N No")
                {
                    ApplicationArea = Basic;
                }
                field(Religion;Religion)
                {
                    ApplicationArea = Basic;
                }
                field(Disabled;Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("Disability Certificate No";"Disability Certificate No")
                {
                    ApplicationArea = Basic;
                }
                field("Disability Summary";"Disability Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Residence County";"Residence County")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Communication Details")
            {
                field("E-Mail";"E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No.";"Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2";"Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
            }
            systempart(Control34;Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Applicant")
            {
                Caption = '&Applicant';
                Image = Customer;
                action("Academic History")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Academic History";
                    RunPageLink = "Applicant ID"=field("No.");
                }
                action("Professional Profile")
                {
                    ApplicationArea = Basic;
                    Image = CoupledOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Professional Profile";
                    RunPageLink = "Applicant ID"=field("No.");
                }
                action("Applicant Achievements")
                {
                    ApplicationArea = Basic;
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Applicant Accomplishment";
                    RunPageLink = "Applicant ID"=field("No.");
                }
                action("Applicant Hobbies")
                {
                    ApplicationArea = Basic;
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Applicant Hobbies";
                    RunPageLink = "Applicant ID"=field("No.");
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                group("Issued Documents")
                {
                    Caption = 'Issued Documents';
                    Image = Documents;
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
            }
        }
        area(creation)
        {
        }
    }
}

