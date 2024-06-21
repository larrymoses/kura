/// <summary>
/// Page App Welfare Benefit (ID 50109).
/// </summary>
page 50109 "App Welfare Benefit"
{
    Caption = 'App Welfare Benefit';
    PageType = Card;
    SourceTable = "Hr Welfare Header";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Welfare No.";Rec."Welfare No.")
                {
                }
                field("Welfare Type";Rec."Welfare Type")
                {
                }
                field("Raised By";Rec."Raised By")
                {
                }
                field("Raisee Name";Rec."Raisee Name")
                {
                }
                field(Description;Rec.Description)
                {
                }
                field("Created By";Rec."Created By")
                {
                }
                field("Created On";Rec."Created On")
                {
                }
                field(Status;Rec.Status)
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                }
                field("Global Dimension 1";Rec."Global Dimension 1")
                {
                }
                field("Global Dimension 2";Rec."Global Dimension 2")
                {
                }
                field("Benefit Allocation";Rec."Benefit Allocation")
                {
                }
            }
        }
    }

    actions
    {
    }
}

