#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 54019 "Bond Calculator"
{

    fields
    {
        field(1; No; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "FXD No"; Code[20])
        {
            TableRelation = "Money Markets listings";
        }
        field(3; "System Bond No"; Code[20])
        {
            TableRelation = "Investment Asset" where("FDR Number" = field("FXD No"));

            trigger OnValidate()
            begin
                if FA.Get("System Bond No") then begin
                    FA.CalcFields(FA."Acquisition Cost");
                    "Issue Date" := FA."Issue Date";
                    "Face Value" := FA."Face Value";
                    "Original Term" := FA."Maturity Period";
                    "Coupon Rate" := FA."Rate %";
                    "Maturity Date" := FA."Maturity Date";
                    Coupon := "Coupon Rate";
                    "Nominal Amount (Cost)" := FA."Acquisition Cost";
                    "Custodian Code" := FA."Custodian Code";
                    "Fund Code" := FA."Fund Code";
                    "Dimension Set ID" := FA."Dimension Set ID";
                end;
            end;
        }
        field(4; "Issue Date"; Date)
        {
        }
        field(5; "Face Value"; Decimal)
        {
        }
        field(6; "Original Term"; Integer)
        {
        }
        field(7; "Coupon Rate"; Decimal)
        {
            DecimalPlaces = 4 : 8;
        }
        field(8; "Maturity Date"; Date)
        {
        }
        field(9; "Settlement Date"; Date)
        {

            trigger OnValidate()
            begin
                /*IF "Settlement Date"<>0D THEN BEGIN
                 InterestRec.SETRANGE(InterestRec."Investment No","System Bond No");
                 InterestRec.SETRANGE(InterestRec."Expected Interest Date",0D,"Settlement Date");
                  IF InterestRec.FIND('+') THEN
                   "Last Coupon":=InterestRec."Expected Interest Date";
                 END;
                IF InterestRec2.GET("System Bond No","Last Coupon") THEN
                 InterestRec.NEXT(+1);
                 "Next Coupon":=InterestRec."End Date"+1;
                
                "Last to next":="Next Coupon"-"Last Coupon";
                "Set to Next":="Next Coupon"-"Settlement Date";
                "Last to set":="Settlement Date"-"Last Coupon";
                  "Average unpaid coupons":=ROUND(("Maturity Date"-"Last Coupon")/182,1);
                
                 "Unpaid Coupon":=ROUND(("Maturity Date"-"Last Coupon")/182,1);
                   */

                FA.Get("System Bond No");
                investSetup.Get;
                if "System Bond No" <> '' then begin

                    if "Settlement Date" <> 0D then begin
                        InterestRec.SetRange(InterestRec."Investment No", "System Bond No");
                        InterestRec.SetRange(InterestRec."Expected Interest Date", 0D, "Settlement Date");
                        if InterestRec.Find('+') then
                            "Last Coupon" := InterestRec."Expected Interest Date";
                    end;

                    if InterestRec2.Get("System Bond No", "Last Coupon") then begin
                        InterestRec2.Next(+1);
                        //"Next Coupon":=CALCDATE('CD+1D',InterestRec."End Date");
                        "Next Coupon" := InterestRec."End Date";
                        //"Next Coupon":=TODAY;

                        "Last to next" := "Next Coupon" - "Last Coupon";
                        "Set to Next" := "Next Coupon" - "Settlement Date";
                        "Last to set" := "Settlement Date" - "Last Coupon";

                        /*IF FA."Deposit Type"=FA."Deposit Type"::Corporate THEN BEGIN
                          "Average unpaid coupons":=ROUND(("Maturity Date"-"Last Coupon")/FA."Interest days",1);

                         "Unpaid Coupon":=ROUND(("Maturity Date"-"Last Coupon")/FA."Interest days",1);
                         IF "Settlement Date">"Last Coupon" THEN
                        "Accrued Interest 2":=ROUND(((("Settlement Date"-"Last Coupon"))/investSetup."C-BOND Year Days")*
                        "Face Value"*("Coupon Rate"/100),0.01);
                         IF "Settlement Date"="Last Coupon" THEN
                        "Accrued Interest 2":=ROUND(((FA."Interest days")/investSetup."C-BOND Year Days")*
                        "Face Value"*("Coupon Rate"/100),0.01);
                        //"Accrued Interest 2":=InterestRec2."Expected Interest Amount";

                        END;*/

                        if (FA."Deposit Type" = FA."deposit type"::Treasury) or (FA."Deposit Type" = FA."deposit type"::Corporate) then begin
                            "Average unpaid coupons" := ROUND(("Maturity Date" - "Last Coupon") / 182, 1);

                            "Unpaid Coupon" := ROUND(("Maturity Date" - "Last Coupon") / 182, 1);
                            if "Settlement Date" > "Last Coupon" then
                                "Accrued Interest 2" := ROUND(((("Settlement Date" - "Last Coupon")) / 364) *
                                "Face Value" * ("Coupon Rate" / 100), 1);
                            if "Settlement Date" = "Last Coupon" then
                                "Accrued Interest 2" := ROUND((((182)) / 364) *
                                "Face Value" * ("Coupon Rate" / 100), 1);
                            //"Accrued Interest 2":=InterestRec2."Expected Interest Amount";

                        end;


                    end else begin

                        StartDate := "Issue Date";
                        MaturityDate := "Maturity Date";
                        //PeriodEnddate:=CALCDATE('CD+182D',StartDate);
                        PeriodEnddate := CalcDate(FA."Interest Frequency Period", StartDate);

                        //MESSAGE('%1%2', StartDate,PeriodEnddate);
                        // repeat
                        if (("Settlement Date" > StartDate) and ("Settlement Date" < PeriodEnddate)) then begin
                            // "Next Coupon":=CALCDATE('CD+182D',StartDate);
                            "Next Coupon" := CalcDate(FA."Interest Frequency Period", StartDate);

                            "Last Coupon" := StartDate;
                        end;
                        //StartDate:=CALCDATE('CD+182D',StartDate);
                        //PeriodEnddate:=CALCDATE('CD+182D',StartDate);
                        StartDate := CalcDate(FA."Interest Frequency Period", StartDate);
                        PeriodEnddate := CalcDate(FA."Interest Frequency Period", StartDate);

                        //MESSAGE('%1%2', StartDate,PeriodEnddate);

                        //UNTIL StartDate>CALCDATE('CD-182D',MaturityDate);
                        //UNTIL StartDate>CALCDATE('CD-182D',MaturityDate);
                        //until StartDate>CalcDate(FA."Interest days",MaturityDate); //********Commented Morris;
                        //UNTIL StartDate>CALCDATE(FA."Interest Frequency Period",MaturityDate);


                        "Last to next" := "Next Coupon" - "Last Coupon";
                        "Set to Next" := "Next Coupon" - "Settlement Date";
                        "Last to set" := "Settlement Date" - "Last Coupon";

                        if FA."Deposit Type" = FA."deposit type"::Treasury then begin
                            "Average unpaid coupons" := ROUND(("Maturity Date" - "Last Coupon") / 182, 1);

                            "Unpaid Coupon" := ROUND(("Maturity Date" - "Last Coupon") / 182, 1);
                        end;
                        if FA."Deposit Type" = FA."deposit type"::Corporate then begin
                            "Average unpaid coupons" := ROUND(("Maturity Date" - "Last Coupon") / FA."Interest days", 1);

                            "Unpaid Coupon" := ROUND(("Maturity Date" - "Last Coupon") / FA."Interest days", 1);
                        end;


                    end;

                end;



                if "System Bond No" = '' then begin
                    if Bond.Get("FXD No") then begin
                        StartDate := Bond."Issue Date";
                        MaturityDate := Bond."Maturity Date";
                        //PeriodEnddate:=CALCDATE('CD+182D',StartDate);
                        PeriodEnddate := CalcDate(FA."Interest Frequency Period", StartDate);

                        //MESSAGE('%1%2', StartDate,PeriodEnddate);
                        repeat
                            if (("Settlement Date" > StartDate) and ("Settlement Date" < PeriodEnddate)) then begin
                                "Next Coupon" := CalcDate(FA."Interest Frequency Period", StartDate);
                                "Last Coupon" := StartDate;
                            end;
                            StartDate := CalcDate('CD+182D', StartDate);
                            PeriodEnddate := CalcDate('CD+182D', StartDate);
                        //MESSAGE('%1%2', StartDate,PeriodEnddate);

                        until StartDate = CalcDate('CD-182D', MaturityDate);
                    end;

                    "Last to next" := "Next Coupon" - "Last Coupon";
                    "Set to Next" := "Next Coupon" - "Settlement Date";
                    "Last to set" := "Settlement Date" - "Last Coupon";
                    "Average unpaid coupons" := ROUND(("Maturity Date" - "Last Coupon") / 182, 1);

                    "Unpaid Coupon" := ROUND(("Maturity Date" - "Last Coupon") / 182, 1);

                end;

            end;
        }
        field(10; "Next Coupon"; Date)
        {
        }
        field(11; "Last Coupon"; Date)
        {
        }
        field(12; "Set to Next"; Decimal)
        {
        }
        field(13; "Last to next"; Decimal)
        {
        }
        field(14; "Last to set"; Decimal)
        {
        }
        field(15; "Average unpaid coupons"; Decimal)
        {
        }
        field(16; "Unpaid Coupon"; Decimal)
        {
            DecimalPlaces = 4 : 4;
        }
        field(17; Coupon; Decimal)
        {
        }
        field(18; "Yield(input)"; Decimal)
        {
            DecimalPlaces = 4 : 4;

            trigger OnValidate()
            begin
                Q31 := "Yield(input)" / 100;
                Q32 := 2;
                Q26 := "Unpaid Coupon";
                Q30 := Coupon / 100;

                //MESSAGE('%1',"Unpaid Coupon");
                if "Last to next" <> 0 then
                    Q49 := "Set to Next" / ("Last to next");

                Q45New := Power((1 + (Q31 / Q32)), Q26);
                Q46 := Q30 / Q32;
                Q45 := 1 - (1 / Q45New);
                Q47 := 1 / Power((1 + (Q31 / Q32)), (Q26 - 1));

                Q44 := 1 - (1 / (1 + (Q31 / Q32)));

                Q48 := 100 / Power((1 + (Q31 / Q32)), Q49);

                "Dirty Price/per value" := (Q48 * ((Q46 * (Q45 / Q44)) + Q47));
                //"Dirty Price/per value":=(Q48*((Q46*(Q45/Q44))+Q47))-("Last to set"/364*Q30*100);
                //MESSAGE('%1',"Dirty Price/per value");

                //"Accrued Interest 2":=ROUND(((("Settlement Date"-"Last Coupon"))/365)*
                // "Face Value"*("Coupon Rate"/100),1);
                if "Settlement Date" > "Last Coupon" then
                    "Accrued Interest 2" := ROUND(((("Settlement Date" - "Last Coupon")) / 364) *
                    "Face Value" * ("Coupon Rate" / 100), 1);
                if "Settlement Date" = "Last Coupon" then
                    "Accrued Interest 2" := ROUND((((182)) / 364) *
                    "Face Value" * ("Coupon Rate" / 100), 1);

                "Accrued Interest" := "Last to set" / 365 * Q30 * 100;
                "Day Basis" := 365;
                "Clean Price" := "Dirty Price/per value" - "Accrued Interest";

                //test
                //"Dirty Price/per value":="Clean Price";
                //"Clean Price":="Dirty Price/per value"-"Accrued Interest";
                //end test


                //"Nominal Amount":="Face Value";
                //"Bond Consideration":=ROUND("Nominal Amount"*"Dirty Price/per value"/100,1);
                "Bond Consideration" := "Nominal Amount (Cost)" * ROUND("Dirty Price/per value", 0.0001) / 100;
                //MESSAGE('%1',"Dirty Price/per value"/100);
                Commission := "Bond Consideration" * "% commission" / 100;

                //"Net Amount Receivable":=ROUND("Bond Consideration"-Commission,1);
                "Net Amount Receivable" := "Bond Consideration" - Commission;
                "Loss/Profit on sale of bond" := "Net Amount Receivable" - "Nominal Amount (Cost)";
            end;
        }
        field(19; "Market Rate"; Decimal)
        {
            DecimalPlaces = 4 : 4;
        }
        field(20; Frequency; Decimal)
        {
        }
        field(21; "Day Basis"; Decimal)
        {
        }
        field(22; "Dirty Price/per value"; Decimal)
        {
            DecimalPlaces = 4 : 8;

            trigger OnValidate()
            begin
                //"Accrued Interest 2":=ROUND(((("Settlement Date"-"Last Coupon"))/364)*
                //"Face Value"*("Coupon Rate"/100),1);

                //"Accrued Interest":="Last to set"/364*Q30*100;
                "Day Basis" := 365;
                //"Clean Price":="Dirty Price/per value"-"Accrued Interest";
                Q30 := Coupon / 100;
                //test
                //"Dirty Price/per value":="Clean Price";
                //"Clean Price":="Dirty Price/per value"-"Accrued Interest";
                //end test
                "Accrued Interest 2" := ROUND(((("Settlement Date" - "Last Coupon")) / 365) *
                 "Face Value" * ("Coupon Rate" / 100), 1);

                "Accrued Interest" := "Last to set" / 365 * Q30 * 100;
                "Day Basis" := 365;
                "Clean Price" := "Dirty Price/per value" - "Accrued Interest";


                //"Nominal Amount":="Face Value";
                //"Bond Consideration":=ROUND("Nominal Amount"*"Dirty Price/per value"/100,1);
                //"Bond Consideration":="Nominal Amount (Cost)"*ROUND("Dirty Price/per value",0.0001)/100;
                "Bond Consideration" := "Face Value" * ROUND("Dirty Price/per value", 0.0001) / 100;

                //MESSAGE('%1',"Dirty Price/per value"/100);
                Commission := "Bond Consideration" * "% commission" / 100;

                //"Net Amount Receivable":=ROUND("Bond Consideration"-Commission,1);
                "Net Amount Receivable" := "Bond Consideration" - Commission;
                "Loss/Profit on sale of bond" := "Bond Consideration" - "Nominal Amount (Cost)";
            end;
        }
        field(23; "Accrued Interest"; Decimal)
        {
            DecimalPlaces = 4 : 4;
        }
        field(25; "Nominal Amount (Cost)"; Decimal)
        {
        }
        field(26; "Bond Consideration"; Decimal)
        {
        }
        field(27; Commission; Decimal)
        {
        }
        field(28; "Net Amount Receivable"; Decimal)
        {
        }
        field(29; "Book value for the Bond"; Decimal)
        {

            trigger OnValidate()
            begin
                "Loss/Profit on sale of bond" := "Net Amount Receivable" - "Book value for the Bond" - "Accrued Interest 2";
            end;
        }
        field(30; "Accrued Interest 2"; Decimal)
        {
        }
        field(31; "Loss/Profit on sale of bond"; Decimal)
        {
        }
        field(32; "Per Value"; Decimal)
        {
        }
        field(33; "Clean Price"; Decimal)
        {
            DecimalPlaces = 4 : 8;
        }
        field(34; Department; Code[20])
        {
            TableRelation = "Dimension Value"."Global Dimension No." where("Global Dimension No." = const(1));
        }
        field(35; "% commission"; Decimal)
        {
            DecimalPlaces = 2 : 4;

            trigger OnValidate()
            begin
                //IF  "Yield(input)">0 THEN BEGIN
                //VALIDATE("Yield(input)");

                //END ELSE BEGIN
                Commission := "Bond Consideration" * "% commission" / 100;

                //"Net Amount Receivable":=ROUND("Bond Consideration"-Commission,1);
                "Net Amount Receivable" := "Bond Consideration" - Commission;
                "Loss/Profit on sale of bond" := "Net Amount Receivable" - "Nominal Amount (Cost)";

                //END;
            end;
        }
        field(36; Posted; Boolean)
        {
        }
        field(37; "Interest Posted"; Boolean)
        {
        }
        field(38; "Revaluation Posted"; Boolean)
        {
        }
        field(39; "Custodian Code"; Code[20])
        {
            Caption = 'Custodian Code';
            TableRelation = "Custodian Code".Code;
        }
        field(40; "Fund Code"; Code[20])
        {
            TableRelation = "Fund Code".Code;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDimensions;
            end;

            trigger OnValidate()
            begin
                //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
            end;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FA: Record "Investment Asset";
        InterestRec: Record "Expected Interest1";
        InterestRec2: Record "Expected Interest1";
        Q48: Decimal;
        Q46: Decimal;
        Q45: Decimal;
        Q44: Decimal;
        Q47: Decimal;
        Q31: Decimal;
        Q32: Decimal;
        Q49: Decimal;
        Q30: Decimal;
        Q26: Decimal;
        Q45New: Decimal;
        Bond: Record "Money Markets listings";
        StartDate: Date;
        PeriodEnddate: Date;
        MaturityDate: Date;
        investSetup: Record "Investment Setup";
}

