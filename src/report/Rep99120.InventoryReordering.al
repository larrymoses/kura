report 99120 "Inventory Reordering"
{
    //ApplicationArea = All;
    Caption = 'Inventory Reordering';
  //  UsageCategory = ReportsAndAnalysis;
  ProcessingOnly=TRUE;
    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = where(Type = const(Inventory));
            column(No; "No.")
            {
            }
            column(Type; "Type")
            {
            }
            column(Inventory; Inventory)
            {
            }
            column(ReorderPoint; "Reorder Point")
            {
            }
            column(ReorderingPolicy; "Reordering Policy")
            {
            }
            column(ReorderQuantity; "Reorder Quantity")
            {
            }
            column(Procurement_Category; "Procurement Category")
            {

            }
            trigger OnAfterGetRecord()
            begin
                CalcFields(Inventory);
                if "Reordering Policy" = "Reordering Policy"::"Fixed Reorder Qty." then begin
                    if ("Reorder Quantity" <= Inventory) and ("Reorder Notification Sent" = false) then begin
                        SendReorderEmail(Item);
                    end;
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    procedure SendReorderEmail(Items: Record Item)
    var
        Email: Codeunit Email;
        Mail: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        DocStream: Instream;
        Outs: Outstream;
        RecRef: RecordRef;
        fref: FieldRef;
        Body: Text;
        Recepient: Text;
        Subject: Text;
        SalesPerson: Record "Salesperson/Purchaser";
        ToRecipients: List of [Text];
    begin
        SalesPerson.Reset();
        SalesPerson.SetRange("Receive Reorder Notification", true);
        if SalesPerson.FindSet() then begin
            repeat
                if SalesPerson."E-Mail" <> '' then
                    ToRecipients.Add(SalesPerson."E-Mail");
            until SalesPerson.Next() = 0;
        end;
        Subject := 'INVENTORY STOCK LEVELS REMINDER FOR ITEM ' + Items."No.";
        Body := 'Dear Sir/Madam, <br> Please note that the inventory level of Item' + Items."No." + ':' + Items.Description + ' is at or below ' + Format(Items."Reorder Point") + ',please log in to the system and initiate the Procurement process. <br><br> Thanks & Regards <br><br>' + CompanyName;
        Mail.Create(ToRecipients, Subject, Body, true);
        if Email.Send(Mail) then begin
            Items."Reorder Notification Sent" := true;
            Items.Modify();
        end;
    end;
}
