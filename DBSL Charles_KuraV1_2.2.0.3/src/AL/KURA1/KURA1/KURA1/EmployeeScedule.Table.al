#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69176 "Employee Scedule"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Employee No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Participants"."Employee Code" where("Training Code" = field("Training Application No."));
        }
        field(3; Date; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Day := Format(Date, 0, '<Weekday Text>');
            end;
        }
        field(4; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Schedule,Attendance;
        }
        field(5; "Training Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Employee Name"; Text[250])
        {
            CalcFormula = lookup(Employee."Search Name" where("No." = field("Employee No.")));
            FieldClass = FlowField;
        }
        field(7; Day; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.", "Training Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

