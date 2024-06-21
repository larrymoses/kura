#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72404 "Encroachment Header"
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
            OptionCaption = ' ,Encroachment Stop Order, Encroachment Close-Out Report';
            OptionMembers = " ","Encroachment Stop Order"," Encroachment Close-Out Report";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Encroachment Stop Order No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Road Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Link Name";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Section No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Section Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Chainage Description";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Start Chainage (KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"End Chainage(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Desired Road Reserve Width (M)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending,Released';
            OptionMembers = Open,Pending,Released;
        }
        field(15;"Region Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Road Start Longitude";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Road End Longitude";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Road Start Latitude";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Road End Latitude";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Lead Surveyor";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Lead Surveyor Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Served to";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Served to Name";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Served to Email";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Created Date/Time";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(27;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"No of Enc. Stop W.O Issued";Decimal)
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

