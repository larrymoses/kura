#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95311 "Auditee Draft Audit Report C"
{
    Caption = 'Draft Audit Report';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Audit Execution Header";

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
                field("Engagement ID"; "Engagement ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Management Comment Deadline"; "Management Comment Deadline")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Findings"; "No. Of Findings")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Audit Recommendations"; "No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Filed Audit Wor  Papers"; "No. of Filed Audit Wor  Papers")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Management Comments"; "No. of Management Comments")
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
            part("Audit Findings"; "Audit Execution Management Lin")
            {
                Caption = 'Management Comments';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
            }
            group("Audit Engagement Details")
            {
                Caption = 'Audit Engagement Details';
                field("Audit Plan ID"; "Audit Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit  Work Type"; "Audit  Work Type")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Name"; "Engagement Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Category"; "Engagement Category")
                {
                    ApplicationArea = Basic;
                }
                field("Auditor Type"; "Auditor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Lead ID"; "Audit Lead ID")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Type"; "Auditee Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Auditee ID"; "Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Name"; "Auditee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Auditee Lead ID"; "Auditee Lead ID")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Dimension Set ID"; "Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Audit  Findings")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    // RiskManagement.FnSuggestDAReportLines(AuditExecutionFinding,AuditFindingLocation,AuditFindingRecommendation,AuditManagementComment,AuditManagementAction,Rec,AuditExecutionImplication);
                    Message('Audit Findings Suggested successfuly');
                end;
            }
            action("Publish Draft Report")
            {
                ApplicationArea = Basic;
                Caption = 'Submit';
                Image = Pause;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Set Published =True
                    //Published:=TRUE;
                    //MODIFY;

                    //e-Notify the Auditee Lead,notifying them of the attached DAR and the management comment
                    //deadline (Deadline by which they should have responded back to the
                    //lead auditor)

                    //Notify lead auditor that the auditee has given the mgt comments have been submitted kindly log in and action

                    //   RiskManagement.FNnotifyAuditor(AuditExecutionHeader);
                    Message('Management comment submitted successfully');
                end;
            }
            action("Make Final Audit Report")
            {
                ApplicationArea = Basic;
                Image = MakeDiskette;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    TestField(Status, Status::Released);
                    TestField(Published, true);
                    // RiskManagement.FnMakeFinalAuditReportFromDraftAuditReport(Rec,AuditExecutionFinding,AuditFindingLocation,AuditFindingRecommendation,AuditManagementAction,AuditManagementComment);

                    /*This Action is used to convert the DAR to the Final Audit Report, for findings
                    that are Open (These are findings that the auditee agrees with or that they
                    could not provide substantiating evidence to have the auditor close them at
                    the draft audit report) stage. The Action performs field value transfer for the
                    Audit Execution Finding, Audit Finding Location, Audit Finding
                    Recommendation and Audit Management Action tables from the Draft Audit
                    Report Card to the Final Audit Report Card*/
                    //MESSAGE('Final Audit Report %1 created successfully');

                end;
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = AdjustExchangeRates;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageMode = View;
                Visible = false;
            }
            action("Transaction Testing Approach")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Audit Checklist Test Approache";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                RunPageMode = View;
                Visible = false;
            }
            action("Audit Findings Summary")
            {
                ApplicationArea = Basic;
                Image = BankAccountRec;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Audit Execution Findings";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                Visible = false;
            }
            action("Audit Recommendations")
            {
                ApplicationArea = Basic;
                Image = BookingsLogo;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = false;
                RunObject = Page "Audit Finding Recommendations";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                Visible = false;
            }
            action("Filed Audit Working Papers")
            {
                ApplicationArea = Basic;
                Image = Files;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Filed Audit Working Papers";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                Visible = false;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    Message('Sent');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    Message('Cancelled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    Status := Status::Released;
                    Modify;
                    Message('Document released successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    Status := Status::Open;
                    Modify;
                    Message('Document reopened successfully');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Dimension Set Entries";
                Visible = false;

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
                Visible = false;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document No.", "Document No.");
                    Report.Run(95019, true, true, Rec);
                end;
            }
            action(Attachments)
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
        AuditExecutionFinding: Record "Audit Execution Finding";
        AuditFindingLocation: Record "Audit Finding Location";
        AuditFindingRecommendation: Record "Audit Finding Recommendation";
        AuditManagementComment: Record "Audit Management Comment";
        AuditManagementAction: Record "Audit Management Action";
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditMobilizationHeader: Record "Audit Mobilization Header";
        AuditExecutionImplication: Record "Audit Execution Implication";
}

