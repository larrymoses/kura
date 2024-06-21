#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95219 "Audit Commencement Notice"
{
    PageType = Card;
    SourceTable = "Audit Mobilization Header";

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
            part(Control23; "Audit ACN Required Document Li")
            {
                Caption = 'Required Preliminary Documents/Information';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
            group("Audit Engagement Details")
            {
                field("Audit Plan ID"; "Audit Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; "Planned End Date")
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
                field("Auditee Notice Response No."; "Auditee Notice Response No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Audit Entrance Meeting Details")
            {
                field("Entrance Meeting Venue"; "Entrance Meeting Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Entrance Meeting Start Date"; "Entrance Meeting Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Entrance Meeting Start Time"; "Entrance Meeting Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Entrance Meeting End Date"; "Entrance Meeting End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Entrance Meeting End Time"; "Entrance Meeting End Time")
                {
                    ApplicationArea = Basic;
                }
                field(Duration; Duration)
                {
                    ApplicationArea = Basic;
                }
                field("Meeting Medium"; "Meeting Medium")
                {
                    ApplicationArea = Basic;
                }
                field("Entrace Meeting No."; "Entrace Meeting No.")
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
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Document No.");
                RunPageView = where("Section Type" = filter(Overview));
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = Account;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Document No.");
                RunPageView = where("Section Type" = filter(Scope));
            }
            action("Scope Exclusions")
            {
                ApplicationArea = Basic;
                Image = Accounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Document No.");
                RunPageView = where("Section Type" = filter("Scope Exclusion"));
            }
            action("Audit Objectives")
            {
                ApplicationArea = Basic;
                Image = Opportunity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Objectives";
                RunPageLink = "Engagement ID" = field("Document No.");
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Document No.");
            }
            action("Auditt Checklists")
            {
                ApplicationArea = Basic;
                Image = Check;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Checklists";
                RunPageLink = "Engagement ID" = field("Document No.");
            }
            action("Audit Locations/Sites")
            {
                ApplicationArea = Basic;
                Image = Bin;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Locations";
                RunPageLink = "Engagement ID" = field("Document No.");
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
                    // RiskManagement.FnPostACN(Rec, AuditACNRequiredDocument);
                    Posted := true;
                    Modify;
                end;
            }
            action("Audit Engagement Letter")
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
                    Report.Run(95015, true, true, Rec);
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

                trigger OnAction()
                begin
                    Message('Done');
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
                    Message('Done');
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
                    Message('Done');
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
                    Message('Document Released successfully');
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
                    Message('Document Reopened successfully');
                end;
            }
            action("Notify Auditee")
            {
                ApplicationArea = Basic;
                Image = SendEmailPDF;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //  RiskManagement.FNnotifyAuditee(Rec);
                    Message('Notified Successfully');
                end;
            }
            action("Notify Auditor")
            {
                ApplicationArea = Basic;
                Image = SendEmailPDF;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //  RiskManagement.FNnotifyAudiTOR2(Rec);
                    Message('Notified Successfully');
                end;
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
        AuditACNRequiredDocument: Record "Audit ACN Required Document";
}

