#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
XmlPort 69100 "Manpower Planning Lines"
{
    Format = VariableText;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement("ManPower Planning Lines";"ManPower Planning Lines")
            {
                XmlName = 'ManPowerPlanningLines';
                fieldelement(TaskNo;"ManPower Planning Lines"."Task No")
                {
                }
                fieldelement(JobId;"ManPower Planning Lines"."Job Id")
                {
                }
                fieldelement(DepartmentCode;"ManPower Planning Lines"."Responsibility Center Code")
                {
                }
                fieldelement(Q1Target;"ManPower Planning Lines"."Quarter 1 Target")
                {
                }
                fieldelement(Q2Target;"ManPower Planning Lines"."Quarter 2 Target")
                {
                }
                fieldelement(Q3Target;"ManPower Planning Lines"."Quarter 3 Target")
                {
                }
                fieldelement(Q4Target;"ManPower Planning Lines"."Quarter 4 Target")
                {
                }
                fieldelement(EstimatedCost;"ManPower Planning Lines"."Estimated Costs")
                {
                }
                fieldelement(ManpowerCode;"ManPower Planning Lines"."Manpower Plan Code")
                {
                }
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
}

