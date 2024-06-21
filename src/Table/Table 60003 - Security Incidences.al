table 60003 "Security Incidences"
{
    DrillDownPageID = "Security Incidence List";
    LookupPageID = "Security Incidence List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    CRMSetup.GET;
                    NoSeriesMgt.TestManual(CRMSetup."Security Incidence No.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Severity Level"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Minor,Major,Critical';
            OptionMembers = " ",Minor,Major,Critical;
        }
        field(3; "Incident Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Security Incident Types";

            trigger OnValidate()
            begin
                IF Inctype.GET("Incident Type") THEN
                    "Incident Type Details" := Inctype.Description;
            end;
        }
        field(4; "Incident Type Details"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Time Reported"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Reported By Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(7; Stakeholder; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Stakeholders";
        }
        field(8; "Reporter Number"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = IF ("Reported By Type" = CONST(Internal)) Employee WHERE(Status = FILTER(Active));

            trigger OnValidate()
            begin
                IF Emp.GET("Reporter Number") THEN BEGIN
                    "Reporter Name" := Emp.FullName;
                    "Reporter Email Address" := Emp."Work Phone Number";
                    "Reporter Email Address" := Emp."Company E-Mail"
                END;
            end;
        }
        field(9; "Reporter Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Reporter Phone Number"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Reporter Email Address"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Incident Details"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Approval Status"; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected,,Closed';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected,,Closed;
        }
        field(20; "Incidence Stage"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,In Progress,Closed,Awaiting Closure';
            OptionMembers = New,"In Progress",Closed,"Awaiting Closure";
        }
        field(21; "Time Occured"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Original Doc No"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Date Reported"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Date Occured"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Closed On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Closed By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        IF Rec.Closed THEN
            ERROR('Sorry! You cannot delete a closed incident');
    end;

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            CRMSetup.GET;
            CRMSetup.TESTFIELD("Security Incidence No.");
            NoSeriesMgt.InitSeries(CRMSetup."Security Incidence No.", xRec."No. Series", 0D, "No.", "No. Series");
        END;
        "Date Reported" := WORKDATE;
        IF UserSetup.GET(USERID) THEN BEGIN
            IF UserSetup."User ID" <> 'CUEHQ\ADMINISTRATOR' THEN BEGIN
                Rec.VALIDATE("Reporter Number", UserSetup."Employee No.");
            END;
        END;
    end;

    var
        CRMSetup: Record "CRM Setups";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimMgt: Codeunit DimensionManagement;
        Emp: Record Employee;
        Inctype: Record "Security Incident Types";
        UserSetup: Record "User Setup";
}

