#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 51005 "Bridge Transaction"
{

    fields
    {
        field(1;VoucherDate;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(2;VoucherID;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;TRCodeID;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Document Types.Document Type';
        }
        field(4;TrCode;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '//Documen Type.Code';
        }
        field(5;TrDescription;Text[250])
        {
            DataClassification = ToBeClassified;
            Description = '//Line.Description';
        }
        field(6;TxnModule;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'AR|AP';
        }
        field(7;TxnAmount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;TxnDescription;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;TxnReference;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;ProjectID;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;ProjectCode;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;ProjectName;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;ProjectDescription;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14;SupplierAccount;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;SupplierName;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16;Email;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(17;BankName;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(18;BankCode;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19;BankBranchCode;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20;BankBranch;Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Bank Branch Name';
        }
        field(21;BankAccNum;Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Bank Account Number To Account';
        }
        field(22;SourceBankAccount;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(23;SourceBankAccountDescription;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(24;SourceBankName;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(25;SourceBankCode;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26;SourceBankBranch;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '//GL Bank Branch Code';
        }
        field(27;SourceBankAccountName;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(28;Withheld;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29;Retained;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(30;VoucherIDNo;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(31;Flagged;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(32;IsAIE;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(33;TransactionID;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(34;SourceBankAccountNumber;Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Bank Account Number from Account';
        }
        field(35;"Last Transaction ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;TransactionID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Error('You are locked from deleting these record(s)');
    end;
}

