#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72270 "New Job Voucher Task"
{
    Caption = 'Contractor Payment Request Task';
    DrillDownPageID = "Contractor Request Tasks";
    LookupPageID = "Contractor Request Tasks";

    fields
    {
        field(1; "Job No."; Code[40])
        {
            Caption = 'Job No.';
            Editable = true;
        }
        field(2; "Job Task No."; Code[20])
        {
            Caption = 'Job Task No.';

            trigger OnValidate()
            var
                Job: Record Job;
                Cust: Record Customer;
            begin
                // IF "Job Task No." = '' THEN
                //  EXIT;
                // Job.GET("Job No.");
                // Job.TESTFIELD("Bill-to Customer No.");
                // Cust.GET(Job."Bill-to Customer No.");
                // "Job Posting Group" := Job."Job Posting Group";
            end;
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; "Job Task Type"; Option)
        {
            Caption = 'Job Task Type';
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";

            trigger OnValidate()
            begin
                // IF (xRec."Job Task Type" = "Job Task Type"::Posting) AND
                //   ("Job Task Type" <> "Job Task Type"::Posting)
                // THEN
                //  IF JobLedgEntriesExist OR JobPlanningLinesExist THEN
                //    ERROR(CannotChangeAssociatedEntriesErr,FIELDCAPTION("Job Task Type"),TABLECAPTION);
                //
                // IF "Job Task Type" <> "Job Task Type"::Posting THEN BEGIN
                //  "Job Posting Group" := '';
                //  IF "WIP-Total" = "WIP-Total"::Excluded THEN
                //    "WIP-Total" := "WIP-Total"::" ";
                // END;
                //
                // Totaling := '';
            end;
        }
        field(6; "WIP-Total"; Option)
        {
            Caption = 'WIP-Total';
            OptionCaption = ' ,Total,Excluded';
            OptionMembers = " ",Total,Excluded;

            trigger OnValidate()
            var
                Job: Record Job;
            begin
                // CASE "WIP-Total" OF
                //  "WIP-Total"::Total:
                //    BEGIN
                //      Job.GET("Job No.");
                //      "WIP Method" := Job."WIP Method";
                //    END;
                //  "WIP-Total"::Excluded:
                //    BEGIN
                //      TESTFIELD("Job Task Type","Job Task Type"::Posting);
                //      "WIP Method" := ''
                //    END;
                //  ELSE
                //    "WIP Method" := ''
                // END;
            end;
        }
        field(7; "Job Posting Group"; Code[20])
        {
            Caption = 'Job Posting Group';
            TableRelation = "Job Posting Group";

            trigger OnValidate()
            begin
                // IF "Job Posting Group" <> '' THEN
                //  TESTFIELD("Job Task Type","Job Task Type"::Posting);
            end;
        }
        field(9; "WIP Method"; Code[20])
        {
            Caption = 'WIP Method';
            TableRelation = "Job WIP Method".Code where(Valid = const(true));

            trigger OnValidate()
            begin
                // IF "WIP Method" <> '' THEN
                //  TESTFIELD("WIP-Total","WIP-Total"::Total);
            end;
        }
        field(10; "Schedule (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Job No." = field("Job No."),
                                                                            "Job Task No." = field("Job Task No."),
                                                                            "Job Task No." = field(filter(Totaling)),
                                                                            "Schedule Line" = const(true),
                                                                            "Planning Date" = field("Planning Date Filter")));
            Caption = 'Budget (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Schedule (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Job Planning Line"."Line Amount (LCY)" where("Job No." = field("Job No."),
                                                                             "Job Task No." = field("Job Task No."),
                                                                             "Job Task No." = field(filter(Totaling)),
                                                                             "Schedule Line" = const(true),
                                                                             "Planning Date" = field("Planning Date Filter")));
            Caption = 'Budget (Total Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Usage (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Job No." = field("Job No."),
                                                                           "Job Task No." = field("Job Task No."),
                                                                           "Job Task No." = field(filter(Totaling)),
                                                                           "Entry Type" = const(Usage),
                                                                           "Posting Date" = field("Posting Date Filter")));
            Caption = 'Usage (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Usage (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Job Ledger Entry"."Line Amount (LCY)" where("Job No." = field("Job No."),
                                                                            "Job Task No." = field("Job Task No."),
                                                                            "Job Task No." = field(filter(Totaling)),
                                                                            "Entry Type" = const(Usage),
                                                                            "Posting Date" = field("Posting Date Filter")));
            Caption = 'Usage (Total Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Contract (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where("Job No." = field("Job No."),
                                                                            "Job Task No." = field("Job Task No."),
                                                                            "Job Task No." = field(filter(Totaling)),
                                                                            "Contract Line" = const(true),
                                                                            "Planning Date" = field("Planning Date Filter")));
            Caption = 'Billable (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "Contract (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Job Planning Line"."Line Amount (LCY)" where("Job No." = field("Job No."),
                                                                             "Job Task No." = field("Job Task No."),
                                                                             "Job Task No." = field(filter(Totaling)),
                                                                             "Contract Line" = const(true),
                                                                             "Planning Date" = field("Planning Date Filter")));
            Caption = 'Billable (Total Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; "Contract (Invoiced Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = - sum("Job Ledger Entry"."Line Amount (LCY)" where("Job No." = field("Job No."),
                                                                             "Job Task No." = field("Job Task No."),
                                                                             "Job Task No." = field(filter(Totaling)),
                                                                             "Entry Type" = const(Sale),
                                                                             "Posting Date" = field("Posting Date Filter")));
            Caption = 'Billable (Invoiced Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(17; "Contract (Invoiced Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = - sum("Job Ledger Entry"."Total Cost (LCY)" where("Job No." = field("Job No."),
                                                                            "Job Task No." = field("Job Task No."),
                                                                            "Job Task No." = field(filter(Totaling)),
                                                                            "Entry Type" = const(Sale),
                                                                            "Posting Date" = field("Posting Date Filter")));
            Caption = 'Billable (Invoiced Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; "Posting Date Filter"; Date)
        {
            Caption = 'Posting Date Filter';
            FieldClass = FlowFilter;
        }
        field(20; "Planning Date Filter"; Date)
        {
            Caption = 'Planning Date Filter';
            FieldClass = FlowFilter;
        }
        field(21; Totaling; Text[250])
        {
            Caption = 'Totaling';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                // IF Totaling <> '' THEN
                //  IF NOT ("Job Task Type" IN ["Job Task Type"::Total,"Job Task Type"::"End-Total"]) THEN
                //    FIELDERROR("Job Task Type");
                // VALIDATE("WIP-Total");
                // CALCFIELDS(
                //  "Schedule (Total Cost)",
                //  "Schedule (Total Price)",
                //  "Usage (Total Cost)",
                //  "Usage (Total Price)",
                //  "Contract (Total Cost)",
                //  "Contract (Total Price)",
                //  "Contract (Invoiced Price)",
                //  "Contract (Invoiced Cost)");
            end;
        }
        field(22; "New Page"; Boolean)
        {
            Caption = 'New Page';
        }
        field(23; "No. of Blank Lines"; Integer)
        {
            BlankZero = true;
            Caption = 'No. of Blank Lines';
            MinValue = 0;
        }
        field(24; Indentation; Integer)
        {
            Caption = 'Indentation';
            MinValue = 0;
        }
        field(34; "Recognized Sales Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Recognized Sales Amount';
            Editable = false;
        }
        field(37; "Recognized Costs Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Recognized Costs Amount';
            Editable = false;
        }
        field(56; "Recognized Sales G/L Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Recognized Sales G/L Amount';
            Editable = false;
        }
        field(57; "Recognized Costs G/L Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Recognized Costs G/L Amount';
            Editable = false;
        }
        field(60; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                // JobLedgerEntries.RESET;
                // JobLedgerEntries.SETRANGE(JobLedgerEntries."Job No.","Job No.");
                // JobLedgerEntries.SETRANGE(JobLedgerEntries."Job Task No.","Job Task No.");
                // IF NOT JobLedgerEntries.ISEMPTY THEN BEGIN
                //    ERROR(CannotChangeAssociatedEntriesErr,FIELDCAPTION("Global Dimension 1 Code"),Description);
                // END;
                // ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                // //To prevent  Changing once entries exist
                // //TestNoEntriesExist(FIELDCAPTION("Global Dimension 1 Code"));
            end;
        }
        field(61; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                // ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(62; "Outstanding Orders"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = sum("Purchase Line"."Outstanding Amt. Ex. VAT (LCY)" where("Document Type" = const(Order),
                                                                                      "Job No." = field("Job No."),
                                                                                      "Job Task No." = field("Job Task No."),
                                                                                      "Job Task No." = field(filter(Totaling))));
            Caption = 'Outstanding Orders';
            FieldClass = FlowField;
        }
        field(63; "Amt. Rcd. Not Invoiced"; Decimal)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = sum("Purchase Line"."A. Rcd. Not Inv. Ex. VAT (LCY)" where("Document Type" = const(Order),
                                                                                      "Job No." = field("Job No."),
                                                                                      "Job Task No." = field("Job Task No."),
                                                                                      "Job Task No." = field(filter(Totaling))));
            Caption = 'Amt. Rcd. Not Invoiced';
            FieldClass = FlowField;
        }
        field(64; "Remaining (Total Cost)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Job Planning Line"."Remaining Total Cost (LCY)" where("Job No." = field("Job No."),
                                                                                      "Job Task No." = field("Job Task No."),
                                                                                      "Job Task No." = field(filter(Totaling)),
                                                                                      "Schedule Line" = const(true),
                                                                                      "Planning Date" = field("Planning Date Filter")));
            Caption = 'Remaining (Total Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(65; "Remaining (Total Price)"; Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CalcFormula = sum("Job Planning Line"."Remaining Line Amount (LCY)" where("Job No." = field("Job No."),
                                                                                       "Job Task No." = field("Job Task No."),
                                                                                       "Job Task No." = field(filter(Totaling)),
                                                                                       "Schedule Line" = const(true),
                                                                                       "Planning Date" = field("Planning Date Filter")));
            Caption = 'Remaining (Total Price)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(66; "Start Date"; Date)
        {
            CalcFormula = min("Job Planning Line"."Planning Date" where("Job No." = field("Job No."),
                                                                         "Job Task No." = field("Job Task No.")));
            Caption = 'Start Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(67; "End Date"; Date)
        {
            CalcFormula = max("Job Planning Line"."Planning Date" where("Job No." = field("Job No."),
                                                                         "Job Task No." = field("Job Task No.")));
            Caption = 'End Date';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50020; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50023; "LPO Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50024; "PRN Commitments"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50025; "Transaction Codes"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                           "Direct Reports To" = field("Department Code"));
        }
        field(70020; Commitments; Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where(Job = field("Job No."),
                                                                  "Job Task No" = field("Job Task No."),
                                                                  Type = const(Committed)));
            FieldClass = FlowField;
        }
        field(70021; "Start Point(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70022; "End Point(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Funding Source"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(70024; "Procurement Method"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Method";
        }
        field(70025; "Surface Types"; Code[30])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Table50003.Field1;
        }
        field(70026; "Road Condition"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Good,Poor,Excellent';
            OptionMembers = Good,Poor,Excellent;
        }
        field(70028; "Completed Length(Km)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70029; "Roads Category"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Works Category";
        }
        field(70030; "Fund Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fund Type";
        }
        field(70031; "Execution Method"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Execution Method";
        }
        field(70032; "Road Section ID"; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // RoadSection.Reset;
                // RoadSection.SetRange(RoadSection."Road Section No.","Road Section ID");
                // if RoadSection.FindSet then
                //   "Road Section  Name":=RoadSection."Section Name";
            end;
        }
        field(70033; "Road Section  Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70034; "Measured Qunatity"; Decimal)
        {
            CalcFormula = sum("Measurement & Payment Entry"."Measured Quantity" where("Job No." = field("Job No."),
                                                                                       "Job Task No." = field("Job Task No."),
                                                                                       Reversed = const(false)));
            DecimalPlaces = 5 : 5;
            FieldClass = FlowField;
        }
        field(72000; "Road Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            //   TableRelation = "Road Inventory"."Road Code";
        }
        field(72001; "Road Section No"; Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Road Section"."Road Section No." where ("Road Code"=field("Road Code"));

            trigger OnValidate()
            begin
                // RoadSection.Reset;
                // RoadSection.SetRange(RoadSection."Road Section No.","Road Section No");
                // if RoadSection.FindSet then
                //   begin
                //     "Constituency ID":=RoadSection."Primary Constituency ID";;
                //     "County ID":=RoadSection."Primary County ID";
                //     "Region ID":=RoadSection."Primary Region ID";
                //   end;
            end;
        }
        field(72002; "Constituency ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Constituency.Code;
        }
        field(72003; "County ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(72004; "Region ID"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = County1.Code;
        }
        field(72005; "Road Project Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Studies and Surveys,Construction Works,Maitenance Works';
            OptionMembers = ,"Studies and Surveys","Construction Works","Maitenance Works";
        }
        field(72006; Location; Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Added to track the Project Location';
            TableRelation = Location;

            trigger OnValidate()
            begin
                // JobLedgerEntries.RESET;
                // JobLedgerEntries.SETRANGE(JobLedgerEntries."Job No.","Job No.");
                // JobLedgerEntries.SETRANGE(JobLedgerEntries."Job Task No.","Job Task No.");
                // IF NOT JobLedgerEntries.ISEMPTY THEN BEGIN
                //    ERROR(CannotChangeAssociatedEntriesErr,FIELDCAPTION(Location),Description);
                // END;
            end;
        }
        field(72007; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher';
            OptionMembers = " ","Measurement Sheet","Contractor Notice of Works","Works Inspection","Payment Certificate","Contractor Payment Request","New Job Voucher";
        }
        field(72008; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Job No.", "Job Task No.")
        {
            Clustered = true;
            SumIndexFields = "Recognized Sales Amount", "Recognized Costs Amount", "Recognized Sales G/L Amount", "Recognized Costs G/L Amount";
        }
        key(Key2; "Job Task No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Job Task No.", Description, "Job Task Type")
        {
        }
    }

    trigger OnDelete()
    var
        JobPlanningLine: Record "Job Planning Line";
        JobWIPTotal: Record "Job WIP Total";
        JobTaskDim: Record "Job Task Dimension";
    begin
    end;

    trigger OnInsert()
    var
        Job: Record Job;
        Cust: Record Customer;
    begin
        MeasurementPaymentHeader.Reset;
        MeasurementPaymentHeader.SetRange(MeasurementPaymentHeader."Document No.", "Document No.");
        if MeasurementPaymentHeader.FindSet then begin
            "Job No." := MeasurementPaymentHeader."Project ID";
        end;
    end;

    var
        CannotDeleteAssociatedEntriesErr: label 'You cannot delete %1 because one or more entries are associated.', Comment = '%1=The job task table name.';
        CannotChangeAssociatedEntriesErr: label 'You cannot change %1 because one or more entries are associated with this %2.', Comment = '%1 = The field name you are trying to change; %2 = The job task table name.';
        Job: Record Job;
        DimMgt: Codeunit DimensionManagement;
        // RoadSection: Record "Road Section";
        // RoadInventory: Record "Road Inventory";
        TestNoEntriesExist: Integer;
        JobLedgerEntries: Record "Job Ledger Entry";
        MeasurementPaymentHeader: Record "Measurement &  Payment Header";

    procedure CalcEACTotalCost(): Decimal
    begin
        // IF "Job No." <> Job."No." THEN
        //  IF NOT Job.GET("Job No.") THEN
        //    EXIT(0);
        //
        // IF Job."Apply Usage Link" THEN
        //  EXIT("Usage (Total Cost)" + "Remaining (Total Cost)");
        //
        // EXIT(0);
    end;

    procedure CalcEACTotalPrice(): Decimal
    begin
        // IF "Job No." <> Job."No." THEN
        //  IF NOT Job.GET("Job No.") THEN
        //    EXIT(0);
        //
        // IF Job."Apply Usage Link" THEN
        //  EXIT("Usage (Total Price)" + "Remaining (Total Price)");
        //
        // EXIT(0);
    end;

    local procedure JobLedgEntriesExist(): Boolean
    var
        JobLedgEntry: Record "Job Ledger Entry";
    begin
        // JobLedgEntry.SETCURRENTKEY("Job No.","Job Task No.");
        // JobLedgEntry.SETRANGE("Job No.","Job No.");
        // JobLedgEntry.SETRANGE("Job Task No.","Job Task No.");
        // EXIT(JobLedgEntry.FINDFIRST)
    end;

    local procedure JobPlanningLinesExist(): Boolean
    var
        JobPlanningLine: Record "Job Planning Line";
    begin
        // JobPlanningLine.SETCURRENTKEY("Job No.","Job Task No.");
        // JobPlanningLine.SETRANGE("Job No.","Job No.");
        // JobPlanningLine.SETRANGE("Job Task No.","Job Task No.");
        // EXIT(JobPlanningLine.FINDFIRST)
    end;

    procedure Caption(): Text[250]
    var
        Job: Record Job;
    begin
        // IF NOT Job.GET("Job No.") THEN
        //  EXIT('');
        // EXIT(STRSUBSTNO('%1 %2 %3 %4',
        //    Job."No.",
        //    Job.Description,
        //    "Job Task No.",
        //    Description));
    end;

    procedure InitWIPFields()
    var
        JobWIPTotal: Record "Job WIP Total";
    begin
        // JobWIPTotal.SETRANGE("Job No.","Job No.");
        // JobWIPTotal.SETRANGE("Job Task No.","Job Task No.");
        // JobWIPTotal.SETRANGE("Posted to G/L",FALSE);
        // JobWIPTotal.DELETEALL(TRUE);
        //
        // "Recognized Sales Amount" := 0;
        // "Recognized Costs Amount" := 0;
        //
        // MODIFY;
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; ShortcutDimCode: Code[20])
    var
        JobTask2: Record "Job Task";
    begin
        // DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        // IF JobTask2.GET("Job No.","Job Task No.") THEN BEGIN
        //  DimMgt.SaveJobTaskDim("Job No.","Job Task No.",FieldNumber,ShortcutDimCode);
        //  MODIFY;
        // END ELSE
        //  DimMgt.SaveJobTaskTempDim(FieldNumber,ShortcutDimCode);
    end;

    procedure ClearTempDim()
    begin
        //DimMgt.DeleteJobTaskTempDim;
    end;

    procedure ApplyPurchaseLineFilters(var PurchLine: Record "Purchase Line"; JobNo: Code[20]; JobTaskNo: Code[20])
    begin
        // PurchLine.SETCURRENTKEY("Document Type","Job No.","Job Task No.");
        // PurchLine.SETRANGE("Document Type",PurchLine."Document Type"::Order);
        // PurchLine.SETRANGE("Job No.",JobNo);
        // IF "Job Task Type" IN ["Job Task Type"::Total,"Job Task Type"::"End-Total"] THEN
        //  PurchLine.SETFILTER("Job Task No.",Totaling)
        // ELSE
        //  PurchLine.SETRANGE("Job Task No.",JobTaskNo);
    end;
}

