#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69430 "HSE Plan Emergency Contact"
{

    fields
    {
        field(1;"Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Safety Workgroup ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Safety Workgroup"."Workgroup ID" where (Blocked=const(false));
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Contact Person";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Phone No.";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Email;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Address;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Plan ID","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
