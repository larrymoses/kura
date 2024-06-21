#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72172 "Vendor Equipment"
{

    fields
    {
        field(1;"Equipment No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Vendor No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
        }
        field(3;"Equipment Type Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Works Equipment Type".Code where (Blocked=const(false));
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Equipment Category";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Ownership Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Owned,Leased,Purchase Proposal';
            OptionMembers = " ",Owned,Leased,"Purchase Proposal";
        }
        field(7;"Equipment Registration No.";Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Equipment Serial/Registration No.';
        }
        field(8;"Equipment Usability Code";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Excellent,Good,Fair,Beyond Useful Life';
            OptionMembers = " ",Excellent,Good,Fair,"Beyond Useful Life";
        }
        field(9;"Years of Previous Use";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Equipment Condition Code";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Eqpm,Reconditioned Eqpm,Serviced Eqpm';
            OptionMembers = " ","New Eqpm","Reconditioned Eqpm","Serviced Eqpm";
        }
        field(11;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Equipment No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        WorksEquipmentType: Record "Works Equipment Type";
}

