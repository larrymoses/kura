#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95306 "Audit Voucher Lines Followup"
{
    PageType = ListPart;
    SourceTable = "Followup Audit Voucher Line";

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
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Auditor Followup Review Status";"Auditor Followup Review Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Followup Review Status';
                }
                field("Auditor Followup Comments";"Auditor Followup Comments")
                {
                    ApplicationArea = Basic;
                    Caption = ' Followup Comments';
                }
                field("Auditee Implementation Status";"Auditee Implementation Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Implementation Status';
                }
                field("Auditee % Complete";"Auditee % Complete")
                {
                    ApplicationArea = Basic;
                    Caption = '% Complete';
                }
                field("Auditee Comments";"Auditee Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                }
                field("Actual Date Done";"Actual Date Done")
                {
                    ApplicationArea = Basic;
                }
                field("Last Posted Impl. Status Repor";"Last Posted Impl. Status Repor")
                {
                    ApplicationArea = Basic;
                }
                field("Final Audit Report ID";"Final Audit Report ID")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement ID";"Engagement ID")
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

