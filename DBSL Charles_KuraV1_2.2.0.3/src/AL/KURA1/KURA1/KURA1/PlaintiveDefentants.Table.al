#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69510 "Plaintive-Defentants"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Plaintive,Defendant';
            OptionMembers = Plaintive,Defendant;
        }
        field(3;Names;Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Contact;Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code",Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

