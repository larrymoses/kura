#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72088 "Road Authority"
{
    DrillDownPageID = "Road Authorities";
    LookupPageID = "Road Authorities";

    fields
    {
        field(1; "Road Authority Code"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[203])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Address; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Address 2"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5; City; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Post Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Phone No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Email; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Home Page"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Contact No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No. of Road Links"; Integer)
        {
            CalcFormula = count("Road Inventory" where("Original Road Agency" = field("Road Authority Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; "Current Road Agency"; Boolean)
        {
            CalcFormula = exist("Road Management Setup" where("Current Road Authority Code" = field("Road Authority Code")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Road Authority Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

