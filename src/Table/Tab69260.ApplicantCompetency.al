#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69260 "Applicant Competency"
{

    fields
    {
        field(1;"Applicant ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Applicant Profile"."No.";
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Qualification Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Academic,Professional,Awards';
            OptionMembers = Academic,Professional,Awards;
        }
        field(4;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,PhD,Masters,Post-Graduate Diploma,Undergraduate,Diploma,A-Level,O-Level,Primary,Professional Certification,Awards';
            OptionMembers = " ",PhD,Masters,"Post-Graduate Diploma",Undergraduate,Diploma,"A-Level","O-Level",Primary,"Professional Certification",Awards;
        }
        field(5;"Domain Area";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domain Areax";
        }
        field(6;"Qualification Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Start Year";Code[4])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"End Year";Code[4])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Grade;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Comments;Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Applicant ID","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

