#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80085 "PC Objective Comment"
{

    fields
    {
        field(1;"Workplan No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No;
        }
        field(2;"Objective ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "PC Objective";
        }
        field(3;"Comment/Additional Notes";Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;" UserID";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Last Update Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Workplan No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

