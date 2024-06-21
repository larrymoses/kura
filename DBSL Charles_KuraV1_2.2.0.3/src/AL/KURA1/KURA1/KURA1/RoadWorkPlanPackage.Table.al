#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72204 "Road WorkPlan Package"
{

    fields
    {
        field(1; "Road Work Program ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Budget Entry No"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // RoadWorkProgram.RESET;
                // RoadWorkProgram.SETRANGE(RoadWorkProgram.Code,"Road Work Program ID");
                // IF RoadWorkProgram.FINDSET THEN BEGIN
                // NewRoadWorkProgramPackage.RESET;
                // NewRoadWorkProgramPackage.SETRANGE("Road Work Program ID",RoadWorkProgram."Gloabal Budget Book ID");
                // NewRoadWorkProgramPackage.SETRANGE(NewRoadWorkProgramPackage."Package No.","Package No.");
                // IF NewRoadWorkProgramPackage.FINDSET THEN
                //  BEGIN
                // //  REPEAT
                //       INIT;
                //       "Road Work Program ID":=RoadWorkProgram.Code;
                //       "Package No.":=NewRoadWorkProgramPackage."Package No.";
                //       "Package Name":=NewRoadWorkProgramPackage."Package Name";
                //       "Road Code":=NewRoadWorkProgramPackage."Road Code";
                //       "Global Budget ID":="Global Budget ID";
                //       VALIDATE("Road Code");
                //       "Road Section No.":=NewRoadWorkProgramPackage."Road Section No.";
                //       VALIDATE("Road Section No.");
                //       "Entry No":=COUNT+100;
                //      "Section Name":=NewRoadWorkProgramPackage."Section Name";
                //      "Road Works Category":=NewRoadWorkProgramPackage."Road Works Category";
                //      "Road Project Category":=NewRoadWorkProgramPackage."Road Project Category";
                //      "Pavement Surface Type":=NewRoadWorkProgramPackage."Pavement Surface Type";
                //      "Funding Source ID":=NewRoadWorkProgramPackage."Funding Source ID";
                //      VALIDATE("Funding Source ID");
                //      "BoQ Template Code":=NewRoadWorkProgramPackage."BoQ Template Code";
                //      "Directorate ID":=NewRoadWorkProgramPackage."Directorate ID";
                //      "Department ID":=NewRoadWorkProgramPackage."Department ID";
                //      "Region ID":=NewRoadWorkProgramPackage."Region ID";
                //      "VAT Bus. Posting Group":=NewRoadWorkProgramPackage."VAT Bus. Posting Group";
                //      "VAT Prod. Posting Group":=NewRoadWorkProgramPackage."VAT Prod. Posting Group";
                //      "Budget (Cost) Excl. VAT":=NewRoadWorkProgramPackage."Budget (Cost) Excl. VAT";
                //      VALIDATE("Budget (Cost) Excl. VAT");
                //      "Total Budget Cost":=NewRoadWorkProgramPackage."Total Budget Cost";
                //      VALIDATE("Total Budget Cost");
                //      INSERT(TRUE);
                //      COMMIT;
                //  END;
                //  END;
            end;
        }
        field(3; "Package Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code" where(Blocked = const(FALSE));

            trigger OnValidate()
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange(RoadInventory."Road Code", "Road Code");
                if RoadInventory.FindSet then begin
                    "Total Road Section Length" := RoadInventory."Gazetted Road Length (KMs)";
                    "Workplanned Length (Km)" := RoadInventory."Gazetted Road Length (KMs)";
                    //"Region ID":=RoadInventory."Primary Region ID";
                    "County ID" := RoadInventory."Primary County ID";
                    "Road Class" := RoadInventory."Road Class ID";
                end;
            end;
        }
        field(5; "Road Section No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Section"."Road Section No." where("Road Code" = field("Road Code"));

            trigger OnValidate()
            begin
                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Code", "Road Code");
                RoadSection.SetFilter(RoadSection."Road Section No.", '%1', "Road Section No.");
                if RoadSection.FindSet then begin
                    "Section Name" := RoadSection."Section Name";
                    "Start Chainage" := RoadSection."Start Chainage(KM)";
                    "End Chainage" := RoadSection."End Chainage(KM)";
                    "Total Road Section Length" := RoadSection."Total Road Length (KMs)";
                    "Workplanned Length (Km)" := RoadSection."Total Road Length (KMs)";
                    "Constituency ID" := RoadSection."Primary Constituency ID";
                    //"Region ID":=RoadSection."Primary Region ID";
                    "County ID" := RoadSection."Primary County ID";
                    "Pavement Surface Type" := RoadSection."Section Surface Type";
                end;
            end;
        }
        field(6; "Section Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Road Works Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;// where("Road Project Category" = field("Road Project Category"));

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
        field(8; "Pavement Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pavement Surface Type".Code;
        }
        field(9; "Funding Source ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Funding Source".Code WHERE (Blocked=CONST(No))';
            TableRelation = "Funding Source".Code where(Blocked = const(FALSE));

            trigger OnValidate()
            begin
                FundingSource.Reset;
                FundingSource.SetRange(Code, "Funding Source ID");
                if FundingSource.FindSet then begin
                    "Funding Agency ID" := FundingSource."Funding Agency";
                end;
            end;
        }
        field(10; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
            //  MaxValue = 999999999999;
            MinValue = 0;
        }
        field(11; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
            //  MaxValue = 99999999999;
            MinValue = 0;

            trigger OnValidate()
            begin
                if "End Chainage" - "Start Chainage" <> 0 then
                    "Workplanned Length (Km)" := "End Chainage" - "Start Chainage";

                RoadSection.Reset;
                RoadSection.SetRange(RoadSection."Road Code", "Road Code");
                RoadSection.SetFilter(RoadSection."Road Section No.", '%1', "Road Section No.");
                if RoadSection.FindSet then begin
                    if "End Chainage" > RoadSection."Total Road Length (KMs)" then
                        Error('The end chainage cannot be more than the section length')
                end;
            end;
        }
        field(12; "Workplanned Length (Km)"; Decimal)
        {
            CalcFormula = sum("Project Road Link"."Workplanned Length(KM)" where("Global Budget Book Code" = field("Road Work Program ID"),
                                                                                  "KeRRA Budget Code" = field("KeRRA Budget Code")));
            DecimalPlaces = 3 : 3;
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Budget (Cost) Excl. VAT"; Decimal)
        {
            FieldClass = Normal;

            trigger OnValidate()
            begin
                VATPostingSetup.Reset;
                VATPostingSetup.SetRange(VATPostingSetup."VAT Bus. Posting Group", "VAT Bus. Posting Group");
                VATPostingSetup.SetRange(VATPostingSetup."VAT Prod. Posting Group", "VAT Prod. Posting Group");
                if VATPostingSetup.FindSet then begin
                    "Budget (VAT Amount)" := VATPostingSetup."VAT %" / 100 * "Budget (Cost) Excl. VAT";
                    "Budget (Cost) Incl. VAT" := ((100 + VATPostingSetup."VAT %") / 100 * "Budget (Cost) Excl. VAT");
                end;
            end;
        }
        field(14; "Budget (VAT Amount)"; Decimal)
        {
            FieldClass = Normal;
        }
        field(15; "Budget (Cost) Incl. VAT"; Decimal)
        {
            Editable = true;
            FieldClass = Normal;
        }
        field(16; "Funding Agency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Funding Agency".Code';
            TableRelation = Customer."No.";
        }
        field(17; "BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code where("Template Type" = filter(BoQ));

            trigger OnValidate()
            begin
                PurchaseRequisitionTemplate.Reset;
                PurchaseRequisitionTemplate.SetRange(PurchaseRequisitionTemplate.Code, "BoQ Template Code");
                if PurchaseRequisitionTemplate.FindSet then begin
                    "PBRM BoQ Template Code" := PurchaseRequisitionTemplate."PBRM BoQ";
                end;
            end;
        }
        field(18; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";

            trigger OnValidate()
            begin
                if "Road Project Category" = "road project category"::"Survey/Study" then begin
                    "Directorate ID" := 'DIR002'
                end else
                    if "Road Project Category" = "road project category"::"Road Construction" then begin
                        "Directorate ID" := 'DIR003'
                    end else
                        if "Road Project Category" = "road project category"::Maintenance then begin
                            "Directorate ID" := 'DIR004';
                        end;
            end;
        }
        field(19; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(20; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                "Direct Reports To" = field("Directorate ID"));
        }
        field(21; "Road Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID";
        }
        field(22; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code where(Blocked = filter(false));
        }
        field(23; "County ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code where(Blocked = filter(false));
        }
        field(24; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Region),
                                                                Blocked = const(false));
        }
        field(25; "Total Road Section Length"; Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Total Road Section Length';
        }
        field(26; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(27; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2),
                                                          Blocked = filter(false));
        }
        field(28; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Posted Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Planning Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Top-Down (New Works),Bottom-Up (Existing Works)';
            OptionMembers = " ","Top-Down (New Works)","Bottom-Up (Existing Works)";
        }
        field(31; "Procurement Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Road Project Category" = filter("Road Construction" | Maintenance)) "Procurement Category".Code// where ("Procurement Type"=filter(WORKS))
            else
            if ("Road Project Category" = filter("Survey/Study")) "Procurement Category".Code; //where ("Procurement Type"=filter(SERVICES));
        }
        field(32; "Entry No"; Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(33; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                //VALIDATE("Budget (Cost) Excl. VAT");
            end;
        }
        field(34; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                //VALIDATE("Budget (Cost) Excl. VAT");
            end;
        }
        field(35; "Total Budget Cost"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Total Budget Cost';
            Editable = true;
        }
        field(36; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Road Work Plan,Global Budget Book';
            OptionMembers = " ","Road Work Plan","Global Budget Book";
        }
        field(37; "Funding Source"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Global Budget ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39; "Procurement Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code where(Blocked = filter(FALSE));
        }
        field(40; "WorkPlanned Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Contract Sum"; Decimal)
        {
            CalcFormula = sum("New Road Work Program Activity"."Line Amount Excl. VAT" where("Road Work Program ID" = field("Road Work Program ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "Project No"; Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(43; "KeRRA Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Project Location ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(45; "Contingency Rate"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Contingency Rate"<>0 THEN
                //  BEGIN
                //    "Contingency Amount":="Contingency Rate"/100*"Total Project Cost Exc. VAT";
                //    END;
                //    VALIDATE("Contingency Amount");
                //    VALIDATE("Variation of Price Amount");
            end;
        }
        field(46; "Variation of Price Rate"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // CALCFIELDS("Total Project Cost Exc. VAT");
                // IF "Variation of Price Rate"<>0 THEN
                //  BEGIN
                //    "Variation of Price Amount":=ROUND("Variation of Price Rate"/100*"Total Project Cost Exc. VAT",1,'>');
                //  END;
                //
                //
                //
                // VATPostingSetup.RESET;
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Bus. Posting Group","VAT Bus. Posting Group");
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Prod. Posting Group","VAT Prod. Posting Group");
                // IF VATPostingSetup.FINDSET THEN BEGIN
                //   "Total Project Cost Inc. VAT":=ROUND(((100+VATPostingSetup."VAT %")/100*("Total Project Cost Exc. VAT"+"Variation of Price Amount"+"Contingency Amount")),1,'>');
                //  END;
                //
                // VALIDATE("Variation of Price Amount");
                // //VALIDATE("Contingency Amount");
            end;
        }
        field(47; "Total Project Cost Exc. VAT"; Decimal)
        {
            CalcFormula = sum("New Road Work Program Activity"."Line Amount Excl. VAT" where("Road Work Program ID" = field("Road Work Program ID"),
                                                                                              "Budget Entry No" = field("Budget Entry No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(48; "Total Project Cost Inc. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(49; "Contingency Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // VATPostingSetup.RESET;
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Bus. Posting Group","VAT Bus. Posting Group");
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Prod. Posting Group","VAT Prod. Posting Group");
                // IF VATPostingSetup.FINDSET THEN BEGIN
                //   "Total Project Cost Inc. VAT":=ROUND(((100+VATPostingSetup."VAT %")/100*("Total Project Cost Exc. VAT"+"Variation of Price Amount"+"Contingency Amount")),1,'>');
                //  END;
                // //VALIDATE("Variation of Price Amount");
            end;
        }
        field(50; "Variation of Price Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // VATPostingSetup.RESET;
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Bus. Posting Group","VAT Bus. Posting Group");
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Prod. Posting Group","VAT Prod. Posting Group");
                // IF VATPostingSetup.FINDSET THEN BEGIN
                //   "Total Project Cost Inc. VAT":=ROUND(((100+VATPostingSetup."VAT %")/100*("Total Project Cost Exc. VAT"+"Variation of Price Amount"+"Contingency Amount")),1,'>');
                //  END;
                // // VALIDATE("Contingency Amount");
            end;
        }
        field(51; "PBRM BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code where("Template Type" = filter(BoQ));
        }
        field(52; "Has PBRM Component"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Bid Sum 1"; Decimal)
        {
            CalcFormula = sum("New Road Work Program Activity"."Line Amount Excl. VAT" where("Road Work Program ID" = field("Road Work Program ID"),
                                                                                              "Budget Entry No" = field("Budget Entry No"),
                                                                                              "Contract Type" = filter(Construction)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(54; "Bid Sum 2"; Decimal)
        {
            CalcFormula = sum("New Road Work Program Activity"."Line Amount Excl. VAT" where("Road Work Program ID" = field("Road Work Program ID"),
                                                                                              "Budget Entry No" = field("Budget Entry No"),
                                                                                              "Contract Type" = filter(PBRM)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(55; "Bid Sum 1 Contingency Rate"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // CALCFIELDS("Bid Sum 1");
                // IF "Bid Sum 1 Contingency Rate"<>0 THEN
                //  BEGIN
                //    "Bid Sum 1 Contingency Amount":="Bid Sum 1 Contingency Rate"/100*"Bid Sum 1";
                //    END;
                //    //VALIDATE("Bid Sum 1 Contingency Rate");
                //    //VALIDATE("Bid Sum 1 VoP Amount");
                //        "VAT Amount":="Total Contract Sum Incl. VAT"-("Bid Sum 1"+"Bid Sum 1 Contingency Amount"+"Bid Sum 1 VoP Amount");
                // VATPostingSetup.RESET;
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Bus. Posting Group","VAT Bus. Posting Group");
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Prod. Posting Group","VAT Prod. Posting Group");
                // IF VATPostingSetup.FINDSET THEN BEGIN
                //   "Total Bid Sum 1 Incl. VAT":=ROUND(((100+VATPostingSetup."VAT %")/100*("Bid Sum 1"+"Bid Sum 1 VoP Amount"+"Bid Sum 1 Contingency Amount")),1,'>');
                //  END;
                //  "Total Contract Sum Incl. VAT":="Total Bid Sum 1 Incl. VAT"+"Total Bid Sum 2 Incl. VAT";
            end;
        }
        field(56; "Bid Sum 1 VoP Rate"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // CALCFIELDS("Bid Sum 1");
                // IF "Bid Sum 1 VoP Rate"<>0 THEN
                //  BEGIN
                //    "Bid Sum 1 VoP Amount":=ROUND("Bid Sum 1 VoP Rate"/100*"Bid Sum 1",1,'>');
                //  END;
                //
                //    "VAT Amount":="Total Contract Sum Incl. VAT"-("Bid Sum 1"+"Bid Sum 1 Contingency Amount"+"Bid Sum 1 VoP Amount");
                //
                // VATPostingSetup.RESET;
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Bus. Posting Group","VAT Bus. Posting Group");
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Prod. Posting Group","VAT Prod. Posting Group");
                // IF VATPostingSetup.FINDSET THEN BEGIN
                //   "Total Bid Sum 1 Incl. VAT":=ROUND(((100+VATPostingSetup."VAT %")/100*("Bid Sum 1"+"Bid Sum 1 VoP Amount"+"Bid Sum 1 Contingency Amount")),1,'>');
                //  END;
                //  "Total Contract Sum Incl. VAT":="Total Bid Sum 1 Incl. VAT"+"Total Bid Sum 2 Incl. VAT";
                //
                // //VALIDATE("Bid Sum 1 VoP Amount");
                // //VALIDATE("Contingency Amount");
            end;
        }
        field(57; "Bid Sum 2 Contingency Rate"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // CALCFIELDS("Bid Sum 2");
                // IF "Bid Sum 2 Contingency Rate"<>0 THEN
                //  BEGIN
                //    "Bid Sum 2 Contingency Amount":="Bid Sum 2 Contingency Rate"/100*"Bid Sum 2";
                //    END;
                //
                // "Total Contract Sum Incl. VAT":="Total Bid Sum 1 Incl. VAT"+"Total Bid Sum 2 Incl. VAT";
                //    //VALIDATE("Bid Sum 2 Contingency Amount");
                //    //VALIDATE("Bid Sum 2 VoP Amount");
            end;
        }
        field(58; "Bid Sum 2 VoP Rate"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // CALCFIELDS("Bid Sum 2");
                // IF "Bid Sum 2 VoP Rate"<>0 THEN
                //  BEGIN
                //    "Bid Sum 2 VoP Amount":=ROUND("Bid Sum 2 VoP Rate"/100*"Bid Sum 2",1,'>');
                //  END;
                //
                //
                //
                // VATPostingSetup.RESET;
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Bus. Posting Group","VAT Bus. Posting Group");
                // VATPostingSetup.SETRANGE(VATPostingSetup."VAT Prod. Posting Group","VAT Prod. Posting Group");
                // IF VATPostingSetup.FINDSET THEN BEGIN
                //   "Total Bid Sum 2 Incl. VAT":=ROUND(((100+VATPostingSetup."VAT %")/100*("Bid Sum 2"+"Bid Sum 2 VoP Amount"+"Bid Sum 2 Contingency Amount")),1,'>');
                //  END;
                //
                // "Total Contract Sum Incl. VAT":="Total Bid Sum 1 Incl. VAT"+"Total Bid Sum 2 Incl. VAT";
            end;
        }
        field(59; "Bid Sum 1 Contingency Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Bid Sum 2 Contingency Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(61; "Bid Sum 1 VoP Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Bid Sum 2 VoP Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(63; "Total Bid Sum 1 Incl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Total Bid Sum 2 Incl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Total Contract Sum Incl. VAT" := "Total Bid Sum 1 Incl. VAT" + "Total Bid Sum 2 Incl. VAT";
            end;
        }
        field(65; "Total Contract Sum Incl. VAT"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(66; "Project Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(67; "Financial Year Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Study/Survey Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,ESIA Study,Topographic Survey,Traffic Census,Road Safety Audit,Design Works,Environmental Audits';
            OptionMembers = " ","ESIA Study","Topographic Survey","Traffic Census","Road Safety Audit","Design Works","Environmental Audits";
        }
        field(69; "Request No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'For Studies/Surveys and Designs';
            TableRelation = "Survey Request Header"."Document No.";
        }
        field(70; "Procurement Plan Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Equipment Specs Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Template".Code where(Blocked = const(FALSE));
        }
        field(72; "Personnel Specs Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Key Staff Template".Code where(Blocked = const(FALSE));
        }
        field(73; "Assignment Area ID"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Duty Station"),
                                                                Blocked = const(FALSE));
        }
        field(50000; "VAT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "PBRM VATAmount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Workplan No"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50003; "Workplan Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "RAM Workplan Line"."Line No" where("Document No" = field("Workplan No"),
                                                                 "Workplan Type" = filter(Consolidated),
                                                                 "Region Code" = field("Region ID"));

            trigger OnValidate()
            begin
                //     RAMWorkplanLine.Reset;
                //     RAMWorkplanLine.SetRange(RAMWorkplanLine."Document No", "Workplan No");
                //     RAMWorkplanLine.SetRange(RAMWorkplanLine."Line No", "Workplan Entry No");
                //     if RAMWorkplanLine.FindSet then begin
                //         "BoQ Template Code" := RAMWorkplanLine."BoQ Template";
                //         "Variation of Price Rate" := RAMWorkplanLine."VoP Rate(%)";
                //         "Variation of Price Amount" := RAMWorkplanLine."VoP Amount (KES)";
                //         "Contingency Rate" := RAMWorkplanLine."Contingency Rate (%)";
                //         "Contingency Amount" := RAMWorkplanLine."Contingency Amount (KES)";
                //         "VAT Prod. Posting Group" := RAMWorkplanLine."VAT Prod Posting Group";
                //         "VAT Bus. Posting Group" := 'DOMESTIC';
                //         "Total Bid Sum 1 Incl. VAT" := RAMWorkplanLine."Total Incl VAT";
                //         "Total Contract Sum Incl. VAT" := RAMWorkplanLine."Total Incl VAT";
                //     end;
            end;
        }
    }

    keys
    {
        key(Key1; "Road Work Program ID", "Budget Entry No", "Global Budget ID", "Project No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Directorate ID" := RoadWorkProgram."Directorate Code";
        "Department ID" := RoadWorkProgram."Department Code";


        RoadWorkProgram.Reset;
        RoadWorkProgram.SetRange(RoadWorkProgram.Code, "Road Work Program ID");
        RoadWorkProgram.SetRange(RoadWorkProgram."Document Type", RoadWorkProgram."document type"::"Schedule Of Projects");
        if RoadWorkProgram.FindSet then begin
            "VAT Bus. Posting Group" := RoadWorkProgram."VAT Bus. Posting Group";
            "VAT Prod. Posting Group" := RoadWorkProgram."VAT Prod. Posting Group";
            "Road Project Category" := RoadWorkProgram."Road Project Category";
            Validate("Road Project Category");
            "Document Type" := RoadWorkProgram."Document Type";
            "Global Budget ID" := RoadWorkProgram."Gloabal Budget Book ID";
            "Road Project Category" := RoadWorkProgram."Road Project Category";
            "Workplan No" := RoadWorkProgram."Global Budget Book Id";
            "Region ID" := RoadWorkProgram."Region ID";
        end;
        RoadWorkProgram.Reset;
        RoadWorkProgram.SetRange(RoadWorkProgram.Code, "Road Work Program ID");
        if RoadWorkProgram.FindSet then begin
            "Financial Year Code" := RoadWorkProgram."Financial Year Code";
        end;
    end;

    var
        RoadSection: Record 72027;
        RoadWorkProgram: Record 72132;
        Constituency: Record 72011;
        WorksCategory: Record 70122;
        FundingSource: Record 65016;
        VATProductPostingGroup: Record "VAT Product Posting Group";
        VATPostingSetup: Record "VAT Posting Setup";
        NewRoadWorkProgramPackage: Record 72133;
        RoadInventory: Record 72111;
        PurchaseRequisitionTemplate: Record 70139;
        WorkplanProjectRoadLink: Record 72015;
        WorkPlanSummaryofBills: Record 72016;
        WorkPlanBillItem: Record 72017;
        ProjectRoadLink: Record 72275;
        NewRoadWorkProgramTask: Record 72134;
        NewRoadWorkProgramActivity: Record 72135;
        RMSManagement: Codeunit 72000;
        RAMWorkplanLine: Record 72014;
}

