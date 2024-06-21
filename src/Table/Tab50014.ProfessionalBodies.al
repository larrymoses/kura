/// <summary>
/// Table Professional Bodies (ID 50014).
/// </summary>
table 50014 "Professional Bodies"
{
    Caption = 'Professional Bodies';
    DataClassification = ToBeClassified;
    LookupPageId = "Professional Bodies List";
    DrillDownPageId = "Professional Bodies List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            // Editable = false;

            // trigger OnValidate()
            // begin
            //     if "No." <> xRec."No." then begin
            //         SubscriptionSetup.Get();
            //         NoSeriesMgt.TestManual(SubscriptionSetup."Professional Body No.");
            //         "No. Series" := '';
            //     end;
            // end;
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(3; "Name 2"; Text[250])
        {
            Caption = 'Name 2';
        }
        field(4; "No. of Members"; Integer)
        {
            Caption = 'No. of Members';
            FieldClass = FlowField;
            CalcFormula = count(ProfessionalBodyMembers where("Document No." = field("No.")));
            Editable = false;
        }
        field(5; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(6; Comments; Boolean)
        {
            Caption = 'Comments';
        }
        field(7; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(8; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            Editable = false;
        }
        field(10; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Fee Payment Due Date';
        }
        field(11; "Total Fees Payable"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum(ProfessionalBodyMembers."Annual Fee Payable" where("Document No." = field("No.")));
        }
        field(12; "Total CPD Points Required"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum(ProfessionalBodyMembers."CPD Points Required" where("Document No." = field("No.")));
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
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInsert(Rec, IsHandled);
        if IsHandled then
            exit;

        if "No." = '' then begin
            SubscriptionSetup.Get();
            SubscriptionSetup.TestField("Professional Body No.");
            NoSeriesMgt.InitSeries(SubscriptionSetup."Professional Body No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        SetLastModifiedDateTime();
    end;

    trigger OnModify()
    begin
        SetLastModifiedDateTime();
    end;

    trigger OnDelete()
    begin
        PBodyMembers.Reset();
        PBodyMembers.SetRange("Document No.", Rec."No.");
        if PBodyMembers.FindSet() then
            PBodyMembers.DeleteAll();
    end;

    var
        SubscriptionSetup: Record SubscriptionSetup;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PBodyMembers: Record ProfessionalBodyMembers;

    protected procedure SetLastModifiedDateTime()
    begin
        "Last Modified Date Time" := CurrentDateTime();
        "Last Date Modified" := Today();
        OnAfterSetLastModifiedDateTime(Rec);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetLastModifiedDateTime(var ProfessionalBodies: Record "Professional Bodies")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnDelete(var ProfessionalBodies: Record "Professional Bodies"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(var ProfessionalBodies: Record "Professional Bodies"; var IsHandled: Boolean)
    begin
    end;
}
