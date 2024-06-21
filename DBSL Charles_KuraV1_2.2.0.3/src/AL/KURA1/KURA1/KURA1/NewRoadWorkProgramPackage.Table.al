#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72133 "New Road Work Program Package"
{

    fields
    {
        field(1; "Road Work Program ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Package No."; Integer)
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "G/L Budget Entry"."Entry No.";

            trigger OnValidate()
            begin
                GLBudgetEntry.Reset;
                GLBudgetEntry.SetRange(GLBudgetEntry."Entry No.", "Package No.");
                if GLBudgetEntry.FindSet then begin
                    "Package Name" := GLBudgetEntry.Description;
                    "Total Budget Cost" := GLBudgetEntry.Amount;
                end;
            end;
        }
        field(3; "Package Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Road Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code" where(Blocked = const(false));

            trigger OnValidate()
            begin
                RoadInventory.Reset;
                RoadInventory.SetRange(RoadInventory."Road Code", "Road Code");
                if RoadInventory.FindSet then begin
                    "Start Chainage" := RoadInventory."Start Chainage(KM)";
                    "End Chainage" := RoadInventory."End Chainage(KM)";
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
                    "Road Class" := RoadSection."Road Class ID";
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
        field(8; "Pavement Surface Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pavement Surface Type".Code;
        }
        field(9; "Funding Source ID"; Code[20])
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
        field(10; "Start Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
            // MaxValue = 999999999999;
            MinValue = 0;
        }
        field(11; "End Chainage"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3 : 3;
            // MaxValue = 99999999999;
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
            CalcFormula = sum("Project Road Link"."Workplanned Length(KM)" where("KeRRA Budget Code" = field("KeRRA Budget Code"),
                                                                                  "Global Budget Book Code" = field("Road Work Program ID")));
            DecimalPlaces = 3 : 3;
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
        }
        field(18; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Studies and Surveys,Construction Works,Maintenance Works';
            OptionMembers = ,"Studies and Surveys","Construction Works","Maintenance Works";
        }
        field(19; "Directorate ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Department ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Road Class"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Class"."Road Class ID" where(Blocked = filter(false));
        }
        field(22; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'P7';
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
        field(26; "Global Dimension 1"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(27; "Global Dimension 2"; Code[20])
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
            TableRelation = if ("Road Project Category" = filter("Construction Works" | "Maintenance Works")) "Procurement Category".Code where("Procurement Type" = filter('WORKS'))
            else
            if ("Road Project Category" = filter("Studies and Surveys")) "Procurement Category".Code where("Procurement Type" = filter('SERVICES'));
        }
        field(32; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";

            trigger OnValidate()
            begin
                Validate("Budget (Cost) Excl. VAT");
            end;
        }
        field(34; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate()
            begin
                Validate("Budget (Cost) Excl. VAT");
            end;
        }
        field(35; "Total Budget Cost"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Total Budget Cost';
            Editable = true;

            trigger OnValidate()
            begin
                TotalBudgetLines := 0;
                RoadWorkProgram.Reset;
                RoadWorkProgram.SetRange(RoadWorkProgram.Code, "Road Work Program ID");
                if RoadWorkProgram.FindSet then begin
                    NewRoadWorkProgramPackage.Reset;
                    NewRoadWorkProgramPackage.SetRange("Road Work Program ID", RoadWorkProgram.Code);
                    if NewRoadWorkProgramPackage.FindSet then begin
                        repeat
                            TotalBudgetLines := TotalBudgetLines + NewRoadWorkProgramPackage."Total Budget Cost";
                        until NewRoadWorkProgramPackage.Next = 0;
                    end;
                    if TotalBudgetLines > RoadWorkProgram."Total Financial Budget" then
                        Error('You cannot exceed the budget ceiling %1', RoadWorkProgram."Total Financial Budget");
                end;
            end;
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
        field(39; "Project Location ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(40; "KeRRA Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "No of Road Links"; Integer)
        {
            CalcFormula = count("Project Road Link" where("Global Budget Book Code" = field("Road Work Program ID"),
                                                           "KeRRA Budget Code" = field("KeRRA Budget Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "PBRM BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Requisition Template".Code where("Template Type" = filter(BoQ));
        }
        field(43; "Has PBRM Component"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Financial Year Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Road Work Program ID", "Package No.", "KeRRA Budget Code")
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
        //"Region ID":=RoadWorkProgram."Region ID";

        RoadWorkProgram.Reset;
        RoadWorkProgram.SetRange(RoadWorkProgram.Code, "Road Work Program ID");
        RoadWorkProgram.SetRange(RoadWorkProgram."Document Type", RoadWorkProgram."document type"::"Global Budget Book");
        if RoadWorkProgram.FindSet then begin
            "VAT Bus. Posting Group" := RoadWorkProgram."VAT Bus. Posting Group";
            "VAT Prod. Posting Group" := RoadWorkProgram."VAT Prod. Posting Group";
            "Road Project Category" := RoadWorkProgram."Road Project Category";
            "Document Type" := RoadWorkProgram."Document Type";
            "Global Budget ID" := RoadWorkProgram."Gloabal Budget Book ID";
            "Road Project Category" := RoadWorkProgram."Road Project Category";
        end;
        RoadWorkProgram.Reset;
        RoadWorkProgram.SetRange(RoadWorkProgram.Code, "Road Work Program ID");
        if RoadWorkProgram.FindSet then begin
            "Financial Year Code" := RoadWorkProgram."Financial Year Code";
        end;
    end;

    var
        RoadSection: Record "Road Section";
        RoadWorkProgram: Record "Road Work Program";
        Constituency: Record Constituency;
        WorksCategory: Record "Works Category";
        FundingSource: Record "Funding Source";
        VATProductPostingGroup: Record "VAT Product Posting Group";
        VATPostingSetup: Record "VAT Posting Setup";
        NewRoadWorkProgramPackage: Record "New Road Work Program Package";
        TotalBudgetLines: Decimal;
        RoadInventory: Record "Road Inventory";
        GLBudgetEntry: Record "G/L Budget Entry";
}

