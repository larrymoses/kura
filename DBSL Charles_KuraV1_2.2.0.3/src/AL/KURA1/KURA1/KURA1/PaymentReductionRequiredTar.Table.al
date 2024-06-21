#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72074 "Payment Reduction Required Tar"
{

    fields
    {
        field(1;"Entry no";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Project No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Elapse Of Month";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Road Usability";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Road User Comfort";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Road Durability";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Service;Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Level Selection Categ".Code;
        }
    }

    keys
    {
        key(Key1;"Entry no","Project No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

