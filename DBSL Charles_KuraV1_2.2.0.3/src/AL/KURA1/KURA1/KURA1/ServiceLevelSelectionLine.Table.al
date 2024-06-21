#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72048 "Service Level Selection Line"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Category;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Level Selection Categ";
        }
        field(3;"Service Scope";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Level Scope";
        }
        field(4;"Service Creteria";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Level Cretion";
        }
        field(5;"Items To Apply";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Remark;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Project;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Header No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No",Project,"Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

