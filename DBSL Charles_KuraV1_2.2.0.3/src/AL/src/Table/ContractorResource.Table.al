#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72152 "Contractor Resource"
{
    Caption = 'Resource';

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Contractor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(3; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Machine,Person';
            OptionMembers = " ",Machine,Person;
        }
        field(4; Name; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Search Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Name 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Address; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Address 2"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; City; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Social Security No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Job Title"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Education; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Contract Class"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Employment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Resource Group No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Project Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Base Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Direct Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Indirect Cost %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Unit Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Profit %"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Price/Profit Calculation"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Last Date Modified"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(27; Comment; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(28; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29; Capacity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Type, "Contractor No.", "Base Unit of Measure")
        {
        }
        // fieldgroup(Brick;"No.",Type,"Contractor No.","Base Unit of Measure",Field140)
        // {
        // }
    }

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    var
        SalesLine: Record "Sales Line";
    begin


        "Last Date Modified" := Today;
    end;

    var
        Text001: label 'Do you want to change %1?';
        ResSetup: Record "Resources Setup";
        Res: Record Resource;
        ResCapacityEntry: Record "Res. Capacity Entry";
        CommentLine: Record "Comment Line";
        ResCost: Record "Resource Cost";
        ResPrice: Record "Resource Price";
        SalesOrderLine: Record "Sales Line";
        ExtTextHeader: Record "Extended Text Header";
        PostCode: Record "Post Code";
        GenProdPostingGrp: Record "Gen. Product Posting Group";
        ResSkill: Record "Resource Skill";
        ResLoc: Record "Resource Location";
        ResServZone: Record "Resource Service Zone";
        ResUnitMeasure: Record "Resource Unit of Measure";
        PlanningLine: Record "Job Planning Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        MoveEntries: Codeunit MoveEntries;
        DimMgt: Codeunit DimensionManagement;
        Text002: label 'You cannot change %1 because there are ledger entries for this resource.';
        Text004: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        Text005: label '%1 cannot be changed since unprocessed time sheet lines exist for this resource.';
        Text006: label 'You cannot delete %1 %2 because unprocessed time sheet lines exist for this resource.', Comment = 'You cannot delete Resource LIFT since unprocessed time sheet lines exist for this resource.';
        BaseUnitOfMeasureQtyMustBeOneErr: label 'The quantity per base unit of measure must be 1. %1 is set up with %2 per unit of measure.', Comment = '%1 Name of Unit of measure (e.g. BOX, PCS, KG...), %2 Qty. of %1 per base unit of measure ';
        CannotDeleteResourceErr: label 'You cannot delete resource %1 because it is used in one or more job planning lines.', Comment = '%1 = Resource No.';
        SalesDocumentExistsErr: label 'You cannot delete resource %1 because there are one or more outstanding %2 that include this resource.', Comment = '%1 = Resource No.';
        PrivacyBlockedPostErr: label 'You cannot post this line because resource %1 is blocked due to privacy.', Comment = '%1=resource no.';
        PrivacyBlockedErr: label 'You cannot create this line because resource %1 is blocked due to privacy.', Comment = '%1=resource no.';
        ConfirmBlockedPrivacyBlockedQst: label 'If you change the Blocked field, the Privacy Blocked field is changed to No. Do you want to continue?';
        CanNotChangeBlockedDueToPrivacyBlockedErr: label 'The Blocked field cannot be changed because the user is blocked for privacy reasons.';
        GrantSetup: Record "Grants Setup";
        Employee: Record Employee;
}

