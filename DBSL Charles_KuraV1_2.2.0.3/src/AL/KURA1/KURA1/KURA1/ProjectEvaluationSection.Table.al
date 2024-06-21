#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72333 "Project Evaluation Section"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Evaluation Report,Professional Opinion,Notice of Award';
            OptionMembers = "Evaluation Report","Professional Opinion","Notice of Award";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;Section;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Justification,Scope Impact,Cost Impact,Schedule Impact,Other Impact,Contract Clause,Comments';
            OptionMembers = " ",Justification,"Scope Impact","Cost Impact","Schedule Impact","Other Impact","Contract Clause",Comments;
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.",Section,"Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

