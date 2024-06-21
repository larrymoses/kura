#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 99501 "Emergency Drill Action Plan Li"
{
    PageType = ListPart;
    SourceTable = 69440;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Criteria Code"; "Criteria Code")
                {
                    ApplicationArea = Basic;
                }
                field("Action"; Action)
                {
                    ApplicationArea = Basic;
                }
                field("Action Type"; "Action Type")
                {
                    ApplicationArea = Basic;
                }
                field(Responsibility; Responsibility)
                {
                    ApplicationArea = Basic;
                }
                field("Owner ID"; "Owner ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Date"; "Planned Date")
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
