#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95176 "Audit Project"
{
    PageType = Card;
    SourceTable = "Audit Project";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Engagement ID"; "Engagement ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan ID"; "Audit Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan Assignment No."; "Audit Plan Assignment No.")
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
                field("Parent Audit Project ID"; "Parent Audit Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Auditor Type"; "Auditor Type")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditor ID"; "Lead Auditor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditor Email"; "Lead Auditor Email")
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
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Template ID"; "Audit Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Chief Audit Executive ID"; "Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part("Audit Program/Schedule"; "Audit Project Schedule Line")
            {
                SubPageLink = "Engagement ID" = field("Engagement ID");
            }
            group("Auditee Details")
            {
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
                field("Lead Auditee Representative ID"; "Lead Auditee Representative ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead Auditee Email"; "Lead Auditee Email")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID"; "Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Cost (LCY)"; "Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job No"; "Budget Control Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Control Job Task No."; "Budget Control Job Task No.")
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
            action("Copy Audit Engagement")
            {
                ApplicationArea = Basic;
                Image = Copy;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //RiskManagement.FnCopyAuditProject(Rec,AuditProjectSchedule,AuditProjectSection,AuditProjectObjective,AuditProjectProcedure,AuditProjectChecklist,AuditProjectLocation,
                    //AuditProjectTeam,AuditProjRequiredDocument);
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
                    Report.Run(95014, true, true, Rec);
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
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    // DMSManagement.UploadEvalReportsrDocuments("Engagement ID",'Audit Project',RecordId);
                end;
            }
            action("Default Risks")
            {
                ApplicationArea = Basic;
                Image = RefreshDiscount;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Plan Line Risk";
                RunPageLink = "Audit Plan ID" = field("Audit Plan ID");
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
        AuditProjectSchedule: Record "Audit Project Schedule";
        AuditProjectSection: Record "Audit Project Section";
        AuditProjectObjective: Record "Audit Project Objective";
        AuditProjectProcedure: Record "Audit Project Procedure";
        AuditProjectChecklist: Record "Audit Project Checklist";
        AuditProjectLocation: Record "Audit ProjectLocation";
        AuditProjectTeam: Record "Audit Project Team";
        AuditProjRequiredDocument: Record "Audit Proj Required Document";
        DMSManagement: Codeunit "DMS Management";
}

