/// <summary>
/// Table Archive Reasons (ID 99609).
/// </summary>
table 99609 "Archive Reasons"
{
    Caption = 'Archive Reasons';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
           // AutoIncrement = true;
        }
        field(2; "Document No."; Code[50])
        {
            Caption = 'Document No.';
        }
        field(3; "Record ID"; RecordId)
        {
            Caption = 'Record ID';
        }
        field(4; "Action Type"; Enum "Archive Action")
        {
            Caption = 'Action Type';
        }
        field(5; Reason; Text[200])
        {
            Caption = 'Reason';
        }
        field(6; "Document Type"; Enum "Approval Document Type")
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Table ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.","Action Type","Document No.","Table ID")
        {
            Clustered = true;
        }
        key(Key2; "Record ID" )
        {
        }
    }
    trigger OnInsert()
    var
        AR: Record "Archive Reasons";
        Port: Codeunit portal;
    begin
        Rec."Entry No." := LastEntryNo+1;
        if (Rec."Document No." <> '') and (Rec."Table ID" <> 0) and (Rec."Document Type" <> Rec."Document Type"::" ") then begin
            Rec."Record ID" := Port.GetRecordID(Rec."Table ID", Rec."Document No.", Rec."Document Type");
        end;
    end;
    procedure LastEntryNo():Integer
    var
    AR: Record "Archive Reasons";
    begin
AR.Reset();
if AR.FindLast() then
exit(AR."Entry No.");
    end;
}
