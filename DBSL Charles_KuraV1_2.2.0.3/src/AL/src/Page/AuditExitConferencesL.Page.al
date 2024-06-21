#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95245 "Audit Exit Conferences L"
{
    CardPageID = "Audit Exit Conference C";
    PageType = List;
    SourceTable = "Audit Execution Header";
    SourceTableView = where("Document Type"=filter("Audit Exit Conference"));

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
                    Caption = 'Meeting No.';
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Commencement Notice No.";"Audit Commencement Notice No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Engagement ID";"Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Audit Plan ID";"Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit  Work Type";"Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Engagement Name";"Engagement Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Category";"Engagement Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Auditor Type";"Auditor Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Audit Lead ID";"Audit Lead ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Auditee Type";"Auditee Type")
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
                    Editable = false;
                }
                field("Auditee Name";"Auditee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created DateTime";"Created DateTime")
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type":="document type"::"Audit Exit Conference";
    end;
}

