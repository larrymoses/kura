#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95250 "Audit Project Checklist Lines"
{
    PageType = ListPart;
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
                }
                field("Checklist ID";"Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. Of Audit Test Methods";"No. Of Audit Test Methods")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                action(Findings)
                {
                    ApplicationArea = Basic;
                    Image = AddContacts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Audit Findings";
                    RunPageLink = "Document No."=field("Engagement ID"),
                                  "Checklist ID"=field("Checklist ID");
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

