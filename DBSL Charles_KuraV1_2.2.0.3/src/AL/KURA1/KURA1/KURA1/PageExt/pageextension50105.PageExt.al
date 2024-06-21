#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50105 "pageextension50105" extends "Fixed Asset G/L Journal"
{
    actions
    {
        addafter("Page")
        {
            group(SendApprovalRequest)
            {
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                action(SendApprovalRequestJournalBatch)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Journal Batch';
                    Image = SendApprovalRequest;
                    ToolTip = 'Send all journal lines for approval, also those that you may not see because of filters.';

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.TrySendJournalBatchApprovalRequest(Rec);
                    end;
                }
                action(SendApprovalRequestJournalLine)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Selected Journal Lines';
                    Image = SendApprovalRequest;
                    ToolTip = 'Send selected journal lines for approval.';

                    trigger OnAction()
                    var
                        GenJournalLine: Record "Gen. Journal Line";
                    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.TrySendJournalLineApprovalRequests(GenJournalLine);
                    end;
                }
            }
            group(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Request';
                Image = Cancel;
                action(CancelApprovalRequestJournalBatch)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Journal Batch';
                    Enabled = CanCancelApprovalForJnlBatch or CanCancelFlowApprovalForBatch;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel sending all journal lines for approval, also those that you may not see because of filters.';

                    trigger OnAction()
                    var
                    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //    ApprovalsMgmt.TryCancelJournalBatchApprovalRequest(Rec);
                    end;
                }
                action(CancelApprovalRequestJournalLine)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Selected Journal Lines';
                    Enabled = CanCancelApprovalForJnlLine or CanCancelFlowApprovalForLine;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Cancel sending selected journal lines for approval.';

                    trigger OnAction()
                    var
                        GenJournalLine: Record "Gen. Journal Line";
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.TryCancelJournalLineApprovalRequests(GenJournalLine);
                    end;
                }
            }
        }
    }

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesOnJnlBatchExist: Boolean;
        OpenApprovalEntriesOnJnlLineExist: Boolean;
        OpenApprovalEntriesOnBatchOrCurrJnlLineExist: Boolean;
        OpenApprovalEntriesOnBatchOrAnyJnlLineExist: Boolean;
        ShowWorkflowStatusOnBatch: Boolean;
        ShowWorkflowStatusOnLine: Boolean;
        CanCancelApprovalForJnlBatch: Boolean;
        CanCancelApprovalForJnlLine: Boolean;
        ImportPayrollTransactionsAvailable: Boolean;
        CanRequestFlowApprovalForBatch: Boolean;
        CanRequestFlowApprovalForBatchAndAllLines: Boolean;
        CanRequestFlowApprovalForBatchAndCurrentLine: Boolean;
        CanCancelFlowApprovalForBatch: Boolean;
        CanCancelFlowApprovalForLine: Boolean;
}

