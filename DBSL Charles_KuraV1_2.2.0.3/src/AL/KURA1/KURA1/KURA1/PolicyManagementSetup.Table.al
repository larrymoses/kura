#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80121 "Policy Management Setup"
{

    fields
    {
        field(1;"Primary Key";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Internal Policy Development";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Policy Development Institution".Code;
        }
        field(3;"Internal Policy No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4;"External Policy No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5;"Policy Revision No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6;"Policy Attestation No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(7;"Enable Email Alerts";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Notification Email";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Policy Compliance Audit Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

