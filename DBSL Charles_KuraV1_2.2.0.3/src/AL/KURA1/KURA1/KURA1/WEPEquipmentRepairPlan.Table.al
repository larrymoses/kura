#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72187 "WEP Equipment Repair Plan"
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
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"));
        }
        field(3;"Contractor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Contractor No." where ("Document Type"=filter("Work Execution Programme"));
        }
        field(4;"Equipment No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Entry  No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Equipment Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Maintenance Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Routine Service,Equipment Repair';
            OptionMembers = " ","Routine Service","Equipment Repair";
        }
        field(8;"Scheduled Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"To-do Description";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Responsible Staff No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Contractor No.","Equipment No.","Entry  No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

