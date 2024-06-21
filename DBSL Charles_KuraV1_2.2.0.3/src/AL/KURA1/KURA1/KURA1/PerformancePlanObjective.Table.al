#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80051 "Performance Plan Objective"
{

    fields
    {
        field(1;"Performance Mgt Plan ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Performance Management Plan".No;
        }
        field(2;"Objective Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[200])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Performance Mgt Plan ID","Objective Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

