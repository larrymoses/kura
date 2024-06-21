#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80071 "Competency Profile"
{

    fields
    {
        field(1;"No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Code[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Job Title";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Job Grade";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Responsibility Center";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Competency Rating Scale";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"General Instructions";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

