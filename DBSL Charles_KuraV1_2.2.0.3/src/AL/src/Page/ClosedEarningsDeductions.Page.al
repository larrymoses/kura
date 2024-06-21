#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69050 "Closed Earnings/Deductions"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = List;
    SourceTable = "Assignment Matrix-X";
    SourceTableView = sorting("Employee No",Type,Code,"Payroll Period","Reference No")
                      order(ascending)
                      where(Closed=const(true));
    UsageCategory = Lists;

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
                field("First Name";"First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name";"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name";"Last Name")
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
                field("Effective Start Date";"Effective Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective End Date";"Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period";"Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Opening Balance";"Opening Balance")
                {
                    ApplicationArea = Basic;
                }
                field("KRA Classification";"KRA Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Interest";"Advance Interest")
                {
                    ApplicationArea = Basic;
                }
                field("Negative Earning";"Negative Earning")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Balance";"Closing Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Days Worked/Lost";"Days Worked/Lost")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Hours";"No. Of Hours")
                {
                    ApplicationArea = Basic;
                }
                field(Taxable;Taxable)
                {
                    ApplicationArea = Basic;
                }
                field("Tax Deductible";"Tax Deductible")
                {
                    ApplicationArea = Basic;
                }
                field(Frequency;Frequency)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Period";"Pay Period")
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
                field("Profit Centre";"Profit Centre")
                {
                    ApplicationArea = Basic;
                }
                field(Branch;Branch)
                {
                    ApplicationArea = Basic;
                }
                field("Department Code";"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Staffing Group";"Staffing Group")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Point";"Pay Point")
                {
                    ApplicationArea = Basic;
                }
                field("Next Period Entry";"Next Period Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Fluctuating";"Non-Fluctuating")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group Filter";"Posting Group Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Initial Amount";"Initial Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Outstanding Amount";"Outstanding Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary Code";"Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Group";"Payroll Group")
                {
                    ApplicationArea = Basic;
                }
                field(Rank;Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Grouping";"Payroll Grouping")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000041;Notes)
            {
            }
            systempart(Control1000000042;MyNotes)
            {
            }
            systempart(Control1000000043;Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);

        if UserSetup."Payroll View"=false then

        Error('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        UserSetup: Record "User Setup";
}

