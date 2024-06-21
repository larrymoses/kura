#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80062 "Initiative Comment"
{

    fields
    {
        field(1;"Workplan No.";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Initiative No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Comment/Additional Notes";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"User ID";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Last Update Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"External Document No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Workplan No.","Initiative No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

