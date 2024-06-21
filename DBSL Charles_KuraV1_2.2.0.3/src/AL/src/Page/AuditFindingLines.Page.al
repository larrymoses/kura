#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95301 "Audit Finding Lines"
{
    PageType = ListPart;
    SourceTable = "Audit Finding";

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
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Implications;Implications)
                {
                    ApplicationArea = Basic;
                }
                field("Finding Rating Code";"Finding Rating Code")
                {
                    ApplicationArea = Basic;
                }
                field(Recommendations;Recommendations)
                {
                    ApplicationArea = Basic;
                }
                field("Applicable To All Locations";"Applicable To All Locations")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement  ID";"Engagement  ID")
                {
                    ApplicationArea = Basic;
                }
                field("Checklist ID";"Checklist ID")
                {
                    ApplicationArea = Basic;
                }
                field("Management Response";"Management Response")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Response Submission Deadline";"Response Submission Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Person";"Responsible Person")
                {
                    ApplicationArea = Basic;
                }
                field("Verdict/Opinion";"Verdict/Opinion")
                {
                    ApplicationArea = Basic;
                }
                field("Date Requested";"Date Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Person Name";"Responsible Person Name")
                {
                    ApplicationArea = Basic;
                }
                field("Action Plan";"Action Plan")
                {
                    ApplicationArea = Basic;
                }
                field("Action Plan Deadline";"Action Plan Deadline")
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
            group("&Line")
            {
                Caption = '&Line';
                action("Audit Location Findings")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Finding Locations";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No."=field("Document No."),
                                  "Engagement ID"=field("Engagement  ID"),
                                  "Checklist ID"=field("Checklist ID");
                }
                action("Mgt Comments & Action Plans")
                {
                    ApplicationArea = Basic;
                    Caption = 'Management Comments & Action Plans';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Management Comments";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No."=field("Document No."),
                                  "Engagement ID"=field("Engagement  ID"),
                                  "Checklist ID"=field("Checklist ID");
                }
                action("Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    Image = Receipt;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Finding Recommendations";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No."=field("Document No."),
                                  "Engagement ID"=field("Engagement  ID"),
                                  "Checklist ID"=field("Checklist ID");
                }
                action("Filed Audit Working Papers")
                {
                    ApplicationArea = Basic;
                    Image = Filed;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Filed Audit Working Papers";
                    RunPageLink = "Engagement ID"=field("Engagement  ID"),
                                  "Fieldwork Audit Finding ID"=field("Checklist ID");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Dimension Set Entries";
                }
            }
        }
    }
}

