#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69111 "Attainment Table Setup"
{

    fields
    {
        field(1;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Attainment;Text[30])
        {
            TableRelation = Qualification.Code;
        }
        field(3;Level;Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code",Attainment,Level)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;Attainment,Level)
        {
        }
    }
}

