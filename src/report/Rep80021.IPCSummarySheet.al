report 80021 "IPC Summary Sheet"
{
    ApplicationArea = Basic;
    Caption = 'IPC Summary Sheet';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/IPCSummarySheet.rdl';
    dataset
    {
        dataitem(MeasurementPaymentHeader; "Measurement &  Payment Header")
        {
            column(Total_Cost_Including_VAT; "Total Cost Including VAT")
            {

            }
            column(Contractor_Request_Cert_Amount; "Contractor Request Cert Amount")
            {

            }
            column(Usage__Total_Cost_; "Usage (Total Cost)")
            {

            }
            column(DocumentTitle; DocumentTitle)
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
            column(ProjectNo; "Project No")
            {
            }
            column(ContractorNo; "Contractor No")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(ContractSum; "Contract Sum")
            {
            }
            column(ContractorName; "Contractor Name")
            {
            }
            column(ContractID; "Contract ID")
            {
            }
            column(Region; Region)
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(TotalContractSum; "Total Contract Sum")
            {
            }
            column(WorksEndChainage; "Works End Chainage")
            {
            }
            column(WorksStartChainage; "Works Start Chainage")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            column(Companylogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress1; CompanyInfo."Address")
            {

            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyHeadedBy; CompanyInfo."Headed By")
            {
            }
            column(CompanyMotto; CompanyInfo.Motto)
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
                column(VAT16Prevcert; (16 / 100) *Totalworkdoneprevcert)
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
                column(NetPayPrevCert;NetPayPrevCert)
                {

                }


           
             trigger OnPreDataItem()
                begin
                    SubTotalthisCert := 0;
                    CumulativeDeductionsThisCert := 0;
                    CumulativeDeductionsPrevCert := 0;
                end;
            trigger OnAfterGetRecord()
            begin
                CompanyInfo.get();
                CompanyInfo.CalcFields(Picture);
                DimensionValue.Reset();
                DimensionValue.SetRange("Global Dimension No.", 1);
                DimensionValue.SetRange(Code, "Global Dimension 1 Code");
                if DimensionValue.FindFirst() then begin
                    Region := DimensionValue.Name;
                end;
                CalcFields("Usage (Total Cost)", "Total Cost Including VAT", "Contractor Request Cert Amount");
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
                    //Totalworkdoneprevcert := 0;
                    repeat
                        ContractorRequestTask.CalcFields("This Certificate Amount", "Usage (Total Cost)");
                        Totalworkdonethiscert += ContractorRequestTask."This Certificate Amount";
                        //Totalworkdoneprevcert += ContractorRequestTask."Usage (Total Cost)";
                    until ContractorRequestTask.Next() = 0;
                end;
                 ContractorRequestTaskB.Reset();
                ContractorRequestTaskB.SetRange("Document Type", "Document Type");
                ContractorRequestTaskB.SetRange("Document No.", "Document No.");
                ContractorRequestTaskB.SetRange("Job No.", "Project ID");
                ContractorRequestTaskB.Setfilter("Posting Date Filter",'..%1',MeasurementPaymentHeader."Document Date");
                if ContractorRequestTaskB.FindSet() then begin
                    //Totalworkdonethiscert := 0;
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
        ContractorRequestTaskB: Record "Contractor Request Task";
}
