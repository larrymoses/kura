#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72166 "Meeting Agenda Item Template"
{

    fields
    {
        field(1;"Project Meeting Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Agenda Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Item Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Project Meeting Type","Agenda Code","Item Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
