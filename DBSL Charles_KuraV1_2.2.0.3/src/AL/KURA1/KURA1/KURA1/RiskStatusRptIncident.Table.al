#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95131 "Risk Status Rpt Incident"
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
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Risk Incident Category";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Incident Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Severity Level";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Occurrence Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Occurred,Near-Miss';
            OptionMembers = " ",Occurred,"Near-Miss";
        }
        field(9;"Incident Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Incident Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Incident End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Incident Location Details";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Primary Trigger ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Root Cause Summary";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Category of Person Reporting";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(16;"Reported By (Name)";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"HSE Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Hazard ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Actual Financial Impact (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Actual Schedule Delay(Days)";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Actual Schedule Delay/Service Disruption (Days)';
        }
        field(22;"Actual No. Injured Persons";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Actual No. of Fatalities";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Police Report Reference No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Police Report Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Police Station";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Reporting Officer";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Risk Register Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk Register Type","Risk Management Plan ID","Risk ID","Incident Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

