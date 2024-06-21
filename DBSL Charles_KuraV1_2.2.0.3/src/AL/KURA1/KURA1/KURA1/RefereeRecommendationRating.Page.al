#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69758 "Referee Recommendation Rating"
{
    PageType = List;
    SourceTable = "Referee Recomm Rating";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Skills and Competency ID";"Skills and Competency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Qualification Code";"Qualification Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Rating of Candidate";"Rating of Candidate")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Comments";"Additional Comments")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11;Outlook)
            {
            }
            systempart(Control12;Notes)
            {
            }
            systempart(Control13;MyNotes)
            {
            }
            systempart(Control14;Links)
            {
            }
        }
    }

    actions
    {
    }
}

