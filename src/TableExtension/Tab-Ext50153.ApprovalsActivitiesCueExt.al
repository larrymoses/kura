tableextension 50153 "Approvals Activities Cue Ext" extends "Approvals Activities Cue"
{
    fields
    {
       field(50100; "Approved Entries"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = filter(Approved)));
            Caption = 'Approved Entries';
            FieldClass = FlowField;
        }
    }
}
