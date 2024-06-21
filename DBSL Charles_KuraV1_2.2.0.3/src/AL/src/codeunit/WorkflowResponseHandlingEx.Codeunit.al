codeunit 50017 "Workflow Response H_andling Ex"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        ImprestMemo: Record "Imprest Memo";

    begin
        case RecRef.Number of
            /*Database::"Collateral Application": begin
                RecRef.SetTable(CollateralApplication);
                CollateralApplication."Approval Status":=CollateralApplication."Approval Status"::New;
                CollateralApplication.Modify;
                Handled:=true;

            end;
            Database::"Collateral Release": begin
                RecRef.SetTable(CollateralRelease);
                CollateralRelease."Approval Status":=CollateralRelease."Approval Status"::New;
                CollateralRelease.Modify;
                Handled:=true;
            end;
            */
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Status := ImprestMemo.Status::Open;
                    ImprestMemo.Modify;
                    Handled := true;
                end;
        /*
        Database::"Member Application": begin
            RecRef.SetTable(MemberApplication);
            MemberApplication."Approval Status":=MemberApplication."Approval Status"::New;
            MemberApplication.Modify();
            Handled:=true;
        end;
        Database::"Member Editing": begin
            RecRef.SetTable(MemberUpdate);
            MemberUpdate."Approval Status":=MemberUpdate."Approval Status"::New;
            MemberUpdate.Modify();
            Handled:=true;
        end;
        Database::"Payments Header": begin
            RecRef.SetTable(PaymentVoucher);
            PaymentVoucher."Approval Status":=PaymentVoucher."Approval Status"::New;
            PaymentVoucher.Modify();
            Handled:=true;
        end;
        Database::"JV Header": begin
            RecRef.SetTable(JournalVoucher);
            JournalVoucher."Approval Status":=JournalVoucher."Approval Status"::New;
            JournalVoucher.Modify();
            Handled:=true;
        end;
        Database::"Teller Transactions": begin
            RecRef.SetTable(TellerTransaction);
            TellerTransaction."Approval Status":=TellerTransaction."Approval Status"::New;
            TellerTransaction.Modify();
            Handled:=true;
        end;
        Database::"Standing Order": begin
            RecRef.SetTable(StandingOrder);
            StandingOrder."Approval Status":=StandingOrder."Approval Status"::New;
            StandingOrder.Modify();
            Handled:=true;
        end;
        Database::"Fixed Deposit Register": begin
            RecRef.SetTable(FixedDeposit);
            FixedDeposit."Approval Status":=FixedDeposit."Approval Status"::New;
            FixedDeposit.Modify();
            Handled:=true;
        end;
        Database::"Bankers Cheque": begin
            RecRef.SetTable(BankersCheque);
            BankersCheque."Approval Status":=BankersCheque."Approval Status"::New;
            BankersCheque.Modify();
            Handled:=true;
        end;
        Database::"ATM Application": begin
            RecRef.SetTable(ATMApplication);
            ATMApplication."Approval Status":=ATMApplication."Approval Status"::New;
            MemberMgt.ReverseAtmLien(ATMApplication."Application No");
            ATMApplication.Modify();
            Handled:=true;
        end;
        Database::"Loan Batch Header": begin
            RecRef.SetTable(LoanBatch);
            LoanBatch."Approval Status":=LoanBatch."Approval Status"::New;
            LoanBatch.Modify();
            Handled:=true;
        end;
        Database::"Member Exit Header": begin
            RecRef.SetTable(MemberExit);
            MemberExit."Approval Status":=MemberExit."Approval Status"::New;
            if Member.Get(MemberExit."Member No")then begin
                Member."Member Status":=Member."Member Status"::Active;
                Member.Modify();
            end;
            MemberExit.Modify();
            Handled:=true;
        end;
        Database::"Guarantor Header": begin
            RecRef.SetTable(GuarantorMgt);
            GuarantorMgt."Approval Status":=GuarantorMgt."Approval Status"::New;
            GuarantorMgt.Modify();
            Handled:=true;
        end;
        Database::"Loan Recovery Header": begin
            RecRef.SetTable(LoanRecovery);
            LoanRecovery."Approval Status":=LoanRecovery."Approval Status"::New;
            LoanRecovery.Modify();
            Handled:=true;
        end;
        Database::"Member Activations": begin
            RecRef.SetTable(MemberActivation);
            MemberActivation."Approval Status":=MemberActivation."Approval Status"::New;
            MemberActivation.Modify();
            Handled:=true;
        end;
        Database::"Checkoff Header": begin
            RecRef.SetTable(CheckOff);
            CheckOff."Approval Status":=CheckOff."Approval Status"::New;
            CheckOff.Modify();
            Handled:=true;
        end;
        Database::"Cheque Book Applications": begin
            RecRef.SetTable(ChequeBookApplication);
            ChequeBookApplication."Approval Status":=ChequeBookApplication."Approval Status"::New;
            ChequeBookApplication.Modify();
            Handled:=true;
        end;
        Database::"Cheque Book Transactions": begin
            RecRef.SetTable(ChequeBookTransaction);
            ChequeBookTransaction."Approval Status":=ChequeBookTransaction."Approval Status"::New;
            ChequeBookTransaction.Modify();
            Handled:=true;
        end;
        Database::"Inter Account Transfer": begin
            RecRef.SetTable(InterAccountTransfer);
            InterAccountTransfer."Approval Status":=InterAccountTransfer."Approval Status"::New;
            InterAccountTransfer.Modify();
            Handled:=true;
        end;
        Database::"Account Openning": begin
            RecRef.SetTable(AccountOpenning);
            AccountOpenning."Approval Status":=AccountOpenning."Approval Status"::New;
            AccountOpenning.Modify();
            Handled:=true;
        end;
        Database::"Receipt Header": begin
            RecRef.SetTable(BosaReceipt);
            BosaReceipt."Approval Status":=BosaReceipt."Approval Status"::New;
            BosaReceipt.Modify();
            Handled:=true;
        end;
        Database::"Mobile Applications": begin
            RecRef.SetTable(MobileApplication);
            MobileApplication."Approval Status":=MobileApplication."Approval Status"::New;
            MobileApplication.Modify();
            Handled:=true;
        end;
        */
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
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
    FDManagement: Codeunit "Fixed Deposit Mgt.";
    BankersCheque: Record "Bankers Cheque";
    ATMApplication: Record "ATM Application";
    LoanBatch: record "Loan Batch Header";
    MemberExit: Record "Member Exit Header";
    Member: Record Members;
    GuarantorMgt: Record "Guarantor Header";
    LoanRecovery: Record "Loan Recovery Header";
    MemberActivation: Record "Member Activations";
    Checkoff: Record "Checkoff Header";
    ChequeBookTransaction: Record "Cheque Book Transactions";
    ChequeBookApplication: Record "Cheque Book Applications";
    InterAccountTransfer: Record "Inter Account Transfer";
    AccountOpenning: Record "Account Openning";
    BosaReceipt: Record "Receipt Header";
    MobileApplication: Record "Mobile Applications";
    MemberMgt: Codeunit "Member Management";
    */
    begin
        case RecRef.Number of
            /*Database::"Collateral Application": begin
                RecRef.SetTable(CollateralApplication);
                CollateralApplication."Approval Status":=CollateralApplication."Approval Status"::Approved;
                CollateralApplication.Modify;
                Handled:=true;
            end;
            Database::"Collateral Release": begin
                RecRef.SetTable(CollateralRelease);
                CollateralRelease."Approval Status":=CollateralRelease."Approval Status"::Approved;
                CollateralRelease.Modify;
                Handled:=true;
            end;
            */
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Status := ImprestMemo.Status::Released;
                    //ImprestMemo."Appraisal Commited":=true;
                    ImprestMemo.Modify;
                    Handled := true;
                end;
        /*
        Database::"Member Application": begin
            RecRef.SetTable(MemberApplication);
            MemberApplication."Approval Status":=MemberApplication."Approval Status"::Approved;
            MemberApplication.Modify;
            Handled:=true;
        end;
        Database::"Member Editing": begin
            RecRef.SetTable(MemberUpdate);
            MemberUpdate."Approval Status":=MemberUpdate."Approval Status"::Approved;
            MemberUpdate.Modify;
            Handled:=true;
        end;
        Database::"Payments Header": begin
            RecRef.SetTable(PaymentVoucher);
            PaymentVoucher."Approval Status":=PaymentVoucher."Approval Status"::Approved;
            PaymentVoucher.Modify;
            Handled:=true;
        end;
        Database::"JV Header": begin
            RecRef.SetTable(JournalVoucher);
            JournalVoucher."Approval Status":=JournalVoucher."Approval Status"::Approved;
            JournalVoucher.Modify;
            Handled:=true;
        end;
        Database::"Teller Transactions": begin
            RecRef.SetTable(TellerTransaction);
            TellerTransaction."Approval Status":=TellerTransaction."Approval Status"::Approved;
            TellerTransaction.Modify;
            Handled:=true;
        end;
        Database::"Standing Order": begin
            RecRef.SetTable(StandingOrder);
            StandingOrder."Approval Status":=StandingOrder."Approval Status"::Approved;
            StandingOrder.Running:=true;
            StandingOrder.Modify;
            Handled:=true;
        end;
        Database::"Fixed Deposit Register": begin
            RecRef.SetTable(FixedDeposit);
            FixedDeposit."Approval Status":=FixedDeposit."Approval Status"::Approved;
            FDManagement.ActivateFD(FixedDeposit);
            Handled:=true;
        end;
        Database::"Bankers Cheque": begin
            RecRef.SetTable(BankersCheque);
            BankersCheque."Approval Status":=BankersCheque."Approval Status"::Approved;
            BankersCheque.Modify();
            Handled:=true;
        end;
        Database::"ATM Application": begin
            RecRef.SetTable(ATMApplication);
            ATMApplication."Approval Status":=ATMApplication."Approval Status"::Approved;
            ATMApplication.Modify();
            Handled:=true;
        end;
        Database::"Loan Batch Header": begin
            RecRef.SetTable(LoanBatch);
            LoanBatch."Approval Status":=LoanBatch."Approval Status"::Approved;
            LoanBatch.Modify();
            Handled:=true;
        end;
        Database::"Member Exit Header": begin
            RecRef.SetTable(MemberExit);
            MemberExit."Approval Status":=MemberExit."Approval Status"::Approved;
            MemberExit.Modify();
            Handled:=true;
        end;
        Database::"Guarantor Header": begin
            RecRef.SetTable(GuarantorMgt);
            GuarantorMgt."Approval Status":=GuarantorMgt."Approval Status"::Approved;
            GuarantorMgt.Modify();
            Handled:=true;
        end;
        Database::"Loan Recovery Header": begin
            RecRef.SetTable(LoanRecovery);
            LoanRecovery."Approval Status":=LoanRecovery."Approval Status"::Approved;
            LoanRecovery.Modify();
            Handled:=true;
        end;
        Database::"Member Activations": begin
            RecRef.SetTable(MemberActivation);
            MemberActivation."Approval Status":=MemberActivation."Approval Status"::Approved;
            MemberActivation.Modify();
            Handled:=true;
        end;
        Database::"Checkoff Header": begin
            RecRef.SetTable(Checkoff);
            Checkoff."Approval Status":=Checkoff."Approval Status"::Approved;
            Checkoff.Modify();
            Handled:=true;
        end;
        Database::"Cheque Book Applications": begin
            RecRef.SetTable(ChequeBookApplication);
            ChequeBookApplication."Approval Status":=ChequeBookApplication."Approval Status"::Approved;
            ChequeBookApplication.Modify();
            Handled:=true;
        end;
        Database::"Cheque Book Transactions": begin
            RecRef.SetTable(ChequeBookTransaction);
            ChequeBookTransaction."Approval Status":=ChequeBookTransaction."Approval Status"::Approved;
            ChequeBookTransaction.Modify();
            Handled:=true;
        end;
        Database::"Inter Account Transfer": begin
            RecRef.SetTable(InterAccountTransfer);
            InterAccountTransfer."Approval Status":=InterAccountTransfer."Approval Status"::Approved;
            InterAccountTransfer.Modify();
            Handled:=true;
        end;
        Database::"Account Openning": begin
            RecRef.SetTable(AccountOpenning);
            AccountOpenning."Approval Status":=AccountOpenning."Approval Status"::Approved;
            AccountOpenning."New Account No":=MemberMgt.OpenAccounts(AccountOpenning."Document No");
            AccountOpenning.Processed:=true;
            AccountOpenning.Modify();
            Handled:=true;
        end;
        Database::"Receipt Header": begin
            RecRef.SetTable(BosaReceipt);
            BosaReceipt."Approval Status":=BosaReceipt."Approval Status"::Approved;
            BosaReceipt.Modify();
            Handled:=true;
        end;
        Database::"Mobile Applications": begin
            RecRef.SetTable(MobileApplication);
            MobileApplication."Approval Status":=MobileApplication."Approval Status"::Approved;
            MobileApplication.Processed:=true;
            MobileApplication."Processed By":=UserId;
            MobileApplication."Processed On":=CurrentDateTime;
            MemberMgt.PostMobileApplication(MobileApplication."Document No");
            MobileApplication.Modify();
            Handled:=true;
        end;
        */
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        ImprestMemo: Record "Imprest Memo";

    /*CollateralApplication: Record "Collateral Application";
    CollateralRelease: Record "Collateral Release";
    MemberApplication: Record "Member Application";
    MemberUpdate: Record "Member Editing";
    PaymentVoucher: Record "Payments header";
    JournalVoucher: Record "JV header";
    TellerTransaction: Record "Teller Transactions";
    StandingOrder: Record "Standing Order";
    FixedDeposit: Record "Fixed Deposit Register";
    BankersCheque: Record "Bankers Cheque";
    MemberMgt: Codeunit "Member Management";
    ATMApplication: Record "ATM Application";
    LoanBatch: Record "Loan Batch Header";
    MemberExit: Record "Member Exit Header";
    Member: Record Members;
    GuarantorMgt: Record "Guarantor Header";
    LoanRecovery: Record "Loan Recovery Header";
    MemberActivation: Record "Member Activations";
    Checkoff: Record "Checkoff Header";
    ChequeBookTransaction: Record "Cheque Book Transactions";
    ChequeBookApplication: Record "Cheque Book Applications";
    InterAccountTransfer: Record "Inter Account Transfer";
    AccountOpenning: Record "Account Openning";
    BosaReceipt: Record "Receipt Header";
    MobileApplication: Record "Mobile Applications";
    */
    begin
        case RecRef.Number of
            /*Database::"Collateral Application": begin
            RecRef.SetTable(CollateralApplication);
            CollateralApplication."Approval Status":=CollateralApplication."Approval Status"::"Approaval Pending";
            CollateralApplication.Modify;
            IsHandled:=true;
        end;
        Database::"Collateral Release": begin
            RecRef.SetTable(CollateralRelease);
            CollateralRelease."Approval Status":=CollateralRelease."Approval Status"::"Approaval Pending";
            CollateralRelease.Modify;
            IsHandled:=true;
        end;*/
            Database::"Imprest Memo":
                begin
                    RecRef.SetTable(ImprestMemo);
                    ImprestMemo.Status := ImprestMemo.Status::"Pending Approval";
                    //ImprestMemo."Appraisal Commited":=true;
                    ImprestMemo.Modify;
                    IsHandled := true;
                end;
        /*
        Database::"Member Application": begin
            RecRef.SetTable(MemberApplication);
            MemberApplication."Approval Status":=MemberApplication."Approval Status"::"Pending Approval";
            MemberApplication.Modify;
            IsHandled:=true;
        end;
        Database::"Member Editing": begin
            RecRef.SetTable(MemberUpdate);
            MemberUpdate."Approval Status":=MemberUpdate."Approval Status"::"Pending Approval";
            MemberUpdate.Modify;
            IsHandled:=true;
        end;
        Database::"Payments Header": begin
            RecRef.SetTable(PaymentVoucher);
            PaymentVoucher."Approval Status":=PaymentVoucher."Approval Status"::"Approval Pending";
            PaymentVoucher.Modify;
            IsHandled:=true;
        end;
        Database::"JV Header": begin
            RecRef.SetTable(JournalVoucher);
            JournalVoucher."Approval Status":=JournalVoucher."Approval Status"::"Approval Pending";
            JournalVoucher.Modify;
            IsHandled:=true;
        end;
        Database::"Teller Transactions": begin
            RecRef.SetTable(TellerTransaction);
            TellerTransaction."Approval Status":=TellerTransaction."Approval Status"::"Approval Pending";
            TellerTransaction.Modify;
            IsHandled:=true;
        end;
        Database::"Standing Order": begin
            RecRef.SetTable(StandingOrder);
            StandingOrder."Approval Status":=StandingOrder."Approval Status"::"Approval Pending";
            StandingOrder.Modify;
            IsHandled:=true;
        end;
        Database::"Fixed Deposit Register": begin
            RecRef.SetTable(FixedDeposit);
            FixedDeposit."Approval Status":=FixedDeposit."Approval Status"::"Approval Pending";
            FixedDeposit.Modify;
            IsHandled:=true;
        end;
        Database::"Bankers Cheque": begin
            RecRef.SetTable(BankersCheque);
            BankersCheque."Approval Status":=BankersCheque."Approval Status"::"Approval Pending";
            BankersCheque.Modify;
            IsHandled:=true;
        end;
        Database::"ATM Application": begin
            RecRef.SetTable(ATMApplication);
            ATMApplication."Approval Status":=ATMApplication."Approval Status"::"Approval Pending";
            MemberMgt.CreateAtmLien(ATMApplication."Application No");
            ATMApplication.Modify;
            IsHandled:=true;
        end;
        Database::"Loan Batch Header": begin
            RecRef.SetTable(LoanBatch);
            LoanBatch."Approval Status":=LoanBatch."Approval Status"::"Approval Pending";
            LoanBatch.Modify;
            IsHandled:=true;
        end;
        Database::"Member Exit Header": begin
            RecRef.SetTable(MemberExit);
            MemberExit."Approval Status":=MemberExit."Approval Status"::"Approval Pending";
            MemberExit.Modify;
            if Member.get(MemberExit."Member No")then begin
                Member."Member Status":=Member."Member Status"::"Withdrawal-Pending";
                Member.Modify();
            end;
            IsHandled:=true;
        end;
        Database::"Guarantor Header": begin
            RecRef.SetTable(GuarantorMgt);
            GuarantorMgt."Approval Status":=GuarantorMgt."Approval Status"::"Approval Pending";
            GuarantorMgt.Modify;
            IsHandled:=true;
        end;
        Database::"Loan Recovery Header": begin
            RecRef.SetTable(LoanRecovery);
            LoanRecovery."Approval Status":=LoanRecovery."Approval Status"::"Approval Pending";
            LoanRecovery.Modify;
            IsHandled:=true;
        end;
        Database::"Member Activations": begin
            RecRef.SetTable(MemberActivation);
            MemberActivation."Approval Status":=MemberActivation."Approval Status"::"Approval Pending";
            MemberActivation.Modify;
            IsHandled:=true;
        end;
        Database::"Checkoff Header": begin
            RecRef.SetTable(Checkoff);
            Checkoff."Approval Status":=Checkoff."Approval Status"::"Approval Pending";
            Checkoff.Modify;
            IsHandled:=true;
        end;
        Database::"Cheque Book Applications": begin
            RecRef.SetTable(ChequeBookApplication);
            ChequeBookApplication."Approval Status":=ChequeBookApplication."Approval Status"::"Approval Pending";
            ChequeBookApplication.Modify;
            IsHandled:=true;
        end;
        Database::"Cheque Book Transactions": begin
            RecRef.SetTable(ChequeBookTransaction);
            ChequeBookTransaction."Approval Status":=ChequeBookTransaction."Approval Status"::"Approval Pending";
            ChequeBookTransaction.Modify;
            IsHandled:=true;
        end;
        Database::"Inter Account Transfer": begin
            RecRef.SetTable(InterAccountTransfer);
            InterAccountTransfer."Approval Status":=InterAccountTransfer."Approval Status"::"Approval Pending";
            InterAccountTransfer.Modify;
            IsHandled:=true;
        end;
        Database::"Account Openning": begin
            RecRef.SetTable(AccountOpenning);
            AccountOpenning."Approval Status":=AccountOpenning."Approval Status"::"Approval Pending";
            AccountOpenning.Modify;
            IsHandled:=true;
        end;
        Database::"Receipt Header": begin
            RecRef.SetTable(BosaReceipt);
            BosaReceipt."Approval Status":=BosaReceipt."Approval Status"::"Approval Pending";
            BosaReceipt.Modify;
            IsHandled:=true;
        end;
        Database::"Mobile Applications": begin
            RecRef.SetTable(MobileApplication);
            MobileApplication."Approval Status":=MobileApplication."Approval Status"::"Approval Pending";
            MobileApplication.Modify;
            IsHandled:=true;
        end;
        */
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit 1521;
        WorkflowEventHandling: Codeunit "Workflow Event H_andling Ext";
    begin
        case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                begin
                    //WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMobileApplicationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendImprestMemoForApprovalCode);
                    /*WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendCollateralApplicationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendCollateralReleaseForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberApplicationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberUpdateForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendPaymentVoucherForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendJournalVoucherForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendTellerTransactionForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendStandingOrderForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberFixedDepositForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendBankersChequeForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendATMApplicationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendLoanBatchForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberExitForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendGuarantorMgtForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendLoanRecoveryForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberActivationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendCheckOffForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendChequeBookApplicationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendChequeBookTransactionForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendInterAccountTransferForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendAccountOpenningForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendBosaReceiptForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMobileApplicationForApprovalCode);
                    */
                end;
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                begin
                    //WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMobileApplicationForApprovalCode);
                    //Fred
                    //WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendImprestMemoApplicationForApprovalCode);
                    /*WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendCollateralApplicationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendCollateralReleaseForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberApplicationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberUpdateForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendPaymentVoucherForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendJournalVoucherForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendTellerTransactionForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendStandingOrderForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberFixedDepositForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendBankersChequeForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendATMApplicationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendLoanBatchForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberExitForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendGuarantorMgtForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendLoanRecoveryForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMemberActivationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendCheckOffForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendChequeBookApplicationForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendChequeBookTransactionForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendInterAccountTransferForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendAccountOpenningForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendBosaReceiptForApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode, WorkflowEventHandling.RunWorkflowOnSendMobileApplicationForApprovalCode);
                    */
                end;
            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                begin
                    //WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelMobileApplicationApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelLoanApplicationApprovalCode);
                    /*WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelCollateralApplicationApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelCollateralReleaseApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelMemberApplicationApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelMemberUpdateApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelPaymentVoucherApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelJournalVoucherApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelTellerTransactionApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelStandingOrderApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelMemberFixedDepositApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelBankersChequeApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelATMApplicationApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelLoanBatchApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelMemberExitApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelGuarantorMgtApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelLoanRecoveryApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelMemberActivationApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelCheckOffApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelChequeBookApplicationApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelChequeBookTransactionApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelInterAccountTransferApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelAccountOpenningApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelBosaReceiptApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode, WorkflowEventHandling.RunWorkflowOnCancelMobileApplicationApprovalCode);
                    */
                end;
            WorkflowResponseHandling.OpenDocumentCode:
                begin
                    //WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelMobileApplicationApprovalCode);
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelLoanApplicationApprovalCode);
                    /* WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelCollateralApplicationApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelCollateralReleaseApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelMemberApplicationApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelMemberUpdateApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelPaymentVoucherApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelJournalVoucherApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelTellerTransactionApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelStandingOrderApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelMemberFixedDepositApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelBankersChequeApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelATMApplicationApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelLoanBatchApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelMemberExitApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelGuarantorMgtApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelLoanRecoveryApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelMemberActivationApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelCheckOffApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelChequeBookApplicationApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelChequeBookTransactionApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelinterAccountTransferApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelAccountOpenningApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelBosaReceiptApprovalCode);
                     WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode, WorkflowEventHandling.RunWorkflowOnCancelMobileApplicationApprovalCode);
                     */
                end;
        end;
    end;

    var
        myInt: Integer;
}

