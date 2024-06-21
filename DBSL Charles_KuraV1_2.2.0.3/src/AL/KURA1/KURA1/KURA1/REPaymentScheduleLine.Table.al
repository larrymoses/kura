#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72338 "RE Payment Schedule Line"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Contractor Staff No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Name;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Email;Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(8;"Phone No.";Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(9;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Designation;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

