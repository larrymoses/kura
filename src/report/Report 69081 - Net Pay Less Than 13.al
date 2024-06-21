/// <summary>
/// Report Net Pay Less Than 1/3 (ID 69081).
/// </summary>
report 69081 "Net Pay Less Than 1/3"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Net Pay Less Than 13.rdl';

    dataset
    {
        dataitem(Employee; Employee)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "Pay Period Filter", "No.", "Posting Group";
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(UPPERCASE_FORMAT_DateSpecified_0___month_text___year4____; UPPERCASE(FORMAT(DateSpecified, 0, '<month text> <year4>')))
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
            column(V1_3_Net_Pay_; '1/3 Basic Salary')
            {
            }
            column(Difference_; 'Difference')
            {
            }
            column(First_Name_________Middle_Name_______Last_Name_; "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
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
            column(Employee__Total_Deductions___Total_Allowances1_; Employee."Total Deductions" + "Total Allowances1")
            {
            }
            column(V1_3__Employee__Total_Allowances1__Employee__Total_Statutory__; 1 / 3 * (Employee.Basic))
            {
            }
            column(Employee__Total_Deductions___Total_Allowances1___1_3__Employee__Total_Allowances1__Employee__Total_Statutory__; (Employee."Total Deductions" + "Total Allowances1") - 1 / 3 * (Employee.Basic))
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
            column(Employee__Total_Deductions___Total_Allowances1__Control1000000039; Employee."Total Deductions" + "Total Allowances1")
            {
            }
            column(STRSUBSTNO__Employees__1__counter_; STRSUBSTNO('Employees=%1', counter))
            {
            }
            column(Prepared_By______________________________________________________; 'Prepared By.....................................................')
            {
            }
            column(Approved_By_____________________________________________________; 'Approved By....................................................')
            {
            }
            column(Passed_for_Payment_By____________________________________________________; 'Passed for Payment By...................................................')
            {
            }
            column(V1_3__Employee__Total_Allowances1__Employee__Total_Statutory___Control1000000050; 1 / 3 * (Employee."Total Allowances1" + Employee."Total Statutory"))
            {
            }
            column(DataItem1000000051; (Employee."Total Deductions" + "Total Allowances1") - 1 / 3 * (Employee."Total Allowances1" + Employee."Total Statutory"))
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
                CompanyInfo.get();
                CompanyInfo.CalcFields(Picture);
                Employee.CALCFIELDS(Employee."Total Allowances1", Employee."Total Deductions", Employee."Total Statutory");
                //IF (Employee."Total Allowances"+Employee."Total Deductions")=0 THEN
                //CurrReport.SKIP;

                //MESSAGE('%1',Employee."Total Statutory");
                IF Employee."Terminal Dues" = TRUE THEN
                    CurrReport.SKIP;

                //IF (Employee."Total Allowances1"+Employee."Total Deductions")>500 THEN
                HRSetup.GET;
                HRSetup.TESTFIELD(HRSetup."Net Pay Advance Code");

                Employee.CALCFIELDS(Employee."Total Allowances", Employee."Total Deductions", Employee."Total Allowances1",
                Employee."Total Statutory", Employee.Basic);
                //Employee.CALCFIELDS(Employee.Branch,Employee.Paypoint,Employee."Staffing Group",Employee.Department);
                //IF (Employee."Total Allowances"+Employee."Total Deductions")=0 THEN

                IF Assignmat.GET(Employee."No.", Assignmat.Type::Deduction, HRSetup."Net Pay Advance Code", DateSpecified) THEN
                    NetPayAdvance := Assignmat.Amount
                ELSE
                    NetPayAdvance := 0;


                IF (((Employee."Total Allowances1" + Employee."Total Deductions") = 0) AND (NetPayAdvance = 0)) THEN
                    CurrReport.SKIP;


                IF (Employee."Total Allowances1" + Employee."Total Deductions") > 1 / 3 * (Employee.Basic) THEN
                    CurrReport.SKIP;


                counter := counter + 1;
                FOR i := 1 TO 10 DO BEGIN
                    CLEAR(Allowances[i]);
                    CLEAR(Deductions[i]);
                END;
                OtherEarn := 0;
                OtherDeduct := 0;
                Totallowances := 0;
                OtherDeduct := 0;
                TotalDeductions := 0;

                FOR i := 1 TO 10 DO BEGIN
                    Assignmat.RESET;
                    Assignmat.SETRANGE(Assignmat."Employee No", Employee."No.");
                    Assignmat.SETRANGE(Assignmat.Type, Assignmat.Type::Payment);
                    Assignmat.SETRANGE(Assignmat.Code, Earncode[i]);
                    Assignmat.SETRANGE(Assignmat."Payroll Period", DateSpecified);
                    IF Assignmat.FIND('-') THEN
                        Allowances[i] := Assignmat.Amount;
                    Totallowances := Totallowances + Allowances[i];
                END;
                OtherEarn := Employee."Total Allowances1" - Totallowances;

                FOR i := 1 TO 10 DO BEGIN
                    Assignmat.RESET;
                    Assignmat.SETRANGE(Assignmat."Employee No", Employee."No.");
                    Assignmat.SETRANGE(Assignmat.Type, Assignmat.Type::Deduction);
                    Assignmat.SETRANGE(Assignmat.Code, deductcode[i]);
                    Assignmat.SETRANGE(Assignmat."Payroll Period", DateSpecified);
                    IF Assignmat.FIND('-') THEN
                        Deductions[i] := ABS(Assignmat.Amount);
                    TotalDeductions := TotalDeductions + Deductions[i];
                END;
                OtherDeduct := ABS(Employee."Total Deductions" + TotalDeductions);
            end;

            trigger OnPreDataItem()
            begin
                // CurrReport.CREATETOTALS(Allowances,Deductions,OtherEarn,OtherDeduct,"Total Statutory","Total Deductions","Total Allowances1");
                CurrReport.CREATETOTALS(OtherEarn, OtherDeduct, "Total Statutory", "Total Deductions", "Total Allowances1");
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

        DateSpecified := Employee.GETRANGEMIN(Employee."Pay Period Filter");
        //DateSpecified:=Employee."Pay Period Filter";



        EarnRec.RESET;
        EarnRec.SETRANGE(EarnRec."Show on Master Roll", TRUE);
        IF EarnRec.FIND('-') THEN
            REPEAT
                i := i + 1;
                Earncode[i] := EarnRec.Code;
                EarnDesc[i] := EarnRec.Description;
            UNTIL EarnRec.NEXT = 0;


        DedRec.RESET;
        DedRec.SETRANGE(DedRec."Show on Master Roll", TRUE);
        IF DedRec.FIND('-') THEN
            REPEAT
                j := j + 1;
                deductcode[j] := DedRec.Code;
                DedDesc[j] := DedRec.Description;
            UNTIL DedRec.NEXT = 0;
    end;

    var
        CompanyInfo: Record "Company Information";
        Allowances: array[20] of Decimal;
        Deductions: array[20] of Decimal;
        EarnRec: Record EarningsX;
        DedRec: Record DeductionsX;
        Earncode: array[1000] of Code[20];
        deductcode: array[1000] of Code[20];
        EarnDesc: array[1000] of Text;
        DedDesc: array[1000] of Text;
        i: Integer;
        j: Integer;
        Assignmat: Record "Assignment Matrix-X";
        DateSpecified: Date;
        Totallowances: Decimal;
        TotalDeductions: Decimal;
        OtherEarn: Decimal;
        OtherDeduct: Decimal;
        counter: Integer;
        HRSetup: Record "Human Resources Setup";
        NetPayAdvance: Decimal;
        MASTER_ROLLCaptionLbl: Label 'Net Pay Less than 1/3';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Other_AllowancesCaptionLbl: Label 'Other Allowances';
        BasicPay: Decimal;
}

