#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72033 "Feasibility Study  Members"
{

    fields
    {
        field(1; "Feasibility Study No"; Code[20])
        {
        }
        field(2; "No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if EmployeeRec.Get("No.") then
                    Name := EmployeeRec."First Name" + ' ' + EmployeeRec."Middle Name" + ' ' + EmployeeRec."Last Name";
            end;
        }
        field(3; Name; Text[150])
        {
        }
        field(4; "Job Group"; Code[250])
        {
            CalcFormula = lookup(Employee."Salary Scale" where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(5; "Job Title"; Text[50])
        {
        }
        field(6; Entitlement; Decimal)
        {
            Editable = false;
        }
        field(7; "Outstanding Amount"; Decimal)
        {
            Editable = false;
        }
        field(8; "Tasks to Carry Out"; Text[150])
        {
        }
        field(9; "Expected Output"; Text[150])
        {
        }
        field(10; "Unit of Measure"; Code[20])
        {
            TableRelation = "Unit of Measure";
        }
        field(11; Delivery; Decimal)
        {
        }
        field(12; "Work Type"; Code[20])
        {
            TableRelation = "Work Type" where(Category = filter("Project Team" | Machines));
        }
        field(13; "Time Period"; Decimal)
        {
        }
        field(14; Type; Option)
        {
            OptionCaption = 'Person,Machine';
            OptionMembers = Person,Machine;
        }
        field(15; "Last Maintenance Cost"; Decimal)
        {
        }
        field(16; "Expected Maintenance Cost"; Decimal)
        {
            Editable = false;
        }
        field(17; "Bank Name"; Text[100])
        {
        }
        field(18; "Bank Branch"; Code[100])
        {
        }
        field(19; "Bank Account Number"; Code[100])
        {
        }
        field(20; "Project Lead"; Boolean)
        {
        }
        field(21; "Project Lead Costs"; Decimal)
        {
            CalcFormula = sum("Project Members".Entitlement where(Type = const(Machine)));
            FieldClass = FlowField;
        }
        field(22; Posted; Boolean)
        {
        }
        field(23; Linked; Boolean)
        {
        }
        field(24; Project; Code[20])
        {
            FieldClass = Normal;
        }
        field(25; "Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job Task Type" = const(Posting),
                                                             "Job No." = field(Project));
        }
        field(26; "Expense Type"; Option)
        {
            OptionCaption = 'Fuel,Maintenance';
            OptionMembers = Fuel,Maintenance;
        }
        field(27; "Bank Branch Name"; Text[100])
        {
        }
        field(28; "Actual Time Period"; Integer)
        {
        }
        field(29; "Actual Spent"; Decimal)
        {
            Editable = false;
        }
        field(30; "Actual Delivery"; Decimal)
        {
        }
        field(31; Surrendered; Boolean)
        {
        }
        field(32; Status; Option)
        {
            Editable = true;
            FieldClass = Normal;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(50020; "Vote Item"; Code[20])
        {
            Editable = true;
            TableRelation = "G/L Account"."No.";
        }
        field(50021; "Vote Amount"; Decimal)
        {
            Editable = false;
        }
        field(50022; "Actual to Date"; Decimal)
        {
            Editable = false;
        }
        field(50023; Commitments; Decimal)
        {
            Editable = false;
        }
        field(50024; "Vote Item Desc."; Text[200])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("Vote Item")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "Available Funds"; Decimal)
        {
            Editable = false;
        }
        field(57000; "Job Task Description"; Text[50])
        {
            Caption = 'Job Task Description';
            Editable = false;
        }
        field(57001; "Consumption Rate"; Decimal)
        {
            FieldClass = Normal;
        }
        field(57002; "Direct Unit Cost"; Decimal)
        {
            Editable = false;
        }
        field(57003; "Actual Maintanance Costs"; Decimal)
        {
        }
        field(57004; "Actual Distance covered"; Decimal)
        {
        }
        field(57005; "Approved days"; Integer)
        {
        }
        field(57006; "G/L Account"; Code[20])
        {
            CalcFormula = lookup("Receipts and Payment Types1"."G/L Account" where(Code = field("Type of Expense"),
                                                                                    "Appear on Imprest?" = filter(true)));
            Editable = true;
            FieldClass = FlowField;
            TableRelation = "G/L Account";
        }
        field(57007; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(57008; "Type of Expense"; Code[50])
        {
            TableRelation = "Receipts and Payment Types1" where("Appear on Imprest?" = filter(true));
        }
        field(57009; "Transport Costs"; Decimal)
        {
        }
        field(57010; "Total Entitlement"; Decimal)
        {
            Editable = false;
        }
        field(69022; "Currency Factor"; Integer)
        {
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Directorate Code"));
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
        field(70020; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Feasibility Study No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProjectTeam: Record "Project Members";
        ImprestMemo: Record "Imprest Memo";
        ResourceRec: Record Resource;
        EmployeeRec: Record Employee;
        CustRec: Record Customer;
        WTRec: Record "Work Type";
        ResourceCost: Record "Resource Cost";
        Text000: label 'Kindly setup resource costs';
        TaskRec: Record "Job Task";
        Text001: label 'The staff No. %1 you selected has an outstanding imprest Amounting to Kshs.   %2 that is greater than the credit limit set for the staff by Ksh. %3. You can only have a team with balance less than the set Credit limit.';
        Localcurr: BigInteger;
        currency: Record Currency;
        tExpense: Record "Receipts and Payment Types1";
        fAsset: Record "Fixed Asset";
        Bcommitments: Record "Budget Commitment";
        cSetup: Record "Human Resources Setup";
        gEntry: Record "G/L Entry";
        actualAmount: Decimal;
}

