#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95138 "Risk Incident Log Action"
{

    fields
    {
        field(1;"Incident ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Action Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Action Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Ongoing,Completed';
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(6;"% Complete";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Actual Date Done";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Responsible Officer No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Task Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal,Low,High';
            OptionMembers = " ",Normal,Low,High;
        }
        field(10;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Planned Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Incident ID","Action Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

