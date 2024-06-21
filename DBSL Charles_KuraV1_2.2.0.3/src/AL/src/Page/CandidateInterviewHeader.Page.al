#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69770 "Candidate Interview Header"
{
    // PageType = Card;
    // SourceTable = "Candidate Shortlist Scoring";
    // SourceTableView = where("Document No."=filter('2'));

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Document Type";"Document Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Vacancy ID";"Vacancy ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Qualification Category";"Qualification Category")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Description;Description)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Requirement Type";"Requirement Type")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Candidate's Response";"Candidate's Response")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("No. of Openings";"No. of Openings")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("No. of Submitted Applications";"No. of Submitted Applications")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Shortlisting Venue";"Shortlisting Venue")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Directorate;Directorate)
    //             {
    //                 ApplicationArea = Basic;
    //                 Importance = Additional;
    //             }
    //             field(Department;Department)
    //             {
    //                 ApplicationArea = Basic;
    //                 Importance = Additional;
    //             }
    //             field("Seniority Level";"Seniority Level")
    //             {
    //                 ApplicationArea = Basic;
    //                 Importance = Additional;
    //             }
    //             field("Employment Type";"Employment Type")
    //             {
    //                 ApplicationArea = Basic;
    //                 Importance = Additional;
    //             }
    //             field("Application Closing Date";"Application Closing Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Importance = Additional;
    //             }
    //             field("Application Closing Time";"Application Closing Time")
    //             {
    //                 ApplicationArea = Basic;
    //                 Importance = Additional;
    //             }
    //             field("Planned Start Date";"Planned Start Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Planned End Date";"Planned End Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Document Status";"Document Status")
    //             {
    //                 ApplicationArea = Basic;
    //                 Importance = Additional;
    //             }
    //             field("Created By";"Created By")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Created On";"Created On")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //         part(Control41;"Candidate Interview Line")
    //         {
    //             SubPageLink = "Document No."=field("Document Type"),
    //                           "Document Type"=field("Document No."),
    //                           "Vacancy ID"=field("Qualification Category");
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         systempart(Control37;Outlook)
    //         {
    //         }
    //         systempart(Control38;Notes)
    //         {
    //         }
    //         systempart(Control39;MyNotes)
    //         {
    //         }
    //         systempart(Control40;Links)
    //         {
    //         }
    //     }
    // }

    // actions
    // {
    //     area(processing)
    //     {
    //         action("Candidate Selection Committee")
    //         {
    //             ApplicationArea = Basic;
    //             Image = SelectEntries;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             PromotedIsBig = true;
    //             RunObject = Page "Candidate Shortlist Committee";
    //             RunPageLink = "Document No."=field("Document Type"),
    //                           "Document Type"=field("Document No.");
    //         }
    //         action("Failed Education")
    //         {
    //             ApplicationArea = Basic;
    //         }
    //         action("Failed Management Experience")
    //         {
    //             ApplicationArea = Basic;
    //         }
    //         action("Failed Work Experience")
    //         {
    //             ApplicationArea = Basic;
    //         }
    //     }
    // }
}

