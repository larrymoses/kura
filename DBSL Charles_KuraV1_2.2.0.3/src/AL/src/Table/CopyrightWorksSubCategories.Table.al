#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56021 "Copyright Works Sub-Categories"
{

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Category Code";Code[20])
        {
            TableRelation = "Copyright Works Categories";
        }
        field(3;Description;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Code","Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

