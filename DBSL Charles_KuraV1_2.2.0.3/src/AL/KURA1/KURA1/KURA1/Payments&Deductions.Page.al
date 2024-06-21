#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69006 "Payments & Deductions"
{
    //   DeleteAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Assignment Matrix-X";

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
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Opening Balance"; Rec."Opening Balance")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Closing Balance"; Rec."Closing Balance")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Days Worked/Lost"; Rec."Days Worked/Lost")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. Of Hours"; Rec."No. Of Hours")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Effective Start Date"; Rec."Effective Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee Voluntary"; Rec."Employee Voluntary")
                {
                    ApplicationArea = Basic;
                }
                field("Employer Amount"; Rec."Employer Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Next Period Entry"; Rec."Next Period Entry")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group Filter"; Rec."Posting Group Filter")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Profit Centre"; Rec."Profit Centre")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Staffing Group"; Rec."Staffing Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Pay Point"; Rec."Pay Point")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payroll Grouping"; Rec."Payroll Grouping")
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
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                }
                field("Is Insuarance?"; Rec."Is Insuarance?")
                {
                    ApplicationArea = Basic;
                    Caption = 'Is Insuarance?';
                }

                field("Is Personal Insurance"; Rec."Is Personal Insurance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Is Personal Insurance?';
                }

            }
        }
    }


    actions
    {
    }

}

#pragma implicitwith restore

