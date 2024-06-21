#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72312 "Subcontracting Required Doc"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mandatory,Optional';
            OptionMembers = " ",Mandatory,Optional;
        }
        field(5;"Guidelines/Instructions";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

