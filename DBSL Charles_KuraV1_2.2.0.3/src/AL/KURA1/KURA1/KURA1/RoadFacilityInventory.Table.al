#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72028 "Road Facility Inventory"
{

    fields
    {
        field(1; "Facility ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Road Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            //     TableRelation = "Fixed Asset" where ("Record Type"=filter("Road Asset"));
        }
        field(3; "Road Facility Catgegory"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Structure,Furniture';
            OptionMembers = " ",Structure,Furniture;
        }
        field(4; "Road Facility Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Facility Type" where("Facility Type" = field("Road Facility Catgegory"));
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Facility Label"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Facility Location"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Facility Material Type"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Construction Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(10; "Construction Vendor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Facility ID", "Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Facility ID" = '' then begin
            RMSSetup.Get();
            if "Road Facility Catgegory" = "road facility catgegory"::Furniture then begin
                RMSSetup.TestField("Road Furniture Nos");
                NoSeriesMgt.InitSeries(RMSSetup."Road Furniture Nos", xRec."No Series", Today, "Facility ID", "No Series");
            end;
            if "Road Facility Catgegory" = "road facility catgegory"::Structure then begin
                RMSSetup.TestField("Road Structure Nos");
                NoSeriesMgt.InitSeries(RMSSetup."Road Structure Nos", xRec."No Series", Today, "Facility ID", "No Series");
            end;

        end;
    end;

    var
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

