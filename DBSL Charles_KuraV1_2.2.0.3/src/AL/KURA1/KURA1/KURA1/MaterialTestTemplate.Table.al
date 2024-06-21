#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72234 "Material Test Template"
{
    DrillDownPageID = "Material Test Templates";
    LookupPageID = "Material Test Templates";

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Material ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Material"."Material Code" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                Description:='Material Testing Template '+' '+"Material ID";
            end;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Template ID"='' then begin
          RoadManagementSetup.Get();
          RoadManagementSetup.TestField("Material Test Template Nos");
          NoSeriesManagement.InitSeries(RoadManagementSetup."Material Test Template Nos",xRec."No Series",Today,"Template ID","No Series");
          end;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
}

