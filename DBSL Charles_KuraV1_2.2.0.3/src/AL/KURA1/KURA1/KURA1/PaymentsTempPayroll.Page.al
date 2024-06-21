#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69098 "Payments Temp Payroll"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Assignment Matrix-X Temp-E";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posting Group Filter"; Rec."Posting Group Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Rate Type"; Rec."Rate Type")
                {
                    ApplicationArea = Basic;
                    Visible = (Rec.Type = Rec.Type::Payment);
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = Basic;
                    Visible = (Rec.Type = Rec.Type::Payment);
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Effective Start Date"; Rec."Effective Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Opening Balance"; Rec."Opening Balance")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Closing Balance"; Rec."Closing Balance")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee Voluntary"; Rec."Employee Voluntary")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employer Amount"; Rec."Employer Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Next Period Entry"; Rec."Next Period Entry")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Non-Cash Benefit"; Rec."Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
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

