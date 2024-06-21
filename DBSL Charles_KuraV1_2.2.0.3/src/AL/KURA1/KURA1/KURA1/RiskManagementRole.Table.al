#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95107 "Risk Management Role"
{
    DrillDownPageID = "Risk Management Roles";
    LookupPageID = "Risk Management Roles";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '95107';
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Executive Summary";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Directly Reports To";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false));
        }
        field(5;"Indirectly Reports To";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false));
        }
        field(6;"No. of Def Responsibilities";Integer)
        {
            CalcFormula = count("Risk Management Responsibility" where ("Role ID"=field(Code)));
            Description = 'No. of Def Responsibilities';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;Blocked;Boolean)
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

