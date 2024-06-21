#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72079 "Contract Evaluation Tally Shee"
{

    fields
    {
        field(1;"Project No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project Title";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Road Authority Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Road Authority Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Date of Commencement";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"No. of elapsed months";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Project Manager Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Project Manager Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Road Manager Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Road Manager Name";Text[250])
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

