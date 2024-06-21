#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 51006 "Bridge Sub Transactions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Bridge Sub Transaction";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TransactionID;TransactionID)
                {
                    ApplicationArea = Basic;
                }
                field(VoucherDate;VoucherDate)
                {
                    ApplicationArea = Basic;
                }
                field(VoucherID;VoucherID)
                {
                    ApplicationArea = Basic;
                }
                field(TRCodeID;TRCodeID)
                {
                    ApplicationArea = Basic;
                }
                field(TrCode;TrCode)
                {
                    ApplicationArea = Basic;
                }
                field(TrDescription;TrDescription)
                {
                    ApplicationArea = Basic;
                }
                field(TxnAmount;TxnAmount)
                {
                    ApplicationArea = Basic;
                }
                field(TxnDescription;TxnDescription)
                {
                    ApplicationArea = Basic;
                }
                field(TxnReference;TxnReference)
                {
                    ApplicationArea = Basic;
                }
                field(SupplierAccount;SupplierAccount)
                {
                    ApplicationArea = Basic;
                }
                field(SupplierName;SupplierName)
                {
                    ApplicationArea = Basic;
                }
                field(BankName;BankName)
                {
                    ApplicationArea = Basic;
                }
                field(BankCode;BankCode)
                {
                    ApplicationArea = Basic;
                }
                field(BankBranchCode;BankBranchCode)
                {
                    ApplicationArea = Basic;
                }
                field(BankBranch;BankBranch)
                {
                    ApplicationArea = Basic;
                }
                field(BankAccNum;BankAccNum)
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;GLAccount)
                {
                    ApplicationArea = Basic;
                }
                field(GLAccountDescription;GLAccountDescription)
                {
                    ApplicationArea = Basic;
                }
                field(GLBankName;GLBankName)
                {
                    ApplicationArea = Basic;
                }
                field(GLBankCode;GLBankCode)
                {
                    ApplicationArea = Basic;
                }
                field(GLBankAccNo;GLBankAccNo)
                {
                    ApplicationArea = Basic;
                }
                field(GLBankBranch;GLBankBranch)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(GLBankAccountName;GLBankAccountName)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

