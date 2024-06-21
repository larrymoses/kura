#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69407 "Safe Work Permit Type"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[440])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No. of Safe Work Permit Apps";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Safe Work Permit Apps';
        }
        field(4;"No. of Safe Work Compl Reports";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Safe Work Compl Reports';
        }
        field(5;Blocked;Boolean)
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
