#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72337 "Survey Quality Check Line"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Layer Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Layer.Code;

            trigger OnValidate()
            begin
                Layer.Reset;
                Layer.SetRange(Layer.Code, "Layer Code");
                if Layer.FindSet then
                    "Layer Description" := Layer.Description;
            end;
        }
        field(4; "Layer Description"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Survey Test Done"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Levels,Alignment';
            OptionMembers = " ",Levels,Alignment;
        }
        field(8; "Test Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Test Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Surveyor Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(12; "Surveyor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Surveyor Type" = const(Internal)) "Internal Project Resource"."Resource No." where("Project ID" = field("Project ID"),
                                                                                                                   Status = filter(Active));

            trigger OnValidate()
            begin
                InternalProjectResource.Reset;
                InternalProjectResource.SetRange(InternalProjectResource."Resource No.", "Surveyor No");
                if InternalProjectResource.FindSet then begin
                    "Surveyor Name" := InternalProjectResource.Name;
                end;
            end;
        }
        field(13; "Surveyor Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Location (Chainage)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Layer Tolerance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Final Test Result"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(18; Offset; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Document No", "Line No", "Layer Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        SurveyQualityCheckHeader.Reset;
        SurveyQualityCheckHeader.SetRange(SurveyQualityCheckHeader."Document No", "Document No");
        if SurveyQualityCheckHeader.FindSet then begin
            "Project ID" := SurveyQualityCheckHeader."Project ID";
            "Test Date" := SurveyQualityCheckHeader."Testing Date";
        end;

        //External Surveyor No Series
        case "Surveyor Type" of
        //  //  "surveyor type"::"3":
#pragma warning disable AL0224
        //     begin
#pragma warning restore AL0224
        //     RoadManagementSetup.Get;
        //     RoadManagementSetup.TestField("Ext. Technologist/Surveyor Nos");
        //     NoSeriesManagement.InitSeries(RoadManagementSetup."Ext. Technologist/Surveyor Nos",xRec."No. Series",Today,"Surveyor No","No. Series");
        //  end
        end;
    end;

    var
        Layer: Record Layer;
        SurveyQualityCheckHeader: Record "Survey Quality Check Header";
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        InternalProjectResource: Record "Internal Project Resource";
}

