#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69429 "HSE Plan Calendar"
{

    fields
    {
        field(1;"Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2;"OSH Activity Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,OSH Training,OSH Meeting,Emergency Drill,OSH Inspection';
            OptionMembers = " ","OSH Training","OSH Meeting","Emergency Drill","OSH Inspection";
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Primary Mission";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Responsibility;Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Plan Role"."Role ID";
        }
        field(7;"Overall Owner ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person),
                                                  Blocked=const(false));
        }
        field(8;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Planned Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Action Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(11;"% Complete";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Activity Priority";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Normal,Low,High;
        }
        field(13;"Actual Date Done";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Venue/Location";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Meeting Medium";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Face to Face",Online;
        }
        field(16;"Evacuation Event ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evacuation Event".Code where (Blocked=const(false));
        }
    }

    keys
    {
        key(Key1;"Plan ID","OSH Activity Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
