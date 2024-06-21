#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69175 "Planning Line Entry"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Course ID"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TrainingCoursesSetup.Reset;
                TrainingCoursesSetup.SetRange(Code, "Course ID");
                if TrainingCoursesSetup.FindSet then begin
                    "Course Description" := TrainingCoursesSetup.Descritpion;
                end
            end;
        }
        field(3; "Training Plan Id"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Training Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Internal,External;
        }
        field(5; "Planned Service Provider"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vendor Training Domains"."Vendor No.";
        }
        field(6; "Training Duration Hrs"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Planned End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Planned Budget"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Planned Budget" > "Available Budget" then Message('The budget available is less than the planned budget,Kindly Check');
            end;
        }
        field(10; "Planned No. to be Trained"; Integer)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //update the header table
                BudgetAmount := 0.0;
                UtilizedAmount := 0.0;
                PlanningLineEntry.SetCurrentkey("Service Item");
                PlanningLineEntry.SetRange("Training Plan Id", "Training Plan Id");
                if PlanningLineEntry.Find('-') then
                    repeat
                        if (PlanningLineEntry1."Service Item" <> PlanningLineEntry."Service Item") then begin
                            BudgetAmount := PlanningLineEntry."Available Budget" + BudgetAmount;
                            UtilizedAmount := PlanningLineEntry."Budget Utilized" + UtilizedAmount;
                            Budgetavailable := PlanningLineEntry."Available Budget" - UtilizedAmount;

                        end;
                        PlanningLineEntry1 := PlanningLineEntry;
                    until PlanningLineEntry.Next = 0;

                //modify the header table
                TrainingPlanHeader.Reset;
                TrainingPlanHeader.SetRange(No, "Training Plan Id");
                if TrainingPlanHeader.FindSet then begin
                    TrainingPlanHeader."Bugdet Available" := BudgetAmount;
                    TrainingPlanHeader."Budget Utilized" := UtilizedAmount;
                    TrainingPlanHeader.Modify(true);
                end
            end;
        }
        field(11; "Planned Region"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(12; "Planned Department"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(13; "Planned Directorate"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(14; "Planned Branch"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Branch));
        }
        field(15; "Dimension Set ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Domain ID"; Code[30])
        {
        }
        field(17; "Planned Service Provider Name"; Text[100])
        {
            CalcFormula = lookup(Vendor.Name where("No." = field("Planned Service Provider")));
            FieldClass = FlowField;
        }
        field(18; "Field"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Professional Association"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Target Group Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Resource Group";
        }
        field(21; "Course Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Service Item"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                GLBudgetEntry.Reset;
                GLBudgetEntry.SetRange("G/L Account No.", "Service Item");
                if GLBudgetEntry.FindSet then begin
                    GLBudgetEntry.CalcSums(Amount);
                    "Total Budget" := GLBudgetEntry.Amount;
                    GLAccount.Reset;
                    GLAccount.SetRange("No.", GLBudgetEntry."G/L Account No.");
                    if GLAccount.FindSet then begin
                        GLAccount.CalcFields(Balance);
                        "Budget Utilized" := GLAccount.Balance;
                        "Available Budget" := "Total Budget" - "Budget Utilized";

                    end;

                end;

            end;
        }
        field(23; "Available Budget"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TrainingPlanHeader.Reset;
                TrainingPlanHeader.SetRange(No, "Service Item");
                if TrainingPlanHeader.FindSet then begin
                    TrainingPlanHeader."Budget Allocation" := "Available Budget";
                end;
            end;
        }
        field(24; "Budget Utilized"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Total Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Service Item Description"; Text[50])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Service Item")));
            FieldClass = FlowField;
        }
        field(27; "Target Group"; Text[30])
        {
            CalcFormula = lookup("Resource Group".Name where("No." = field("Target Group Code")));
            FieldClass = FlowField;
        }
        field(28; "Employee No."; Code[50])
        {
            TableRelation = Employee."No.";
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                empl: record 5200;
            begin
                if empl.get("Employee No.") then
                    "Employee Name" := empl.FullName();

            end;
        }
        field(29; "Employee Name"; text[100])
        {

            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30; Location; code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
            trigger OnValidate()
            var

                loc: Record Location;
            begin
                if loc.get(Location) THEN rec."location name" := loc.name;

            end;
        }
        field(31; "location name"; text[100])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;

        }
    }

    keys
    {
        key(Key1; "Entry No.", "Course ID", "Training Plan Id", "Planned Service Provider")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Course Description", "Planned Department")
        {
        }
    }

    var
        TrainingCoursesSetup: Record "Training Courses Setup";
        GLBudgetEntry: Record "G/L Budget Entry";
        GLAccount: Record "G/L Account";
        TrainingPlanHeader: Record "Training Plan Header";
        BudgetAmount: Decimal;
        PlanningLineEntry: Record "Planning Line Entry";
        PlanningLineEntry1: Record "Planning Line Entry";
        UtilizedAmount: Decimal;
        Budgetavailable: Decimal;
}

