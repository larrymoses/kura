#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69187 "Training Needs Register"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Source;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appraisal,Government Directive,Other,Career Development';
            OptionMembers = Appraisal,"Government Directive",Other,"Career Development";
        }
        field(4;Comments;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Linked Objectives";Integer)
        {
        }
        field(6;"Training Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Course ID";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Courses Setup".Code;

            trigger OnValidate()
            begin
                TrainingCoursesSetup.Reset;
                TrainingCoursesSetup.SetRange(Code,"Course ID");
                if TrainingCoursesSetup.FindSet then begin

                  Description:=TrainingCoursesSetup.Descritpion;
                end;
            end;
        }
        field(8;"Training Plan No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Employee No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(10;"Employee Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Training Plan No","Course ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TrainingCoursesSetup: Record "Training Courses Setup";
}
