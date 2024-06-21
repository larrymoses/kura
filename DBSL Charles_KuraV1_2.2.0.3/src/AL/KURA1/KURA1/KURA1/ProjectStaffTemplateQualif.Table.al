#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72144 "Project Staff Template Qualif"
{

    fields
    {
        field(1;"Key Staff Template ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Staff Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code";
        }
        field(3;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Masters,Post-Graduate Diploma,Undergraduate,HND-Diploma,Diploma,A-Level,O-Level,Professional Certification';
            OptionMembers = " ",Masters,"Post-Graduate Diploma",Undergraduate,"HND-Diploma",Diploma,"A-Level","O-Level","Professional Certification";
        }
        field(5;"Min Qualification Requirements";Text[250])
        {
            DataClassification = ToBeClassified;
            Description = 'Min Qualification Requirements';
        }
    }

    keys
    {
        key(Key1;"Key Staff Template ID","Staff Role Code","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

