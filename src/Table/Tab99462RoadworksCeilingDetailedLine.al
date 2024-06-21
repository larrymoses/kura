/// <summary>
/// Table RoadWorks Ceiling DetailedLine (ID 99462).
/// </summary>
table 99462 "RoadWorks Ceiling DetailedLine"
{
    Caption = 'RoadWorks Ceiling Detailed Line';

    fields
    {
        field(1;"Document No";Code[20])
        {
            
            Editable = false;
            trigger OnValidate()
            var

            begin
                RoadWorksBudgetCeilings.RESET();
                RoadWorksBudgetCeilings.SETRANGE(RoadWorksBudgetCeilings."Document No", "Document No");
                IF RoadWorksBudgetCeilings.FindFirst() THEN BEGIN
                    RoadWorksBudgetCeilings.TestField("Financial Year Code");
                    "Financial Year" := RoadWorksBudgetCeilings."Financial Year Code";
                    "Funding Source Code" := RoadWorksBudgetCeilings."Global Dimension 2 Code";
                    "Funding Source Type" := RoadWorksBudgetCeilings."Funding Source Type";
                    // "Includes HQ" := RoadWorksBudgetCeilings."Includes HQ";
                END;
            end;
        }
        field(2;"Line No";Integer)
        {
            
            Editable = false;
        }
        field(3;"Entry No";Integer)
        {
            AutoIncrement = true;
            
            Editable = false;
        }
        field(4;"Region Code";Code[30])
        {
            
        }
        field(5;"Constituency Code";Code[30])
        {
            // 
            // TableRelation = IF ("Allocation to Regional Const"=CONST(false)) Constituency.Code WHERE ("Region Code"=FIELD("Region Code"))
            //                                                                                      //"Regional Constituency"=CONST(false))
            //                                                                                      ELSE IF ("Allocation to Regional Const"=CONST(true)) Constituency.Code WHERE ("Region Code"=FIELD("Region Code"));

            trigger OnValidate()
            begin
                Constituency.RESET;
                Constituency.SETRANGE(Constituency.Code,"Constituency Code");
                IF Constituency.FINDSET THEN BEGIN
                  "Constituency Name":=Constituency.Description;
                END;
            end;
        }
        field(6;"Constituency Name";Text[100])
        {
            
            Editable = false;
        }
        field(7;"Allocation Percentage(%)";Decimal)
        {
            

            trigger OnValidate()
            var
                TownAllocation: Decimal;
                RegionAllocation: Decimal;
                RoadWorkCeilingsLine: Record "RoadWorks Ceilings Line";
                RoadWorkCeilingsDetailedLine: Record "RoadWorks Ceiling DetailedLine";
            begin
                RoadWorksBudgetCeilings.RESET();
                RoadWorksBudgetCeilings.SETRANGE("Document No","Document No");
                IF RoadWorksBudgetCeilings.FINDSET THEN BEGIN
                  IF RoadWorksBudgetCeilings."Constituency Allocation Method"=RoadWorksBudgetCeilings."Constituency Allocation Method"::Equal THEN BEGIN
                RoadWorksCeilingsLine.RESET;
                RoadWorksCeilingsLine.SETRANGE("Document No","Document No");
                RoadWorksCeilingsLine.SETRANGE("Line No","Line No");
                IF RoadWorksCeilingsLine.FINDSET THEN BEGIN
                  RoadWorksCeilingsLine.CALCFIELDS("No of Constituencies");
                  IF RoadWorksCeilingsLine."No of Constituencies" >0 THEN
                  "Town Allocation(KES)":=RoadWorksCeilingsLine."Allocation Amount (KES)"/RoadWorksCeilingsLine."No of Constituencies";
                  END;
                  END ELSE
                  IF RoadWorksBudgetCeilings."Constituency Allocation Method"=RoadWorksBudgetCeilings."Constituency Allocation Method"::Varied THEN BEGIN
                    RoadWorksCeilingsLine.RESET;
                    RoadWorksCeilingsLine.SETRANGE("Document No","Document No");
                    RoadWorksCeilingsLine.SETRANGE("Line No","Line No");
                    IF RoadWorksCeilingsLine.FINDSET THEN BEGIN
                      "Town Allocation(KES)":="Allocation Percentage(%)"/100*"Regional Allocated Amount";
                    END;
                    END;
                    END;

                //Update Constituency Remaining Amount
                RoadWorksCeilingsLine.RESET;
                RoadWorksCeilingsLine.SETRANGE(RoadWorksCeilingsLine."Document No","Document No");
                RoadWorksCeilingsLine.SETRANGE(RoadWorksCeilingsLine."Line No","Line No");
                IF RoadWorksCeilingsLine.FINDSET THEN BEGIN
                  RoadWorksCeilingsLine."Allocation Remaining Amount":="Remaining Amount";
                  RoadWorksCeilingsLine.MODIFY(TRUE);
                END;
                TownAllocation := 0;
                RegionAllocation := 0;
                RoadWorkCeilingsLine.Reset();
                RoadWorkCeilingsLine.SetRange("Document No", Rec."Document No");
                RoadWorkCeilingsLine.SetRange("Region Code", Rec."Region Code");
                if RoadWorkCeilingsLine.FindFirst() then begin
                    RegionAllocation := RoadWorkCeilingsLine."Allocation Amount (KES)";
                end;

                Validate("Town Allocation(KES)", ("Allocation Percentage(%)" / 100) * RegionAllocation);
            end;
        }
        field(8;"Town Allocation(KES)";Decimal)
        {
            trigger OnValidate()
            var
                TownAllocation: Decimal;
                RegionAllocation: Decimal;
                RoadWorkCeilingsLine: Record "RoadWorks Ceilings Line";
                RoadWorkCeilingsDetailedLine: Record "RoadWorks Ceiling DetailedLine";
            begin
                TownAllocation := 0;
                RegionAllocation := 0;
                RoadWorkCeilingsLine.Reset();
                RoadWorkCeilingsLine.SetRange("Document No", Rec."Document No");
                RoadWorkCeilingsLine.SetRange("Region Code", Rec."Region Code");
                if RoadWorkCeilingsLine.FindFirst() then begin
                    RegionAllocation := RoadWorkCeilingsLine."Allocation Amount (KES)";
                end;
                RoadWorkCeilingsDetailedLine.Reset();
                RoadWorkCeilingsDetailedLine.SetRange("Document No", Rec."Document No");
                RoadWorkCeilingsDetailedLine.SetRange("Region Code", Rec."Region Code");
                RoadWorkCeilingsDetailedLine.SetFilter(Town, '<>%1', Rec.Town);
                if RoadWorkCeilingsDetailedLine.FindSet() then begin
                    repeat
                        TownAllocation += RoadWorkCeilingsDetailedLine."Town Allocation(KES)";
                    until RoadWorkCeilingsDetailedLine.Next() = 0;
                end;
                TownAllocation := TownAllocation + Rec."Town Allocation(KES)";
                "Allocation Percentage(%)" := ("Town Allocation(KES)" / RegionAllocation) * 100;
                if TownAllocation > RegionAllocation then
                    error('Towns allocation %1 cannot exceed the regions allocation %2', TownAllocation, RegionAllocation)
            end;
        }
        field(9;"Financial Year";Code[20])
        {
            
        }
        field(10;"Funding Source Code";Code[20])
        {
            
        }
        field(11;"Funding Source Type";Option)
        {
            
            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;
        }
        field(12;"Allocation to Regional Const";Boolean)
        {
            
        }
        field(13;"Regional Allocated Amount";Decimal)
        {
            
            Editable = false;
        }
        field(14;"Remaining Amount";Decimal)
        {
            
            Editable = false;
        }
        field(15;"Line Allocated Amount";Decimal)
        {
            
            Editable = false;
        }
        field(16; Town; Code[20])
        {
            TableRelation =Towns.Code where("Region Code"=field("Region Code"));
        }
    }

    keys
    {
        key(Key1; "Document No", "Region Code", Town)//"Line No","Entry No",Town)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        RoadWorksCeilingsLine.RESET;
        RoadWorksCeilingsLine.SETRANGE(RoadWorksCeilingsLine."Document No","Document No");
        RoadWorksCeilingsLine.SETRANGE(RoadWorksCeilingsLine."Line No","Line No");
        IF RoadWorksCeilingsLine.FindFirst() THEN BEGIN
          "Region Code":=RoadWorksCeilingsLine."Region Code";
          "Funding Source Code":=RoadWorksCeilingsLine."Funding Source Code";
          "Funding Source Type":=RoadWorksCeilingsLine."Funding Source Type";
          "Allocation to Regional Const":=RoadWorksCeilingsLine."Allocation to Regional Const";
          "Regional Allocated Amount":=RoadWorksCeilingsLine."Allocation Amount (KES)";
          "Remaining Amount":=RoadWorksCeilingsLine."Allocation Remaining Amount";
          "Financial Year":=RoadWorksCeilingsLine."Financial Year";
          END;
    end;

    var
        RoadWorksCeilingsLine: Record "RoadWorks Ceilings Line";
        Constituency: Record Constituency;
        CeilingDetailedLine: Record "RoadWorks Ceiling DetailedLine";
        RoadWorksBudgetCeilings: Record "Road Works Budget Ceilings";
}

