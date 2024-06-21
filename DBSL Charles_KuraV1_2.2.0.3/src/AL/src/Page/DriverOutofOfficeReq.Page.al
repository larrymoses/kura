#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59080 "Driver Out of Office Req"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = "Driver Out of Office Req";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Driver No";"Driver No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Driver Name";"Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Trip No";"Trip No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Trip Descrption";"Trip Descrption")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Trip Starting Date";"Trip Starting Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Trip Duration";"Trip Duration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Trip End Date";"Trip End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vehicle Reg No";"Vehicle Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vehicle Description";"Vehicle Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Out of Office Requisition Send for Approval Successfully');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Out of Office Requisition Approval Request Cancelled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
            }
            action("Print Requisition")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."Document No","Document No");
                    Report.Run(59029,true,true,Rec);
                end;
            }
        }
    }
}

