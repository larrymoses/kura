#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69080 "FavouriteJobsTable"
{

    fields
    {
        field(1;Id;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Job Id";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Job Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Job Id","Job Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

