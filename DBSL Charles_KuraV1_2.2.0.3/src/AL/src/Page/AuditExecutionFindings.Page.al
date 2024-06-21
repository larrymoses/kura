#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95267 "Audit Execution Findings"
{
    PageType = List;
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
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                }
                field("Checklist ID";"Checklist ID")
                {
                    ApplicationArea = Basic;
                }
                field("CheckList Description";"CheckList Description")
                {
                    ApplicationArea = Basic;
                }
                field("Finding ID";"Finding ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Finding Description';
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
                    Caption = 'Risk Implication';
                }
                field("Affects All Audit Locations";"Affects All Audit Locations")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Location Code";"Audit Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Recommendations";"No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Fieldwork Audit Papers";"No. of Fieldwork Audit Papers")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Objective ID";"Audit Objective ID")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Fieldwork Audit Finding ID";"Fieldwork Audit Finding ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Related Audit Papers";"No. of Related Audit Papers")
                {
                    ApplicationArea = Basic;
                }
                field("Management Comment Deadline";"Management Comment Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Mgt Comment Received Date";"Mgt Comment Received Date")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Response Type";"Auditee Response Type")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Management Comments";"No. of Management Comments")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Audit Execution Implications")
            {
                ApplicationArea = Basic;
                Image = ImplementPriceChange;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Audit Execution Implications";
                RunPageLink = "Document Type"=field("Document Type"),
                              "Document No."=field("Document No."),
                              "Engagement ID"=field("Engagement ID"),
                              "Checklist ID"=field("Checklist ID"),
                              "Finding ID"=field("Finding ID");
            }
        }
    }
}

