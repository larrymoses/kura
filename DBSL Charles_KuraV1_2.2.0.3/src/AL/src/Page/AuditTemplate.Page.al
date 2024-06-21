#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95146 "Audit Template"
{
    PageType = Card;
    SourceTable = "Audit Template";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Template ID";"Template ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Audit  WorkType";"Audit  WorkType")
                {
                    ApplicationArea = Basic;
                }
                field("Last Review Date";"Last Review Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part("Default Checlist";"Audit Template Checklist Lines")
            {
                Caption = 'Default Checlist';
                SubPageLink = "Template ID"=field("Template ID");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = AddToHome;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Sections";
                RunPageLink = "Template ID"=field("Template ID");
                RunPageView = where("Section Type"=filter(Scope));
            }
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = AdjustVATExemption;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Sections";
                RunPageLink = "Template ID"=field("Template ID");
                RunPageView = where("Section Type"=filter(Overview));
            }
            action("Scope Exclusions")
            {
                ApplicationArea = Basic;
                Image = AddWatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Sections";
                RunPageLink = "Template ID"=field("Template ID");
                RunPageView = where("Section Type"=filter("Scope Exclusion"));
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Sections";
                RunPageLink = "Template ID"=field("Template ID");
                RunPageView = where("Section Type"=filter(Comment));
            }
            action(Objectives)
            {
                ApplicationArea = Basic;
                Image = "Order";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Objectives";
                RunPageLink = "Template ID"=field("Template ID");
            }
            action("Default Risks")
            {
                ApplicationArea = Basic;
                Image = AdjustItemCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Default Risks";
                RunPageLink = "Template ID"=field("Template ID");
            }
            action("Default Controls")
            {
                ApplicationArea = Basic;
                Image = BreakRulesList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Defaul Controls";
                RunPageLink = "Template ID"=field("Template ID");
                Visible = false;
            }
            action(Procedures)
            {
                ApplicationArea = Basic;
                Image = AddToHome;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Procedures";
                RunPageLink = "Template ID"=field("Template ID");
            }
            action("Procedure Tests")
            {
                ApplicationArea = Basic;
                Image = TestReport;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Template Procedure Tests";
                RunPageLink = "Template ID"=field("Template ID");
            }
            action("Procedure Comments")
            {
                ApplicationArea = Basic;
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Temp Procedure Comments";
                RunPageLink = "Template ID"=field("Template ID");
                Visible = false;
            }
            action("Procedure Controls")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Temp Procedure Controls";
                RunPageLink = "Template ID"=field("Template ID");
            }
        }
    }
}

