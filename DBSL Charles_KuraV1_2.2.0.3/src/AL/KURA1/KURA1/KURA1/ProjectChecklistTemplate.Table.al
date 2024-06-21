#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72214 "Project Checklist  Template"
{

    fields
    {
        field(1;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Project Stage";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mobilization,Execution,Close-Out,Final Account,Quality Management';
            OptionMembers = " ",Mobilization,Execution,"Close-Out","Final Account","Quality Management";
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Default;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No Series";Code[20])
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
          RoadManagementSetup.Get;
          RoadManagementSetup.TestField("Project Checklist Nos");
          NoSeriesManagement.InitSeries(RoadManagementSetup."Project Checklist Nos",xRec."No Series",Today,"Template ID","No Series");
          end;
    end;

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

