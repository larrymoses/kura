#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69097 "Deductions Temp"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "DeductionsX Temp-E";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Statutory;Statutory)
                {
                    ApplicationArea = Basic;
                }
                field("Balance Type";"Balance Type")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Payslip Information";"Show on Payslip Information")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("G/L Account";"G/L Account")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Start date";"Start date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Code";"Institution Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Insurance Code";"Insurance Code")
                {
                    ApplicationArea = Basic;
                }
                field(Block;Block)
                {
                    ApplicationArea = Basic;
                }
                field(Reference;Reference)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Pension Limit Percentage";"Pension Limit Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Limit Amount";"Pension Limit Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Applies to All";"Applies to All")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Master Roll";"Show on Master Roll")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Calculation Method";"Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field("Deduction Table";"Deduction Table")
                {
                    ApplicationArea = Basic;
                }
                field("Flat Amount";"Flat Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Flat Amount Employer";"Flat Amount Employer")
                {
                    ApplicationArea = Basic;
                }
                field("PAYE Code";"PAYE Code")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Amount";"Maximum Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount Employer";"Total Amount Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Scheme";"Pension Scheme")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Employer";"Percentage Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Voluntary Percentage";"Voluntary Percentage")
                {
                    ApplicationArea = Basic;
                }
                field("Tax deductible";"Tax deductible")
                {
                    ApplicationArea = Basic;
                }
                field("Show Balance";"Show Balance")
                {
                    ApplicationArea = Basic;
                }
                field(Shares;Shares)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Show on report";"Show on report")
                {
                    ApplicationArea = Basic;
                }
                field("Co-operative";"Co-operative")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Both Signs";"Both Signs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Pay Period Filter";"Pay Period Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posting Group Filter";"Posting Group Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payroll Grouping Filter";"Payroll Grouping Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Branch Filter";"Branch Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("ProfitCtr Filter";"ProfitCtr Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department Filter";"Department Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("OP Deduction";"OP Deduction")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000034;Notes)
            {
            }
            systempart(Control1000000035;MyNotes)
            {
            }
            systempart(Control1000000036;Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        TestField("Total Amount",0);
    end;
}

