#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72063 "Incident Notification"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Category;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Caller;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Phone No";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Date Of Incident";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Time of Incident";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Road Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Road Location";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Information Resource";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Nature of Incident";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Location Of Incident";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Condition of Accident Vehicles";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"No. Of Injured People";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15;Project;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Header No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No",Project,"Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

