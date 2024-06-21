#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69221 "Training Participants"
{

    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Employee Code"; Code[30])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                TrainingNeed: Record "Advertisement Channels";
            begin
                HRemp.Reset;
                if HRemp.Get("Employee Code") then begin
                    "Employee Name" := HRemp."First Name" + ' ' + HRemp."Middle Name" + ' ' + HRemp."Last Name";
                    "Job Title" := HRemp."Job Title";
                    "Job Description" := HRemp.Position;
                    "Global Dimension 1 Code" := HRemp."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := HRemp."Global Dimension 2 Code";
                    ResourceRec.Reset;
                    ResourceRec.SetRange("No.", HRemp."No.");
                    if ResourceRec.FindSet then begin
                        //***********Added to validate job group

                        TrainingRequests.Reset;
                        TrainingRequests.SetRange(Code, "Training Code");
                        if TrainingRequests.FindSet then begin
                            PlanningLineEntry.Reset;
                            PlanningLineEntry.SetRange("Training Plan Code", TrainingRequests.Code);
                            PlanningLineEntry.SetRange("Course Title", TrainingRequests."Course Title");
                            if PlanningLineEntry.FindSet then begin
                                repeat
                                    if PlanningLineEntry."Target Group Code" <> '' then begin
                                        if PlanningLineEntry."Target Group Code" <> ResourceRec."Resource Group No." then
                                            Error(TXT001, TrainingRequests."Course Title", PlanningLineEntry."Target Group Code");
                                    end;
                                until PlanningLineEntry.Next = 0
                            end;
                        end;
                        //CHECK THE RC
                        "Training Responsibility Code" := TrainingRequests."Training Responsibility Code";
                        Destination := TrainingRequests."Training Venue Region Code";
                        if "Training Responsibility Code" <> "Global Dimension 1 Code" then
                            "Pay Per Diem" := true;
                    end;

                end
            end;
        }
        field(3; "Employee Name"; Text[60])
        {
        }
        field(4; Objectives; Text[100])
        {
        }
        field(5; "Training Code"; Code[20])
        {
        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(7; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(8; "Job Title"; Code[30])
        {
            TableRelation = "ManPower Planning Lines";
        }
        field(9; "Job Description"; Text[100])
        {
            CalcFormula = lookup(Positions."Job Title" where("Position ID" = field("Job Title")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; Bonded; Boolean)
        {
        }
        field(11; Destination; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Type" where(Category = filter("Project Team"));
        }
        field(12; "No. of Days"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TrainingRequests.Reset;
                TrainingRequests.SetRange(Code, "Training Code");
                if TrainingRequests.FindSet then begin
                    if TrainingRequests."Training Venue Region Code" <> '' then begin
                        if Destination <> TrainingRequests."Training Venue Region Code" then
                            Error(TXT002, TrainingRequests."Training Venue Region Code");

                        if "No. of Days" > TrainingRequests.Duration then
                            Error('The number of days %1 should not be greater than the duration', "No. of Days");

                    end;
                end;
                HumanResourcesSetup.Get;
                if ResourceRec.Get("Employee Code") then begin
                    ResourceRec.Reset;
                    ResourceRec.SetRange("No.", "Employee Code");
                    if ResourceRec.FindSet then begin
                        ResourceCost.SetRange(Code, ResourceRec."Resource Group No.");
                        ResourceCost.SetRange("Work Type Code", Destination);
                        if ResourceCost.FindSet then begin
                            "Unit Amount" := ResourceCost."Direct Unit Cost";

                        end;

                        if ("Global Dimension 1 Code" = HumanResourcesSetup."HQ Responsibility Center") and ("Training Responsibility Code" = HumanResourcesSetup."HQ Region RC")
                           then begin

                            "Total Amount" := 0;
                        end else
                            if ("Global Dimension 1 Code" = HumanResourcesSetup."HQ Region RC") and ("Training Responsibility Code" = HumanResourcesSetup."HQ Responsibility Center")
                                then begin
                                "Total Amount" := 0;
                            end else
                                if "Training Responsibility Code" <> "Global Dimension 1 Code" then begin
                                    "Total Amount" := "Unit Amount" * "No. of Days";
                                end;


                    end;
                end
            end;
        }
        field(13; "G/l Account"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Unit Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Type; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts and Payment Types1" where(Type = filter(Imprest));

            trigger OnValidate()
            begin
                if AdvanceTypes.Get(Type) then
                    "G/l Account" := AdvanceTypes."G/L Account";
            end;
        }
        field(17; "Requisition Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Memo Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Pay Per Diem"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Training Responsibility Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(23; "Training Responsibility"; Text[100])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Training Responsibility Code")));
            FieldClass = FlowField;
        }
        field(24; Requestor; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Line No", "Training Code", "Employee Code", "Training Responsibility Code")
        {
            Clustered = true;
        }

    }

    fieldgroups
    {
    }

    var
        HRemp: Record Employee;
        ResourceRec: Record Resource;
        ResourceCost: Record "Resource Cost";
        AdvanceTypes: Record "Receipts and Payment Types1";
        PlanningLineEntry: Record "Training Plan Lines";
        TrainingRequests: Record "Training Requests";
        TXT001: label 'The training course %1,is only allowed for the job group %2';
        TXT002: label 'The destination selected is not in the training region selected,Kindly select %1';
        WorkType: Record "Work Type";
        HumanResourcesSetup: Record "Human Resources Setup";
}

