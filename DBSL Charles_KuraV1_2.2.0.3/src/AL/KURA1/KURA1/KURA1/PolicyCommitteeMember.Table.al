#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80119 "Policy Committee Member"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Policy Committee Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Policy Formulation,Policy Approval';
            OptionMembers = "Policy Formulation","Policy Approval";
        }
        field(4;"Resource No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Role;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Secretary,Chairperson,Consultant,Other';
            OptionMembers = Member,Secretary,Chairperson,Consultant,Other;
        }
        field(7;"Tenure Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Tenure End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

