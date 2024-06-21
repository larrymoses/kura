#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72071 "Self In Site Verification Line"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Project No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Service;Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Level Selection Categ".Description;
        }
        field(5;"Service Scope";Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Level Scope".Description;
        }
        field(6;Selection;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Service Criteria";Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Level Cretion".Criterion;
        }
        field(8;"Total Complied(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Total Non Complied(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Project No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

