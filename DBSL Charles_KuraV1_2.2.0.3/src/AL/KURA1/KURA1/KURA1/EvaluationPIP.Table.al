#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80238 "Evaluation PIP"
{
    DrillDownPageID = "Evaluation Improvement Plan";
    LookupPageID = "Evaluation Improvement Plan";

    fields
    {
        field(1;"Perfomance Evaluation No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Perfomance Evaluation".No;
        }
        field(2;"PIP Number";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"PIP Category";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evaluation PIP Category".Code;
        }
        field(4;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Score; Decimal)
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
        field(8; "Improvement Goal"; Text[550])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Action Required"; Text[550])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Perfomance Evaluation No","PIP Number","PIP Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

