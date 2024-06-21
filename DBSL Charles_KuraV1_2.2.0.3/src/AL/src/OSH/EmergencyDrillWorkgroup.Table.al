#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69438 "Emergency Drill Workgroup"
{

    fields
    {
        field(1;"Drill ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Emergency Drill Log"."Drill ID";
        }
        field(2;"Record Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Emergency Response","To-be Informed";
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Workgroup Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Safety Workgroup"."Workgroup ID" where (Blocked=const(false));
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Contact Person";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Telephone No.";Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(8;Email;Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(9;"Date Informed";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Comments/Additional Notes";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Drill ID","Record Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
