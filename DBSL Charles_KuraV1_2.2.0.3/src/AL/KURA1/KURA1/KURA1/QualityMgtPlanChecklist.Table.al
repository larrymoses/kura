#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72314 "Quality Mgt.  Plan Checklist"
{
    Caption = 'Final Account Line';

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;No;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Response Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Completed,Pending';
            OptionMembers = " ",Completed,Pending;
        }
        field(7;Comments;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Line No","Project ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

