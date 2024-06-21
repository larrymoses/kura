#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69019 "Payments_Deductions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Assignment Matrix-X";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period";"Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay";"Basic Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Employer Amount";"Employer Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Gratuity Amount";"Gratuity Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code";"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary Code";"Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field("Profit Centre";"Profit Centre")
                {
                    ApplicationArea = Basic;
                }
                field(Branch;Branch)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Point";"Pay Point")
                {
                    ApplicationArea = Basic;
                }
                field("Staffing Group";"Staffing Group")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

