#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 65016 "Funding Source"
{
    DrillDownPageID = "Funding Source List";
    LookupPageID = "Funding Source List";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Funding Agency";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
        }
        field(4;"No. Of Projects";Integer)
        {
            CalcFormula = count(Job where ("Funding Source"=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;"Total Project Budget Ceilings";Decimal)
        {
            DataClassification = ToBeClassified;
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

