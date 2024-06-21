#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95110 "Audit Charter Components"
{
    CardPageID = "Audit Charter Component";
    PageType = List;
    SourceTable = "Audit Charter Component";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Charter ID";"Audit Charter ID")
                {
                    ApplicationArea = Basic;
                }
                field("Component Type";"Component Type")
                {
                    ApplicationArea = Basic;
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

