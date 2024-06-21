#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 50003 "Release Approval Document"
{
    TableNo = "Purchase Header";

    trigger OnRun()
    begin
    end;

    // var
    //     Text001: label 'There is nothing to release for the document of type %1 with the number %2.';
    //     Text002: label 'This document can only be released when the approval process is complete.';
    //     Text003: label 'The approval process must be cancelled or completed to reopen this document.';
    //     Text004: label 'There are unposted prepayment amounts on the document of type %1 with the number %2.';
    //     Text005: label 'There are unpaid prepayment invoices that are related to the document of type %1 with the number %2.';


    // procedure ReleasePV(var PV: Record Payments2)
    // begin

    //     if PV.Status = PV.Status::Released then
    //         exit;

    //     //TESTFIELD("Buy-from Vendor No.");
    //     //IF PV."Document Type"=PV."Document Type"::"Payment Voucher" THEN BEGIN
    //     PV.Status := PV.Status::Released;
    //     PV.Modify(true);
    //     //END;
    // end;


    // procedure Reopen(var PV: Record Payments2)
    // begin
    //     with PV do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReopenVendor(Vendor: Record Vendor)
    // begin
    //     with Vendor do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseVendor(Vendor: Record Vendor)
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if Vendor.Status = Vendor.Status::Released then
    //         exit;

    //     Vendor.Status := Vendor.Status::Released;
    //     Vendor.Validate(Status);
    //     Vendor.Modify(true);
    // end;


    // procedure ReopenLeaveApp(LeaveApp: Record "HR Leave Applications")
    // begin
    //     with LeaveApp do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseLeaveApp(LeaveApp: Record "HR Leave Applications")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if LeaveApp.Status = LeaveApp.Status::Released then
    //         exit;

    //     LeaveApp.Status := LeaveApp.Status::Released;
    //     LeaveApp.Modify(true);
    //     LeaveApp.Reset;
    //     LeaveApp.SetRange("Application Code", LeaveApp."Application Code");
    //     if LeaveApp.Find('-') then begin
    //         LeaveApp.CreateLeaveLedgerEntries;
    //         //LeaveApp."FnSendMail&CreateLeaveAllowance";
    //         //ApprovalMgtNotification.SendLeaveApprovedMail(LeaveApp,ApprovalEntry);
    //     end;

    // end;


    // // procedure ReopenCopyReg(CopyReg: Record "Copyright Registration Table")
    // // begin
    // //     with CopyReg do begin
    // //         if Status = Status::Open then
    // //             exit;
    // //         Status := Status::Open;
    // //         Modify(true);
    // //     end;
    // // end;


    // procedure ReleaseCopyReg(CopyReg: Record "Copyright Registration Table")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if CopyReg.Status = CopyReg.Status::Approved then
    //         exit;

    //     CopyReg.Status := CopyReg.Status::Approved;
    //     CopyReg.Modify(true);
    // end;


    // procedure ReopenOvertime(Overtime: Record "Overtime Header")
    // begin
    //     with Overtime do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseOvertime(Overtime: Record "Overtime Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if Overtime.Status = Overtime.Status::Approved then
    //         exit;

    //     Overtime.Status := Overtime.Status::Approved;
    //     Overtime.Modify(true);
    // end;


    // procedure ReopenTrainingApp(TrainingApp: Record "Training Requests")
    // begin
    //     with TrainingApp do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         TrainingApp.Modify(true);
    //     end;
    // end;


    // procedure ReleaseTrainingApp(TrainingApp: Record "Training Requests")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     with TrainingApp do begin
    //         if Status = Status::Approved then
    //             exit;
    //         Status := Status::Approved;
    //         TrainingApp.Modify(true);
    //     end;
    // end;


    // procedure ReopenGFA(GFA: Record "Grant Funding Application")
    // begin
    //     with GFA do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseGFA(GFA: Record "Grant Funding Application")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if GFA."Approval Status" = GFA."approval status"::Released then
    //         exit;

    //     GFA."Approval Status" := GFA."approval status"::Released;
    //     GFA.Modify(true);
    // end;


    // procedure ReopenProjectContract(ProjectContract: Record "Project Contract Header")
    // begin
    //     with ProjectContract do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseProjectContract(ProjectContract: Record "Project Contract Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ProjectContract."Approval Status" = ProjectContract."approval status"::Released then
    //         exit;

    //     ProjectContract."Approval Status" := ProjectContract."approval status"::Released;
    //     ProjectContract.Modify(true);
    // end;


    // procedure ReopenProcDoc(Procurement: Record "Procurement Request")
    // begin
    //     with Procurement do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseProcDOc(Procurement: Record "Procurement Request")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if Procurement.Status = Procurement.Status::Released then
    //         exit;

    //     Procurement.Status := Procurement.Status::Released;
    //     Procurement.Modify(true);
    // end;


    // procedure ReopenFleet(FLeet: Record "Transport Requisition")
    // begin
    //     with FLeet do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseFleet(Fleet: Record "Transport Requisition")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if Fleet.Status = Fleet.Status::Approved then
    //         exit;

    //     Fleet.Status := Fleet.Status::Approved;
    //     Fleet.Modify(true);
    // end;


    // procedure ReopenFileMovement(FileMovement: Record "File Movement Header")
    // begin
    //     with FileMovement do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseFileMovement(FileMovement: Record "File Movement Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if FileMovement.Status = FileMovement.Status::Approved then
    //         exit;

    //     FileMovement.Status := FileMovement.Status::Approved;
    //     FileMovement.Modify(true);
    // end;


    // procedure ReopenReceipt(ReceiptsHeader1: Record "Receipts Header1")
    // begin
    //     with ReceiptsHeader1 do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseReceipt(ReceiptsHeader1: Record "Receipts Header1")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ReceiptsHeader1.Status = ReceiptsHeader1.Status::Released then
    //         exit;

    //     ReceiptsHeader1.Status := ReceiptsHeader1.Status::Released;
    //     ReceiptsHeader1.Modify(true);
    // end;


    // procedure ReopenIFP(IFP: Record "Request For Information")
    // begin
    //     with IFP do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseIFP(IFP: Record "Request For Information")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if IFP.Status = IFP.Status::Released then
    //         exit;

    //     IFP.Status := IFP.Status::Released;
    //     IFP.Modify(true);
    // end;


    // procedure ReopenVendDebarment(VendDebarment: Record "Vendor Debarment Voucher")
    // begin
    //     with VendDebarment do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseVendDebarment(VendDebarment: Record "Vendor Debarment Voucher")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if VendDebarment."Approval Status" = VendDebarment."approval status"::Released then
    //         exit;

    //     VendDebarment."Approval Status" := VendDebarment."approval status"::Released;
    //     VendDebarment.Modify(true);
    // end;


    // procedure ReopenProcPlan(ProcPlan: Record "Procurement Plan")
    // begin
    //     with ProcPlan do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseProcPlan(ProcPlan: Record "Procurement Plan")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ProcPlan."Approval Status" = ProcPlan."approval status"::Released then
    //         exit;

    //     ProcPlan."Approval Status" := ProcPlan."approval status"::Released;
    //     ProcPlan.Modify(true);
    // end;

    // local procedure "*******Project Fundin*******************"()
    // begin
    // end;


    // procedure ReopenProjectReq(ProjFundReq: Record "Project Funding Request Vouche")
    // begin
    //     with ProjFundReq do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseProjectReq(ProjFundReq: Record "Project Funding Request Vouche")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ProjFundReq.Status = ProjFundReq.Status::Approved then
    //         exit;

    //     ProjFundReq.Status := ProjFundReq.Status::Approved;
    //     ProjFundReq.Modify(true);
    // end;


    // procedure ReopenITT(ITT: Record "Standard Purchase Code")
    // begin
    //     with ITT do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         "Document Status" := "document status"::Draft;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseITT(ITT: Record "Standard Purchase Code")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ITT.Status = ITT.Status::Released then
    //         exit;

    //     ITT.Status := ITT.Status::Released;
    //     ITT.Modify(true);
    // end;

    // local procedure "*******AIE Process*******************"()
    // begin
    // end;


    // procedure ReopenAIEReq(InterBankTransfer: Record "Inter Bank Transfer")
    // begin
    //     with InterBankTransfer do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseAIEReq(InterBankTransfer: Record "Inter Bank Transfer")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if InterBankTransfer."Approval Status" = InterBankTransfer."approval status"::Released then
    //         exit;
    //     //InterBankTransfer."Disbursement Posted":=TRUE;
    //     InterBankTransfer."Approval Status" := InterBankTransfer."approval status"::Released;
    //     InterBankTransfer.Modify(true);
    // end;

    // local procedure "*****Training Plan************"()
    // begin
    // end;


    // procedure ReopenTrainingPlan(TrainingPlanHeader: Record "Training Plan Header")
    // begin
    //     with TrainingPlanHeader do begin
    //         if "Approved Status" = "approved status"::Open then
    //             exit;
    //         "Approved Status" := "approved status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseTrainingPlan(TrainingPlanHeader: Record "Training Plan Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if TrainingPlanHeader."Approved Status" = TrainingPlanHeader."approved status"::Released then
    //         exit;

    //     TrainingPlanHeader."Approved Status" := TrainingPlanHeader."approved status"::Released;
    //     TrainingPlanHeader.Modify(true);
    // end;

    // local procedure "*******Bank Rec*******************"()
    // begin
    // end;


    // procedure ReopenBankRecReq(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    // begin
    //     with BankAccReconciliation do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseBankRecReq(BankAccReconciliation: Record "Bank Acc. Reconciliation")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if BankAccReconciliation."Approval Status" = BankAccReconciliation."approval status"::Released then
    //         exit;
    //     BankAccReconciliation."Approval Status" := BankAccReconciliation."approval status"::Released;
    //     BankAccReconciliation.Modify(true);
    // end;


    // procedure ReopenTenderCommitte(TenderCommitte: Record "IFS Tender Committee")
    // begin
    //     with TenderCommitte do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseTenderCommitte(TenderCommitte: Record "IFS Tender Committee")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if TenderCommitte."Approval Status" = TenderCommitte."approval status"::Released then
    //         exit;

    //     TenderCommitte."Approval Status" := TenderCommitte."approval status"::Released;
    //     TenderCommitte.Modify(true);
    // end;


    // procedure ReopenTenderAddendum(TenderAddendum: Record "Tender Addendum Notice")
    // begin
    //     with TenderAddendum do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseTenderAddendum(TenderAddendum: Record "Tender Addendum Notice")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if TenderAddendum.Status = TenderAddendum.Status::Released then
    //         exit;

    //     TenderAddendum.Status := TenderAddendum.Status::Released;
    //     TenderAddendum.Modify(true);
    // end;

    // local procedure "*******Asset Transfer*******************"()
    // begin
    // end;


    // procedure ReopenAssetTransferReq(HRAssetTransferHeader: Record "HR Asset Transfer Header")
    // begin
    //     with HRAssetTransferHeader do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseAssetTransferReq(var HRAssetTransferHeader: Record "HR Asset Transfer Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if HRAssetTransferHeader.Status = HRAssetTransferHeader.Status::Approved then
    //         exit;
    //     //InterBankTransfer."Disbursement Posted":=TRUE;
    //     HRAssetTransferHeader.Status := HRAssetTransferHeader.Status::Approved;
    //     HRAssetTransferHeader.Modify(true);
    // end;

    // local procedure "*******Tender Committe**********"()
    // begin
    // end;


    // procedure ReopenBidEvaluation(BidEvaluation: Record "Bid Evaluation Register")
    // begin
    //     with BidEvaluation do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseBidEvaluation(BidEvaluation: Record "Bid Evaluation Register")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if BidEvaluation."Approval Status" = BidEvaluation."approval status"::Released then
    //         exit;

    //     BidEvaluation."Approval Status" := BidEvaluation."approval status"::Released;
    //     BidEvaluation.Modify(true);
    // end;


    // procedure ReopenBidOpening(BidOpening: Record "Bid Opening Register")
    // begin
    //     with BidOpening do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseBidOpening(BidOpening: Record "Bid Opening Register")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if BidOpening."Approval Status" = BidOpening."approval status"::Released then
    //         exit;

    //     BidOpening."Approval Status" := BidOpening."approval status"::Released;
    //     BidOpening.Modify(true);
    // end;


    // procedure ReopenBidTabulation(BidTabulation: Record "Bid Tabulation Header")
    // begin
    //     with BidTabulation do begin
    //         if "Approval Status" = "approval status"::Open then
    //             exit;
    //         "Approval Status" := "approval status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseBidTabulation(BidTabulation: Record "Bid Tabulation Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if BidTabulation."Approval Status" = BidTabulation."approval status"::Released then
    //         exit;

    //     BidTabulation."Approval Status" := BidTabulation."approval status"::Released;
    //     BidTabulation.Modify(true);
    // end;

    // local procedure "*******RWP Process*******************"()
    // begin
    // end;


    // // procedure ReopenRWPReq(RoadWorkProgram: Record "Road Work Program")
    // // begin
    // //     with RoadWorkProgram do begin
    // //      if "Approval Status" us"= "approval status"::Open then
    // //          exit;
    //         "Approval Status" := ":="approval status"::Open;
    // //         Modify(true);
    // //     end;
    // // end;


    // // procedure ReleaseRWPReq(RoadWorkProgram: Record "Road Work Program")
    // // var
    // //     ApprovalEntry: Record "Approval Entry";
    // //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // // begin
    // //     if RoadWorkProgram."Approval Status" = RoadWorkProgram."approval status"::Released then
    // //         exit;
    // //     RoadWorkProgram."Approval Stat := ":=RoadWorkProgram."approval status"::Released;
    // //     RoadWorkProgram.Modify(true);
    // // end;

    // local procedure "*******PCO*******************"()
    // begin
    // end;


    // procedure ReopenPCOReq(ProjectCommencementOrder: Record "Project Commencement Order")
    // begin
    //     with ProjectCommencementOrder do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleasePCOReq(ProjectCommencementOrder: Record "Project Commencement Order")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ProjectCommencementOrder.Status = ProjectCommencementOrder.Status::Released then
    //         exit;
    //     ProjectCommencementOrder.Status := ProjectCommencementOrder.Status::Released;
    //     ProjectCommencementOrder.Modify(true);
    // end;

    // local procedure "*******WEP*******************"()
    // begin
    // end;


    // procedure ReopenWEPReq(ProjectMobilizationHeader: Record "Project Mobilization Header")
    // begin
    //     with ProjectMobilizationHeader do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseWEPReq(ProjectMobilizationHeader: Record "Project Mobilization Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ProjectMobilizationHeader.Status = ProjectMobilizationHeader.Status::Released then
    //         exit;
    //     ProjectMobilizationHeader.Status := ProjectMobilizationHeader.Status::Released;
    //     ProjectMobilizationHeader.Modify(true);
    // end;

    // local procedure "*******IMPREST MEMO*****************"()
    // begin
    // end;


    // procedure ReopenImprestMemoReq(ImprestMemo: Record "Imprest Memo")
    // begin
    //     with ImprestMemo do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseImprestMemoReq(ImprestMemo: Record "Imprest Memo")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ImprestMemo.Status = ImprestMemo.Status::Released then
    //         exit;
    //     ImprestMemo.Status := ImprestMemo.Status::Released;
    //     ImprestMemo.Validate(Status);//Fred added to cater for commitments
    //     ImprestMemo.Modify(true);
    // end;

    // local procedure "*******Maintenance*****************"()
    // begin
    // end;


    // procedure ReopenMaintenace(Maintenance: Record "Fuel & Maintenance Requisition")
    // begin
    //     with Maintenance do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseMaintenace(var Maintenance: Record "Fuel & Maintenance Requisition")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if Maintenance.Status = Maintenance.Status::Approved then
    //         exit;
    //     Maintenance.Status := Maintenance.Status::Approved;
    //     Maintenance.Modify(true);
    // end;

    // local procedure "*******Fuel Req*****************"()
    // begin
    // end;


    // procedure ReopenFuelReq(var FuelReq: Record "Fuel & Maintenance Requisition")
    // begin
    //     with FuelReq do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseFuelReq(var FuelReq: Record "Fuel & Maintenance Requisition")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if FuelReq.Status = FuelReq.Status::Approved then
    //         exit;
    //     FuelReq.Status := FuelReq.Status::Approved;
    //     FuelReq.Modify(true);
    // end;

    // local procedure "*******Project Staff Voucher*************"()
    // begin
    // end;


    // procedure ReopenSAVReq(ProjectStaffVoucher: Record "Project Staff Voucher")
    // begin
    //     with ProjectStaffVoucher do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    procedure ReleaseSAVReq(ProjectStaffVoucher: Record "Project Staff Voucher")
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalMgtNotification: Codeunit "Email Notifications";
    begin
        if ProjectStaffVoucher.Status = ProjectStaffVoucher.Status::Released then
            exit;
        ProjectStaffVoucher.Status := ProjectStaffVoucher.Status::Released;
        ProjectStaffVoucher.Modify(true);
    end;

    Procedure ReleaseMeasurementHeader(MeasurementHeader: Record "Measurement &  Payment Header")
    var

    begin
        if MeasurementHeader.Status = MeasurementHeader.Status::Released then
            exit;
        MeasurementHeader.Status := MeasurementHeader.Status::Released;
        MeasurementHeader.Modify(true);
    end;

    // local procedure "*******WEPPCO*************"()
    // begin
    // end;


    // procedure ReopenWEPPCOReq(ProjectMobilizationHeader: Record "Project Mobilization Header")
    // begin
    //     with ProjectMobilizationHeader do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReopenTSRV(ITT: Record "Bid Security Closure Voucher")
    // begin
    //     with ITT do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         //"Document Status":="Document Status"::Draft;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseTSRV(ITT: Record "Bid Security Closure Voucher")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ITT.Status = ITT.Status::Released then
    //         exit;

    //     ITT.Status := ITT.Status::Released;
    //     ITT.Modify(true);
    // end;


    // procedure ReleaseWEPPCOReq(ProjectMobilizationHeader: Record "Project Mobilization Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if ProjectMobilizationHeader.Status = ProjectMobilizationHeader.Status::Released then
    //         exit;
    //     ProjectMobilizationHeader.Status := ProjectMobilizationHeader.Status::Released;
    //     ProjectMobilizationHeader.Modify(true);
    // end;

    // local procedure "******Bill Discount*************"()
    // begin
    // end;


    // procedure ReopenBDiscountReq(BillDiscountingHeader: Record "Bill Discounting Header")
    // begin
    //     with BillDiscountingHeader do begin
    //         if "Approval  Status" = "approval  status"::Open then
    //             exit;
    //         "Approval  Status" := "approval  status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseBDiscountReq(BillDiscountingHeader: Record "Bill Discounting Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if BillDiscountingHeader."Approval  Status" = BillDiscountingHeader."approval  status"::Approved then
    //         exit;
    //     BillDiscountingHeader."Approval  Status" := BillDiscountingHeader."approval  status"::Approved;
    //     BillDiscountingHeader.Modify(true);
    // end;

    // local procedure "******Cash Request*************"()
    // begin
    // end;


    // procedure ReopenCashReq(CashRequestHeader: Record "Cash Request Header")
    // begin
    //     with CashRequestHeader do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseCashReq(CashRequestHeader: Record "Cash Request Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if CashRequestHeader.Status = CashRequestHeader.Status::Released then
    //         exit;
    //     CashRequestHeader.Status := CashRequestHeader.Status::Released;
    //     CashRequestHeader.Modify(true);
    // end;

    // local procedure "****Recruitment****"()
    // begin
    // end;


    // procedure ReopenRequisitionHeader(Recruitment: Record "Recruitment Requisition Header")
    // begin
    //     with Recruitment do begin
    //         if Recruitment."Approval Status" = Recruitment."approval status"::Open then
    //             exit;
    //         Recruitment."Approval Status" := Recruitment."approval status"::Open;
    //         Recruitment.Modify(true);
    //     end;
    // end;


    // procedure ReleaseRequisitionHeader(Recruitment: Record "Recruitment Requisition Header")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if Recruitment."Approval Status" = Recruitment."approval status"::Released then
    //         exit;
    //     Recruitment."Approval Status" := Recruitment."approval status"::Released;
    //     Recruitment.Modify(true);
    // end;

    // local procedure "*******Driver out of office******"()
    // begin
    // end;


    // procedure ReopenDriverReq(DriverOutofOfficeReq: Record "Driver Out of Office Req")
    // begin
    //     with DriverOutofOfficeReq do begin
    //         if Status = Status::Open then
    //             exit;
    //         Status := Status::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseDriverReq(DriverOutofOfficeReq: Record "Driver Out of Office Req")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if DriverOutofOfficeReq.Status = DriverOutofOfficeReq.Status::Released then
    //         exit;
    //     DriverOutofOfficeReq.Status := DriverOutofOfficeReq.Status::Released;
    //     DriverOutofOfficeReq.Modify(true);
    // end;

    // local procedure "******Batch Payment*************"()
    // begin
    // end;


    // procedure ReopenBPaymentReq(BankPaymentsBatching: Record "Bank Payments Batching")
    // begin
    //     with BankPaymentsBatching do begin
    //         if "Approval  Status" = "approval  status"::Open then
    //             exit;
    //         "Approval  Status" := "approval  status"::Open;
    //         Modify(true);
    //     end;
    // end;


    // procedure ReleaseBPaymentReq(BankPaymentsBatching: Record "Bank Payments Batching")
    // var
    //     ApprovalEntry: Record "Approval Entry";
    //     ApprovalMgtNotification: Codeunit "Email Notifications";
    // begin
    //     if BankPaymentsBatching."Approval  Status" = BankPaymentsBatching."approval  status"::Approved then
    //         exit;
    //     BankPaymentsBatching."Approval  Status" := BankPaymentsBatching."approval  status"::Approved;
    //     BankPaymentsBatching.Modify(true);
    // end;
}

