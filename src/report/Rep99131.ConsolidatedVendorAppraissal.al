report 99131 "Consolidated Vendor Appraissal"
{
    ApplicationArea = All;
    Caption = 'Consolidated Vendor Appraissal';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './Layouts/VendorsAppraisal.rdl';
    dataset
    {
        dataitem(VendorAppraisalVoucher; "Vendor Appraisal Voucher")
        {
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(Motto; CompanyInfo.Motto)
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
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(Appraisal_Period; "Appraisal Period")
            {

            }
            column(Document_Date; "Document Date")
            {

            }
            column(Vendor_No_; "Vendor No.")
            {

            }
            column(Vendor_Name; "Vendor Name")
            {

            }
            column(Tendor_Category; "Tendor Category")
            {

            }
            column(Tender_Category_Description; "Tender Category Description")
            {

            }
            column(Appraisal_Passmark; AppraisalPassmark)
            {

            }
            column(Evaluation_Result; EvaluationResult)
            {

            }
            column(Average_Score; AverageScore)
            {

            }
            column(Remarks; "Recommendation(s)")
            {

            }
            column(Category; Category)
            {

            }
            column(CategoryDescription; CategoryDescription.ToUpper())
            {

            }
            column(Period;Period)
            {

            }
            trigger OnPreDataItem()
            begin
                if Category <> '' then
                SetRange("Tendor Category",Category);
                if Period <> '' then
                SetRange("Appraisal Period",Period);
                SetRange("Approval Status","Approval Status"::Approved);
            end;
            trigger OnAfterGetRecord()
            begin
                Score := 0;
                LinesCount := 0;
                Scores.Reset();
                Scores.SetRange(Code, "Document No");
                if Scores.FindSet() then begin
                    repeat
                        Score += Scores."Score %";
                        LinesCount += 1;
                    until Scores.Next() = 0;
                end;
                AppraisalPassmark := 0;
                AverageScore := 0;
                if LinesCount <> 0 then
                AverageScore := Score / LinesCount;
                if ProcurementCategory.Get("Tendor Category") then begin
                    AppraisalPassmark := ProcurementCategory."Appraisal Passmark";
                    if AverageScore >= AppraisalPassmark then
                        EvaluationResult := EvaluationResult::Pass else
                        EvaluationResult := EvaluationResult::Fail;
                end;

            end;
            // dataitem("Vendor Evaluation Score Entry";"Vendor Evaluation Score Entry")
            // {
            //     DataItemLink = code=field("Document No");
            // }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {
                    field(Period;Period)
                    {
                        ApplicationArea = All;
                        TableRelation = "Vendor Appraisal Period";
                    }
                    field(Category; Category)
                    {
                        ApplicationArea = All;
                        TableRelation = "Procurement Category".Code;
                    }
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        if CompanyInfo.get() then
            CompanyInfo.CalcFields(Picture);
        if UserSetup.Get(UserId) then
            FormatAddr.GetCompanyAddr(UserSetup."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        if ProcurementCategory.Get(Category) then
            CategoryDescription := ProcurementCategory.Description;
    end;

    var
        AppraisalPassmark: Decimal;
        ProcurementCategory: Record "Procurement Category";
        EvaluationResult: Option Fail,Pass;
        AverageScore: Decimal;
        Scores: Record "Vendor Evaluation Score Entry";
        Score: Decimal;
        LinesCount: Integer;
        CustomFunction: Codeunit "Custom Function";
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
        UserSetup: Record "User Setup";
        Country: Text[50];
        CountryRegion: Record "Country/Region";
        Category: Code[10];
        CategoryDescription: Text;
        Period:Code[10];
}
