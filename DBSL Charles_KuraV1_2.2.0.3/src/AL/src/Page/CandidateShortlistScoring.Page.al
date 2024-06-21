#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69801 "Candidate Shortlist Scoring"
{
    PageType = List;
    SourceTable = "Candidate Shortlist Scoring";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Application No.";"Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Requiement ID.";"Requiement ID.")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Category";"Qualification Category")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code";"Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate's Response";"Candidate's Response")
                {
                    ApplicationArea = Basic;
                }
                field("Panel Response";"Panel Response")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

