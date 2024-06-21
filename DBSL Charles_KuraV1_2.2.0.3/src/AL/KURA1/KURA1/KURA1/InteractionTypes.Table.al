#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72408 "Interaction Types"
{

    fields
    {
        field(1;"Interaction Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Email,Letter/Memo,Phone Call,Meeting';
            OptionMembers = " ",Email,"Letter/Memo","Phone Call",Meeting;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Interaction Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

