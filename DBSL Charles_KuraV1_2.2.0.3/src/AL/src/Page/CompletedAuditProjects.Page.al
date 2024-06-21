#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95252 "Completed Audit Projects"
{
    CardPageID = "Audit Project";
    PageType = List;
    SourceTable = "Audit Project";
    SourceTableView = where(Status=filter(Completed));

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
                }
                field("Audit Plan Assignment No.";"Audit Plan Assignment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit  Work Type";"Audit  Work Type")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Name";"Engagement Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Category";"Engagement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Parent Audit Project ID";"Parent Audit Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Auditor Type";"Auditor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditor ID";"Lead Auditor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditor Email";"Lead Auditor Email")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date";"Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date";"Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Type";"Auditee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Template ID";"Audit Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Auditee ID";"Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Name";"Auditee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditee Representative ID";"Lead Auditee Representative ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditee Email";"Lead Auditee Email")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID";"Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Cost (LCY)";"Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job No";"Budget Control Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job Task No.";"Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Audit Charter ID";"Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                }
                field("Chief Audit Executive ID";"Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Likelihood Rate Scale ID";"Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Rating Scale ID";"Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Risk Rating Scale ID";"Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Appetite Rating Scale ID";"Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Objectives";"No. of Audit Objectives")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Procedure ID";"Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. fo Audit Checklists";"No. fo Audit Checklists")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Recomm Audit Test Metho";"No. Of Recomm Audit Test Metho")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Business Risks";"No. of Business Risks")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Controls";"No. of Controls")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Audit Commence Notices";"No. Of Audit Commence Notices")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Auditee Notice Response";"No. Of Auditee Notice Response")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Entrace Meetings";"No. of Audit Entrace Meetings")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of PreAudit Suvy Inivitati";"No. Of PreAudit Suvy Inivitati")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of PreAudit Suvy Responses";"No. Of PreAudit Suvy Responses")
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

