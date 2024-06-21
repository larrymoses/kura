#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72227 "HSM Hazard  Profile"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Plan,Template';
            OptionMembers = " ",Plan,Template;
        }
        field(2;"Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Health Safety Plan HeaderS".Code where (Blocked=filter(false));
        }
        field(3;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Plan Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Company,Project';
            OptionMembers = " ",Company,Project;
        }
        field(5;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(6;Descripption;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Category;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Physical,Chemical,Biological,Psychosocial,General Environment';
            OptionMembers = " ",Physical,Chemical,Biological,Psychosocial,"General Environment";
        }
    }

    keys
    {
        key(Key1;"Document Type","Plan ID","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

