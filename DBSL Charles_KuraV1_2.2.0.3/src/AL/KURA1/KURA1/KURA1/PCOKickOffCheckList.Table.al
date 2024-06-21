#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72213 "PCO Kick Off CheckList"
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
        field(3;"Requirement ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Complied,Non-Compliance';
            OptionMembers = " ",Complied,"Non-Compliance";
        }
        field(6;"Additional Remarks/Comments";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Percentage COmpletion";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Requirement ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

