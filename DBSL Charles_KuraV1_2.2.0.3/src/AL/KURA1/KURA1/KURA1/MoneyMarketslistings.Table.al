#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54006 "Money Markets listings"
{
    DrillDownPageID = "Money Market List";
    LookupPageID = "Money Market List";

    fields
    {
        field(1;"Issue No";Code[30])
        {
        }
        field(2;"Issue Date";Date)
        {
        }
        field(3;"Value Date";Date)
        {
        }
        field(4;"Days Re";Decimal)
        {
        }
        field(5;"Tenure (Years)";Decimal)
        {
        }
        field(6;"Maturity Date";Date)
        {
        }
        field(7;"Coupon Rate";Decimal)
        {
            DecimalPlaces = 0:4;
        }
        field(8;Yield;Decimal)
        {
        }
        field(9;Price;Decimal)
        {
            DecimalPlaces = 2:6;
        }
        field(10;"Issue Size Face Value";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Issue No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

