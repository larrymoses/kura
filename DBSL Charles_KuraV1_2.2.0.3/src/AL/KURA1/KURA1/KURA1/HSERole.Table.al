#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95158 "HSE Role"
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
        field(3;"Executive Summary";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Directly Reports To";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Indirectly Reports To";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. Of Default Responsibilteis";Integer)
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

