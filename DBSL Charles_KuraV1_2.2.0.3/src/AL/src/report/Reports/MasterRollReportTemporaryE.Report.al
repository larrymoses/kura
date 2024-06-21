#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69402 "Master Roll Report Temporary E"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Master Roll Report Temporary E.rdlc';

    dataset
    {
        dataitem("Temporary Employee"; "Temporary Employee")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Pay Period Filter", "No.", "Posting Group", Department, Status;
            column(ReportForNavId_7528; 7528)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(UserId; UserId)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4____; UpperCase(Format(DateSpecified, 0, '<month text> <year4>')))
            {
            }
            column(Time; Time)
            {
            }
            column(CoRec_Picture; CoRec.Picture)
            {
            }
            column(EarnDesc_1_; EarnDesc[1])
            {
            }
            column(EarnDesc_2_; EarnDesc[2])
            {
            }
            column(EarnDesc_3_; EarnDesc[3])
            {
            }
            column(EarnDesc_4_; EarnDesc[4])
            {
            }
            column(EarnDesc_5_; EarnDesc[5])
            {
            }
            column(DedDesc_1_; DedDesc[1])
            {
            }
            column(DedDesc_2_; DedDesc[2])
            {
            }
            column(DedDesc_3_; DedDesc[3])
            {
            }
            column(DedDesc_4_; DedDesc[4])
            {
            }
            column(Other_Deductions_; 'Other Deductions')
            {
            }
            column(Net_Pay_; 'Net Pay')
            {
            }
            column(PF_No__; 'PF No.')
            {
            }
            column(Name_; 'Name')
            {
            }
            column(Employee__No__; "No.")
            {
            }
            column(Allowances_1_; Allowances[1])
            {
            }
            column(Allowances_2_; Allowances[2])
            {
            }
            column(Allowances_3_; Allowances[3])
            {
            }
            column(Allowances_4_; Allowances[4])
            {
            }
            column(Allowances_5_; Allowances[5])
            {
            }
            column(Totallowances; Totallowances)
            {
            }
            column(OtherEarn; OtherEarn)
            {
            }
            column(Deductions_1_; Deductions[1])
            {
            }
            column(Deductions_2_; Deductions[2])
            {
            }
            column(Deductions_3_; Deductions[3])
            {
            }
            column(Deductions_4_; Deductions[4])
            {
            }
            column(OtherDeduct; OtherDeduct)
            {
            }
            column(TotalDeductions; TotalDeductions)
            {
            }
            column(NetPay; NetPay)
            {
            }
            column(First_Name_________Middle_Name_______Last_Name_; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(Allowances_1__Control1000000009; Allowances[1])
            {
            }
            column(Allowances_2__Control1000000018; Allowances[2])
            {
            }
            column(Allowances_3__Control1000000032; Allowances[3])
            {
            }
            column(OtherEarn_Control1000000033; OtherEarn)
            {
            }
            column(Deductions_1__Control1000000034; Deductions[1])
            {
            }
            column(Deductions_2__Control1000000035; Deductions[2])
            {
            }
            column(Deductions_3__Control1000000036; Deductions[3])
            {
            }
            column(Deductions_4__Control1000000037; Deductions[4])
            {
            }
            column(OtherDeduct_Control1000000038; OtherDeduct)
            {
            }
            column(NetPay_Control1000000039; NetPay)
            {
            }
            column(STRSUBSTNO__Employees__1__counter_; StrSubstNo('Employees=%1', counter))
            {
            }
            column(Prepared_By______________________________________________________; 'Prepared By.....................................................')
            {
            }
            column(Approved_By_____________________________________________________; 'Approved By....................................................')
            {
            }
            column(Approved_By_____________________________________________; 'Approved By............................................')
            {
            }
            column(MASTER_ROLLCaption; MASTER_ROLLCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Other_AllowancesCaption; Other_AllowancesCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                UserSetup.Get(UserId);
                "Temporary Employee".SetRange("Temporary Employee"."Responsibility Center", UserSetup."Responsibility Center");
                counter := 0;
                "Temporary Employee".CalcFields("Temporary Employee"."Total Allowances", "Temporary Employee"."Total Deductions");
                if ("Temporary Employee"."Total Allowances" + "Temporary Employee"."Total Deductions") = 0 then
                    CurrReport.Skip;
                counter := counter + 1;
                NetPay := "Temporary Employee"."Total Allowances" + "Temporary Employee"."Total Deductions";

                NetPay := Payroll.PayrollRounding(NetPay);


                for i := 1 to 20 do begin
                    Clear(Allowances[i]);
                    Clear(Deductions[i]);
                end;
                OtherEarn := 0;
                OtherDeduct := 0;
                Totallowances := 0;
                OtherDeduct := 0;
                TotalDeductions := 0;


                for i := 1 to 20 do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", "Temporary Employee"."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Payment);
                    //Assignmat.SETRANGE(Assignmat."Tax Relief",FALSE);
                    //Assignmat.SETFILTER(Assignmat.Code,'<>%1','INSRELIEF');
                    Assignmat.SetRange(Assignmat.Code, Earncode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then begin
                        if Assignmat.Amount <> 0 then begin
                            Allowances[i] := Assignmat.Amount;
                            Totallowances := Totallowances + Allowances[i];
                            //MESSAGE('Totallowances %1',FORMAT(Totallowances));
                        end;
                    end;
                end;

                //OtherEarn:="Temporary Employee"."Total Allowances"-Totallowances;

                //MESSAGE('Other Earnings %1',OtherEarn);
                for i := 1 to 20 do begin
                    Assignmat.Reset;
                    Assignmat.SetRange(Assignmat."Employee No", "Temporary Employee"."No.");
                    Assignmat.SetRange(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SetRange(Assignmat.Code, deductcode[i]);
                    Assignmat.SetRange(Assignmat."Payroll Period", DateSpecified);
                    if Assignmat.Find('-') then begin
                        if Assignmat.Amount <> 0 then begin
                            Deductions[i] := Abs(Assignmat.Amount);
                            TotalDeductions := TotalDeductions + Deductions[i];
                        end;
                    end;
                end;
                //OtherDeduct:=ABS("Temporary Employee"."Total Deductions"+TotalDeductions);
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(Allowances1, Deductions1, OtherEarn, OtherDeduct, NetPay);
                HRSetup.Get;
                UserSetup.Get(UserId);
                "Temporary Employee".SetRange("Temporary Employee"."Responsibility Center", UserSetup."Responsibility Center");
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

        DateSpecified := "Temporary Employee".GetRangeMin("Temporary Employee"."Pay Period Filter");

        EarnRec.Reset;
        EarnRec.SetRange(EarnRec."Show on Master Roll", true);
        EarnRec.SetFilter(EarnRec."Earning Type", '<>%1|<>%2', EarnRec."earning type"::"Insurance Relief", EarnRec."earning type"::"Tax Relief");
        if EarnRec.Find('-') then
            repeat
                i := i + 1;
                Earncode[i] := EarnRec.Code;
                EarnDesc[i] := EarnRec.Description;
            until EarnRec.Next = 0;


        DedRec.Reset;
        DedRec.SetRange(DedRec."Show on Master Roll", true);
        if DedRec.Find('-') then
            repeat
                j := j + 1;
                deductcode[j] := DedRec.Code;
                DedDesc[j] := DedRec.Description;
            until DedRec.Next = 0;

        CoRec.Get;
        CoRec.CalcFields(Picture);
    end;

    var
        Allowances: array[20] of Decimal;
        Deductions: array[20] of Decimal;
        EarnRec: Record "EarningsX Temp-E";
        DedRec: Record "DeductionsX Temp-E";
        Earncode: array[100] of Code[40];
        deductcode: array[100] of Code[40];
        EarnDesc: array[100] of Text[100];
        DedDesc: array[100] of Text[100];
        i: Integer;
        j: Integer;
        Assignmat: Record "Assignment Matrix-X Temp-E";
        DateSpecified: Date;
        Totallowances: Decimal;
        TotalDeductions: Decimal;
        OtherEarn: Decimal;
        Deductions1: Decimal;
        Allowances1: decimal;
        OtherDeduct: Decimal;
        counter: Integer;
        HRSetup: Record "Human Resources Setup";
        NetPay: Decimal;
        Payroll: Codeunit 69002;
        CoRec: Record "Company Information";
        MASTER_ROLLCaptionLbl: label 'MASTER ROLL';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Other_AllowancesCaptionLbl: label 'Other Allowances';
        UserSetup: Record "User Setup";
}

