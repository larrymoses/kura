#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80030 "Risk Likelihood Level"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Likelihood Level";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Min Occurrence Prob(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Max Occurrence Prob(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Likelihood Level")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

