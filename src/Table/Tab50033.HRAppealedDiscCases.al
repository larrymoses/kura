/// <summary>
/// Table HR Appealed Disc. Cases (ID 50033).
/// </summary>
table 50033 "HR Appealed Disc. Cases"
{
    Caption = 'HR Appealed Disc. Cases';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Employee Appealed Cases";
    LookupPageId = "Employee Appealed Cases";
    
    fields
    {
        field(1; "Case Number"; Code[20])
        {
            Caption = 'Case Number';
            Editable = false;
        }
        field(2; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            Editable = false;

            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get("Employee No") then
                    "Employee Name" := Emp.FullName();
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Caption = 'Employee Name';
            Editable = false;
        }
        field(4; "Appeal Date"; Date)
        {
            Caption = 'Appeal Date';
            Editable = false;
        }
        field(5; "Action Taken"; Text[500])
        {
            DataClassification = ToBeClassified;
            
            trigger OnValidate()
            begin
                GetCaseFile();
                Cases."Action Taken" := rec."Action Taken";
                Cases.Modify();
            end;
        }
        field(6; "Action Taken Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                GetCaseFile();
                Cases."Action Taken Date" := rec."Action Taken Date";
                Cases.Modify();
            end;
        }
        field(7; "Appeal Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Internal,External;
            OptionCaption = ',Internal,External';
            Editable = false;
        }
        field(8; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Case Number","Employee No", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Appeals.Reset();
        Appeals.SetRange("Case Number", Rec."Case Number");
        Appeals.SetRange("Employee No", Rec."Employee No");
        if Appeals.FindLast() then
            "Line No." := Appeals."Line No." + 1;
    end;

    trigger OnModify()
    begin
        Rec.Validate("Action Taken Date");
        Rec.Validate("Action Taken");
    end;

    trigger OnRename()
    begin
        Rec.Validate("Action Taken Date");
        Rec.Validate("Action Taken");
    end;

    var
        Cases: Record "HR Disciplinary Cases";
        Appeals: Record "HR Appealed Disc. Cases";

    local procedure GetCaseFile()
    begin
        Cases.Reset();
        Cases.SetRange("Case Number", Rec."Case Number");
        Cases.FindFirst();
    end;
}
