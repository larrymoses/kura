#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 69058 "Employee Payroll Pay File"
{
    Direction = Export;
    // FieldDelimiter = '<>';
    // FieldSeparator = '<               >';
    Format = FixedText;
    FormatEvaluate = Legacy;
    RecordSeparator = '<NewLine>';

    schema
    {
        textelement(Root)
        {
            tableelement(Employee; Employee)
            {
                RequestFilterFields = "No.", "Pay Period Filter", "Employee Posting Group";
                XmlName = 'Employee';
                textattribute(BeneficiaryName)
                {
                    Width = 36;
                }
                fieldelement(BankAccountNo; Employee."Bank Account Number")
                {
                    Width = 16;
                }
                fieldelement(BankCode; Employee."Bank Branch")
                {
                    Width = 8;
                }
                fieldelement(NetPay; Employee."Net pay")
                {
                    Width = 15;
                }

                trigger OnAfterGetRecord()
                begin
                    DateSpecified := Employee.GetRangeMin("Pay Period Filter");

                    Employee.CalcFields("Total Allowances", "Total Deductions");
                    if Abs(Employee."Total Allowances") - Abs(Employee."Total Deductions") = 0 then
                        currXMLport.Skip;

                    ComputatedNetPay := 0;
                    Emp.Reset;
                    Emp.SetRange("No.", Employee."No.");
                    Emp.SetRange("Pay Period Filter", DateSpecified);
                    if Emp.FindSet then begin
                        Emp.CalcFields("Total Allowances", "Total Deductions", interest);
                        BeneficiaryName := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                        ComputatedNetPay := ROUND(Abs(Emp."Total Allowances") - Abs(Emp."Total Deductions"), 0.01, '=');
                        Employee."Net pay" := ComputatedNetPay;
                        //NetPay:=FORMAT(ComputatedNetPay);
                    end;
                end;
            }
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
    trigger OnPreXmlPort()
    begin
        HRSetup.Get();
        if HRSetup."Don't Generate Payroll File" then
            Error('You cannot Generate the payroll file at the moment');
    end;

    var
        AssignMatrix: record 69009;
        AssignMatrix2: record 69009;
        HRSetup: Record "Human Resources Setup";
        amt: Decimal;
        Emp: Record Employee;
        BankCode: Text;
        NetPay1: Text;
        ComputatedNetPay: Decimal;
        DateSpecified: Date;
}
