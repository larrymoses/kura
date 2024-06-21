#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69288 "Employee Disciplinary Status."
{
    PageType = List;
    SourceTable = "Employee Disciplinary Status";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Number";"Case Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Disciplinary Status";"Disciplinary Status")
                {
                    ApplicationArea = Basic;
                }
                field("Start Period";"Start Period")
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
                field("End Period";"End Period")
                {
                    ApplicationArea = Basic;
                }
                field(Stop;Stop)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Effect on Payroll";"Effect on Payroll")
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

