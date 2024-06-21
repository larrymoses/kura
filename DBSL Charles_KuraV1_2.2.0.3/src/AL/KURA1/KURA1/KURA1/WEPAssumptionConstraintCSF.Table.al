#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72231 "WEP Assumption_Constraint_CSF"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Order-To-Commence,Work Execution Programme';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Entry Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Project Assumption,Project Constraint,Critical Success Factor';
            OptionMembers = " ","Project Assumption","Project Constraint","Critical Success Factor";
        }
        field(4;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Constraint Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Scope,Schedule,Budget,Other';
            OptionMembers = " ",Scope,Schedule,Budget,Other;
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Additional Contractor Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"No. of Project Goals & Objects";Integer)
        {
            CalcFormula = count("Mobilized Project Obj Detail" where ("Document Type"=field("Document Type"),
                                                                      "Document No."=field("Document No."),
                                                                      "Entry Type"=field("Entry Type")));
            Caption = 'No. of Project Goals & Objectives';
            Description = 'No. of Project Goals & Objectives';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Entry Type","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

