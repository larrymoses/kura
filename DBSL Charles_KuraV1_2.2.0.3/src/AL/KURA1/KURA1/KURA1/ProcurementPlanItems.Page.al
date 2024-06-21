#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70006 "Procurement Plan Items"
{
    PageType = ListPart;
    SourceTable = "Procurement Plan1";
    SourceTableView = sorting("Plan Item No")
                      order(ascending);

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Plan Item No";"Plan Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type";"Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Item Description";"Item Description")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code";"Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code";"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Division;Division)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost";"Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Advertisement Date";"Advertisement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid/Quotation Opening Date";"Bid/Quotation Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Proposal Evaluation date";"Proposal Evaluation date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date (Planned)";"Contract End Date (Planned)")
                {
                    ApplicationArea = Basic;
                }
                field("TOR/Technical specs due Date";"TOR/Technical specs due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Opening date";"Financial Opening date")
                {
                    ApplicationArea = Basic;
                }
                field("Negotiation date";"Negotiation date")
                {
                    ApplicationArea = Basic;
                }
                field("Notification of award date";"Notification of award date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Date";"Contract Date")
                {
                    ApplicationArea = Basic;
                }
                field("Target Groups";"Target Groups")
                {
                    ApplicationArea = Basic;
                }
                field(Youth;Youth)
                {
                    ApplicationArea = Basic;
                }
                field(Women;Women)
                {
                    ApplicationArea = Basic;
                }
                field(PWD;PWD)
                {
                    ApplicationArea = Basic;
                }
                field("Citizen Contractors";"Citizen Contractors")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Code";"Funding Source Code")
                {
                    ApplicationArea = Basic;
                }
                field("Source of Funds";"Source of Funds")
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Account';
                }
                field("Margin of preference for Local";"Margin of preference for Local")
                {
                    ApplicationArea = Basic;
                }
                field(Category;Category)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method";"Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Items";"Requisition Items")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Budget";"Approved Budget")
                {
                    ApplicationArea = Basic;
                }
                field(Actual;Actual)
                {
                    ApplicationArea = Basic;
                }
                field(Commitment;Commitment)
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 1 Amount";"Quarter 1 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 2 Amount";"Quarter 2 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 3 Amount";"Quarter 3 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 4 Amount";"Quarter 4 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 1 Qty";"Quarter 1 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 2 Qty";"Quarter 2 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 3 Qty";"Quarter 3 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 4 Qty";"Quarter 4 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Job ID";"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No.";"Job Task No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

