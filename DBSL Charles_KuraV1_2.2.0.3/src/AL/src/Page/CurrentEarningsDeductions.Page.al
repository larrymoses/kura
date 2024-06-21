#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69041 "Current Earnings/Deductions"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Assignment Matrix-X";
    SourceTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No")
                      order(ascending)
                      where(Closed = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; "First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; "Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; "Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period"; "Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Start Date"; "Effective Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective End Date"; "Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Balance"; "Opening Balance")
                {
                    ApplicationArea = Basic;
                }
                field("KRA Classification"; "KRA Classification")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Balance"; "Closing Balance")
                {
                    ApplicationArea = Basic;
                }
                field(Taxable; Taxable)
                {
                    ApplicationArea = Basic;
                }
                field("Tax Deductible"; "Tax Deductible")
                {
                    ApplicationArea = Basic;
                }
                field(Frequency; Frequency)
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay"; "Basic Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Employer Amount"; "Employer Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Next Period Entry"; "Next Period Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Non-Fluctuating"; "Non-Fluctuating")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group Filter"; "Posting Group Filter")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary Code"; "Basic Salary Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Branch; Branch)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Pay Period"; "Pay Period")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Days Worked/Lost"; "Days Worked/Lost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payroll Group"; "Payroll Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. Of Hours"; "No. Of Hours")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Profit Centre"; "Profit Centre")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Staffing Group"; "Staffing Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Negative Earning"; "Negative Earning")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Pay Point"; "Pay Point")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Initial Amount"; "Initial Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Outstanding Amount"; "Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Rank; Rank)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payroll Grouping"; "Payroll Grouping")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Advance Interest"; "Advance Interest")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000041; Notes)
            {
            }
            systempart(Control1000000042; MyNotes)
            {
            }
            systempart(Control1000000043; Links)
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

        if UserSetup."Payroll View" = false then
            Error('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        UserSetup: Record "User Setup";
}

