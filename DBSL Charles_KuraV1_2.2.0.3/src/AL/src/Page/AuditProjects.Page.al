#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95175 "Audit Projects"
{
    CardPageID = "Audit Project";
    PageType = List;
    SourceTable = "Audit Project";

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
                field("Audit Plan ID";"Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Audit Plan Assignment No.";"Audit Plan Assignment No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Audit  Work Type";"Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Engagement Name";"Engagement Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Category";"Engagement Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Parent Audit Project ID";"Parent Audit Project ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Auditor Type";"Auditor Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Lead Auditor ID";"Lead Auditor ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Lead Auditor Email";"Lead Auditor Email")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned End Date";"Planned End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Auditee Type";"Auditee Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Template ID";"Audit Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Auditee ID";"Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Auditee Name";"Auditee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditee Representative ID";"Lead Auditee Representative ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Lead Auditee Email";"Lead Auditee Email")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Funding Source ID";"Funding Source ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Cost (LCY)";"Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Control Job No";"Budget Control Job No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budget Control Job Task No.";"Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Internal Audit Charter ID";"Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Chief Audit Executive ID";"Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Likelihood Rate Scale ID";"Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Impact Rating Scale ID";"Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Overall Risk Rating Scale ID";"Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Appetite Rating Scale ID";"Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Audit Objectives";"No. of Audit Objectives")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. fo Audit Checklists";"No. fo Audit Checklists")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. Of Recomm Audit Test Metho";"No. Of Recomm Audit Test Metho")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Business Risks";"No. of Business Risks")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Controls";"No. of Controls")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. Of Audit Commence Notices";"No. Of Audit Commence Notices")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. Of Auditee Notice Response";"No. Of Auditee Notice Response")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Audit Entrace Meetings";"No. of Audit Entrace Meetings")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. Of PreAudit Suvy Inivitati";"No. Of PreAudit Suvy Inivitati")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. Of PreAudit Suvy Responses";"No. Of PreAudit Suvy Responses")
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

