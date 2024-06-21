#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72240 "Daily Work Record Material"
{
    DrillDownPageID = "Daily Work Record Materials";
    LookupPageID = "Daily Work Record Materials";

    fields
    {
        field(1;"Document No.";Code[20])
        {
            
        }
        field(2;"Movement Type";Option)
        {
            
            OptionCaption = ' ,Delivered To Site,Removed From Site';
            OptionMembers = " ","Delivered To Site","Removed From Site";
        }
        field(3;"Material ID";Code[20])
        {
            
            TableRelation = "Road Material"."Material Code" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                RoadMaterial.Reset;
                RoadMaterial.SetRange(RoadMaterial."Material Code","Material ID");
                if RoadMaterial.FindSet then begin
                   "Base Unit of Measure":=RoadMaterial."Base Unit Of Measure";
                  Description:=RoadMaterial.Description;

                  end;

                DailyWorkRecordExecution.Reset;
                DailyWorkRecordExecution.SetRange(DailyWorkRecordExecution."Document No.","Document No.");
                if DailyWorkRecordExecution.FindSet then begin
                  repeat
                  "Job No.":=DailyWorkRecordExecution."Job No.";
                    until DailyWorkRecordExecution.Next=0;
                  end;
            end;
        }
        field(4;Description;Text[2048])
        {
            
        }
        field(5;"Base Unit of Measure";Code[20])
        {
            
            TableRelation = "Unit of Measure";
        }
        field(6;Quantity;Decimal)
        {
            
        }
        field(7;"Photo No.";Code[20])
        {
            
            TableRelation = "Project Photo Record"."Photo ID" where ("Project ID"=field("Job No."));
        }
        field(8;"Material Test Record ID";Code[20])
        {
            
            TableRelation = "Material Test Record".Code where ("Project ID"=field("Job No."),
                                                               "Material ID"=field("Material ID"));
        }
        field(9;"Job No.";Code[40])
        {
            
            TableRelation = "Daily Work Record"."Project ID";
        }
        field(10;"Document Date";Date)
        {
            
        }
        field(11;"Test Lead No.";Code[20])
        {
            
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));
        }
        field(12;"Site Name";Text[250])
        {
            
        }
        field(13;"Final Test Result";Option)
        {
            
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(14;"Reasons for Removal";Text[500])
        {
            
        }
        field(15; "Vehicle Capacity"; Decimal)
        {
            
        }
        field(16; "Capacity Unit of Measure"; Code[10])
        {
            TableRelation ="Unit of Measure".Code;
        }
        field(17; Frequency; Text[50])
        {
            
        }
    }

    keys
    {
        key(Key1;"Document No.","Movement Type","Material ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        DailyWorkRecord.Reset;
        DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Document No.");
        if DailyWorkRecord.FindSet then begin
          "Job No.":=DailyWorkRecord."Project ID";
           "Document Date":=DailyWorkRecord."Document Date";
          end;
    end;

    var
        RoadMaterial: Record "Road Material";
        DailyWorkRecord: Record "Daily Work Record";
        DailyWorkRecordExecution: Record "Daily Work Record Execution";
}

