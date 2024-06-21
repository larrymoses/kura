#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59030 "Vehicle Inspection"
{

    fields
    {
        field(1;"Inspection No.";Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Inspection No."<>xRec."Inspection No." then
                  NoSeriesMgt.TestManual(FleetManagementSetup."Vehicle Inspection  No");
            end;
        }
        field(2;Description;Text[30])
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
        field(3;"Last Inspection Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Last Inspection No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Vehicle,Machinery;
        }
        field(6;Make;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Make".Code;
        }
        field(7;Model;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Model".Code;
        }
        field(8;"Registration No.";Code[10])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "Fleet Vehicles."."FA Serial No";

            trigger OnValidate()
            begin
                   //"Registration No.":=FA."Serial No.";
                FleetVehicles.Reset;
                FleetVehicles.SetRange("FA Serial No","Registration No.");
                if FleetVehicles.FindFirst then begin
                  Make := FleetVehicles.Make;
                  Model := FleetVehicles.Model;
                  Type := FleetVehicles.Type;
                  Description := FleetVehicles.Description;
                  "Vehicle CC" := FleetVehicles."Vehicle CC";
                end;
            end;
        }
        field(9;"Date of Last Insurance";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Vehicle CC";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Inspection Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Passed,Failed;
        }
        field(12;"Inspection Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Has Speed Governor";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Inspection Center";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Inspection No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        FleetManagementSetup.Get;
        if "Inspection No."='' then
          NoSeriesMgt.InitSeries(FleetManagementSetup."Vehicle Inspection  No",xRec."No. Series",0D,"Inspection No.","No. Series");
    end;

    var
        FleetManagementSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FleetVehicles: Record "Fleet Vehicles.";
}

