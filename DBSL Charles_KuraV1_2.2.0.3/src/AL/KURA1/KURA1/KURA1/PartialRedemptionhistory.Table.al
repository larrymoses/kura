#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57023 "Partial Redemption history"
{

    fields
    {
        field(1;"TBond No";Code[50])
        {
        }
        field(2;"Redemption Date";Date)
        {
        }
        field(3;"Old Face Value";Decimal)
        {
        }
        field(4;"Amount Redeemed";Decimal)
        {
        }
        field(5;"New Face Value";Decimal)
        {
        }
        field(6;"Document No";Code[50])
        {
        }
    }

    keys
    {
        key(Key1;"TBond No","Redemption Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

