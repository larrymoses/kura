#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80048 "Object Ranges"
{

    fields
    {
        field(1;EntryNo;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Min Range";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:0;
        }
        field(3;MaxRange;Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:0;
        }
        field(4;"Object Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,TableData,Page,Report,Codeunit,Query,XMLPort';
            OptionMembers = " ",TableData,"Page","Report","Codeunit","Query","XMLPort";
        }
        field(5;"Object No";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

