/// <summary>
/// Page PlanningLinesNewPC (ID 50317).
/// </summary>
page 50317 PlanningLinesNewPC
{
    PageType = List;
    SourceTable = "Contractor Request Plan Line";
    SourceTableView = WHERE("Unit of Measure Code"=CONST('P.C SUM'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No.";"Line No.")
                {
                    ApplicationArea=Basic;
                }
                field("Job No.";"Job No.")
                {
                    ApplicationArea=Basic;
                }
                field("Planning Date";"Planning Date")
                {
                    ApplicationArea=Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea=Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea=Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea=Basic;
                }
                field("Direct Unit Cost (LCY)";"Direct Unit Cost (LCY)")
                {
                    ApplicationArea=Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea=Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea=Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea=Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea=Basic;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea=Basic;
                }
                field("Qty. Posted";"Qty. Posted")
                {
                    ApplicationArea=Basic;
                }
                field("Qty. Invoiced";"Qty. Invoiced")
                {
                    ApplicationArea=Basic;
                }
                field("Qty. to Invoice";"Qty. to Invoice")
                {
                    ApplicationArea=Basic;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    ApplicationArea=Basic;
                }
                field("Qty Certified To Date";"Qty Certified To Date")
                {
                    ApplicationArea=Basic;
                }
                field("Qty. to Order";"Qty. to Order")
                {
                    ApplicationArea=Basic;
                }
                field("Road Code";"Road Code")
                {
                    ApplicationArea=Basic;
                }
            }
        }
    }

    actions
    {
    }
}

