#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59026 "Fuel Milleage Req"
{

    fields
    {
        field(1;No;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Date;Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Month := Format(Date,0,'<Month Text>');
            end;
        }
        field(3;Month;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Fuel Drawn";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Mileage (KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No,Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

