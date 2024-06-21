#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80058 "PC Risk"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Contract Header".No;
        }
        field(3;"Risk Source Class";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Source Class";
        }
        field(4;"Risk Category";Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Categories";
        }
        field(5;"Risk Description";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Inherent Likelihood Level";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Inherent Impact Level";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

