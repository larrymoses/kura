/// <summary>
/// Page Rejected Job Offers (ID 50030).
/// </summary>
page 50030 "Rejected Job Offers"
{
    ApplicationArea = All;
    Caption = 'Rejected Job Offers';
    PageType = List;
    Editable = false;
    SourceTable = "Job Applications";
    CardPageID = "Job Application";
    SourceTableView = where("Application Status" = filter("Failed System Shortlisting"));
    UsageCategory = Documents;
    
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy Id"; Rec."Vacancy Id")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field(Fullnames; Fullnames)
                {
                    ApplicationArea = basic;
                    Caption = 'Full Names';
                    Editable = false;
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = basic;
                    Visible = false;

                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    Visible = false;
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
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
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
            }
        }
        area(factboxes)
        {
            systempart(Control23; Outlook)
            {
            }
            systempart(Control24; Notes)
            {
            }
            systempart(Control25; MyNotes)
            {
            }
            systempart(Control26; Links)
            {
            }
        }
    }

    actions
    {
    }
    trigger OnAfterGetRecord()
    var

    begin
        Fullnames := rec."First Name" + ' ' + rec."Middle Name" + ' ' + rec."Last Name";
    end;

    var
        Fullnames: text[250];
}
