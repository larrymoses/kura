#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95113 "Overal Risk Response Action"
{
    DrillDownPageID = "Overal Risk Response Actions";
    LookupPageID = "Overal Risk Response Actions";

    fields
    {
        field(1;"Risk Rating Scale Type";Option)
        {
            DataClassification = ToBeClassified;
            Description = '';
            OptionCaption = ' ,Likelihood Rating,Impact Rating,Overall Risk Rating,Risk Appetite Rating';
            OptionMembers = " ","Likelihood Rating","Impact Rating","Overall Risk Rating","Risk Appetite Rating";
            TableRelation = "Risk Rating Scale Line"."Risk Rating Scale Type";
        }
        field(2;"Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale Line"."Rating Scale ID";
        }
        field(3;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale Line".Code;
        }
        field(4;"Response Action ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Risk Rating Scale Type","Rating Scale ID","Code","Response Action ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

