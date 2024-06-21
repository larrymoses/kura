#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69119 "Position Responsibilities"
{

    fields
    {
        field(1;"Job ID";Code[20])
        {
            DataClassification = ToBeClassified;
            NotBlank = true;
            TableRelation = Positions;
        }
        field(2;Responsibility;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Remarks;Text[80])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Job ID","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

