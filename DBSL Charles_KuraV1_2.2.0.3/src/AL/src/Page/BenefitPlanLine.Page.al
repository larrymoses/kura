#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69786 "Benefit Plan Line"
{
    PageType = ListPart;
    SourceTable = "Benefit Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Package ID";"Package ID")
                {
                    ApplicationArea = Basic;
                }
                field("Plan ID";"Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Job Grades";"No. of Job Grades")
                {
                    ApplicationArea = Basic;
                }
                field("Employment Type";"Employment Type")
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
            group("Job Grades")
            {
                action("Benefit Plan Grade")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    RunObject = Page "Benefit Plan Grade";
                    RunPageLink = "Package ID"=field("Package ID"),
                                  "Plan ID"=field("Plan ID");
                }
                action("Grade Benefits")
                {
                    ApplicationArea = Basic;
                    Image = BinContent;
                    RunObject = Page "Job Grades Benefits";
                    RunPageLink = "Salary Scale"=field("Plan ID");
                }
            }
        }
    }
}

