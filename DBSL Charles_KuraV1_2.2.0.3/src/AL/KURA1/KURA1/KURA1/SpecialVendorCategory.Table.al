#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 70067 "Special Vendor Category"
{
    DrillDownPageID = "Special Vendor Category";
    LookupPageID = "Special Vendor Category";

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
        field(3;"Vendor Group";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',General,Special';
            OptionMembers = ,General,Special;
        }
        field(4;"Vendor Type";Option)
        {
            OptionCaption = 'Local,Foreign';
            OptionMembers = "Local",Foreign;
        }
        field(5;"Default Certifiying Agency";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Certifiying Agency URL";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No of Active Vendors";Integer)
        {
            CalcFormula = count(Vendor where ("Current Vendor Class"=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;Blocked;Boolean)
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

