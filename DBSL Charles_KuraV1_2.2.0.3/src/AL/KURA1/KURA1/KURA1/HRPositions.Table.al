#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69262 "HR Positions"
{
    DrillDownPageID = "ApprovedDirector Payroll Lines";

    fields
    {
        field(1; "Position ID"; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Position Description"; Text[250])
        {
        }
        field(3; "No of Posts"; Integer)
        {

            trigger OnValidate()
            begin
                if "No of Posts" <> xRec."No of Posts" then
                    "Vacant Positions" := "No of Posts" - "Occupied Positions";
            end;
        }
        field(4; "Occupied Positions"; Integer)
        {
            CalcFormula = count(Employee where("Job ID" = field("Position ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Vacant Positions"; Integer)
        {
        }
        field(6; UserID; Code[50])
        {
        }
        field(7; Status; Option)
        {
            Editable = true;
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(8; "Date Created"; Date)
        {
        }
        field(9; "Position Reporting To"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Positions;
        }
        field(10; "Reporting To Title"; Text[250])
        {
            CalcFormula = lookup(Positions."Job Title" where("Position ID" = field("Position Reporting To")));
            FieldClass = FlowField;
        }
        field(11; Active; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Job Grade"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales".Scale;
        }
        field(13; "Domain Area"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domain Areax".Code;
        }
    }

    keys
    {
        key(Key1; "Position ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Position ID", "Position Description")
        {
        }
    }

    var
        NoOfPosts: Decimal;
        HREmp: Record Employee;
}

