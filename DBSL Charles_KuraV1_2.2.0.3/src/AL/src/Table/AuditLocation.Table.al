#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95171 "Audit Location"
{
    DrillDownPageID = "Audit Locations";
    LookupPageID = "Audit Locations";

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Responsibility Center ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false));
        }
        field(4;"Audit Site Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Within Organization,External to Organization';
            OptionMembers = " ","Within Organization","External to Organization";
        }
        field(5;"Contact Person";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Primary Email";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Telephone No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"No. of Audit Projects";Integer)
        {
            CalcFormula = count("Audit ProjectLocation");
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;Blocked;Boolean)
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

