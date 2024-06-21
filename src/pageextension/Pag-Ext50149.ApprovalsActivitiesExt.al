pageextension 50149 "Approvals Activities Ext" extends "Approvals Activities"
{
    layout{
        addafter("Requests to Approve")
        {
            field("Approved Entries";Rec."Approved Entries")
            {
                ApplicationArea = Suite;
                    DrillDownPageID = "Approved Entries";
            }
        }
    }
}
