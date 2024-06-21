#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69055 "Employee Transfers"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Employee Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Original Station";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"New Station";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Original Station Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"New Sattion Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Transfer Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Transfered By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"To Hardship Area?";Boolean)
        {
            DataClassification = ToBeClassified;
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

