#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69626 "Position Work Condition"
{

    fields
    {
        field(1;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions";
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Work Condition Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'General Work Environment,Travel/Relocation,Special Tools & Equipment,Other Special Conditions,Workplace Rules';
            OptionMembers = "General Work Environment","Travel/Relocation","Special Tools & Equipment","Other Special Conditions","Workplace Rules";
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Position ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

