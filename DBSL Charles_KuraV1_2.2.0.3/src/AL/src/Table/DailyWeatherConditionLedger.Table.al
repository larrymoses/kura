#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72252 "Daily Weather Condition Ledger"
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

            trigger OnValidate()
            begin
                DailyWorkRecord.Reset;
                DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Daily Work Record ID");
                if DailyWorkRecord.FindSet then
                  begin
                   "Posting Date":=DailyWorkRecord."Document Date";
                  end;
            end;
        }
        field(3;"Job No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID" where ("Document No."=field("Daily Work Record ID"));
        }
        field(4;"Average Temperature";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Rainfall (mm)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Other Weather Condition";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Document Date";
        }
        field(8;"Work Execution Programme ID";Code[20])
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

    var
        DailyWorkRecord: Record "Daily Work Record";
}

