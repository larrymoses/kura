#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72228 "HSM Emergency Contact"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Plan,Template';
            OptionMembers = " ",Plan,Template;
        }
        field(2;"Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Health Safety Plan HeaderS".Code where (Blocked=filter(false));
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Plan Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Company,Project';
            OptionMembers = " ",Company,Project;
        }
        field(5;"Project ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Job.No.';
            TableRelation = if ("Plan Type"=filter(Project)) Job."No.";
        }
        field(6;"Contact Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal/Organization,Contractor,Medical Facility,Ambulance Service,Fire Response,Police/Security,Utility Providers,Others';
            OptionMembers = " ","Internal/Organization",Contractor,"Medical Facility","Ambulance Service","Fire Response","Police/Security","Utility Providers",Others;
        }
        field(7;"Contact Person/Company";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Telephone No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Address;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Plan ID","Line No.")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }
}

