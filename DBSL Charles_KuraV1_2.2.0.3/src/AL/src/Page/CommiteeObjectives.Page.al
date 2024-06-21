#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80162 "Commitee Objectives"
{
    PageType = ListPart;
    SourceTable = "Commitee Objectives";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee ID";"Committee ID")
                {
                    ApplicationArea = Basic;
                    Visible = false ;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field(Objective;Objective)
                {
                    ApplicationArea = Basic;
                }
                field(Target;Target)
                {
                    ApplicationArea = Basic;
                }
                field(Achievement;Achievement)
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Person";"Responsible Person")
                {
                    ApplicationArea = Basic;
                }
                field("Date Achieved";"Date Achieved")
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

