#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95258 "Audit Implementation Log"
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
                field("Primary RC ID"; "Primary RC ID")
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
            }
            part("Open Audit Management Actions"; "Implementation Log Lines")
            {
                Caption = 'Open  Management Actions';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Open Audit Tasks")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*This Action is a processing-only report used by the lead auditee to suggest the audit
                   actions/tasks that are still pending implementation by the auditee (The pending audit
                   actions/tasks are those that the auditee status is either Planned or Ongoing, and they
                   are also yet to be verified by the auditor as closed).
                   2. The Action transfers field values from the Audit Management Action Ledger table to
                   the Audit Implementation Log Line table*/

                    //    RiskManagement.FnSuggestILSReportLines(AuditManagementActionLedger,AuditImplementationLogLine,Rec);
                    Message('Audit Implementation Log Line(s) Inserted successfully');

                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*This Action is used to post the audit implementation status report (AISR) in order to
                    update the implementation details of the posted audit findings.
                    2. This Action can only be executed for fully approved documents (Status::Released and
                    Posted::False).
                    3. This Action transfers field values from the Audit Implementation Log Line to the Audit
                    Management Action Ledger table*/


                    TestField(Status, Status::Released);
                    //TESTFIELD(Posted,FALSE);

                    // RiskManagement.FnPostILSReport(AuditManagementActionLedger,AuditImplementationLogLine,Rec);


                    Posted := true;
                    Modify;

                    Message('Audit Implementation Status Report %1 posted succesfully', "Document No.");

                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Send');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = "CancelApproval Request";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('cancelled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document No.", "Document No.");
                    SetRange("Document Type", "Document Type");
                    if FindSet then
                        Report.Run(95022, true, true, Rec);
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDOc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Released;
                    Modify(true);
                    Message('Document released successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = Reopen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Open;
                    Modify(true);
                    Message('Document reopened successfully');
                end;
            }
            action("Notify Implementation Lead")
            {
                ApplicationArea = Basic;
                Image = SendEmailPDF;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //      RiskManagement.FNnotifyImplementationLead(Rec);
                    Message('Notified Successfully');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Implementation Status Report";
    end;

    var
        RiskManagement: Codeunit "Risk Management";
        AuditManagementActionLedger: Record "Audit Management Action Ledger";
        AuditManagementAction: Record "Audit Management Action";
        AuditImplementationLogLine: Record "Audit Implementation Log Line";
}

