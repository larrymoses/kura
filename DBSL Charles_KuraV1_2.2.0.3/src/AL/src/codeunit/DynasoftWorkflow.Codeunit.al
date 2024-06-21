
#pragma warning disable DOC0101
codeunit 57010 "DynasoftWorkflow"
#pragma warning restore DOC0101
{
    trigger OnRun()
    begin

    end;

    [IntegrationEvent(false, false)]
    PROCEDURE OnSendPaymentsforApproval(VAR Payments: Record Payments);
    begin
    end;

#pragma warning disable DOC0001
#pragma warning disable DOC0001
    procedure IsPaymentsEnabled(var Payments: Record Payments): Boolean
#pragma warning restore DOC0001
#pragma warning restore DOC0001
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit DynasoftWorkflow;
    begin
        // exit(WFMngt.CanExecuteWorkflow(Payments, WFCode.RunWorkflowOnSendPaymentsApprovalCode()))
    end;

    local procedure CheckWorkflowEnabled(): Boolean
    var
        Payments: Record Payments;
        TrainingPlan: Record "Training Plan Header";
        NoWorkflowEnb: TextConst ENU = 'No workflow Enabled for this Record type', ENG = 'No workflow Enabled for this Record type';
    begin
        if not IsPaymentsEnabled(Payments) then
            Error(NoWorkflowEnb);
        if not IsTPlanEnabled(TrainingPlan) then
            Error(NoWorkflowEnb);
    end;
    /*start training plan*/
    [IntegrationEvent(false, false)]
    PROCEDURE OnSendTPlanforApproval(VAR TrainingPlan: Record "Training Plan Header");
    begin
    end;

#pragma warning disable DOC0001
#pragma warning disable DOC0001
    procedure IsTPlanEnabled(VAR TrainingPlan: Record "Training Plan Header"): Boolean
#pragma warning restore DOC0001
#pragma warning restore DOC0001
    var
        WFMngt: Codeunit "Workflow Management";
        WFCode: Codeunit DynasoftWorkflow;
    begin
        //exit(WFMngt.CanExecuteWorkflow(TrainingPlan, WFCode.RunWorkflowOnSendTPlanApprovalCode()))
    end;

    /*end training plan*/
    var
        myInt: Integer;
}
