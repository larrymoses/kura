#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69418 "Inspection Template"
{

    fields
    {
        field(1;"Inspection Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","OSH Inspection","Project Supervision";
        }
        field(2;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Last Review Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Inspection Type","Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
