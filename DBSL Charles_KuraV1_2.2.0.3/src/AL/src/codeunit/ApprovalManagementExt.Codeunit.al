codeunit 50014 "Approval Management Ext"
{
    trigger OnRun()
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendImprestMemoForApproval(var ImprestMemo: Record "Imprest Memo")
    begin
    end;

    [IntegrationEvent(False, false)]
    procedure OnCancelImprestMemoForApproval(var LoanApplication: Record "Loan Application")
    begin
    end;

    procedure CheckLoanApplicationApprovalsWorkflowEnable(var ImprestMemo: Record "Imprest Memo"): Boolean
    begin
        if not isImprestMemoApprovalWorkflowEnabled(ImprestMemo) then Error(NoWorkflowEnabledError);
        exit(true);
    end;

    procedure isImprestMemoApprovalWorkflowEnabled(var ImprestMemo: Record "Imprest Memo"): Boolean
    begin
        if ImprestMemo.Status <> ImprestMemo.Status::Open then exit(false);
        //exit(WorkflowManagement.CanExecuteWorkflow(ImprestMemo, WorkflowEventHandlingCust.RunWorkflowOnSendImprestMemoForApprovalCode()))
    end;



    /*procedure isMemberExitApprovalWorkflowEnabled(var MemberExit: Record "Member Exit Header"): Boolean begin
        if MemberExit."Approval Status" <> MemberExit."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(MemberExit, WorkflowEventHandlingCust.RunWorkflowOnSendMemberExitForApprovalCode()))end;
    procedure isGuarantorMgtApprovalWorkflowEnabled(var GuarantorMgt: Record "Guarantor Header"): Boolean begin
        if GuarantorMgt."Approval Status" <> GuarantorMgt."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(GuarantorMgt, WorkflowEventHandlingCust.RunWorkflowOnSendGuarantorMgtForApprovalCode()))end;
    procedure isLoanRecoveryApprovalWorkflowEnabled(var LoanRecovery: Record "Loan Recovery Header"): Boolean begin
        if LoanRecovery."Approval Status" <> LoanRecovery."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(LoanRecovery, WorkflowEventHandlingCust.RunWorkflowOnSendLoanRecoveryForApprovalCode()))end;
    procedure isMemberActivationApprovalWorkflowEnabled(var MemberActivation: Record "Member Activations"): Boolean begin
        if MemberActivation."Approval Status" <> MemberActivation."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(MemberActivation, WorkflowEventHandlingCust.RunWorkflowOnSendMemberActivationForApprovalCode()))end;
    procedure isCheckOffApprovalWorkflowEnabled(var CheckOff: Record "Checkoff Header"): Boolean begin
        if CheckOff."Approval Status" <> CheckOff."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(CheckOff, WorkflowEventHandlingCust.RunWorkflowOnSendCheckOffForApprovalCode()))end;
    procedure isChequeBookApplicationApprovalWorkflowEnabled(var ChequeBookApplication: Record "Cheque Book Applications"): Boolean begin
        if ChequeBookApplication."Approval Status" <> ChequeBookApplication."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(ChequeBookApplication, WorkflowEventHandlingCust.RunWorkflowOnSendChequeBookApplicationForApprovalCode()))end;
    procedure isChequeBookTransactionApprovalWorkflowEnabled(var ChequeBookTransaction: Record "Cheque Book Transactions"): Boolean begin
        if ChequeBookTransaction."Approval Status" <> ChequeBookTransaction."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(ChequeBookTransaction, WorkflowEventHandlingCust.RunWorkflowOnSendChequeBookTransactionForApprovalCode()))end;
    procedure isInterAccountTransferApprovalWorkflowEnabled(var InterAccountTransfer: Record "Inter Account Transfer"): Boolean begin
        if InterAccountTransfer."Approval Status" <> InterAccountTransfer."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(InterAccountTransfer, WorkflowEventHandlingCust.RunWorkflowOnSendInterAccountTransferForApprovalCode()))end;
    procedure isAccountOpenningApprovalWorkflowEnabled(var AccountOpenning: Record "Account Openning"): Boolean begin
        if AccountOpenning."Approval Status" <> AccountOpenning."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(AccountOpenning, WorkflowEventHandlingCust.RunWorkflowOnSendAccountOpenningForApprovalCode()))end;
    procedure isBosaReceiptApprovalWorkflowEnabled(var BosaReceipt: Record "Receipt Header"): Boolean begin
        if BosaReceipt."Approval Status" <> BosaReceipt."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(BosaReceipt, WorkflowEventHandlingCust.RunWorkflowOnSendBosaReceiptForApprovalCode()))end;
    procedure isMobileApplicationApprovalWorkflowEnabled(var MobileApplication: Record "Mobile Applications"): Boolean begin
        if MobileApplication."Approval Status" <> MobileApplication."Approval Status"::New then exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(MobileApplication, WorkflowEventHandlingCust.RunWorkflowOnSendMobileApplicationForApprovalCode()))end;
        */
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef;
    var ApprovalEntryArgument: Record "Approval Entry";
    WorkflowStepInstance: Record "Workflow Step Instance")

    var
        ImprestMemo: Record "Imprest Memo";
    /*CollateralApplication: Record "Collateral Application";
    CollateralRelease: Record "Collateral Release";
    MemberApplication: Record "Member Application";
    MemberUpdate: Record "Member Editing";
    PaymentVoucher: Record "Payments Header";
    JournalVoucher: Record "JV Header";
    TellerTransaction: Record "Teller Transactions";
    StandingOrder: Record "Standing Order";
    FixedDeposit: Record "Fixed Deposit Register";
    BankersCheque: Record "Bankers Cheque";
    ATMApplication: Record "ATM Application";
    LoanBatch: Record "Loan Batch Header";
    MemberExit: Record "Member Exit Header";
    Member: Record Members;
    GuarantorMgt: Record "Guarantor Header";
    LoanRecovery: Record "Loan Recovery Header";
    MemberActivation: Record "Member Activations";
    CheckOff: Record "Checkoff Header";
    ChequeBookTransaction: Record "Cheque Book Transactions";
    ChequeBookApplication: Record "Cheque Book Applications";
    InterAccountTransfer: Record "Inter Account Transfer";
    AccountOpenning: Record "Account Openning";
    BosaReceipt: Record "Receipt Header";
    MobileApplication: Record "Mobile Applications";*/
    begin
        case RecRef.Number of
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ApprovalEntryArgument."Document No." := ImprestMemo."No.";
                end;
        /*Database::"Collateral Application": begin
            RecRef.SetTable(CollateralApplication);
            ApprovalEntryArgument."Document No.":=CollateralApplication."Document No";
        end;
        Database::"Collateral Release": begin
            RecRef.SetTable(CollateralRelease);
            ApprovalEntryArgument."Document No.":=CollateralRelease."Document No";
        end;
        Database::"Member Application": begin
            RecRef.SetTable(MemberApplication);
            ApprovalEntryArgument."Document No.":=MemberApplication."Application No.";
        end;
        Database::"Member Editing": begin
            RecRef.SetTable(MemberUpdate);
            ApprovalEntryArgument."Document No.":=MemberUpdate."Document No.";
        end;
        Database::"Payments Header": begin
            RecRef.SetTable(PaymentVoucher);
            ApprovalEntryArgument."Document No.":=PaymentVoucher."Document No.";
        end;
        Database::"JV Header": begin
            RecRef.SetTable(JournalVoucher);
            ApprovalEntryArgument."Document No.":=JournalVoucher."Document No.";
        end;
        Database::"Teller Transactions": begin
            RecRef.SetTable(TellerTransaction);
            ApprovalEntryArgument."Document No.":=TellerTransaction."Document No";
        end;
        Database::"Standing Order": begin
            RecRef.SetTable(StandingOrder);
            ApprovalEntryArgument."Document No.":=StandingOrder."Document No";
        end;
        Database::"Fixed Deposit Register": begin
            RecRef.SetTable(FixedDeposit);
            ApprovalEntryArgument."Document No.":=FixedDeposit."FD No.";
        end;
        Database::"Bankers Cheque": begin
            RecRef.SetTable(BankersCheque);
            ApprovalEntryArgument."Document No.":=BankersCheque."Document No.";
        end;
        Database::"ATM Application": begin
            RecRef.SetTable(ATMApplication);
            ApprovalEntryArgument."Document No.":=ATMApplication."Application No";
        end;
        Database::"Loan Batch Header": begin
            RecRef.SetTable(LoanBatch);
            ApprovalEntryArgument."Document No.":=LoanBatch."Document No";
        end;
        Database::"Member Exit Header": begin
            RecRef.SetTable(MemberExit);
            ApprovalEntryArgument."Document No.":=MemberExit."Document No";
        end;
        Database::"Guarantor Header": begin
            RecRef.SetTable(GuarantorMgt);
            ApprovalEntryArgument."Document No.":=GuarantorMgt."Document No";
        end;
        Database::"Loan Recovery Header": begin
            RecRef.SetTable(LoanRecovery);
            ApprovalEntryArgument."Document No.":=LoanRecovery."Document No";
        end;
        Database::"Member Activations": begin
            RecRef.SetTable(MemberActivation);
            ApprovalEntryArgument."Document No.":=MemberActivation."Document No";
        end;
        Database::"Checkoff Header": begin
            RecRef.SetTable(CheckOff);
            ApprovalEntryArgument."Document No.":=CheckOff."Document No";
        end;
        Database::"Cheque Book Applications": begin
            RecRef.SetTable(ChequeBookApplication);
            ApprovalEntryArgument."Document No.":=ChequeBookApplication."Application No";
        end;
        Database::"Cheque Book Transactions": begin
            RecRef.SetTable(ChequeBookTransaction);
            ApprovalEntryArgument."Document No.":=ChequeBookTransaction."Document No";
        end;
        Database::"Inter Account Transfer": begin
            RecRef.SetTable(InterAccountTransfer);
            ApprovalEntryArgument."Document No.":=InterAccountTransfer."Document No";
        end;
        Database::"Account Openning": begin
            RecRef.SetTable(AccountOpenning);
            ApprovalEntryArgument."Document No.":=AccountOpenning."Document No";
        end;
        Database::"Receipt Header": begin
            RecRef.SetTable(BosaReceipt);
            ApprovalEntryArgument."Document No.":=BosaReceipt."Receipt No.";
        end;
        Database::"Mobile Applications": begin
            RecRef.SetTable(MobileApplication);
            ApprovalEntryArgument."Document No.":=MobileApplication."Document No";
        end;
        */
        end;
    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";
        WorkflowEventHandlingCust: Codeunit "Workflow Event Handling Ext";
        NoWorkflowEnabledError: TextConst ENU = 'No Workflow for this record type is enabled';
}


