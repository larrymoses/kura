#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70228 "Vendor Beneficiaries"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Name;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Director,Shareholder';
            OptionMembers = Director,Shareholder;
        }
        field(4;"ID Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'National ID,Passport';
            OptionMembers = "National ID",Passport;
        }
        field(5;"ID/Passport No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Phone No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Allocated Shares";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Vendor No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

