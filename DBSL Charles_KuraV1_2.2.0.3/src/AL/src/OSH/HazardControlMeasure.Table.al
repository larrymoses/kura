#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69402 "Hazard Control Measure"
{

    fields
    {
        field(1;"Hazard Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Hazard Type".Code;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Recommended Preventive Action";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Hazard Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
