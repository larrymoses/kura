#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72055 "Daily Record Admission"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Name;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Sign;Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Category;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Record Admission Categor".Code;
        }
        field(6;Project;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Header No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No",Project,"Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

