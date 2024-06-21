#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95010 "Comm Plan Line Stakeholders"
{
    Caption = 'Target Stakeholders';
    CardPageID = "Comm Plan Line Stakeholder";
    PageType = List;
    SourceTable = "Comm Plan Line Stakeholder";

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
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder ID";"Stakeholder ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field("Email Address";"Email Address")
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

