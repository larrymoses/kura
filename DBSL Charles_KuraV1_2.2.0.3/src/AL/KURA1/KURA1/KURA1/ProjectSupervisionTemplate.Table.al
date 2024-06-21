#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72287 "Project Supervision Template"
{
    DrillDownPageID = "Project Supervision Templates";
    LookupPageID = "Project Supervision Templates";

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Project Checklist Template,Project Evaluation Template';
            OptionMembers = " ","Project Checklist Template","Project Evaluation Template";
        }
        field(2;"Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Project Stage";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mobilization,Execution,Close-out';
            OptionMembers = " ",Mobilization,Execution,"Close-out";
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Primary Supervisor";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Default Response Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Supervision Response Type".Code where (Blocked=filter(false));
        }
        field(7;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Works Inspection,Lab Works,Survey Works';
            OptionMembers = " ","Works Inspection","Lab Works","Survey Works";
        }
    }

    keys
    {
        key(Key1;"Document Type","Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

