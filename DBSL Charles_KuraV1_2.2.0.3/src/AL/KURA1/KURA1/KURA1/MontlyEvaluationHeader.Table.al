#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72077 "Montly Evaluation Header"
{

    fields
    {
        field(1;"Project No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Project Title";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Road Authority Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Road Authority Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Date Checked";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Project Manager Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Project Manager Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"No. Of Elapsed Months";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Project No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

