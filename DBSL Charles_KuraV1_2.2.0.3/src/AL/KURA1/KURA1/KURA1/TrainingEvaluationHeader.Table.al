#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69224 "Training Evaluation Header"
{

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; "Application Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Requests";

            trigger OnValidate()
            begin
                TrainingRequests.Reset;
                TrainingRequests.SetRange(Code, "Application Code");
                if TrainingRequests.FindSet then begin
                    // "Course Title":=TrainingRequests.Status;
                    "Start DateTime" := TrainingRequests."Start DateTime";
                    "End DateTime" := TrainingRequests."End DateTime";
                    Venue := TrainingRequests.Location;
                    "Course Justification" := TrainingRequests."GL Account";
                    TrainingRequests.CalcFields("Total Per diem Costs");
                    "No. of Participants" := TrainingRequests."Total Per diem Costs";

                end
            end;
        }
        field(3; "Course Title"; Text[50])
        {
            DataClassification = ToBeClassified;
            NotBlank = false;
        }
        field(4; "Start DateTime"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "End DateTime"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; Venue; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; Facilitators; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(8; "Course Justification"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Comment on Relevance of Course"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Course Methodology"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No. Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. of Participants"; Integer)
        {
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Submitted';
            OptionMembers = Open,Submitted;
        }
        field(14; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if No = '' then begin
            HRSetup.Get();
            HRSetup.TestField(HRSetup."Training Evaluation Nos");
            NoSeriesMgt.InitSeries(HRSetup."Training Evaluation Nos", xRec."No. Series", 0D, No, "No. Series");
        end;
        "Created By" := UserId;
        "Created On" := Today;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Course: Record "Training Requests";
        DimVal: Record "Dimension Value";
        HRRec: Record Employee;
        TrainingRequests: Record "Training Requests";
}

