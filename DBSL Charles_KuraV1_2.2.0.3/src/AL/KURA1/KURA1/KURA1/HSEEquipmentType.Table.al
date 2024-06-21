#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95161 "HSE Equipment Type"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Safety Equipment Category";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Additional Notes/Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Register Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Fixed Asset,Inventory,Resource';
            OptionMembers = " ","Fixed Asset",Inventory,Resource;
        }
        field(6;"Register No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Blocked;Boolean)
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

