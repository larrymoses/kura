#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69439 "Emergency Drill Finding"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Emergency Drill Log"."Drill ID";
        }
        field(2;"Evacuation Event ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evacuation Event".Code;
        }
        field(3;"Criteria Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evacuation Event Drill Criteri".Code where ("Event ID"=field("Evacuation Event ID"));
        }
        field(4;"Drill Assessment Criteria";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"General Rating";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Additional Comments/Findings";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Evacuation Event ID","Criteria Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
