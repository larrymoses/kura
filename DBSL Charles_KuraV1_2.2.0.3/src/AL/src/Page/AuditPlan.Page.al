#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95164 "Audit Plan"
{
    PageType = Card;
    SourceTable = "Audit Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Audit Plan ID"; "Audit Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan Type"; "Audit Plan Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; "Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Start Date"; "Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date"; "Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; "Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Plan Name';
                }
                field("Overall Purpose"; "Overall Purpose")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Audit Charter ID"; "Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                }
                field("Chief Audit Executive ID"; "Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Datetime"; "Created Datetime")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Planned Audit Engagements"; "Audit Plan Lines")
            {
                Caption = 'Planned Audit Engagements';
                SubPageLink = "Audit Plan ID" = field("Audit Plan ID");
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
                Image = OpportunitiesList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Plan Sections";
                RunPageView = where("Section Type" = filter(Overview));
            }
            action("Planning Objectives")
            {
                ApplicationArea = Basic;
                Image = Planning;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Plan Sections";
                RunPageView = where("Section Type" = filter(Objective));
            }
            action("Planning Approach")
            {
                ApplicationArea = Basic;
                Image = PlanningWorksheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Plan Sections";
                RunPageView = where("Section Type" = filter(Approach));
            }
            action("Create Audit Projects")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField(Status, Status::Released);

                    //  RiskManagement.FnCreateProjectsFromAuditPlanLines(Rec,AuditPlanLine,AuditTemplate,AuditTemplateDefaultRisk,AuditPlanLineTeam,AuditPlanLineLocation,AuditPlanLineObjective,AuditPlanLineRisk);
                    Message('Project(s) Created successfully');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;

                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

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
                PromotedCategory = Category4;
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
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Canceled');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Released;
                    Modify;
                    Message('Released');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Open;
                    Modify;
                    Message('Reopened');
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Audit Plan ID", "Audit Plan ID");
                    Report.Run(95012, true, true, Rec);
                end;
            }
        }
    }

    var
        RiskManagement: Codeunit "Risk Management";
        AuditPlanLine: Record "Audit Plan Line";
        AuditTemplate: Record "Audit Template";
        AuditTemplateDefaultRisk: Record "Audit Template Default Risk";
        AuditPlanLineLocation: Record "Audit Plan Line Location";
        AuditPlanLineTeam: Record "Audit Plan Line Team";
        AuditPlanLineObjective: Record "Audit PlanLine Objective";
        AuditPlanLineRisk: Record "Audit Plan Line Risk";
}

