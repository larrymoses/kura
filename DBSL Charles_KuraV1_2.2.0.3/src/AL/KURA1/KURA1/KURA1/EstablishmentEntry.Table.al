#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69266 "Establishment Entry"
{
    Caption = 'Establishment Entry';
    DrillDownPageID = "Establishment Entries";
    LookupPageID = "Establishment Entries";
    Permissions = TableData "Analysis View Budget Entry" = rd;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Establishment Name"; Code[10])
        {
            TableRelation = "Staff Establishment Header";
        }
        field(3; "Position Id"; Code[20])
        {
            TableRelation = Positions;
        }
        field(4; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                if "Global Dimension 2 Code" = xRec."Global Dimension 2 Code" then
                    exit;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 1 Code", "Global Dimension 2 Code");
                UpdateDimensionSetId(GLSetup."Global Dimension 1 Code", "Global Dimension 2 Code");
            end;
        }
        field(5; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                if "Approved Head Count" = xRec."Approved Head Count" then
                    exit;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
                UpdateDimensionSetId(GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
            end;
        }
        field(6; "Approved Head Count"; Integer)
        {
            AutoFormatType = 1;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Duty Station"; Code[20])
        {
            TableRelation = "Business Unit";
        }
        field(9; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //UserMgt.LookupUserID("User ID");
            end;
        }
        field(10; "Esta Dimension 1 Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;

            trigger OnLookup()
            begin
                "Esta Dimension 1 Code" := OnLookupDimCode(2, "Esta Dimension 1 Code");
                ValidateDimValue(GLBudgetName."Esta Dimension 1 Code", "Esta Dimension 1 Code");
                UpdateDimensionSetId(GLBudgetName."Esta Dimension 1 Code", "Esta Dimension 1 Code");
            end;

            trigger OnValidate()
            begin
                if "Esta Dimension 1 Code" = xRec."Esta Dimension 1 Code" then
                    exit;
                if GLBudgetName.Code <> "Establishment Name" then
                    GLBudgetName.Get("Establishment Name");
                ValidateDimValue(GLBudgetName."Esta Dimension 1 Code", "Esta Dimension 1 Code");
                UpdateDimensionSetId(GLBudgetName."Esta Dimension 1 Code", "Esta Dimension 1 Code");
            end;
        }
        field(11; "Esta  Dimension 2 Code"; Code[20])
        {
            AccessByPermission = TableData Dimension = R;

            trigger OnLookup()
            begin
                "Esta  Dimension 2 Code" := OnLookupDimCode(3, "Esta  Dimension 2 Code");
                ValidateDimValue(GLBudgetName."Esta Dimension 2 Code", "Esta  Dimension 2 Code");
                UpdateDimensionSetId(GLBudgetName."Esta Dimension 2 Code", "Esta  Dimension 2 Code");
            end;

            trigger OnValidate()
            begin
                if "Esta  Dimension 2 Code" = xRec."Esta  Dimension 2 Code" then
                    exit;
                if GLBudgetName.Code <> "Establishment Name" then
                    GLBudgetName.Get("Establishment Name");
                ValidateDimValue(GLBudgetName."Esta Dimension 2 Code", "Esta  Dimension 2 Code");
                UpdateDimensionSetId(GLBudgetName."Esta Dimension 2 Code", "Esta  Dimension 2 Code");
            end;
        }
        field(12; "Esta  Dimension 3 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;

            trigger OnLookup()
            begin
                "Esta Dimension 4 Code" := OnLookupDimCode(4, "Esta Dimension 4 Code");
                ValidateDimValue(GLBudgetName."Esta Dimension 3 Code", "Esta  Dimension 3 Code");
                UpdateDimensionSetId(GLBudgetName."Esta Dimension 3 Code", "Esta  Dimension 3 Code");
            end;

            trigger OnValidate()
            begin
                if "Esta  Dimension 3 Code" = xRec."Esta  Dimension 3 Code" then
                    exit;
                if GLBudgetName.Code <> "Establishment Name" then
                    GLBudgetName.Get("Establishment Name");
                ValidateDimValue(GLBudgetName."Esta Dimension 3 Code", "Esta  Dimension 3 Code");
                UpdateDimensionSetId(GLBudgetName."Esta Dimension 3 Code", "Esta  Dimension 3 Code");
            end;
        }
        field(13; "Esta Dimension 4 Code"; Code[20])
        {
            AccessByPermission = TableData "Dimension Combination" = R;

            trigger OnLookup()
            begin
                "Esta Dimension 4 Code" := OnLookupDimCode(5, "Esta Dimension 4 Code");
                ValidateDimValue(GLBudgetName."Esta Dimension 4 Code", "Esta Dimension 4 Code");
                UpdateDimensionSetId(GLBudgetName."Esta Dimension 4 Code", "Esta Dimension 4 Code");
            end;

            trigger OnValidate()
            begin
                if "Esta Dimension 4 Code" = xRec."Esta Dimension 4 Code" then
                    exit;
                if GLBudgetName.Code <> "Establishment Name" then
                    GLBudgetName.Get("Establishment Name");
                ValidateDimValue(GLBudgetName."Esta Dimension 4 Code", "Esta Dimension 4 Code");
                UpdateDimensionSetId(GLBudgetName."Esta Dimension 4 Code", "Esta Dimension 4 Code");
            end;
        }
        field(14; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(15; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                ShowDimensions;
            end;

            trigger OnValidate()
            begin
                if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                    Error(DimMgt.GetDimCombErr);
            end;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        CheckIfBlocked;
        DeleteAnalysisViewBudgetEntries;
    end;

    trigger OnInsert()
    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        CheckIfBlocked;
        TestField("Global Dimension 1 Code");
        TestField("Position Id");
        TestField("Establishment Name");
        LockTable;
        "Esta  Dimension 2 Code" := UserId;
        "Last Date Modified" := Today;
        if "Entry No." = 0 then
            "Entry No." := GetNextEntryNo;

        GetGLSetup;
        DimMgt.GetDimensionSet(TempDimSetEntry, "Dimension Set ID");
        UpdateDimSet(TempDimSetEntry, GLSetup."Global Dimension 1 Code", "Global Dimension 1 Code");
        UpdateDimSet(TempDimSetEntry, GLSetup."Global Dimension 2 Code", "Global Dimension 2 Code");
        UpdateDimSet(TempDimSetEntry, GLBudgetName."Esta Dimension 1 Code", "Esta Dimension 1 Code");
        UpdateDimSet(TempDimSetEntry, GLBudgetName."Esta Dimension 2 Code", "Esta  Dimension 2 Code");
        UpdateDimSet(TempDimSetEntry, GLBudgetName."Esta Dimension 3 Code", "Esta  Dimension 3 Code");
        UpdateDimSet(TempDimSetEntry, GLBudgetName."Esta Dimension 4 Code", "Esta Dimension 4 Code");
        OnInsertOnAfterUpdateDimSets(TempDimSetEntry, Rec);
        Validate("Dimension Set ID", DimMgt.GetDimensionSetID(TempDimSetEntry));
    end;

    trigger OnModify()
    begin
        CheckIfBlocked;
        "Esta  Dimension 2 Code" := UserId;
        "Last Date Modified" := Today;
    end;

    var
        Text000: label 'The dimension value %1 has not been set up for dimension %2.';
        Text001: label '1,5,,Budget Dimension 1 Code';
        Text002: label '1,5,,Budget Dimension 2 Code';
        Text003: label '1,5,,Budget Dimension 3 Code';
        Text004: label '1,5,,Budget Dimension 4 Code';
        GLBudgetName: Record "Staff Establishment Header";
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        DimMgt: Codeunit DimensionManagement;
        GLSetupRetrieved: Boolean;
        Text57021: label 'The budget line has commited entries and thefore cannot be deleted.';
        AnalysisViewBudgetEntryExistsErr: label 'You cannot change the amount on this G/L budget entry because one or more related analysis view budget entries exist.\\You must make the change on the related entry in the G/L Budget window.';

    local procedure CheckIfBlocked()
    begin
        if "Establishment Name" = GLBudgetName.Code then
            exit;
        if GLBudgetName.Code <> "Establishment Name" then
            GLBudgetName.Get("Establishment Name");
        GLBudgetName.TestField(Active, true);
    end;

    local procedure ValidateDimValue(DimCode: Code[20]; var DimValueCode: Code[20])
    var
        DimValue: Record "Dimension Value";
    begin
        if DimValueCode = '' then
            exit;

        DimValue."Dimension Code" := DimCode;
        DimValue.Code := DimValueCode;
        DimValue.Find('=><');
        if DimValueCode <> CopyStr(DimValue.Code, 1, StrLen(DimValueCode)) then
            Error(Text000, DimValueCode, DimCode);
        DimValueCode := DimValue.Code;
    end;

    local procedure GetGLSetup()
    begin
        if not GLSetupRetrieved then begin
            GLSetup.Get;
            GLSetupRetrieved := true;
        end;
    end;

    local procedure OnLookupDimCode(DimOption: Option "Global Dimension 1","Global Dimension 2","Budget Dimension 1","Budget Dimension 2","Budget Dimension 3","Budget Dimension 4"; DefaultValue: Code[20]): Code[20]
    var
        DimValue: Record "Dimension Value";
    // DimValueList: Page "Dimension Value List";
    begin
        if DimOption in [Dimoption::"Global Dimension 1", Dimoption::"Global Dimension 2"] then
            GetGLSetup
        else
            if GLBudgetName.Code <> "Establishment Name" then
                GLBudgetName.Get("Establishment Name");
        case DimOption of
            Dimoption::"Global Dimension 1":
                DimValue."Dimension Code" := GLSetup."Global Dimension 1 Code";
            Dimoption::"Global Dimension 2":
                DimValue."Dimension Code" := GLSetup."Global Dimension 2 Code";
            Dimoption::"Budget Dimension 1":
                DimValue."Dimension Code" := GLSetup."Shortcut Dimension 1 Code";
            Dimoption::"Budget Dimension 2":
                DimValue."Dimension Code" := GLSetup."Shortcut Dimension 2 Code";
            Dimoption::"Budget Dimension 3":
                DimValue."Dimension Code" := GLSetup."Shortcut Dimension 3 Code";
            Dimoption::"Budget Dimension 4":
                DimValue."Dimension Code" := GLSetup."Shortcut Dimension 4 Code";
        end;
        DimValue.SetRange("Dimension Code", DimValue."Dimension Code");
        if DimValue.Get(DimValue."Dimension Code", DefaultValue) then;
        // DimValueList.SetTableview(DimValue);
        // DimValueList.SetRecord(DimValue);
        // DimValueList.LookupMode := true;
        // if DimValueList.RunModal = Action::LookupOK then begin
        //     DimValueList.GetRecord(DimValue);
        exit(DimValue.Code);
    end;
    //exit(DefaultValue);
    //end;

    local procedure GetNextEntryNo(): Integer
    var
        GLBudgetEntry: Record "G/L Budget Entry";
    begin
        GLBudgetEntry.SetCurrentkey("Entry No.");
        if GLBudgetEntry.FindLast then
            exit(GLBudgetEntry."Entry No." + 1);

        exit(1);
    end;

    procedure GetCaptionClass(BudgetDimType: Integer): Text[250]
    begin
        if GetFilter("Establishment Name") <> '' then begin
            GLBudgetName.SetFilter(Code, GetFilter("Establishment Name"));
            if not GLBudgetName.FindFirst then
                Clear(GLBudgetName);
        end;
        case BudgetDimType of
            1:
                begin
                    if GLBudgetName.Code <> '' then
                        exit('1,5,' + GLBudgetName.Code);

                    exit(Text001);
                end;
            2:
                begin
                    if GLBudgetName.Code <> '' then
                        exit('1,5,' + GLBudgetName.Code);

                    exit(Text002);
                end;
            3:
                begin
                    if GLBudgetName.Code <> '' then
                        exit('1,5,' + GLBudgetName.Code);

                    exit(Text003);
                end;
            4:
                begin
                    if GLBudgetName.Code <> '' then
                        exit('1,5,' + GLBudgetName.Code);

                    exit(Text004);
                end;
        end;
    end;

    procedure ShowDimensions()
    var
        DimSetEntry: Record "Dimension Set Entry";
        OldDimSetID: Integer;
    begin
        OldDimSetID := "Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            "Dimension Set ID", StrSubstNo('%1 %2 %3', "Establishment Name", "Position Id", "Entry No."));

        if OldDimSetID = "Dimension Set ID" then
            exit;

        GetGLSetup;
        GLBudgetName.Get("Establishment Name");

        "Global Dimension 2 Code" := '';
        "Global Dimension 1 Code" := '';
        "Esta  Dimension 3 Code" := '';
        "Esta Dimension 4 Code" := '';
        "Esta  Dimension 2 Code" := '';
        "Esta Dimension 1 Code" := '';

        if DimSetEntry.Get("Dimension Set ID", GLSetup."Global Dimension 1 Code") then
            "Global Dimension 1 Code" := DimSetEntry."Dimension Value Code";
        if DimSetEntry.Get("Dimension Set ID", GLSetup."Global Dimension 2 Code") then
            "Global Dimension 2 Code" := DimSetEntry."Dimension Value Code";
        /*
        IF DimSetEntry.GET("Dimension Set ID",GLBudgetName."Budget Dimension 1 Code") THEN
          "Esta Dimension 1 Code" := DimSetEntry."Dimension Value Code";
        IF DimSetEntry.GET("Dimension Set ID",GLBudgetName."Budget Dimension 2 Code") THEN
          "Esta  Dimension 2 Code" := DimSetEntry."Dimension Value Code";
        IF DimSetEntry.GET("Dimension Set ID",GLBudgetName."Budget Dimension 3 Code") THEN
          "Esta  Dimension 3 Code" := DimSetEntry."Dimension Value Code";
        IF DimSetEntry.GET("Dimension Set ID",GLBudgetName."Budget Dimension 4 Code") THEN
          "Esta Dimension 4 Code" := DimSetEntry."Dimension Value Code";
        */

        OnAfterShowDimensions(Rec);

    end;

    procedure UpdateDimSet(var TempDimSetEntry: Record "Dimension Set Entry" temporary; DimCode: Code[20]; DimValueCode: Code[20])
    begin
        if DimCode = '' then
            exit;
        if TempDimSetEntry.Get("Dimension Set ID", DimCode) then
            TempDimSetEntry.Delete;
        if DimValueCode = '' then
            DimVal.Init
        else
            DimVal.Get(DimCode, DimValueCode);
        TempDimSetEntry.Init;
        TempDimSetEntry."Dimension Set ID" := "Dimension Set ID";
        TempDimSetEntry."Dimension Code" := DimCode;
        TempDimSetEntry."Dimension Value Code" := DimValueCode;
        TempDimSetEntry."Dimension Value ID" := DimVal."Dimension Value ID";
        TempDimSetEntry.Insert;
    end;

    local procedure UpdateDimensionSetId(DimCode: Code[20]; DimValueCode: Code[20])
    var
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        DimMgt.GetDimensionSet(TempDimSetEntry, "Dimension Set ID");
        UpdateDimSet(TempDimSetEntry, DimCode, DimValueCode);
        OnAfterUpdateDimensionSetId(TempDimSetEntry, Rec, xRec);
        "Dimension Set ID" := DimMgt.GetDimensionSetID(TempDimSetEntry);
    end;

    local procedure DeleteAnalysisViewBudgetEntries()
    var
        AnalysisViewBudgetEntry: Record "Analysis View Budget Entry";
    begin
        AnalysisViewBudgetEntry.SetRange("Budget Name", "Establishment Name");
        AnalysisViewBudgetEntry.SetRange("Entry No.", "Entry No.");
        AnalysisViewBudgetEntry.DeleteAll;
    end;

    local procedure VerifyNoRelatedAnalysisViewBudgetEntries(GLBudgetEntry: Record "G/L Budget Entry")
    var
        AnalysisViewBudgetEntry: Record "Analysis View Budget Entry";
    begin
        AnalysisViewBudgetEntry.SetRange("Budget Name", GLBudgetEntry."Budget Name");
        AnalysisViewBudgetEntry.SetRange("G/L Account No.", GLBudgetEntry."G/L Account No.");
        AnalysisViewBudgetEntry.SetRange("Posting Date", GLBudgetEntry.Date);
        AnalysisViewBudgetEntry.SetRange("Business Unit Code", GLBudgetEntry."Business Unit Code");
        if not AnalysisViewBudgetEntry.IsEmpty then
            Error(AnalysisViewBudgetEntryExistsErr);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterShowDimensions(var EstablishmentEntry: Record "Establishment Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdateDimensionSetId(var TempDimensionSetEntry: Record "Dimension Set Entry" temporary; var GLBudgetEntry: Record "Establishment Entry"; xGLBudgetEntry: Record "Establishment Entry")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnInsertOnAfterUpdateDimSets(var TempDimensionSetEntry: Record "Dimension Set Entry" temporary; var GLBudgetEntry: Record "Establishment Entry")
    begin
    end;
}

