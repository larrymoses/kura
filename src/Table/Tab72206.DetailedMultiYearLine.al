#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72206 "Detailed Multi_Year Line"
{
    DrillDownPageID = "Multi Works Line";
    LookupPageID = "Multi Works Line";

    fields
    {
        field(1; "Road Work Program ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Package No."; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Entry"."Entry No." where("Budget Type" = filter(Approved),
                                                                  "KeRRA Budget Code" = field("KeRRA Budget Code"));

            trigger OnValidate()
            begin
                GLBudgetEntry.Reset;
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Name", "Financial Year Code");
                GLBudgetEntry.SetRange(GLBudgetEntry."Entry No.", "Package No.");
                GLBudgetEntry.SetRange(GLBudgetEntry."Budget Type", GLBudgetEntry."budget type"::Approved);
                if GLBudgetEntry.FindSet then begin
                    "Package Name" := GLBudgetEntry.Description;
                    "Current Budget Amount" := GLBudgetEntry.Amount;
                end;
                Validate("Revision Type");
            end;
        }
        field(5; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            //  TableRelation = "Road Section"."Road Section No." where ("Road Code"=field("Road Code"));

            //     trigger OnValidate()
            //     begin
            //         RoadSection.Reset;
            //         RoadSection.SetRange(RoadSection."Road Code","Road Code");
            //         RoadSection.SetFilter(RoadSection."Road Section No.",'%1',"Road Section No.");
            //         if RoadSection.FindSet then begin
            //           "Section Name":=RoadSection."Section Name";
            //            "Start Chainage":=RoadSection."Start Chainage(KM)";
            //           "End Chainage":=RoadSection."End Chainage(KM)";
            //           "Total Road Section Length":=RoadSection."Total Road Length (KMs)";
            //           "Workplanned Length (Km)":=RoadSection."Total Road Length (KMs)";
            //           "Constituency ID":=RoadSection."Primary Constituency ID";
            //           "Region ID":=RoadSection."Primary Region ID";
            //           "County ID":=RoadSection."Primary County ID";
            //           "Pavement Surface Type":=RoadSection."Section Surface Type";
            //           end;
            //     end;
        }
        field(6; "Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Year Codes"."Year Code";

            trigger OnValidate()
            begin
                FundingYearCodes.Reset;
                FundingYearCodes.SetRange("Year Code", "Year Code");
                if FundingYearCodes.FindSet then
                    "Financial Year Code" := FundingYearCodes."Financial Year Code";

                //VALIDATE("Revision Type");
            end;
        }
        field(7; "Funding Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Package Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Studies and Surveys,Construction Works,Maintenance Works';
            OptionMembers = ,"Studies and Surveys","Construction Works","Maintenance Works";
        }
        field(11; "Road Works Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code where("Road Project Category" = field("Road Project Category"));

            trigger OnValidate()
            begin
                WorksCategory.Reset;
                WorksCategory.SetRange(Code, "Road Works Category");
                if WorksCategory.FindSet then begin
                    "Road Project Category" := WorksCategory."Road Project Category";
                    "BoQ Template Code" := WorksCategory."Default BoQ Template Code";
                end;
            end;
        }
        field(12; "Pavement Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pavement Surface Type".Code;
        }
        field(13; "Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Funding Source".Code WHERE (Blocked=CONST(No))';
            TableRelation = "Funding Source".Code where(Blocked = const(false));

            trigger OnValidate()
            begin
                FundingSource.Reset;
                FundingSource.SetRange(Code, "Funding Source ID");
                if FundingSource.FindSet then begin
                    "Funding Agency ID" := FundingSource."Funding Agency";
                end;
            end;
        }
        field(14; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
            // MaxValue = 999999999999;
            MinValue = 0;
        }
        field(15; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
            //  MaxValue = 99999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                /*IF "End Chainage"-"Start Chainage"<> 0 THEN
                "Workplanned Length (Km)":="End Chainage"-"Start Chainage";
                
                RoadSection.RESET;
                RoadSection.SETRANGE(RoadSection."Road Code","Road Code");
                RoadSection.SETFILTER(RoadSection."Road Section No.",'%1',"Road Section No.");
                IF RoadSection.FINDSET THEN BEGIN
                  IF "End Chainage" > RoadSection."Total Road Length (KMs)"  THEN
                    ERROR('The end chainage cannot be more than the section length')
                  END;
                  */

            end;
        }
        field(16; "Workplanned Length (Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
        }
        field(17; "Annual Funding Limit"; Decimal)
        {
            Caption = 'Annual Funding Limit';
            Description = 'Sum("G/L Budget Entry".Amount WHERE (Budget Name=FIELD(Financial Year Code),KeRRA Budget Code=FIELD(KeRRA Budget Code),Budget Type=FILTER(Approved)))';
            Editable = false;
            FieldClass = Normal;
        }
        field(18; "Funding Agency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Funding Agency".Code';
            TableRelation = Customer."No.";
        }
        field(19; "BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code where("Template Type" = filter(BoQ));
        }
        field(20; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(21; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(22; "Road Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID";
        }
        field(23; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code where(Blocked = filter(false));
        }
        field(24; "County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code where(Blocked = filter(false));
        }
        field(25; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region),
                                                                Blocked = const(false));
        }
        field(26; "Total Road Section Length"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Total Road Section Length';
        }
        field(27; "Financial Year Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;

            trigger OnValidate()
            begin
                Validate("Revision Type");
            end;
        }
        field(28; "Actual Amount Allocated"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Actual Amount Spent"; Decimal)
        {
            Description = 'Sum("PV Lines".Amount WHERE (Project No=FIELD(Package No.)))';
            Editable = false;
            FieldClass = Normal;
        }
        field(30; "Financial Budget Name"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Annual Projection"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Amount Certified"; Decimal)
        {
            Description = 'Sum("Purch. Inv. Line".Amount WHERE (Job No.=FIELD(Package No.)))';
            Editable = false;
            FieldClass = Normal;
        }
        field(33; "KeRRA Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(34; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Supplementary Budget"; Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where("Budget Type 1" = filter("Supplementary 1" | "Supplementary 2" | "Supplimentary 3"),
                                                               "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                                               "Original Budget" = field("Financial Year Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(36; "Revised Budget"; Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where("Budget Name" = field("Financial Year Code"),
                                                               "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                                               "Budget Type" = filter(Revised)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(37; "Current Budget Amount"; Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where("Budget Name" = field("Financial Year Code"),
                                                               "KeRRA Budget Code" = field("KeRRA Budget Code"),
                                                               "Budget Type" = filter(Approved)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(38; "Approval Status"; Option)
        {
            CalcFormula = lookup("Road Work Program"."Approval Status" where(Code = field("Road Work Program ID")));
            Editable = false;
            FieldClass = FlowField;

            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(39; "Revision Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Original,Revision1,Revision2,Revision3,Revision4,Revision5';
            OptionMembers = " ",Original,Revision1,Revision2,Revision3,Revision4,Revision5;

            trigger OnValidate()
            begin

                if "Revision Type" = "revision type"::Revision1 then begin
                    DetailedMulti_YearLine.Reset;
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Road Work Program ID", "Road Work Program ID");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Year Code", "Year Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."KeRRA Budget Code", "KeRRA Budget Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Revision Type", DetailedMulti_YearLine."revision type"::Original);
                    if DetailedMulti_YearLine.FindSet then begin
                        DetailedMulti_YearLine.Closed := true;
                        DetailedMulti_YearLine.Modify(true);
                    end;
                end;

                if "Revision Type" = "revision type"::Revision2 then begin
                    DetailedMulti_YearLine.Reset;
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Road Work Program ID", "Road Work Program ID");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Year Code", "Year Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."KeRRA Budget Code", "KeRRA Budget Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Revision Type", DetailedMulti_YearLine."revision type"::Revision1);
                    if DetailedMulti_YearLine.FindSet then begin
                        DetailedMulti_YearLine.Closed := true;
                        DetailedMulti_YearLine.Modify(true);
                    end;
                end;

                if "Revision Type" = "revision type"::Revision3 then begin
                    DetailedMulti_YearLine.Reset;
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Road Work Program ID", "Road Work Program ID");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Year Code", "Year Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."KeRRA Budget Code", "KeRRA Budget Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Revision Type", DetailedMulti_YearLine."revision type"::Revision2);
                    if DetailedMulti_YearLine.FindSet then begin
                        DetailedMulti_YearLine.Closed := true;
                        DetailedMulti_YearLine.Modify(true);
                    end;
                end;

                if "Revision Type" = "revision type"::Revision4 then begin
                    DetailedMulti_YearLine.Reset;
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Road Work Program ID", "Road Work Program ID");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Year Code", "Year Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."KeRRA Budget Code", "KeRRA Budget Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Revision Type", DetailedMulti_YearLine."revision type"::Revision3);
                    if DetailedMulti_YearLine.FindSet then begin
                        DetailedMulti_YearLine.Closed := true;
                        DetailedMulti_YearLine.Modify(true);
                    end;
                end;

                if "Revision Type" = "revision type"::Revision5 then begin
                    DetailedMulti_YearLine.Reset;
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Road Work Program ID", "Road Work Program ID");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Year Code", "Year Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."KeRRA Budget Code", "KeRRA Budget Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Revision Type", DetailedMulti_YearLine."revision type"::Revision4);
                    if DetailedMulti_YearLine.FindSet then begin
                        DetailedMulti_YearLine.Closed := true;
                        DetailedMulti_YearLine.Modify(true);
                    end;
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Road Work Program ID", "Year Code", "KeRRA Budget Code", "Revision Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //     "Directorate ID":=RoadWorkProgram."Directorate Code";
        //     "Department ID":=RoadWorkProgram."Department Code";
        //     "Region ID":=RoadWorkProgram."Region ID";

        //     RoadWorkProgram.Reset;
        //     RoadWorkProgram.SetRange(RoadWorkProgram.Code,"Road Work Program ID");
        //     RoadWorkProgram.SetRange(RoadWorkProgram."Document Type",RoadWorkProgram."document type"::"Multi-Year Programs");
        //     if RoadWorkProgram.FindSet then begin

        //       "Road Project Category":=RoadWorkProgram."Road Project Category";
        //       "Road Project Category":=RoadWorkProgram."Road Project Category";
        //       end;

        //     RoadInventory.Reset;
        //     RoadInventory.SetRange(RoadInventory."Road Code","Road Code");
        //     if RoadInventory.FindSet then
        //       "Road Class":=RoadInventory."Road Class ID";

        //     RoadInventory.Reset;
        //     RoadInventory.SetRange(RoadInventory."Road Code","Road Code");
        //     if RoadInventory.FindSet then begin
        //       "Workplanned Length (Km)":=RoadInventory."Gazetted Road Length (KMs)";
        //       "Region ID":=RoadInventory."Primary Region ID";
        //       "County ID":=RoadInventory."Primary County ID";
        //        end;
        //     Multi_YearWork.Reset;
        //     Multi_YearWork.SetRange(Multi_YearWork."Road Work Program ID","Road Work Program ID");
        //     if Multi_YearWork.FindSet then
        //       "Funding Source ID":=Multi_YearWork."Global Dimension Code 2";
    end;

    var
        // RoadSection: Record "Road Section";
        //RoadWorkProgram: Record "Road Work Program";
        Constituency: Record Constituency;
        WorksCategory: Record "Works Category";
        FundingSource: Record "Funding Source";
        VATProductPostingGroup: Record "VAT Product Posting Group";
        VATPostingSetup: Record "VAT Posting Setup";
        NewRoadWorkProgramPackage: Record "New Road Work Program Package";
        //RoadInventory: Record "Road Inventory";
        FinancialYearCode: Record "Financial Year Code";
        FundingYearCodes: Record "Funding Year Codes";
        GLBudgetEntry: Record "G/L Budget Entry";
        DetailedMulti_YearLine: Record "Detailed Multi_Year Line";
        Multi_YearWork: Record "Multi_Year Work";
}

