#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72365 "Study/Survey Road Project"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Project Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where ("Type of Project"=filter(<>"Survey/Study"));

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange(Job."No.",Rec."Project Code");
                if Job.FindSet then
                  "Project Name":=Job.Description;
            end;
        }
        field(4;"Project Name";Text[300])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No","No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Job: Record Job;
}

