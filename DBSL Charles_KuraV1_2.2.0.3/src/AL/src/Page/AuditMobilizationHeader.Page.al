#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95199 "Audit Mobilization Header"
{
    Caption = 'Auditee Notice Response';
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
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Commencement Notice No."; "Audit Commencement Notice No.")
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
            part(Control7; "Audit Project Teams")
            {
                Caption = 'Proposed Auditee Team';
                SubPageLink = "Engagement ID" = field("Engagement ID"),
                              "Audit Team Type" = const("Auditee Team");
            }
            part(Control39; "Audit Proj Required Documents")
            {
                Caption = 'Required Documents';
                SubPageLink = "Engagement ID" = field("Engagement ID");
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
                field("Auditee Type"; "Auditee Type")
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
                field("Audit Lead ID"; "Audit Lead ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
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
                Image = AddWatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageView = where("Section Type" = filter(Overview));
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = BinContent;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageView = where("Section Type" = filter(Scope));
            }
            action("Scope Exclusions")
            {
                ApplicationArea = Basic;
                Image = CalculateBalanceAccount;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Sections";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageView = where("Section Type" = filter("Scope Exclusion"));
            }
            action("Audit Objectives")
            {
                ApplicationArea = Basic;
                Image = CalculateInventory;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Objectives";
                RunPageLink = "Engagement ID" = field("Engagement ID");
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Engagement ID");
            }
            action("Audit Checklists")
            {
                ApplicationArea = Basic;
                Image = Zones;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Checklists";
                RunPageLink = "Engagement ID" = field("Engagement ID");
            }
            action("Audit Locations/Sites")
            {
                ApplicationArea = Basic;
                Image = Location;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Locations";
                RunPageLink = "Engagement ID" = field("Engagement ID");
            }
            action("Audit Engagement Team")
            {
                ApplicationArea = Basic;
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Project Teams";
                RunPageLink = "Engagement ID" = field("Engagement ID");
            }
            action("Required Documents")
            {
                ApplicationArea = Basic;
                Image = EditList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Proj Required Documents";
                RunPageLink = "Engagement ID" = field("Engagement ID");
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Submit Response';
                Image = Copy;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Posted := true;
                    Modify(true);
                    Message('Posted');
                    //RiskManagement.FnCopyAuditProject(Rec,AuditProjectSchedule,AuditProjectSection,AuditProjectObjective,AuditProjectProcedure,AuditProjectChecklist,AuditProjectLocation,
                    //AuditProjectTeam,AuditProjRequiredDocument);
                    // RiskManagement.FNnotifyAuditor(Rec);
                    Message('Notified Successfully');
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
                    SetRange("Engagement ID", "Engagement ID");
                    Report.Run(95016, true, true, Rec);
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
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
}

