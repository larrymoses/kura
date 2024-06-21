#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80061 "Initiative Predecessor"
{

    fields
    {
        field(1;"Workplan No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Initiative No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Preceeding Initiative";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Workplan No.")
        {
            Clustered = true;
        }
        key(Key2;"Initiative No.")
        {
        }
        key(Key3;"Preceeding Initiative")
        {
        }
    }

    fieldgroups
    {
    }
}

