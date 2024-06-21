#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95140 "Risk Incident Ledger Entry"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Posted By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Incident Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(5;"HSE Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Hazard ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Risk Management Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Risk ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Risk Incident Category";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Source Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Risk Incident Log,Risk Status Report,Progress of Works Voucher';
            OptionMembers = " ","Risk Incident Log","Risk Status Report","Progress of Works Voucher";
        }
        field(11;"Source Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Incident Reference ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Incident Description";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Severity Level";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Occurrence Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Occurred,Near-Miss';
            OptionMembers = " ",Occurred,"Near-Miss";
        }
        field(16;"Incident Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Incident Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Incident End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Incident Location Details";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Primary Trigger ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Root Cause Summary";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Category of Person Reporting";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(23;"Reported By (Name)";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Actual Financial Impact (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Actual Schedule Delay(Days)";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'Actual Schedule Delay/Service Disruption (Days)';
        }
        field(26;"Actual No. Injured Persons";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Actual No. of Fatalities";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Police Report Reference No.";Code[52])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Police Report Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Police Station";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Reporting Officer";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Incident Class";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,General Incident,Health/Safety/Environment Incident';
            OptionMembers = " ","General Incident","Health/Safety/Environment Incident";
        }
        field(33;"Project ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Work Execution Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35;"Corporate Strategic Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Year Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Directorate ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Department ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Region ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

