#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settingsl
Report 69055 "Payroll Reconciliation Summary"
{
    DefaultLayout = RDLC;
 RDLCLayout = './Layouts/Payroll Reconciliation Summary.rdl';
    //RDLCLayout = 'ReportLayouts/Payroll Reconciliation Summary.rdlc';

    dataset
    {
        dataitem(EarningsX; EarningsX)
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Pay Period Filter", "Posting Group Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(EarningsX_Code; EarningsX.Code)
            {
            }
            column(EarningsX_Description; EarningsX.Description)
            {
            }
            column(ThisMonthVal; ThisMonthVal)
            {
            }
            column(LastMonthVal; LastMonthVal)
            {
            }
            column(Difference; Difference)
            {
            }
            column(Thismonth; Thismonth)
            {
            }
            column(Lastmonth; Lastmonth)
            {
            }
            column(SerialNo1; SerialNo)
            {
            }
            column(TotalEmployees; TotalEmployees)
            {
            }
            column(TotalEmployeesLastMonth; TotalEmployeesLastMonth)
            {
            }
            column(NetPayThisMonth; NetPayThisMonth)
            {
            }
            column(NetPayLastMonth; NetPayLastMonth)
            {
            }
            column(GrosspayThisMonth; GrosspayThisMonth)
            {
            }
            column(GrosspayLastMonth; GrosspayLastMonth)
            {
            }
            column(DisabilityLastMonth; DisabilityLastMonth)
            {
            }
            column(DisabilityThisMonth; DisabilityThisMonth)
            {
            }
            column(OwnerOccupierInterestThisMonth; OwnerOccupierInterestThisMonth)
            {
            }
            column(InsuranceThisMonth; InsuranceThisMonth)
            {
            }
            column(PersonalReliefThisMonth; PersonalReliefThisMonth)
            {
            }
            column(GratuityThisMonth; GratuityThisMonth)
            {
            }
            column(PersonalReliefLastMonth; PersonalReliefLastMonth)
            {
            }
            column(InsuranceLastMonth; InsuranceLastMonth)
            {
            }
            column(OwnerOccupierInterestLastMonth; OwnerOccupierInterestLastMonth)
            {
            }
            column(GratuityLastMonth; GratuityLastMonth)
            {
            }
            column(Difference2; Difference)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number);
                MaxIteration = 1;
                column(ReportForNavId_1000000027; 1000000027)
                {
                }
                column(CompanyInfoName; CompanyInfo.Name)
                {
                }
                column(CompanyInfoPicture; CompanyInfo.Picture)
                {
                }

                trigger OnPreDataItem()
                begin
                    // Integer.SETRANGE(Number,1,i);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //SerialNo:=0;
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);

                if EarningsX."Non-Cash Benefit" = true then
                    CurrReport.Skip;


                //Earn.RESET;
                //earningsx.SETRANGE(earningsx.Code,EarningsX.Code);
                EarningsX.SetRange(EarningsX."Pay Period Filter", Thismonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Earn.SETRANGE(Earn."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF EarningsX.FINDFIRST THEN
                EarningsX.CalcFields(EarningsX."Total Amount");
                ThisMonthVal := EarningsX."Total Amount";
                TotalEarnThisMonth := TotalEarnThisMonth + ThisMonthVal;
                TotalEarnings := TotalEarnThisMonth + ThisMonthVal;

                //Earn.RESET;
                //Earn.SETRANGE(Earn.Code,EarningsX.Code);
                EarningsX.SetRange(EarningsX."Pay Period Filter", Lastmonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Earn.SETRANGE(Earn."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF EarningsX.FINDFIRST THEN
                EarningsX.CalcFields(EarningsX."Total Amount");

                LastMonthVal := EarningsX."Total Amount";
                TotalEarnLastMonth := TotalEarnLastMonth + LastMonthVal;
                TotalEarnings1 := TotalEarnLastMonth + LastMonthVal;

                Difference := ThisMonthVal - LastMonthVal;

                //IF  (ThisMonthVal=0) AND (LastMonthVal=0) THEN

                // if (Difference = 0) then
                //     CurrReport.Skip;

                SerialNo := SerialNo + 1;
            end;

            trigger OnPreDataItem()
            begin
                TotalEmployees := 0;
                TotalEmployeesLastMonth := 0;
                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Thismonth);

                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        if Employee1."Total Allowances1" > 0 then
                            TotalEmployees := TotalEmployees + 1;
                    until Employee1.Next = 0;
                end;

                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Lastmonth);

                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions");
                        if Employee1."Total Allowances1" > 0 then
                            TotalEmployeesLastMonth := TotalEmployeesLastMonth + 1;
                    until Employee1.Next = 0;
                end;

                NetPayThisMonth := 0;
                NetPayLastMonth := 0;
                Difference := 0;
                DisabilityThisMonth := 0;
                DisabilityLastMonth := 0;
                GratuityThisMonth := 0;
                GratuityLastMonth := 0;
                InsuranceThisMonth := 0;
                InsuranceLastMonth := 0;
                OwnerOccupierInterestLastMonth := 0;
                OwnerOccupierInterestLastMonth := 0;
                PersonalReliefThisMonth := 0;
                PersonalReliefLastMonth := 0;
                CompanyInfo.Get;
                CompanyInfo.CalcFields(Picture);

                //This Month
                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Thismonth);

                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions", Employee1."Total Gratuity Amount", Employee1."Relief Amount", Employee1."Owner Occupier");
                        NetPayThisMonth := NetPayThisMonth + Employee1."Total Allowances1" + Employee1."Total Deductions";
                    //PersonalReliefThisMonth:=PersonalReliefThisMonth+Employee1."Relief Amount";
                    until Employee1.Next = 0;
                end;

                // Last Month
                Employee1.Reset;
                Employee1.SetRange(Employee1."Pay Period Filter", Lastmonth);

                if Employee1.FindFirst then begin
                    repeat
                        Employee1.CalcFields(Employee1."Total Allowances1", Employee1."Total Deductions", Employee1."Total Gratuity Amount", Employee1."Relief Amount", Employee1."Owner Occupier");
                        NetPayLastMonth := NetPayLastMonth + Employee1."Total Allowances1" + Employee1."Total Deductions";
                    //PersonalReliefLastMonth:=PersonalReliefLastMonth+Employee1."Relief Amount";
                    until Employee1.Next = 0;
                end;

                Difference := NetPayThisMonth - NetPayLastMonth;

                //Tax ReliefThisMonth
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Tax Relief");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                PersonalReliefThisMonth := PersonalReliefThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                //Tax ReliefLastMonth

                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Tax Relief");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                PersonalReliefLastMonth := PersonalReliefLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;



                //cc
                //GratuityThisMonth
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::Gratuity);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                GratuityThisMonth := GratuityThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;
                //gratuity Last Month
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::Gratuity);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                GratuityLastMonth := GratuityLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;



                //InsuranceThisMonth
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Insurance Relief");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                InsuranceThisMonth := InsuranceThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;
                //InsuranceLastMonth
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Insurance Relief");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                InsuranceLastMonth := InsuranceLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                //OwnerOccupierInterestThisMonth
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Owner Occupier");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                OwnerOccupierInterestThisMonth := OwnerOccupierInterestThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                //OwnerOccupierInterestLastMonth
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Owner Occupier");
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        // Assignmat.SETRANGE(Type,Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                OwnerOccupierInterestLastMonth := OwnerOccupierInterestLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                //Disability This month
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"PWD Relief");
                Earn.SetRange(Earn."Non-Cash Benefit", true);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                DisabilityThisMonth := DisabilityThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;



                //Disability Last month
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"PWD Relief");
                Earn.SetRange(Earn."Non-Cash Benefit", true);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                DisabilityLastMonth := DisabilityLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;

                //Calculate grosspay// This Month
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Normal Earning");
                Earn.SetRange(Earn."Non-Cash Benefit", false);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Thismonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        // AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                GrosspayThisMonth := GrosspayThisMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;


                //Calculate grosspay// Last Month
                Earn.Reset;
                Earn.SetRange(Earn."Earning Type", Earn."earning type"::"Normal Earning");
                Earn.SetRange(Earn."Non-Cash Benefit", false);
                if Earn.Find('-') then begin
                    repeat
                        Assignmat.Reset;
                        Assignmat.SetRange(Assignmat."Payroll Period", Lastmonth);
                        Assignmat.SetRange(Type, Assignmat.Type::Payment);
                        // AssignMatrix.SETRANGE(AssignMatrix."Employee No",Employee."No.");
                        Assignmat.SetRange(Code, Earn.Code);
                        if Assignmat.Find('-') then begin
                            repeat
                                GrosspayLastMonth := GrosspayLastMonth + Assignmat.Amount;
                            until Assignmat.Next = 0;
                        end;
                    until Earn.Next = 0;
                end;
            end;
        }
        dataitem(DeductionsX; DeductionsX)
        {
            DataItemTableView = where("Is Personal Insurance" = const(false));
            PrintOnlyIfDetail = false;
            column(ReportForNavId_1000000002; 1000000002)
            {
            }
            column(DeductionsX_Code; DeductionsX.Code)
            {
            }
            column(DeductionsX_Description; DeductionsX.Description)
            {
            }
            column(ThisMonthVal1; ThisMonthVal)
            {
            }
            column(LastMonthVal1; LastMonthVal)
            {
            }
            column(Difference1; Difference)
            {
            }
            column(SerialNo2; SerialNo2)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //SerialNo2:=0;

                LastMonthVal := 0;
                ThisMonthVal := 0;
                Difference := 0;
                //Ded.RESET;
                //Ded.SETRANGE(Ded.Code,DeductionsX.Code);
                DeductionsX.SetRange(DeductionsX."Pay Period Filter", Thismonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Ded.SETRANGE(Ded."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF Ded.FINDFIRST THEN
                DeductionsX.CalcFields(DeductionsX."Total Amount");
                ThisMonthVal := DeductionsX."Total Amount";
                TotalDeductions := TotalDedThisMonth + ThisMonthVal;
                TotalDedThisMonth := TotalDedThisMonth + ThisMonthVal;

                //Ded.RESET;
                //Ded.SETRANGE(Ded.Code,DeductionsX.Code);
                DeductionsX.SetRange(DeductionsX."Pay Period Filter", Lastmonth);
                //IF EarningsX.GETFILTER(EarningsX."Posting Group Filter")<>'' THEN
                //Ded.SETRANGE(Ded."Posting Group Filter",EarningsX.GETFILTER(EarningsX."Posting Group Filter"));
                //IF Ded.FINDFIRST THEN
                DeductionsX.CalcFields(DeductionsX."Total Amount");

                LastMonthVal := DeductionsX."Total Amount";
                TotalDedLastMonth := TotalDedLastMonth + LastMonthVal;
                Totaldeductions1 := TotalDedLastMonth + LastMonthVal;

                Difference := ThisMonthVal - LastMonthVal;

                //IF  (ThisMonthVal=0) AND (LastMonthVal=0) THEN

                // if (Difference = 0) then
                //     CurrReport.Skip;

                SerialNo2 := SerialNo2 + 1;
            end;

            trigger OnPostDataItem()
            begin
                //SerialNo:=0;
            end;

            trigger OnPreDataItem()
            begin
                //SerialNo:=0;
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

    trigger OnPreReport()
    begin

        Thismonth := EarningsX.GetRangeMin(EarningsX."Pay Period Filter");
        Lastmonth := CalcDate('-1M', Thismonth);
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    trigger OnPostReport()
    begin
        TotalNet := TotalEarnings - TotalDeductions;
    end;


    var
        TotalNet: decimal;
        EmpName: Text[230];
        Emp: Record Employee;
        Assignmat: Record "Assignment Matrix-X";
        Thismonth: Date;
        Lastmonth: Date;
        LastMonthVal: Decimal;
        Difference: Decimal;
        PostingGrp: Code[100];
        ThisMonthVal: Decimal;
        Thismonth1: Date;
        Lastmonth1: Date;
        LastMonthVal1: Decimal;
        Difference1: Decimal;
        ThisMonthVal1: Decimal;
        EmpName1: Text;
        NetPayThisMonth: Decimal;
        NetPayLastMonth: Decimal;
        CompanyInfo: Record "Company Information";
        SerialNo: Integer;
        SerialNo2: Integer;
        SerialNo3: Integer;
        Earn: Record EarningsX;
        TotalEarnThisMonth: Decimal;
        TotalDedThisMonth: Decimal;
        TotalEarnLastMonth: Decimal;
        TotalDedLastMonth: Decimal;
        Ded: Record DeductionsX;
        EarningFilter: Text[200];
        TotalEmployees: Integer;
        TotalEmployeesLastMonth: Integer;
        Employee1: Record Employee;
        DisabilityThisMonth: Decimal;
        DisabilityLastMonth: Decimal;
        GratuityThisMonth: Decimal;
        GratuityLastMonth: Decimal;
        InsuranceThisMonth: Decimal;
        InsuranceLastMonth: Decimal;
        GrosspayThisMonth: Decimal;
        GrosspayLastMonth: Decimal;
        OwnerOccupierInterestLastMonth: Decimal;
        OwnerOccupierInterestThisMonth: Decimal;
        PersonalReliefThisMonth: Decimal;
        PersonalReliefLastMonth: Decimal;
        TotalDeductions: Decimal;
        Totaldeductions1: Decimal;
        TotalEarnings: decimal;
        TotalEarnings1: decimal;
}

