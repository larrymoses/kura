#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 69063 "Attendance Register"
{
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Root)
        {
            tableelement("Employee Scedule";"Employee Scedule")
            {
                XmlName = 'EmployeeSchedule';
                fieldelement(EmplNo;"Employee Scedule"."Employee No.")
                {
                }
                fieldelement(Date;"Employee Scedule".Date)
                {
                }

                trigger OnAfterInitRecord()
                begin
                    "Employee Scedule".Type:="Employee Scedule".Type::Attendance;
                    "Employee Scedule"."Training Application No.":=TrainingCode;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        TrainingCode: Code[30];

    procedure GetVariables(TrainingRequests: Record "Training Requests")
    begin
        TrainingCode:=TrainingRequests.Code;
    end;
}

