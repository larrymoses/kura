#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72032 "Feasibility Study Risk"
{

    fields
    {
        field(1;"Feasibility Study No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Type;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Risk;
            OptionCaption = ' ,Risk,Benefit';
            OptionMembers = " ",Risk,Benefit;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Feasibility Study No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

