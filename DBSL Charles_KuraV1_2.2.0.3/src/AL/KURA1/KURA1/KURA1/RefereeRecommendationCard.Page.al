#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69756 "Referee Recommendation Card"
{
    PageType = Card;
    SourceTable = "Referee Recommendation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Background Checks Invitation"; "Background Checks Invitation")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID"; "Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Application No."; "Application No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Referee Id"; "Referee Id")
                {
                    ApplicationArea = Basic;
                }
                field("Known From"; "Known From")
                {
                    ApplicationArea = Basic;
                }
                field("Known To"; "Known To")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate Last Job Title"; "Candidate Last Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("Staff Exit Reason Code"; "Staff Exit Reason Code")
                {
                    ApplicationArea = Basic;
                }
                field("Recommend For Hire"; "Recommend For Hire")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer"; "Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No."; "Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; "First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; "Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; "Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field("Title/Designation"; "Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field(Institution; Institution)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control30; "Referee Recommendation Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
            }
            systempart(Control27; Notes)
            {
            }
            systempart(Control28; MyNotes)
            {
            }
            systempart(Control29; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Requirements Rating")
            {
                ApplicationArea = Basic;
                Image = Ranges;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Referee Recommendation Rating";
                RunPageLink = "Document No." = field("Document No."),
                              "Vacancy ID" = field("Vacancy ID");
            }
            action("Suggest Requirements")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Suggest requirements for the position';
                begin
                    if Confirm(TXT001) = true then begin
                        // Recruitment.SuggestRefRequirements(Rec);
                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Post recommendation to the background checks header';

                trigger OnAction()
                begin
                    ChecksReference.Reset;
                    ChecksReference.SetRange("Referee Recomm Report ID", "Document No.");
                    ChecksReference.SetRange("Referee Id", "Referee Id");
                    if ChecksReference.FindFirst then begin
                        ChecksReference."Recommended for Hire" := "Recommend For Hire";
                        ChecksReference.Modify(true);
                    end
                end;
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
        ChecksReference: Record "Background Checks Reference";
}

