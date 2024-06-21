#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69150 "Payroll Processing List Temp"
{
    ApplicationArea = Basic;
    CardPageID = "Payroll Header Temp";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Payroll HeaderT";
    SourceTableView = where(Posted=const(false),
                            "Account Type"=const(Casuals),
                            Status=filter(<>Released));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Period";"Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field("Gross Pay";"Gross Pay")
                {
                    ApplicationArea = Basic;
                }
                field("Net Pay";"Net Pay")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By";"Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Total Deductions";"Total Deductions")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Account Type" := "account type"::Casuals;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Account Type" := "account type"::Casuals;
    end;

    trigger OnOpenPage()
    begin
        "Account Type" := "account type"::Casuals;
        UserSetup.Get(UserId);
        Rec.SetRange("Responsibility Center",UserSetup."Responsibility Center");
    end;

    var
        UserSetup: Record "User Setup";
}

