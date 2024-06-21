#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72411 "Road Asset Protection Header"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Water Utility,Electricity Lines,Telephone Lines,Access Road Application,Roadside Development Application,Use of Road Reserve,Adverts & Road Signange';
            OptionMembers = "Water Utility","Electricity Lines","Telephone Lines","Access Road Application","Roadside Development Application","Use of Road Reserve","Adverts & Road Signange";
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Road Side";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Left-Hand Side,Right-Hand Side';
            OptionMembers = " ","Left-Hand Side","Right-Hand Side";
        }
        field(5;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Applicant No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Applicant Name";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Applicant Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Company, Individual';
            OptionMembers = Company," Individual";
        }
        field(9;"Email Address";Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Telephone No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Address;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Address 2";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13;City;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Post Code";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Use of Road Rev Gui Temp ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Reinstatement Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Pending,Complete';
            OptionMembers = " ",Pending,Complete;
        }
        field(17;"Road Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Link Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Road Section No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Section Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21;Location;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Start Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"End Chainage(KM";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Start Longitude";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"End Longitude";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Start Latitude";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27;"End Latitude";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Access Road Length( KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Access Road Width (KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Access Road No of Lanes";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Mode of Payment";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Payment Type Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Bank No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Bank Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Bank Account Branch Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Bank Account A/C No";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Amount Excl. VAT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38;"VAT Rate";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Amount Incl. VAT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Reinstatement Bond Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Reinstatement Bond Bank No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(42;"Reinstatement Bond Bank Name";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(43;"R_smst Bond Bank_Acct_Brch";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(44;"R_stmt Bond Bank_A/C No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

