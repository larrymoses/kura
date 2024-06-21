#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69252 "Job Indicators Setup"
{

    fields
    {
        field(1;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Indicator  Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Indicator Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Indicator  Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

