#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 57002 "Imprest Memo"
{
    TableNo = "Imprest Memo";

    trigger OnRun()
    var
        SalesLine: Record "Sales Line";
        TempVATAmountLine0: Record "VAT Amount Line" temporary;
        TempVATAmountLine1: Record "VAT Amount Line" temporary;
        PrepaymentMgt: Codeunit "Prepayment Mgt.";
        NotOnlyDropShipment: Boolean;
        PostingDate: Date;
        PrintPostedDocuments: Boolean;
    begin
        if Status = Status::Released then
            exit;
        OnBeforeReleaseImpMemo(Rec);
        //OnCheckImpMemoReleaseRestrictions;
        Status := Status::Released;
        Modify(true);
        OnAfterReleaseImpMemo(Rec);
    end;

    var
        Text001: label 'There is nothing to release for Imprest Memo %1.';
        SalesSetup: Record "Sales & Receivables Setup";
        InvtSetup: Record "Inventory Setup";
        WhseSalesRelease: Codeunit "Whse.-Sales Release";
        Text002: label 'This document can only be released when the approval process is complete.';
        Text003: label 'The approval process must be canceled or completed to reopen this document.';
        Text004: label 'There are unposted prepayment amounts on the document of type %1 with the number %2.';
        Text005: label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';


    procedure Reopen(var ImprestMemo: Record "Imprest Memo")
    begin
        OnBeforeReopenImpMemo(ImprestMemo);

        with ImprestMemo do begin
            if Status = Status::Open then
                exit;
            Status := Status::Open;

            Modify(true);

        end;

        OnAfterReopenImpMemo(ImprestMemo);
    end;


    procedure PerformManualRelease(var ImprestMemo: Record "Imprest Memo")
    var
        PrepaymentMgt: Codeunit "Prepayment Mgt.";
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        with ImprestMemo do begin
            // if ApprovalsMgmt.IsImpMemoApprovalsWorkflowEnabled(ImprestMemo) and (ImprestMemo.Status = ImprestMemo.Status::Open) then
            //   Error(Text002);

            Codeunit.Run(Codeunit::"Imprest Memo", ImprestMemo);
        end;
    end;


    procedure PerformManualReopen(var ImprestMemo: Record "Imprest Memo")
    begin
        if ImprestMemo.Status = ImprestMemo.Status::"Pending Approval" then
            Error(Text003);

        Reopen(ImprestMemo);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReleaseImpMemo(var ImprestMemo: Record "Imprest Memo")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReleaseImpMemo(var ImprestMemo: Record "Imprest Memo")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeReopenImpMemo(var ImprestMemo: Record "Imprest Memo")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterReopenImpMemo(var ImprestMemo: Record "Imprest Memo")
    begin
    end;
}

