#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69672 "Job Application"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Job Applications";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    trigger OnValidate()
                    var

                    begin
                        rec.Validate("Candidate No.");
                    end;
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy Id"; Rec."Vacancy Id")
                {
                    ApplicationArea = Basic;
                }
                field("Position Id"; Rec."Position Id")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = Basic;
                }
                field("Work Location Details"; Rec."Work Location Details")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Personal Information")
            {
                field(Fullnames; Fullnames)
                {
                    Caption = 'Full Names';
                    Editable = false;
                }
                field("Names"; Rec."Names")
                {
                    ApplicationArea = basic;
                    visible = false;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Full Names"; Rec."Full Names")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = Basic;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                }
                field("Ethnic Group"; Rec."Ethnic Group")
                {
                    ApplicationArea = Basic;
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Communication)
            {
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field("County of Birth"; Rec."County of Birth")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Disability Information")
            {
                field("Disability Code"; Rec."Disability Code")
                {
                    ApplicationArea = Basic;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("Disability Description"; Rec."Disability Description")
                {
                    ApplicationArea = Basic;
                }
                field("Disability Certificate No"; Rec."Disability Certificate No")
                {
                    ApplicationArea = Basic;
                }
                field("Disability Certificate Expiry"; Rec."Disability Certificate Expiry")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Applicant Qualification")
            {
                Editable = false;
                field("Professional Summary"; Rec."Professional Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Specialization Area"; Rec."Specialization Area")
                {
                    ApplicationArea = Basic;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Name"; Rec."Qualification Name")
                {
                    ApplicationArea = Basic;
                }
                field("Work Experience (Years)"; Rec."Work Experience (Years)")
                {
                    ApplicationArea = Basic;
                }
                field("Management Experience (Years)"; Rec."Management Experience (Years)")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Current Employment Details")
            {
                Editable = false;
                field("Current Employment Status"; Rec."Current Employment Status")
                {
                    ApplicationArea = Basic;
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    ApplicationArea = Basic;
                }
                field(Station; Rec.Station)
                {
                    ApplicationArea = Basic;
                }
                field("Personal No."; Rec."Personal No.")
                {
                    ApplicationArea = Basic;
                }
                field("Present Substantive Post"; Rec."Present Substantive Post")
                {
                    ApplicationArea = Basic;
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = Basic;
                }
                field("Secondment Organization"; Rec."Secondment Organization")
                {
                    ApplicationArea = Basic;
                }
                field("Secondment Designation"; Rec."Secondment Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Secondment Job Group"; Rec."Secondment Job Group")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Salary"; Rec."Gross Salary")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(69646),
                              "No." = FIELD("Application No.");
            }
            systempart(RecordLinks; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Academic Qualifications")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Academic";
                RunPageLink = "Application No." = field("Application No.");
            }
            action("Professional Qualifications")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Proffessionas";
                RunPageLink = "Application No." = field("Application No.");
            }
            action("Skills & Competencies")
            {
                ApplicationArea = Basic;
                Image = Skills;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Skills";
                RunPageLink = "Application No." = field("Application No.");
            }
            action(Experience)
            {
                ApplicationArea = Basic;
                Image = ExpandDepositLine;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Job Application Experience";
                RunPageLink = "Application No." = field("Application No.");
            }
            action(Hobbies)
            {
                ApplicationArea = Basic;
                Image = Holiday;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Hobbies";
                RunPageLink = "Application No." = field("Application No.");
                Visible = false;
            }
            action(Referees)
            {
                ApplicationArea = Basic;
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page ApplicationReferees;
                RunPageLink = "Application No." = field("Application No.");
            }
            action("Applicant Language")
            {
                ApplicationArea = Basic;
                Image = Language;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Language";
                RunPageLink = "Application No." = field("Application No.");
                Visible = false;
            }
            action("Job Application Checklist")
            {
                ApplicationArea = Basic;
                Caption = 'Job Application Checklist';
                Image = Check;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Job Application Requirements";
                RunPageLink = "Application No." = field("Application No.");
                RunPageMode = View;
                Visible = false;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Application No.", Rec."Application No.");
                    Report.Run(69608, true, false, Rec);
                end;
            }
            action("Application Attached Documents")
            {
                ApplicationArea = Basic;
                Image = Evaluate;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Application Attached Documents";
                RunPageLink = "Application No." = field("Application No.");
                RunPageMode = View;
            }
            action("Application Declaration")
            {
                ApplicationArea = Basic;
                Image = DepreciationBooks;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Application Declarations";
                RunPageLink = "Application No." = field("Application No.");
                Visible = false;
            }
        }
    }
    trigger OnAfterGetRecord()
    var

    begin
        Fullnames := rec."First Name" + ' ' + rec."Middle Name" + ' ' + rec."Last Name";
    end;

    var
        Fullnames: text[250];
}

#pragma implicitwith restore

