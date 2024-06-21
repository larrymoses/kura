#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72078 "Monthly Evaluation Line"
{

    fields
    {
        field(1;"Project No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Scope;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Requirement;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Pass;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Fail;Boolean)
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

