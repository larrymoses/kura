#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95121 "RMP Role"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Executive Summary";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Risk Management Team";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Project Team (Internal Staff)";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Project Team (Internal Staff)';
        }
        field(8;"Project Team(Contractor Staff)";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Project Team(Contractor Staff)';
        }
        field(9;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

