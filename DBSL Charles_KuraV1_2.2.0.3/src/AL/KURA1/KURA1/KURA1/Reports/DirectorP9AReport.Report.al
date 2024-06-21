#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69075 "Director P9A Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Director P9A Report.rdlc';
    Caption = 'Director P9A Report';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = sorting("No.") where("Vendor Posting Group" = filter('DIRECTOR'));
            RequestFilterFields = "No.", "Pay Period Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(No_Vendor; Vendor."No.")
            {
            }
            column(Name_Vendor; Vendor.Name)
            {
            }
            column(TheYear; TheYear)
            {
            }
            column(RubberStamp; CompanyInfo.RubberStamp)
            {
            }
            column(CompanyName; Company.Name)
            {
            }
            column(CompanyPIN; Company."VAT Registration No.")
            {
            }
            column(VATRegistrationNo_Vendor; Vendor."VAT Registration No.")
            {
            }
            dataitem("Director Payroll Period"; 69060)
            {
                DataItemLink = "Starting Date" = field("Date Filter");
                DataItemTableView = sorting("Starting Date") order(ascending);
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(Name_PayrollPeriodX; "Director Payroll Period".Name)
                {
                }
                column(TotalAllowances; Vendor."Total Allowances")
                {
                }
                column(BenefitsVar; BenefitsVar)
                {
                }
                column(QuartersVar; QuartersVar)
                {
                }
                column(ThirtyPerPension; "30PerPension")
                {
                }
                column(RetirementVar; RetirementVar)
                {
                }
                column(PensionLimit; PensionLimit)
                {
                }
                column(OccupierVar; Abs(OccupierVar))
                {
                }
                column(TaxableAmount; TaxableAmount)
                {
                }
                column(DefinedContrMin; (Abs(DefinedContrMin)))
                {
                }
                column(PAYE; Vendor."Cumm. PAYE")
                {
                }
                column(Relief; Relief)
                {
                }
                column(InsuranceRelief; InsuranceRelief)
                {
                }
                column(MortgageRelief; MortgageRelief)
                {
                }
                column(PensionAddBack; PensionAddBack)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    TaxableAmount := 0;
                    "30PerPension" := 0;
                    PensionLimit := 0;
                    RetirementVar := 0;
                    OccupierVar := 0;
                    TaxableAmount := 0;
                    InsuranceRelief := 0;
                    Relief := 0;
                    EmployerPension := 0;
                    MortgageRelief := 0;
                    PensionAddBack := 0;

                    //IF Employee."Pays tax?" THEN
                    begin
                        Vendor.SetRange("Pay Period Filter", "Director Payroll Period"."Starting Date");
                        Vendor.CalcFields("Total Allowances", Vendor."Cumm. PAYE");
                        Vendor.CalcFields(Vendor."Taxable Income");
                        Vendor.CalcFields("Total Allowances", "Total Deductions");
                        //Vendor.CALCFIELDS("Total Savings",BfMpr,"Owner Occupier");
                        //Vendor.CALCFIELDS(Basic,"Home Savings");
                        //Vendor.CALCFIELDS("Cumulative Quarters","Benefits-Non Cash","Owner Occupier");
                    end;

                    "30PerPension" := 30 / 100 * Vendor."Total Allowances";
                    PensionLimit := 20000;
                    //RetirementVar:=ABS(Vendor."Retirement Contribution");

                    TaxableAmount := Vendor."Taxable Income";
                    EmployerPension := Abs(EmployerPension);
                    BenefitsVar := Abs(Vendor."Non Cash Benefit");

                    /*  AssMatrix.RESET;
                      AssMatrix.SETRANGE(AssMatrix.Type,AssMatrix.Type::Deduction);
                      AssMatrix.SETRANGE(AssMatrix."Employee No",Employee."No.");
                      AssMatrix.SETRANGE(AssMatrix."Payroll Period","Starting Date");
                      AssMatrix.SETRANGE(AssMatrix.Retirement,TRUE);
                      IF AssMatrix.FIND('-') THEN BEGIN
                      REPEAT
                       RetirementVar:=RetirementVar+ABS(AssMatrix.Amount);
                    UNTIL AssMatrix.NEXT=0;
                    END;*///commented by Morris


                    //MESSAGE('%1',Employee."Total Deductions");
                    // Get Owner Occupier

                    /*Earn.RESET;
                    Earn.SETCURRENTKEY(Earn."Earning Type");
                    Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Owner Occupier");
                    IF Earn.FIND('-') THEN BEGIN
                      AssMatrix.RESET;
                      AssMatrix.SETRANGE(AssMatrix.Type,AssMatrix.Type::Payment);
                      AssMatrix.SETRANGE(AssMatrix."Employee No",Employee."No.");
                      AssMatrix.SETRANGE(AssMatrix."Payroll Period","Starting Date");
                      AssMatrix.SETRANGE(Code,Earn.Code);
                      IF AssMatrix.FIND('-') THEN
                       OccupierVar:=AssMatrix.Amount;
                    END;*/

                    // Get Personal Relief
                    /*Earn.RESET;
                    Earn.SETCURRENTKEY(Earn."Earning Type");
                    Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Tax Relief");
                    IF Earn.FIND('-') THEN BEGIN
                      AssMatrix.RESET;
                      AssMatrix.SETRANGE(AssMatrix.Type,AssMatrix.Type::Payment);
                      AssMatrix.SETRANGE(AssMatrix."Employee No",Employee."No.");
                      AssMatrix.SETRANGE(AssMatrix."Payroll Period","Starting Date");
                      AssMatrix.SETRANGE(Code,Earn.Code);
                      IF AssMatrix.FIND('-') THEN
                       Relief:=AssMatrix.Amount;
                    END;*/

                    // Get Insurance Relief

                    /*Earn.RESET;
                    Earn.SETCURRENTKEY(Earn."Earning Type");
                    Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Insurance Relief");
                    Earn.SETRANGE(Earn.Code,'INS-RELIEF');
                    IF Earn.FIND('-') THEN BEGIN
                      AssMatrix.RESET;
                      AssMatrix.SETRANGE(AssMatrix.Type,AssMatrix.Type::Payment);
                      AssMatrix.SETRANGE(AssMatrix."Employee No",Employee."No.");
                      AssMatrix.SETRANGE(AssMatrix."Payroll Period","Starting Date");
                      AssMatrix.SETRANGE(Code,Earn.Code);
                      IF AssMatrix.FIND('-') THEN
                        InsuranceRelief:=AssMatrix.Amount;
                    END;*/

                    //Get Mortgage Relief
                    /*Earn.RESET;
                    Earn.SETCURRENTKEY(Earn."Earning Type");
                    //Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Insurance Relief");
                    Earn.SETRANGE(Earn.Code,'MORT-REL');
                    IF Earn.FIND('-') THEN BEGIN
                      AssMatrix.RESET;
                      AssMatrix.SETRANGE(AssMatrix.Type,AssMatrix.Type::Payment);
                      AssMatrix.SETRANGE(AssMatrix."Employee No",Employee."No.");
                      AssMatrix.SETRANGE(AssMatrix."Payroll Period","Starting Date");
                      AssMatrix.SETRANGE(Code,Earn.Code);
                      IF AssMatrix.FIND('-') THEN
                        MortgageRelief:=AssMatrix.Amount;
                    END;*/

                    //Get Pension AddBack
                    /*Earn.RESET;
                    Earn.SETCURRENTKEY(Earn."Earning Type");
                    //Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Insurance Relief");
                    Earn.SETRANGE(Earn.Code,'P-ADDBACK');
                    IF Earn.FIND('-') THEN BEGIN
                      AssMatrix.RESET;
                      AssMatrix.SETRANGE(AssMatrix.Type,AssMatrix.Type::Payment);
                      AssMatrix.SETRANGE(AssMatrix."Employee No",Employee."No.");
                      AssMatrix.SETRANGE(AssMatrix."Payroll Period","Starting Date");
                      AssMatrix.SETRANGE(Code,Earn.Code);
                      IF AssMatrix.FIND('-') THEN
                        PensionAddBack:=AssMatrix.Amount;
                    END;*/


                    //InsuranceRelief:=ABS(Employee."Owner Occupier");
                    //InsuranceRelief:=ABS(Employee."Insurance Relief");



                    /*Earn.RESET;
                    Earn.SETRANGE(Earn."Earning Type",Earn."Earning Type"::"Insurance Relief");
                    Earn.SETRANGE(Earn.Code,'INS-RELIEF');
                    IF Earn.FIND('-') THEN BEGIN
                      AssMatrix.RESET;
                      AssMatrix.SETRANGE(AssMatrix.Type,AssMatrix.Type::Payment);
                      AssMatrix.SETRANGE(AssMatrix."Employee No",Employee."No.");
                      AssMatrix.SETRANGE(AssMatrix."Payroll Period","Starting Date");
                      AssMatrix.SETRANGE(Code,Earn.Code);
                      IF AssMatrix.FIND('-') THEN
                       BenefitsVar:=AssMatrix.Amount;
                    END;*/




                    /*****Calculate the totals*******************************/
                    TotBasic := TotBasic + Vendor."Total Allowances";
                    //TotNonQuarter:=TotQuarter+Employee."Total Allowances";
                    //TotQuarter:=TotQuarter+QuartersVar;
                    // TotGross:=TotGross+Employee."Cumm. Basic Pay"+Employee."Taxable Allowance"+QuartersVar+BenefitsVar;
                    //TotPercentage:=TotPercentage + ((30/100)* (Vendor.cu+Vendor."Total Allowances"+
                    //QuartersVar
                    // +BenefitsVar));
                    TotActual := TotActual + RetirementVar;
                    TotFixed := TotFixed + PensionLimit;
                    TotTaxable := TotTaxable + TaxableAmount;
                    TotTax := TotTax + IncomeTax;
                    TotRelief := TotRelief + Relief;
                    TotPAYE := TotPAYE + PAYE;
                    grandPAYE := grandPAYE + PAYE;
                    TotOcc := TotOcc + Abs(OccupierVar);
                    //TotRet:=TotRet+ABS(DefinedContrMin)+ABS(OccupierVar);
                    TaxablePound := TaxableAmount / 20;
                    TaxablePound := ROUND(TaxablePound, 1, '<');
                    TotPound := TotPound + TaxablePound;
                    TotalBenefits := TotalBenefits + BenefitsVar;
                    DefinedContrMin := RetirementVar;
                    //Ushindi.....If minimum exceeds 20k, then lowest should be 20k
                    if (DefinedContrMin + EmployerPension) > PensionLimit
                     then
                        DefinedContrMin := PensionLimit
                    else
                        DefinedContrMin := DefinedContrMin + EmployerPension;


                    NoOfMonths := NoOfMonths + 1;
                    TotRet := TotRet + Abs(DefinedContrMin) + Abs(OccupierVar);

                end;

                trigger OnPreDataItem()
                begin
                    "Director Payroll Period".CalcFields("Director Payroll Period".Status);
                    "Director Payroll Period".Reset;
                    "Director Payroll Period".SetRange("Director Payroll Period"."Starting Date", StringDate, EndDate);
                    "Director Payroll Period".SetRange("Director Payroll Period".Status, "Director Payroll Period".Status::Released);
                    CurrReport.CreateTotals(Vendor."Total Allowances", BenefitsVar, QuartersVar, "30PerPension", PensionLimit, RetirementVar, OccupierVar);
                    CurrReport.CreateTotals(TaxableAmount, Vendor."Cumm. PAYE", InsuranceRelief, Relief);
                end;
            }
            dataitem("Directors Earnings"; 69052)
            {
                DataItemLink = "Director Filter" = field("No.");
                DataItemTableView = sorting(Code);
                column(ReportForNavId_1000000002; 1000000002)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Directors Earnings".CalcFields("Directors Earnings"."Total Amount", "Directors Earnings".Counter);
                    EmployeeBenefits := EmployeeBenefits + "Directors Earnings"."Total Amount";


                    if "Directors Earnings".Counter <> 0 then
                        Numb := "Directors Earnings"."No of Entries" / "Directors Earnings".Counter;
                end;

                trigger OnPostDataItem()
                begin
                    EmployeeBenefits := 0;
                end;

                trigger OnPreDataItem()
                begin
                    "Directors Earnings".SetRange("Directors Earnings"."Non-Cash Benefit", true);
                    "Directors Earnings".SetRange("Pay Period Filter", StringDate, EndDate);
                end;
            }

            trigger OnAfterGetRecord()
            begin

                TotBasic := 0;
                TotNonQuarter := 0;
                TotQuarter := 0;
                TotGross := 0;
                TotPercentage := 0;
                TotActual := 0;
                TotFixed := 0;
                TotTaxable := 0;
                TotTax := 0;
                TotRelief := 0;
                TotPAYE := 0;
                NoOfMonths := 0;
                TotalBenefits := 0;
                TotOcc := 0;
                TotRet := 0;
                TotPound := 0;
                grandPAYE := 0;
                //"Total Quarters":=0;
                NewDefinedContribution := 0;
                Company.Get;
                CoPin := Company."Giro No.";
                EmployerPension := 0;

                /*IF StringDate=0D THEN
                  StringDate:=Employee.GETRANGEMAX("Date Filter");
                IF EndDate=0D THEN
                  EndDate:=Employee.GETRANGEMIN("Date Filter");
                
                TheYear:=DATE2DMY(EndDate,3);*/

            end;

            trigger OnPreDataItem()
            begin
                if StringDate = 0D then
                    StringDate := Vendor.GetRangeMin("Date Filter");
                if EndDate = 0D then
                    EndDate := Vendor.GetRangemax("Date Filter");
                //MESSAGE('startdate %1', StringDate);
                //MESSAGE('endDatedate %1',EndDate);

                TheYear := Date2dmy(EndDate, 3);

                CompanyInfo.CalcFields(CompanyInfo.RubberStamp);

                /* IF (StringDate=0D) OR (EndDate=0D) THEN
               ERROR('Please specify the correct period on the option of the request form');
               */
                // Employee.SETFILTER("Home Ownership Status",'<>%1', Employee."Home Ownership Status"::"Home Savings");
                CUser := UserId;

            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(StringDate; StringDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Start Date';
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'End Date';
                        //   OptionCaption = 'Due Date,Posting Date,Document Date';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        TaxableAmount: Decimal;
        AmountRemaining: Decimal;
        IncomeTax: Decimal;
        TotBasic: Decimal;
        TotNonQuarter: Decimal;
        TotQuarter: Decimal;
        TotGross: Decimal;
        TotPercentage: Decimal;
        TotActual: Decimal;
        TotFixed: Decimal;
        TotTaxable: Decimal;
        TotTax: Decimal;
        TotRelief: Decimal;
        TotPAYE: Decimal;
        TaxablePound: Decimal;
        TotPound: Decimal;
        TotalBenefits: Decimal;
        EmployeeBenefits: Decimal;
        NoOfMonths: Integer;
        NoOfUnits: Integer;
        Numb: Decimal;
        DefinedContrMin: Decimal;
        HRSetup: Record "Human Resources Setup";
        ExcessRetirement: Decimal;
        HseLimit: Decimal;
        BenefitsVar: Decimal;
        QuartersVar: Decimal;
        OccupierVar: Decimal;
        RetirementVar: Decimal;
        PensionLimit: Decimal;
        Relief: Decimal;
        PAYE: Decimal;
        StringDate: Date;
        EndDate: Date;
        TotOcc: Decimal;
        TotRet: Decimal;
        Company: Record "Company Information";
        CoPin: Text[30];
        grandPAYE: Decimal;
        TaxCode: Code[10];
        retirecontribution: Decimal;
        CompRec: Record "Human Resources Setup";
        "30PerPension": Decimal;
        Earn: Record 69005;
        AssMatrix: Record 69009;
        InsuranceRelief: Decimal;
        GetGroup: Codeunit 69002;
        GroupCode: Code[50];
        CUser: Code[50];
        CompanyInfo: Record "Company Information";
        TheYear: Integer;
        NewDefinedContribution: Decimal;
        Deduct: Record 69006;
        EmployerPension: Decimal;
        MortgageRelief: Decimal;
        PensionAddBack: Decimal;
        DirectorsEarnings: Record 69052;


    procedure GetTaxBracket(var TaxableAmount: Decimal)
    var
        TaxTable: Record 69004;
        TotalTax: Decimal;
        Tax: Decimal;
        EndTax: Boolean;
    begin
        AmountRemaining := TaxableAmount;
        AmountRemaining := ROUND(AmountRemaining, 0.01);
        EndTax := false;

        TaxTable.SetRange("Table Code", 'BOARD');

        if TaxTable.Find('-') then begin
            repeat
                if AmountRemaining <= 0 then
                    EndTax := true
                else begin
                    if ROUND((TaxableAmount), 0.01) > TaxTable."Upper Limit" then
                        Tax := TaxTable."Taxable Amount" * TaxTable.Percentage / 100
                    else begin
                        Tax := AmountRemaining * TaxTable.Percentage / 100;
                        TotalTax := TotalTax + Tax;
                        EndTax := true;
                    end;
                    if not EndTax then begin
                        AmountRemaining := AmountRemaining - TaxTable."Taxable Amount";
                        TotalTax := TotalTax + Tax;
                    end;
                end;
            until (TaxTable.Next = 0) or EndTax = true;
        end;
        TotalTax := TotalTax;
        TotalTax := PayrollRounding(TotalTax);
        IncomeTax := -TotalTax;
        //  IF NOT Employee."Pays tax?" THEN
        //  IncomeTax:=0;
    end;


    procedure PayrollRounding(var Amount: Decimal) PayrollRounding: Decimal
    var
        HRsetup: Record "Human Resources Setup";
    begin

        HRsetup.Get;
        if HRsetup."Payroll Rounding Precision" = 0 then
            Error('You must specify the rounding precision under HR setup');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Nearest then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '=');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Up then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '>');

        if HRsetup."Payroll Rounding Type" = HRsetup."payroll rounding type"::Down then
            PayrollRounding := ROUND(Amount, HRsetup."Payroll Rounding Precision", '<');
    end;
}
