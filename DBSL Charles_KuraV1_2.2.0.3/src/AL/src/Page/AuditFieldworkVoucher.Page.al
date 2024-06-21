#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95234 "Audit Fieldwork Voucher"
{
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
                field("Audit Lead ID"; "Audit Lead ID")
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
                field("Audit Plan ID"; "Audit Plan ID")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Audit Checklists/Criteria"; "Audit Execution Checklist Line")
            {
                Caption = 'Audit Checklists/Criteria';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
            }
            group("Audit Engagement Details")
            {
                Caption = 'Audit Engagement Details';
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
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID"; "Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Audit Checklist")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //   RiskManagement.FnSuggestFWVChecklist(AuditExecutionChecklist,Rec,AuditChecklistTestMethod);
                    Message('Checklist Suggested successfuly');
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
                    TestField(Status, Status::Released);
                    TestField(Posted, false);
                    //RiskManagement.FnPostFWVoucher(AuditProjectChecklist, Rec, AuditExecutionChecklist);
                    Posted := true;
                    Modify;
                    Message('Fieldwork Voucher %1 Posted Successfully', "Document No.");
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
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

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

                trigger OnAction()
                begin
                    Message('Cancelled');
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
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

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
                    Report.Run(95018, true, true, Rec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if ((Posted = true) or (Status = Status::Released)) then
            CurrPage.Editable := false;
    end;

    trigger OnAfterGetRecord()
    begin
        if ((Posted = true) or (Status = Status::Released)) then
            CurrPage.Editable := false;
    end;

    trigger OnOpenPage()
    begin
        if ((Posted = true) or (Status = Status::Released)) then
            CurrPage.Editable := false;
    end;

    var
        RiskManagement: Codeunit "Risk Management";
        AuditExecutionChecklist: Record "Audit Execution Checklist";
        AuditProjectChecklist: Record "Audit Project Checklist";
        AuditChecklistTestMethod: Record "Audit Checklist Test Method";
}

