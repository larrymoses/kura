#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72008 "Road Facility Type"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Facility Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Structure,Furniture';
            OptionMembers = " ",Structure,Furniture;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Inventory;Integer)
        {
            CalcFormula = count("Road Facility Item" where ("Facility  No."=field(Code)));
            FieldClass = FlowField;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Road Code";Code[20])
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
        key(Key2;"Road Code")
        {
        }
        key(Key3;"Facility Type")
        {
        }
    }

    fieldgroups
    {
    }
}

