#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95194 "Audit Plan Line Location"
{

    fields
    {
        field(1;"Audit Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Engagement Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Audit Location ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Responsibility Center ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Audit Site Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Within Organization,External to Organization';
            OptionMembers = " ","Within Organization","External to Organization";
        }
        field(7;"Contact Person";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Primary Email";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Telephone No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Audit Plan ID","Engagement Line No.","Audit Location ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

