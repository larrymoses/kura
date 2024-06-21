#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54017 "Dividend Payment"
{

    fields
    {
        field(1;"Investment No.";Code[10])
        {
            TableRelation = "Investment Asset";
        }
        field(2;"Transaction Type";Text[30])
        {
        }
        field(3;"Dividend Rate";Decimal)
        {
            DecimalPlaces = 2:8;

            trigger OnValidate()
            begin
                FixAssets.Reset;
                  FixAssets.SetRange(FixAssets."No.","Investment No.");
                  FixAssets.SetRange(FixAssets."Date Filter",0D,"Books Closure Date");
                  if FixAssets.Find('-') then begin
                    FixAssets.CalcFields(FixAssets."No.Of Units",FixAssets."Current Value",Cost);
                    "Dividend Amount":=FixAssets."No.Of Units"*"Dividend Rate";
                    "No. of Shares":=FixAssets."No.Of Units";
                  end;
            end;
        }
        field(4;"Books Closure Date";Date)
        {
        }
        field(5;"Payment Date";Date)
        {
        }
        field(6;"No. of Shares";Decimal)
        {
            Editable = false;
        }
        field(7;"Dividend Amount";Decimal)
        {
            Editable = false;
        }
        field(8;Posted;Boolean)
        {
            Editable = false;
        }
        field(9;"Payment posted";Boolean)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Investment No.","Books Closure Date")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FixAssets: Record "Investment Asset";
}

