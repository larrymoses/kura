#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69110 "Manpower Task Lines"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "ManPower Plan Task Lines";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Task No";"Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Id";"Job Id")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approved Establishment";"Approved Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Active";"Actual Active")
                {
                    ApplicationArea = Basic;
                }
                field(Deficit;Deficit)
                {
                    ApplicationArea = Basic;
                }
                field("Target No.";"Target No.")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Recruited";"Actual Recruited")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Manpower Planning Lines")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    ManPowerPlanningLine.FilterGroup(2);
                    ManPowerPlanningLine.SetRange("Manpower Plan Code","Manpower Plan Code");
                    ManPowerPlanningLine.SetRange("Task No","Task No");
                    ManPowerPlanningLine.SetRange("Job Id","Job Id");
                    ManPowerPlanningLine.FilterGroup(0);
                    ManpowerPlanningLines.SetTableview(ManPowerPlanningLine);
                    ManpowerPlanningLines.Editable := true;
                    ManpowerPlanningLines.Run;
                end;
            }
        }
    }

    var
        ManPowerPlanningLine: Record "ManPower Planning Lines";
        ManpowerPlanningLines: Page "Manpower Planning Lines";
}

