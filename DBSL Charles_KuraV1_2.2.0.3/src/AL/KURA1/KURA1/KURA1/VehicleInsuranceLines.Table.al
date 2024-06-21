#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59024 "Vehicle Insurance Lines"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Effective Date"; Date)
        {
            CalcFormula = lookup(Insurance."Effective Date" where("No." = field("No.")));
            Caption = 'Effective Date';
            FieldClass = FlowField;
        }
        field(3; "Expiration Date"; Date)
        {
            CalcFormula = lookup(Insurance."Expiration Date" where("No." = field("No.")));
            Caption = 'Expiration Date';
            FieldClass = FlowField;
        }
        field(4; "Policy No."; Text[30])
        {
            Caption = 'Policy No.';
        }
        field(6; "Annual Premium"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Annual Premium';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(7; "Policy Coverage"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Policy Coverage';
            DataClassification = ToBeClassified;
            MinValue = 0;
        }
        field(10; "Total Value Insured"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Total Value Insured';
            Editable = false;
            FieldClass = Normal;
        }
        field(12; "Insurance Type"; Code[10])
        {
            Caption = 'Insurance Type';
            DataClassification = ToBeClassified;
            TableRelation = "Insurance Type";
        }
        field(14; "Insurance Vendor No."; Code[20])
        {
            CalcFormula = lookup(Insurance."Insurance Vendor No." where("No." = field("No.")));
            Caption = 'Insurance Vendor No.';
            FieldClass = FlowField;
            TableRelation = Vendor;
        }
        field(15; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            DataClassification = ToBeClassified;
            TableRelation = "FA Class";
        }
        field(16; "FA Subclass Code"; Code[10])
        {
            Caption = 'FA Subclass Code';
            DataClassification = ToBeClassified;
            TableRelation = "FA Subclass";
        }
        field(17; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            DataClassification = ToBeClassified;
            TableRelation = "FA Location";
        }
        field(18; "Insurance Vendor Name"; Text[200])
        {
            CalcFormula = lookup(Insurance."Vendor Name" where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(19; "Insuance Details"; Text[2000])
        {
            CalcFormula = lookup(Insurance."Insurance Details" where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(20; "Policy Number"; Text[50])
        {
            CalcFormula = lookup(Insurance."Policy No." where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(59000; "FA No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = "Fleet Vehicles."."No.";

            trigger OnValidate()
            begin
                FleetVehicles.Reset;
                FleetVehicles.SetRange("No.", "FA No.");
                if FleetVehicles.FindFirst then begin
                    "Registration No." := FleetVehicles."FA Serial No";
                    "Vehicle Description" := FleetVehicles.Description;
                    Make := FleetVehicles.Make;
                    Model := FleetVehicles.Model;
                    Type := FleetVehicles.Type;
                    "Vehicle Location" := FleetVehicles."Location Code";
                end;
                if FixedAsset.Get("FA No.") then begin
                    "FA Class Code" := FixedAsset."FA Class Code";
                    "FA Location Code" := FixedAsset."FA Location Code";
                    "FA Subclass Code" := FixedAsset."FA Subclass Code";
                end;
            end;
        }
        field(59001; "Registration No."; Code[10])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "Fleet Vehicles."."FA Serial No";

            trigger OnValidate()
            begin
                FleetVehicles.Reset;
                FleetVehicles.SetRange(FleetVehicles."FA Serial No", "Registration No.");
                if FleetVehicles.FindFirst then begin
                    // "Registration No." := FleetVehicles."Registration No.";
                    "Vehicle Description" := FleetVehicles.Description;
                    Make := FleetVehicles.Make;
                    Model := FleetVehicles.Model;
                    "FA No." := FleetVehicles."No.";
                    Type := FleetVehicles.Type;
                    "Vehicle Location" := FleetVehicles."Location Code";
                    if FixedAsset.Get(FleetVehicles."No.") then begin
                        "FA Class Code" := FixedAsset."FA Class Code";
                        "FA Location Code" := FixedAsset."FA Location Code";
                        "FA Subclass Code" := FixedAsset."FA Subclass Code";

                    end;
                end;
            end;
        }
        field(59002; "Vehicle Description"; Text[30])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                /*
                IF ("Search Description" = UPPERCASE(xRec.Description)) OR ("Search Description" = '') THEN
                  "Search Description" := Description;
                IF Description <> xRec.Description THEN BEGIN
                  FADeprBook.SETCURRENTKEY("FA No.");
                  FADeprBook.SETRANGE("FA No.","No.");
                  FADeprBook.MODIFYALL(Description,Description);
                END;
                MODIFY(TRUE);
                */

            end;
        }
        field(59004; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Vehicle,Machinery;
        }
        field(59005; Make; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Make".Code;
        }
        field(59006; Model; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Model".Code;
        }
        field(59010; "Your Estimated Cost Value(Ksh)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59011; "Entertainment Equipmemt"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59012; "Basic Premium Per Vehicle"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(59013; "Vehicle Location"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fleet Vehicles."."Location Code";
        }
    }

    keys
    {
        key(Key1; "No.", "FA No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        FleetVehicles.Reset;
        FleetVehicles.SetRange(FleetVehicles."No.", "No.");
        if FleetVehicles.FindFirst then begin
            "Vehicle Location" := FleetVehicles."Location Code";
        end;
    end;

    var
        CommentLine: Record "Comment Line";
        FASetup: Record "FA Setup";
        Insurance: Record Insurance;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FAMoveEntries: Codeunit "FA MoveEntries";
        DimMgt: Codeunit DimensionManagement;
        FleetVehicles: Record "Fleet Vehicles.";
        FixedAsset: Record "Fixed Asset";
}

