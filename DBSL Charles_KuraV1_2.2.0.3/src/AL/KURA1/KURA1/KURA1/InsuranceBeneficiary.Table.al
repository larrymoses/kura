#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69741 "Insurance Beneficiary"
{

    fields
    {
        field(1;"Document No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Beneficiary Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Relationship;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Self,Spouse,Partner,Child,Other';
            OptionMembers = ,Self,Spouse,Partner,Child,Other;
        }
        field(4;Contact;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"ID No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"E-Mail";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Insurance Code";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Insurance Code","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

