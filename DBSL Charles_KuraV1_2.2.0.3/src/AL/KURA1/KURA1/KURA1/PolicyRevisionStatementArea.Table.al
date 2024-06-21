#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80128 "Policy Revision Statement Area"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Revision No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Revision No.","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

