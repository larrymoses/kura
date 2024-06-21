#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80205 "Compliance Non-conformance"
{

    fields
    {
        field(1;"Audit No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Checklist Category";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Requirement ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Non-Conformance ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(23;"Primary Department";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"));
        }
        field(24;"Additional Comments";Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Audit No.","Checklist Category","Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

