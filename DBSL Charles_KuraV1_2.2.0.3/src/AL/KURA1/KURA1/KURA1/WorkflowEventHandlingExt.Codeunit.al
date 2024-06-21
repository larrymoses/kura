codeunit 90101 "Workflow Event Handling Ext"
{
    trigger OnRun()
    begin

    end;

    procedure RunWorkflowOnSendClaimForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendClaimForApproval'));
    end;

    //   // [EventSubscriber(ObjectType::Codeunit, codeunit::"Approval Mgmt. Ext", 'OnSendPavementForApproval', '', true, true)]
    local procedure RunWorkflowOnSendClaimForApproval(var Claim: Record "Purchase Header")
    begin
        workflowManagement.HandleEvent(RunWorkflowOnSendClaimForApprovalCode, Claim);
    end;

    var

        Claim: Record "Purchase Header";
        workflowManagement: Codeunit 1501;
        workflowEventHandling: Codeunit 1520;
        ClaimForApprovalEventDescTxt: TextConst ENU = 'Approval of Procurement Req Document is Requested';

        ClaimApprovalRequestCancelEventDescTxt: TextConst ENU = 'Approval of Procurement Req Document is Requested';
}