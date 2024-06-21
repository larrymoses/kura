#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95187 "Audit Checklist Test Methods"
{
    CardPageID = "Audit Checklist Test Method";
    PageType = List;
    SourceTable = "Audit Checklist Test Method";

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
                field("Checklist ID";"Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Testing Method";"Audit Testing Method")
                {
                    ApplicationArea = Basic;
                }
                field(Desription;Desription)
                {
                    ApplicationArea = Basic;
                }
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Objective ID";"Audit Objective ID")
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

