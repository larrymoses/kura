#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69117 "Medical Information"
{
    DrillDownPageID = "Shortlisting Criteria";
    LookupPageID = "Shortlisting Criteria";

    fields
    {
        field(1;Description;Code[50])
        {
        }
        field(2;Remarks;Text[200])
        {
        }
    }

    keys
    {
        key(Key1;Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

