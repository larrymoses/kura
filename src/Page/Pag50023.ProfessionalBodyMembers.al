/// <summary>
/// Page ProfessionalBodyMembers (ID 50023).
/// </summary>
page 50023 ProfessionalBodyMembers
{
    Caption = 'Professional Body Members';
    PageType = ListPart;
    SourceTable = ProfessionalBodyMembers;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Membership No."; Rec."Membership No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Membership No. field.';
                }
                field("Practicing Licence No."; Rec."Practicing Licence No.")
                {
                    ApplicationArea = All;
                }
                field("Membership Category";Rec."Membership Category")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field(Designation;Rec.Designation)
                {
                    ApplicationArea = All;
                }
                field(Department;Rec.Department)
                {
                    ApplicationArea = All;
                }
                field(Directorate;Rec.Directorate)
                {
                    ApplicationArea = All;
                }
                field("Annual Fee Payable";Rec."Annual Fee Payable")
                {
                    ApplicationArea = All;
                }
                field("CPD Points Required";Rec."CPD Points Required")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
