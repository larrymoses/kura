#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 51002 "Inspection Approval Requests"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Goods & Services Inspection";
    SourceTableView = sorting("No.","User ID")
                      order(ascending)
                      where(Decision=filter(" "));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vendor Shipment No.";"Vendor Shipment No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Invoice No.";"Vendor Invoice No.")
                {
                    ApplicationArea = Basic;
                }
                field("User ID";"User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Committee Role";"Committee Role")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Decision;Decision)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Date-Time Sent for Approval";"Date-Time Sent for Approval")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Buy-from Vendor No.";"Buy-from Vendor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Buy-from Vendor Name";"Buy-from Vendor Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009;Notes)
            {
            }
            systempart(Control1000000010;MyNotes)
            {
            }
            systempart(Control1000000011;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Record")
            {
                ApplicationArea = Basic;
                Caption = 'Record';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Purchase Order";
                RunPageLink = "No."=field("No.");

                trigger OnAction()
                begin
                    //ShowRecord;
                end;
            }
            action(Approve)
            {
                ApplicationArea = Basic;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;

                trigger OnAction()
                var
                    WarehouseInspection: Record "Goods & Services Inspection";
                    PurchaseReceiptHeader: Record "Purch. Rcpt. Header";
                begin

                    CurrPage.SetSelectionFilter(WarehouseInspection);
                    WarehouseInspection.MarkedOnly(true);
                    if WarehouseInspection.FindSet then begin
                     if WarehouseInspection."User ID"<>UserId then
                       Error('Document %1 can only be Approved by %2, Please check!',WarehouseInspection."No.",WarehouseInspection."User ID");
                     //IF NOT WarehouseReceiptHeader.GET(WarehouseInspection."No.") THEN
                      // ERROR('Document %1 does not exist or has been posted, Please check!',WarehouseInspection."No.");
                       WarehouseInspection.TestField(WarehouseInspection.Comments);
                       WarehouseInspection.Approved:=true;
                       WarehouseInspection."Date-Time Sent for Approval":=CurrentDatetime;
                       WarehouseInspection.Decision:=WarehouseInspection.Decision::Approved;
                       WarehouseInspection.Modify;
                    end;
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;

                trigger OnAction()
                var
                    WarehouseInspection: Record "Goods & Services Inspection";
                    WarehouseReceiptHeader: Record "Warehouse Receipt Header";
                begin

                    CurrPage.SetSelectionFilter(WarehouseInspection);
                    WarehouseInspection.MarkedOnly(true);
                    if WarehouseInspection.FindSet then begin
                     if WarehouseInspection."User ID"<>UserId then
                       Error('Document %1 can only be Rejected by %2, Please check!',WarehouseInspection."No.",WarehouseInspection."User ID");
                     //IF NOT WarehouseReceiptHeader.GET(WarehouseInspection."No.") THEN
                      // ERROR('Document %1 does not exist or has been posted, Please check!',WarehouseInspection."No.");
                       WarehouseInspection.TestField(WarehouseInspection.Comments);
                       WarehouseInspection.Approved:=true;
                       WarehouseInspection."Date-Time Sent for Approval":=CurrentDatetime;
                       WarehouseInspection.Decision:=WarehouseInspection.Decision::Rejected;
                       WarehouseInspection.Modify;
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Usersetup.Get(UserId) then
          if not Usersetup."Approval Administrator" then begin
            FilterGroup(2);
            SetCurrentkey("User ID");
            SetFilter("User ID",'=%1',Usersetup."User ID");
            FilterGroup(0);
          end;
    end;

    var
        Usersetup: Record "User Setup";
}

