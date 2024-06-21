#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95277 "Audit Execution Meeting Agenda"
{
    PageType = List;
    SourceTable = "Audit Execution Meeting Agenda";

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
                field("Agenda Code";"Agenda Code")
                {
                    ApplicationArea = Basic;
                }
                field("Agenda Description";"Agenda Description")
                {
                    ApplicationArea = Basic;
                }
                field("Estimate Time (Minutes)";"Estimate Time (Minutes)")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Discussed Items";"No. of Discussed Items")
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

