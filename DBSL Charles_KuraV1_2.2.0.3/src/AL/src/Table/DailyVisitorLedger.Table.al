#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72257 "Daily Visitor Ledger"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Daily Work Record ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document No.";
        }
        field(3;"Job No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID";
        }
        field(4;"Visitor Name";Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Organization;Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Time In";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Time Out";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Purpose of Visit";Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Telephone No.";Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(10;"ID/Passport No.";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Visitor Email";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Site Induction Done";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13;Remarks;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Work Execution Programme ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"),
                                                                                "Project ID"=field("Job No."));
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

