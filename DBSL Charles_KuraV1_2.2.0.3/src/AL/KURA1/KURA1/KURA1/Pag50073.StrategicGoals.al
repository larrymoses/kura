page 50073 "Strategic Goals"
{
    ApplicationArea = All;
    Caption = 'Strategic Goals';
    PageType = List;
    SourceTable = "Stategic Goals";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Strategic Plan ID"; Rec."Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Theme ID"; Rec."Theme ID")
                {
                    ApplicationArea = Basic;
                }
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Strategies"; Rec."No. of Strategies")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Strategic Initiatives"; Rec."No. of Strategic Initiatives")
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
