#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69157 "Salary Pointers2"
{

    fields
    {
        field(1;"Salary Pointer";Text[7])
        {
        }
        field(2;"Basic Pay int";Integer)
        {
        }
        field(3;"Basic Pay";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Salary Pointer")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

