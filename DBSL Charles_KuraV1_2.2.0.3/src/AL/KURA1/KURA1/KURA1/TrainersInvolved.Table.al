#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69177 "Trainers Involved"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"ID No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Trainer Full Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Comments;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Training Application No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.","ID No.","Training Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

