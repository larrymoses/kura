#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69447 "Emergency Drill Evacuation"
{

    fields
    {
        field(1;"Drill ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Evacuation Event ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Emergency Drill Log"."Evacuation Event ID";
        }
        field(3;"Evacuation Procedure ID";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evacuation Event Procedure"."Line No." where ("Evacuation Event ID"=field("Evacuation Event ID"));

            trigger OnValidate()
            begin
                EvacuationEventProcedure.Reset;
                EvacuationEventProcedure.SetRange(EvacuationEventProcedure."Evacuation Event ID","Evacuation Event ID");
                EvacuationEventProcedure.SetRange(EvacuationEventProcedure."Line No.","Evacuation Procedure ID");
                if EvacuationEventProcedure.FindSet then begin
                  Description:=EvacuationEventProcedure.Description;
                  end;
            end;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Compliance Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Non-Compliant,Partially Compliant,Substantially Compliant,Fully Compliant,Not Applicable';
            OptionMembers = " ","Non-Compliant","Partially Compliant","Substantially Compliant","Fully Compliant","Not Applicable";
        }
        field(6;"Drill Obeservations";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. of Recommended Actions";Integer)
        {
            CalcFormula = count("Emergency Drill Action Plan" where ("Evacuation Event ID"=field("Evacuation Event ID")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Drill ID","Evacuation Event ID","Evacuation Procedure ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EvacuationEventProcedure: Record "Evacuation Event Procedure";
}
