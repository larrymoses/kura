#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95110 "Risk Rating Scale"
{
    DrillDownPageID = "Risk Rating Scales";
    LookupPageID = "Risk Rating Scales";

    fields
    {
        field(1;"Risk Rating Scale Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Likelihood Rating,Impact Rating,Overall Risk Rating,Risk Appetite Rating';
            OptionMembers = " ","Likelihood Rating","Impact Rating","Overall Risk Rating","Risk Appetite Rating";
        }
        field(2;"Rating Scale ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Additional Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Risk Rating Scale Type","Rating Scale ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

