#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95263 "Audit Execution Checklists"
{
    PageType = List;
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
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
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
                field("Dimension Set ID";"Dimension Set ID")
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

