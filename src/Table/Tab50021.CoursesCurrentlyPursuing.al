/// <summary>
/// Table CoursesCurrentlyPursuing (ID 50021).
/// </summary>
table 50021 CoursesCurrentlyPursuing
{
    Caption = 'Employee Courses Pursuing';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = ,Academic,Professional;
            NotBlank = true;
        }
        field(4; Name; Text[50])
        {
            Caption = 'Name';
            NotBlank = true;
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
            NotBlank = true;
        }
        field(6; "Duration"; Decimal)
        {
            Caption = 'Duration';
        }
        field(7; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(8; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(9; Institution; Text[250])
        {
            Caption = 'Institution';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Courses: Record CoursesCurrentlyPursuing;
    begin
        Courses.Reset();
        Courses.SetRange("Document No.", Rec."Document No.");
        if Courses.FindLast() then begin
            "Line No." := Courses."Line No." + 1;
        end;
    end;
}
