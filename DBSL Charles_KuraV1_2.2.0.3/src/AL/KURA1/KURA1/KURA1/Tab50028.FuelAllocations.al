/// <summary>
/// Table Fuel Allocations (ID 50028).
/// </summary>
table 50028 "Fuel Allocations"
{
    Caption = 'Fuel Allocations';
    DataClassification = ToBeClassified;
    LookupPageId = "Fuel Allocations";
    DrillDownPageId = "Fuel Allocations";
    
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    FltMgtSetup.Get;
                    NoSeriesMgt.TestManual(FltMgtSetup."Fuel Allocation No");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Financial Code"; Code[20])
        {
            Caption = 'Financial Code';
            TableRelation = "Financial Year Code";
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Allocation Amount';
        }
        field(6; Closed; Boolean)
        {
            Caption = 'Closed';
            Editable = false;
        }
        field(7; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(8; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
        }
        field(9; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Rejected,Closed,Approved';
            OptionMembers = Open,"Pending Approval",Rejected,Closed,Approved;
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
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Fuel Allocation No");
            NoSeriesMgt.InitSeries(FltMgtSetup."Fuel Allocation No", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        UpdateDateTime();
    end;

    trigger OnModify()
    begin
        UpdateDateTime();
    end;

    trigger OnRename()
    begin
        UpdateDateTime();
    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    local procedure UpdateDateTime()
    begin
        "Last Date Modified" := Today;
        "Last DateTime Modified" := CurrentDateTime;
    end;
}
