codeunit 50016 "Workflow Event H_andling Ext"
{
    trigger OnRun()
    begin
    end;

    procedure RunWorkflowOnSendImprestMemoForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendImprestMemoForApproval'));
    end;

    procedure RunWorkflowOnSendCollateralApplicationForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendCollateralApplicationForApproval'));
    end;

    procedure RunWorkflowOnSendCollateralReleaseForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendCollateralReleaseForApproval'));
    end;

    procedure RunWorkflowOnSendMemberApplicationForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendMemberApplicationForApproval'));
    end;

    procedure RunWorkflowOnSendMemberUpdateForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendMemberUpdateForApproval'));
    end;

    procedure RunWorkflowOnSendPaymentVoucherForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendPaymentVoucherForApproval'));
    end;

    procedure RunWorkflowOnSendJournalVoucherForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendJournalVoucherForApproval'));
    end;

    procedure RunWorkflowOnSendTellerTransactionForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendTellerTransactionForApproval'));
    end;

    procedure RunWorkflowOnSendStandingOrderForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendStandingOrderForApproval'));
    end;

    procedure RunWorkflowOnSendMemberFixedDepositForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendMemberFixedDepositForApproval'));
    end;

    procedure RunWorkflowOnSendBankersChequeForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendBankersChequeForApproval'));
    end;

    procedure RunWorkflowOnSendATMApplicationForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendATMApplicationForApproval'));
    end;

    procedure RunWorkflowOnSendLoanBatchForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendLoanBatchForApproval'));
    end;

    procedure RunWorkflowOnSendMemberExitForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendMemberExitForApproval'));
    end;

    procedure RunWorkflowOnSendGuarantorMgtForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendGuarantorMgtForApproval'));
    end;

    procedure RunWorkflowOnSendLoanRecoveryForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendLoanRecoveryForApproval'));
    end;

    procedure RunWorkflowOnSendMemberActivationForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendMemberActivationForApproval'));
    end;

    procedure RunWorkflowOnSendCheckOffForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendCheckOffForApproval'));
    end;

    procedure RunWorkflowOnSendChequeBookApplicationForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendChequeBookApplicationForApproval'));
    end;

    procedure RunWorkflowOnSendChequeBookTransactionForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendChequeBookTransactionForApproval'));
    end;

    procedure RunWorkflowOnSendInterAccountTransferForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendInterAccountTransferForApproval'));
    end;

    procedure RunWorkflowOnSendAccountOpenningForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendAccountOpenningForApproval'));
    end;

    procedure RunWorkflowOnSendBosaReceiptForApprovalCode(): code[128]
    var
    begin
        exit(UpperCase('RunWorkflowOnSendBosaReceiptForApproval'));
    end;
    // 
    //     procedure RunWorkflowOnSendMobileApplicationForApprovalCode(): code[128]
    //     var
    //     begin
        //         exit(UpperCase('RunWorkflowOnSendMobileApplicationForApproval'));
        //     end;

    procedure RunWorkflowOnSendLoanApplicationForApproval(var ImprestMemo: Record "Imprest Memo")
    var
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendImprestMemoForApprovalCode, ImprestMemo);
    end;
    /*
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendCollateralApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnSendCollateralApplicationForApproval(var CollateralApplication: Record "Collateral Application")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendCollateralApplicationForApprovalCode, CollateralApplication);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendCollateralReleaseForApproval', '', true, true)]
    procedure RunWorkflowOnSendCollateralReleaseForApproval(var CollateralRelease: Record "Collateral Release")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendCollateralReleaseForApprovalCode, CollateralRelease);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendMemberApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnSendMemberApplicationForApproval(var MemberApplication: Record "Member Application")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendMemberApplicationForApprovalCode, MemberApplication);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendMemberUpdateForApproval', '', true, true)]
    procedure RunWorkflowOnSendMemberUpdateForApproval(var MemberUpdate: Record "Member Editing")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendMemberUpdateForApprovalCode, MemberUpdate);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendPaymentVoucherForApproval', '', true, true)]
    procedure RunWorkflowOnSendPaymentVoucherForApproval(var PaymentVoucher: Record "Payments Header")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendPaymentVoucherForApprovalCode, PaymentVoucher);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendJournalVoucherForApproval', '', true, true)]
    procedure RunWorkflowOnSendJournalVoucherForApproval(var JournalVoucher: Record "JV Header")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendJournalVoucherForApprovalCode, JournalVoucher);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendTellerTransactionForApproval', '', true, true)]
    procedure RunWorkflowOnSendTellerTransactionForApproval(var TellerTransaction: Record "Teller Transactions")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendTellerTransactionForApprovalCode, TellerTransaction);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendStandingOrderForApproval', '', true, true)]
    procedure RunWorkflowOnSendStandingOrderForApproval(var StandingOrder: Record "Standing Order")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendStandingOrderForApprovalCode, StandingOrder);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendMemberFixedDepositForApproval', '', true, true)]
    procedure RunWorkflowOnSendMemberFixedDepositForApproval(var FixedDeposit: Record "Fixed Deposit Register")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendMemberFixedDepositForApprovalCode, FixedDeposit);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendBankersChequeForApproval', '', true, true)]
    procedure RunWorkflowOnSendBankersChequeForApproval(var BankersCheque: Record "Bankers Cheque")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendBankersChequeForApprovalCode, BankersCheque);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendATMApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnSendATMApplicationForApproval(var ATMApplication: Record "ATM Application")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendATMApplicationForApprovalCode, ATMApplication);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendLoanBatchForApproval', '', true, true)]
    procedure RunWorkflowOnSendLoanBatchForApproval(var LoanBatch: Record "Loan Batch Header")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendLoanBatchForApprovalCode, LoanBatch);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendMemberExitForApproval', '', true, true)]
    procedure RunWorkflowOnSendMemberExitForApproval(var MemberExit: Record "Member Exit Header")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendMemberExitForApprovalCode, MemberExit);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendGuarantorMgtForApproval', '', true, true)]
    procedure RunWorkflowOnSendGuarantorMgtForApproval(var GuarantorMgt: Record "Guarantor Header")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendGuarantorMgtForApprovalCode, GuarantorMgt);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendLoanRecoveryForApproval', '', true, true)]
    procedure RunWorkflowOnSendLoanRecoveryForApproval(var LoanRecovery: Record "Loan Recovery Header")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendLoanRecoveryForApprovalCode, LoanRecovery);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendMemberActivationForApproval', '', true, true)]
    procedure RunWorkflowOnSendMemberActivationForApproval(var MemberActivation: Record "Member Activations")var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendMemberActivationForApprovalCode, MemberActivation);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendCheckOffForApproval', '', true, true)]
    procedure RunWorkflowOnCheckOffForApproval(CheckOff: Record "Checkoff Header");
    var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendCheckOffForApprovalCode, CheckOff);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendChequeBookApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnChequeBookApplicationForApproval(ChequeBookApplication: Record "Cheque Book Applications");
    var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendChequeBookApplicationForApprovalCode, ChequeBookApplication);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendChequeBookTransactionForApproval', '', true, true)]
    procedure RunWorkflowOnChequeBookTransactionForApproval(ChequeBookTransaction: Record "Cheque Book Transactions");
    var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendChequeBookTransactionForApprovalCode, ChequeBookTransaction);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendInterAccountTransferForApproval', '', true, true)]
    procedure RunWorkflowOnInterAccountTransferForApproval(InterAccountTransfer: Record "Inter Account Transfer");
    var begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendInterAccountTransferForApprovalCode, InterAccountTransfer);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendAccountOpenningForApproval', '', true, true)]
    procedure RunWorkflowOnAccountOpenningForApproval(AccountOpenning: Record "Account Openning");
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendAccountOpenningForApprovalCode, AccountOpenning);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendBosaReceiptForApproval', '', true, true)]
    procedure RunWorkflowOnBosaReceiptForApproval(BosaReceipt: Record "Receipt Header");
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendBosaReceiptForApprovalCode, BosaReceipt);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnSendMobileApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnMobileApplicationForApproval(MobileApplication: Record "Mobile Applications");
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendMobileApplicationForApprovalCode, MobileApplication);
    end;
    */
    procedure RunWorkflowOnCancelLoanApplicationApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelLoanApplicationForApproval'));
    end;
    /*
    procedure RunWorkflowOnCancelCollateralApplicationApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelCollateralApplicationForApproval'));
    end;
    procedure RunWorkflowOnCancelCollateralReleaseApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelCollateralReleaseForApproval'));
    end;
    procedure RunWorkflowOnCancelMemberApplicationApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelMemberApplicationForApproval'));
    end;
    procedure RunWorkflowOnCancelMemberUpdateApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelMemberUpdateForApproval'));
    end;
    procedure RunWorkflowOnCancelPaymentVoucherApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelPaymentVoucherForApproval'));
    end;
    procedure RunWorkflowOnCancelJournalVoucherApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelJournalVoucherForApproval'));
    end;
    procedure RunWorkflowOnCancelTellerTransactionApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelTellerTransactionForApproval'));
    end;
    procedure RunWorkflowOnCancelStandingOrderApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelStandingOrderForApproval'));
    end;
    procedure RunWorkflowOnCancelMemberFixedDepositApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelMemberFixedDepositForApproval'));
    end;
    procedure RunWorkflowOnCancelBankersChequeApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelBankersChequeForApproval'));
    end;
    procedure RunWorkflowOnCancelATMApplicationApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelATMApplicationForApproval'));
    end;
    procedure RunWorkflowOnCancelLoanBatchApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelLoanBatchForApproval'));
    end;
    procedure RunWorkflowOnCancelMemberExitApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelMemberExitForApproval'));
    end;
    procedure RunWorkflowOnCancelGuarantorMgtApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelGuarantorMgtForApproval'));
    end;
    procedure RunWorkflowOnCancelLoanRecoveryApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelLoanRecoveryForApproval'));
    end;
    procedure RunWorkflowOnCancelMemberActivationApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelMemberActivationForApproval'));
    end;
    procedure RunWorkflowOnCancelCheckOffApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelCheckOffForApproval'));
    end;
    procedure RunWorkflowOnCancelChequeBookApplicationApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelChequeBookApplicationForApproval'));
    end;
    procedure RunWorkflowOnCancelChequeBookTransactionApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelChequeBookTransactionForApproval'));
    end;
    procedure RunWorkflowOnCancelInterAccountTransferApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelInterAccountTransferForApproval'));
    end;
    procedure RunWorkflowOnCancelAccountOpenningApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelAccountOpenningForApproval'));
    end;
    procedure RunWorkflowOnCancelBosaReceiptApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelBosaReceiptForApproval'));
    end;
    procedure RunWorkflowOnCancelMobileApplicationApprovalCode(): Code[128]begin
        exit(UpperCase('RunWorkflowOnCancelMobileApplicationForApproval'));
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelLoanApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnCancelLoanApplicationForApproval(var LoanApplication: Record "Loan Application")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelLoanApplicationApprovalCode, LoanApplication);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelCollateralApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnCancelCollateralApplicationForApproval(var Collateral: Record "Collateral Application")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelCollateralApplicationApprovalCode, Collateral);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelCollateralReleaseForApproval', '', true, true)]
    procedure RunWorkflowOnCancelCollateralReleaseForApproval(var CollateralRelease: Record "Collateral Release")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelCollateralReleaseApprovalCode, CollateralRelease);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelMemberApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnCancelMemberApplicationForApproval(var MemberApplication: Record "Member Application")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelMemberApplicationApprovalCode, MemberApplication);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelMemberUpdateForApproval', '', true, true)]
    procedure RunWorkflowOnCancelMemberUpdateForApproval(var MemberUpdate: Record "Member Editing")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelMemberUpdateApprovalCode, MemberUpdate);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelPaymentVoucherForApproval', '', true, true)]
    procedure RunWorkflowOnCancelPaymentVoucherForApproval(var PaymentVoucher: Record "Payments Header")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelPaymentVoucherApprovalCode, PaymentVoucher);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelJournalVoucherForApproval', '', true, true)]
    procedure RunWorkflowOnCancelJournalVoucherForApproval(var JournalVoucher: Record "JV Header")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelJournalVoucherApprovalCode, JournalVoucher);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelTellerTransactionForApproval', '', true, true)]
    procedure RunWorkflowOnCancelTellerTransactionForApproval(var TellerTransaction: Record "Teller Transactions")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelTellerTransactionApprovalCode, TellerTransaction);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelStandingOrderForApproval', '', true, true)]
    procedure RunWorkflowOnCancelStandingOrderForApproval(var StandingOrder: Record "Standing Order")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelStandingOrderApprovalCode, StandingOrder);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelMemberFixedDepositForApproval', '', true, true)]
    procedure RunWorkflowOnCancelMemberFixedDepositForApproval(var FixedDeposit: Record "Fixed Deposit Register")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelMemberFixedDepositApprovalCode, FixedDeposit);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelBankersChequeForApproval', '', true, true)]
    procedure RunWorkflowOnCancelBankersCheuqueForApproval(var BankersCheque: Record "Bankers Cheque")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelBankersChequeApprovalCode, BankersCheque);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelATMApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnCancelATMApplicationForApproval(var ATMApplication: Record "ATM Application")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelATMApplicationApprovalCode, ATMApplication);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelLoanBatchForApproval', '', true, true)]
    procedure RunWorkflowOnCancelLoanBatchForApproval(var LoanBatch: Record "Loan Batch Header")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelLoanBatchApprovalCode, LoanBatch);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelMemberExitForApproval', '', true, true)]
    procedure RunWorkflowOnCancelMemberExitForApproval(var MemberExit: Record "Member Exit Header")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelMemberExitApprovalCode, MemberExit);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelGuarantorMgtForApproval', '', true, true)]
    procedure RunWorkflowOnCancelGuarantorMgtForApproval(var GuarantorMgt: Record "Guarantor Header")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelGuarantorMgtApprovalCode, GuarantorMgt);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelLoanRecoveryForApproval', '', true, true)]
    procedure RunWorkflowOnCancelLoanRecoveryForApproval(var LoanRecovery: Record "Loan Recovery Header")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelLoanRecoveryApprovalCode, LoanRecovery);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelMemberActivationForApproval', '', true, true)]
    procedure RunWorkflowOnCancelMemberActivationForApproval(var MemberActivation: Record "Member Activations")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelMemberActivationApprovalCode, MemberActivation);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelCheckOffForApproval', '', true, true)]
    procedure RunWorkflowOnCancelCheckOffForApproval(var CheckOff: Record "Checkoff Header")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelCheckOffApprovalCode, CheckOff);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelChequeBookApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnCancelChequeBookApplicationForApproval(var ChequeBookApplication: Record "Cheque Book Applications")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelChequeBookApplicationApprovalCode, ChequeBookApplication);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelChequeBookTransactionForApproval', '', true, true)]
    procedure RunWorkflowOnCancelChequeBookTransactionForApproval(var ChequeBookTransaction: Record "Cheque Book Transactions")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelChequeBookTransactionApprovalCode, ChequeBookTransaction);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelInterAccountTransferForApproval', '', true, true)]
    procedure RunWorkflowOnCancelInterAccountTransferForApproval(var InterAccountTransfer: Record "Inter Account Transfer")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelInterAccountTransferApprovalCode, InterAccountTransfer);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelAccountOpenningForApproval', '', true, true)]
    procedure RunWorkflowOnCancelAccountOpenningForApproval(var AccountOpenning: Record "Account Openning")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelAccountOpenningApprovalCode, AccountOpenning);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelBosaReceiptForApproval', '', true, true)]
    procedure RunWorkflowOnCancelBosaReceiptForApproval(var BosaReceipt: Record "Receipt Header")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelBosaReceiptApprovalCode, BosaReceipt);
    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approval Mgmt. Ext", 'OnCancelMobileApplicationForApproval', '', true, true)]
    procedure RunWorkflowOnCancelMobileApplicationForApproval(var MobileApplication: Record "Mobile Applications")begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCancelMobileApplicationApprovalCode, MobileApplication);
    end;
    */
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            RunWorkflowOnCancelLoanApplicationApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelLoanApplicationApprovalCode, RunWorkflowOnSendImprestMemoForApprovalCode);
            /*RunWorkflowOnCancelCollateralApplicationApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelCollateralApplicationApprovalCode, RunWorkflowOnSendCollateralApplicationForApprovalCode);
            RunWorkflowOnCancelCollateralReleaseApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelCollateralReleaseApprovalCode, RunWorkflowOnSendCollateralReleaseForApprovalCode);
            RunWorkflowOnCancelMemberApplicationApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelMemberApplicationApprovalCode, RunWorkflowOnSendMemberApplicationForApprovalCode);
            RunWorkflowOnCancelMemberUpdateApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelMemberUpdateApprovalCode, RunWorkflowOnSendMemberUpdateForApprovalCode);
            RunWorkflowOnCancelPaymentVoucherApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelPaymentVoucherApprovalCode, RunWorkflowOnSendPaymentVoucherForApprovalCode);
            RunWorkflowOnCancelJournalVoucherApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelJournalVoucherApprovalCode, RunWorkflowOnSendJournalVoucherForApprovalCode);
            RunWorkflowOnCancelTellerTransactionApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelTellerTransactionApprovalCode, RunWorkflowOnSendTellerTransactionForApprovalCode);
            RunWorkflowOnCancelStandingOrderApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelStandingOrderApprovalCode, RunWorkflowOnSendStandingOrderForApprovalCode);
            RunWorkflowOnCancelMemberFixedDepositApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelMemberFixedDepositApprovalCode, RunWorkflowOnSendMemberFixedDepositForApprovalCode);
            RunWorkflowOnCancelBankersChequeApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelBankersChequeApprovalCode, RunWorkflowOnSendBankersChequeForApprovalCode);
            RunWorkflowOnCancelATMApplicationApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelATMApplicationApprovalCode, RunWorkflowOnSendATMApplicationForApprovalCode);
            RunWorkflowOnCancelLoanBatchApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelLoanBatchApprovalCode, RunWorkflowOnSendLoanBatchForApprovalCode);
            RunWorkflowOnCancelMemberExitApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelMemberExitApprovalCode, RunWorkflowOnSendMemberExitForApprovalCode);
            RunWorkflowOnCancelGuarantorMgtApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelGuarantorMgtApprovalCode, RunWorkflowOnSendGuarantorMgtForApprovalCode);
            RunWorkflowOnCancelLoanRecoveryApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelLoanRecoveryApprovalCode, RunWorkflowOnSendLoanRecoveryForApprovalCode);
            RunWorkflowOnCancelMemberActivationApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelMemberActivationApprovalCode, RunWorkflowOnSendMemberActivationForApprovalCode);
            RunWorkflowOnCancelCheckOffApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelCheckOffApprovalCode, RunWorkflowOnSendCheckOffForApprovalCode);
            RunWorkflowOnCancelChequeBookApplicationApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelChequeBookApplicationApprovalCode, RunWorkflowOnSendChequeBookApplicationForApprovalCode);
            RunWorkflowOnCancelChequeBookTransactionApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelChequeBookTransactionApprovalCode, RunWorkflowOnSendChequeBookTransactionForApprovalCode);
            RunWorkflowOnCancelInterAccountTransferApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelInterAccountTransferApprovalCode, RunWorkflowOnSendInterAccountTransferForApprovalCode);
            RunWorkflowOnCancelAccountOpenningApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelAccountOpenningApprovalCode, RunWorkflowOnSendAccountOpenningForApprovalCode);
            RunWorkflowOnCancelBosaReceiptApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelBosaReceiptApprovalCode, RunWorkflowOnSendBosaReceiptForApprovalCode);
            RunWorkflowOnCancelMobileApplicationApprovalCode: WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelMobileApplicationApprovalCode, RunWorkflowOnSendMobileApplicationForApprovalCode);
            */
            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode():
                begin
                    //WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendMobileApplicationForApprovalCode);

                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendImprestMemoForApprovalCode);
                    /*
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendCollateralApplicationForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendCollateralReleaseForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendMemberApplicationForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendMemberUpdateForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendPaymentVoucherForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendJournalVoucherForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendTellerTransactionForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendStandingOrderForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendMemberFixedDepositForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendBankersChequeForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendATMApplicationForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendLoanBatchForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendMemberExitForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendGuarantorMgtForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendLoanRecoveryForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendMemberActivationForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendCheckOffForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendChequeBookApplicationForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendChequeBookTransactionForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendInterAccountTransferForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendAccountOpenningForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendBosaReceiptForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendMobileApplicationForApprovalCode);
                    */
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendImprestMemoForApprovalCode, Database::"Imprest Memo", SendIMprestMemoApprovalTxt, 0, false);
        /*
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelLoanApplicationApprovalCode, Database::"Loan Application", CancelLoanApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendCollateralApplicationForApprovalCode, Database::"Collateral Application", SendCollateralApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelCollateralApplicationApprovalCode, Database::"Collateral Application", CancelCollateralApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendCollateralReleaseForApprovalCode, Database::"Collateral Release", SendCollateralReleaseApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelCollateralReleaseApprovalCode, Database::"Collateral Release", CancelCollateralReleaseApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendMemberApplicationForApprovalCode, Database::"Member Application", SendMemberAppApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelMemberApplicationApprovalCode, Database::"Member Application", CancelMemberAppApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendMemberUpdateForApprovalCode, Database::"Member Editing", SendMemberUpdateApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelMemberUpdateApprovalCode, Database::"Member Editing", CancelMemberUpdateApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendPaymentVoucherForApprovalCode, Database::"Payments Header", SendPaymentVoucherApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelPaymentVoucherApprovalCode, Database::"Payments Header", CancelPaymentVoucherApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendJournalVoucherForApprovalCode, Database::"JV Header", SendJournalVoucherApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelJournalVoucherApprovalCode, Database::"JV Header", CancelJournalVoucherApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendTellerTransactionForApprovalCode, Database::"Teller Transactions", SendTellerTransactionApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelTellerTransactionApprovalCode, Database::"Teller Transactions", CancelTellerTransactionApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendStandingOrderForApprovalCode, Database::"Standing Order", SendStandingOrderApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelStandingOrderApprovalCode, Database::"Standing Order", CancelStandingOrderApprovalTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendMemberFixedDepositForApprovalCode, Database::"Fixed Deposit Register", SendMemberFixedDepositTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelMemberFixedDepositApprovalCode, Database::"Fixed Deposit Register", CancelMemberFixedDepositTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendBankersChequeForApprovalCode, Database::"Bankers Cheque", SendBankersChequeTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelBankersChequeApprovalCode, Database::"Bankers Cheque", CancelBankersChequeTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendATMApplicationForApprovalCode, Database::"ATM Application", SendATMApplicationTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelATMApplicationApprovalCode, Database::"ATM Application", CancelATMApplicationTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendLoanBatchForApprovalCode, Database::"Loan Batch Header", SendLoanBatchTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelLoanBatchApprovalCode, Database::"Loan Batch Header", CancelLoanBatchTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendMemberExitForApprovalCode, Database::"Member Exit Header", SendMemberExitTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelMemberExitApprovalCode, Database::"Member Exit Header", CancelMemberExitTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendGuarantorMgtForApprovalCode, Database::"Guarantor Header", SendGuarantorMgtTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelGuarantorMgtApprovalCode, Database::"Guarantor Header", CancelGuarantorMgtTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendLoanRecoveryForApprovalCode, Database::"Loan Recovery Header", SendLoanRecoveryTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelLoanRecoveryApprovalCode, Database::"Loan Recovery Header", CancelLoanRecoveryTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendMemberActivationForApprovalCode, Database::"Member Activations", SendMemberActivationTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelMemberActivationApprovalCode, Database::"Member Activations", CancelMemberActivationTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendCheckOffForApprovalCode, Database::"Checkoff Header", SendCheckOffTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelCheckOffApprovalCode, Database::"Checkoff Header", CancelCheckOffTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendChequeBookApplicationForApprovalCode, Database::"Cheque Book Applications", SendChequeBookAppTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelChequeBookApplicationApprovalCode, Database::"Cheque Book Applications", CancelChequeBookAppTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendChequeBookTransactionForApprovalCode, Database::"Cheque Book Transactions", SendChequeBookTransTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelChequeBookTransactionApprovalCode, Database::"Cheque Book Transactions", CancelChequeBookTransTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendInterAccountTransferForApprovalCode, Database::"Inter Account Transfer", SendAccTransTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelInterAccountTransferApprovalCode, Database::"Inter Account Transfer", CancelAccTransTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendAccountOpenningForApprovalCode, Database::"Account Openning", SendAccOpenningTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelAccountOpenningApprovalCode, Database::"Account Openning", CancelAccOpenningTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendBosaReceiptForApprovalCode, Database::"Receipt Header", SendBosaReceiptTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelBosaReceiptApprovalCode, Database::"Receipt Header", CancelBosaReceiptTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendMobileApplicationForApprovalCode, Database::"Mobile Applications", SendMobileAppTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelMobileApplicationApprovalCode, Database::"Mobile Applications", CancelMobileAppTxt, 0, false);
        */
    end;

    var
        WorkFlowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        SendMobileApprovalTxt: TextConst ENU = 'Approval for Mobile Application is Sent';
        CancelMobileApprovalTxt: TextConst ENU = 'Approval for Mobile Application is Cancelled';
        SendImprestMemoApprovalTxt: TextConst ENU = 'Approval for an Imprest Memo is Sent';
        CancelImprestMemoApprovalTxt: TextConst ENU = 'Approval for an Imprest Memo is Cancelled';
        SendCollateralApprovalTxt: TextConst ENU = 'Approval for Collateral Application is Sent';
        CancelCollateralApprovalTxt: TextConst ENU = 'Approval for Collateral Application is Cancelled';
        SendCollateralReleaseApprovalTxt: TextConst ENU = 'Approval for Collateral Release is Sent';
        CancelCollateralReleaseApprovalTxt: TextConst ENU = 'Approval for Collateral Release is Cancelled';
        SendMemberAppApprovalTxt: TextConst ENU = 'Approval for Member Application is Sent';
        CancelMemberAppApprovalTxt: TextConst ENU = 'Approval for Member Application Cancelled';
        SendMemberUpdateApprovalTxt: TextConst ENU = 'Approval for Member Update is Sent';
        CancelMemberUpdateApprovalTxt: TextConst ENU = 'Approval for Member Update Cancelled';
        SendPaymentVoucherApprovalTxt: TextConst ENU = 'Approval for Payment Voucher is Sent';
        CancelPaymentVoucherApprovalTxt: TextConst ENU = 'Approval for Payment Voucher Cancelled';
        SendJournalVoucherApprovalTxt: TextConst ENU = 'Approval for Journal Voucher is Sent';
        CancelJournalVoucherApprovalTxt: TextConst ENU = 'Approval for Journal Voucher Cancelled';
        SendTellerTransactionApprovalTxt: TextConst ENU = 'Approval for Teller Transaction is Sent';
        CancelTellerTransactionApprovalTxt: TextConst ENU = 'Approval for Teller Transaction Cancelled';
        SendStandingOrderApprovalTxt: TextConst ENU = 'Approval for Standing Order is Sent';
        CancelStandingOrderApprovalTxt: TextConst ENU = 'Approval for Standing Order Cancelled';
        SendMemberFixedDepositTxt: TextConst ENU = 'Approval for Member Fixed Deposit is Sent';
        CancelMemberFixedDepositTxt: TextConst ENU = 'Approval for Member Fixed Deposit Cancelled';
        SendBankersChequeTxt: TextConst ENU = 'Approval for Bankers Cheque is Sent';
        CancelBankersChequeTxt: TextConst ENU = 'Approval for Bankers Cheque Cancelled';
        SendATMApplicationTxt: TextConst ENU = 'Approval for ATM Application is Sent';
        CancelATMApplicationTxt: TextConst ENU = 'Approval for ATM Application Cancelled';
        SendLoanBatchTxt: TextConst ENU = 'Approval for a Loan Batch is Sent';
        CancelLoanBatchTxt: TextConst ENU = 'Approval for a Loan Batch Cancelled';
        SendMemberExitTxt: TextConst ENU = 'Approval for a Member Exit is Sent';
        CancelMemberExitTxt: TextConst ENU = 'Approval for a Member Exit Cancelled';
        SendGuarantorMgtTxt: TextConst ENU = 'Approval for a Guarantor Substitution is Sent';
        CancelGuarantorMgtTxt: TextConst ENU = 'Approval for a Guarantor Substitution is Cancelled';
        SendLoanRecoveryTxt: TextConst ENU = 'Approval for a loan recovery is Sent';
        CancelLoanRecoveryTxt: TextConst ENU = 'Approval for a loan recovery is Cancelled';
        SendMemberActivationTxt: TextConst ENU = 'Approval for a Member Activation is Sent';
        CancelMemberActivationTxt: TextConst ENU = 'Approval for a Member Activation is Cancelled';
        SendCheckOffTxt: TextConst ENU = 'Approval for a Checkoff is Sent';
        CancelCheckOffTxt: TextConst ENU = 'Approval for a Checkoff is Cancelled';
        SendChequeBookAppTxt: TextConst ENU = 'Approval for a Member Cheque Book Application is Sent';
        CancelChequeBookAppTxt: TextConst ENU = 'Approval for a Member Cheque Book Application is Cancelled';
        SendChequeBookTransTxt: TextConst ENU = 'Approval for a Member Cheque Book Transaction is Sent';
        CancelChequeBookTransTxt: TextConst ENU = 'Approval for a Member Cheque Book Transaction is Cancelled';
        SendAccTransTxt: TextConst ENU = 'Approval for an Account Transfer is Sent';
        CancelAccTransTxt: TextConst ENU = 'Approval for an Account Transfer is Cancelled';
        SendAccOpenningTxt: TextConst ENU = 'Approval for an Account Openning is Sent';
        CancelAccOpenningTxt: TextConst ENU = 'Approval for an Account Openning is Cancelled';
        SendBosaReceiptTxt: TextConst ENU = 'Approval for an Bosa Receipt is Sent';
        CancelBosaReceiptTxt: TextConst ENU = 'Approval for an Bosa Receipt is Cancelled';
        SendMobileAppTxt: TextConst ENU = 'Approval for an Mobile Application is Sent';
        CancelMobileAppTxt: TextConst ENU = 'Approval for an Mobile Application is Cancelled';
}

