#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69665 "Selection Committee Vacancy"
{
    PageType = List;
    SourceTable = "Selection Commitee Vacancy";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vacancy ID";"Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID";"Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation";"Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Duty Station ID";"Duty Station ID")
                {
                    ApplicationArea = Basic;
                }
                field("Work Location Details";"Work Location Details")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Openings";"No. of Openings")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13;Outlook)
            {
            }
            systempart(Control14;Notes)
            {
            }
            systempart(Control15;MyNotes)
            {
            }
            systempart(Control16;Links)
            {
            }
        }
    }

    actions
    {
    }
}

