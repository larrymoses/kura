#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 51006 "Bridge Sub Transaction"
{

    fields
    {
        field(1;TransactionID;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;VoucherDate;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;VoucherID;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4;TRCodeID;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;TrCode;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;TrDescription;Text[250])
        {
            DataClassification = ToBeClassified;
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
        field(10;SupplierAccount;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;SupplierName;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12;BankName;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(13;BankCode;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;BankBranchCode;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;BankBranch;Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Bank Branch Name';
        }
        field(16;BankAccNum;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17;GLAccount;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;GLAccountDescription;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(19;GLBankName;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(20;GLBankCode;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21;GLBankAccNo;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22;GLBankBranch;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(23;Status;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24;GLBankAccountName;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;TransactionID,TxnAmount)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

