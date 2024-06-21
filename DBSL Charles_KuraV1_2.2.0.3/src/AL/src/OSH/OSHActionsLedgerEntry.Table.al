#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 69448 "OSH Actions Ledger Entry"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Source Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Emergency Drill';
            OptionMembers = " ","Emergency Drill";
        }
        field(4;"Source Document No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Action";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"OSH Responsibility";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HSE Role".Code;
        }
        field(7;"Primary Responsibility Center";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(8;"Action Owner ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person));
        }
        field(9;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(11;"Task Priority";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Action Status";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"% Complete";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Evacuation Event ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evacuation Event".Code;
        }
        field(16;"Criteria Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Evacuation Event Drill Criteri".Code where ("Event ID"=field("Evacuation Event ID"));
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}
