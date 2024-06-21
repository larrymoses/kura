#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80088 "Performance Participant"
{

    fields
    {
        field(1;"Performance Doc No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(3;"Employee Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Role;Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Performance Doc No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

