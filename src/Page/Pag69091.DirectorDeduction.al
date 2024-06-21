#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69091 "Director Deduction"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Director Deductions";
    UsageCategory = Lists;

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
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Tax deductible";"Tax deductible")
                {
                    ApplicationArea = Basic;
                }
                field("Start date";"Start date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field("Calculation Method";"Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account";"G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("Flat Amount";"Flat Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filter";"Date Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group Filter";"Posting Group Filter")
                {
                    ApplicationArea = Basic;
                }
                field(Loan;Loan)
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Amount";"Maximum Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Period Filter";"Pay Period Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Pension Scheme";"Pension Scheme")
                {
                    ApplicationArea = Basic;
                }
                field("Deduction Table";"Deduction Table")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account Employer";"G/L Account Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Employer";"Percentage Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Amount";"Minimum Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Flat Amount Employer";"Flat Amount Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Show Balance";"Show Balance")
                {
                    ApplicationArea = Basic;
                }
                field(CoinageRounding;CoinageRounding)
                {
                    ApplicationArea = Basic;
                }
                field("Director Filter";"Director Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Balance";"Opening Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Department Filter";"Department Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Show on report";"Show on report")
                {
                    ApplicationArea = Basic;
                }
                field("PAYE Code";"PAYE Code")
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
                field("Insurance Code";"Insurance Code")
                {
                    ApplicationArea = Basic;
                }
                field(Block;Block)
                {
                    ApplicationArea = Basic;
                }
                field("Institution Code";"Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Payslip Information";"Show on Payslip Information")
                {
                    ApplicationArea = Basic;
                }
                field(Statutory;Statutory)
                {
                    ApplicationArea = Basic;
                }
                field("No of Entries";"No of Entries")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000042;Outlook)
            {
            }
            systempart(Control1000000043;Notes)
            {
            }
            systempart(Control1000000044;MyNotes)
            {
            }
            systempart(Control1000000045;Links)
            {
            }
        }
    }

    actions
    {
    }
}

