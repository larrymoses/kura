#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80078 "General Assessment Line"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"General Assessment Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Line Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Assessment Area,Question';
            OptionMembers = "Assessment Area",Question;
        }
        field(4;"Assessment Area ID";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Response Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Both Appraisee & Appraiser,Appraisee Only,Appraiser Only';
            OptionMembers = "Both Appraisee & Appraiser","Appraisee Only","Appraiser Only";
        }
        field(6;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

