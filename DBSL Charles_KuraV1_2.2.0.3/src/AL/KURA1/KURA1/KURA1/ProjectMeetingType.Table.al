#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72164 "Project Meeting Type"
{
    LookupPageId = "Project Meeting Types";
    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Meeting,Event';
            OptionMembers = " ",Meeting,"Event";
        }
        field(3; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Project Stage"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mobilization,Execution,Close-Out';
            OptionMembers = " ",Mobilization,Execution,"Close-Out";
        }
        field(5; "Additional Notes"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "No. Planned"; Integer)
        {
            CalcFormula = count("Project Meeting Register" where("Meeting Type" = field(Code)));
            FieldClass = FlowField;
        }
        field(7; "No. Held"; Integer)
        {
            CalcFormula = count("Project Meeting Register" where("Meeting Type" = field(Code)));
            FieldClass = FlowField;
        }
        field(8; "No. Cancelled"; Integer)
        {
            CalcFormula = count("Project Meeting Register" where("Meeting Type" = field(Code)));
            FieldClass = FlowField;
        }
        field(9; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Code", Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

