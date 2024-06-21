/// <summary>
/// Table Email Reminder Lines (ID 50036).
/// </summary>
table 50036 "Email Reminder Lines"
{
    Caption = 'Email Reminder Lines';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Duration"; Integer)
        {
            Caption = 'Duration';
        }
        field(4; "Duration Type"; Option)
        {
            Caption = 'Duration Type';
            OptionMembers = ,D,M,Y;
        }
        field(5; Level; Integer)
        {
            Caption = 'Level';
        }
    }
    keys
    {
        key(PK; "Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        ERLines.Reset();
        ERLines.SetRange("Document No.", Rec."Document No.");
        if ERLines.FindLast() then
            "Line No." := ERLines."Line No." + 1;
    end;

    var
        ERLines: Record "Email Reminder Lines";
}
