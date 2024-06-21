table 99502 "RAM Workplan Header"
{
    Caption = 'RAM Workplan Header';

    fields
    {
        field(1; "Document No"; Code[50])
        {

            Editable = false;
        }
        field(2; "Document Date"; Date)
        {

            Editable = false;
        }
        field(3; Description; Text[300])
        {

        }
        field(4; "Global Dimension 1 Code"; Code[30])
        {

            TableRelation = "Responsibility Center".Code WHERE("Operating Unit Type" = FILTER(Region));
             CaptionClass = '1,2,1';
            Caption = 'Global Dimension 1 Code';
            trigger OnValidate()
            var
                BudgetCeiling: Record "Road Works Budget Ceilings";
                BudgetCeilingLine: Record "RoadWorks Ceilings Line";
            begin
                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Global Dimension 1 Code");
                IF ResponsibilityCenter.FINDSET THEN BEGIN
                    "Region Name" := ResponsibilityCenter.Name;
                END;

                Employee.RESET;
                Employee.SETRANGE(Employee.Region, "Global Dimension 1 Code");
                Employee.SETRANGE(Employee."Regional Manager", TRUE);
                IF Employee.FINDSET THEN BEGIN
                    "Regional Director No" := Employee."No.";
                    "Regional Director Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                END;

                Constituency.RESET;
                Constituency.SETRANGE(Constituency."Region Code", "Global Dimension 1 Code");
                IF Constituency.FINDSET THEN
                    "County Code" := Constituency."County Code";

                Description := "Region Name" + ' ' + 'Region Workplan For Financial Year' + ' ' + "Financial Year Code";
                VALIDATE("Funding Source Type");
                BudgetCeilingLine.Reset();
                BudgetCeilingLine.SetRange("Funding Source Type", Rec."Funding Source Type");
                BudgetCeilingLine.SetRange("Funding Source Code", Rec."Global Dimension 2 Code");
                BudgetCeilingLine.SetRange("Region Code", Rec."Global Dimension 1 Code");
                BudgetCeilingLine.SetRange("Financial Year", Rec."Financial Year Code");
                if BudgetCeilingLine.FindFirst() then
                    Rec."Budget Ceiling Amount" := BudgetCeilingLine."Allocation Amount (KES)";
                
            end;
        }
        field(5; "Region Name"; Text[300])
        {

            Editable = false;
        }
        field(6; "No of Constituencies"; Integer)
        {
            CalcFormula = Count(Constituency WHERE("Region Code" = FIELD("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Financial Year Code"; Code[20])
        {
            TableRelation ="G/L Budget Name";

           //TableRelation = "Financial Year Code".Code;

            trigger OnValidate()
            Var
            CompanyInfo: Record "Company Information";
            begin
                IF "Workplan Type" = "Workplan Type"::Regional THEN BEGIN
                    ResponsibilityCenter.RESET;
                    ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Responsibility Center");
                    IF ResponsibilityCenter.FINDSET THEN
                        "Workplan Ref No" := UPPERCASE(ResponsibilityCenter.Name) + '/' + "Financial Year Code" + '/' + 'WKPLAN' + '/' + FORMAT(ResponsibilityCenter."No of RAM Workplans" + 1);
                END;



                IF "Workplan Type" = "Workplan Type"::Consolidated THEN BEGIN
                    "Workplan Ref No" := 'CONS' + '/' + 'WKPLAN' + '/' + "Financial Year Code";
                    CompanyInfo.Get();
                    Description := CompanyInfo.Name + ' CONSOLIDATED ROAD MAINTENANCE WORKPLAN FOR FINANCIAL YEAR' + ' ' + "Financial Year Code";
                END;


                VALIDATE("Funding Source Type");
            end;
        }
        field(8; "Budget Ceiling Amount"; Decimal)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(9; "Total Workplan Amount"; Decimal)
        {
            CalcFormula = Sum("Work Plan Bill Item"."Line Amount Incl. VAT" WHERE("Workplan No" = FIELD("Document No"),
                                                                                   "Workplan Type" = FIELD("Workplan Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "No of Funding Sources"; Integer)
        {
            CalcFormula = Count("Road G/L budget Setup" WHERE("G/L Account No." = FIELD("Document No"),
                                                               "Workplan Type" = FIELD("Workplan Type"),
                                                              "FY Code" = FIELD("Financial Year Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Budget Ceiling Amount(22%)"; Decimal)
        {

            Editable = false;
        }
        field(12; "No Series."; Code[50])
        {

        }
        field(13; "No of Projects"; Integer)
        {
            CalcFormula = Count("RAM Workplan Line" WHERE("Document No" = FIELD("Document No"),
                                                           "Workplan Type" = FIELD("Workplan Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "No of Projects(22%)"; Integer)
        {
            CalcFormula = Count("RAM Workplan Line" WHERE("Document No" = FIELD("Document No"),
                                                           "Workplan Type" = FIELD("Workplan Type"),
                                                           "Global Dimension 2 Code" = FIELD("Global Dimension 2 Code (2)")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Global Dimension 2 Code (1)"; Code[40])
        {
            CaptionClass = '1,2,2';
            Caption = 'Global Dimension 2 Code';

            TableRelation = "Road G/L budget Setup"."Global Dimension 2" WHERE("FY Code" = FIELD("Financial Year Code"));

            trigger OnValidate()
            begin
                // CALCFIELDS("No of Constituencies");
                // RoadGLbudgetSetup.RESET;
                // RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Global Dimension 2","Global Dimension 2 Code (1)");
                // IF RoadGLbudgetSetup.FINDSET THEN BEGIN
                //  "Budget Ceiling Amount":=RoadGLbudgetSetup."Allocation per Constituency";
                // END;
                // "Budget Ceiling Amount":="Budget Ceiling Amount"*"No of Constituencies";
            end;
        }
        field(16; "Global Dimension 2 Code (2)"; Code[40])
        {
            CaptionClass = '1,2,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Road G/L budget Setup"."Global Dimension 2" WHERE("FY Code" = FIELD("Financial Year Code"));

            trigger OnValidate()
            begin
                // CALCFIELDS("No of Constituencies");
                // RoadGLbudgetSetup.RESET;
                // RoadGLbudgetSetup.SETRANGE(RoadGLbudgetSetup."Global Dimension 2","Global Dimension 2 Code (2)");
                // IF RoadGLbudgetSetup.FINDSET THEN BEGIN
                //  "Budget Ceiling Amount(22%)":=RoadGLbudgetSetup."Allocation per Constituency";
                // END;
                //
                // "Budget Ceiling Amount(22%)":="Budget Ceiling Amount(22%)"*"No of Constituencies";
            end;
        }
        field(17; "Created By"; Code[50])
        {

            Editable = false;
        }
        field(18; "Created DateTime"; DateTime)
        {

            Editable = false;
        }
        field(19; "Regional Director No"; Code[20])
        {

            Editable = false;
        }
        field(20; "Regional Director Name"; Text[300])
        {

            Editable = false;
        }
        field(21; "Road Planner No"; Code[30])
        {

            TableRelation = Resource."No." WHERE("Road Planner" = CONST(true));
            //"Region ID" = FIELD("Global Dimension 1 Code"));

            trigger OnValidate()
            begin
                Resource.RESET();
                Resource.SETRANGE("No.", Rec."Road Planner No");
                IF Resource.FindFirst() THEN
                    Rec."Road Planner Name" := Resource.Name;
            end;
        }
        field(22; "Road Planner Name"; Text[300])
        {

            Editable = false;
        }
        field(23; "Submission Status"; Option)
        {

            Editable = false;
            OptionCaption = 'Draft,Submitted';
            OptionMembers = Draft,Submitted;
        }
        field(24; Consolidated; Boolean)
        {
            Editable=false;
        }
        field(25; "Workplan Type"; Enum "WorkPlan Type")
        {
            // OptionCaption = 'Constituency,Regional,Consolidated,Consolidated East,Consolidated West';
            // OptionMembers = Constituency,Regional,Consolidated,"Consolidated East","Consolidated West";
        }
        field(26; "County Code"; Code[30])
        {

            Editable = false;
        }
        field(27; "Consolidated Workplan No"; Code[50])
        {

            TableRelation = "RAM Workplan Header"."Document No" WHERE("Workplan Type" = FILTER(Consolidated),
                                                                       "Financial Year Code" = FIELD("Financial Year Code"));
        }
        field(28; Status; Option)
        {

            Editable = false;
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
        }
        field(29; "Responsibility Center"; Code[20])
        {

        }
        field(30; "Workplan No"; Integer)
        {

            Description = 'Keep count of no of workplans submitted per region';
            Editable = false;
        }
        field(31; "Workplan Ref No"; Code[50])
        {

            Description = 'Reference No based on KeRRA Workplan Numbering';
        }
        field(32; "Director No"; Code[20])
        {

            Editable = false;
        }
        field(33; "Director Name"; Text[300])
        {

            Editable = false;
        }
        field(34; "No of Regional Workplans"; Integer)
        {

        }
        field(36; "Recall Expiry Date"; Date)
        {

            Editable = false;
        }
        field(37; "Constituency Code"; Code[20])
        {

            TableRelation = Constituency.Code WHERE(Blocked = FILTER(false),
                                                     "Region Code" = FIELD("Global Dimension 1 Code"));

            trigger OnValidate()
            begin
                Constituency.RESET;
                Constituency.SETRANGE(Constituency.Code, "Constituency Code");
                IF Constituency.FINDSET THEN
                    "Constituency Name" := Constituency.Description;

                VALIDATE("Funding Source Type");

                IF "Workplan Type" = "Workplan Type"::Constituency THEN BEGIN
                    Constituency.RESET;
                    Constituency.SETRANGE(Constituency.Code, "Constituency Code");
                    IF Constituency.FINDSET THEN BEGIN
                        "Workplan No" := Constituency."No of Workplans" + 1;
                    END;
                END;
                IF "Workplan Type" = "Workplan Type"::Constituency THEN BEGIN
                    Constituency.RESET;
                    Constituency.SETRANGE(Constituency.Code, "Constituency Code");
                    IF Constituency.FINDSET THEN
                        "Workplan Ref No" := UPPERCASE(Constituency.Description) + '/' + "Financial Year Code" + '/' + 'WKPLAN' + '/' + FORMAT(Constituency."No of Workplans" + 1);
                END;
            end;
        }
        field(38; "Constituency Name"; Text[250])
        {

            Editable = false;
        }
        field(39; "Global Dimension 2 Code"; Code[50])
        {
            CaptionClass = '1,2,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = FILTER(2));

            trigger OnValidate()
            begin
                VALIDATE("Funding Source Type");
            end;
        }
        field(40; "Funding Source Type"; Option)
        {

            OptionCaption = ' ,Regular,Savings';
            OptionMembers = " ",Regular,Savings;

            trigger OnValidate()
            begin
                case Rec."Workplan Type" of
                    Rec."Workplan Type"::Town:
                        begin
                            RoadWorksCeilingDetailedLine.RESET();
                            RoadWorksCeilingDetailedLine.SETRANGE("Financial Year", Rec."Financial Year Code");
                            RoadWorksCeilingDetailedLine.SETRANGE("Funding Source Code", Rec."Global Dimension 2 Code");
                            RoadWorksCeilingDetailedLine.SETRANGE("Funding Source Type", Rec."Funding Source Type");
                            RoadWorksCeilingDetailedLine.SETRANGE("Region Code", Rec."Global Dimension 1 Code");
                            RoadWorksCeilingDetailedLine.SetRange(Town, Rec."Shortcut Dimension 5 Code");
                            IF RoadWorksCeilingDetailedLine.FindSet() THEN BEGIN
                                RoadWorksCeilingDetailedLine.CALCSUMS(RoadWorksCeilingDetailedLine."Town Allocation(KES)");
                                "Budget Ceiling Amount" := RoadWorksCeilingDetailedLine."Town Allocation(KES)";
                            END;
                        end;
                    Rec."Workplan Type"::Regional:
                        begin
                                  RoadWorksCeilingDetailedLine.RESET;
                                  RoadWorksCeilingDetailedLine.SETRANGE("Financial Year", "Financial Year Code");
                                  RoadWorksCeilingDetailedLine.SETRANGE("Funding Source Code", "Global Dimension 2 Code");
                                  RoadWorksCeilingDetailedLine.SETRANGE("Funding Source Type", "Funding Source Type");
                                  RoadWorksCeilingDetailedLine.SETRANGE("Region Code", "Global Dimension 1 Code");
                                  IF RoadWorksCeilingDetailedLine.FINDSET THEN BEGIN
                                      RoadWorksCeilingDetailedLine.CALCSUMS("Town Allocation(KES)");
                                      "Budget Ceiling Amount" := RoadWorksCeilingDetailedLine."Town Allocation(KES)";
                                  END;
                              end;
                    Rec."Workplan Type"::Consolidated:
                        begin
                            RoadWorksCeilingDetailedLine.RESET;
                            RoadWorksCeilingDetailedLine.SETRANGE("Financial Year", "Financial Year Code");
                            RoadWorksCeilingDetailedLine.SETRANGE("Funding Source Code", "Global Dimension 2 Code");
                            RoadWorksCeilingDetailedLine.SETRANGE("Funding Source Type", "Funding Source Type");
                                  IF RoadWorksCeilingDetailedLine.FINDSET THEN BEGIN
                                      RoadWorksCeilingDetailedLine.CALCSUMS(RoadWorksCeilingDetailedLine."Town Allocation(KES)");
                                      "Budget Ceiling Amount" := RoadWorksCeilingDetailedLine."Town Allocation(KES)";
                                  END;
                              end;
                end;


                //Populate RAM WPlan Lines
                //Populate WPlan Project Roadlinks
                //Populate BOQ
                //Populate BoQ Atcivities
                // IF "Version Type"="Version Type"::Revision THEN BEGIN
                // CashManagementSetup.GET();
                // RMSManagement.FnPopulateRevisionWorkplanForAmmendment(Rec,CashManagementSetup."Current APRP Code");
                // END;
            end;
        }
        field(41; "Regional Workplan No."; Code[50])
        {

            TableRelation = "RAM Workplan Header"."Document No" WHERE("Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                                                                       "Workplan Type" = FILTER(Regional),
                                                                       "Financial Year Code" = FIELD("Financial Year Code"));
        }
        field(42; "East Workplan No."; Code[50])
        {

            TableRelation = "RAM Workplan Header"."Document No" WHERE("Workplan Type" = FILTER("Consolidated East"),
                                                                       "Financial Year Code" = FIELD("Financial Year Code"));
        }
        field(43; "West Workplan No."; Code[50])
        {

            TableRelation = "RAM Workplan Header"."Document No" WHERE("Workplan Type" = FILTER("Consolidated West"),
                                                                       "Financial Year Code" = FIELD("Financial Year Code"));
        }
        field(44; "Consolidate To"; Option)
        {

            OptionCaption = ' ,East,West';
            OptionMembers = " ",East,West;
        }
        field(45; "Type of Workplan"; Option)
        {

            OptionCaption = ' ,Budgeted,Proposed';
            OptionMembers = " ",Budgeted,Proposed;
        }
        field(46; "Version Type"; Option)
        {

            Editable = false;
            InitValue = Original;
            OptionCaption = ' ,Original,Revision';
            OptionMembers = " ",Original,Revision;
        }
        field(47; "Version No."; Code[100])
        {

        }
        field(48; "Assign To"; Code[100])
        {

            TableRelation = "User Setup"."User ID";
        }
        field(49; "Assignment Remarks"; Text[1500])
        {

        }
        field(50; "Shortcut Dimension 5 Code"; Code[20])
        {
             //CaptionClass = '1,2,5';
            Caption = 'Urban Area Code';
            TableRelation = Towns.Code where("Region Code"=field("Global Dimension 1 Code"));
            // TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
            //                                               Blocked = CONST(false));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
          field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions();
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
    }

    keys
    {
        key(Key1; "Document No", "Workplan Type")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By" := USERID;
        IF "Document No" = '' THEN BEGIN
            IF "Workplan Type" = "Workplan Type"::Regional THEN BEGIN
                RoadManagementSetup.GET;
                RoadManagementSetup.TESTFIELD(RoadManagementSetup."RAM Workplan Nos(Regional)");
                NSeriesMgt.InitSeries(RoadManagementSetup."RAM Workplan Nos(Regional)", xRec."No Series.", 0D, "Document No", "No Series.");
            END;
             IF "Workplan Type" = "Workplan Type"::Town THEN BEGIN
                RoadManagementSetup.GET;
                RoadManagementSetup.TESTFIELD(RoadManagementSetup."RAM Workplan Nos(Towns)");
                NSeriesMgt.InitSeries(RoadManagementSetup."RAM Workplan Nos(Towns)", xRec."No Series.", 0D, "Document No", "No Series.");
            END;
        END;

        IF "Document No" = '' THEN BEGIN
            IF "Workplan Type" = "Workplan Type"::Consolidated THEN BEGIN
                RoadManagementSetup.GET;
                RoadManagementSetup.TESTFIELD(RoadManagementSetup."RAM Workplan Nos(Consolidated)");
                NSeriesMgt.InitSeries(RoadManagementSetup."RAM Workplan Nos(Consolidated)", xRec."No Series.", 0D, "Document No", "No Series.");
            END;
        END;

        IF "Document No" = '' THEN BEGIN
            IF "Workplan Type" = "Workplan Type"::Constituency THEN BEGIN
                RoadManagementSetup.GET;
                RoadManagementSetup.TESTFIELD(RoadManagementSetup."RAM Workplan Nos(Constituency)");
                NSeriesMgt.InitSeries(RoadManagementSetup."RAM Workplan Nos(Constituency)", xRec."No Series.", 0D, "Document No", "No Series.");
            END;
        END;

        IF "Document No" = '' THEN BEGIN
            IF "Workplan Type" = "Workplan Type"::"Consolidated West" THEN BEGIN
                RoadManagementSetup.GET;
                RoadManagementSetup.TESTFIELD(RoadManagementSetup."RAM Workplan Nos(Consol West)");
                NSeriesMgt.InitSeries(RoadManagementSetup."RAM Workplan Nos(Consol West)", xRec."No Series.", 0D, "Document No", "No Series.");
            END;
        END;

        IF "Document No" = '' THEN BEGIN
            IF "Workplan Type" = "Workplan Type"::"Consolidated East" THEN BEGIN
                RoadManagementSetup.GET;
                RoadManagementSetup.TESTFIELD(RoadManagementSetup."RAM Workplan Nos(Consol East)");
                NSeriesMgt.InitSeries(RoadManagementSetup."RAM Workplan Nos(Consol East)", xRec."No Series.", 0D, "Document No", "No Series.");
            END;
        END;

        "Document Date" := TODAY;

        "Created DateTime" := CURRENTDATETIME;
        "Submission Status" := "Submission Status"::Draft;


        IF "Workplan Type" = "Workplan Type"::Regional THEN BEGIN
            ResponsibilityCenter.RESET;
            ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Responsibility Center");
            IF ResponsibilityCenter.FINDSET THEN BEGIN
                "Workplan No" := ResponsibilityCenter."No of RAM Workplans" + 1;
            END;
        END;

        IF "Workplan Type" = "Workplan Type"::Consolidated THEN BEGIN
            Employee.RESET;
            Employee.SETRANGE(Employee."Directorate Code", 'DIR004');
            Employee.SETRANGE(Employee."Directorate Head", TRUE);
            IF Employee.FINDSET THEN BEGIN
                "Director No" := Employee."No.";
                "Director Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            END;
        END;

        // IF "Workplan Type"="Workplan Type"::Constituency THEN BEGIN
        // ResponsibilityCenter.RESET;
        // ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code,"Responsibility Center");
        // ResponsibilityCenter.SETRANGE("Operating Unit Type",ResponsibilityCenter."Operating Unit Type"::Constituency);
        // IF ResponsibilityCenter.FINDSET THEN BEGIN
        // "Workplan No":=ResponsibilityCenter."No of RAM Workplans"+1;
        // END;
        // END;
        IF "Workplan Type" = "Workplan Type"::Regional THEN BEGIN
            ResponsibilityCenter.RESET;
            ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Responsibility Center");
            IF ResponsibilityCenter.FINDSET THEN
                "Workplan Ref No" := UPPERCASE(ResponsibilityCenter.Name) + '/' + "Financial Year Code" + '/' + 'WKPLAN' + '/' + FORMAT(ResponsibilityCenter."No of RAM Workplans" + 1);
        END;
        IF UserSetup.GET(USERID) THEN BEGIN
            "Responsibility Center" := UserSetup."Responsibility Center";
            "Global Dimension 1 Code" := UserSetup."Region Code";
            VALIDATE("Global Dimension 1 Code");
            Rec.Validate("Road Planner No", UserSetup."Resource No");
        END;
    end;

    var
        NSeriesMgt: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        Employee: Record Employee;
        Resource: Record Resource;
        ResponsibilityCenter: Record "Responsibility Center";
        Constituency: Record Constituency;
        RoadGLbudgetSetup: Record "Road G/L budget Setup";
        UserSetup: Record "User Setup";
        RoadWorksBudgetCeilings: Record "Road Works Budget Ceilings";
        RoadWorksCeilingDetailedLine: Record "RoadWorks Ceiling DetailedLine";
        RMSManagement: Codeunit "RMS Management";
        CashManagementSetup: Record "Cash Management Setup";
         DimMgt: Codeunit DimensionManagement;


        
        
          procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;
     procedure ShowDimensions() IsChanged: Boolean
    var
        OldDimSetID: Integer;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1', "Document No"));
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Global Dimension 2 Code");
        IsChanged := OldDimSetID <> "Dimension Set ID";

    end;
}

