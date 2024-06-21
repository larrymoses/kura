#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72409 "Applicant Registration"
{

    fields
    {
        field(1;"Applicant No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Applicant Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Applicant Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Company, Individual';
            OptionMembers = Company," Individual";
        }
        field(4;"Email Address";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Telephone No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Address;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Address 2";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;City;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Post Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Applicant No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

