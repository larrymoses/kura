#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72111 "Monthly Evaluation Line"
{
    PageType = ListPart;
    SourceTable = "Monthly Evaluation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No";"Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No";"Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No";"Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name";"Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Scope;Scope)
                {
                    ApplicationArea = Basic;
                }
                field(Requirement;Requirement)
                {
                    ApplicationArea = Basic;
                }
                field(Pass;Pass)
                {
                    ApplicationArea = Basic;
                }
                field(Fail;Fail)
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

