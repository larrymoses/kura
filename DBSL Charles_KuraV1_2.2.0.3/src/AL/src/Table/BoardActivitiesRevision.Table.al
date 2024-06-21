#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80232 "Board Activities Revision"
{

    fields
    {
        field(1;"AWP No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No;
        }
        field(2;"Board Activity Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Activities Setup".Code;

            trigger OnValidate()
            begin
                if BoardSetup.Get("Board Activity Code") then begin
                   "Board Activity Description":=BoardSetup.Description;
                  end;
            end;
        }
        field(3;"Board Activity Description";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Activity Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Activities"."Activity Code" where ("AWP No"=field("AWP No"));

            trigger OnValidate()
            begin
                BoardActivities.Reset;
                BoardActivities.SetRange("Activity Code","Activity Code");
                if BoardActivities.Find('-') then begin
                  "Board Activity Code":=BoardActivities."Board Activity Code";
                  "Board Activity Description":=BoardActivities."Board Activity Description";
                  "Activity Description":=BoardActivities."Activity Description";
                  "Unit of Measure":=BoardActivities."Unit of Measure";
                  "WT(%)":=BoardActivities."WT(%)";
                  "Framework Perspective":=BoardActivities."Framework Perspective";
                   Target:=BoardActivities.Target;
                  "Strategy Framework":=BoardActivities."Strategy Framework";
                end;
            end;
        }
        field(5;"Activity Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Unit of Measure";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(7;"WT(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Target;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Achieved Targets";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Framework Perspective";Code[255])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework Perspective".Code where ("Strategy Framework"=field("Strategy Framework"));
        }
        field(11;"Strategy Framework";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Strategy Framework";
        }
        field(12;"Revision Workplan No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Workplan Revision".No;
        }
        field(13;"New Activity Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Board Activities"."Activity Code" where ("AWP No"=field("AWP No"));

            trigger OnValidate()
            begin
                BoardActivities.Reset;
                BoardActivities.SetRange("Activity Code","Activity Code");
                if BoardActivities.Find('-') then begin
                  "Board Activity Code":=BoardActivities."Board Activity Code";
                  "Board Activity Description":=BoardActivities."Board Activity Description";
                  "Activity Description":=BoardActivities."Activity Description";
                  "Unit of Measure":=BoardActivities."Unit of Measure";
                  "WT(%)":=BoardActivities."WT(%)";
                  "Framework Perspective":=BoardActivities."Framework Perspective";
                   Target:=BoardActivities.Target;
                  "Strategy Framework":=BoardActivities."Strategy Framework";
                end;
            end;
        }
        field(14;"New Activity Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"New Unit of Measure";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(16;"New WT(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"New Target";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"AWP No","Board Activity Code","Activity Code","Revision Workplan No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BoardSetup: Record "Board Activities Setup";
        BoardActivities: Record "Board Activities";
}

