#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95123 "RMP Project Risk Mgt Team"
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
        field(3;"Work Execution Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Project Staff Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal/Inhouse Staff,Contractor Staff';
            OptionMembers = " ","Internal/Inhouse Staff","Contractor Staff";
        }
        field(6;"Staff No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Telephone;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Work Execution Plan ID","Role Code","Project Staff Type","Staff No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

