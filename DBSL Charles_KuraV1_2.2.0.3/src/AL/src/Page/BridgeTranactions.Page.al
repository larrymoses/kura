#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 51005 "Bridge Tranactions"
{
    Editable = false;
    PageType = List;
    SourceTable = "Bridge Transaction";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field(TxnModule;TxnModule)
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
                field(ProjectID;ProjectID)
                {
                    ApplicationArea = Basic;
                }
                field(ProjectCode;ProjectCode)
                {
                    ApplicationArea = Basic;
                }
                field(ProjectName;ProjectName)
                {
                    ApplicationArea = Basic;
                }
                field(ProjectDescription;ProjectDescription)
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
                field(Email;Email)
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
                field(SourceBankAccount;SourceBankAccount)
                {
                    ApplicationArea = Basic;
                }
                field(SourceBankAccountDescription;SourceBankAccountDescription)
                {
                    ApplicationArea = Basic;
                }
                field(SourceBankName;SourceBankName)
                {
                    ApplicationArea = Basic;
                }
                field(SourceBankCode;SourceBankCode)
                {
                    ApplicationArea = Basic;
                }
                field(SourceBankBranch;SourceBankBranch)
                {
                    ApplicationArea = Basic;
                }
                field(SourceBankAccountName;SourceBankAccountName)
                {
                    ApplicationArea = Basic;
                }
                field(Withheld;Withheld)
                {
                    ApplicationArea = Basic;
                }
                field(Retained;Retained)
                {
                    ApplicationArea = Basic;
                }
                field(VoucherIDNo;VoucherIDNo)
                {
                    ApplicationArea = Basic;
                }
                field(Flagged;Flagged)
                {
                    ApplicationArea = Basic;
                }
                field(IsAIE;IsAIE)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionID;TransactionID)
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

