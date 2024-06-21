/// <summary>
/// Table Subscriptions Conferences H (ID 50031).
/// </summary>
table 50031 "Subscriptions Conferences H"
{
    Caption = 'Subscriptions Conferences H';
    DataClassification = ToBeClassified;
    LookupPageId = "Subscription Conferences";
    DrillDownPageId = "Subscription Conferences";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SSetup.Get;
                    NoSeriesMgt.TestManual(SSetup."Conference Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Name 2"; Text[100])
        {
            Caption = 'Name 2';
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(5; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(6; "Total Points Earned"; Decimal)
        {
            Caption = 'Total Points Earned';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Subscription Conference Lines"."Points Earned" where("Document No." = field("No.")));
        }
        field(7; "Conference Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Start Date';
        }
        field(8; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(9; "Last DateTime Modifies"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Conference Host"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Conference Venue"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Members Attended"; Integer)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("Subscription Conference Lines" where("Document No." = field("No.")));
        }
        field(13; "Conference End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'End Date';
        }
        field(14; "Points Per Member"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ConferenceLines.Reset();
                ConferenceLines.SetRange("Document No.", Rec."No.");
                if ConferenceLines.FindSet() then repeat
                    ConferenceLines."Points Earned" := Rec."Points Per Member";
                    ConferenceLines.Modify;
                until ConferenceLines.Next() = 0;
            end;
        }
        field(15; "Total Course Fees"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Subscription Conference Lines"."Course Fee" where("Document No." = field("No.")));
        }
        field(16; "Archive Document"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ArchiveReason: Record "Archive Reasons";
                UserSetup: Record "User Setup";
            begin
                if UserSetup.get(UserId) then
                    if UserSetup."Archive Document" then begin
                        if xRec."Archive Document" and not Rec."Archive Document" then begin
                            ArchiveReason.Reset();
                            ArchiveReason.SetRange("Record ID", Rec.RecordId);
                            ArchiveReason.SetRange("Action Type", ArchiveReason."Action Type"::UnArchive);
                            if not ArchiveReason.FindSet() then
                                error('You must state reason(s) to unarchive the document');
                        end;
                    end else
                        error('You are not allowed to archive documents. Please contact your adminstrator')
            end;
        }
        field(17; "FY Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
            Caption = 'Financial Year';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SSetup.Get;
            SSetup.TestField("Conference Nos");
            NoSeriesMgt.InitSeries(SSetup."Conference Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        SetModifiedDateTime();
    end;

    trigger OnModify()
    begin
        SetModifiedDateTime();
    end;

    trigger OnRename()
    begin
        SetModifiedDateTime();
    end;

    trigger OnDelete()
    begin
        ConferenceLines.Reset();
        ConferenceLines.SetRange("Document No.", Rec."No.");
        ConferenceLines.DeleteAll();
    end;

    var
        SSetup: Record SubscriptionSetup;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ConferenceLines: Record "Subscription Conference Lines";

    local procedure SetModifiedDateTime()
    begin
        "Last Date Modified" := Today;
        "Last DateTime Modifies" := CurrentDateTime;
    end;
}
