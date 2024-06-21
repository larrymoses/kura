#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72181 "Mobilized Project Objective"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Order-To-Commence,Work Execution Programme';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Objective Verifiable Indicator";Text[2048])
        {
            DataClassification = ToBeClassified;
            Description = 'Objective Verifiable Indicator';
        }
        field(6;"Unit of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(7;"Source of Evidence";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"No. of Project Assumptions";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"No. of Project Constraints";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"No. of Critical Success Factor";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'No. of Critical Success Factors';
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

