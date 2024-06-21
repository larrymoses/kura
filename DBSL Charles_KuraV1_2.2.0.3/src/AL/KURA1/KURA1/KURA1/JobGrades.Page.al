#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69687 "Job Grades"
{
    ApplicationArea = Basic;
    CardPageID = "Salary Scales";
    Editable = false;
    PageType = List;
    SourceTable = "Salary Scales";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Scale; Scale)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                // field("Appointment Authorit y";"Appointment Authority")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Overall Appointment Authority';
                // }
                // field("Seniority Leve l";"Seniority Level")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Default Seniority Level';
                // }
                // field("Valid Position s";"Valid Positions")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Active Employee s";"Active Employees")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Block ed;Blocked)
                //{
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000010; Outlook)
            {
            }
            systempart(Control1000000011; Notes)
            {
            }
            systempart(Control1000000012; MyNotes)
            {
            }
            systempart(Control1000000013; Links)
            {
            }
        }
    }

    actions
    {
    }
}

