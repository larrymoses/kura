#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80038 "Strategic Capability Matrix"
{

    fields
    {
        field(1;"Document No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Capability Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Human Capital,Financial,Physical/Organizational Resources,Intellectual Capital';
            OptionMembers = "Human Capital",Financial,"Physical/Organizational Resources","Intellectual Capital";
        }
        field(4;"Capability Description";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Inventory Summary";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Strategic Implications";Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

