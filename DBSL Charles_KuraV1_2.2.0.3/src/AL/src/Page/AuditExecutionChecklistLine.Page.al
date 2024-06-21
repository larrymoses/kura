#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95283 "Audit Execution Checklist Line"
{
    PageType = ListPart;
    SourceTable = "Audit Execution Checklist";

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
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Fieldwork Review Status";"Fieldwork Review Status")
                {
                    ApplicationArea = Basic;
                }
                field("Completion %";"Completion %")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Findings";"No. of Audit Findings")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Recommendations";"No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Filed Audit Work Papers";"No. Of Filed Audit Work Papers")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Objective ID";"Audit Objective ID")
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
                action("Transaction Testing Approach")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Testing Approach';
                    Image = TransferFunds;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Checklist Test Approache";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No."=field("Document No."),
                                  "Engagement ID"=field("Engagement ID"),
                                  "Checklist ID"=field("Checklist ID");
                }
                action("Audit Findings Summary")
                {
                    ApplicationArea = Basic;
                    Image = Find;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Execution Findings";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No."=field("Document No."),
                                  "Engagement ID"=field("Engagement ID"),
                                  "Checklist ID"=field("Checklist ID");
                }
                action("Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    Image = Refresh;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Finding Recommendations";
                    RunPageLink = "Document Type"=field("Document Type"),
                                  "Document No."=field("Document No."),
                                  "Engagement ID"=field("Engagement ID"),
                                  "Checklist ID"=field("Checklist ID");
                }
                action("Filed Audit Working Papers")
                {
                    ApplicationArea = Basic;
                    Image = Workdays;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Filed Audit Working Papers";
                    RunPageLink = "Engagement ID"=field("Engagement ID");
                }
                action(Dimesnions)
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

