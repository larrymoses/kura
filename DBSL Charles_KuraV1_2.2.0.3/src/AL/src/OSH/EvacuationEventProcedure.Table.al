#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69404 "Evacuation Event Procedure"
{

    fields
    {
        field(1;"Evacuation Event ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evacuation Event".Code;
        }
        field(2;"Line No.";Integer)
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
        key(Key1;"Evacuation Event ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
