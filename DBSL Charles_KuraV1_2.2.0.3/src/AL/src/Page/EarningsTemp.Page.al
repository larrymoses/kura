#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69096 "Earnings Temp"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "EarningsX Temp-E";
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
                field("Show on Master Roll";"Show on Master Roll")
                {
                    ApplicationArea = Basic;
                }
                field("Show No.of Days";"Show No.of Days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Show No.of Hours";"Show No.of Hours")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Basic Salary Code";"Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay Arrears";"Basic Pay Arrears")
                {
                    ApplicationArea = Basic;
                }
                field("KRA Classification";"KRA Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Allowance Code";"Responsibility Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Commuter Allowance Code";"Commuter Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("House Allowance Code";"House Allowance Code")
                {
                    ApplicationArea = Basic;
                }
                field("Earning Type";"Earning Type")
                {
                    ApplicationArea = Basic;
                }
                field("Fluctuation Type";"Fluctuation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Applies to All";"Applies to All")
                {
                    ApplicationArea = Basic;
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
                field(Block;Block)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Type";"Pay Type")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Calculation Method";"Calculation Method")
                {
                    ApplicationArea = Basic;
                }
                field("Earnings Table";Rec."Earnings Table")
                {
                     ApplicationArea = Basic;
                }
                field("Flat Amount";Rec."Flat Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Rec.Percentage)
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Employer";Rec."Percentage Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Calculate Excess Pension";Rec."Calculate Excess Pension")
                {
                    ApplicationArea = Basic;
                }
                field(Taxable;Rec.Taxable)
                {
                    ApplicationArea = Basic;
                }
                field(Honoraria;Honoraria)
                {
                    ApplicationArea = Basic;
                }
                field("Reduces Tax";"Reduces Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Cash Benefit";"Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                }
                field(OverTime;OverTime)
                {
                    ApplicationArea = Basic;
                }
                field("Low Interest Benefit";"Low Interest Benefit")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Limit";"Minimum Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Limit";"Maximum Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount";"Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Show Balance";"Show Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Show on Report";"Show on Report")
                {
                    ApplicationArea = Basic;
                }
                field("Total Days";"Total Days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Negative Earning";"Negative Earning")
                {
                    ApplicationArea = Basic;
                }
                field("Date Filter";"Date Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posting Group Filter";"Posting Group Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Pay Period Filter";"Pay Period Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payroll Grouping Filter";"Payroll Grouping Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("ProfitCtr Filter";"ProfitCtr Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Branch Filter";"Branch Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department Filter";"Department Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Rank Filter";"Rank Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000036;Notes)
            {
            }
            systempart(Control1000000037;MyNotes)
            {
            }
            systempart(Control1000000038;Links)
            {
            }
        }
    }

    actions
    {
    }
}

