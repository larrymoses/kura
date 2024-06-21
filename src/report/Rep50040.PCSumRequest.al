report 50040 "PC Sum Request"
{
    ApplicationArea = All;
    Caption = 'PC Sum Request';
    RDLCLayout = './Layouts/PC Sum Request.rdlc';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(MeasurementPaymentHeader; "Measurement &  Payment Header")
        {
            RequestFilterFields = "Project ID", "Document No.";
            column(AdvanceCustomerName; "Advance Customer Name")
            {
            }
            column(AdvanceCustomerNo; "Advance Customer No")
            {
            }
            column(AdvancePaymentAmountLCY; "Advance Payment Amount(LCY)")
            {
            }
            column(AdvancePaymentGLAccount; "Advance Payment G/L Account")
            {
            }
            column(AdvancePaymentJustification; "Advance Payment Justification")
            {
            }
            column(AdvancePaymentSecurityID; "Advance Payment Security ID")
            {
            }
            column(AdvancePaymentSettledLCY; "Advance Payment Settled(LCY)")
            {
            }
            column(AdvancePmtGuaExpiryDate; "Advance Pmt Gua. Expiry Date")
            {
            }
            column(AdvanceRequestNo; "Advance Request No")
            {
            }
            column(ApprovedAdvanceAmount; "Approved Advance Amount")
            {
            }
            column(AssignedTo; "Assigned To")
            {
            }
            column(CIT; "C.I.T")
            {
            }
            column(CertifiedAmount; "Certified Amount")
            {
            }
            column(CloseOutJustification; "Close-Out Justification")
            {
            }
            column(CommencementOrderNo; "Commencement Order No.")
            {
            }

            column(ContractID; "Contract ID")
            {
            }
            column(ContractPaymentPlan; "Contract Payment Plan")
            {
            }
            column(ContractSum; "Contract Sum")
            {
            }
            column(ContractorName; "Contractor Name")
            {
            }
            column(ContractorNo; "Contractor No")
            {
            }
            column(ContractorRepEmail; "Contractor Rep. Email")
            {
            }
            column(ContractorRepresentativeRole; "Contractor Representative Role")
            {
            }
            column(ContractorRequestCertAmount; "Contractor Request Cert Amount")
            {
            }
            column(CountyID; "County ID")
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(CreatedDateTime; "Created DateTime")
            {
            }
            column(DateApproved; "Date Approved")
            {
            }
            column(DateSentforApproval; "Date Sent for Approval")
            {
            }
            column(DefectsLiabilityEndDate; "Defects Liability End Date")
            {
            }
            column(DefectsLiabilityPeriod; "Defects Liability Period")
            {
            }
            column(DefectsLiabilityStartDate; "Defects Liability Start Date")
            {
            }
            column(DepartmentID; "Department ID")
            {
            }
            column(Description; Description)
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            column(DirectorateID; "Directorate ID")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(EngineerRepresentativeName; "Engineer Representative Name")
            {
            }
            column(EngineerRepresentativeNo; "Engineer Representative No.")
            {
            }
            column(FromDate; "From Date")
            {
            }
            column(FunderName; "Funder Name")
            {
            }
            column(FundingAgencyID; "Funding Agency ID")
            {
            }
            column(FundingSourceID; "Funding Source ID")
            {
            }
            column(Generate; Generate)
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(GrossWorksValuation; "Gross Works Valuation")
            {
            }
            column(IPCNumber; "IPC Number")
            {
            }
            column(Import; Import)
            {
            }
            column(InvoiceNo; "Invoice No")
            {
            }
            column(KeRRABudgetCode; "KeRRA Budget Code")
            {
            }
            column(LessAdvancePayment; "Less Advance Payment")
            {
            }
            column(LessRetentionAmount; "Less Retention Amount")
            {
            }
            column(MilestoneCode; "Milestone Code")
            {
            }
            column(NoSeries; "No Series")
            {
            }
            column(OpeningDate; "Opening Date")
            {
            }
            column(OutstandingBalancetoDate; "Outstanding Balance to Date")
            {
            }
            column(PVNumber; "PV Number")
            {
            }
            column(PaymentCertificateType; "Payment Certificate Type")
            {
            }
            column(PaymentsToDate; "Payments To Date")
            {
            }
            column(PerformanceSecExpiryDate; "Performance Sec. Expiry Date")
            {
            }
            column(PerformanceSecurityID; "Performance Security ID")
            {
            }
            column(PortalStatus; "Portal Status")
            {
            }
            column(Posted; Posted)
            {
            }
            column(PostedBy; "Posted By")
            {
            }
            column(PreviousCertificateAmount; "Previous Certificate Amount")
            {
            }
            column(PrimaryContractorRep; "Primary Contractor Rep.")
            {
            }
            column(ProjectEndDate; "Project End Date")
            {
            }
            column(ProjectEngineerName; "Project Engineer Name")
            {
            }
            column(ProjectEngineerNo; "Project Engineer No.")
            {
            }
            column(ProjectID; "Project ID")
            {
            }
            column(ProjectLocation; "Project Location")
            {
            }
            column(ProjectManager; "Project Manager")
            {
            }
            column(ProjectName; "Project Name")
            {
            }
            column(ProjectNo; "Project No")
            {
            }
            column(ProjectStartDate; "Project Start Date")
            {
            }
            column(ReasonForReversal; "Reason For Reversal")
            {
            }
            column(RegionID; "Region ID")
            {
            }
            column(RejectionRemarks; "Rejection Remarks")
            {
            }
            column(RequestedAdvancePaymentLCY; "Requested Advance Payment(LCY)")
            {
            }
            column(ResidentEngineerMail; "Resident Engineer Mail")
            {
            }
            column(ResidentEngineerName; "Resident Engineer Name")
            {
            }
            column(ResidentEngineerNo; "Resident Engineer No.")
            {
            }
            column(Retention; "Retention %")
            {
            }
            column(Reversed; Reversed)
            {
            }
            column(ReversedBy; "Reversed By")
            {
            }
            column(RoadCode; "Road Code")
            {
            }
            column(RoadSectionNo; "Road Section No.")
            {
            }
            column(SectionEndChainage; "Section End Chainage")
            {
            }
            column(SectionName; "Section Name")
            {
            }
            column(SectionStartChainage; "Section Start Chainage")
            {
            }
            column(SettledAmount; "Settled Amount")
            {
            }
            column(Status; Status)
            {
            }
            column(SubmissionDate; "Submission Date")
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
            column(TakeOverInspectionDate; "Take Over Inspection Date")
            {
            }
            column(TakeOverInspectionNo; "Take Over Inspection No.")
            {
            }
            column(TakingOverInspectionNo; "Taking Over Inspection No.")
            {
            }
            column(TakingOverLengthKM; "Taking Over Length (KM)")
            {
            }
            column(TakingOverRequestNo; "Taking Over Request No.")
            {
            }
            column(ThisCertificateAmount; "This Certificate Amount")
            {
            }
            column(ToDate; "To Date")
            {
            }
            column(TotalSectionLengthKMs; "Total  Section Length (KMs)")
            {
            }
            column(TotalContractSum; "Total Contract Sum")
            {
            }
            column(TotalCostIncludingVAT; "Total Cost Including VAT")
            {
            }
            column(UsageTotalCost; "Usage (Total Cost)")
            {
            }
            column(WorkExecutionPlan1D; "Work Execution Plan 1D")
            {
            }
            column(WorkplannedLengthKM; "Workplanned Length (KM)")
            {
            }
            column(WorksEndChainage; "Works End Chainage")
            {
            }
            column(WorksStartChainage; "Works Start Chainage")
            {
            }
            dataitem(ContractorRequestPlanLine; "Contractor Request Plan Line")
            {
                DataItemLink = "Document No" = field("Document No.");
                column(AgencyCommision; "Agency Commision %")
                {
                }
                column(AgencyCommisionAmount; "Agency Commision Amount")
                {
                }
                column(BidAmount; "Bid Amount")
                {
                }
                column(BidQuantity; "Bid Quantity")
                {
                }
                column(BidRate; "Bid Rate")
                {
                }
                column(BillItemNo; "Bill Item No")
                {
                }
                column(BinCode; "Bin Code")
                {
                }
                column(BudgetType; "Budget Type")
                {
                }
                column(ConstituencyID; "Constituency ID")
                {
                }
                column(ContractLine; "Contract Line")
                {
                }
                column(CostFactor; "Cost Factor")
                {
                }
                column(CountryRegionCode; "Country/Region Code")
                {
                }
                column(CountyID1; "County ID")
                {
                }
                column(CurrencyCode; "Currency Code")
                {
                }
                column(CurrencyDate; "Currency Date")
                {
                }
                column(CurrencyFactor; "Currency Factor")
                {
                }
                column(CustomerPriceGroup; "Customer Price Group")
                {
                }
                column(DefaultResourceCostAccount; "Default Resource Cost Account")
                {
                }
                column(DepartmentCode; "Department Code")
                {
                }
                // column(Description; Description)
                // {
                // }
                column(Description2; "Description 2")
                {
                }
                column(DirectUnitCostLCY; "Direct Unit Cost (LCY)")
                {
                }
                column(DirectorateCode; "Directorate Code")
                {
                }
                column(Division; Division)
                {
                }
                // column(DocumentDate; "Document Date")
                // {
                // }
                // column(DocumentNo; "Document No")
                // {
                // }
                // column(DocumentNo; "Document No.")
                // {
                // }
                // column(DocumentType; "Document Type")
                // {
                // }
                column(GenBusPostingGroup; "Gen. Bus. Posting Group")
                {
                }
                column(GenProdPostingGroup; "Gen. Prod. Posting Group")
                {
                }
                column(HeaderNo; "Header No.")
                {
                }
                column(Instruction; Instruction)
                {
                }
                column(InstructionCode; "Instruction Code")
                {
                }
                column(InvoicedAmountLCY; "Invoiced Amount (LCY)")
                {
                }
                column(InvoicedCostAmountLCY; "Invoiced Cost Amount (LCY)")
                {
                }
                column(JobBudgetTemplates; "Job Budget Templates")
                {
                }
                column(JobContractEntryNo; "Job Contract Entry No.")
                {
                }
                column(JobLedgerEntryNo; "Job Ledger Entry No.")
                {
                }
                column(JobNo; "Job No.")
                {
                }
                column(JobTaskNo; "Job Task No.")
                {
                }
                column(Labour; "Labour (%)")
                {
                }
                column(LastDateModified; "Last Date Modified")
                {
                }
                column(LastProjVariationOrderNo; "Last Proj Variation Order No.")
                {
                }
                column(LedgerEntryNo; "Ledger Entry No.")
                {
                }
                column(LedgerEntryType; "Ledger Entry Type")
                {
                }
                column(LineAmount; "Line Amount")
                {
                }
                column(LineAmountLCY; "Line Amount (LCY)")
                {
                }
                column(LineDiscount; "Line Discount %")
                {
                }
                column(LineDiscountAmount; "Line Discount Amount")
                {
                }
                column(LineDiscountAmountLCY; "Line Discount Amount (LCY)")
                {
                }
                column(LineNo; "Line No.")
                {
                }
                column(LineType; "Line Type")
                {
                }
                column(LocationCode; "Location Code")
                {
                }
                column(LotNo; "Lot No.")
                {
                }
                column(MeasuredQuantity; "Measured Quantity")
                {
                }
                column(MediaOrder; "Media Order")
                {
                }
                column(NetAmount; "Net Amount")
                {
                }
                column(No; "No.")
                {
                }
                column(Ordered; Ordered)
                {
                }
                column(Planned; Planned)
                {
                }
                column(PlannedDeliveryDate; "Planned Delivery Date")
                {
                }
                column(PlannedRateAmount; "Planned Rate Amount")
                {
                }
                column(PlanningDate; "Planning Date")
                {
                }
                column(PostedLineAmount; "Posted Line Amount")
                {
                }
                column(PostedLineAmountLCY; "Posted Line Amount (LCY)")
                {
                }
                column(PostedTotalCost; "Posted Total Cost")
                {
                }
                column(PostedTotalCostLCY; "Posted Total Cost (LCY)")
                {
                }
                column(PromisedDeliveryDate; "Promised Delivery Date")
                {
                }
                column(QtyCertifiedToDate; "Qty Certified To Date")
                {
                }
                column(QtyInvoiced; "Qty. Invoiced")
                {
                }
                column(QtyOrdered; "Qty. Ordered")
                {
                }
                column(QtyPosted; "Qty. Posted")
                {
                }
                column(QtyTransferredtoInvoice; "Qty. Transferred to Invoice")
                {
                }
                column(QtyperUnitofMeasure; "Qty. per Unit of Measure")
                {
                }
                column(QtytoInvoice; "Qty. to Invoice")
                {
                }
                column(QtytoOrder; "Qty. to Order")
                {
                }
                column(QtytoTransfertoInvoice; "Qty. to Transfer to Invoice")
                {
                }
                column(QtytoTransfertoJournal; "Qty. to Transfer to Journal")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(QuantityBase; "Quantity (Base)")
                {
                }
                // column(RegionID; "Region ID")
                // {
                // }
                column(RemainingLineAmount; "Remaining Line Amount")
                {
                }
                column(RemainingLineAmountLCY; "Remaining Line Amount (LCY)")
                {
                }
                // column(RemainingQty1; "Remaining Qty")
                // {
                // }
                column(RemainingQty; "Remaining Qty.")
                {
                }
                column(RemainingQtyBase; "Remaining Qty. (Base)")
                {
                }
                column(RemainingTotalCost; "Remaining Total Cost")
                {
                }
                column(RemainingTotalCostLCY; "Remaining Total Cost (LCY)")
                {
                }
                column(RequestedDeliveryDate; "Requested Delivery Date")
                {
                }
                column(Reserve; Reserve)
                {
                }
                column(ReservedQtyBase; "Reserved Qty. (Base)")
                {
                }
                column(ReservedQuantity; "Reserved Quantity")
                {
                }
                column(ResourceGroupNo; "Resource Group No.")
                {
                }
                column(RoadActivityCategories; "Road Activity Categories")
                {
                }
                column(RoadActivitySubCategory; "Road Activity Sub-Category")
                {
                }
                column(RoadCode1; "Road Code")
                {
                }
                column(RoadSectionNo1; "Road Section No")
                {
                }
                column(RoadTechnology; "Road Technology")
                {
                }
                column(ScheduleLine; "Schedule Line")
                {
                }
                column(Select; Select)
                {
                }
                column(SerialNo; "Serial No.")
                {
                }
                column(ServiceOrderNo; "Service Order No.")
                {
                }
                column(StationName; "Station Name")
                {
                }
                column(StationNo; "Station No")
                {
                }
                column(Status1; Status)
                {
                }
                column(SystemCreatedEntry; "System-Created Entry")
                {
                }

                column(Text; "Text")
                {
                }
                column(TotalCost; "Total Cost")
                {
                }
                column(TotalCostLCY; "Total Cost (LCY)")
                {
                }
                column(TotalCostExclVAT; "Total Cost Excl. VAT")
                {
                }
                column(TotalCostInclVAT; "Total Cost Incl. VAT")
                {
                }
                column(TotalCostIncludingVAT1; "Total Cost Including VAT")
                {
                }
                column(TotalPrice; "Total Price")
                {
                }
                column(TotalPriceLCY; "Total Price (LCY)")
                {
                }
                column(TotalRequestedAmount; "Total Requested Amount")
                {
                }
                column(Type; "Type")
                {
                }
                column(UnitCost; "Unit Cost")
                {
                }
                column(UnitCostLCY; "Unit Cost (LCY)")
                {
                }
                column(UnitPrice; "Unit Price")
                {
                }
                column(UnitPriceLCY; "Unit Price (LCY)")
                {
                }
                column(UnitofMeasure; "Unit of Measure")
                {
                }
                column(UnitofMeasureCode; "Unit of Measure Code")
                {
                }
                column(UsageLink; "Usage Link")
                {
                }
                column(UserID; "User ID")
                {
                }
                column(VAT; "VAT %")
                {
                }
                column(VATBusPostingGroup; "VAT Bus. Posting Group")
                {
                }
                column(VATLineAmount; "VAT Line Amount")
                {
                }
                column(VATLineDiscountAmount; "VAT Line Discount Amount")
                {
                }
                column(VATProdPostingGroup; "VAT Prod. Posting Group")
                {
                }
                column(VATUnitPrice; "VAT Unit Price")
                {
                }
                column(VariantCode; "Variant Code")
                {
                }
                column(VendorName; "Vendor Name")
                {
                }
                column(VendorNo; "Vendor No")
                {
                }
                column(WorkTypeCode; "Work Type Code")
                {
                }
            }
        }
    }
}

