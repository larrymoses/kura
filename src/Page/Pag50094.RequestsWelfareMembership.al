/// <summary>
/// Page Requests Welfare Membership (ID 50094).
/// </summary>
page 50094 "Requests Welfare Membership"
{
    Caption = 'Requests Welfare Membership';
    PageType = List;
    SourceTable = "Hr Welfare Header";
    CardPageID = "Request Welfare Membership";
    SourceTableView = WHERE("Welfare Type"=FILTER(Application),
                            Status=FILTER(Open|"Pending Approval"));
    
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

