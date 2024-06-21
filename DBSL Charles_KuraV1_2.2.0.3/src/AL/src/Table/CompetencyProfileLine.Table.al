#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80072 "Competency Profile Line"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Competency Profile ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Competency Profile";
        }
        field(3;"Competency Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Core/Required,Desired/Added';
            OptionMembers = "Core/Required","Desired/Added";
        }
        field(4;"Competency ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Competency;
        }
        field(5;Description;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Competency Rating Scale";Code[200])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Competency Proficiency Scale";
        }
    }

    keys
    {
        key(Key1;"Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

