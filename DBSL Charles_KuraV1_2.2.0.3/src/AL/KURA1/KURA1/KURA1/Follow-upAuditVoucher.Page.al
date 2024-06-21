#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95260 "Follow-up Audit Voucher"
{
    PageType = Card;
    SourceTable = "Audit Followup Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reporting As At"; "Reporting As At")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                // field("Audit Lead ID";"Audit Lead ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Auditee Type";"Auditee Type")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Project ID";"Project ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Primary Auditee ID";"Primary Auditee ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Auditee Name";"Auditee Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Auditee Lead ID";"Auditee Lead ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Global Dimension 1 Code";"Global Dimension 1 Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Global Dimension 2 Code";"Global Dimension 2 Code")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Dimension Set ID";"Dimension Set ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Control24;Status)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Control25;Posted)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Control26;"Created By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Control27;"Created DateTime")
                // {
                //     ApplicationArea = Basic;
                // }
            }
            part(Checklist; "Audit Project Checklist Lines")
            {
                //SubPageLink = "Engagement ID"=field("Reporting As At");
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Followup Audit Voucher";
    end;
}

