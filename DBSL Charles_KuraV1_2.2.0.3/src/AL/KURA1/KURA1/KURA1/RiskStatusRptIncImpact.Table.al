#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95132 "Risk Status Rpt Inc. Impact"
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
        field(5;"Impact Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Impact Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Injury,Fatality (Death),Financial Loss,Schedule Delay/Service Disruption(Days)';
            OptionMembers = " ",Injury,"Fatality (Death)","Financial Loss","Schedule Delay/Service Disruption(Days)";
        }
        field(7;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Unit of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Quantity;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Category of Party Affected";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(11;"Internal Employee No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Contact Details";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Additional Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk ID","Incident Line No.","Impact Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

