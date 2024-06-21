#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72080 "Contract Evaluation Line"
{

    fields
    {
        field(1;"Project No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Item;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No of Months";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Jan;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Feb;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Mar;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;April;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;May;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;June;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;July;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;August;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;Septemeber;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;October;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;November;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;December;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;Year;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Total Pass";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Total Month";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Project No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

