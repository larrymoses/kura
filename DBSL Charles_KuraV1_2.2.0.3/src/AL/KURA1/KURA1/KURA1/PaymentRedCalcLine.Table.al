#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72073 "Payment Red. Calc. Line"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Project Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Service;Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Level Selection Categ".Description;
        }
        field(6;"Service Scope";Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Level Scope".Description;
        }
        field(7;"Contract Road Length(km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Required Target(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Target Length(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Exemption Length(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Non-Compliant Length(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Adjusted Non-Compliant Lenth";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Non-Compliant Rate(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Reduction Weight(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Reduction Rate(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Reduction Length(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Project Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

