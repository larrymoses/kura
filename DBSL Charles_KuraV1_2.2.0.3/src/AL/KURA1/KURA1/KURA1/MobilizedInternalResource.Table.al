#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72179 "Mobilized Internal Resource"
{

    fields
    {
        field(1;"Document Type";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Resource No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Name;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Address;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Address 2";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;City;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Post Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Country/Region Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Email;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Telephone;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Designation;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '  ,Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Others';
            OptionMembers = "  ","Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Others;
        }
        field(15;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Expiry Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Person,Machine';
            OptionMembers = " ",Person,Machine;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

