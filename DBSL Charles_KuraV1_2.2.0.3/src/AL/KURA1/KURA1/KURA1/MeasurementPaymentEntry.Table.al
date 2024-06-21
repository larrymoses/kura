#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72191 "Measurement & Payment Entry"
{
    DrillDownPageID = "Measurement & Payment Entries";
    LookupPageID = "Measurement & Payment Entries";

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Measurement Sheet,Contractor Notice of Works,Works Inspection,Payment Certificate,Contractor Payment Request,New Job Voucher,Contractor Request for Close-Out,Contractor Request for Post DLP Inspection';
            OptionMembers = " ","Measurement Sheet","Contractor Notice of Works","Works Inspection","Payment Certificate","Contractor Payment Request","New Job Voucher","Contractor Request for Close-Out","Contractor Request for Post DLP Inspection";
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Job No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Job.No.';
        }
        field(4;"Job Task No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Line No.";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(6;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset,Charge (Item),Service';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)",Service;
        }
        field(7;"No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Unit of Measure Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Unit of Measure".Code';
        }
        field(10;"Measurement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Linear/Unit,Areal,Volumetric';
            OptionMembers = " ","Linear/Unit",Areal,Volumetric;
        }
        field(11;"Linear/Unit Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(12;"Length (m)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(13;"Width (m)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(14;"Height/Depth (m)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(15;"Measured Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(16;"Contract Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(17;"Direct Unit Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(18;"Unit Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(19;"Total Cost (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(20;"Gen. Prod. Posting Group";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Gen. Prod. Posting Group';
        }
        field(21;"Technology Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Technology".Code;
        }
        field(22;"Bill Item Category Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Item Category".Code';
        }
        field(23;"Works Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(24;"Works End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0:5;
        }
        field(25;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(27;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Posted By";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(29;Reversed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Reversed By";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31;Paid;Boolean)
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

