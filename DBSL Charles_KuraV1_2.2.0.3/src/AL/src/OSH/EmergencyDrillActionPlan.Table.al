#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69440 "Emergency Drill Action Plan"
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
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Action";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(7;Responsibility;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Role".Code;
        }
        field(8;"Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person));
        }
        field(9;"Planned Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Evacuation Event ID","Criteria Code","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
