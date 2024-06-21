#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57035 "Employee Tax Exemption"
{

    fields
    {
        field(1;"Employee No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(2;"Amount Exempted";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Certificate No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;StartDate;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

