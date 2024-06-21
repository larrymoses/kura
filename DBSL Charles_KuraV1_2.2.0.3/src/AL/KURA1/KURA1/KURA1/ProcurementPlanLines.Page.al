#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75011 "Procurement Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Procurement Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    visible = false;
                }

                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field("Total Quantity"; Rec."Total Quantity")
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field("Total Budgeted Cost"; Rec."Total Budgeted Cost")
                {
                    ApplicationArea = Basic;
                    ShowMandatory =true;
                }
                field("Total Budgeted Cost LCY"; Rec."Total Budgeted Cost lCY")
                {
                    ApplicationArea = Basic;
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Procurement Task")
            {
                Caption = 'Procurement Task';
                Image = Task;
                action(ProcurementPlanningEntries)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Procurement Planning Entries';
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that they should pay for the job (billable).';

                    trigger OnAction()
                    var
                        ProcurementPlanEntries: Record "Procurement Plan Entry";
                        ProcurementPlanEntry: Page "Procurement Plan Entry";
                    begin

                        Rec.TestField("Procurement Plan ID");
                        Rec.TestField("Planning Category");
                        ProcurementPlanEntries.SetRange("Procurement Plan ID", Rec."Procurement Plan ID");
                        ProcurementPlanEntries.SetRange("Planning Category", Rec."Planning Category");
                        //JobPlanningLines.SetJobNoVisible(FALSE);
                        ProcurementPlanEntry.SetProcuremntLineNoVisible(false);
                        //   ProcurementPlanEntry.SetProcurementNoVisible(false);
                        ProcurementPlanEntry.SetProcurementNo(Rec."Procurement Plan ID");
                        //ProcurementPlanEntry."Solicitation Type""Solicitation Type";

                        ProcurementPlanEntry.SetTableview(ProcurementPlanEntries);
                        ProcurementPlanEntry.Run;
                    end;
                }
                action(PurchaseActivityPlan)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Purchase Activity Plan';
                    Image = LineReserve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that they should pay for the job (billable).';

                    trigger OnAction()
                    var
                        PurchaseActivityPlanEntries: Record "PP Purchase Activity Schedule";
                        PurchaseActivityPlanEntry: Page "PP Purchase Activity Schedule";
                    begin

                        Rec.TestField("Procurement Plan ID");
                        Rec.TestField("Planning Category");
                        PurchaseActivityPlanEntries.SetRange("Procurement Plan ID", Rec."Procurement Plan ID");
                        PurchaseActivityPlanEntries.SetRange("Planning Category", Rec."Planning Category");
                        //JobPlanningLines.SetJobNoVisible(FALSE);
                        PurchaseActivityPlanEntry.SetPurchaseActivityLineNoVisible(false);
                        PurchaseActivityPlanEntry.SetPurchaseActivityNo(Rec."Procurement Plan ID");
                        PurchaseActivityPlanEntry.SetTableview(PurchaseActivityPlanEntries);
                        PurchaseActivityPlanEntry.Run;
                    end;
                }
            }
        }
    }
}

#pragma implicitwith restore

