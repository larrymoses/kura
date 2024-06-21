#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69147 "Employee PGroupsTemp"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Temp Employee PGroups";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posting Group";"Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type";"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account";"G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("GL Account Employer";"GL Account Employer")
                {
                    ApplicationArea = Basic;
                }
                field("Account No.";"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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

    trigger OnInit()
    begin
        UserSetup.Get(UserId);
    end;

    trigger OnOpenPage()
    begin
        Rec.SetRange("Responsibility Center",UserSetup."Responsibility Center");
    end;

    var
        UserSetup: Record "User Setup";
}

