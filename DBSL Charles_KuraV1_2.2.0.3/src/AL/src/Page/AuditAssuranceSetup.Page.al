#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95107 "Audit & Assurance Setup"
{
    PageType = Card;
    SourceTable = "Audit & Assurance Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Default CAE ID";"Default CAE ID")
                {
                    ApplicationArea = Basic;
                }
                field("Def. Internal Audit Charter ID";"Def. Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Audit & Assurance Statistics")
            {
                field("No. of Audit Plans";"No. of Audit Plans")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Project Quality Plans";"No. of Project Quality Plans")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Engagements";"No. of Audit Engagements")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Project Quality Inspect";"No. of Project Quality Inspect")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Commencem Notices";"No. of Audit Commencem Notices")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Auditee Notice Resps";"No. of Auditee Notice Resps")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Entrace Meetings";"No. of Audit Entrace Meetings")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Pre-Audit Suvy Invitati";"No. of Pre-Audit Suvy Invitati")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Pre-Audit Suvy Response";"No. of Pre-Audit Suvy Response")
                {
                    ApplicationArea = Basic;
                }
            }
            group("No. Series")
            {
                Caption = 'No. Series';
                field("Audit Plan Nos.";"Audit Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Project Nos";"Audit Project Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Supervision Plan Nos.";"Project Supervision Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Commencement Notice Nos.";"Audit Commencement Notice Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Notice Response Nos.";"Auditee Notice Response Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Entrace Meeting Nos.";"Audit Entrace Meeting Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("PreAudit Survey InvitationNos.";"PreAudit Survey InvitationNos.")
                {
                    ApplicationArea = Basic;
                }
                field("PreAudit Survey Response Nos.";"PreAudit Survey Response Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Fieldwork Voucher Nos";"Fieldwork Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Exit Conference Nos";"Audit Exit Conference Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Draft AUidt Report Nos";"Draft AUidt Report Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Final Audit Report Nos";"Final Audit Report Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Implementation Log Nos";"Audit Implementation Log Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Follow-up Audit Voucher  Nos";"Follow-up Audit Voucher  Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control35;"Audit & Assurance Setup Factbo")
            {
                Caption = 'Audit & Assurance Statistics Factbox';
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Audit Work Types")
            {
                ApplicationArea = Basic;
                Image = WorkCenter;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Work Types";
            }
            action("Audit Templates")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Templates";
            }
            action("Compliance Frameworks")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Compliance Frameworks";
            }
            action("Audit Testing Methods")
            {
                ApplicationArea = Basic;
                Image = TestDatabase;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Testing Methods";
            }
            action("Audit Locations")
            {
                ApplicationArea = Basic;
                Image = Bin;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Locations";
            }
            action("Audit Assurance Levels")
            {
                ApplicationArea = Basic;
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Assurance Levels";
            }
            action("Audit Finding Rating Codes")
            {
                ApplicationArea = Basic;
                Image = Ranges;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Finding Rating Codes";
            }
            action("Audit Opinion Types")
            {
                ApplicationArea = Basic;
                Image = OrderPromising;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Opinion Types";
            }
            action("Risk & Audit Officer")
            {
                ApplicationArea = Basic;
                Caption = 'Risk, Compliance & Audit Officers';
                Image = Employee;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Risk & Audit Officers";
            }
        }
    }
}

