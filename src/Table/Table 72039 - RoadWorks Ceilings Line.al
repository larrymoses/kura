/// <summary>
/// Table RoadWorks Ceilings Line (ID 99463).
/// </summary>
table 99463 "RoadWorks Ceilings Line"
{
    Caption = 'RoadWorks Ceilings Line';

    fields
    {
        field(1; "Document No"; Code[20])
        {

            Editable = false;

        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;

            Editable = false;
        }
        field(3; "Region Code"; Code[30])
        {

            TableRelation = IF ("Includes HQ"= const(false)) "Responsibility Center".Code WHERE (HQ=CONST(false),
                                                                                            "Operating Unit Type"=CONST(Region))
                                                                                            ELSE IF ("Includes HQ"=CONST(true)) "Responsibility Center".Code WHERE ("Operating Unit Type"=CONST(Region));

            trigger OnValidate()
            var
                RoadWorkBudgetCeiling: Record "Road Works Budget Ceilings";
            begin
                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Region Code");
                IF ResponsibilityCenter.FINDSET THEN BEGIN
                    "Region Name" := ResponsibilityCenter.Name;
                END;



                RoadWorkBudgetCeiling.Reset();
                RoadWorkBudgetCeiling.SetRange("Document No", Rec."Document No");
                if RoadWorkBudgetCeiling.findfirst() then begin
                    RoadWorkBudgetCeiling.testfield("Financial Year Code");
                    Rec.Validate("Financial Year", RoadWorkBudgetCeiling."Financial Year Code");
                end;


                //Insert Constituency Allocations  for the Region
                RoadWorksBudgetCeilings.RESET;
                RoadWorksBudgetCeilings.SETRANGE("Document No", "Document No");
                IF RoadWorksBudgetCeilings.FINDSET() THEN BEGIN
                    IF RoadWorksBudgetCeilings."Constituency Allocation Method" = RoadWorksBudgetCeilings."Constituency Allocation Method"::Equal THEN BEGIN
                        Constituency.RESET;
                        // Constituency.SETRANGE("Regional Constituency", FALSE);
                        Constituency.SETRANGE("Region Code", "Region Code");
                        IF Constituency.FINDSET THEN BEGIN
                            REPEAT
                                RoadWorksCeilingDetailedLine.INIT;
                                RoadWorksCeilingDetailedLine."Document No" := "Document No";
                                RoadWorksCeilingDetailedLine."Line No" := "Line No";
                                RoadWorksCeilingDetailedLine."Entry No" := RoadWorksCeilingDetailedLine.COUNT + 1;
                                RoadWorksCeilingDetailedLine."Region Code" := "Region Code";
                                RoadWorksCeilingDetailedLine."Constituency Code" := Constituency.Code;
                                RoadWorksCeilingDetailedLine.VALIDATE("Constituency Code");
                                RoadWorksCeilingDetailedLine."Allocation Percentage(%)" := (100 / Constituency.COUNT);
                                RoadWorksCeilingDetailedLine.VALIDATE("Allocation Percentage(%)");
                                RoadWorksCeilingDetailedLine."Financial Year" := "Financial Year";
                                RoadWorksCeilingDetailedLine."Funding Source Code" := "Funding Source Code";
                                RoadWorksCeilingDetailedLine."Funding Source Type" := "Funding Source Type";
                                RoadWorksCeilingDetailedLine."Allocation to Regional Const" := "Allocation to Regional Const";
                                RoadWorksCeilingDetailedLine."Regional Allocated Amount" := "Allocation Amount (KES)";
                                //MESSAGE('Allocated amount %1',"Allocation Amount (KES)");
                                IF NOT RoadWorksCeilingDetailedLine.INSERT(TRUE) THEN
                                    RoadWorksCeilingDetailedLine.MODIFY(TRUE);
                            UNTIL Constituency.NEXT = 0;
                        END;
                    END;
                END;


                RoadWorksCeilingsLine.RESET;
                RoadWorksCeilingsLine.SETRANGE(RoadWorksCeilingsLine."Document No", "Document No");
                RoadWorksCeilingsLine.SETRANGE(RoadWorksCeilingsLine."Region Code", "Region Code");
                IF RoadWorksCeilingsLine.FINDSET THEN BEGIN
                    // ERROR('Budget Ceiling for %1 for %2 already exists. Please select another region',"Region Name","Funding Source Code");
                END;
            end;
        }
        field(4; "Region Name"; Text[100])
        {

            Editable = false;
        }
        field(5; "Allocation Percentage(%)"; Decimal)
        {


            trigger OnValidate()
            begin
                RoadWorksBudgetCeilings.RESET;
                RoadWorksBudgetCeilings.SETRANGE(RoadWorksBudgetCeilings."Document No", "Document No");
                IF RoadWorksBudgetCeilings.FINDSET THEN BEGIN
                    "Allocation Amount (KES)" := (("Allocation Percentage(%)" / 100) * RoadWorksBudgetCeilings."Budget Ceiling Amount");
                    "Allocation Remaining Amount" := "Allocation Amount (KES)";
                END;
            end;
        }
        field(6; "Allocation Amount (KES)"; Decimal)
        {
            trigger OnValidate()
            var
            RoadWorkCeilingsLine: Record "RoadWorks Ceilings Line";
            BudgetAmount: Decimal;
            AllocationAmount: Decimal;
            begin
                BudgetAmount :=0;
                RoadWorksBudgetCeilings.RESET;
                RoadWorksBudgetCeilings.SETRANGE(RoadWorksBudgetCeilings."Document No", "Document No");
                IF RoadWorksBudgetCeilings.FindFirst() THEN BEGIN
                BudgetAmount:= RoadWorksBudgetCeilings."Budget Ceiling Amount";
                    //"Allocation Amount (KES)":=(("Allocation Percentage(%)"/100)*RoadWorksBudgetCeilings."Budget Ceiling Amount");
                    "Allocation Percentage(%)" := (("Allocation Amount (KES)" / RoadWorksBudgetCeilings."Budget Ceiling Amount") * 100);
                    "Allocation Remaining Amount" := "Allocation Amount (KES)";
                END;
                AllocationAmount :=0;
                RoadWorkCeilingsLine.Reset();
                RoadWorkCeilingsLine.SetRange("Document No",Rec."Document No");
                if RoadWorkCeilingsLine.FindSet() then begin
                    AllocationAmount +=RoadWorkCeilingsLine."Allocation Amount (KES)";
                end;
                if Rec."Allocation Amount (KES)" > BudgetAmount then
                error('%1 allocation Amount for the regions cannot be more than the ceiling Amount %2',AllocationAmount,BudgetAmount)
                
            end;
        }
        field(7; "No of Constituencies"; Integer)
        {
            CalcFormula = Count(Constituency WHERE("Region Code" = FIELD("Region Code")
                                                    ));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Town Allocation(KES)"; Decimal)
        {
            CalcFormula = Sum("RoadWorks Ceiling DetailedLine"."Town Allocation(KES)" WHERE("Document No" = FIELD("Document No"),
                                                                                                     "Line No" = FIELD("Line No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Funding Source Type"; Option)
        {

            Editable = false;
            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;
        }
        field(10; "Financial Year"; Code[30])
        {

            Editable = false;
        }
        field(11; "Funding Source Code"; Code[30])
        {

            Editable = false;
        }
        field(12; "Includes HQ"; Boolean)
        {

        }
        field(13; "Allocation to Regional Const"; Boolean)
        {

        }
        field(15; "Allocation Remaining Amount"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(16; HQ; Boolean)
        {

        }
    }

    keys
    {
        key(Key1; "Document No","Region Code")// "Line No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        RoadWorksBudgetCeilings.RESET;
        RoadWorksBudgetCeilings.SETRANGE(RoadWorksBudgetCeilings."Document No", "Document No");
        IF RoadWorksBudgetCeilings.FINDSET THEN BEGIN
            RoadWorksBudgetCeilings.TestField("Financial Year Code");
            "Financial Year" := RoadWorksBudgetCeilings."Financial Year Code";
            "Funding Source Code" := RoadWorksBudgetCeilings."Global Dimension 2 Code";
            "Funding Source Type" := RoadWorksBudgetCeilings."Funding Source Type";
            "Includes HQ" := RoadWorksBudgetCeilings."Includes HQ";
        END;
    end;

    var
        RoadWorksBudgetCeilings: Record "Road Works Budget Ceilings";
        RoadWorksCeilingsLine: Record "RoadWorks Ceilings Line";
        ResponsibilityCenter: Record "Responsibility Center";
        Constituency: Record Constituency;
        RoadWorksCeilingDetailedLine: Record "RoadWorks Ceiling DetailedLine";
}

