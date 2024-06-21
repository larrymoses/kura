#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69220 "Training Requests"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
            Editable = true;

            trigger OnValidate()
            begin
                if "Available Funds" <> xRec."Available Funds" then begin
                    HRSetup.Get;
                    NoSeriesMgt.TestManual(HRSetup."Training Application Nos.");
                    Code := '';
                end;
            end;
        }
        field(2; "Course Title"; Code[20])
        {
            NotBlank = false;
            TableRelation = "Planning Line Entry"."Course ID" where("Training Plan Id" = field("Training Plan No."),
                                                                     "Planned Department" = field("Employee Department"));

            trigger OnValidate()
            begin
                PlanningLineEntry.Reset;
                PlanningLineEntry.SetRange("Course ID", "Course Title");
                if PlanningLineEntry.FindSet then begin
                    TrainingPlanLines.Reset;
                    TrainingPlanLines.SetRange("Course Title", PlanningLineEntry."Course ID");
                    if TrainingPlanLines.FindSet then begin
                        TrainingPlanLines.CalcFields("Course Description");
                        Description := TrainingPlanLines."Course Description";
                    end;
                    "Start DateTime" := PlanningLineEntry."Planned Start Date";
                    "Training Duration Hrs" := PlanningLineEntry."Training Duration Hrs";
                    "End DateTime" := PlanningLineEntry."Planned End Date";
                    Provider := PlanningLineEntry."Planned Service Provider";
                    PlanningLineEntry.CalcFields("Planned Service Provider Name");
                    "Provider Name" := PlanningLineEntry."Planned Service Provider Name";
                    "Planned Budget" := PlanningLineEntry."Planned Budget";
                    "Planned No. to be Trained" := PlanningLineEntry."Planned No. to be Trained";
                    "Training Type" := PlanningLineEntry."Training Type";

                end;
            end;
        }
        field(3; "Start DateTime"; Date)
        {
            Editable = false;
        }
        field(4; "End DateTime"; Date)
        {
            Editable = false;
        }
        field(5; "Duration Units"; Option)
        {
            Editable = false;
            Enabled = false;
            OptionMembers = Hours,Days,Weeks,Months,Years;
        }
        field(6; Duration; Decimal)
        {
            Editable = true;
        }
        field(7; Cost; Decimal)
        {
            Editable = false;
        }
        field(8; Location; Text[30])
        {
            Editable = false;
        }
        field(9; Description; Text[100])
        {
            Editable = false;
        }
        field(10; Year; Integer)
        {
        }
        field(11; Provider; Code[20])
        {
            Editable = false;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange(Vend."No.", Provider);
                if Vend.Find('-') then begin
                    "Provider Name" := Vend.Name;
                end;
            end;
        }
        field(12; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected,Closed;
        }
        field(13; "Employee No."; Code[10])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(14; "Application Date"; Date)
        {
            Editable = false;
        }
        field(15; "No. Series"; Code[10])
        {
        }
        field(16; "Employee Department"; Code[10])
        {
            TableRelation = "Responsibility Center";
        }
        field(17; "Employee Name"; Text[50])
        {
        }
        field(18; "Provider Name"; Text[50])
        {
        }
        field(19; "No. of Participants"; Integer)
        {
            CalcFormula = count("Training Participants" where("Training Code" = field(Code)));
            FieldClass = FlowField;
        }
        field(20; "Approved Cost"; Decimal)
        {
        }
        field(21; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(22; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(23; "Actual Start Date"; Date)
        {

            trigger OnValidate()
            var
                NullDate: DateFormula;
            begin
                /*IF Duration <> NullDate THEN
                IF "Actual Start Date" <> 0D THEN BEGIN
                "Actual End Date" := CALCDATE(Duration,"Actual Start Date");
                END
                ELSE
                "Actual End Date" :=  0D;
                */

            end;
        }
        field(24; "Actual End Date"; Date)
        {
        }
        field(25; "Estimated Cost"; Decimal)
        {
            CalcFormula = sum("Training Cost".Cost where("Training ID" = field("Course Title")));
            FieldClass = FlowField;
        }
        field(26; "Imprest Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Training Plan Cost"; Decimal)
        {
            CalcFormula = sum("Training Cost"."Line Amount" where("Training ID" = field(Code)));
            FieldClass = FlowField;
        }
        field(28; Budget; Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where("G/L Account No." = field("GL Account")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; Actual; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("GL Account")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; Commitment; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31; "GL Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(32; "Budget Name"; Code[10])
        {
            Caption = 'Fiscal Year';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(33; "Available Funds"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Local"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Local",Abroad;
        }
        field(35; "Requires Flight"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Supervisor No."; Code[10])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(37; "Supervisor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Training Plan No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("Training Plan No.");
            end;
        }
        field(39; "Training Plan Description"; Text[100])
        {
            CalcFormula = lookup("Training Plan Header".Description where(No = field("Training Plan No.")));
            FieldClass = FlowField;
        }
        field(40; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Created On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Training Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Internal,External;
        }
        field(43; "Training Duration Hrs"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Planned Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Planned No. to be Trained"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Total Per diem Costs"; Decimal)
        {
            CalcFormula = sum("Training Participants"."Total Amount" where("Training Code" = field(Code)));
            FieldClass = FlowField;
        }
        field(47; "Total Procurement Cost"; Decimal)
        {
            CalcFormula = sum("Training Cost"."Line Amount" where("Training ID" = field(Code),
                                                                   "Cost Category" = filter(Procurable)));
            FieldClass = FlowField;
        }
        field(48; "Other Costs"; Decimal)
        {
            CalcFormula = sum("Training Cost"."Line Amount" where("Training ID" = field(Code),
                                                                   "Cost Category" = filter("Other Costs")));
            FieldClass = FlowField;
        }
        field(49; "Service Provider Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50; "Memo No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(51; "Evaluation Summary"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(52; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Training Venue Region Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = "Work Type" where(Category = filter("Project Team"));

            trigger OnValidate()
            begin
                WorkType.Reset;
                WorkType.SetRange(Code, "Training Venue Region Code");
                if WorkType.FindSet then begin
                    "Training Responsibility Code" := WorkType."Responsibility Center Code";
                end
            end;
        }
        field(54; "Training Venue Region"; Text[100])
        {
            CalcFormula = lookup("Work Type".Description where(Code = field("Training Venue Region Code")));
            FieldClass = FlowField;
        }
        field(55; "Training Responsibility Code"; Text[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(56; "Training Responsibility"; Text[50])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Training Responsibility Code")));
            FieldClass = FlowField;
        }
        field(57; Requestor; Text[50])
        {
            DataClassification = ToBeClassified;
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

    trigger OnDelete()
    begin

        if Status <> Status::Open then
            Error(mcontent);
    end;

    trigger OnInsert()
    begin
        if Code = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Training Application Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Training Application Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;
        "Created By" := UserId;
        "Created On" := Today;
        //GET THE REQUESTOR DETAILS
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindSet then begin
            "Employee Name" := UserSetup."Employee No.";
            if HREmp.Get(UserSetup."Employee No.") then begin
                "Employee Department" := HREmp."Department Code";
                "Employee Name" := HREmp.FullName;

            end;

        end;


        HRSetup.Get();
        "Training Plan No." := HRSetup."Annual Training Plan";
    end;

    var
        PlanningLineEntry: Record "Planning Line Entry";
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        mcontent: label 'Status must be new on Training Application No.';
        mcontent2: label '. Please cancel the approval request and try again';
        HREmp: Record Employee;
        Vend: Record Vendor;
        TrainingPlanLines: Record "Training Plan Lines";
        UserSetup: Record "User Setup";
        TrainingParticipants: Record "Training Participants";
        WorkType: Record "Work Type";
}

