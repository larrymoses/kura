#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69669 "HR-Document Template"
{
    PageType = Card;
    SourceTable = "HR Document Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part("Profile Registration"; "Document Template Lines")
            {
                Caption = 'Profile Registration';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Profile Registration"));
            }
            part("Job Application"; "Document Template Lines")
            {
                Caption = 'Job Application';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Job Application"));
            }
            part("Contract Issuance"; "Document Template Lines")
            {
                Caption = 'Contract Issuance';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Contract Issuance"));
            }
            part("Promotions & Transfers"; "Document Template Lines")
            {
                Caption = 'Promotions & Transfers';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Promotion/Transfers"));
            }
            part("Disciplinary Matters"; "Document Template Lines")
            {
                Caption = 'Disciplinary Matters';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter(Disciplinary));
            }
            part("Staff Exit"; "Document Template Lines")
            {
                Caption = 'Staff Exit';
                SubPageLink = "Template ID" = field("Template ID");
                SubPageView = where("HR Process" = filter("Staff Exit"));
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
            }
            systempart(Control9; Notes)
            {
            }
            systempart(Control10; MyNotes)
            {
            }
            systempart(Control11; Links)
            {
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

