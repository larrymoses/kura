#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69285 "Employee Posting Group Temp"
{
    ApplicationArea = Basic;
    Caption = 'Employee Posting Group Temporary Staff';
    PageType = List;
    SourceTable = "Employee Posting GroupX Temp";
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
                field("Overtime Base Hrs";"Overtime Base Hrs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Guards Wages Daily Rate";"Guards Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Drivers Wages Daily Rate";"Drivers Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Monthly Working Days";"Monthly Working Days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Annual Leave Days";"Annual Leave Days")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Interest on advance rate";"Interest on advance rate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payroll Group";"Payroll Group")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Payslip Message";"Payslip Message")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Job;Job)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task No";"Job Task No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Exchequer;Exchequer)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Map Accounts to Posting Group")
            {
                ApplicationArea = Basic;
                Image = MapAccounts;
                Promoted = true;
                PromotedCategory = Process;
                RunPageOnRec = true;

                trigger OnAction()
                begin
                    UserSetup.Get(UserId);
                    CasualsP.Reset;
                    CasualsP.SetRange("Responsibility Center",UserSetup."Responsibility Center");
                    CasualsP.SetRange("Employee PGroup",Rec.Code);
                    Page.Run(69171,CasualsP);
                end;
            }
        }
    }

    var
        CasualsP: Record "Casuals PGroup Accounts";
        UserSetup: Record "User Setup";
}

