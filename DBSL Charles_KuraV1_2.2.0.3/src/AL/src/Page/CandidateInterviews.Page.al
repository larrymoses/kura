#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69769 "Candidate Interviews"
{
    CardPageID = "Candidate Interview Header";
    Editable = false;
    PageType = List;
    SourceTable = "Candidate Shortlist Scoring";
    SourceTableView = where("Document No." = filter('2'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; "Document No.")
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
                field("Requiement ID."; "Requiement ID.")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Category"; "Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code"; "Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                // field("Document Status";"Document Status")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created By";"Created By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created On";"Created On")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
            }
            systempart(Control38; Notes)
            {
            }
            systempart(Control39; MyNotes)
            {
            }
            systempart(Control40; Links)
            {
            }
        }
    }

    actions
    {
    }
}

