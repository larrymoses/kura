#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72357 "Pavement Chart Entry"
{

    fields
    {
        field(1;"Enrty No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(3;"Contractor ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(4;"Test Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Survey Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Layer Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Layer.Code;
        }
        field(7;"Layer Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Layer Test Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Layer Test Setup"."Test Code";
        }
        field(9;"Test Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Result;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Deviation(mm)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Layer Tolerance";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;Chainage;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Enrty No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

