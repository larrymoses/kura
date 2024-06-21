#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72288 "Supervision Response Type"
{
    DrillDownPageID = "Supervision Response Types";
    LookupPageID = "Supervision Response Types";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Project Checklist Template,Project Evaluation Template';
            OptionMembers = " ","Project Checklist Template","Project Evaluation Template";
        }
        field(4;"Primary Supervisor";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. of Default Resp. Options";Integer)
        {
            CalcFormula = count("Supervision Response Option" where ("Response Type ID"=field(Code)));
            Caption = 'No. of Default Response Options';
            Description = 'No. of Default Response Options';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

