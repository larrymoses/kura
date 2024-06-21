#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80049 "Object Numbers"
{

    fields
    {
        field(1;EntryNo;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Object Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,TableData,Page,Report,Codeunit,Query,XMLPort';
            OptionMembers = " ",TableData,"Page","Report","Codeunit","Query","XMLPort";
        }
        field(3;"Object No";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Object No Int";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Exist;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Version List";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Modified;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Time;Time)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Compiled;Boolean)
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

