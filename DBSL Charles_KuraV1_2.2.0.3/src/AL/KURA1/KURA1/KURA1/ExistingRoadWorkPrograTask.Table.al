#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72137 "Existing Road Work Progra Task"
{

    fields
    {
        field(1;"Road Work Program ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Job No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Job.No.';
        }
        field(3;"Job Task No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Job Task Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Posting,Heading,Total,Begin-Total,End-Total';
            OptionMembers = Posting,Heading,Total,"Begin-Total","End-Total";
        }
        field(6;"Job Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Bill Item Category Code";Code[20])
        {
            Description = '"Item Category".Code';
        }
        field(8;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Road Work Program ID","Job No.","Job Task No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

