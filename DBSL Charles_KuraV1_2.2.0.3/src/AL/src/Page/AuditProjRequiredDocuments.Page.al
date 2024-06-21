#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95190 "Audit Proj Required Documents"
{
    CardPageID = "Audit Proj Required Document";
    PageType = List;
    SourceTable = "Audit Proj Required Document";

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
                field("Document No.";"Document No.")
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
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Document Name';
                }
                field("Preferred Format";"Preferred Format")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Deadline";"Submission Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("Requirement Type";"Requirement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditor ID";"Lead Auditor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditee Representative ID";"Lead Auditee Representative ID")
                {
                    ApplicationArea = Basic;
                }
                field("Date Requested";"Date Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Date Submitted";"Date Submitted")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Status";"Submission Status")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed Audit Papers";"No. of Filed Audit Papers")
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

