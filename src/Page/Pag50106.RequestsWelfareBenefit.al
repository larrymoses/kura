/// <summary>
/// Page Requests Welfare Benefit (ID 50106).
/// </summary>
page 50106 "Requests Welfare Benefit"
{
    Caption = 'Requests Welfare Benefit';
    PageType = List;
    SourceTable = "Hr Welfare Header";
    CardPageID = "Request Welfare  Benefit";
    SourceTableView = WHERE("Welfare Type"=FILTER(Benefit));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Welfare No.";Rec."Welfare No.")
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
                field("Benefit Allocation";Rec."Benefit Allocation")
                {
                }
                field(Status;Rec.Status)
                {
                    Visible = false;
                }
                field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
                {
                    Visible = false;
                }
                field("Global Dimension 1";Rec."Global Dimension 1")
                {
                    Visible = false;
                }
                field("Global Dimension 2";Rec."Global Dimension 2")
                {
                    Visible = false;
                }
                field("Welfare Type";Rec."Welfare Type")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

