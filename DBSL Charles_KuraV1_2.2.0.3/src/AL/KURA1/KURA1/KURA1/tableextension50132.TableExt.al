#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50132 "tableextension50132" extends Insurance 
{
    fields
    {
        field(50020;"Shortcut Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021;"Shortcut Dimension 4 Code";Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022;"Shortcut Dimension 5 Code";Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(59000;"FA No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = "Fleet Vehicles."."No.";

            trigger OnValidate()
            begin
                FleetVehicles.Reset;
                FleetVehicles.SetRange("No.","FA No.");
                if FleetVehicles.FindFirst then begin
                  "Registration No." := FleetVehicles."FA Serial No";
                  "Vehicle Description" := FleetVehicles.Description;
                  Make := FleetVehicles.Make;
                  Model := FleetVehicles.Model;
                  Type := FleetVehicles.Type;
                end;
                if FixedAsset.Get("FA No.") then begin
                  "FA Class Code" := FixedAsset."FA Class Code";
                  "FA Location Code" := FixedAsset."FA Location Code";
                  "FA Subclass Code" := FixedAsset."FA Subclass Code";
                end;
            end;
        }
        field(59001;"Registration No.";Code[10])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "Fleet Vehicles."."FA Serial No";

            trigger OnValidate()
            begin
                FleetVehicles.Reset;
                FleetVehicles.SetRange(FleetVehicles."FA Serial No","Registration No.");
                if FleetVehicles.FindFirst then begin
                 // "Registration No." := FleetVehicles."Registration No.";
                  "Vehicle Description" := FleetVehicles.Description;
                  Make := FleetVehicles.Make;
                  Model := FleetVehicles.Model;
                  "FA No." := FleetVehicles."No.";
                  Type := FleetVehicles.Type;
                  if FixedAsset.Get(FleetVehicles."No.") then begin
                    "FA Class Code" := FixedAsset."FA Class Code";
                    "FA Location Code" := FixedAsset."FA Location Code";
                    "FA Subclass Code" := FixedAsset."FA Subclass Code";
                  end;
                end;
            end;
        }
        field(59002;"Vehicle Description";Text[30])
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
        field(59004;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Vehicle,Machinery;
        }
        field(59005;Make;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Make".Code;
        }
        field(59006;Model;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Model".Code;
        }
        field(59007;"Expiry Notification Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(59008;"Vendor Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(59009;"Vendor Contact";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(59010;"Vendor Phone";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(59011;"Insurance Details";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(59012;"Vendor Email Address";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        FleetVehicles: Record "Fleet Vehicles.";
        FixedAsset: Record "Fixed Asset";
}

