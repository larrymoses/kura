report 72015 "IPC Report-PDF"
{
    DefaultLayout = RDLC;
    Caption = 'Interim Payment Certificate Report';
    RDLCLayout = './Layouts/IPCReport.rdl';

    dataset
    {
        dataitem("Measurement &  Payment Header"; "Measurement &  Payment Header")
        {
            DataItemTableView = WHERE("Document Type" = CONST("Contractor Payment Request"));
            Column(Region;Region)
            {

            }
            
            column(Total_Cost_Including_VAT;"Contract Sum")
            {

            }
            column(Contractor_Request_Cert_Amount;"Contractor Request Cert Amount")
            {

            }
            column(Usage__Total_Cost_;"Usage (Total Cost)")
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {

            }
            column(CompanyAddress2; CompanyAddr[2])
            {

            }
            column(CompanyAddress3; CompanyAddr[3])
            {

            }
            column(CompanyAddress4; CompanyAddr[4])
            {

            }
            column(CompanyAddress5; CompanyAddr[5])
            {

            }
            column(CompanyAddress6; CompanyAddr[6])
            {

            }
            column(CompanyMotto; CompanyInformation.Motto)
            {

            }
            column(DocumentTitle; 'Interim Payment Certificate Report')
            {

            }
            column(SubmittedBy; SubmittedBy)
            {

            }
            column(CheckedBy; CheckedBy)
            {

            }
            column(TotalWorkdonelbl; TotalWorkdonelbl)
            {

            }
            column(Materialsonsitelbl; Materialsonsitelbl)
            {

            }
            column(Variationofpricelbl; Variationofpricelbl)
            {

            }
            column(Subtotallbl; Subtotallbl)
            {

            }
            column(Vatlbl; Vatlbl)
            {

            }
            column(TotalValueofworklbl; TotalValueofworklbl)
            {

            }
            column(Lesspreviouscertlbl; Lesspreviouscertlbl)
            {

            }
            column(Duetocontractorlnl; Duetocontractorlnl)
            {

            }
            column(ISOlbl; ISOlbl)
            {

            }
            column(Totalworkdoneprevcert; Totalworkdoneprevcert)
            {

            }
            column(Totalworkdonethiscert; Totalworkdonethiscert)
            {

            }
            column(Total_work_done_this_cert; Totalworkdonethiscert)
            {

            }
            column(Total_work_done_prev_cert; Totalworkdoneprevcert)
            {

            }
            column(MaterialsOnSitethiscert; MaterialsOnSitethiscert)
            {

            }
            column(MaterialsOnSiteprevcert; MaterialsOnSiteprevcert)
            {

            }
            column(VariationOfPricethiscert; VariationOfPricethiscert)
            {

            }
            column(VariationOfPriceprevcert; VariationOfPriceprevcert)
            {

            }
            column(SubTotalthisCert; SubTotalthisCert)
            {

            }
            column(SubTotalPrevCert; SubTotalPrevCert)
            {

            }
            column(VAT16Thiscert; (16 / 100) * Totalworkdonethiscert)
            {

            }
            column(VAT16Prevcert; (16 / 100) * Totalworkdoneprevcert)
            {

            }
            column(TotalValueofWorkthisCert; TotalValueofWorkthisCert)
            {

            }
            column(TotalValueofWorkPrevCert; TotalValueofWorkPrevCert)
            {

            }
            column(VAT6thisCert; (2 / 100) * SubTotalthisCert)
            {

            }
            column(VAT6PrevCert; (2 / 100) * SubTotalPrevCert)
            {

            }
            column(Retention5thisCert; (5 / 100) * TotalValueofWorkthisCert)
            {

            }
            column(Retention5PrevCert; (5 / 100) * TotalValueofWorkPrevCert)
            {

            }
            column(WTH3thisCert; (3 / 100) * SubTotalthisCert)
            {

            }
            column(WTH3PrevCert; (3 / 100) * SubTotalPrevCert)
            {

            }
            column(CumulativeDeductionsThisCert; CumulativeDeductionsThisCert)
            {

            }
            column(CumulativeDeductionsPrevCert; CumulativeDeductionsPrevCert)
            {

            }
            column(TotalPaymentPrevCert; TotalPaymentPrevCert)
            {

            }
            column(TotalPaymentThisCert; TotalPaymentThisCert)
            {

            }
            column(AdvancePaymentthisCert; AdvancePaymentthisCert)
            {

            }
            column(AdvancePaymentPrevCert; AdvancePaymentPrevCert)
            {

            }
            column(AdvanceRecoverythisCert; AdvanceRecoverythisCert)
            {

            }
            column(AdvanceRecoveryPrevCert; AdvanceRecoveryPrevCert)
            {

            }
            column(PaymentInterestThisCert; PaymentInterestThisCert)
            {

            }
            column(PaymentInterestPrevCert; PaymentInterestPrevCert)
            {

            }
            column(DamagesthisCert; DamagesthisCert)
            {

            }
            column(DamagesprevCert; DamagesprevCert)
            {

            }
            column(NetPayThisCert; NetPayThisCert)
            {

            }
            column(NetPayPrevCert; NetPayPrevCert)
            {

            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateApproved; Format(ApproverDate[2]))
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            column(PreparedBy;CustomFunction.GetEmployeeNameFromUserID(PreparedBy))
            {

            }
            column(PreparedDate;PreparedDate)
            {

            }

            column(DocumentNo_MeasurementPaymentHeader; "Measurement &  Payment Header"."Document No.")
            {
            }
            column(PaymentCertificateType_MeasurementPaymentHeader; "Measurement &  Payment Header"."Payment Certificate Type")
            {
            }
            column(DocumentDate_MeasurementPaymentHeader; "Measurement &  Payment Header"."Document Date")
            {
            }
            column(ProjectID_MeasurementPaymentHeader; "Measurement &  Payment Header"."Project ID")
            {
            }
            column(Description_MeasurementPaymentHeader; "Measurement &  Payment Header".Description)
            {
            }
            column(ContractorName_MeasurementPaymentHeader; "Measurement &  Payment Header"."Contractor Name")
            {
            }
            column(ProjectName_MeasurementPaymentHeader; "Measurement &  Payment Header"."Project Name")
            {
            }
            column(ProjectStartDate_MeasurementPaymentHeader; "Measurement &  Payment Header"."Project Start Date")
            {
            }
            column(ProjectEndDate_MeasurementPaymentHeader; "Measurement &  Payment Header"."Project End Date")
            {
            }
            column(EngineerRepresentativeNo_MeasurementPaymentHeader; "Measurement &  Payment Header"."Engineer Representative No.")
            {
            }
            column(EngineerRepresentativeName_MeasurementPaymentHeader; "Measurement &  Payment Header"."Engineer Representative Name")
            {
            }
            column(RegionID_MeasurementPaymentHeader; "Measurement &  Payment Header"."Region ID")
            {
            }
            column(TotalContractSum_MeasurementPaymentHeader; "Measurement &  Payment Header"."Total Contract Sum")
            {
            }
            column(IPCNumber_MeasurementPaymentHeader; "Measurement &  Payment Header"."IPC Number")
            {
            }
            dataitem("Contractor Request Task"; "Contractor Request Task")
            {
                DataItemLink = "Document No." = FIELD("Document No."),
                               "Document Type" = FIELD("Document Type");
                DataItemTableView = WHERE("Job Task Type" = CONST(Posting));
                column(JobTaskNo_ContractorRequestTask; "Contractor Request Task"."Job Task No.")
                {
                }
                column(Description_ContractorRequestTask; "Contractor Request Task".Description)
                {
                }
                column(ScheduleTotalCost_ContractorRequestTask; "Contractor Request Task"."Schedule (Total Cost)")
                {
                }
                column(UsageTotalCost_ContractorRequestTask; "Contractor Request Task"."Usage (Total Cost)")
                {
                }
                column(RemainingTotalCost_ContractorRequestTask; "Contractor Request Task"."Remaining (Total Cost)")
                {
                }
                column(ThisCertificateAmount_ContractorRequestTask; "Contractor Request Task"."This Certificate Amount")
                {
                }
            }
            dataitem("Contractor Request Plan Line"; "Contractor Request Plan Line")
            {
                DataItemLink = "Document No" = FIELD("Document No."),
                               "Document Type" = FIELD("Document Type");
                column(LineNo_ContractorRequestPlanLine; "Contractor Request Plan Line"."Line No.")
                {
                }
                column(Type_ContractorRequestPlanLine; "Contractor Request Plan Line".Type)
                {
                }
                column(No_ContractorRequestPlanLine; "Contractor Request Plan Line"."No.")
                {
                }
                column(Description_ContractorRequestPlanLine; "Contractor Request Plan Line".Description)
                {
                }
                column(Quantity_ContractorRequestPlanLine; "Contractor Request Plan Line".Quantity)
                {
                }
                column(DirectUnitCostLCY_ContractorRequestPlanLine; "Contractor Request Plan Line"."Direct Unit Cost (LCY)")
                {
                }
                column(VATBusPostingGroup_ContractorRequestPlanLine; "Contractor Request Plan Line"."VAT Bus. Posting Group")
                {
                }
                column(VATProdPostingGroup_ContractorRequestPlanLine; "Contractor Request Plan Line"."VAT Prod. Posting Group")
                {
                }
                column(JobTaskNo_ContractorRequestPlanLine; "Contractor Request Plan Line"."Job Task No.")
                {
                }
                column(LineAmountLCY_ContractorRequestPlanLine; "Contractor Request Plan Line"."Line Amount (LCY)")
                {
                }
                column(UnitCost_ContractorRequestPlanLine; "Contractor Request Plan Line"."Unit Cost")
                {
                }
                column(QtytoOrder_ContractorRequestPlanLine; "Contractor Request Plan Line"."Qty. to Order")
                {
                }
                column(UnitofMeasure_ContractorRequestPlanLine; "Contractor Request Plan Line"."Unit of Measure")
                {
                }
                column(QtyCertifiedToDate_ContractorRequestPlanLine; "Contractor Request Plan Line"."Qty Certified To Date")
                {
                }
                column(TotalCostLCY_ContractorRequestPlanLine; "Contractor Request Plan Line"."Total Cost (LCY)")
                {
                }
                column(TotalCost_ContractorRequestPlanLine; "Contractor Request Plan Line"."Total Cost")
                {
                }
                column(UnitofMeasureCode_ContractorRequestPlanLine; "Contractor Request Plan Line"."Unit of Measure Code")
                {
                }
                column(TotalCostExclVAT_ContractorRequestPlanLine; "Contractor Request Plan Line"."Total Cost Excl. VAT")
                {
                }
            }
            dataitem("Material On site"; "Material On site")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"),
                               "Document No." = FIELD("Document No.");
                column(DocumentType_MaterialOnsite; "Material On site"."Document Type")
                {
                }
                column(DocumentNo_MaterialOnsite; "Material On site"."Document No.")
                {
                }
                column(MaterialCode_MaterialOnsite; "Material On site"."Material Code")
                {
                }
                column(MaterialDescription_MaterialOnsite; "Material On site"."Material Description")
                {
                }
                column(UnitOfMeasure_MaterialOnsite; "Material On site"."Unit Of Measure")
                {
                }
                column(LineNo_MaterialOnsite; "Material On site"."Line No.")
                {
                }
                column(PreviosQuantity_MaterialOnsite; "Material On site"."Previos Quantity")
                {
                }
                column(CurrentQuantty_MaterialOnsite; "Material On site"."Current Quantty")
                {
                }
                column(Rate_MaterialOnsite; "Material On site".Rate)
                {
                }
                column(TotalAmount_MaterialOnsite; "Material On site"."Total Amount")
                {
                }
            }
            trigger OnPreDataItem()
            begin
                SubTotalthisCert := 0;
                CumulativeDeductionsThisCert := 0;
                CumulativeDeductionsPrevCert := 0;
            end;

            trigger OnAfterGetRecord()
            begin
                CalcFields("Usage (Total Cost)","Total Cost Including VAT","Contractor Request Cert Amount");
                CompanyInfo.get();
                CompanyInfo.CalcFields(Picture);
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Region ID", ResponsibilityCenter, CompanyInformation, CompanyAddr);
                DimensionValue.Reset();
                DimensionValue.SetRange("Global Dimension No.", 1);
                DimensionValue.SetRange(Code, "Global Dimension 1 Code");
                if DimensionValue.FindFirst() then begin
                    Region := DimensionValue.Name;
                end;
                // Calcfields("Contract Sum");
                Contractorplanline.Reset();
                Contractorplanline.SetRange("Document Type", "Document Type");
                Contractorplanline.SetRange("Document No", "Document No.");
                Contractorplanline.SetRange("Job No.", "Project ID");
                if Contractorplanline.FindSet() then begin
                    Contractorplanline.CalcSums("Total Cost Excl. VAT");
                    //Totalworkdonethiscert := 0;
                end;

                ContractorRequestTask.Reset();
                ContractorRequestTask.SetRange("Document Type", "Document Type");
                ContractorRequestTask.SetRange("Document No.", "Document No.");
                ContractorRequestTask.SetRange("Job No.", "Project ID");
                if ContractorRequestTask.FindSet() then begin
                    Totalworkdonethiscert := 0;
                   // Totalworkdoneprevcert := 0;
                    repeat
                        ContractorRequestTask.CalcFields("This Certificate Amount", "Usage (Total Cost)");
                        Totalworkdonethiscert += ContractorRequestTask."This Certificate Amount";
                       // Totalworkdoneprevcert += ContractorRequestTask."Usage (Total Cost)";
                    until ContractorRequestTask.Next() = 0;
                end;
                 ContractorRequestTaskB.Reset();
                ContractorRequestTaskB.SetRange("Document Type", "Document Type");
                ContractorRequestTaskB.SetRange("Document No.", "Document No.");
                ContractorRequestTaskB.SetRange("Job No.", "Project ID");
                ContractorRequestTaskB.SetFilter("Posting Date Filter",'..%1',"Measurement &  Payment Header"."Document Date");
                if ContractorRequestTaskB.FindSet() then begin
                  //  Totalworkdonethiscert := 0;
                    Totalworkdoneprevcert := 0;
                    repeat
                        ContractorRequestTaskB.CalcFields("This Certificate Amount", "Usage (Total Cost)");
                       // Totalworkdonethiscert += ContractorRequestTaskB."This Certificate Amount";
                        Totalworkdoneprevcert += ContractorRequestTaskB."Usage (Total Cost)";
                    until ContractorRequestTaskB.Next() = 0;
                end;
                SubTotalthisCert := Totalworkdonethiscert + MaterialsOnSitethiscert + VariationOfPricethiscert;
                SubTotalPrevCert := TotalworkdonePrevcert + MaterialsOnSiteprevcert + VariationOfPriceprevcert;
                TotalValueofWorkthisCert := SubTotalthisCert + ((16 / 100) * Totalworkdonethiscert);
                TotalValueofWorkPrevCert := SubTotalPrevCert + ((16 / 100) * Totalworkdoneprevcert);
                CumulativeDeductionsThisCert := ((5 / 100) * TotalValueofWorkthisCert) + ((3 / 100) * SubTotalthisCert) + ((2 / 100) * SubTotalthisCert);
                CumulativeDeductionsPrevCert := ((5 / 100) * TotalValueofWorkPrevCert) + ((2 / 100) * SubTotalPrevCert) + ((3 / 100) * SubTotalPrevCert);
                TotalPaymentThisCert := TotalValueofWorkthisCert - CumulativeDeductionsThisCert;
                TotalPaymentPrevCert := TotalValueofWorkPrevCert - CumulativeDeductionsPrevCert;
                 NetPayThisCert := TotalPaymentThisCert - (AdvancePaymentthisCert + AdvanceRecoverythisCert + PaymentInterestThisCert + DamagesthisCert);
                NetPayPrevCert := TotalPaymentPrevCert - (AdvancePaymentPrevCert + AdvanceRecoveryPrevCert + PaymentInterestPrevCert + DamagesPrevCert);

                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID", 72188);
                ApprovalEntries.SetRange("Document No.", "Document No.");
                ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                if ApprovalEntries.Findset() then begin
                    i := 0;
                    repeat
                        i := i + 1;
                        if i = 1 then begin
                            PreparedBy := ApprovalEntries."Sender ID";
                            PreparedDate := DT2Date(ApprovalEntries."Date-Time Sent for Approval");
                            if UserSetup.Get(PreparedBy) then
                                UserSetup.CalcFields(Picture);
                            Approver[1] := ApprovalEntries."Approver ID";
                            ApproverDate[1] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup1.Get(Approver[1]) then
                                UserSetup1.CalcFields(Picture);
                        end;
                        if i = 2 then begin
                            Approver[2] := ApprovalEntries."Approver ID";
                            ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup2.Get(Approver[2]) then
                                UserSetup2.CalcFields(Picture);
                        end;
                        if i = 3 then begin
                            Approver[3] := ApprovalEntries."Approver ID";
                            ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                            if UserSetup3.Get(Approver[3]) then
                                UserSetup3.CalcFields(Picture);
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
    var
        CompanyInfo: Record "Company Information";
        DimensionValue: Record "Dimension Value";
        Region: Text;
        DocumentTitle: Label 'SUMMARY OF STATEMENT FOR PAYMENT OF ACCOUNT';
        SubmittedBy: Label 'Submitted by';
        CheckedBy: Label 'Checked by';
        TotalWorkdonelbl: Label 'TOTAL WORK DONE';
        Materialsonsitelbl: Label 'MATERIAL ON SITE';
        Variationofpricelbl: Label 'VARIATION OF PRICE';
        Subtotallbl: Label 'SUB-TOTAL (A+B+C)';
        Vatlbl: Label 'ADD V.A.T @ 16%';
        TotalValueofworklbl: Label 'TOTAL VALUE OF WORK';
        Lesspreviouscertlbl: Label 'LESS PREVIOUS CERTIFICATES';
        Duetocontractorlnl: Label 'NOW DUE TO CONTRACTOR';
        ISOlbl: Label 'ISO 9001:2015';
        Contractorplanline: Record "Contractor Request Plan Line";
        ContractorRequestTask: Record "Contractor Request Task";
        ContractorRequestTaskB: Record "Contractor Request Task";
        MaterialsOnSite: Record "Material On site";
        Totalworkdonethiscert: Decimal;
        Totalworkdoneprevcert: Decimal;
        MaterialsOnSitethiscert: Decimal;
        MaterialsOnSiteprevcert: Decimal;
        VariationOfPricethiscert: Decimal;
        VariationOfPriceprevcert: Decimal;
        SubTotalthisCert: Decimal;
        SubTotalPrevCert: Decimal;
        TotalValueofWorkthisCert: Decimal;
        TotalValueofWorkPrevCert: Decimal;
        CumulativeDeductionsPrevCert: Decimal;
        CumulativeDeductionsThisCert: Decimal;
        TotalPaymentPrevCert: Decimal;
        TotalPaymentThisCert: Decimal;
        AdvancePaymentthisCert: Decimal;
        AdvancePaymentPrevCert: Decimal;
        AdvanceRecoverythisCert: Decimal;
        AdvanceRecoveryPrevCert: Decimal;
        PaymentInterestThisCert: Decimal;
        PaymentInterestPrevCert: Decimal;
        DamagesthisCert: Decimal;
        DamagesprevCert: Decimal;
        NetPayThisCert: Decimal;
        NetPayPrevCert: Decimal;
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        PreparedBy: Code[50];
        PreparedDate: Date;
        CustomFunction:Codeunit "Custom Function";
}

