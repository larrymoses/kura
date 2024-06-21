#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 99503 "UPG 13.x"
{
    // Subtype = Upgrade;

    trigger OnRun()
    begin
    end;

    // [CheckPrecondition]

    // procedure CheckPreconditions()
    // begin
    // end;

    // [TableSyncSetup]

    // procedure GetTableSyncSetupW1(var TableSynchSetup: Record "Table Synch. Setup")
    // begin
    //     // Should not be used anymore, there should not be any breaking SQL changes going forward
    // end;

    // [UpgradePerCompany]

    // procedure UpgradeWorkDescripiton()
    // var
    //     SalesHeader: Record "Sales Header";
    //     SalesShipmentHeader: Record "Sales Shipment Header";
    //     SalesInvoiceHeader: Record "Sales Invoice Header";
    //     SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    // begin
    //     if SalesHeader.FindSet then
    //       repeat
    //         if SalesHeader."Work Description".Hasvalue then begin
    //           SalesHeader.CalcFields("Work Description");
    //           if not TryReadWorkDescriptionWithUTF8Encoding(SalesHeader,SalesHeader.FieldNo("Work Description")) then
    //             ChangeEncodingToUTF8(SalesHeader,SalesHeader.FieldNo("Work Description"));
    //         end;
    //       until SalesHeader.Next = 0;

    //     if SalesShipmentHeader.FindSet then
    //       repeat
    //         if SalesShipmentHeader."Work Description".Hasvalue then begin
    //           SalesShipmentHeader.CalcFields("Work Description");
    //           if not TryReadWorkDescriptionWithUTF8Encoding(SalesShipmentHeader,SalesShipmentHeader.FieldNo("Work Description")) then
    //             ChangeEncodingToUTF8(SalesShipmentHeader,SalesShipmentHeader.FieldNo("Work Description"));
    //         end;
    //       until SalesShipmentHeader.Next = 0;

    //     if SalesInvoiceHeader.FindSet then
    //       repeat
    //         if SalesInvoiceHeader."Work Description".Hasvalue then begin
    //           SalesInvoiceHeader.CalcFields("Work Description");
    //           if not TryReadWorkDescriptionWithUTF8Encoding(SalesInvoiceHeader,SalesInvoiceHeader.FieldNo("Work Description")) then
    //             ChangeEncodingToUTF8(SalesInvoiceHeader,SalesInvoiceHeader.FieldNo("Work Description"));
    //         end;
    //       until SalesInvoiceHeader.Next = 0;

    //     if SalesCrMemoHeader.FindSet then
    //       repeat
    //         if SalesCrMemoHeader."Work Description".Hasvalue then begin
    //           SalesCrMemoHeader.CalcFields("Work Description");
    //           if not TryReadWorkDescriptionWithUTF8Encoding(SalesCrMemoHeader,SalesCrMemoHeader.FieldNo("Work Description")) then
    //             ChangeEncodingToUTF8(SalesCrMemoHeader,SalesCrMemoHeader.FieldNo("Work Description"));
    //         end;
    //       until SalesCrMemoHeader.Next = 0;
    // end;

    // [TryFunction]
    // local procedure TryReadWorkDescriptionWithUTF8Encoding(NavRecord: Variant;FieldNo: Integer)
    // var
    //     TempBlob: Record TempBlob temporary;
    //     RecordRef: RecordRef;
    //     FieldRef: FieldRef;
    //     InStream: InStream;
    //     TempText: Text;
    // begin
    //     RecordRef.GetTable(NavRecord);
    //     FieldRef := RecordRef.Field(FieldNo);
    //     TempBlob.Blob := FieldRef.Value;
    //     TempBlob.Blob.CreateInstream(InStream,Textencoding::UTF8);
    //     InStream.Read(TempText);
    //     Clear(TempBlob.Blob);
    // end;

    // local procedure ChangeEncodingToUTF8(NavRecord: Variant;FieldNo: Integer)
    // var
    //     TempBlob: Record TempBlob temporary;
    //     RecordRef: RecordRef;
    //     FieldRef: FieldRef;
    //     InStream: InStream;
    //     OutStream: OutStream;
    //     TempText: Text;
    // begin
    //     RecordRef.GetTable(NavRecord);
    //     FieldRef := RecordRef.Field(FieldNo);
    //     TempBlob.Blob := FieldRef.Value;
    //     TempBlob.Blob.CreateInstream(InStream,Textencoding::Windows);
    //     InStream.Read(TempText);
    //     Clear(TempBlob.Blob);
    //     TempBlob.Blob.CreateOutstream(OutStream,Textencoding::UTF8);
    //     OutStream.Write(TempText);
    //     FieldRef.Value := TempBlob.Blob;
    //     RecordRef.Modify;
    // end;

    // [UpgradePerCompany]

    // procedure UpgradeAPIs()
    // begin
    //     UpgradeSalesInvoiceEntityAggregate;
    //     UpgradePurchInvEntityAggregate;
    //     UpgradeSalesOrderEntityBuffer;
    //     UpgradeSalesQuoteEntityBuffer;
    //     UpgradeSalesCrMemoEntityBuffer;
    // end;

    // [Normal]
    // local procedure UpgradeSalesInvoiceEntityAggregate()
    // var
    //     SalesInvoiceEntityAggregate: Record "Sales Invoice Entity Aggregate";
    //     SalesHeader: Record "Sales Header";
    //     SalesInvoiceHeader: Record "Sales Invoice Header";
    //     UpgradeTags: Codeunit "Upgrade Tag Definitions";
    //     UpgradeTagMgt: Codeunit "Upgrade Tag";
    //     SourceRecordRef: RecordRef;
    //     TargetRecordRef: RecordRef;
    // begin
    //     if UpgradeTagMgt.HasUpgradeTag(UpgradeTags.GetSalesInvoiceEntityAggregateUpgradeTag) then
    //       exit;

    //     if SalesInvoiceEntityAggregate.FindSet(true,false) then
    //       repeat
    //         if SalesInvoiceEntityAggregate.Posted then begin
    //           SalesInvoiceHeader.SetRange(Id,SalesInvoiceEntityAggregate.Id);
    //           if SalesInvoiceHeader.FindFirst then begin
    //             SourceRecordRef.GetTable(SalesInvoiceHeader);
    //             TargetRecordRef.GetTable(SalesInvoiceEntityAggregate);
    //             CopySalesDocumentFields(SourceRecordRef,TargetRecordRef,true,true,true);
    //             SalesInvoiceEntityAggregate.Modify;
    //           end;
    //         end else begin
    //           SalesHeader.SetRange("Document Type",SalesHeader."document type"::Invoice);
    //           SalesHeader.SetRange(Id,SalesInvoiceEntityAggregate.Id);
    //           if SalesHeader.FindFirst then begin
    //             SourceRecordRef.GetTable(SalesHeader);
    //             TargetRecordRef.GetTable(SalesInvoiceEntityAggregate);
    //             CopySalesDocumentFields(SourceRecordRef,TargetRecordRef,true,true,true);
    //             SalesInvoiceEntityAggregate.Modify;
    //           end;
    //         end;
    //       until SalesInvoiceEntityAggregate.Next = 0;

    //     UpgradeTagMgt.SetUpgradeTag(UpgradeTags.GetSalesInvoiceEntityAggregateUpgradeTag);
    // end;

    // [Normal]
    // local procedure UpgradePurchInvEntityAggregate()
    // var
    //     PurchInvEntityAggregate: Record "Purch. Inv. Entity Aggregate";
    //     PurchaseHeader: Record "Purchase Header";
    //     PurchInvHeader: Record "Purch. Inv. Header";
    //     UpgradeTags: Codeunit "Upgrade Tag Definitions";
    //     UpgradeTagMgt: Codeunit "Upgrade Tag";
    //     SourceRecordRef: RecordRef;
    //     TargetRecordRef: RecordRef;
    // begin
    //     if UpgradeTagMgt.HasUpgradeTag(UpgradeTags.GetPurchInvEntityAggregateUpgradeTag) then
    //       exit;

    //     if PurchInvEntityAggregate.FindSet(true,false) then
    //       repeat
    //         if PurchInvEntityAggregate.Posted then begin
    //           PurchInvHeader.SetRange(Id,PurchInvEntityAggregate.Id);
    //           if PurchInvHeader.FindFirst then begin
    //             SourceRecordRef.GetTable(PurchInvHeader);
    //             TargetRecordRef.GetTable(PurchInvEntityAggregate);
    //             CopyPurchaseDocumentFields(SourceRecordRef,TargetRecordRef,true,true);
    //             PurchInvEntityAggregate.Modify;
    //           end;
    //         end else begin
    //           PurchaseHeader.SetRange("Document Type",PurchaseHeader."document type"::Invoice);
    //           PurchaseHeader.SetRange(Id,PurchInvEntityAggregate.Id);
    //           if PurchaseHeader.FindFirst then begin
    //             SourceRecordRef.GetTable(PurchaseHeader);
    //             TargetRecordRef.GetTable(PurchInvEntityAggregate);
    //             CopyPurchaseDocumentFields(SourceRecordRef,TargetRecordRef,true,true);
    //             PurchInvEntityAggregate.Modify;
    //           end;
    //         end;
    //       until PurchInvEntityAggregate.Next = 0;

    //     UpgradeTagMgt.SetUpgradeTag(UpgradeTags.GetPurchInvEntityAggregateUpgradeTag);
    // end;

    // [Normal]
    // local procedure UpgradeSalesOrderEntityBuffer()
    // var
    //     SalesOrderEntityBuffer: Record "Sales Order Entity Buffer";
    //     SalesHeader: Record "Sales Header";
    //     UpgradeTags: Codeunit "Upgrade Tag Definitions";
    //     UpgradeTagMgt: Codeunit "Upgrade Tag";
    //     SourceRecordRef: RecordRef;
    //     TargetRecordRef: RecordRef;
    // begin
    //     if UpgradeTagMgt.HasUpgradeTag(UpgradeTags.GetSalesOrderEntityBufferUpgradeTag) then
    //       exit;

    //     if SalesOrderEntityBuffer.FindSet(true,false) then
    //       repeat
    //         SalesHeader.SetRange("Document Type",SalesHeader."document type"::Order);
    //         SalesHeader.SetRange(Id,SalesOrderEntityBuffer.Id);
    //         if SalesHeader.FindFirst then begin
    //           SourceRecordRef.GetTable(SalesHeader);
    //           TargetRecordRef.GetTable(SalesOrderEntityBuffer);
    //           CopySalesDocumentFields(SourceRecordRef,TargetRecordRef,true,true,true);
    //           SalesOrderEntityBuffer.Modify;
    //         end;
    //       until SalesOrderEntityBuffer.Next = 0;

    //     UpgradeTagMgt.SetUpgradeTag(UpgradeTags.GetSalesOrderEntityBufferUpgradeTag);
    // end;

    // local procedure UpgradeSalesQuoteEntityBuffer()
    // var
    //     SalesQuoteEntityBuffer: Record "Sales Quote Entity Buffer";
    //     SalesHeader: Record "Sales Header";
    //     UpgradeTags: Codeunit "Upgrade Tag Definitions";
    //     UpgradeTagMgt: Codeunit "Upgrade Tag";
    //     SourceRecordRef: RecordRef;
    //     TargetRecordRef: RecordRef;
    // begin
    //     if UpgradeTagMgt.HasUpgradeTag(UpgradeTags.GetSalesQuoteEntityBufferUpgradeTag) then
    //       exit;

    //     if SalesQuoteEntityBuffer.FindSet(true,false) then
    //       repeat
    //         SalesHeader.SetRange("Document Type",SalesHeader."document type"::Quote);
    //         SalesHeader.SetRange(Id,SalesQuoteEntityBuffer.Id);
    //         if SalesHeader.FindFirst then begin
    //           SourceRecordRef.GetTable(SalesHeader);
    //           TargetRecordRef.GetTable(SalesQuoteEntityBuffer);
    //           CopySalesDocumentFields(SourceRecordRef,TargetRecordRef,true,true,true);
    //           SalesQuoteEntityBuffer.Modify;
    //         end;
    //       until SalesQuoteEntityBuffer.Next = 0;

    //     UpgradeTagMgt.SetUpgradeTag(UpgradeTags.GetSalesQuoteEntityBufferUpgradeTag);
    // end;

    // local procedure UpgradeSalesCrMemoEntityBuffer()
    // var
    //     SalesCrMemoEntityBuffer: Record "Sales Cr. Memo Entity Buffer";
    //     SalesHeader: Record "Sales Header";
    //     SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    //     UpgradeTags: Codeunit "Upgrade Tag Definitions";
    //     UpgradeTagMgt: Codeunit "Upgrade Tag";
    //     SourceRecordRef: RecordRef;
    //     TargetRecordRef: RecordRef;
    // begin
    //     if UpgradeTagMgt.HasUpgradeTag(UpgradeTags.GetSalesCrMemoEntityBufferUpgradeTag) then
    //       exit;

    //     if SalesCrMemoEntityBuffer.FindSet(true,false) then
    //       repeat
    //         if SalesCrMemoEntityBuffer.Posted then begin
    //           SalesCrMemoHeader.SetRange(Id,SalesCrMemoEntityBuffer.Id);
    //           if SalesCrMemoHeader.FindFirst then
    //             SourceRecordRef.GetTable(SalesCrMemoHeader);
    //         end else begin
    //           SalesHeader.SetRange("Document Type",SalesHeader."document type"::"Credit Memo");
    //           SalesHeader.SetRange(Id,SalesCrMemoEntityBuffer.Id);
    //           if SalesHeader.FindFirst then
    //             SourceRecordRef.GetTable(SalesHeader);
    //         end;
    //         TargetRecordRef.GetTable(SalesCrMemoEntityBuffer);
    //         CopySalesDocumentFields(SourceRecordRef,TargetRecordRef,true,true,false);
    //         SalesCrMemoEntityBuffer.Modify;
    //       until SalesCrMemoEntityBuffer.Next = 0;

    //     UpgradeTagMgt.SetUpgradeTag(UpgradeTags.GetSalesCrMemoEntityBufferUpgradeTag);
    // end;

    // local procedure CopySalesDocumentFields(var SourceRecordRef: RecordRef;var TargetRecordRef: RecordRef;SellTo: Boolean;BillTo: Boolean;ShipTo: Boolean)
    // var
    //     SalesHeader: Record "Sales Header";
    //     SalesOrderEntityBuffer: Record "Sales Order Entity Buffer";
    //     Customer: Record Customer;
    //     CodeFieldRef: FieldRef;
    //     IdFieldRef: FieldRef;
    //     EmptyGuid: Guid;
    // begin
    //     if SellTo then begin
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Sell-to Phone No."));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Sell-to E-Mail"));
    //     end;
    //     if BillTo then begin
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Bill-to Customer No."));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Bill-to Name"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Bill-to Address"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Bill-to Address 2"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Bill-to City"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Bill-to Contact"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Bill-to Post Code"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Bill-to County"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Bill-to Country/Region Code"));
    //       CodeFieldRef := TargetRecordRef.Field(SalesOrderEntityBuffer.FieldNo("Bill-to Customer No."));
    //       IdFieldRef := TargetRecordRef.Field(SalesOrderEntityBuffer.FieldNo("Bill-to Customer Id"));
    //       if Customer.Get(CodeFieldRef.Value) then
    //         IdFieldRef.Value := Customer.Id
    //       else
    //         IdFieldRef.Value := EmptyGuid;
    //     end;
    //     if ShipTo then begin
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Ship-to Code"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Ship-to Name"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Ship-to Address"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Ship-to Address 2"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Ship-to City"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Ship-to Contact"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Ship-to Post Code"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Ship-to County"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,SalesHeader.FieldNo("Ship-to Country/Region Code"));
    //     end;
    // end;

    // local procedure CopyPurchaseDocumentFields(var SourceRecordRef: RecordRef;var TargetRecordRef: RecordRef;PayTo: Boolean;ShipTo: Boolean)
    // var
    //     PurchaseHeader: Record "Purchase Header";
    //     PurchInvEntityAggregate: Record "Purch. Inv. Entity Aggregate";
    //     Vendor: Record Vendor;
    //     Currency: Record Currency;
    //     CodeFieldRef: FieldRef;
    //     IdFieldRef: FieldRef;
    //     EmptyGuid: Guid;
    // begin
    //     if PayTo then begin
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Pay-to Vendor No."));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Pay-to Name"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Pay-to Address"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Pay-to Address 2"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Pay-to City"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Pay-to Contact"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Pay-to Post Code"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Pay-to County"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Pay-to Country/Region Code"));
    //       CodeFieldRef := TargetRecordRef.Field(PurchInvEntityAggregate.FieldNo("Pay-to Vendor No."));
    //       IdFieldRef := TargetRecordRef.Field(PurchInvEntityAggregate.FieldNo("Pay-to Vendor Id"));
    //       if Vendor.Get(CodeFieldRef.Value) then
    //         IdFieldRef.Value := Vendor.Id
    //       else
    //         IdFieldRef.Value := EmptyGuid;
    //       CodeFieldRef := TargetRecordRef.Field(PurchInvEntityAggregate.FieldNo("Currency Code"));
    //       IdFieldRef := TargetRecordRef.Field(PurchInvEntityAggregate.FieldNo("Currency Id"));
    //       if Vendor.Get(CodeFieldRef.Value) then
    //         IdFieldRef.Value := Currency.Id
    //       else
    //         IdFieldRef.Value := EmptyGuid;
    //     end;
    //     if ShipTo then begin
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Ship-to Code"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Ship-to Name"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Ship-to Address"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Ship-to Address 2"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Ship-to City"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Ship-to Contact"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Ship-to Post Code"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Ship-to County"));
    //       CopyFieldValue(SourceRecordRef,TargetRecordRef,PurchaseHeader.FieldNo("Ship-to Country/Region Code"));
    //     end;
    // end;

    // local procedure CopyFieldValue(var SourceRecordRef: RecordRef;var TargetRecordRef: RecordRef;FieldNo: Integer)
    // var
    //     SourceFieldRef: FieldRef;
    //     TargetFieldRef: FieldRef;
    // begin
    //     SourceFieldRef := SourceRecordRef.Field(FieldNo);
    //     TargetFieldRef := TargetRecordRef.Field(FieldNo);
    //     if TargetFieldRef.Value <> SourceFieldRef.Value then
    //       TargetFieldRef.Value := SourceFieldRef.Value;
    // end;
}

