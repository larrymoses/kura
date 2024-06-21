#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95221 "Audit ACN Required Document Li"
{
    PageType = ListPart;
    SourceTable = "Audit ACN Required Document";

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
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                }
                field("Preferred Format";"Preferred Format")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Date Requested";"Date Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Deadline";"Submission Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Lead ID";"Audit Lead ID")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Lead ID";"Auditee Lead ID")
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

