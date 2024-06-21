#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72147 "Staff Appointment Function"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            
        }
        field(2;"Staff Role Code";Code[20])
        {      
            TableRelation = "Project Staff Role Code"."Staff Role Code" where (Blocked=filter(false));
        }
        field(3;"Entry No";Integer)
        {
            Editable=false;
            AutoIncrement = true;
            
        }
        field(4;Description;Text[2048])
        {
            
        }
    }

    keys
    {
        key(Key1;"Document No.","Staff Role Code","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

