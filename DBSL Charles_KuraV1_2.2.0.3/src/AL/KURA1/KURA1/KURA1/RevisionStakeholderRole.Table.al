#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80127 "Revision Stakeholder Role"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Responsibility;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Revision No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Revision No.","Code","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

