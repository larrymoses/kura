#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69152 "Training Plan Lines"
{

    fields
    {
        field(1; "Task No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Training Plan Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Plan Header";
        }
        field(3; "Course Title"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Courses Setup".Code;
        }
        field(4; "Planned No. of Staff"; Integer)
        {
            CalcFormula = sum("Planning Line Entry"."Planned No. to be Trained" where("Course ID" = field("Course Title"),
                                                                                       "Training Plan Id" = field("Training Plan Code")));
            FieldClass = FlowField;
        }
        field(5; "Course Description"; Text[100])
        {
            CalcFormula = lookup("Training Courses Setup".Descritpion where(Code = field("Course Title")));
            FieldClass = FlowField;
        }
        field(6; "Target Group"; Text[50])
        {
            CalcFormula = lookup("Resource Group".Name where("No." = field("Target Group Code")));
            FieldClass = FlowField;
        }
        field(7; "Field"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Need Categories";
        }
        field(8; "Professional Association"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Global; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Target Group Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Resource Group";
        }
        field(11; "Estimated Cost"; Decimal)
        {
            CalcFormula = sum("Planning Line Entry"."Planned Budget" where("Course ID" = field("Course Title"),
                                                                            "Training Plan Id" = field("Training Plan Code")));
            FieldClass = FlowField;
        }
        field(12; "Actual No. of Staff"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Actual Spent"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Course Duration"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Proposed Course Provider"; Text[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;//where (Trainer=filter(true));

            trigger OnValidate()
            begin
                KPAreas.Reset;
                //KPAreas.SETRANGE(KPAreas."Employee No","Employee No");
                //KPAreas.SETRANGE(KPAreas.Period,Period);
                KPAreas.SetRange(KPAreas."No.", "Proposed Course Provider");
                if KPAreas.Find('-') then
                    "Proposed Course Provider Name" := KPAreas.Name
            end;
        }
        field(25; "Proposed Course Provider Name"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Task No", "Course Title", "Training Plan Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vendor: Record Vendor;
        TrainingNeedCategories: Record "Training Need Categories";
        KPAreas: Record Vendor;
        TrainingCoursesSetup: Record "Training Courses Setup";
        TrainingNeedsLines: Record "Training Needs Lines";
        TrainingLinesObjectives: Record "Training Lines Objectives";
        TrainingCoursesNeeds: Record "Training Courses Needs";
        TrainingLinesObjectives1: Record "Training Lines Objectives";
        EntryNo: Integer;
}

