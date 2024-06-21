#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69174 "Vendor Training Domains"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Vendor No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(3;"Domain ID";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Domains";
        }
        field(4;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Vendor Name";Text[100])
        {
            CalcFormula = lookup(Vendor.Name where ("No."=field("Vendor No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Line No.","Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Vendor Name","Domain ID")
        {
        }
    }
}

