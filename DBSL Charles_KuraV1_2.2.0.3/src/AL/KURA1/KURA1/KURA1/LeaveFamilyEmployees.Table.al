#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69135 "Leave Family Employees"
{

    fields
    {
        field(1;Family;Code[20])
        {
            NotBlank = true;
        }
        field(2;"Employee No";Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
        }
        field(3;Remarks;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;Family,"Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

