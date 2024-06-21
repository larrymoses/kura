#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80039 "Stakeholder Analysis Matrix"
{

    fields
    {
        field(1;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(2;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Stakeholder Group";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Stakeholder Sub-Group";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Stakeholder Description";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Stakeholder Power Level";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'High,Low';
            OptionMembers = High,Low;
        }
        field(7;"Power/Influence Description";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Stakeholder Interests Level";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Low,High';
            OptionMembers = Low,High;
        }
        field(9;"Interests & Expectations";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Management Strategy";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Monitor,Keep Informed,Keep Satisfied,Manage Closely';
            OptionMembers = Monitor,"Keep Informed","Keep Satisfied","Manage Closely";
        }
        field(11;"Engagement Strategy";Code[50])
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

