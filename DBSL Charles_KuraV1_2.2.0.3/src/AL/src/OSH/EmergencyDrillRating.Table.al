#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69446 "Emergency Drill Rating"
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
        field(3;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evacuation Event Drill Criteri".Code where ("Event ID"=field("Evacuation Event ID"));

            trigger OnValidate()
            begin
                EvacuationEventDrillCriteri.Reset;
                EvacuationEventDrillCriteri.SetRange(Code,Code);
                if EvacuationEventDrillCriteri.FindSet then
                  "Evaluation Criterion":=EvacuationEventDrillCriteri.Description;
            end;
        }
        field(4;"Evaluation Criterion";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"General Rating";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Fair,Poor,Very Poor';
            OptionMembers = " ",Excellent,Good,Fair,Poor,"Very Poor";
        }
        field(6;"Additional Comments/Notes";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Evacuation Event ID","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EvacuationEventDrillCriteri: Record "Evacuation Event Drill Criteri";
}
