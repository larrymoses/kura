#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95229 "Audit Execution Meeting Agenda"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Engagement ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Agenda Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Agenda Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Estimate Time (Minutes)";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. of Discussed Items";Integer)
        {
            CalcFormula = count("Audit Execution Meeting Summar" where ("Agenda Code"=field("Agenda Code")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Engagement ID","Agenda Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

