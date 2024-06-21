#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69640 "Commitee Terminated Member"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher";
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appointment,Termination';
            OptionMembers = Appointment,Termination;
        }
        field(3;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Member No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Role;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(6;"Member Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Member Email";Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(8;"Telephone No.";Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(9;Designation;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Staff No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"ID/Passport No";Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Tax Registration (PIN) No.";Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Notified on Email";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Date/Time Notified";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Termination Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Expiry Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Original Appointment No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher";
        }
        field(18;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
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

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

