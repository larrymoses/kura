#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54005 "Investment Type"
{

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;Type;Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(4;"Interest Rate p.a";Decimal)
        {
        }
        field(5;"Repayment Frequency";DateFormula)
        {
        }
        field(6;"Grace Period";DateFormula)
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

