/// <summary>
/// Table WorkPlan Summary of Bills (ID 99602).
/// </summary>
table 99602 "WorkPlan Summary of Bills"
{

    fields
    {
        field(1; "Workplan Type"; Enum "WorkPlan Type")
        {
            // OptionCaption = 'Constituency,Regional,Consolidated,Consolidated East,Consolidated West';
            // OptionMembers = Constituency,Regional,Consolidated,"Consolidated East","Consolidated West";
        }
        field(2; "Workplan No"; Code[40])
        {

        }
        field(3; "BoQ Template Code"; Code[20])
        {
            TableRelation = "BoQ Template Bill Code"."BoQ Template Code";
            ValidateTableRelation=false;
        }
        field(4; "Bill Item Category Code"; Code[20])
        {

            TableRelation = "Item Category".Code WHERE(Blocked = const(false),
                                                        "Bill Item Group" = const(true));
        }
        field(5; Description; Text[250])
        {

        }
        field(6; "Begin-Total Job Task No."; Code[20])
        {

        }
        field(7; "End-Total Job Task No."; Code[20])
        {

        }
        field(8; "No. of Bill Activities"; Integer)
        {
            CalcFormula = Count("Work Plan Bill Item" WHERE("Workplan Type" = FIELD("Workplan Type"),
                                                             "Workplan No" = FIELD("Workplan No"),
                                                             "Line No" = FIELD("Line No"),
                                                             "Bill Item Category Code" = FIELD("Bill Item Category Code"),
                                                             "Funding Source Code" = FIELD("Funding Source Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Entry No"; Integer)
        {
            AutoIncrement = true;

        }
        field(10; "Total Amount"; Decimal)
        {
            CalcFormula = Sum("Work Plan Bill Item"."Line Amount Incl. VAT" WHERE("Workplan Type" = FIELD("Workplan Type"),
                                                                                   "Workplan No" = FIELD("Workplan No"),
                                                                                   "BoQ Template Code" = FIELD("BoQ Template Code"),
                                                                                   "Bill Item Category Code" = FIELD("Bill Item Category Code"),
                                                                                   "Funding Source Code" = FIELD("Funding Source Code"),
                                                                                   "Line No" = FIELD("Line No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Project No"; Code[40])
        {

        }
        field(12; "Line No"; Integer)
        {

        }
        field(13; "Funding Source Code"; Code[50])
        {

        }
        field(14; "Funding Source Type"; Option)
        {

            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;
        }
        field(15; "Constituency Code"; Code[20])
        {

            TableRelation = Constituency.Code WHERE("Region Code" = FIELD("Region Code"));
        }
        field(16; "Region Code"; Code[20])
        {

            TableRelation = "Responsibility Center".Code WHERE(Blocked = FILTER(false),
                                                                "Operating Unit Type" = FILTER(Region));
        }
        field(17; Revised; Boolean)
        {

        }
        field(18; "Revision No."; Code[50])
        {

        }
         
    }

    keys
    {
        key(Key1; "Workplan Type", "Workplan No", "Line No", "Entry No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    Var
        Workplanssummary: Record "WorkPlan Summary of Bills";
    begin
        WorkPlansSummary.Reset();
        WorkPlansSummary.SetRange("Workplan Type", Rec."Workplan Type");
        WorkPlansSummary.SetRange("Workplan No", Rec."Workplan No");
        WorkPlansSummary.SetRange("Line No", Rec."Line No");
        // WorkPlansSummary.SetRange("Funding Source Code", Rec."Funding Source Code");
        if WorkPlansSummary.Findlast() then
            Rec."Entry No" := WorkPlansSummary."Entry No" + 100;
        RAMWorkplanLine.RESET;
        RAMWorkplanLine.SETRANGE(RAMWorkplanLine."Document No", "Workplan No");
        // RAMWorkplanLine.SETRANGE(RAMWorkplanLine."Workplan Type", RAMWorkplanLine."Workplan Type"::Constituency);
        IF RAMWorkplanLine.FindFirst() THEN BEGIN
            "Region Code" := RAMWorkplanLine."Region Code";
            "Constituency Code" := RAMWorkplanLine."Constituency Code";
            "Funding Source Code" := RAMWorkplanLine."Global Dimension 2 Code";
            "Funding Source Type" := RAMWorkplanLine."Funding Source Type";

        END;

    end;

    var
        RAMWorkplanLine: Record "RAM Workplan Line";
        CurrExchRate: Record "Currency Exchange Rate";
}

