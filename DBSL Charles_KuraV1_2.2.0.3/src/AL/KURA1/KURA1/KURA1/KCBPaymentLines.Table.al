#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72265 "KCB Payment Lines"
{

    fields
    {
        field(1;Entry;Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Trcode;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;DrAccount;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;DrName;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;DrBnkCode;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;CrAccount;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;CrName;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;CrBnkCode;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Reference;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Amount;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Batch No";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Payment Narration";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"pay Mode";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Approved;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Amount Decimal";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Entry)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
          Error('You do not have permission to delete this file');
    end;

    trigger OnModify()
    begin

          BankPaymentsBatching.Reset;
          BankPaymentsBatching.SetRange("Batch No","Batch No");
          BankPaymentsBatching.SetRange("Approval  Status",BankPaymentsBatching."approval  status"::Approved);
          if BankPaymentsBatching.FindFirst() then begin
           Error('Document already approved.You cannot modify an approved document.');
          end;
    end;

    var
        BankPaymentsBatching: Record "Bank Payments Batching";
}

