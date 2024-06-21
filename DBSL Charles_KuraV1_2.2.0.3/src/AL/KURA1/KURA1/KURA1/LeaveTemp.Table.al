#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59076 "Leave Temp"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Leave No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Staff;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Duplicate;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"No of Duplicates";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Reversed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

