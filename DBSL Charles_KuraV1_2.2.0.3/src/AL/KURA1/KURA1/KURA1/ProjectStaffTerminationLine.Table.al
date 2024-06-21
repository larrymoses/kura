#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72150 "Project Staff Termination Line"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            
            Editable = false;
        }
        field(3;"Resource No.";Code[20])
        {
            
            Description = 'Resource.No. WHERE (Type=FILTER(Person),Blocked=FILTER(No))';
        }
        field(4;Name;Text[250])
        {
            
        }
        field(5;"Termination  Date";Date)
        {
            
        }
        field(6;"Termination Category";Option)
        {
            
            OptionCaption = ' ,Normal Staff Exit,Contract Expiry,Project Demobilization';
            OptionMembers = " ","Normal Staff Exit","Contract Expiry","Project Demobilization";
        }
        field(7;"Termination Details";Text[250])
        {
            
        }
        field(8;Email;Text[250])
        {
            
        }
        field(9;"Appointment Document No.";Code[20])
        {
            
        }
        field(10;"Project Start Date";Date)
        {
            
        }
        field(11;"Project End Date";Date)
        {
            
        }
        field(12;"Role Code";Code[20])
        {
            
            TableRelation = "Project Staff Role Code"."Staff Role Code";
        }
        field(13;Designation;Text[250])
        {
            
        }
        field(14;"Staff Category";Option)
        {
            
            OptionCaption = '  ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = "  ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(15; "Project ID"; Code[20])
        {
            
        }
        field(16; "Notice Period (Days)"; Duration)
        {
            
        }
        field(17; "Termination Effective  Date"; Date)
        {
            
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

