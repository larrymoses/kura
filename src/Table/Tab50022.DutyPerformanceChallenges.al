/// <summary>
/// Table DutyPerformanceChallenges (ID 50022).
/// </summary>
table 50022 DutyPerformanceChallenges
{
    Caption = 'Duty Performance Challenges';
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
        field(3; Challenge; Text[550])
        {
            Caption = 'Challenge';
        }
        field(4; "Training Suggested"; Text[550])
        {
            Caption = 'Training Suggestion';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Challenges: Record DutyPerformanceChallenges;
    begin
        Challenges.Reset();
        Challenges.SetRange("Document No.", Rec."Document No.");
        if Challenges.FindLast() then begin
            "Line No." := Challenges."Line No." + 1;
        end;
    end;
}
