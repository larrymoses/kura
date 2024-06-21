#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69117 "Job Application Card"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Job Application Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group("Personal Details")
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = basic;
                    VISIBLE = FALSE;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                }
                field(Salutation; Rec.Salutation)
                {
                    ApplicationArea = Basic;
                }
                field("ID/Passport"; Rec."ID/Passport")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = Basic;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = Basic;
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    ApplicationArea = Basic;
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Communication Details")
            {
                field("Home Phone No."; Rec."Home Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Work Phone No."; Rec."Work Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Postal Code."; Rec."Postal Code.")
                {
                    ApplicationArea = Basic;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = Basic;
                }
                field("Country Name"; Rec."Country Name")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Other Details")
            {
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("Disability Grade"; Rec."Disability Grade")
                {
                    ApplicationArea = Basic;
                }
                field("Disability Description"; Rec."Disability Description")
                {
                    ApplicationArea = Basic;
                }
                field("Driving Licence"; Rec."Driving Licence")
                {
                    ApplicationArea = Basic;
                }
                field(Convicted; Rec.Convicted)
                {
                    ApplicationArea = Basic;
                }
                field("Highest academic qualification"; Rec."Highest academic qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Current Job Position"; Rec."Current Job Position")
                {
                    ApplicationArea = Basic;
                }
                field("Current Duties and Responsibil"; Rec."Current Duties and Responsibil")
                {
                    ApplicationArea = Basic;
                }
                field(Hobbies; Rec.Hobbies)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Application Details")
            {
                action("Education Background")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Education Background";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                }
                action("Professional Qualifications")
                {
                    ApplicationArea = Basic;
                    Image = CoupledOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Professional Qualifications";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                }
                action("Trainings Attended")
                {
                    ApplicationArea = Basic;
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Trainings Attended";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                }
                action("Professional Bodies")
                {
                    ApplicationArea = Basic;
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Professional Bodies";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                }
                action("Applicant Accomplishments")
                {
                    ApplicationArea = Basic;
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Applicant Accomplishments";
                    RunPageLink = "Application No" = field("Application No");
                    RunPageMode = View;
                }
                action(Referees)
                {
                    ApplicationArea = Basic;
                    Image = Users;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Applicant Referees";
                    RunPageLink = "Job Application No" = field("Application No");
                }
                action("Employment History")
                {
                    ApplicationArea = Basic;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Employment History";
                    RunPageLink = "Application No" = field("Application No");
                }
            }
        }
    }
}

#pragma implicitwith restore

