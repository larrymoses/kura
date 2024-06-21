/// <summary>
/// Table Membership Fees Requisitions (ID 50026).
/// </summary>
table 50026 "Membership Fees Requisitions"
{
    Caption = 'Membership Fees Requisitions';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Membership Fee Requisitions";
    LookupPageId = "Membership Fee Requisitions";
    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SubSetup.Get();
                    NoSeriesMgt.TestManual(SubSetup."Membership Fees Req. No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Request-By No."; Code[10])
        {

            Editable = false;
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Empl: Record Employee;
            begin
                TestField(Status, Status::Open);

                //CAW 240908 EALAYER
                Empl.Reset;
                Empl.SetRange(Empl."No.", "Request-By No.");
                if Empl.Find('-') then begin
                    HOD := Empl.HOD;
                    "Directorate Code" := Empl."Directorate Code";
                    "Department Code" := Empl."Department Code";
                    "Request-By Name" := Empl.FullName();
                    Region := Empl."Global Dimension 1 Code";
                    Division := Empl.Division;
                    "Shortcut Dimension 1 Code" := Empl."Global Dimension 1 Code";
                end;
            end;
        }
        field(4; "Request-By Name"; Text[50])
        {
            Editable = false;
        }
        field(5; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          Blocked = CONST(false));
        }
        field(6; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          Blocked = CONST(false));
        }
        field(7; "Department Name"; Code[100])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Project Name"; Code[600])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Department Code"; Code[100]) // Amos --> Increased the field length from 30 to 100 (25/07/2023)
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
            trigger OnValidate()
            var
                resp: record "Responsibility Center";
            begin
                if resp.get(rec."Department Code") then
                    REC."Department Name2" := RESP.Name;

            end;
        }
        field(10; "Directorate Code"; Code[100])// Amos --> Increased the field length from 50 to 100 (25/07/2023)
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
            trigger OnValidate()
            var
                resp: record "Responsibility Center";
            begin
                if resp.get(rec."DIRECTORATE CODE") then
                    REC."Directorate Name" := RESP.Name;

            end;
        }
        field(11; Division; Code[50])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));

        }
        field(12; Region; Code[50])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(13; "Directorate Name"; Text[1080])
        {

        }
        field(14; "Department Name2"; Text[1080])
        {

        }
        field(15; HOD; Boolean)
        {

            Editable = false;
        }
        field(16; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Rejected,Closed,Approved';
            OptionMembers = Open,"Pending Approval",Rejected,Closed,Approved;
        }
        field(17; "Total Fees"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Professional Body Lines"."Amount (Fees)" where("Document No." = field("No.")));
        }
        field(18; "Requester ID"; Code[50])
        {
            Editable = false;
            TableRelation = User."User Name";

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                if "Requester ID" <> '' then begin
                    UserSetup.Get(UserId);
                    "Request-By No." := UserSetup."Employee No.";
                end else begin
                    "Request-By No." := '';
                end;
            end;
        }
        field(19; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20; "Request Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(22; "Last Modified Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; Comments; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
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
            SubSetup.Get();
            SubSetup.TestField("Membership Fees Req. No.");
            NoSeriesMgt.InitSeries(SubSetup."Membership Fees Req. No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Request Date" := Today();
        "Requester ID" := UserId;
        Rec.Validate("Requester ID");
        Rec.Validate("Request-By No.");

        SetLastModifiedDateTime();
    end;

    trigger OnModify()
    begin
        SetLastModifiedDateTime();
    end;

    trigger OnDelete()
    var
        PBodyLines: Record "Professional Body Lines";
    begin
        PBodyLines.Reset();
        PBodyLines.SetRange("Document No.", Rec."No.");
        PBodyLines.DeleteAll();
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SubSetup: Record SubscriptionSetup;

    protected procedure SetLastModifiedDateTime()
    begin
        "Last Modified Date Time" := CurrentDateTime();
        "Last Date Modified" := Today();
    end;
}
