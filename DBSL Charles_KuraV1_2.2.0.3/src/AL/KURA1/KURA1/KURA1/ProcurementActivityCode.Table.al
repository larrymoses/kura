#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70104 "Procurement Activity Code"
{

    fields
    {
        field(1;"Activity Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Activity Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

