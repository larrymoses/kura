#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72279 "Temporary Supervision Line"
{

    fields
    {
        field(1; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                TSR: record "Temporary Supervision Requirem";
            begin
                TSR.Reset();
                TSR.SetRange("Document No", Rec."Document No");
                if TSR.FindFirst() then
                    Rec.Validate("Project ID", TSR."Project No");
            end;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Vehicle,RE Office,Survey Equipment,Lab Equipment';
            OptionMembers = " ",Vehicle,"RE Office","Survey Equipment","Lab Equipment";
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Vehicle,RE''s Office,Survey Equipment,Lab Equipment';
            OptionMembers = " ",Vehicle,"RE's Office","Survey Equipment","Lab Equipment";
        }
        field(5; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; No; Code[20])
        {
            Caption = 'Registration No';
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Unit of Measure"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(9; Quantity; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Comments; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Provision Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New,Temporary,Other';
            OptionMembers = " ",New,"Temporary",Other;
        }
        field(12; "Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project ID"));
        }
        field(13; "Bill Item No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Plan Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Planning Line"."Line No." where("Job No." = field("Project ID"),
                                                                  "Job Task No." = field("Task No."));

            trigger OnValidate()
            begin
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.", "Project ID");
                JobPlanningLine.SetRange(JobPlanningLine."Job Task No.", "Task No.");
                JobPlanningLine.SetRange(JobPlanningLine."Line No.", "Plan Line No");
                if JobPlanningLine.FindSet then begin
                    "Bill Item No" := JobPlanningLine."No.";
                    Description := JobPlanningLine.Description;
                    Quantity := JobPlanningLine.Quantity;
                    "Unit of Measure" := JobPlanningLine."Unit of Measure Code";
                    //added for Reversion type
                    "Reversion Type" := JobPlanningLine."Reversion Type";
                end;
            end;
        }
        field(15; "Scheduled Date of Delivery"; Date)
        {
            DataClassification = ToBeClassified;
            Description = 'Scheduled Date of Delivery to Site';
        }
        field(16; "Acknowledgement Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Acknowledgement Details"; Text[2048])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Acknowledgement Details" <> '' then begin
                    "Acknowledgment By" := UserId;
                    "Acknowledgement Date" := CreateDatetime(Today, Time);
                end;
            end;
        }
        field(18; "Acknowledgment By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Reversion Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'To Contractor,To Authority';
            OptionMembers = "To Contractor","To Authority";
        }
    }

    keys
    {
        key(Key1; "Document No", "Document Type", No, "Line No")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document No", "Document Type", No, Comments, "Project ID")
        {
        }
        fieldgroup(Brick; "Document No", "Document Type", No, Comments, "Project ID")
        {
        }
    }

    trigger OnInsert()
    begin
        TemporarySupervisionRequirem.Reset;
        TemporarySupervisionRequirem.SetRange(TemporarySupervisionRequirem."Document No", "Document No");
        if TemporarySupervisionRequirem.FindSet then
            "Project ID" := TemporarySupervisionRequirem."Project No";
    end;

    var
        TemporarySupervisionRequirem: Record "Temporary Supervision Requirem";
        JobPlanningLine: Record "Job Planning Line";
}

