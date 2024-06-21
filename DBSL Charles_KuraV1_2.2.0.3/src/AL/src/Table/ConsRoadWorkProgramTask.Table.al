#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72177 "Cons Road Work Program Task"
{

    fields
    {
        field(1; "Road Work Program ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Package No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "BoQ Template Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Bill Code"."BoQ Template Code";
        }
        field(4; "Bill Item Category Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Bill Code"."Bill Item Category Code" where("BoQ Template Code" = field("BoQ Template Code"));
        }
        field(5; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Begin-Total Job Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End-Total Job Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "No. of Bill Activities"; Integer)
        {
            // CalcFormula = count("New Road Work Program Activity" where ("Road Work Program ID"=field("Road Work Program ID"),
            //                                                             "Budget Entry No"=field("Package No."),
            //                                                             "BoQ Template Code"=field("BoQ Template Code"),
            //                                                             "Bill Item Category Code"=field("Bill Item Category Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Posted Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Posted Begin-Total Job Tsk No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Posted Begin-Total Job Tsk No.';
        }
        field(12; "Posted End-Total Job Task No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Road Work Program ID", "Package No.", "BoQ Template Code", "Bill Item Category Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

