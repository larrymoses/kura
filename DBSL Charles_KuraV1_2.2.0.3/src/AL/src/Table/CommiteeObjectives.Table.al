#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80109 "Commitee Objectives"
{

    fields
    {
        field(1;"Committee ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Objective;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Target;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Achievement;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Responsible Person";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "SPM Commitee Members"."Employee No" where ("Ref No"=field("Committee ID"));
        }
        field(7;"Date Achieved";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Committee ID","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

