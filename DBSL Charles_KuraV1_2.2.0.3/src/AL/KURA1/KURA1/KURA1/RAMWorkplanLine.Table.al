
Table 92014 "RAM Workplan Line"
{
    Caption = 'RAM Workplan Line';
    DrillDownPageID = "RAM Workplan Lines";
    LookupPageID = "RAM Workplan Lines";
    fields
    {
        field(1; "Line No"; Integer)
        {
            // AutoIncrement = true;

            Editable = false;
        }
        field(2; "Document No"; Code[50])
        {

            Editable = false;
        }
        field(3; "Global Dimension 2 Code"; Code[40])
        {
            CaptionClass = '1,1,2';

            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(2),
                                                          Blocked = FILTER(false));
        }
        field(4; "Global Dimension 2 Code (2)"; Code[40])
        {

        }
        field(5; "Project Description"; Text[300])
        {

        }
        field(6; "BoQ Template"; Code[30])
        {

            TableRelation = "Purchase Requisition Template".Code WHERE("Template Type" = FILTER(BoQ));
            trigger OnValidate()
            var
                WorkPlansSummary: Record "WorkPlan Summary of Bills";
                BOQTempLine: Record "Requisition Template Line";
                BOQTemplateCode: Record "BoQ Template Bill Code";
                WorkPlanBillItems: Record "Work Plan Bill Item";
                BoQTemplate: Record "Purchase Requisition Template";
                TarrifCodes: Record "Tariff Codes1";
            begin
                if xRec."BoQ Template" = Rec."BoQ Template" then begin
                    exit;
                end;
                BoQTemplate.Reset();
                BoQTemplate.SetRange(Code, Rec."BoQ Template");
                if BoQTemplate.FindFirst() then begin
                    Rec."VoP Rate(%)" := BoQTemplate."Variation of Price Rate(%)";
                    Rec."VoP Amount (KES)" := BoQTemplate."Variation of Price Amount";
                    Rec."VAT Amount" := BoQTemplate."VAT Amount";
                    Rec."VAT Prod Posting Group" := BoQTemplate."VAT Prod. Posting Group";
                    Rec."Estimated Project Cost" := BoQTemplate."Total Estimated Bid Sum 1";
                    Rec."Contingency Rate (%)" := BoQTemplate."Contingency Rate(%)";
                    Rec."Contingency Amount (KES)" := BoQTemplate."Contingency Amount";
                    if Rec."VAT Prod Posting Group" <> '' then begin
                        if TarrifCodes.Get("VAT Prod Posting Group") then begin
                            Rec."Total Incl VAT" :=((TarrifCodes.Percentage/100) * Rec."Estimated Project Cost")+Rec."Estimated Project Cost";
                        end;
                    end else
                    Rec."Total Incl VAT" := Rec."Estimated Project Cost";
                end;
                WorkPlansSummary.Reset();
                WorkPlansSummary.SetRange("Workplan Type", Rec."Workplan Type");
                WorkPlansSummary.SetRange("Workplan No", Rec."Document No");
                WorkPlansSummary.SetRange("Line No", Rec."Line No");
                WorkPlansSummary.SetRange("Funding Source Code", Rec."Global Dimension 2 Code");
                if WorkPlansSummary.FindSet() then begin
                    WorkPlansSummary.DeleteAll();
                end;
                WorkPlanBillItems.Reset();
                WorkPlanBillItems.SetRange("Workplan Type", Rec."Workplan Type");
                WorkPlanBillItems.SetRange("Workplan No", Rec."Document No");
                WorkPlanBillItems.SetRange("Line No", Rec."Line No");
                if WorkPlanBillItems.FindSet() then begin
                    WorkPlanBillItems.DeleteAll();
                end;
                BOQTemplateCode.Reset();
                BOQTemplateCode.SetRange("BoQ Template Code", Rec."BoQ Template");
                if BOQTemplateCode.FindSet() then begin
                    repeat
                        WorkPlansSummary.Init();
                        WorkPlansSummary."Workplan Type" := Rec."Workplan Type";
                        WorkPlansSummary."Workplan No" := Rec."Document No";
                        WorkPlansSummary."Line No" := Rec."Line No";
                        WorkPlansSummary."Funding Source Code" := Rec."Global Dimension 2 Code";
                        WorkPlansSummary.Validate("BoQ Template Code", Rec."BoQ Template");
                        WorkPlansSummary."Begin-Total Job Task No." := BOQTemplateCode."Begin-Total Job Task No.";
                        WorkPlansSummary."Bill Item Category Code" := BOQTemplateCode."Bill Item Category Code";
                        WorkPlansSummary.Description := BOQTemplateCode.Description;
                        // WorkPlansSummary."Funding Source Type" := BOQTempLine.;
                        // WorkPlansSummary."Funding Source Code" := BOQTemplateCode.;
                        // WorkPlansSummary."Total Amount" := BOQTempLine.Amount;
                        WorkPlansSummary.Insert(true);
                    until BOQTemplateCode.Next() = 0;
                end;
                BOQTempLine.Reset();
                BOQTempLine.SetRange("Requisition Template ID", "BoQ Template");
                if BOQTempLine.FindSet() then begin
                    repeat
                        WorkPlanBillItems.Init();
                        WorkPlanBillItems."Line No" := Rec."Line No";
                        WorkPlanBillItems."Workplan No" := Rec."Document No";
                        WorkPlanBillItems.Validate("BoQ Template Code", Rec."BoQ Template");
                        WorkPlanBillItems."Bill Item Category Code" := BOQTempLine."Item Category Code";
                        WorkPlanBillItems."Activity Code" := BOQTempLine."No.";
                        WorkPlanBillItems."Default Job Task No." := BOQTempLine."Default Job Task No.";
                        WorkPlanBillItems.Description := BOQTempLine.Description;
                        WorkPlanBillItems."Workplan Type" := Rec."Workplan Type";
                        WorkPlanBillItems."Funding Source Code" := Rec."Global Dimension 2 Code";
                        WorkPlanBillItems."Funding Source Type" := Rec."Funding Source Type";
                        WorkPlanBillItems."Shortcut Dimension 1 Code" := BOQTempLine."Shortcut Dimension 1 Code";
                        WorkPlanBillItems."Shortcut Dimension 2 Code" := BOQTempLine."Shortcut Dimension 2 Code";
                        // WorkPlanBillItems."Line Amount Excl. VAT" :=BOQTempLine."Unit Amount Excl. VAT"*BOQTempLine.Quantity;
                        WorkPlanBillItems.Validate("Line Amount Incl. VAT", BOQTempLine.Amount);
                        WorkPlanBillItems.Insert(true);
                    until BOQTempLine.Next() = 0;
                    end;
            end;
        }
        field(7; "Estimated Project Cost"; Decimal)
        {
            // CalcFormula = Sum("Work Plan Bill Item"."Line Amount Incl. VAT" WHERE("Workplan Type" = FIELD("Workplan Type"),
            //                                                                        "Workplan No" = FIELD("Document No"),
            //                                                                        "BoQ Template Code" = FIELD("BoQ Template"),
            //                                                                        "Line No" = FIELD("Line No")));
            Editable = false;
            CalcFormula = sum("Work Plan Bill Item"."Line Amount Excl. VAT" where("Workplan Type"=field("Workplan Type"),"Workplan No"=field("Document No"),"Line No"=field("Line No")));
            FieldClass = FlowField;
        }
        field(8; "Region Code"; Code[50])
        {

            Editable = false;
        }
        field(9; "Region Name"; Text[300])
        {

            Editable = false;
        }
        field(10; "Workplan Type"; Enum "WorkPlan Type")
        {

            Editable = false;
            // OptionCaption = 'Constituency,Regional,Consolidated,Consolidated East,Consolidated West';
            // OptionMembers = Constituency,Regional,Consolidated,"Consolidated East","Consolidated West";
        }
        field(11; "Constituency Code"; Code[50])
        {

            TableRelation = Constituency.Code WHERE("Region Code" = FIELD("Region Code"));

            trigger OnValidate()
            begin
                Constituency.RESET;
                Constituency.SETRANGE(Constituency.Code, "Constituency Code");
                IF Constituency.FINDSET THEN
                    "Constituency Name" := Constituency.Description;

                /*RAMBudgetCeilingDetails.RESET;
                RAMBudgetCeilingDetails.SETRANGE(RAMBudgetCeilingDetails."Document No","Document No");
                RAMBudgetCeilingDetails.SETRANGE(RAMBudgetCeilingDetails."Global Dimension 2 Code","Global Dimension 2 Code");
                RAMBudgetCeilingDetails.SETRANGE(RAMBudgetCeilingDetails."Constituency Code","Constituency Code");
                IF RAMBudgetCeilingDetails.FINDSET THEN BEGIN
                 //MESSAGE('Budget Limit for %1 for %2 constituency is %3',"Global Dimension 2 Code","Constituency Name",RAMBudgetCeilingDetails."Allocation Amount");
                  "Constituency Limit":=RAMBudgetCeilingDetails."Allocation Amount"
                END
                ELSE BEGIN
                 ERROR('Update Budget Amount for Funding Source %1 for %2 Constituency',"Global Dimension 2 Code","Constituency Name");
                END;*/

            end;
        }
        field(12; "Constituency Name"; Text[300])
        {

            Editable = false;
        }
        field(13; "Constituency Limit"; Decimal)
        {

            Editable = false;
        }
        field(14; "Workplanned Length(KM)"; Decimal)
        {
            CalcFormula = lookup("Road Inventory"."Gazetted Road Length (KMs)" where("Road Code"=field("Road Code")));
            // CalcFormula = Sum("Workplan Project Road Link"."Workplanned Length(KM)" WHERE("Workplan Type" = FIELD("Workplan Type"),
            //                                                                                "Workplan No" = FIELD("Document No"),
            //                                                                                "Line No" = FIELD("Line No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Regional WorkPlan No"; Code[50])
        {

        }
        field(16; "Regional Ref No"; Code[100])
        {

        }
        field(17; "Contingency Rate (%)"; Decimal)
        {

           // Editable = false;
        }
        field(18; "Contingency Amount (KES)"; Decimal)
        {

            //Editable = false;
        }
        field(19; "VoP Rate(%)"; Decimal)
        {

            //Editable = false;
        }
        field(20; "VoP Amount (KES)"; Decimal)
        {

           // Editable = false;
        }
        field(21; "VAT Prod Posting Group"; Code[20])
        {

            Editable = false;
        }
        field(22; "VAT Rate"; Decimal)
        {

            Editable = false;
        }
        field(23; "VAT Amount"; Decimal)
        {

            Editable = false;
        }
        field(24; "Total Incl VAT"; Decimal)
        {
            FieldClass =  FlowField;
            CalcFormula = sum("Work Plan Bill Item"."Line Amount Incl. VAT" where("Workplan Type"=field("Workplan Type"),"Workplan No"=field("Document No"),"Line No"=field("Line No")));
            Editable = false;
        }
        field(25; "Funding Source Type"; Option)
        {

            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;
        }
        field(26; "Constituency Workplan No."; Code[50])
        {

        }
        field(27; "West Workplan No."; Code[50])
        {

        }
        field(28; "East Workplan No."; Code[50])
        {

        }
        field(29; "Constituency Ref No."; Code[100])
        {

        }
        field(30; "West Ref No."; Code[100])
        {

        }
        field(31; "East Ref No."; Code[100])
        {

        }
        field(32; "Consolidated Workplan No."; Code[100])
        {

        }
        field(33; "Consolidated Ref No."; Code[100])
        {

        }
        field(34; Revised; Boolean)
        {

        }
        field(35; "Revision No."; Code[50])
        {

        }
        field(36; "Consultancy Project Type"; Option)
        {

            OptionCaption = ' ,ESIA Study,Topographic Survey,Traffic Census,Road Safety Audit,Design Works,Environmental Audits,Geotechnical Investigations';
            OptionMembers = " ","ESIA Study","Topographic Survey","Traffic Census","Road Safety Audit","Design Works","Environmental Audits","Geotechnical Investigations";
        }
        field(37; "Works Type"; Code[20])
        {

            TableRelation = "Works Category".Code WHERE("Road Project Category" = FILTER(Maintenance));

            trigger OnValidate()
            begin
                WorksCategory.RESET;
                WorksCategory.SETRANGE(WorksCategory.Code, "Works Type");
                IF WorksCategory.FindFirst() THEN BEGIN
                    "Works Type Description" := WorksCategory.Description;
                END;
            end;
        }
        field(38; "Works Type Description"; Code[100])
        {

            Editable = false;
        }
        field(39; Town; Code[10])
        {
            TableRelation = "Responsibility Center".Code WHERE("Operating Unit Type" = CONST("Towns"), "Location Code" = FIELD("Region Code"));
        }
        field(40; Scheduled; Boolean)
        {
            
        }
        field(41; "Road Code"; Code[20])
        {
           TableRelation = "Road Inventory" where("Road Category" =const(" Urban Road"),Town=field(Town));
           trigger OnValidate()
            var
                RAMworkplanHeader: Record "RAM Workplan Header";
           begin
                RAMworkplanHeader.Reset();
                RAMworkplanHeader.SetRange("Document No", Rec."Document No");
                if RAMworkplanHeader.FindFirst() then begin
                    if RAMworkplanHeader."Budget Ceiling Amount" = 0 then
                    error('Budget Ceiling of region %1 must have an amount more than 0',RAMworkplanHeader."Region Name");
                end;
           end;
        }
        field(42; "Link Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Road Inventory"."Link Name" where("Road Code"=field("Road Code")));
        }
        field(43; RICS; Code[20])
        {
            TableRelation = "RICS Lines"."Document No." where("Road Code"=field("Road Code"));
            trigger OnValidate()
            var
            RICSLine: Record "RICS Lines";
            begin
                RICSLine.Reset();
                RICSLine.SetRange("Document No.",Rec.RICS);
                if RICSLine.FindFirst() then begin
                    Rec."RICS Intervention" := RICSLine."Proposed Intervention";
                end;
            end;
        }
        field(44; "RICS Intervention"; Code[60])
        {

        }
        field(45; Package; Code[20])
        {
            TableRelation = "Road Packages" where("Global Dimension 1 Code" = field("Region Code"), "Global Dimension 2 Code" = field("Global Dimension 2 Code"));//,"Shortcut Dimension 5 Code"=field(Town));
            trigger OnValidate()
            var
                RoadPackages: Record "Road Packages";
            begin
                if RoadPackages.Get(Package) then
                    Validate("Works Type", RoadPackages."Works Type");
            end;
        }
    }

    keys
    {
        key(Key1; "Document No", "Workplan Type", "Line No")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document No", "Line No", "Project Description", "Global Dimension 2 Code")
        {
        }
        fieldgroup(Brick; "Document No", "Line No", "Project Description", "Global Dimension 2 Code")
        {
        }
    }

    trigger OnInsert()
    var
        RAMWorkplanLine: Record "RAM Workplan Line";
    begin
        RAMWorkplanLine.Reset();
        RAMWorkplanLine.SetRange("Document No", Rec."Document No");
        RAMWorkplanLine.SetRange("Workplan Type", Rec."Workplan Type");
        if RAMWorkplanLine.FindLast() then
            Rec."Line No" := RAMWorkplanLine."Line No" + 1
        else
            RAMWorkplanLine."Line No" := 1;
        /// IF "Workplan Type" = "Workplan Type"::Constituency THEN BEGIN
        RAMWorkplanHeader.RESET;
        RAMWorkplanHeader.SETRANGE("Document No", Rec."Document No");
        RAMWorkplanHeader.SETRANGE("Workplan Type", Rec."Workplan Type");
        IF RAMWorkplanHeader.FindFirst() THEN BEGIN
                "Constituency Code" := RAMWorkplanHeader."Constituency Code";
                "Constituency Name" := RAMWorkplanHeader."Constituency Name";
                "Region Code" := RAMWorkplanHeader."Global Dimension 1 Code";
                "Region Name" := RAMWorkplanHeader."Region Name";
                "Global Dimension 2 Code" := RAMWorkplanHeader."Global Dimension 2 Code";
                "Funding Source Type" := RAMWorkplanHeader."Funding Source Type";
            if RAMWorkplanHeader."Workplan Type" = RAMWorkplanHeader."Workplan Type"::Town then
                Town :=RAMWorkplanHeader."Shortcut Dimension 5 Code";
            END;
        // END;
    end;

    var
        RAMWorkplanHeader: Record "RAM Workplan Header";
        Constituency: Record 72011;
        RoadGLbudgetSetup: Record 72195;
        RAMBudgetCeilingDetails: Record 72013;
        PurchaseRequisitionTemplate: Record 70139;
        VATProductPostingGroup: Record "VAT Product Posting Group";
        WorksCategory: Record "Works Category";
}
