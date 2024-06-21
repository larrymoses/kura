#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54003 "Tarriff Codes"
{

    fields
    {
        field(54001;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(54002;Description;Text[50])
        {
        }
        field(54003;Percentage;Decimal)
        {
        }
        field(54004;"G/L Account";Code[20])
        {
            TableRelation = "G/L Account"."No.";
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

