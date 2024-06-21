#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72146 "Project Staff Appointment Role"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Staff Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where ("Team Type"=filter("Internal Project Team"));
        }
        field(3;Designation;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = "  ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(5;"Min  No. of Recommended Staff";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Min  No. of Recommended Staff';
        }
        field(6;"Actual No. of Appointed Staff";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Actual No. of Appointed Staff';
        }
    }

    keys
    {
        key(Key1;"Document No.","Staff Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

