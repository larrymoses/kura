#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69115 "Criteria Setup"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Table ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"General Categories";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Convicted,Age,Gender;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

