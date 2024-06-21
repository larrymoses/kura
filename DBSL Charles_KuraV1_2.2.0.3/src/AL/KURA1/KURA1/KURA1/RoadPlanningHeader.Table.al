#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 52000 "Road Planning Header"
{

    fields
    {
        field(1; "No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Feasibility Study,Road Audit,Environmental Study,Topgraphic Survey';
            OptionMembers = "Feasibility Study","Road Audit","Environmental Study","Topgraphic Survey";
        }
        field(3; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Region; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(5; Constistuency; Code[50])
        {
            DataClassification = ToBeClassified;
            //   TableRelation = "Responsibility Center" where ("Direct Reports To"=field(Region));
        }
        field(6; Objective; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Date Created"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Project ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(12; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(13; "Project  Name"; Text[30])
        {
            CalcFormula = lookup(Job.Description where("No." = field("Project ID")));
            FieldClass = FlowField;
        }
        field(14; "Project Engineer"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Year Code"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        "Created By" := UserId;
        "Date Created" := Today;
    end;

    var
        Users: Record "User Setup";
}

