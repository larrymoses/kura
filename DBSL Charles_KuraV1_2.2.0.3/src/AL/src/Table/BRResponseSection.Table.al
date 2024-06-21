#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80223 "BR Response Section"
{

    fields
    {
        field(1;"Survey Response ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Section Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Section Completion Instruction";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Questions";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Total Weight %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Survey Response ID","Section Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

