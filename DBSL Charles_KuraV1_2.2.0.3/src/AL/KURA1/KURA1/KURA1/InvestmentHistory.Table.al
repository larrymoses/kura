#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54016 "Investment History"
{

    fields
    {
        field(1; No; Code[30])
        {
        }
        field(2; Date; Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                if UnitTrust.Get(No) then begin
                    if UnitTrust."Asset Type" = UnitTrust."asset type"::"Unit Trust" then begin

                        //ValuationFactorTotal:=0;
                        EquityTotal := 0;
                        TotalValuationFactor := 0.0;
                        TotalGain := 0;

                        Equity.Reset;
                        Equity.SetRange(Equity."Unit Trust", No);
                        if Equity.Find('-') then begin

                            repeat
                                //MESSAGE('%1',Equity."No.");
                                EquityTotal := EquityTotal + 1;
                                //MESSAGE('%1',EquityTotal);
                                Invest.Reset;
                                Invest.SetRange(Invest.No, Equity."No.");
                                Invest.SetRange(Invest.Date, Date);

                                if Invest.FindFirst then begin
                                    //REPEAT
                                    //InvestValuation:=ROUND(Invest."Valuation Factor",0.01);
                                    //MESSAGE('%1',Invest."Valuation Factor");
                                    if Invest."Valuation Factor" > 0 then
                                        //TotalValuationFactor:=ROUND((TotalValuationFactor+Invest."Valuation Factor"),0.01);
                                        TotalValuationFactor := TotalValuationFactor + Invest."Valuation Factor";
                                    TotalGain := TotalGain + Invest."Gain/Loss";
                                    //UNTIL Invest.NEXT=0;
                                end;
                            until Equity.Next = 0;
                        end;
                        //END;

                        //MESSAGE('%1',TotalValuationFactor);
                        //MESSAGE('%1',EquityTotal);

                        if EquityTotal <> 0 then
                            //"Valuation Factor":=TotalValuationFactor/EquityTotal;
                            //"Valuation Factor":=ROUND(TotalValuationFactor/EquityTotal,0.01);

                            UnitTrust.CalcFields("Current Value", "No.Of Units");
                        if UnitTrust."No.Of Units" <> 0 then
                            //"Current Market Value":=ROUND("Valuation Factor"*(UnitTrust."Current Value"/UnitTrust."No.Of Units"),0.01);
                            //MESSAGE('%1',TotalGain);

                            "Current Market Value" := ROUND((UnitTrust."Current Value" + TotalGain) / UnitTrust."No.Of Units", 0.00001);
                        "Valuation Factor" := "Current Market Value" / (UnitTrust."Current Value" / UnitTrust."No.Of Units");
                        //MESSAGE('%1',"Current Market Value");



                    end;
                end;


                if Equity.Get(No) then begin
                    if Equity."Asset Type" = Equity."asset type"::Equity then begin
                        //Equity.CALCFIELDS("No.Of Units","Current Value");
                        //"Valuation Factor":="Current Market Value"/(Equity."Current Value"/Equity."No.Of Units");
                        "Currency Code" := Equity."Currency Code";
                        //modify;
                    end;

                end;
            end;
        }
        field(3; "Par Value"; Decimal)
        {
        }
        field(4; "Current Market Value"; Decimal)
        {
            DecimalPlaces = 2 : 8;

            trigger OnValidate()
            begin
                if Equity.Get(No) then begin

                    if Equity."Asset Type" = Equity."asset type"::Equity then begin
                        Equity.CalcFields("No.Of Units", "Current Value", "Current Value (FCY)");
                        //MESSAGE('%1',Equity."No.Of Units");

                        if Equity."No.Of Units" > 0 then
                            if "Currency Code" = '' then begin
                                "Valuation Factor" := "Current Market Value" / (Equity."Current Value" / Equity."No.Of Units");
                                "Gain/Loss" := ("Current Market Value" * Equity."No.Of Units") - Equity."Current Value";

                            end else begin
                                "Valuation Factor" := "Current Market Value" / (Equity."Current Value (FCY)" / Equity."No.Of Units");
                                "Gain/Loss" := ("Current Market Value" * Equity."No.Of Units") - Equity."Current Value (FCY)";

                            end;
                    end;


                    if Equity."Asset Type" = Equity."asset type"::"Money Market" then begin
                        Equity.CalcFields("No.Of Units", "Current Value");


                        if Equity."Current Value" > 0 then
                            "Valuation Factor" := "Current Market Value" / Equity."Current Value";
                        "Gain/Loss" := "Current Market Value" - Equity."Current Value";
                    end;



                end;
            end;
        }
        field(5; "Interest Rate"; Decimal)
        {
        }
        field(6; Posted; Boolean)
        {
        }
        field(7; Name; Text[100])
        {
            CalcFormula = lookup("Investment Asset".Description where("No." = field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; MarketValueBF; Decimal)
        {
        }
        field(9; SharesBF; Decimal)
        {
        }
        field(10; CostBF; Decimal)
        {
        }
        field(11; "Valuation Factor"; Decimal)
        {
            DecimalPlaces = 2 : 5;
        }
        field(12; "Yield Used"; Decimal)
        {
        }
        field(13; "Gain/Loss"; Decimal)
        {
        }
        field(14; "Currency Code"; Code[20])
        {
            Editable = false;
            TableRelation = Currency;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDocDim;
            end;

            trigger OnValidate()
            begin
                //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
            end;
        }
        field(481; "Header No"; Code[50])
        {
            TableRelation = "EFT Header".No;
        }
    }

    keys
    {
        key(Key1; No, Date, "Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Equity: Record "Investment Asset";
        UnitTrust: Record "Investment Asset";
        IvestHist: Record "Investment Asset";
        Invest: Record "Investment History";
        ValuationFactorTotal: Record "Investment History";
        EquityTotal: Integer;
        TotalValuationFactor: Decimal;
        InvestValuation: Decimal;
        TotalGain: Decimal;
}

