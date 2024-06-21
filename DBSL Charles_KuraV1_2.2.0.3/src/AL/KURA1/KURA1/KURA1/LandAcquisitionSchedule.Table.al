#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72401 "Land Acquisition Schedule"
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
            OptionCaption = ' ,Land Acquisition Workorder, Gazetted Acquisition Voucher';
            OptionMembers = " ","Land Acquisition Workorder"," Gazetted Acquisition Voucher";
        }
        field(3;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Land Parcel No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Area to be acquired (HA)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 4:4;
        }
        field(6;"Primary Owner Rep ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;County;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Sub County";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Location;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Sub Location";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Line No","Land Parcel No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

