table 60000 "Company Stakeholders"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    CRMSetup.GET;
                    NoSeriesMgt.TestManual(CRMSetup."Company's Stakeholders No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Descriptions; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            CRMSetup.GET;
            CRMSetup.TESTFIELD("Company's Stakeholders No.");
            NoSeriesMgt.InitSeries(CRMSetup."Company's Stakeholders No.", xRec."No. Series", 0D, "No.", "No. Series");
        END;
    end;

    var
        CRMSetup: Record "CRM Setups";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
}

