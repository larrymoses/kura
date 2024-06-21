#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59006 "Fleet Management Setup"
{

    fields
    {
        field(1;"Transport Req No";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(2;"Daily Work Ticket";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(3;"Fuel Register";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(4;"Maintenance Request";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10;"Primary Key";Code[10])
        {
            Caption = 'Primary Key';
        }
        field(11;"Driver Rotation";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(12;"Rotation Interval";DateFormula)
        {
        }
        field(14;"Fuel Payment Batch No";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(15;"Contract  No";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(16;"Fuel Card No";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17;No;Code[20])
        {
            TableRelation = "No. Series";
        }
        field(18;"Sender Email";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Vehicle Inspection  No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(20;"Fuel Top up  No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(21;"Default Fleet Driver";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No.";
        }
        field(22;"Transport Admin Email";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Expiry Notification Period";DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Out of Office Requistion No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(25; "Fuel Expense No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(26; "Fuel Requisitions No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(27; "Fuel Allocation No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Caption = 'Fuel Card Allocation Nos';
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

