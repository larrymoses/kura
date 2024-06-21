#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 58166 "Std. Monthly E\D Comparison"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Std. Monthly ED Comparison.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "No.","Emplymt. Contract Code",Status;
            column(ReportForNavId_7; 7)
            {
            }
            column(No_Employee;Employee."No.")
            {
            }
            column(FirstName_Employee;Employee."First Name")
            {
            }
            column(MiddleName_Employee;Employee."Middle Name")
            {
            }
            column(LastName_Employee;Employee."Last Name")
            {
            }
            column(Initials_Employee;Employee.Initials)
            {
            }
            column(EmployeeName;EmployeeName)
            {
            }
            dataitem("Assignment Matrix-X";"Assignment Matrix-X")
            {
                DataItemLink = "Employee No"=field("No.");
                RequestFilterFields = "Code","Payroll Period";
                column(ReportForNavId_1; 1)
                {
                }
                column(Code_PayrollTransactionLedger;"Assignment Matrix-X".Code)
                {
                }
                column(EmployeeNo_PayrollTransactionLedger;"Assignment Matrix-X"."Employee No")
                {
                }
                column(Period_PayrollTransactionLedger;"Assignment Matrix-X"."Payroll Period")
                {
                }
                column(Description_PayrollTransactionLedger;"Assignment Matrix-X".Description)
                {
                }
                column(Amount_PayrollTransactionLedger;"Assignment Matrix-X".Amount)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                EmployeeName := Employee."First Name" +' '+Employee."Middle Name"+' '+Employee."Last Name";
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

    var
        EmployeeName: Text;
}

