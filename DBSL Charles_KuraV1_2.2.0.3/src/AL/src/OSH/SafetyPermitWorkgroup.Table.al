#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69444 "Safety Permit Workgroup"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Safe Work Permit Application","Safe Work Completion Report";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Safe Work Permit Header"."Document No.";
        }
        field(3;"Record Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Emergency Response","To-be Informed";
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Workgroup Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Safety Workgroup"."Workgroup ID" where (Blocked=const(false));
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Contact Person";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Telephone No.";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Date Informed";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Comments/Additional Notes";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Record Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
