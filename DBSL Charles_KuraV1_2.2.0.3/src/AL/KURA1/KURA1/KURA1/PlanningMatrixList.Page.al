#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59069 "Planning Matrix List"
{
    PageType = ListPart;
    SourceTable = "Planning Marix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Strategic Themes";"Strategic Themes")
                {
                    ApplicationArea = Basic;
                }
                field("Strategic Objectives";"Strategic Objectives")
                {
                    ApplicationArea = Basic;
                }
                field(Strategies;Strategies)
                {
                    ApplicationArea = Basic;
                }
                field(Activities;Activities)
                {
                    ApplicationArea = Basic;
                }
                field(KPI;KPI)
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code";"Fund Code")
                {
                    ApplicationArea = Basic;
                }
                field(Target;Target)
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
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

