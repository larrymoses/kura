#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72254 "Daily Material Ledger"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Daily Work Record ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document No.";

            trigger OnValidate()
            begin
                DailyWorkRecord.Reset;
                DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Daily Work Record ID");
                if DailyWorkRecord.FindSet then begin
                  "Posting Date":=DailyWorkRecord."Document Date";
                  end;
            end;
        }
        field(3;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID" where ("Document No."=field("Daily Work Record ID"));
        }
        field(4;"Movement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Delivered To Site,Removed From Site';
            OptionMembers = " ","Delivered To Site","Removed From Site";
        }
        field(5;"Material ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Material"."Material Code" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                RoadMaterial.Reset;
                RoadMaterial.SetRange(RoadMaterial."Material Code","Material ID");
                if RoadMaterial.FindSet then begin
                  "Base Unit of Measure":=RoadMaterial."Base Unit Of Measure";
                   Description:=RoadMaterial.Description;
                  end;
            end;
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Base Unit of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(8;Quantity;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Photo No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Photo Record"."Photo ID" where ("Project ID"=field("Job No."));
        }
        field(10;"Material Test Record ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Material Test Record".Code where ("Material ID"=field("Material ID"));

            trigger OnValidate()
            begin
                MaterialTestRecord.Reset;
                MaterialTestRecord.SetRange(MaterialTestRecord.Code,"Material Test Record ID");
                if MaterialTestRecord.FindSet then begin
                  ///"Test Quantity":=MaterialTestRecord.
                  end;
            end;
        }
        field(11;"Test Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Quantity';
        }
        field(12;"Test Lead No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));
        }
        field(13;"Site Name";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Final Test Result";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(15;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document Date";
        }
        field(16;"Work Execution Programme ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"),
                                                                                "Project ID"=field("Job No."));
        }
        field(17;"Reasons for Removal";Text[500])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RoadMaterial: Record "Road Material";
        MaterialTestRecord: Record "Material Test Record";
        DailyWorkRecord: Record "Daily Work Record";
}

