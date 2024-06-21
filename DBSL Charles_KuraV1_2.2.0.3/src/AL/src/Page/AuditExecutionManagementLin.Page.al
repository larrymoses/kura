#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95314 "Audit Execution Management Lin"
{
    PageType = ListPart;
    SourceTable = "Audit Execution Finding";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Engagement ID";"Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Checklist ID";"Checklist ID")
                {
                    ApplicationArea = Basic;
                }
                field("Finding ID";"Finding ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Compliance Status";"Compliance Status")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Rating Code";"Risk Rating Code")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Heat Zone";"Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                }
                field(Implication;Implication)
                {
                    ApplicationArea = Basic;
                }
                field("Affects All Audit Locations";"Affects All Audit Locations")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Recommendations";"No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                }
                field("Fieldwork Audit Finding ID";"Fieldwork Audit Finding ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Finding Status";"Audit Finding Status")
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
            }
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
                              "Engagement ID"=field("Engagement ID");
                Visible = false;
            }
            action("Audit Management Actions")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Audit Management Actions";
                RunPageLink = "Document Type"=field("Document Type"),
                              "Document No."=field("Document No."),
                              "Engagement ID"=field("Engagement ID"),
                              "Checklist ID"=field("Checklist ID"),
                              "Finding ID"=field("Finding ID");
                Visible = false;
            }
            action("Mgt Comments")
            {
                ApplicationArea = Basic;
                Caption = 'Management Comments';
                Ellipsis = true;
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Audit Management Comments";
                RunPageLink = "Document Type"=field("Document Type"),
                              "Document No."=field("Document No."),
                              "Engagement ID"=field("Engagement ID"),
                              "Checklist ID"=field("Checklist ID"),
                              "Finding ID"=field("Finding ID");
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
                              "Engagement ID"=field("Engagement ID"),
                              "Checklist ID"=field("Checklist ID"),
                              "Finding ID"=field("Finding ID");
                Visible = false;
            }
            action("Filed Audit Working Papers")
            {
                ApplicationArea = Basic;
                Image = Filed;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Filed Audit Working Papers";
                RunPageLink = "Engagement ID"=field("Engagement ID"),
                              "Fieldwork Audit Finding ID"=field("Checklist ID");
                Visible = false;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Dimension Set Entries";
                Visible = false;
            }
        }
    }
}

