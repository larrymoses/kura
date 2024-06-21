#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 72001 "Clear Workflow Event Queue"
{

    trigger OnRun()
    begin
        FnClearWorkflowEventQueue();
    end;


    procedure FnClearWorkflowEventQueue()
    var
        WorkflowEventQueue: Record "Workflow Event Queue";
    begin
        WorkflowEventQueue.DeleteAll;
        Message('Success');
    end;
}

