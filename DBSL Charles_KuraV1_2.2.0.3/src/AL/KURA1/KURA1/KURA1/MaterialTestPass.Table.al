#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72295 "Material Test Pass"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Test Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Checklist No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Final Result";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pass,Fail';
            OptionMembers = " ",Pass,Fail;
        }
        field(8;Comments;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Test Type","Project ID","Line No.","Checklist No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

