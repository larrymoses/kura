#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80042 "Risk Register"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Risk Source Class";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Source Class".Code;
        }
        field(4;"Risk Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Categories".Code;
        }
        field(5;"Risk Description";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Inherent Likelihood Level";Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Likelihood Level"."Likelihood Level";
        }
        field(7;"Inherent Impact Level";Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Impact Level"."Impact Level Code";
        }
        field(8;"Residual Risk Level";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Department Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"),
                                                           "Direct Reports To"=field("Directorate Code"));
        }
        field(10;"Directorate Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

