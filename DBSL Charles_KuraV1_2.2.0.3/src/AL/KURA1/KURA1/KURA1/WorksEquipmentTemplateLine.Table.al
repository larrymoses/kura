#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70198 "Works Equipment Template Line"
{

    fields
    {
        field(1;"Equipment Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Template".Code;
        }
        field(2;"Equipment Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Type".Code;

            trigger OnValidate()
            begin
                WorksEquipmentType.Reset;
                WorksEquipmentType.SetRange(WorksEquipmentType.Code,"Equipment Type");
                if WorksEquipmentType.FindSet then begin
                  Description:=WorksEquipmentType.Description;
                Category:=WorksEquipmentType."Equipment Category";
                end;
            end;
        }
        field(3;Category;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Category".Code;
        }
        field(4;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Minimum Required Qty";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Equipment Template ID","Equipment Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        WorksEquipmentType: Record "Works Equipment Type";
}

