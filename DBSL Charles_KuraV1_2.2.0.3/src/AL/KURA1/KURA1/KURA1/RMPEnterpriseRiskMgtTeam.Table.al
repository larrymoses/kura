#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95122 "RMP Enterprise Risk Mgt Team"
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
        field(3;"Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Staff No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Telephone;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Role Code","Staff No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

