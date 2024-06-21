#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69434 "HSE Plan Line Hazard Control"
{

    fields
    {
        field(1;"Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2;"Hazard ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan Line"."Hazard ID" where ("Plan ID"=field("Plan ID"));
        }
        field(3;"Hazard Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan Line"."Hazard Type" where ("Plan ID"=field("Plan ID"));
        }
        field(4;"Control ID";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Responsibility;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan Role"."Role ID";
        }
        field(7;"Responsible Officer No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Action Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(9;"% Complete";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Task Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Normal,Low,High;
        }
        field(11;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Planned Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Actual Date Done";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Corrective,Preventive;
        }
    }

    keys
    {
        key(Key1;"Plan ID","Hazard ID","Hazard Type","Control ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
