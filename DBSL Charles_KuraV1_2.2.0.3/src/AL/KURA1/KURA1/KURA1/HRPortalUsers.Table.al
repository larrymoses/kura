#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 56903 "HRPortalUsers"
{

    fields
    {
        field(1;"code";Integer)
        {
            AutoIncrement = true;
        }
        field(2;employeeNo;Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(3;IdNo;Code[20])
        {
        }
        field(4;password;Text[250])
        {
            ExtendedDatatype = None;
        }
        field(5;changedPassword;Boolean)
        {
        }
        field(6;EmployeeUserID;Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
    }

    keys
    {
        key(Key1;"code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

