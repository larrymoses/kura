#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 73000 "PayBridge Management"
{

    trigger OnRun()
    begin
    end;

    var
        BridgeTransaction: Record "Bridge Transaction";
        BridgeSubTransaction: Record "Bridge Sub Transaction";


    procedure FnPopulateBridgeTransaction(BridgeTransaction: Record "Bridge Transaction";BridgeSubTransaction: Record "Bridge Sub Transaction")
    begin
        BridgeTransaction.Init;
    end;
}

