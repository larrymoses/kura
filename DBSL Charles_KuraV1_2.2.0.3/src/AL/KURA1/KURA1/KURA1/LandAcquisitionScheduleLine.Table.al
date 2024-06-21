#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72403 "Land Acquisition Schedule Line"
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
        field(4;"Land Parcel No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Entry No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Owner,Receipient';
            OptionMembers = " ",Owner,Receipient;
        }
        field(7;No;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Name;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Address;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;City;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Telephone No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Title No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Nature of Title";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Document Type","Line No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

