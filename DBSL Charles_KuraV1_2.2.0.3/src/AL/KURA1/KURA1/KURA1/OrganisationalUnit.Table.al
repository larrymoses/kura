#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72000 "Organisational Unit"
{

    fields
    {
        field(1;"Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Name;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Address;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Address 2";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;City;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Post Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Country/Region Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Phone No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Fax No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Name 2";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Contact;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Home Page";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Research Center";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;Region;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16;Overview;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Operating Unit Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Center';
            OptionMembers = " ",Board,"Company-Level",Directorate,Department,"Section/Team",Region,"Branch/Center";
        }
        field(18;"Direct Report Oper. Unit ID";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Direct Reports To Operating Unit ID';
        }
        field(19;"Indirect Report  Oper. Unit ID";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Indirect Reports To Operating Unit ID';
        }
        field(20;"Hierarchical  Level ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Headed By (Title)";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Current Head";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Perf. Contracting Signatory";Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Performance Contracting Signatory';
        }
        field(24;"PC Signatory Title";Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'PC Signatory Title';
        }
        field(25;"PC Signatory Witness";Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'PC Signatory Witness';
        }
        field(26;"PC Signatory Witness Title";Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'PC Signatory Witness Title';
        }
        field(27;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
        key(Key2;"Operating Unit Type","Direct Report Oper. Unit ID","Indirect Report  Oper. Unit ID","Hierarchical  Level ID","Headed By (Title)","Current Head")
        {
        }
    }

    fieldgroups
    {
    }
}

