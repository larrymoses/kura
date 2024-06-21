#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72041 "Road Environs"
{

    fields
    {
        field(1; "Environ ID"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Road Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            //    TableRelation = "Fixed Asset" where ("Record Type"=filter("Road Asset"));
        }
        field(3; "Road Environ Catgegory"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Envrion Type"; Code[10])
        {
            DataClassification = ToBeClassified;
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
        field(11; "Distance(Km) From Road Link"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Environ ID", "Road Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

