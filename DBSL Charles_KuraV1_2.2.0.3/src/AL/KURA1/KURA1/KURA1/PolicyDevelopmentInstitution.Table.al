#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80122 "Policy Development Institution"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Name;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No. of Policies";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Address;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Address 2";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;City;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Phone No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Phone No. 2";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Post Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;County;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Home Page";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Country/Region Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Contact Person";Code[30])
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

