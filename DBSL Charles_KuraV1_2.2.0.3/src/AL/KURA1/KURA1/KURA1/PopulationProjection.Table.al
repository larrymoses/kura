#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72034 "Population Projection"
{
    DrillDownPageID = "Road Study Result";
    LookupPageID = "Road Study Result";

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Study ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Study Task ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Impact Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Education,Hosuing,Economic,Social';
            OptionMembers = " ",Education,Hosuing,Economic,Social;
        }
        field(5;"Report Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Draft/Interim,Final';
            OptionMembers = " ","Draft/Interim",Final;
        }
        field(6;Description;Text[1000])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Study ID","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

