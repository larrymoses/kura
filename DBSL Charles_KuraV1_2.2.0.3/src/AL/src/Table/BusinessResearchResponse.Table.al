#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80222 "Business Research Response"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Business Research Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee Experience,Customer Experience,Post-Project Survey,Custom Survey';
            OptionMembers = "Employee Experience","Customer Experience","Post-Project Survey","Custom Survey";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Survey ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Survey Type";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Target Respondent Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employees,Customers,Contacts,Vendors';
            OptionMembers = Employees,Customers,Contacts,Vendors;
        }
        field(7;"Participant ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Name;Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Project ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Primary Department ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Primary Directorate ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

