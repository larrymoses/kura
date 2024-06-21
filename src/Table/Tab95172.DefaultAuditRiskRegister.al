#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95172 "Default Audit Risk Register"
{

    fields
    {
        field(1;"Audit Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Risk Title";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Audit Risk Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(4;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Audit Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

