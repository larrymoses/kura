#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 52003 "Planning Team Members"
{

    fields
    {
        field(1;"No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Document No.";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Planning Header"."No.";
        }
        field(3;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Feasibility Study,Road Audit,Environmental Study,Topographical Survey';
            OptionMembers = "Feasibility Study","Road Audit","Environmental Study","Topographical Survey";
        }
        field(4;"Team ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Team Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Role;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Engineer,Surveyor,Environmentalist,Auditor';
            OptionMembers = Engineer,Surveyor,Environmentalist,Auditor;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

