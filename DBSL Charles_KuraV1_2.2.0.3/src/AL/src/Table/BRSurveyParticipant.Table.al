#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 80221 "BR Survey Participant"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Target Respondent Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employees,Customers,Contacts,Vendors';
            OptionMembers = Employees,Customers,Contacts,Vendors;
        }
        field(3;"Participant ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Name;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Email;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Response Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Invited;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Date Invited";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Time Invited";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Invited By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Survey Response ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Target Respondent Type","Participant ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

