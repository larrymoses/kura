#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95133 "Risk Status Rpt Inciden Action"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Risk ID";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(4;"Incident Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Action Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(7;"Activity Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Responsibility;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Planned Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk ID","Incident Line No.","Action Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

