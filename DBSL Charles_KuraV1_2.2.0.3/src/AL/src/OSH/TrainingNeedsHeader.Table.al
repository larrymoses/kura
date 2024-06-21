#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69194 "Training Needs Header"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Employee No"; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    Employee.CalcFields("Department Name");
                    Department := Employee."Department Name";
                    "Date of First Appointment" := Employee."Date Of Join";
                    CompanyPositions.Reset;
                    CompanyPositions.SetRange("Position ID", Employee."Current Position ID");
                    if CompanyPositions.FindFirst then begin
                        "Job Title" := CompanyPositions."Job Title";
                    end;
                    Disabled := Employee.Disabled;
                end
            end;
        }
        field(3; "Employee Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Description; Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "No Series"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Department; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Job Title"; Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Date of First Appointment"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12; "Training Plan No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Plan Header".No;
        }
        field(13; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Rejected,Closed,Approved';
            OptionMembers = Open,"Pending Approval",Rejected,Closed,Approved;
        }
        field(14; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Years Worked"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Years in Current Job Grade';
            // OptionMembers = ,"1 year and below","2-4 years","5 years and above";
        }
        field(18; "Age Bracket"; Text[250])
        {
            DataClassification = ToBeClassified;
            // OptionMembers = ,"18-25","26-35","36-45","46-55","56 and above";
        }
        field(19; "Employee Age"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Highest Academic Qualification"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification;
            // OptionMembers = KCPE,KCSE,"A Level","College certificate",Diploma,"Higher National Diploma","Bachelors Degree","Masters Degree","PhD";
        }
        field(21; "Career Aspirations"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Training Programme Required"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Training Required (to Achieve aspirations)';
        }
        field(23; "Training Attended"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Training Attended (Last 3yrs)';
        }
        field(24; "Archive Document"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                ArchiveReason: Record "Archive Reasons";
                UserSetup: Record "User Setup";
            begin
                if UserSetup.get(UserId) then
                    if UserSetup."Archive Document" then begin
                        if xRec."Archive Document" and not Rec."Archive Document" then begin
                            ArchiveReason.Reset();
                            ArchiveReason.SetRange("Record ID", Rec.RecordId);
                            ArchiveReason.SetRange("Action Type", ArchiveReason."Action Type"::UnArchive);
                            if not ArchiveReason.FindSet() then
                                error('You must state reason(s) to unarchive the document');
                        end;
                    end else
                        error('You are not allowed to archive documents. Please contact your adminstrator')
            end;
        }
        field(25; "FY Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
            Caption = 'Financial Year';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Training Request Nos");
            NoSeriesMgt.InitSeries(HRSetup."Training Request Nos", xRec."No Series", 0D, Code, "No Series");
        end;

        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then begin
            "Employee No" := UserSetup."Employee No.";
            Validate("Employee No");
            "Employee Name" := UserSetup."Employee Name";
        end
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        CompanyPositions: Record "Company Positions";

    procedure HasAttendedTraining(): Boolean
    begin
        exit("Training Attended");
    end;
}
