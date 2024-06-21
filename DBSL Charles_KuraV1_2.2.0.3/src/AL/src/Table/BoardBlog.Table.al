#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 55015 "Board_Blog"
{

    fields
    {
        field(1;Blog_Id;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Blog Title";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Blog Body";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Created ByDirNo";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Date Created";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Created ByDirName";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Time Created";Time)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Blog_Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

