page 99538 "Road Conditions"
{
    ApplicationArea = All;
    Caption = 'Road Conditions';
    PageType = List;
    SourceTable = "Road Conditions";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                 field("RICS Type";Rec."RICS Type")
                {
                    ApplicationArea = Basic;
                }
                field("Condition Code"; Rec."Condition Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Condition Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                 field("Minimum Percentage";Rec."Minimum Percentage")
                {
                    ApplicationArea = Basic;
                }
                  field("Maximum Percentage";Rec."Maximum Percentage")
                {
                    ApplicationArea = Basic;
                }
                  field(Blocked;Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
               
            }
        }
    }
}
