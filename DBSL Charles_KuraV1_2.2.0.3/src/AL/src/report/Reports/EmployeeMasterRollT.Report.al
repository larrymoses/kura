#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69413 "Employee Master Roll T"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Master Roll T.rdlc';

    dataset
    {
        dataitem("Temporary Employee"; "Temporary Employee")
        {
            RequestFilterFields = "Pay Period Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Employee; "Temporary Employee"."No.")
            {
            }
            column(Employee_Name; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(DateSpecified; DateSpecified)
            {
            }
            column(Dept; "Temporary Employee"."Global Dimension 1 Code")
            {
            }
            column(Totallowances; Totallowances)
            {
            }
            column(TotalDeductions; TotalDeductions)
            {
            }
            column(counter; counter)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(Allowances_Number_; Allowances[Number])
                {
                }
                column(EarnDesc_Number_; EarnDesc[Number])
                {
                }

                trigger OnPreDataItem()
                begin
                    Integer.SetRange(Number, 1, i);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                "Temporary Employee".CalcFields("Temporary Employee"."Total Allowances", "Temporary Employee"."Total Deductions");
                if ("Temporary Employee"."Total Allowances" + "Temporary Employee"."Total Deductions") = 0 then
                    CurrReport.Skip;
                counter := counter + 1;
                NetPay := "Temporary Employee"."Total Allowances" + "Temporary Employee"."Total Deductions";




                Clear(Allowances);
                Clear(Deductions);

                OtherEarn := 0;
                OtherDeduct := 0;
                Totallowances := 0;
                OtherDeduct := 0;
                TotalDeductions := 0;

                for i := 1 to NoOfEarnings do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", "Temporary Employee"."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                    Assignmat.SetRange(Assignmat.Code, Earncode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then begin
                        Assignmat.CalcSums(Amount);
                        Allowances[i] := Assignmat.Amount;
                        Totallowances := Totallowances + Allowances[i];
                    end else begin
                        if Earncode[i] = 'OTHER EARNINGS' then begin
                            Allowances[i] := "Temporary Employee"."Total Allowances" - Totallowances;
                        end
                        else
                            if Earncode[i] = 'GROSS PAY' then
                                Allowances[i] := "Temporary Employee"."Total Allowances";
                    end;
                end;


                for i := NoOfEarnings + 1 to NoOfEarnings + NoOfDeductions do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", "Temporary Employee"."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, Earncode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then begin
                        Assignmat.CalcSums(Amount);
                        Allowances[i] := Assignmat.Amount;
                        TotalDeductions := TotalDeductions + Allowances[i];
                    end else begin
                        if Earncode[i] = 'OTHER DEDUCTIONS' then
                            Allowances[i] := -Abs("Temporary Employee"."Total Deductions" - TotalDeductions)
                        else
                            if Earncode[i] = 'NET PAY' then
                                Allowances[i] := "Temporary Employee"."Total Allowances" + "Temporary Employee"."Total Deductions";
                    end;
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
        MasterRoll = 'MASTER ROLL';
    }

    trigger OnPreReport()
    begin

        DateSpecified := "Temporary Employee".GetRangeMin("Temporary Employee"."Pay Period Filter");

        EarnRec.Reset;
        EarnRec.SetRange("Show on Master Roll", true);
        EarnRec.SetRange("Non-Cash Benefit", false);
        EarnRec.SetRange("Pay Period Filter", DateSpecified);
        if EarnRec.Find('-') then
            repeat
                EarnRec.CalcFields("Total Amount");
                if EarnRec."Total Amount" <> 0 then begin
                    i := i + 1;
                    Earncode[i] := EarnRec.Code;
                    EarnDesc[i] := EarnRec.Description;
                    NoOfEarnings := NoOfEarnings + 1;
                end;
            until EarnRec.Next = 0;

        //Add other earnings
        NoOfEarnings := NoOfEarnings + 1;
        i := i + 1;
        Earncode[i] := 'OTHER EARNINGS';
        EarnDesc[i] := 'OTHER EARNINGS';
        NoOfEarnings := NoOfEarnings + 1;
        i := i + 1;
        Earncode[i] := 'GROSS PAY';
        EarnDesc[i] := 'GROSS PAY';

        //
        DedRec.Reset;
        DedRec.SetRange(DedRec."Show on Master Roll", true);
        DedRec.SetRange("Pay Period Filter", DateSpecified);
        if DedRec.Find('-') then
            repeat
                DedRec.CalcFields("Total Amount");
                if DedRec."Total Amount" <> 0 then begin
                    i := i + 1;
                    Earncode[i] := DedRec.Code;
                    EarnDesc[i] := DedRec.Description;
                    NoOfDeductions := NoOfDeductions + 1;
                end;
            until DedRec.Next = 0;

        //Add other deductions and Net Pay
        NoOfDeductions := NoOfDeductions + 1;
        i := i + 1;
        Earncode[i] := 'OTHER DEDUCTIONS';
        EarnDesc[i] := 'OTHER DEDUCTIONS';

        NoOfDeductions := NoOfDeductions + 1;
        i := i + 1;
        Earncode[i] := 'NET PAY';
        EarnDesc[i] := 'NET PAY';
        //
    end;

    var
        Allowances: array[1000] of Decimal;
        Deductions: array[1000] of Decimal;
        EarnRec: Record "EarningsX Temp-E";
        DedRec: Record "DeductionsX Temp-E";
        Earncode: array[1000] of Code[20];
        deductcode: array[1000] of Code[20];
        EarnDesc: array[1000] of Text[150];
        DedDesc: array[1000] of Text[150];
        i: Integer;
        j: Integer;
        Assignmat: Record "Assignment Matrix-X Temp-E";
        DateSpecified: Date;
        Totallowances: Decimal;
        TotalDeductions: Decimal;
        OtherEarn: Decimal;
        OtherDeduct: Decimal;
        counter: Integer;
        HRSetup: Record "Human Resources Setup";
        NetPay: Decimal;
        Payroll: Codeunit 69002;
        ExcelBuf: Record "Excel Buffer" temporary;
        PrintToExcel: Boolean;
        NoOfEarnings: Integer;
        NoOfDeductions: Integer;
        PG: Code[20];
        Dpt: Code[20];
        Emp: Code[20];
}

