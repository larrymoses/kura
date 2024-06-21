#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72006 "Pavement Surface Type"
{
    DrillDownPageID = "Pavement Surface Types";
    LookupPageID = "Pavement Surface Types";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Pavement Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Paved,Unpaved';
            OptionMembers = " ",Paved,Unpaved;
        }
        field(4; "Road Length (Kms)"; Decimal)
        {
            CalcFormula = sum("Pavement Surface Entry"."Road Length (Kms)" where("Pavement Category" = const(Paved),
                                                                                  "Pavement Surface Type" = field(Code)));
            FieldClass = FlowField;
        }
        field(5; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "No of Road Section"; Integer)
        {
            CalcFormula = count("Road Section" where("Section Surface Type" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

