#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72243 "Daily Work Record Visitor"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Visitor Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Organization;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Time In";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Time Out";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Purpose of Visit";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Telephone No.";Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(9;"ID/Passport No.";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Site Induction Done";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;Remarks;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Visitor Email";Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(13;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         DailyWorkRecord.Reset;
         DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Document No.");
         if DailyWorkRecord.FindSet then begin
          //"Job No.":=DailyWorkRecord."Project ID";
           "Document Date":=DailyWorkRecord."Document Date";
           //"Work Execution Programme ID":=DailyWorkRecord."Work Execution Programme ID";
          end;
    end;

    var
        DailyWorkRecord: Record "Daily Work Record";
}

