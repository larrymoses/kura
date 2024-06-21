/// <summary>
/// Page Approved Welfare Memberships (ID 50096).
/// </summary>
page 50096 "Approved Welfare Memberships"
{
    Caption = 'Approved Welfare Memberships';
    PageType = List;
    SourceTable = "Hr Welfare Header";
    CardPageID = "App Welfare  Membership";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTableView = WHERE("Welfare Type"=FILTER(Application),
                            Status=CONST(Released));

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
                field("Welfare Category";Rec."Welfare Category")
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
                field("Total Amount";Rec."Total Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

