#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54024 "Investment Rates"
{

    fields
    {
        field(1;"Investment No.";Code[20])
        {
            TableRelation = "Investment Asset";

            trigger OnValidate()
            begin
                //  IF InvestmentRegister.GET("Investment No.") THEN
                 // BEGIN
                 //   "Institution Name":=InvestmentRegister."Institution Name";
                //  END;
            end;
        }
        field(2;Date;Date)
        {
            NotBlank = true;
        }
        field(3;"Per value";Decimal)
        {
        }
        field(4;"Current Market Value";Decimal)
        {
        }
        field(5;Type;Option)
        {
            OptionMembers = " ","Money Market",Property,Equity,Mortgage;
        }
        field(6;"Institution Name";Text[100])
        {
        }
        field(7;Posted;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Investment No.",Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

