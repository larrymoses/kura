#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69099 "Deductions Temp Payroll"
{
    Editable = false;
    PageType = List;
    SourceTable = "Assignment Matrix-X Temp-E";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code";Code)
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
                field("Payroll Period";"Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Pay";"Basic Pay")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employer Amount";"Employer Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Gratuity Amount";"Gratuity Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department Code";"Department Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Basic Salary Code";"Basic Salary Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Profit Centre";"Profit Centre")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Branch;Branch)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Pay Point";"Pay Point")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Staffing Group";"Staffing Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.SetRange("Responsibility Center",UserSetup."Responsibility Center");
    end;

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        Rec.SetRange("Responsibility Center",UserSetup."Responsibility Center");
    end;

    var
        UserSetup: Record "User Setup";
}

