#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95287 "Audit Template Test Methods"
{
    PageType = List;
    SourceTable = "Audit Template Test Method";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Checklist ID";"Checklist ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Testing Method";"Audit Testing Method")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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
    }
}

