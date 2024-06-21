#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95186 "Audit Project Checklists"
{
    CardPageID = "Audit Project Checklist";
    PageType = List;
    SourceTable = "Audit Project Checklist";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Engagement ID";"Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                }
                field("Procedure Description";"Procedure Description")
                {
                    ApplicationArea = Basic;
                }
                field("Checklist ID";"Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Checklist Description';
                }
                field("No. Of Audit Test Methods";"No. Of Audit Test Methods")
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
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

