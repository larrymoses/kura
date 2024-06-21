#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72286 "Corrective Order Response Line"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Corrective Order,Corrective Order Action';
            OptionMembers = ,"Corrective Order","Corrective Order Action";
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(5;"Job Task No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No."=field("Project ID"));
        }
        field(6;"Plan Line No";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Line No." where ("Job No."=field("Project ID"),
                                                                  "Job Task No."=field("Job Task No"));
        }
        field(7;No;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Unit Of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(10;"Chainage Description";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Engineer Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Achieved Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Achieved End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Contractor Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Photo Number";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Photo Record"."Photo ID" where ("Project ID"=field("Project ID"));
        }
        field(18;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Corrective Order No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

