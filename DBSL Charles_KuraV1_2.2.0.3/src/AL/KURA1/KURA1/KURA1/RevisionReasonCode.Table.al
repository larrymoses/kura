#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80133 "Revision Reason Code"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Revision Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Minor Revision,Major Revision';
            OptionMembers = "Minor Revision","Major Revision";
        }
        field(4;"No. of Policies";Integer)
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
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

