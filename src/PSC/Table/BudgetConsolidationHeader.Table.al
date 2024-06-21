#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80265 "Budget Consolidation Header"
{

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    SPMSetup.Get;
                    NoSeriesMgt.TestManual(SPMSetup."Budget Consolidation Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Financial Year"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));
        }
        field(3; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Annual Workplan"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan".No where("Annual Strategy Type" = const(Organizational));
        }
        field(5; "Current Job"; Code[10])
        {
            //Caption = 'Previous Year Financial Bugdet';
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where(exchequer = const(true));
        }
        field(6; "Creation Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Creation Time"; Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Global Annual Workplan"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan";
        }
        field(10; "Proposed Procurement Plan"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Procurement Plan".Code where("Document Type" = const("Procurement Plan"));
        }
        field(11; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(12; "Current Financial Budget"; Code[10])
        {
            //  Caption = 'Previous Year Financial Bugdet';
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where(exchequer = const(true));
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            SPMSetup.Get;
            SPMSetup.TestField("Budget Consolidation Nos");
            NoSeriesMgt.InitSeries(SPMSetup."Budget Consolidation Nos", xRec."No. Series", 0D, Code, "No. Series");
        end;
        "Creation Date" := Today;
        "Creation Time" := Time;
        "Created By" := UserId;
    end;

    var
        SPMSetup: Record "SPM General Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

