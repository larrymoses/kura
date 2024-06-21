#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72467 "Project Variation Sections"
{
    CardPageID = "Project Variation Section";
    PageType = List;
    SourceTable = "Project Variation Section";

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
                field(Section;Section)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description;Description)
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
