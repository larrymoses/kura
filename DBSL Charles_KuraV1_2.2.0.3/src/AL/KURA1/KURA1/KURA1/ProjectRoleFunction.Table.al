#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72340 "Project Role Function"
{

    fields
    {
        field(1;"Staff Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code";
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Staff Role Code","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

