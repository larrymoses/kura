#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72127 "RICS New Road Environ"
{

    fields
    {
        field(1;"RICS No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Road Environ Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Environ Category".Code;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code";
        }
        field(6;"Road Section No.";Code[20])
        {
            Caption = 'Road Section No.';
            DataClassification = ToBeClassified;
            Description = '"Road Section"."Road Section No." WHERE (Road Code=FIELD(Road Code))';
        }
        field(7;"Connected to Road Link";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Connection Road Length (Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Location Details";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"RICS No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
