#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 57011 "Casuals"
{

    fields
    {
        field(1; "Imprest Memo No."; Code[20])
        {
            TableRelation = "Imprest Memo";
        }
        field(2; Type; Option)
        {
            OptionCaption = 'Skilled,Unskilled';
            OptionMembers = Skilled,Unskilled;
        }
        field(3; "No. Required"; Integer)
        {

            trigger OnValidate()
            begin
                //VALIDATE("Work Type");
            end;
        }
        field(4; "Work Type"; Code[50])
        {
            TableRelation = "Work Type" where(Category = filter(Labour));

            trigger OnValidate()
            begin
                //Ushindi
                CalcFields(Project);
                //Ushindi
                if "Work Type" <> '' then begin
                    if ResourceRec.Get("Resource No.") then;
                    if ResourceRec."Resource Group No." <> '' then begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "Resource No.", "Work Type") then begin
                            Amount := ResourceCost."Direct Unit Cost" * "No. of Days" * "No. Required";
                            Rate := ResourceCost."Direct Unit Cost";
                        end
                        else
                            if ResourceCost.Get(ResourceCost.Type::"Group(Resource)", ResourceRec."Resource Group No.", "Work Type") then begin
                                Rate := ResourceCost."Direct Unit Cost";
                                Amount := ResourceCost."Direct Unit Cost" * "No. of Days" * "No. Required";
                            end
                    end else begin
                        if ResourceCost.Get(ResourceCost.Type::Resource, "Resource No.", "Work Type") then begin
                            Rate := ResourceCost."Direct Unit Cost";
                            Amount := ResourceCost."Direct Unit Cost" * "No. of Days" * "No. Required";
                        end
                        else begin
                            if ResourceCost.Get(ResourceCost.Type::All, '', "Work Type") then begin
                                Rate := ResourceCost."Direct Unit Cost";
                                Amount := ResourceCost."Direct Unit Cost" * "No. of Days" * "No. Required";
                            end
                            else
                                Error(Text000);
                        end;
                    end;
                end else
                    Error(Text001);

                WTRec.Reset;
                WTRec.SetRange(Code, "Work Type");
                if WTRec.FindFirst() then begin
                    if WTRec."G/L Account" = '' then
                        error('G/L Account must have a value in work type %1', WTRec.Description);
                    "G/L Account" := WTRec."G/L Account";
                end;
                UpdateCommitment();
            end;
        }
        field(5; "No. of Days"; Decimal)
        {

            trigger OnValidate()
            begin
                //VALIDATE("Work Type");
                Amount := "No. Required" * "No. of Days" * Rate;
            end;
        }
        field(6; Rate; Decimal)
        {
        }
        field(7; Amount; Decimal)
        {
            Editable = false;
        }
        field(8; Activity; Text[250])
        {
        }
        field(9; "Resource No."; Code[20])
        {
            TableRelation = if (Type = const(Skilled)) Resource where(Type = const(Person));
        }
        field(10; Posted; Boolean)
        {
        }
        field(11; Linked; Boolean)
        {
        }
        field(24; Project; Code[20])
        {
            CalcFormula = lookup("Imprest Memo".Project where("No." = field("Imprest Memo No.")));
            FieldClass = FlowField;
        }
        field(25; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Project));

            trigger OnValidate()
            begin
                CalcFields(Project);

                if TaskRec.Get(Project, "Task No.") then;
                "Job Task Description" := TaskRec.Description;
            end;
        }
        field(26; "Actual No. of Days"; Decimal)
        {

            trigger OnValidate()
            begin
                Validate("Work Type");
            end;
        }
        field(27; Surrendered; Boolean)
        {
        }
        field(57000; "Job Task Description"; Text[50])
        {
            Caption = 'Job Task Description';
            Editable = false;
        }
        field(57001; "Actual Rate"; Decimal)
        {
        }
        field(57002; "Actual Amount"; Decimal)
        {
        }
        field(57003; "G/L Account"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(57008; "Employee No To Surrender"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Members"."No." where("Imprest Memo No." = field("Imprest Memo No."));

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.", "Employee No To Surrender");
                if Employee.FindSet then begin
                    "Employee Name To Surender" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(57009; "Employee Name To Surender"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69023; Job; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where(exchequer = const(true));

            trigger OnValidate()
            begin
                if JobRec.Get(Job) then
                    "Job Name" := JobRec.Description;

            end;
        }
        field(69024; "Job  Task"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field(Job));

            trigger OnValidate()
            begin
                TaskRec.Reset;
                TaskRec.SetRange("Job No.", Job);
                TaskRec.SetRange("Job Task No.", "Job  Task");
                if TaskRec.Find('-') then begin
                    repeat
                        TaskRec.CalcFields("Schedule (Total Cost)", "Remaining (Total Cost)", "Usage (Total Cost)", Commitments);
                        "Job Task Name" := TaskRec.Description;
                        "Job Task Budget" := TaskRec."Schedule (Total Cost)";
                        "Job Task Remaining Amount" := TaskRec."Schedule (Total Cost)" - (TaskRec."Usage (Total Cost)" - TaskRec.Commitments) - Amount;
                    until TaskRec.Next = 0;
                end;


                /*
                IF ("Total Entitlement" >"Job Task Remaining Amount") THEN
                     ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',"Total Entitlement","Job Task Remaining Amount");
                     */

            end;
        }
        field(69025; "Job Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69026; "Job Task Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69027; "Job Task Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69028; "Job Task Remaining Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69029; "Committed Amount"; Decimal)
        {

        }
        field(69030; "Budgeted Amount"; Decimal)
        {

        }
        field(69031; "Available Amount"; Decimal)
        {

        }
        field(69032; "Account Actual Spent"; Decimal)
        {

        }
    }

    keys
    {
        key(Key1; "Imprest Memo No.", Type, "Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        WTRec: Record "Work Type";
        ResourceRec: Record Resource;
        ResourceCost: Record "Resource Cost";
        Text000: label 'Kindly setup resource costs';
        Text001: label 'Kindly insert the work type';
        TaskRec: Record "Job Task";
        Employee: Record Employee;
        JobRec: Record Job;

    Local Procedure UpdateCommitment()
    var
        CustomFunction: Codeunit "Custom Function";
        ImprestMemo: Record "Imprest Memo";
    begin
        ImprestMemo.Reset();
        ImprestMemo.SetRange("No.", "Imprest Memo No.");
        if ImprestMemo.findfirst() then begin
            // Cauals.CalcFields("G/L Account");
            "Budgeted Amount" := CustomFunction.GetBudgtedAmount("G/L Account", ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 1 Code",ImprestMemo."Department Code");
            "Account Actual Spent" := CustomFunction.GetActualSpent("G/L Account", ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 1 Code",ImprestMemo."Department Code");
            "Committed Amount" := CustomFunction.GetCommittedAmount("G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 1 Code",ImprestMemo."Department Code");
            "Available Amount" := "Budgeted Amount" - ("Account Actual Spent" + "Committed Amount");
        end;
    end;
}

