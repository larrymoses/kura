#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72020 "Study Cost Benefit Matrix"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Study ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Option ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Entry Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Cost,Benefit';
            OptionMembers = " ",Cost,Benefit;
        }
        field(5;"Year code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Year Codes"."Year Code";
        }
        field(6;Description;Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Amount/Value (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Study ID","Option ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

