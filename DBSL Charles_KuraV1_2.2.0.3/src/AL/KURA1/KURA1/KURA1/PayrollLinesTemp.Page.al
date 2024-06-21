#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69148 "Payroll Lines Temp"
{
    PageType = List;
    SourceTable = "Payroll LinesT";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No";"Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Personal No.";"Personal No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period";"Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary";"Basic Salary")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Basic Arrears";"Basic Arrears")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Gross Pay";"Gross Pay")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Deduction";"Total Deduction")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Netpay;Netpay)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payroll Header";"Payroll Header")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payroll Group";"Payroll Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

