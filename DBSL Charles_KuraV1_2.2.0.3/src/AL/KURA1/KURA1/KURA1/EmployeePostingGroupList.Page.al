#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69042 "Employee Posting Group List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Employee Posting GroupX";

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
                field("Overtime Base Hrs";"Overtime Base Hrs")
                {
                    ApplicationArea = Basic;
                }
                field("Guards Wages Daily Rate";"Guards Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Drivers Wages Daily Rate";"Drivers Wages Daily Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Working Days";"Monthly Working Days")
                {
                    ApplicationArea = Basic;
                }
                field("Interest on advance rate";"Interest on advance rate")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Group";"Payroll Group")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Leave Days";"Annual Leave Days")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000012;Notes)
            {
            }
            systempart(Control1000000013;MyNotes)
            {
            }
            systempart(Control1000000014;Links)
            {
            }
        }
    }

    actions
    {
    }
}

