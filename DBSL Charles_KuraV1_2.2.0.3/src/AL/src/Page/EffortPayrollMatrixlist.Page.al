#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65093 "Effort & Payroll Matrix list"
{
    Caption = 'Effort & Payroll Matrixs';
    PageType = List;
    SourceTable = "Effort & Payroll Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Task No";"Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Resource ID";"Resource ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Position";"Project Position")
                {
                    ApplicationArea = Basic;
                }
                field("FTE Effort (%)";"FTE Effort (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Project Invoice Currency Code";"Project Invoice Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Earning Code";"Payroll Earning Code")
                {
                    ApplicationArea = Basic;
                }
                field("Earning Description";"Earning Description")
                {
                    ApplicationArea = Basic;
                }
                field("FTE Annual Earning Amount";"FTE Annual Earning Amount")
                {
                    ApplicationArea = Basic;
                }
                field("FTE Annual Earning Amount(LCY)";"FTE Annual Earning Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Earned Amount";"Monthly Earned Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Monthly Earned Amount(LCY)";"Monthly Earned Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Starting Pay Period";"Starting Pay Period")
                {
                    ApplicationArea = Basic;
                }
                field("Ending Pay Period";"Ending Pay Period")
                {
                    ApplicationArea = Basic;
                }
                field("Last Payroll Run Period";"Last Payroll Run Period")
                {
                    ApplicationArea = Basic;
                }
                field("Total Posted Earnin(LCY)";"Total Posted Earnin(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

