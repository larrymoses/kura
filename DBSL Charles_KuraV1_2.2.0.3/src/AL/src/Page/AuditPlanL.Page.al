#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95166 "Audit Plan L"
{
    PageType = List;
    SourceTable = "Audit Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Plan ID";"Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Template ID";"Audit Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Line No.";"Engagement Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    OptionCaption = ' ,New Audit,Work In Progress,Audit Follow-up';
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
                    OptionCaption = ' ,Board,Company-Level,Directorate,Department,Section/Team,Centre,Branch/Centre';
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
                    Editable = true;
                }
                field("Funding Source ID";"Funding Source ID")
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
                field("Budget Cost (LCY)";"Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Internal Audit Charter ID";"Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                }
                field("Chief Audit Executive ID";"Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan Type";"Audit Plan Type")
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

