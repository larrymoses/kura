#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54025 "Investment Rollover"
{

    fields
    {
        field(1;"Investment No";Code[20])
        {
            TableRelation = "Fixed Asset"."No." where ("Asset Type"=const("Money Market"));

            trigger OnValidate()
            begin
                  if  MM.Get("Investment No") then
                  "Rollover Rate%":=MM."Rate %";
            end;
        }
        field(2;"Roll Over Date";Date)
        {

            trigger OnValidate()
            begin
                 /*   MM.GET("Investment No");
                    Rollover.RESET;
                   Rollover.SETRANGE("Investment No","Investment No");
                
                IF FINDLAST=TRUE THEN
                //MESSAGE('%1',"Roll Over Date")
                LastRolloverDate:="Maturity Date"
                ELSE
                LastRolloverDate:=MM."Investment Date";
                MESSAGE('%1',LastRolloverDate);
                  MESSAGE('%1',"Roll Over Date");
                IF "Roll Over Date"<>LastRolloverDate THEN
                ERROR('%1%2','Roll Over Date must be ',LastRolloverDate);
                */

            end;
        }
        field(3;Value;Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where ("Investment Code"=field("Investment No"),
                                                        "GL Type"=filter(Acquisition),
                                                        "Posting Date"=field(upperlimit("Roll Over Date")),
                                                        "Investment Transcation Type"=const(Interest),
                                                        "AC Type"=const("Balance Sheet")));
            FieldClass = FlowField;
        }
        field(4;Posted;Boolean)
        {
        }
        field(5;"Rollover Rate%";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(6;"Rollover Net Amount";Decimal)
        {
        }
        field(7;"Acquisition Amount";Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where ("Investment Code"=field("Investment No"),
                                                        "GL Type"=const(Acquisition),
                                                        "Investment Transcation Type"=const(Acquisition),
                                                        "Posting Date"=field("Roll Over Date")));
            FieldClass = FlowField;
        }
        field(8;"Maturity Period Days";Integer)
        {

            trigger OnValidate()
            begin
                   if "Roll Over Date"<>0D then
                   "Maturity Date":=CalcDate(Format("Maturity Period Days")+'D',"Roll Over Date")
                   else
                   Error('Please key investment date');
            end;
        }
        field(9;"Maturity Date";Date)
        {
        }
    }

    keys
    {
        key(Key1;"Investment No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        MM: Record "Investment Asset";
        Rollover: Record "Investment Rollover";
        LastRolloverDate: Date;
}

