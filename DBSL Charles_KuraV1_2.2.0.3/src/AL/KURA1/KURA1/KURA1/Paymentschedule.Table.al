#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54012 "Payment schedule"
{

    fields
    {
        field(1;"Member No";Code[20])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                /*IF Equity.GET("Investment No") THEN
                BEGIN
                 "Ledger Code":=Equity."Global Dimension 1 Code";
                
                END;
                */

            end;
        }
        field(2;"Expected Date";Date)
        {
            NotBlank = true;
        }
        field(3;"Expected  Amount";Decimal)
        {
        }
        field(4;Received;Boolean)
        {

            trigger OnValidate()
            begin
                /*IF "Received Amount"="Net Amount" THEN
                Received:=TRUE;
                */

            end;
        }
        field(5;"Received Amount";Decimal)
        {
            CalcFormula = sum(Payments1.Amount where ("Unit Trust Member No"=field("Member No"),
                                                      "Payment Schedule"=field("Expected Date")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Member No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

