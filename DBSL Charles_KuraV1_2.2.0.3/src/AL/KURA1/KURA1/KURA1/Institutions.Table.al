#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54011 "Institutions"
{

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Telephone 1";Code[20])
        {
        }
        field(4;"Telephone 2";Code[20])
        {
        }
        field(5;"Address 1";Code[100])
        {
        }
        field(6;"Address 2";Code[100])
        {
        }
        field(7;"Fax No";Code[20])
        {
        }
        field(8;"E Mail";Code[20])
        {
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

