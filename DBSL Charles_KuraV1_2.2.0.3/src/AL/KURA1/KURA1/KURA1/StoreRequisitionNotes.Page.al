#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 50092 "Store Requisition Notes"
{
    PageType = List;
    SourceTable = "Store Requisition Notes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selected;Selected)
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Requested";"Qty. Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Approved";"Qty. Approved")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Issued";"Qty. Issued")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Item No";"Item No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Measures";"Unit Measures")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Qty";"Remaining Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Date";"Requisition Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requsted By";"Requsted By")
                {
                    ApplicationArea = Basic;
                }
                field(Dept;Dept)
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
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        Purch.SetRange("No.","Document No");
                        Report.Run(70029,true,true,Purch);
                    end;
                }
            }
        }
    }

    var
        Purch: Record "Purchase Header";
}

