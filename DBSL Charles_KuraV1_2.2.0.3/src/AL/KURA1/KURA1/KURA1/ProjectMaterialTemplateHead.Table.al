#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72305 "Project Material Template Head"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Project Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;

            trigger OnValidate()
            begin
                Description:='Project Material Template '+' - '+"Project Type";
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
          RoadManagementSetup.TestField("Project Material Template Nos");
          NoSeriesManagement.InitSeries(RoadManagementSetup."Project Material Template Nos",xRec."No Series",Today,"Template ID","No Series");
          end;
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
}

