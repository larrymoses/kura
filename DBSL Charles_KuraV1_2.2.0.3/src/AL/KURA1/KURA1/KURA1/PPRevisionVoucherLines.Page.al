#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 99661 "PP Revision Voucher Lines"
{
    PageType = ListPart;
    SourceTable = "Procurement Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Planning Category"; Rec."Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Solicitation Type"; Rec."Solicitation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Source of Funds"; Rec."Primary Source of Funds")
                {
                    ApplicationArea = Basic;
                }
                field("Total Quantity"; Rec."Total Quantity")
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
                    RunObject = Page "PP Revision Voucher Entry";
                    RunPageLink = "Procurement Plan ID" = field("Procurement Plan ID"),
                                  "Planning Category" = field("Planning Category"),
                                  "Document Type" = field("Document Type");
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that they should pay for the job (billable).';

                    trigger OnAction()
                    var
                        ProcurementPlanEntries: Record "Procurement Plan Entry";
                        ProcurementPlanEntry: Page 75012;
                    begin

                        // TESTFIELD("Procurement Plan ID");
                        // TESTFIELD("Planning Category");
                        // ProcurementPlanEntries.SETRANGE("Procurement Plan ID","Procurement Plan ID");
                        // ProcurementPlanEntries.SETRANGE("Planning Category","Planning Category");
                        // ProcurementPlanEntries.SETRANGE("Document Type","Document Type");
                        // //JobPlanningLines.SetJobNoVisible(FALSE);
                        // ProcurementPlanEntry.SetProcuremntLineNoVisible(FALSE);
                        // ProcurementPlanEntry.SetProcurementNoVisible(FALSE);
                        // ProcurementPlanEntry.SetProcurementNo("Procurement Plan ID");
                        // //ProcurementPlanEntry."Solicitation Type""Solicitation Type";
                        //
                        // ProcurementPlanEntry.SETTABLEVIEW(ProcurementPlanEntries);
                        // ProcurementPlanEntry.RUN;
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
                        PurchaseActivityPlanEntry: Page 75013;
                    begin

                        Rec.TestField(Rec."Procurement Plan ID");
                        Rec.TestField(Rec."Planning Category");
                        PurchaseActivityPlanEntries.SetRange("Procurement Plan ID", Rec."Procurement Plan ID");
                        PurchaseActivityPlanEntries.SetRange("Planning Category", Rec."Planning Category");
                        //cc///cc///ccc///ccc/////ccc// PurchaseActivityPlanEntries.SetRange("Document Type",Rec."Document Type");
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
