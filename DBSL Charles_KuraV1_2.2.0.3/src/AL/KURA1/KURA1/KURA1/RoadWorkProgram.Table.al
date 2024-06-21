#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72132 "Road Work Program"
{
    Caption = 'Road Work Program';
    DrillDownPageID = 72343;
    LookupPageID = 72343;

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Schedule Of Projects,Global Budget Book,Multi-Year Programs,New Job Voucher';
            OptionMembers = " ","Schedule Of Projects","Global Budget Book","Multi-Year Programs","New Job Voucher";
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Gloabal Budget Book ID"; Code[20])
        {
            Caption = 'Global Budget Book ID';
            DataClassification = ToBeClassified;
            Description = 'Gloabal Budget Book ID';
            TableRelation =
            // if ("Road Project Category" = filter(Maintenance)) "RAM Workplan Header"."Document No" where("Workplan Type" = filter(Consolidated),
            //                                                                                                             Status = filter(Approved))
            // else
            if ("Road Project Category" = filter("Road Construction")) "Road Work Program".Code where("Road Project Category" = filter("Road Construction"),
                                                                                                                                                                                                                      "Document Type" = filter("Multi-Year Programs"))
            else
            if ("Road Project Category" = filter("Survey/Study")) "Road Work Program".Code where("Document Type" = filter("Multi-Year Programs"),
                                                                                                                                                                                                                                                                                                               "Road Project Category" = filter("Survey/Study"));

            trigger OnValidate()
            begin
                RoadWorkProgram.Reset;
                RoadWorkProgram.SetRange(RoadWorkProgram.Code, "Gloabal Budget Book ID");
                if RoadWorkProgram.FindSet then begin
                    "Road Project Category" := RoadWorkProgram."Road Project Category";
                    "Document Date" := Today;
                    "Financial Year Code" := RoadWorkProgram."Financial Year Code";
                    "Road Project Category" := RoadWorkProgram."Road Project Category";
                    "Funding Source ID" := RoadWorkProgram."Funding Source ID";
                    //VALIDATE("Funding Source ID");
                    Validate("Financial Year Code");
                    Description := Format("Document Type") + ' - ' + "Region ID";
                end;


                if xRec."Gloabal Budget Book ID" <> "Gloabal Budget Book ID" then begin
                    RoadWorkPlanPackage.Reset;
                    RoadWorkPlanPackage.SetRange("Road Work Program ID", Code);
                    if RoadWorkPlanPackage.FindSet then
                        RoadWorkPlanPackage.DeleteAll;
                end;

                RoadWorkPlanPackage.Reset;
                RoadWorkPlanPackage.SetRange("Road Work Program ID", Code);
                if RoadWorkPlanPackage.FindSet then begin
                    RoadWorkPlanPackage."Global Budget ID" := "Gloabal Budget Book ID";
                    RoadWorkPlanPackage.Modify;
                end;
            end;
        }
        field(5; Authority; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Authority"."Road Authority Code" where("Current Road Agency" = filter(TRUE));
        }
        field(6; "Region ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));

            trigger OnValidate()
            begin
                // ResponsibilityCenter.RESET;
                // ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code,"Region ID");
                // IF ResponsibilityCenter.FINDSET THEN
                // "Region ID":=ResponsibilityCenter.Name;

                Validate("Gloabal Budget Book ID");
            end;
        }
        field(7; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Corporate Strategic Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(9; "Financial Budget ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
        field(10; "Financial Year Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;

            trigger OnValidate()
            begin
                FinancialYearCode.Reset;
                FinancialYearCode.SetRange(FinancialYearCode.Code, "Financial Year Code");
                if FinancialYearCode.FindSet then begin
                    // IF "Document Type"<>"Document Type"::"New Job Voucher" THEN BEGIN
                    FinancialYearCode.TestField("G/L Budget");
                    FinancialYearCode.TestField("Starting Date");
                    FinancialYearCode.TestField("Ending Date");
                    if "Document Type" <> "document type"::"New Job Voucher" then begin
                        "Start Date" := FinancialYearCode."Starting Date";
                        "End Date" := FinancialYearCode."Ending Date";
                    end;
                    "Financial Budget ID" := FinancialYearCode."G/L Budget";
                    if "Road Project Category" = "road project category"::"Survey/Study" then
                        Description := 'Maintenance Workplan: ' + "Financial Year Code";
                end;
                //END;
                if "Document Type" <> "document type"::"New Job Voucher" then
                    RMS.FnUpdateRoadProgramBudget(Rec, "Financial Year Code");
            end;
        }
        field(11; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Total Workplanned Length (Km)"; Decimal)
        {
            CalcFormula = sum("Project Road Link"."Workplanned Length(KM)" where("Global Budget Book Code" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Total Budget Ceiling"; Decimal)
        {
            CalcFormula = sum("New Road Work Program Package"."Total Budget Cost" where("Road Work Program ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Total Actual Costs"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Pending Approval,Approved,Released';
            OptionMembers = " ",Open,"Pending Approval",Approved,Released;
        }
        field(17; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(18; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Created Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Planning Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Top-Down (New Works),Bottom-Up (Existing Works)';
            OptionMembers = " ","Top-Down (New Works)","Bottom-Up (Existing Works)";
        }
        field(23; "Procurement Plan ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code where(Blocked = filter(False),
                                                           "Plan Type" = filter(Consolidated));
        }
        field(24; "Budget Line/ Vote Item"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No." where("Income/Balance" = filter("Income Statement"));

            trigger OnValidate()
            begin
                GLBudgetEntry.Reset;
                GLBudgetEntry.SetRange(GLBudgetEntry."G/L Account No.", "Budget Line/ Vote Item");
                GLBudgetEntry.SetRange(GLBudgetEntry."Global Dimension 1 Code", "Region ID");
                if GLBudgetEntry.FindSet then
                    repeat
                        "Total Financial Budget" := "Total Financial Budget" + GLBudgetEntry.Amount;
                    until GLBudgetEntry.Next = 0;
            end;
        }
        field(25; "Total Financial Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Constituency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Constituency));
        }
        field(27; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));
        }
        field(28; "Directorate Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(Directorate));
        }
        field(29; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";
        }
        field(30; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            //             trigger OnValidate()
            //             begin
            //                 ValidateShortcutDimCode(1, "Global Dimension 1 Code");

            //                 ResponsibilityCenter.Reset;
            //                 ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Global Dimension 1 Code");
            //                 if ResponsibilityCenter.FindSet then
            // ;
        }
        field(31; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(32; "Global Budget Book Id"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Work Program".Code where("Document Type" = const("Multi-Year Programs"), "Approval Status" = const(Released));
            // // TableRelation = if ("Road Project Category" = const(Maintenance)) "RAM Workplan Header"."Document No" where("Workplan Type" = const(Consolidated),
            // //                                                                                                            Status = const(Approved))
            // // else
            // TableRelation = if ("Road Project Category" = filter("Road Construction" | "Structure Construction")) "Road Work Program".Code where("Document Type" = const("Multi-Year Programs"),
            //                                                                                                                                                                                                                                   "Approval Status" = const(Approved),
            //                                                                                                                                                                                                                                   "Type of Project" = filter("Road Construction" | "Structure Construction"))
            // else
            // if ("Road Project Category" = filter("Survey/Study")) "Road Work Program".Code where("Document Type" = filter("Multi-Year Programs"),
            //                                                                                                                                                                                                                                                                                                                            "Type of Project" = filter("Survey/Study"),
            //                                                                                                                                                                                                                                                                                                                            "Approval Status" = filter(Approved));

            trigger OnValidate()
            begin
                RMS.fnUpdateMaintenanceWorkplan(Rec);
                RMS.fnUpdateConstructionWorkplan(Rec);
            end;
        }
        field(33; "VAT Bus. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Bus. Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(34; "VAT Prod. Posting Group"; Code[20])
        {
            Caption = 'Default VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(35; "Planning Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Regional,Constituency';
            OptionMembers = Regional,Constituency;
        }
        field(36; "Road Planner No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = filter(Person),
                                                  Blocked = filter(false),
                                                  "Road Planner" = filter(TRUE));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange(Resource."No.", "Road Planner No");
                if Resource.FindSet then
                    "Road Planner Name" := Resource.Name;
            end;
        }
        field(37; "Road Planner Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Road Works Category"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Category".Code;
        }
        field(39; "Funding Source"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source".Code where(Blocked = filter(FALSE));
        }
        field(40; "Road Planner Region Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Funding Source ID"; Code[20])
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
        field(42; "Funding Agency ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Funding Agency".Code';
            TableRelation = Customer."No.";
        }
        field(43; "Total MultiYear Plan Cost"; Decimal)
        {
            CalcFormula = sum("Detailed Multi_Year Line"."Annual Funding Limit" where("Road Work Program ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(44; "Multi Year"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Multi Year Budget ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Work Program".Code where("Document Type" = filter("Multi-Year Programs"),
                                                            "Approval Status" = filter(Approved));
        }
        field(46; "Contract ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Purchase Header"."No." where("Document Type" = filter("Blanket Order"));
        }
        field(47; "Contractor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if Vendor.Get("Contractor No") then
                    "Contractor Name" := Vendor.Name;
            end;
        }
        field(48; "Contractor Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Contract Sum"; Decimal)
        {
            CalcFormula = sum("New Road Work Program Activity"."Line Amount Excl. VAT" where("Road Work Program ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "Contractor Advance Account ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(51; "Type of Project"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Maintenance,Road Construction,Survey/Study,Structure Construction';
            OptionMembers = " ",Maintenance,"Road Construction","Survey/Study","Structure Construction";
        }
        field(52; "Job Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Posting Group".Code;
        }
        field(53; "Project Location ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(54; "KeRRA Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Total Cost"; Decimal)
        {
            CalcFormula = sum("Road WorkPlan Package"."Total Contract Sum Incl. VAT" where("Road Work Program ID" = field("Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(56; "Has PBRM Contract"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57; Axle; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Procurement Plan Description"; Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(59; "Reasons for Reopening"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
        "Document Date" := Today;
        "Approval Status" := "approval status"::Open;

        if "Document Type" = "document type"::"Schedule Of Projects" then begin
            if "Road Project Category" = "road project category"::Maintenance then begin
                if Code = '' then begin
                    RoadsManagementSetup.Get;
                    RoadsManagementSetup.TestField("Road Work Plan Nos(Maintenanc)");
                    NoSeriesManagement.InitSeries(RoadsManagementSetup."Road Work Plan Nos(Maintenanc)", xRec."No. Series", Today, Code, "No. Series");
                end;
            end;
        end;

        if "Document Type" = "document type"::"Schedule Of Projects" then begin
            if "Road Project Category" = "road project category"::"Survey/Study" then begin
                if Code = '' then begin
                    RoadsManagementSetup.Get;
                    RoadsManagementSetup.TestField("Workplan Nos(Studies/Surveys)");
                    NoSeriesManagement.InitSeries(RoadsManagementSetup."Workplan Nos(Studies/Surveys)", xRec."No. Series", Today, Code, "No. Series");
                end;
            end;
        end;

        if "Document Type" = "document type"::"Schedule Of Projects" then begin
            if "Road Project Category" = "road project category"::"Road Construction" then begin
                if Code = '' then begin
                    RoadsManagementSetup.Get;
                    RoadsManagementSetup.TestField("Road Work Plan Nos(Constructi)");
                    NoSeriesManagement.InitSeries(RoadsManagementSetup."Road Work Plan Nos(Constructi)", xRec."No. Series", Today, Code, "No. Series");
                end;
            end;
        end;

        if "Document Type" = "document type"::"Global Budget Book" then begin
            if "Road Project Category" = "road project category"::"Survey/Study" then begin
                if Code = '' then begin
                    RoadsManagementSetup.Get;
                    RoadsManagementSetup.TestField("Road Budget  Nos(Maintenance)");
                    NoSeriesManagement.InitSeries(RoadsManagementSetup."Road Budget  Nos(Maintenance)", xRec."No. Series", Today, Code, "No. Series");
                end;
            end;
        end;


        ////cc
        if "Document Type" = "document type"::"Global Budget Book" then begin
            if "Road Project Category" = "road project category"::"Structure Construction" then begin
                if Code = '' then begin
                    RoadsManagementSetup.Get;
                    RoadsManagementSetup.TestField("Axle Load");
                    NoSeriesManagement.InitSeries(RoadsManagementSetup."Axle Load", xRec."No. Series", Today, Code, "No. Series");
                end;
            end;
        end;

        if "Document Type" = "document type"::"Global Budget Book" then begin
            if "Road Project Category" = "road project category"::"Road Construction" then begin
                if Code = '' then begin
                    RoadsManagementSetup.Get;
                    RoadsManagementSetup.TestField("Road Budget  Nos(Development)");
                    NoSeriesManagement.InitSeries(RoadsManagementSetup."Road Budget  Nos(Development)", xRec."No. Series", Today, Code, "No. Series");
                end;
            end;
        end;

        if "Document Type" = "document type"::"Global Budget Book" then begin
            if "Road Project Category" = "road project category"::Maintenance then begin
                if Code = '' then begin
                    RoadsManagementSetup.Get;
                    RoadsManagementSetup.TestField("Road Budget Nos(Study/Survey)");
                    NoSeriesManagement.InitSeries(RoadsManagementSetup."Road Budget Nos(Study/Survey)", xRec."No. Series", Today, Code, "No. Series");
                end;
            end;
        end;

        if "Document Type" = "document type"::"Multi-Year Programs" then begin
            if "Road Project Category" = "road project category"::"Road Construction" then begin
                if Code = '' then begin
                    RoadsManagementSetup.Get;
                    RoadsManagementSetup.TestField("Multi Year Projects No");
                    NoSeriesManagement.InitSeries(RoadsManagementSetup."Multi Year Projects No", xRec."No. Series", Today, Code, "No. Series");
                end;
            end;
        end;


        if "Document Type" = "document type"::"New Job Voucher" then begin
            if Code = '' then begin
                RoadsManagementSetup.Get;
                RoadsManagementSetup.TestField("New Job Vouche Nos");
                NoSeriesManagement.InitSeries(RoadsManagementSetup."New Job Vouche Nos", xRec."No. Series", Today, Code, "No. Series");
            end;
        end;


        RoadAuthority.Reset;
        RoadAuthority.SetRange(RoadAuthority."Current Road Agency", true);
        if RoadAuthority.FindSet then
            Authority := RoadAuthority."Road Authority Code";

        if UserSetup.Get(UserId) then begin
            Resource.Reset;
            Resource.SetRange(Resource."No.", UserSetup."Road Planner No");
            if Resource.FindSet then begin
                "Global Dimension 1 Code" := Resource."Global Dimension 1 Code";
                "Global Dimension 2 Code" := Resource."Global Dimension 2 Code";
                // "Region ID":=Resource."Region ID";
                "Global Dimension 1 Code" := "Region ID";
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Region ID");
                if ResponsibilityCenter.FindSet then
                    //"Region ID":=ResponsibilityCenter.Name;
                    "Constituency ID" := Resource."Constituency ID";
                Constituency.Reset;
                Constituency.SetRange(Constituency.Code, "Constituency ID");
                if Constituency.FindSet then
                    "Constituency ID" := Constituency.Description;
            end;
        end;

        ProcurementSetup.Get;
        "Procurement Plan ID" := ProcurementSetup."Effective Procurement Plan";

        ProcurementPlan.Reset;
        ProcurementPlan.SetRange(ProcurementPlan.Code, "Procurement Plan ID");
        if ProcurementPlan.FindSet then
            "Procurement Plan Description" := ProcurementPlan.Description;

        //Insert Current Financial year
        CashManagementSetup.Get();
        "Financial Year Code" := CashManagementSetup."Current Budget";
        "Financial Budget ID" := CashManagementSetup."Current Budget";
        "Start Date" := CashManagementSetup."Current Budget Start Date";
        "End Date" := CashManagementSetup."Current Budget End Date";

        //Default Region ID to the User Responsibilty Center
        if UserSetup.Get(UserId) then begin
            if UserSetup."Purchase Resp. Ctr. Filter" <> '' then begin
                "Region ID" := UserSetup."Purchase Resp. Ctr. Filter";
            end;
        end;
    end;

    var
        RoadsManagementSetup: Record 72102;
        NoSeriesManagement: Codeunit NoSeriesManagement;
        FinancialYearCode: Record 65040;
        GLBudgetEntry: Record "G/L Budget Entry";
        RoadAuthority: Record 72088;
        RoadWorkProgram: Record "Road Work Program";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        DimMgt: Codeunit DimensionManagement;
        UpdateJobTaskDimQst: label 'You have changed a dimension.\\Do you want to update the lines?';
        RMS: Codeunit 72000;
        Resource: Record Resource;
        RoadWorkPlanPackage: Record 72204;
        ProcurementSetup: Record 70060;
        County1: Record 72010;
        Constituency: Record 72011;
        ResponsibilityCenter: Record "Responsibility Center";
        FundingSource: Record 65016;
        ProcurementPlan: Record 70098;
        Vendor: Record Vendor;
        CashManagementSetup: Record 57004;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        //DimMgt.SaveDefaultDim(DATABASE::Job,Code,FieldNumber,ShortcutDimCode);
        //UpdateJobTaskDimension(FieldNumber,ShortcutDimCode);
        Modify;
    end;

    local procedure UpdateJobTaskDimension(FieldNumber: Integer; ShortcutDimCode: Code[20])
    var
        RoadProgramLines: Record 72136;
    begin
        if GuiAllowed then
            if not Confirm(UpdateJobTaskDimQst, false) then
                exit;

        RoadProgramLines.SetRange("Road Work Program ID", Code);
        if RoadProgramLines.FindSet(true) then
            repeat
                case FieldNumber of
                    1:
                        RoadProgramLines.Validate("Global Dimension 1", ShortcutDimCode);
                    2:
                        RoadProgramLines.Validate("Global Dimension 2", ShortcutDimCode);
                end;
                RoadProgramLines.Modify;
            until RoadProgramLines.Next = 0;
    end;
}

