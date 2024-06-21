/// <summary>
/// Page Closed Welfare Benefits (ID 50110).
/// </summary>
page 50110 "Closed Welfare Benefits"
{
    Caption = 'Closed Welfare Benefits';
    PageType = List;
    SourceTable = "Hr Welfare Header";
    CardPageID = "App Welfare Benefit";
    SourceTableView = WHERE("Welfare Type"=FILTER(Benefit),
                            Status=CONST(Closed));

    layout
    {
        area(content)
        {
            repeater(Group)
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
            }
        }
    }

    actions
    {
    }
}

