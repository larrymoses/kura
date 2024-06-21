#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72096 "Employment Detailss"
{

    fields
    {
        field(1;"Header No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Contract No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Contract Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Revision Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Original,Rev1,Rev2,Rev3,Rev4,Rev5';
            OptionMembers = " ",Original,Rev1,Rev2,Rev3,Rev4,Rev5;
        }
        field(8;"Engineers Estimate";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Remarks;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

