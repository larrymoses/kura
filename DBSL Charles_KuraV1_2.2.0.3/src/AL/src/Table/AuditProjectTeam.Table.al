#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95208 "Audit Project Team"
{
    DrillDownPageID = "Audit Project Teams";
    LookupPageID = "Audit Project Teams";

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Resource No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where(Type = const(Person));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Resource No.");
                if Resource.FindSet then
                    Name := Resource.Name;
                Employee.Reset;
                Employee.SetRange("No.", "Resource No.");
                if Employee.FindSet then
                    Employee.CalcFields("Job Title");
                "Job Title" := Employee."Job Title";
                "Phone No." := Employee."Phone No.";
                Email := Employee."Company E-Mail";
            end;
        }
        field(3; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Audit Team Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Auditor Team,Auditee Team';
            OptionMembers = " ","Auditor Team","Auditee Team";
        }
        field(5; "Engagement Role"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Default Audit Location ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Job Title"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Phone No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Email; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Resource No.")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        Employee: Record Employee;
}

