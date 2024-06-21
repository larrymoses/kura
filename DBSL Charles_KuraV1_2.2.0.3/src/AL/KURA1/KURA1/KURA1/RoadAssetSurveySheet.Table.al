#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72044 "Road Asset Survey Sheet"
{

    fields
    {
        field(1; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where("Record Type" = filter("Road Asset"));

            trigger OnValidate()
            begin
                if RoadAsset.Get("Road Code") then
                    "Road Name" := RoadAsset.Description;
            end;
        }
        field(2; "Road Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Surveyor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Survey Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; AADT; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = '//Annual Average Daily Traffic';
        }
        field(6; "Road Length"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "ROW Width"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Right Of Way';
        }
        field(8; "Average Rougness(mm/m)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Sheet No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Sheet No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Sheet No" = '' then begin
            RMSSetup.Get();
            RMSSetup.TestField("Road Asset Survey Sheet Nos");
            NoSeriesMgt.InitSeries(RMSSetup."Road Asset Survey Sheet Nos", xRec."No. Series", Today, "Sheet No", "No. Series");
        end;
    end;

    var
        RoadAsset: Record "Fixed Asset";
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

