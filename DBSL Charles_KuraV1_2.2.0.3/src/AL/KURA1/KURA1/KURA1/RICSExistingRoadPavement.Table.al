#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72120 "RICS Existing Road Pavement"
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
        field(3;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RICS Existing Road Link"."Road Code";
        }
        field(4;"Road Section No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "RICS Existing Road Section"."Road Section No.";
        }
        field(5;"Pavement Surface Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pavement Surface Type".Code;
        }
        field(6;"Pavement Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Paved,Unpaved';
            OptionMembers = " ",Paved,Unpaved;
        }
        field(7;"Start Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"End Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Road Length (Kms)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Road Surface Condition";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Fair,Poor,Very Poor';
            OptionMembers = " ",Excellent,Good,Fair,Poor,"Very Poor";
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

