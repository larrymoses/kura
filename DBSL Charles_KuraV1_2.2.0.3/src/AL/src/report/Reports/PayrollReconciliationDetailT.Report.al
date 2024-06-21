#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69415 "Payroll Reconciliation DetailT"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Payroll Reconciliation DetailT.rdlc';

    dataset
    {
        dataitem(EarningsX;"EarningsX Temp-E")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Pay Period Filter";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(EarningsX_Code;Code)
            {
            }
            column(EarningsX_Description;Description)
            {
            }
            dataitem(Employee;"Temporary Employee")
            {
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(EmployeeNo;Employee."No.")
                {
                }
                column(ThisMonthVal;ThisMonthVal)
                {
                }
                column(EmpName;EmpName)
                {
                }
                column(LastMonthVal;LastMonthVal)
                {
                }
                column(Difference;Difference)
                {
                }
                column(ThisMonth;Thismonth)
                {
                }
                column(LastMonth;Lastmonth)
                {
                }
                column(SerialNo1;SerialNo)
                {
                }

                trigger OnAfterGetRecord()
                begin
                     UserSetup.Get(UserId);
                    Employee.SetRange(Employee."Responsibility Center",UserSetup."Responsibility Center");
                     CompanyInfo.Get;
                    CompanyInfo.CalcFields(Picture);
                      // IF Emp.GET("Assignment Matrix-X"."Employee No") THEN
                      // BEGIN
                       EmpName:=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                      // MESSAGE('%1-%2',Employee."No.",Employee."Responsibility Center");
                      // END;
                    ThisMonthVal:=0;
                    LastMonthVal:=0;
                    Difference:=0;
                    
                       Assignmat.Reset;
                       Assignmat.SetRange(Assignmat."Employee No",Employee."No.");
                       Assignmat.SetRange(Assignmat.Type,Assignmat.Type::Payment);
                       Assignmat.SetRange(Assignmat.Code,EarningsX.Code);
                       Assignmat.SetRange(Assignmat."Payroll Period",Thismonth);
                       Assignmat.SetRange("Responsibility Center",UserSetup."Responsibility Center");
                       if PostingGrp<>'' then
                       Assignmat.SetRange(Assignmat."Posting Group Filter",PostingGrp);
                       if Assignmat.FindFirst then
                       ThisMonthVal:=Assignmat.Amount;
                    /*
                    
                       ELSE
                       BEGIN
                       Assignmat.RESET;
                       Assignmat.SETRANGE(Assignmat."Employee No","Assignment Matrix-X"."Employee No");
                       Assignmat.SETRANGE(Assignmat.Type,"Assignment Matrix-X".Type);
                       Assignmat.SETRANGE(Assignmat.Code,"Assignment Matrix-X".Code);
                       Assignmat.SETRANGE(Assignmat."Payroll Period",Lastmonth);
                       IF Assignmat.FIND('+') THEN
                       LastMonthVal:=Assignmat.Amount;
                    
                       END;
                    
                    */
                       Assignmat.Reset;
                       Assignmat.SetRange(Assignmat."Employee No",Employee."No.");
                       Assignmat.SetRange(Assignmat.Type,Assignmat.Type::Payment);
                       Assignmat.SetRange(Assignmat.Code,EarningsX.Code);
                       Assignmat.SetRange(Assignmat."Payroll Period",Lastmonth);
                       Assignmat.SetRange("Responsibility Center",UserSetup."Responsibility Center");
                       if PostingGrp<>'' then
                       Assignmat.SetRange(Assignmat."Posting Group Filter",PostingGrp);
                       if Assignmat.FindFirst  then
                       LastMonthVal:=Assignmat.Amount;
                    
                    Difference:=ThisMonthVal-LastMonthVal;
                    if  Difference=0 then
                    CurrReport.Skip;
                    SerialNo:=SerialNo+1;

                end;
            }

            trigger OnAfterGetRecord()
            begin
                SerialNo:=0;
            end;
        }
        dataitem(DeductionsX;"DeductionsX Temp-E")
        {
            PrintOnlyIfDetail = true;
            column(ReportForNavId_1000000002; 1000000002)
            {
            }
            column(DeductionsX_Code;Code)
            {
            }
            column(DeductionsX_Description;Description)
            {
            }
            dataitem(Employee1;"Temporary Employee")
            {
                column(ReportForNavId_1000000003; 1000000003)
                {
                }
                column(EmployeeNo1;Employee1."No.")
                {
                }
                column(ThisMonthVal1;ThisMonthVal)
                {
                }
                column(EmpName1;EmpName)
                {
                }
                column(LastMonthVal1;LastMonthVal)
                {
                }
                column(Difference1;Difference)
                {
                }
                column(ThisMonth1;Thismonth)
                {
                }
                column(LastMonth1;Lastmonth)
                {
                }
                column(SerialNo2;SerialNo2)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    UserSetup.Get(UserId);
                    Employee1.SetRange(Employee1."Responsibility Center",UserSetup."Responsibility Center");
                       EmpName:=Employee1."First Name"+' '+Employee1."Middle Name"+' '+Employee1."Last Name";
                    
                      // END;
                    ThisMonthVal:=0;
                    LastMonthVal:=0;
                    Difference:=0;
                    
                       Assignmat.Reset;
                       Assignmat.SetRange(Assignmat."Employee No",Employee1."No.");
                       Assignmat.SetRange(Assignmat.Type,Assignmat.Type::Deduction);
                       Assignmat.SetRange(Assignmat.Code,DeductionsX.Code);
                       Assignmat.SetRange(Assignmat."Payroll Period",Thismonth);
                       Assignmat.SetRange("Responsibility Center",UserSetup."Responsibility Center");
                       if PostingGrp<>'' then
                       Assignmat.SetRange(Assignmat."Posting Group Filter",PostingGrp);
                       if Assignmat.Find('-') then
                       ThisMonthVal:=Assignmat.Amount;
                    /*
                    
                       ELSE
                       BEGIN
                       Assignmat.RESET;
                       Assignmat.SETRANGE(Assignmat."Employee No","Assignment Matrix-X"."Employee No");
                       Assignmat.SETRANGE(Assignmat.Type,"Assignment Matrix-X".Type);
                       Assignmat.SETRANGE(Assignmat.Code,"Assignment Matrix-X".Code);
                       Assignmat.SETRANGE(Assignmat."Payroll Period",Lastmonth);
                       IF Assignmat.FIND('+') THEN
                       LastMonthVal:=Assignmat.Amount;
                    
                       END;
                    
                    */
                       Assignmat.Reset;
                       Assignmat.SetRange(Assignmat."Employee No",Employee1."No.");
                       Assignmat.SetRange(Assignmat.Type,Assignmat.Type::Deduction);
                       Assignmat.SetRange(Assignmat.Code,DeductionsX.Code);
                       Assignmat.SetRange(Assignmat."Payroll Period",Lastmonth);
                       Assignmat.SetRange("Responsibility Center",UserSetup."Responsibility Center");
                       if PostingGrp<>'' then
                       Assignmat.SetRange(Assignmat."Posting Group Filter",PostingGrp);
                       if Assignmat.Find('-') then
                       LastMonthVal:=Assignmat.Amount;
                    
                    Difference:=ThisMonthVal-LastMonthVal;
                    
                    if  Difference=0 then
                    //CurrReport.SKIP;
                    SerialNo2:=SerialNo2+1;

                end;
            }

            trigger OnAfterGetRecord()
            begin
                SerialNo2:=0;
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
        dataitem(Employee2;"Temporary Employee")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Pay Period Filter","No.","Posting Group";
            column(ReportForNavId_7528; 7528)
            {
            }
            column(EmployeeNo2;Employee2."No.")
            {
            }
            column(NetPayThisMonth;NetPayThisMonth)
            {
            }
            column(EmpName2;EmpName)
            {
            }
            column(NetPayLastMonth;NetPayLastMonth)
            {
            }
            column(Difference2;Difference)
            {
            }
            column(ThisMonth2;Thismonth)
            {
            }
            column(LastMonth2;Lastmonth)
            {
            }
            column(SerialNo3;SerialNo3)
            {
            }
            dataitem(PageLoop;"Integer")
            {
                DataItemTableView = sorting(Number) where(Number=const(1));
                column(ReportForNavId_1000000039; 1000000039)
                {
                }
                column(CompanyInfoName;CompanyInfo.Name)
                {
                }
                column(CompanyInfoAddress;CompanyInfo.Address)
                {
                }
                column(CompanyInfoPicture;CompanyInfo.Picture)
                {
                }
                column(CompanyInfoAddress2;CompanyInfo."Address 2")
                {
                }
                column(CompanyInfoPhoneNo;CompanyInfo."Phone No.")
                {
                }
                column(CompanyInfoFaxNo;CompanyInfo."Fax No.")
                {
                }
                column(CompanyInfoVATRegNo;CompanyInfo."VAT Registration No.")
                {
                }
                column(CompanyInfoGiroNo;CompanyInfo."Giro No.")
                {
                }
                column(CompanyInfoBankName;CompanyInfo."Bank Name")
                {
                }
                column(CompanyInfoBankAccNo;CompanyInfo."Bank Account No.")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                 UserSetup.Get(UserId);
                Employee2.SetRange(Employee2."Responsibility Center",UserSetup."Responsibility Center");
                 EmpName:=Employee2."First Name"+' '+Employee2."Middle Name"+' '+Employee2."Last Name";

                NetPayThisMonth:=0;
                NetPayLastMonth:=0;
                Difference:=0;

                Employee2.SetRange(Employee2."Pay Period Filter",Thismonth);
                Employee2.CalcFields(Employee2."Total Allowances1",Employee2."Total Deductions",Employee2."Total Statutory");

                NetPayThisMonth:=Employee2."Total Allowances1"+Employee2."Total Deductions";


                Employee2.SetRange(Employee2."Pay Period Filter",Lastmonth);
                Employee2.CalcFields(Employee2."Total Allowances1",Employee2."Total Deductions",Employee2."Total Statutory");

                NetPayLastMonth:=Employee2."Total Allowances1"+Employee2."Total Deductions";

                Difference:=NetPayThisMonth-NetPayLastMonth;

                if  Difference=0 then
                //CurrReport.SKIP;
                 SerialNo3:=SerialNo3+1;
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

         Thismonth:=EarningsX.GetRangeMin(EarningsX."Pay Period Filter");
         Lastmonth:=CalcDate('-1M',Thismonth);
         CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        EmpName: Text[230];
        Emp: Record "Temporary Employee";
        Assignmat: Record "Assignment Matrix-X Temp-E";
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
        UserSetup: Record "User Setup";
}
