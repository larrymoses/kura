#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56206 "Staff Training Appraisal"
{

    fields
    {
        field(1;"Appraisal No";Code[20])
        {
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
        }
        field(3;"Training & Development Need";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"Appraisal No","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

