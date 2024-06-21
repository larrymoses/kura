#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69425 "HSE Plan Section Detail"
{

    fields
    {
        field(1;"Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2;"Section Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Overview,Objective,"Guiding Principle","Revision/Version";
        }
        field(3;"Section Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Entry No.";Integer)
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
        field(7;"Unit of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(8;"Performance Indicator";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Target;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Planned Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Plan ID","Section Type","Section Line No.","Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
