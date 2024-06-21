#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69802 "Shortlist Score Guide"
{
    PageType = List;
    SourceTable = "Candidate Shortlist Score Guid";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requirement ID";"Requirement ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requirement Name";"Requirement Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Score Code";"Score Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Points;Points)
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

