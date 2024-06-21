table 99617 "Contract Termination Reasons"
{
    Caption = 'Contract Termination Reasons';


    fields
    {
        field(1; "Contract No."; Code[20])
        {
            Caption = 'Contract No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Reason; Text[250])
        {
            Caption = 'Reason';
        }
    }
    keys
    {
        key(PK; "Contract No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Reasons: Record "Contract Termination Reasons";
    begin
        Reasons.Reset();
        Reasons.SetRange("Contract No.", Rec."Contract No.");
        if Reasons.FindLast() then
            Rec."Line No." := Reasons."Line No." + 1
        else
            Rec."Line No." := 1;
    end;
}
