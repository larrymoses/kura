#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69408 "Safety Permit Checklist"
{

    fields
    {
        field(1;"Permit Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Safe Work Permit Type".Code;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Condition Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pre-works,Post-Works';
            OptionMembers = " ","Pre-works","Post-Works";
        }
        field(5;"Requirement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mandatory,Optional';
            OptionMembers = " ",Mandatory,Optional;
        }
        field(6;"Severity Level for Violation";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Incident Severity Level".Code;
        }
    }

    keys
    {
        key(Key1;"Permit Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
