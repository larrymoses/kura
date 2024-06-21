#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 65050 "Fund Movement Entry"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"External Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Bank A/C";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(7;"Project Fund ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(8;"Currency Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(9;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Amount LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Reversed?";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

