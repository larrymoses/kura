
Page 69152 "Approved Salary Vouchers Temp"
{
    ApplicationArea = Basic;
    CardPageID = "Salary Voucher Temp";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Payroll HeaderT";
    SourceTableView = where(//"Account Type" = const(Casuals),
                            Status = const(Released));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                    Editable = false;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                }
                field("Net Pay"; Rec."Net Pay")
                {
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Department Name"; Rec."Department Name")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Visible = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Status; Rec.Status)
                {
                    Visible = false;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Editable = false;
                }
                field("Time Created"; Rec."Time Created")
                {
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        Rec.SetRange("Responsibility Center", UserSetup."Responsibility Center");
    end;

    var
        UserSetup: Record "User Setup";
}



