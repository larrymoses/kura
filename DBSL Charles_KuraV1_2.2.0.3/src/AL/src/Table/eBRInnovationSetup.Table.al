#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80207 "e-BR & Innovation Setup"
{

    fields
    {
        field(1;"Primary Key";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Employee Survey No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(4;"Customer Survey No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5;"Post-Project Survey No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6;"Stakeholder Survey No. Series";Code[30])
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
        field(9;"BR Templates No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(10;"Surveys No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(11;"Survey Response No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(12;"Custom Surveys No. Series";Code[30])
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

