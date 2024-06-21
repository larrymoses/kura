#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 57097 "Good Receive Note"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Good Receive Note.rdlc';

    dataset
    {
        dataitem("Purchase Header"; "Purch. Rcpt. Header")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(name; CompanyInf.Name)
            {
            }
            column(logo; CompanyInf.Picture)
            {
            }
            column(Approv; name)
            {
            }
            column(No_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(LocationCode_PurchaseHeader; "Purchase Header"."Location Code")
            {
            }
            column(ShortcutDimension1Code_PurchaseHeader; "Purchase Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_PurchaseHeader; "Purchase Header"."Shortcut Dimension 2 Code")
            {
            }
            column(PurchaserCode_PurchaseHeader; "Purchase Header"."Purchaser Code")
            {
            }
            column(Comment_PurchaseHeader; "Purchase Header".Comment)
            {
            }
            column(NoPrinted_PurchaseHeader; "Purchase Header"."No. Printed")
            {
            }
            column(DocumentDate_PurchaseHeader; "Purchase Header"."Document Date")
            {
            }
            column(Area_PurchaseHeader; "Purchase Header".Area)
            {
            }
            column(StoreNo_PurchaseHeader; "Purchase Header"."No.")
            {
            }
            column(Description_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(PaytoVendorNo_PurchaseHeader; "Purchase Header"."Pay-to Vendor No.")
            {
            }
            column(PaytoName_PurchaseHeader; "Purchase Header"."Pay-to Name")
            {
            }
            column(PaytoName2_PurchaseHeader; "Purchase Header"."Pay-to Name 2")
            {
            }
            column(PaytoAddress_PurchaseHeader; "Purchase Header"."Pay-to Address")
            {
            }
            column(PaytoAddress2_PurchaseHeader; "Purchase Header"."Pay-to Address 2")
            {
            }
            column(PaytoCity_PurchaseHeader; "Purchase Header"."Pay-to City")
            {
            }
            column(PaytoContact_PurchaseHeader; "Purchase Header"."Pay-to Contact")
            {
            }
            column(YourReference_PurchaseHeader; "Purchase Header"."Your Reference")
            {
            }
            column(ShiptoCode_PurchaseHeader; "Purchase Header"."Ship-to Code")
            {
            }
            column(ShiptoName_PurchaseHeader; "Purchase Header"."Ship-to Name")
            {
            }
            column(ShiptoName2_PurchaseHeader; "Purchase Header"."Ship-to Name 2")
            {
            }
            column(ShiptoAddress_PurchaseHeader; "Purchase Header"."Ship-to Address")
            {
            }
            column(ShiptoAddress2_PurchaseHeader; "Purchase Header"."Ship-to Address 2")
            {
            }
            column(ShiptoCity_PurchaseHeader; "Purchase Header"."Ship-to City")
            {
            }
            column(ShiptoContact_PurchaseHeader; "Purchase Header"."Ship-to Contact")
            {
            }
            column(OrderDate_PurchaseHeader; "Purchase Header"."Order Date")
            {
            }
            column(PostingDate_PurchaseHeader; "Purchase Header"."Posting Date")
            {
            }
            column(ExpectedReceiptDate_PurchaseHeader; "Purchase Header"."Expected Receipt Date")
            {
            }
            column(PostingDescription_PurchaseHeader; "Purchase Header"."Posting Description")
            {
            }
            column(PaymentTermsCode_PurchaseHeader; "Purchase Header"."Payment Terms Code")
            {
            }
            column(DueDate_PurchaseHeader; "Purchase Header"."Due Date")
            {
            }
            column(PaymentDiscount_PurchaseHeader; "Purchase Header"."Payment Discount %")
            {
            }
            column(PmtDiscountDate_PurchaseHeader; "Purchase Header"."Pmt. Discount Date")
            {
            }
            column(ShipmentMethodCode_PurchaseHeader; "Purchase Header"."Shipment Method Code")
            {
            }
            column(VendorPostingGroup_PurchaseHeader; "Purchase Header"."Vendor Posting Group")
            {
            }
            column(CurrencyCode_PurchaseHeader; "Purchase Header"."Currency Code")
            {
            }
            column(CurrencyFactor_PurchaseHeader; "Purchase Header"."Currency Factor")
            {
            }
            column(InvoiceDiscCode_PurchaseHeader; "Purchase Header"."Invoice Disc. Code")
            {
            }
            column(LanguageCode_PurchaseHeader; "Purchase Header"."Language Code")
            {
            }
            column(OrderNo_PurchaseHeader; "Purchase Header"."Order No.")
            {
            }
            column(OnHold_PurchaseHeader; "Purchase Header"."On Hold")
            {
            }
            column(AppliestoDocType_PurchaseHeader; "Purchase Header"."Applies-to Doc. Type")
            {
            }
            column(AppliestoDocNo_PurchaseHeader; "Purchase Header"."Applies-to Doc. No.")
            {
            }
            column(BalAccountNo_PurchaseHeader; "Purchase Header"."Bal. Account No.")
            {
            }
            column(VendorOrderNo_PurchaseHeader; "Purchase Header"."Vendor Order No.")
            {
            }
            column(VendorShipmentNo_PurchaseHeader; "Purchase Header"."Vendor Shipment No.")
            {
            }
            column(VATRegistrationNo_PurchaseHeader; "Purchase Header"."VAT Registration No.")
            {
            }
            column(SelltoCustomerNo_PurchaseHeader; "Purchase Header"."Sell-to Customer No.")
            {
            }
            column(ReasonCode_PurchaseHeader; "Purchase Header"."Reason Code")
            {
            }
            column(GenBusPostingGroup_PurchaseHeader; "Purchase Header"."Gen. Bus. Posting Group")
            {
            }
            column(TransactionType_PurchaseHeader; "Purchase Header"."Transaction Type")
            {
            }
            column(TransportMethod_PurchaseHeader; "Purchase Header"."Transport Method")
            {
            }
            column(VATCountryRegionCode_PurchaseHeader; "Purchase Header"."VAT Country/Region Code")
            {
            }
            column(BuyfromVendorName_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorName2_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name 2")
            {
            }
            column(BuyfromAddress_PurchaseHeader; "Purchase Header"."Buy-from Address")
            {
            }
            column(BuyfromAddress2_PurchaseHeader; "Purchase Header"."Buy-from Address 2")
            {
            }
            column(BuyfromCity_PurchaseHeader; "Purchase Header"."Buy-from City")
            {
            }
            column(BuyfromContact_PurchaseHeader; "Purchase Header"."Buy-from Contact")
            {
            }
            column(PaytoPostCode_PurchaseHeader; "Purchase Header"."Pay-to Post Code")
            {
            }
            column(PaytoCounty_PurchaseHeader; "Purchase Header"."Pay-to County")
            {
            }
            column(PaytoCountryRegionCode_PurchaseHeader; "Purchase Header"."Pay-to Country/Region Code")
            {
            }
            column(BuyfromPostCode_PurchaseHeader; "Purchase Header"."Buy-from Post Code")
            {
            }
            column(BuyfromCounty_PurchaseHeader; "Purchase Header"."Buy-from County")
            {
            }
            column(BuyfromCountryRegionCode_PurchaseHeader; "Purchase Header"."Buy-from Country/Region Code")
            {
            }
            column(ShiptoPostCode_PurchaseHeader; "Purchase Header"."Ship-to Post Code")
            {
            }
            column(ShiptoCounty_PurchaseHeader; "Purchase Header"."Ship-to County")
            {
            }
            column(ShiptoCountryRegionCode_PurchaseHeader; "Purchase Header"."Ship-to Country/Region Code")
            {
            }
            column(BalAccountType_PurchaseHeader; "Purchase Header"."Bal. Account Type")
            {
            }
            column(OrderAddressCode_PurchaseHeader; "Purchase Header"."Order Address Code")
            {
            }
            column(EntryPoint_PurchaseHeader; "Purchase Header"."Entry Point")
            {
            }
            column(Correction_PurchaseHeader; "Purchase Header".Correction)
            {
            }
            column(TransactionSpecification_PurchaseHeader; "Purchase Header"."Transaction Specification")
            {
            }
            column(PaymentMethodCode_PurchaseHeader; "Purchase Header"."Payment Method Code")
            {
            }
            column(NoSeries_PurchaseHeader; "Purchase Header"."No. Series")
            {
            }
            column(OrderNoSeries_PurchaseHeader; "Purchase Header"."Order No. Series")
            {
            }
            column(UserID_PurchaseHeader; "Purchase Header"."User ID")
            {
            }
            column(SourceCode_PurchaseHeader; "Purchase Header"."Source Code")
            {
            }
            column(TaxAreaCode_PurchaseHeader; "Purchase Header"."Tax Area Code")
            {
            }
            column(TaxLiable_PurchaseHeader; "Purchase Header"."Tax Liable")
            {
            }
            column(VATBusPostingGroup_PurchaseHeader; "Purchase Header"."VAT Bus. Posting Group")
            {
            }
            column(VATBaseDiscount_PurchaseHeader; "Purchase Header"."VAT Base Discount %")
            {
            }
            column(QuoteNo_PurchaseHeader; "Purchase Header"."Quote No.")
            {
            }
            column(DimensionSetID_PurchaseHeader; "Purchase Header"."Dimension Set ID")
            {
            }
            column(CampaignNo_PurchaseHeader; "Purchase Header"."Campaign No.")
            {
            }
            column(BuyfromContactNo_PurchaseHeader; "Purchase Header"."Buy-from Contact No.")
            {
            }
            column(PaytoContactno_PurchaseHeader; "Purchase Header"."Pay-to Contact no.")
            {
            }
            column(ResponsibilityCenter_PurchaseHeader; "Purchase Header"."Responsibility Center")
            {
            }
            column(RequestedReceiptDate_PurchaseHeader; "Purchase Header"."Requested Receipt Date")
            {
            }
            column(PromisedReceiptDate_PurchaseHeader; "Purchase Header"."Promised Receipt Date")
            {
            }
            column(LeadTimeCalculation_PurchaseHeader; "Purchase Header"."Lead Time Calculation")
            {
            }
            column(InboundWhseHandlingTime_PurchaseHeader; "Purchase Header"."Inbound Whse. Handling Time")
            {
            }
            column(RequisitionOfficer; UserSetup."Employee Name")
            {
            }
            column(DateRequisitionOfficer; ApproverDate[1])
            {
            }
            column(RequisitionOfficer_Signature; UserSetup.Picture)
            {
            }
            column(AuthorisingOfficer; UserSetup2."Employee Name")
            {
            }
            column(DateAuthorisingOfficer; ApproverDate[2])
            {
            }
            column(AuthorisingOfficer_Signature; UserSetup2.Picture)
            {
            }
            column(IssuedBy; UserSetup3."Employee Name")
            {
            }
            column(DateIssuedBy; ApproverDate[3])
            {
            }
            column(IssuedBy_Signature; UserSetup3.Picture)
            {
            }
            column(AuthorizedBy; UserSetup4."Employee Name")
            {
            }
            column(DateAuthorizedBy; ApproverDate[4])
            {
            }
            column(AuthorizedBy_Signature; UserSetup4.Picture)
            {
            }
            column(Designation; Designation)
            {
            }
            dataitem("Purchase Line"; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(ReportForNavId_227; 227)
                {
                }
                column(BuyfromVendorNo_PurchaseLine; "Purchase Line"."Buy-from Vendor No.")
                {
                }
                column(DocumentNo_PurchaseLine; "Purchase Line"."Document No.")
                {
                }
                column(LineNo_PurchaseLine; "Purchase Line"."Line No.")
                {
                }
                column(Type_PurchaseLine; "Purchase Line".Type)
                {
                }
                column(No_PurchaseLine; "Purchase Line"."No.")
                {
                }
                column(LocationCode_PurchaseLine; "Purchase Line"."Location Code")
                {
                }
                column(PostingGroup_PurchaseLine; "Purchase Line"."Posting Group")
                {
                }
                column(ExpectedReceiptDate_PurchaseLine; "Purchase Line"."Expected Receipt Date")
                {
                }
                column(Description_PurchaseLine; "Purchase Line".Description)
                {
                }
                column(Description2_PurchaseLine; "Purchase Line"."Description 2")
                {
                }
                column(UnitofMeasure_PurchaseLine; "Purchase Line"."Unit of Measure")
                {
                }
                column(Quantity_PurchaseLine; "Purchase Line".Quantity)
                {
                }
                column(DirectUnitCost_PurchaseLine; "Purchase Line"."Direct Unit Cost")
                {
                }
                column(UnitCostLCY_PurchaseLine; "Purchase Line"."Unit Cost (LCY)")
                {
                }
                column(VAT_PurchaseLine; "Purchase Line"."VAT %")
                {
                }
                column(LineDiscount_PurchaseLine; "Purchase Line"."Line Discount %")
                {
                }
                column(UnitPriceLCY_PurchaseLine; "Purchase Line"."Unit Price (LCY)")
                {
                }
                column(AllowInvoiceDisc_PurchaseLine; "Purchase Line"."Allow Invoice Disc.")
                {
                }
                column(GrossWeight_PurchaseLine; "Purchase Line"."Gross Weight")
                {
                }
                column(NetWeight_PurchaseLine; "Purchase Line"."Net Weight")
                {
                }
                column(UnitsperParcel_PurchaseLine; "Purchase Line"."Units per Parcel")
                {
                }
                column(UnitVolume_PurchaseLine; "Purchase Line"."Unit Volume")
                {
                }
                column(AppltoItemEntry_PurchaseLine; "Purchase Line"."Appl.-to Item Entry")
                {
                }
                column(ItemRcptEntryNo_PurchaseLine; "Purchase Line"."Item Rcpt. Entry No.")
                {
                }
                column(ShortcutDimension1Code_PurchaseLine; "Purchase Line"."Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_PurchaseLine; "Purchase Line"."Shortcut Dimension 2 Code")
                {
                }
                column(JobNo_PurchaseLine; "Purchase Line"."Job No.")
                {
                }
                column(IndirectCost_PurchaseLine; "Purchase Line"."Indirect Cost %")
                {
                }
                column(QtyRcdNotInvoiced_PurchaseLine; "Purchase Line"."Qty. Rcd. Not Invoiced")
                {
                }
                column(QuantityInvoiced_PurchaseLine; "Purchase Line"."Quantity Invoiced")
                {
                }
                column(OrderNo_PurchaseLine; "Purchase Line"."Order No.")
                {
                }
                column(OrderLineNo_PurchaseLine; "Purchase Line"."Order Line No.")
                {
                }
                column(PaytoVendorNo_PurchaseLine; "Purchase Line"."Pay-to Vendor No.")
                {
                }
                column(VendorItemNo_PurchaseLine; "Purchase Line"."Vendor Item No.")
                {
                }
                column(SalesOrderNo_PurchaseLine; "Purchase Line"."Sales Order No.")
                {
                }
                column(SalesOrderLineNo_PurchaseLine; "Purchase Line"."Sales Order Line No.")
                {
                }
                column(GenBusPostingGroup_PurchaseLine; "Purchase Line"."Gen. Bus. Posting Group")
                {
                }
                column(GenProdPostingGroup_PurchaseLine; "Purchase Line"."Gen. Prod. Posting Group")
                {
                }
                column(VATCalculationType_PurchaseLine; "Purchase Line"."VAT Calculation Type")
                {
                }
                column(TransactionType_PurchaseLine; "Purchase Line"."Transaction Type")
                {
                }
                column(TransportMethod_PurchaseLine; "Purchase Line"."Transport Method")
                {
                }
                column(AttachedtoLineNo_PurchaseLine; "Purchase Line"."Attached to Line No.")
                {
                }
                column(EntryPoint_PurchaseLine; "Purchase Line"."Entry Point")
                {
                }
                column(Area_PurchaseLine; "Purchase Line".Area)
                {
                }
                column(TransactionSpecification_PurchaseLine; "Purchase Line"."Transaction Specification")
                {
                }
                column(TaxAreaCode_PurchaseLine; "Purchase Line"."Tax Area Code")
                {
                }
                column(TaxLiable_PurchaseLine; "Purchase Line"."Tax Liable")
                {
                }
                column(TaxGroupCode_PurchaseLine; "Purchase Line"."Tax Group Code")
                {
                }
                column(UseTax_PurchaseLine; "Purchase Line"."Use Tax")
                {
                }
                column(VATBusPostingGroup_PurchaseLine; "Purchase Line"."VAT Bus. Posting Group")
                {
                }
                column(VATProdPostingGroup_PurchaseLine; "Purchase Line"."VAT Prod. Posting Group")
                {
                }
                column(CurrencyCode_PurchaseLine; "Purchase Line"."Currency Code")
                {
                }
                column(BlanketOrderNo_PurchaseLine; "Purchase Line"."Blanket Order No.")
                {
                }
                column(BlanketOrderLineNo_PurchaseLine; "Purchase Line"."Blanket Order Line No.")
                {
                }
                column(VATBaseAmount_PurchaseLine; "Purchase Line"."VAT Base Amount")
                {
                }
                column(UnitCost_PurchaseLine; "Purchase Line"."Unit Cost")
                {
                }
                column(ICPartnerRefType_PurchaseLine; "Purchase Line"."IC Partner Ref. Type")
                {
                }
                column(ICPartnerReference_PurchaseLine; "Purchase Line"."IC Partner Reference")
                {
                }
                column(PostingDate_PurchaseLine; "Purchase Line"."Posting Date")
                {
                }
                column(DimensionSetID_PurchaseLine; "Purchase Line"."Dimension Set ID")
                {
                }
                column(JobTaskNo_PurchaseLine; "Purchase Line"."Job Task No.")
                {
                }
                column(JobLineType_PurchaseLine; "Purchase Line"."Job Line Type")
                {
                }
                column(JobUnitPrice_PurchaseLine; "Purchase Line"."Job Unit Price")
                {
                }
                column(JobTotalPrice_PurchaseLine; "Purchase Line"."Job Total Price")
                {
                }
                column(JobLineAmount_PurchaseLine; "Purchase Line"."Job Line Amount")
                {
                }
                column(JobLineDiscountAmount_PurchaseLine; "Purchase Line"."Job Line Discount Amount")
                {
                }
                column(JobLineDiscount_PurchaseLine; "Purchase Line"."Job Line Discount %")
                {
                }
                column(JobUnitPriceLCY_PurchaseLine; "Purchase Line"."Job Unit Price (LCY)")
                {
                }
                column(JobTotalPriceLCY_PurchaseLine; "Purchase Line"."Job Total Price (LCY)")
                {
                }
                column(JobLineAmountLCY_PurchaseLine; "Purchase Line"."Job Line Amount (LCY)")
                {
                }
                column(JobLineDiscAmountLCY_PurchaseLine; "Purchase Line"."Job Line Disc. Amount (LCY)")
                {
                }
                column(JobCurrencyFactor_PurchaseLine; "Purchase Line"."Job Currency Factor")
                {
                }
                column(JobCurrencyCode_PurchaseLine; "Purchase Line"."Job Currency Code")
                {
                }
                column(ProdOrderNo_PurchaseLine; "Purchase Line"."Prod. Order No.")
                {
                }
                column(VariantCode_PurchaseLine; "Purchase Line"."Variant Code")
                {
                }
                column(BinCode_PurchaseLine; "Purchase Line"."Bin Code")
                {
                }
                column(QtyperUnitofMeasure_PurchaseLine; "Purchase Line"."Qty. per Unit of Measure")
                {
                }
                column(UnitofMeasureCode_PurchaseLine; "Purchase Line"."Unit of Measure Code")
                {
                }
                column(QuantityBase_PurchaseLine; "Purchase Line"."Quantity (Base)")
                {
                }
                column(QtyInvoicedBase_PurchaseLine; "Purchase Line"."Qty. Invoiced (Base)")
                {
                }
                column(FAPostingDate_PurchaseLine; "Purchase Line"."FA Posting Date")
                {
                }
                column(FAPostingType_PurchaseLine; "Purchase Line"."FA Posting Type")
                {
                }
                column(DepreciationBookCode_PurchaseLine; "Purchase Line"."Depreciation Book Code")
                {
                }
                column(SalvageValue_PurchaseLine; "Purchase Line"."Salvage Value")
                {
                }
                column(DepruntilFAPostingDate_PurchaseLine; "Purchase Line"."Depr. until FA Posting Date")
                {
                }
                column(DeprAcquisitionCost_PurchaseLine; "Purchase Line"."Depr. Acquisition Cost")
                {
                }
                column(MaintenanceCode_PurchaseLine; "Purchase Line"."Maintenance Code")
                {
                }
                column(InsuranceNo_PurchaseLine; "Purchase Line"."Insurance No.")
                {
                }
                column(BudgetedFANo_PurchaseLine; "Purchase Line"."Budgeted FA No.")
                {
                }
                column(DuplicateinDepreciationBook_PurchaseLine; "Purchase Line"."Duplicate in Depreciation Book")
                {
                }
                column(UseDuplicationList_PurchaseLine; "Purchase Line"."Use Duplication List")
                {
                }
                column(ResponsibilityCenter_PurchaseLine; "Purchase Line"."Responsibility Center")
                {
                }
                column(CrossReferenceNo_PurchaseLine; "Purchase Line"."Cross-Reference No.")
                {
                }
                column(UnitofMeasureCrossRef_PurchaseLine; "Purchase Line"."Unit of Measure (Cross Ref.)")
                {
                }
                column(CrossReferenceType_PurchaseLine; "Purchase Line"."Cross-Reference Type")
                {
                }
                column(CrossReferenceTypeNo_PurchaseLine; "Purchase Line"."Cross-Reference Type No.")
                {
                }
                column(ItemCategoryCode_PurchaseLine; "Purchase Line"."Item Category Code")
                {
                }
                column(Nonstock_PurchaseLine; "Purchase Line".Nonstock)
                {
                }
                column(PurchasingCode_PurchaseLine; "Purchase Line"."Purchasing Code")
                {
                }
                column(SpecialOrderSalesNo_PurchaseLine; "Purchase Line"."Special Order Sales No.")
                {
                }
                column(SpecialOrderSalesLineNo_PurchaseLine; "Purchase Line"."Special Order Sales Line No.")
                {
                }
                column(RequestedReceiptDate_PurchaseLine; "Purchase Line"."Requested Receipt Date")
                {
                }
                column(PromisedReceiptDate_PurchaseLine; "Purchase Line"."Promised Receipt Date")
                {
                }
                column(LeadTimeCalculation_PurchaseLine; "Purchase Line"."Lead Time Calculation")
                {
                }
                column(InboundWhseHandlingTime_PurchaseLine; "Purchase Line"."Inbound Whse. Handling Time")
                {
                }
                column(PlannedReceiptDate_PurchaseLine; "Purchase Line"."Planned Receipt Date")
                {
                }
                column(OrderDate_PurchaseLine; "Purchase Line"."Order Date")
                {
                }
                column(ItemChargeBaseAmount_PurchaseLine; "Purchase Line"."Item Charge Base Amount")
                {
                }
                column(Correction_PurchaseLine; "Purchase Line".Correction)
                {
                }
                column(ReturnReasonCode_PurchaseLine; "Purchase Line"."Return Reason Code")
                {
                }
                column(QuantityReceived_PurchaseLine; "Purchase Line"."Quantity Received")
                {
                }
                column(RoutingNo_PurchaseLine; "Purchase Line"."Routing No.")
                {
                }
                column(OperationNo_PurchaseLine; "Purchase Line"."Operation No.")
                {
                }
                column(WorkCenterNo_PurchaseLine; "Purchase Line"."Work Center No.")
                {
                }
                column(ProdOrderLineNo_PurchaseLine; "Purchase Line"."Prod. Order Line No.")
                {
                }
                column(OverheadRate_PurchaseLine; "Purchase Line"."Overhead Rate")
                {
                }
                column(RoutingReferenceNo_PurchaseLine; "Purchase Line"."Routing Reference No.")
                {
                }
            }
            dataitem("User Setup"; "User Setup")
            {
                DataItemLink = "User ID" = field("User ID");
                column(ReportForNavId_202; 202)
                {
                }
                column(EmployeeName_UserSetup; "User Setup"."Employee Name")
                {
                }
                column(Pictures_UserSetup; "User Setup".Picture)
                {
                }
                column(Picture_UserSetup; "User Setup".Picture)
                {
                }
                dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
                {
                    column(ReportForNavId_11; 11)
                    {
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    UserSetup9.Reset;
                    UserSetup9.SetRange("User ID", PurchRcptHeader."User ID");
                    if UserSetup9.FindSet then
                        name := UserSetup9."Employee Name";
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //Approvals Signatures
                UserSetup9.Reset;
                UserSetup9.SetRange("User ID", PurchRcptHeader."User ID");
                if UserSetup9.FindSet then
                    name := UserSetup9."Employee Name";
                /*
                ApprovalEntries.RESET;
                ApprovalEntries.SETRANGE("Table ID",38);
                ApprovalEntries.SETRANGE("Document No.", "Purchase Header"."No.");
                ApprovalEntries.SETRANGE(Status,ApprovalEntries.Status::Approved);
                IF ApprovalEntries.FIND('-') THEN BEGIN
                   i:=0;
                 REPEAT
                 i:=i+1;
                IF i=1 THEN BEGIN
                Approver2[1]:=ApprovalEntries."Sender ID";
                ApproverDate[1]:=ApprovalEntries."Date-Time Sent for Approval";
                 IF UserSetup.GET(Approver1[1]) THEN
                    UserSetup.CALCFIELDS(Picture);
                       ENo1:=UserSetup."Employee No.";
                        IF Emp.GET(ENo1) THEN
                          DesignationID1:=Emp."Job ID";
                            IF JOBID.GET(DesignationID1) THEN
                              Designation1:=JOBID."Task No";
                           //  MESSAGE('%1|%2|%3', ENo, DesignationID, Designation);
                Approver1[2]:=ApprovalEntries."Approver ID";
                ApproverDate[2]:=ApprovalEntries."Last Date-Time Modified";
                 IF UserSetup1.GET(Approver2[2]) THEN
                    UserSetup1.CALCFIELDS(Picture);
                    ENo2:=UserSetup1."Employee No.";
                        IF Emp.GET(ENo2) THEN
                          DesignationID2:=Emp."Job ID";
                            IF JOBID.GET(DesignationID2) THEN
                              Designation2:=JOBID."Task No";
                END;
                IF i=2 THEN
                BEGIN
                Approver2[3]:=ApprovalEntries."Approver ID";
                ApproverDate[3]:=ApprovalEntries."Last Date-Time Modified";
                 IF UserSetup2.GET(Approver2[3]) THEN
                    UserSetup2.CALCFIELDS(Picture);
                    ENo3:=UserSetup2."Employee No.";
                        IF Emp.GET(ENo3) THEN
                          DesignationID3:=Emp."Job ID";
                            IF JOBID.GET(DesignationID3) THEN
                              Designation3:=JOBID."Task No";
                END;
                IF i=3 THEN
                BEGIN
                Approver2[4]:=ApprovalEntries."Approver ID";
                ApproverDate[4]:=ApprovalEntries."Last Date-Time Modified";
                 IF UserSetup3.GET(Approver2[4]) THEN
                    UserSetup3.CALCFIELDS(Picture);
                    ENo4:=UserSetup3."Employee No.";
                        IF Emp.GET(ENo4) THEN
                          DesignationID4:=Emp."Job ID";
                            IF JOBID.GET(DesignationID4) THEN
                              Designation4:=JOBID."Task No";
                END;
                UNTIL
                ApprovalEntries.NEXT=0;
                
                END;
                */

                //Approvals Signatures
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 38);
                ApprovalEntries.SetRange("Document No.", "Purchase Header"."Order No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            Approver1[1] := ApprovalEntries."Sender ID";
                            ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                            if UserSetup.Get(Approver1[1]) then begin
                                UserSetup.CalcFields(Picture);

                                ENo := UserSetup."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                /*JOBID.RESET;
                                JOBID.SETRANGE("Job Id",DesignationID);
                                  IF JOBID.FINDSET THEN
                                    Designation:=JOBID."Task No";*/

                            end;
                            Approver1[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver1[2]) then begin
                                UserSetup1.CalcFields(Picture);
                                ENo := UserSetup1."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                /*JOBID.RESET;
                              JOBID.SETRANGE("Job Id",DesignationID);
                                IF JOBID.FINDSET THEN
                                  Designation:=JOBID."Task No";*/
                            end;
                        end;
                        if i = 2 then begin
                            Approver1[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver1[3]) then begin
                                UserSetup2.CalcFields(Picture);
                                ENo := UserSetup2."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                /*JOBID.RESET;
                              JOBID.SETRANGE("Job Id",DesignationID);
                                IF JOBID.FINDSET THEN
                                  Designation:=JOBID."Task No";*/
                            end;
                        end;
                        if i = 3 then begin
                            Approver1[4] := ApprovalEntries."Approver ID";
                            ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver1[4]) then begin
                                UserSetup3.CalcFields(Picture);
                                ENo := UserSetup3."Employee No.";
                                if Emp.Get(ENo) then
                                    DesignationID := Emp."Job ID";
                                /* JOBID.RESET;
                               JOBID.SETRANGE("Job Id",DesignationID);
                                 IF JOBID.FINDSET THEN
                                   Designation:=JOBID."Task No";*/
                            end;
                        end;
                    until
                   ApprovalEntries.Next = 0;
                end;

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInf.Get;
        CompanyInf.CalcFields(Picture);
        UserSetup9.Reset;
        UserSetup9.SetRange("User ID", PurchRcptHeader."User ID");
        if UserSetup9.FindSet then
            name := UserSetup9."Employee Name";
    end;

    var
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        Approver2: Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        Emp: Record Employee;
        USetup: Record "User Setup";
        ENo1: Code[10];
        Designation1: Code[50];
        JOBID: Record "ManPower Planning Lines";
        Designation2: Code[50];
        DesignationID2: Code[50];
        ENo3: Code[10];
        Designation: Code[50];
        DesignationID3: Code[50];
        ENo4: Code[10];
        Designation4: Code[50];
        DesignationID4: Code[50];
        CompanyInf: Record "Company Information";
        name: Text;
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        UserSetup9: Record "User Setup";
        Approver1: array[10] of Code[50];
        ENo: Code[10];
        ENo2: Code[10];
        DesignationID: Code[50];
        DesignationID1: Code[50];
}

