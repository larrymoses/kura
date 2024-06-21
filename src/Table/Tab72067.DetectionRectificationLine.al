#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72067 "Detection & Rectification Line"
{

    fields
    {
        field(1;"Project No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2;No;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Date Detected";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Location Deteced From";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Date Rectified";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Complied?";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'yes/no';
        }
        field(9;Remark;Text[250])
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

