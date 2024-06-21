/// <summary>
/// Table Subscription Conference Lines (ID 50032).
/// </summary>
table 50032 "Subscription Conference Lines"
{
    Caption = 'Subscription Conference Lines';
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
        field(3; "Member No."; Code[20])
        {
            Caption = 'Member No.';
            TableRelation = ProfessionalBodyMembers."Membership No.";

            trigger OnValidate()
            var
                PBMembers: Record ProfessionalBodyMembers;
            begin
                PBMembers.Reset();
                PBMembers.SetRange("Membership No.", "Member No.");
                if PBMembers.Find('-') then
                    "Member Name" := PBMembers.Name;
                    Member := PBMembers.Member;
                    "Professional Body Code" := PBMembers."Document No.";
                    Rec.Validate("Professional Body Code");
            end;
        }
        field(4; "Member Name"; Text[100])
        {
            Caption = 'Member Name';
        }
        field(5; "Points Earned"; Decimal)
        {
            Caption = 'Points Earned';
        }
        field(6; Member; Code[20])
        {
            Caption = 'Member';
        }
        field(7; "Professional Body Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Professional Body Code"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                PBody: Record "Professional Bodies";
            begin
                PBody.Reset();
                PBody.SetRange("No.", "Professional Body Code");
                if PBody.Find('-') then
                    "Professional Body Name" := PBody.Name;
            end;
        }
        field(9; "Course Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Feedback; Text[550])
        {
            DataClassification = ToBeClassified;
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
    var
        ConferenceLines: Record "Subscription Conference Lines";
    begin
        ConferenceLines.Reset();
        ConferenceLines.SetRange("Document No.", Rec."Document No.");
        if ConferenceLines.FindLast() then
            "Line No." := ConferenceLines."Line No." + 1;
    end;

    trigger OnModify()
    begin
        ConferenceH.CalcFields("Total Course Fees", "Total Points Earned");
    end;

    trigger OnDelete()
    begin
        ConferenceH.CalcFields("Total Course Fees", "Total Points Earned");
    end;

    trigger OnRename()
    begin
        ConferenceH.CalcFields("Total Course Fees", "Total Points Earned");
    end;

    var
        ConferenceH: Record "Subscriptions Conferences H";
}
