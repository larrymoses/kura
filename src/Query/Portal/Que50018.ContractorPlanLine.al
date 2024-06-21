query 50018 ContractorPlanLine
{

    elements
    {
        dataitem(ContractorRequestPlanLine; "Contractor Request Plan Line")
        {
            column(LineNo; "Line No.")
            {
            }
            column(JobNo; "Job No.")
            {
            }
            column(JobTaskNo; "Job Task No.")
            {
            }
            column(DocumentNo; "Document No")
            {
            }

            column(No; "No.")
            {
            }
            column(PlanningDate; "Planning Date")
            {
            }
            column(Description; Description)
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(DirectUnitCostLCY; "Direct Unit Cost (LCY)")
            {
            }
            column(UnitCostLCY; "Unit Cost (LCY)")
            {
            }
            column(QtytoInvoice; "Qty. to Invoice")
            {
            }
            column(QtyInvoiced; "Qty. Invoiced")
            {
            }
            column(QtytoOrder; "Qty. to Order")
            {
            }
            column(QtyPosted; "Qty. Posted")
            {
            }
            column(UnitofMeasureCode; "Unit of Measure Code")
            {
            }
            column(Document_Type; "Document Type") { }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
