report 50011 "KRA Classifications"
{
    ApplicationArea = All;
    Caption = 'Validate Deductions';
    ProcessingOnly = true;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(AssignmentMatrixX; "Assignment Matrix-X")
        {
            RequestFilterFields = "Payroll Period", "Pay Period", Type;


            trigger OnAfterGetRecord()
            var
                Earnings: Record EarningsX;
                DEDUCTIONS: RECORD DeductionsX;
                eMPLOYeE: REcORD 5200;
                AssignMatrix: rECOrD 69009;
            begin
                //   if Earnings.Get(AssignmentMatrixX.Code) then
                //     AssignmentMatrixX."KRA Classification" := Earnings."KRA Classification";

                IF AssignmentMatrixX.type = AssignmentMatrixX.Type::Payment then begin
                    repeat
                        if AssignmentMatrixX.Amount < 0 then
                            AssignmentMatrixX.Amount := -(AssignmentMatrixX.Amount);
                        if AssignmentMatrixX."Employer Amount" < 0 then
                            AssignmentMatrixX."Employer Amount" := -(AssignmentMatrixX."Employer Amount");

                        AssignmentMatrixX.Modify();
                    until AssignmentMatrixX.next = 0;
                end;

                IF AssignmentMatrixX.type = AssignmentMatrixX.Type::Deduction then begin
                    repeat
                        if AssignmentMatrixX.Amount > 0 then
                            AssignmentMatrixX.Amount := -(AssignmentMatrixX.Amount);
                        if AssignmentMatrixX."Employer Amount" > 0 then
                            AssignmentMatrixX."Employer Amount" := -(AssignmentMatrixX."Employer Amount");

                        AssignmentMatrixX.Modify();
                    until AssignmentMatrixX.next = 0;
                end;
                //deleteall

                AssignmentMatrixX.Reset();
                AssignmentMatrixX.SetRange(AssignmentMatrixX.code, 'D018');
                AssignmentMatrixX.SetRange(AssignmentMatrixX."Payroll Period", AssignmentMatrixX."Payroll Period");
                if AssignmentMatrixX.FindSet then begin
                    AssignmentMatrixX.DeleteAll();
                end;

                //insert
                eMPLOYeE.Reset();
                eMPLOYeE.SetRange(eMPLOYeE.Status, eMPLOYeE.Status::Active);
                eMPLOYeE.SetRange(eMPLOYeE."Pay Period Filter", AssignmentMatrixX."Payroll Period");
                iF eMPLOYeE.FindSet() thEN begin
                    repeat

                        AssignMatrix.Init;
                        AssignMatrix."Employee No" := eMPLOYeE."No.";
                        AssignMatrix.Type := AssignmentMatrixX.Type::Deduction;
                        AssignMatrix."Payroll Period" := AssignmentMatrixX."Payroll Period";
                        AssignMatrix.Code := 'D018';
                        Assignmatrix.Validate(Code);
                        
                        AssignMatrix.Description := AssignmentMatrixX.Description;
                        // AssignMatrix.Taxable := AssignmentMatrixX.Taxable;
                        // AssignMatrix."Tax Deductible" := AssignmentMatrixX."Tax Deductible";
                        // AssignMatrix.Frequency := AssignmentMatrixX.Frequency;
                        // AssignMatrix."Pay Period" := AssignmentMatrixX."Pay Period";
                        // AssignMatrix."Non-Cash Benefit" := AssignmentMatrixX."Non-Cash Benefit";
                        // AssignMatrix."Department Code" := AssignmentMatrixX."Department Code";
                        // AssignMatrix."Employer Amount" := AssignmentMatrixX."Employer Amount";
                        // AssignMatrix."Department Code" := AssignmentMatrixX."Department Code";
                        // AssignMatrix."Next Period Entry" := AssignmentMatrixX."Next Period Entry";
                        // AssignMatrix."Posting Group Filter" := AssignmentMatrixX."Posting Group Filter";
                        // AssignMatrix."Loan Repay" := AssignmentMatrixX."Loan Repay";
                        // AssignMatrix.DebitAcct := AssignmentMatrixX.DebitAcct;
                        // AssignMatrix.CreditAcct := AssignmentMatrixX.CreditAcct;
                        // AssignMatrix."Basic Salary Code" := AssignmentMatrixX."Basic Salary Code";
                        // AssignMatrix."Normal Earnings" := AssignmentMatrixX."Normal Earnings";
                        AssignMatrix.Insert(true);
                    // AssignMatrix.Modify;
                    unTil eMPLOYeE.NeXt = 0;
                end;
                message('Done');
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
}
