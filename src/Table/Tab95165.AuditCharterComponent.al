#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95165 "Audit Charter Component"
{
    DrillDownPageID = "Audit Charter Components";
    LookupPageID = "Audit Charter Components";

    fields
    {
        field(1;"Audit Charter ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Component Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mission,Purpose,Standards,Authority,Independence,Scope,Responsibility,Quality Assurance,Other';
            OptionMembers = " ",Mission,Purpose,Standards,Authority,Independence,Scope,Responsibility,"Quality Assurance",Other;
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Audit Charter ID","Component Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

