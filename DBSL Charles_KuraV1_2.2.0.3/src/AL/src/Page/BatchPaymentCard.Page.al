#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95318 "Batch Payment Card"
{
    PageType = Card;
    SourceTable = "Bank Payments Batching";

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field("Batch No"; "Batch No")
                {
                    ApplicationArea = Basic;
                }
                field("Description/Remarks"; "Description/Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Prepared By"; "Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total PV Lines"; "Total PV Lines")
                {
                    ApplicationArea = Basic;
                }
                field("Total Approved Lines"; "Total Approved Lines")
                {
                    ApplicationArea = Basic;
                }
                field("Total Approved Amount"; "Total Approved Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Payment File Generated"; "Payment File Generated")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("File Sent to Bank"; "File Sent to Bank")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Processed"; "Payment Processed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Created"; "Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Sent to Bank"; "Date Sent to Bank")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Processed"; "Date Processed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval  Status"; "Approval  Status")
                {
                    ApplicationArea = Basic;
                }
                field("Enter OTP"; "Enter OTP")
                {
                    ApplicationArea = Basic;
                    Caption = 'OTP';
                }
            }
            part(Control11; "Batch Payment Lines")
            {
                SubPageLink = "Batch No" = field("Batch No");
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(ActionGroup14)
            {
                action(ResendOTP)
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    // trigger OnAction()
                    // begin
                    //     ApprovalEntry.Reset;
                    //     ApprovalEntry.SetRange("Document Type",ApprovalEntry."document type"::"45");
                    //     ApprovalEntry.SetRange("Document No.","Batch No");
                    //     ApprovalEntry.SetRange(ApprovalEntry.Status,ApprovalEntry.Status::Open);
                    //     if ApprovalEntry.FindFirst() then begin
                    //       ApprovalEntry."OTP Status":=ApprovalEntry."otp status"::"1";
                    //       ApprovalEntry.Modify();
                    //       Message('OTP Sent');
                    //     end;
                    // end;
                }
                action("Bank Payment Report")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        SetRange("Batch No", "Batch No");
                        Report.Run(72044, true, true, Rec);
                    end;
                }
                action("Generate Bank Payment File")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send to Bank';
                    Image = CashFlow;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if not ("Approval  Status" = "approval  status"::Approved) then
                            Error('Document has not been approved, you cannot generate payment file');
                        if Confirm('Do you want to generate Bank Payment file for Batch No. %1, you will not be able to edit the document after generating the payment file', false, "Batch No") = false then exit;

                        if "Payment File Generated" then
                            Error('Payment file has already been generated');

                        KCBPaymentLines.Reset;
                        KCBPaymentLines.SetRange("Batch No", "Batch No");
                        KCBPaymentLines.SetRange(Approved, true);
                        if KCBPaymentLines.Find('-') then begin
                            //   QuickPayIntegration.GeneratePaymentFile("Batch No");
                            "Payment File Generated" := true;
                        end
                        else
                            Error('No payment Lines selected');

                        Message('Bank payment file generated succesfully');
                    end;
                }
            }
            group(ActionGroup29)
            {
                Caption = 'Approvals';
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //Generate Payment Lines

                        GeneratePaymentLines();

                        KCBPaymentLines.Reset;
                        KCBPaymentLines.SetRange("Batch No", "Batch No");
                        if not KCBPaymentLines.FindFirst() then begin
                            Error('Generate Payment Lines before sending document for approval');
                        end;

                        //if ApprovalsMgmt.CheckBPaymentReqApprovalPossible(Rec) then
                        //   ApprovalsMgmt.OnSendBPaymentReqForApproval(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //  ApprovalsMgmt.OnCancelBPaymentReqApprovalRequest(Rec);
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Basic;
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        lastApprover: Boolean;
                    begin
                        ApprovalEntry.Reset;
                        ApprovalEntry.SetCurrentkey("Sequence No.");
                        ApprovalEntry.SetAscending("Sequence No.", true);
                        ApprovalEntry.SetRange("Document No.", "Batch No");
                        if ApprovalEntry.FindLast() then begin
                            if ApprovalEntry."Approver ID" = UserId then begin


                                //Update Flag
                                lastApprover := true;

                                BankPaymentsBatchingLines.Reset;
                                BankPaymentsBatchingLines.SetRange("Batch No", "Batch No");
                                BankPaymentsBatchingLines.SetRange(Approve, true);
                                if not BankPaymentsBatchingLines.FindFirst() then begin
                                    Error('You have not selected any lines, kindly tick the check box for the lines you would like to approve under KCB Payment Lines');
                                end;
                            end;
                        end;
                        if "Enter OTP" <> "OTP Verification" then
                            Error('Please Enter OTP received on E-Mail');


                        ///   ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);

                        "Enter OTP" := '';

                        if lastApprover then begin

                            //MESSAGE('Begin');
                            BankPaymentsBatchingLines.Reset;
                            BankPaymentsBatchingLines.SetRange(BankPaymentsBatchingLines."Batch No", "Batch No");
                            if BankPaymentsBatchingLines.Find('-') then begin
                                repeat

                                    BankPaymentsBatchingLines.Used := BankPaymentsBatchingLines.Approve;
                                    BankPaymentsBatchingLines.Modify();

                                //MESSAGE('Accesed');

                                until BankPaymentsBatchingLines.Next = 0;
                            end;

                        end;
                        Message('The batch %1 has been approved', "Batch No");
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Basic;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        BankPaymentsBatching.Reset;
                        BankPaymentsBatching.SetRange("Batch No", "Batch No");
                        BankPaymentsBatching.SetRange("Approval  Status", BankPaymentsBatching."approval  status"::Approved);
                        if BankPaymentsBatching.FindFirst() then begin
                            Error('Document already approved.You cannot modify an approved document.');
                        end;
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Basic;
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        BankPaymentsBatching.Reset;
                        BankPaymentsBatching.SetRange("Batch No", "Batch No");
                        BankPaymentsBatching.SetRange("Approval  Status", BankPaymentsBatching."approval  status"::Approved);
                        if BankPaymentsBatching.FindFirst() then begin
                            Error('Document already approved.You cannot modify an approved document.');
                        end;
                        //   ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        BankPaymentsBatching.Reset;
                        BankPaymentsBatching.SetRange("Batch No", "Batch No");
                        BankPaymentsBatching.SetRange("Approval  Status", BankPaymentsBatching."approval  status"::Approved);
                        if BankPaymentsBatching.FindFirst() then begin
                            Error('Document already approved.You cannot modify an approved document.');
                        end;
                        "Approval  Status" := "approval  status"::Approved;
                        Modify();

                        Message('The batch %1 has been released successfully', "Batch No");
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        "Approval  Status" := "approval  status"::Open;
                        Modify();

                        Message('The batch %1 has been reopened successfully', "Batch No");
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if not "Payment File Generated" then
            Edittable := true;
    end;

    var
        KCBPaymentLines: Record "KCB Payment Lines";
        BankPaymentsBatchingLines: Record "Bank Payments Batching Lines";
        PVLines: Record "PV Lines";
        QuickPayIntegration: Codeunit "QuickPay Integration";
        Edittable: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ApprovalEntry: Record "Approval Entry";
        BankPaymentsBatching: Record "Bank Payments Batching";

    local procedure GeneratePaymentLines()
    begin
        KCBPaymentLines.Reset;

        BankPaymentsBatchingLines.Reset();
        BankPaymentsBatchingLines.SetRange("Batch No", "Batch No");
        BankPaymentsBatchingLines.SetFilter("Document No.", '<>%1', '');
        if BankPaymentsBatchingLines.FindSet() then begin

            KCBPaymentLines.SetRange("Batch No", BankPaymentsBatchingLines."Batch No");
            if KCBPaymentLines.Find('-') then begin
                KCBPaymentLines.DeleteAll;
            end;
            repeat

                PVLines.Reset;
                PVLines.SetRange(No, BankPaymentsBatchingLines."Document No.");
                if PVLines.Find('-') then begin
                    KCBPaymentLines.Init;
                    KCBPaymentLines.Entry := 0;
                    KCBPaymentLines.Trcode := '65';//PayMode
                    if BankPaymentsBatchingLines."Pay Mode" = 'EFT' then
                        KCBPaymentLines.Trcode := '26';//PayMode

                    KCBPaymentLines."pay Mode" := BankPaymentsBatchingLines."Pay Mode";
                    KCBPaymentLines.DrAccount := BankPaymentsBatchingLines."Source Bank Acc No.";// To come from header
                    KCBPaymentLines.DrName := BankPaymentsBatchingLines."Source Bank Acc Name";
                    KCBPaymentLines.DrBnkCode := '1100';
                    if PVLines."Payment Type" = PVLines."payment type"::"Bank Transfer" then begin
                        if PVLines."Account No" = '' then
                            Error('Bank Account No for ' + BankPaymentsBatchingLines."Document No." + ' is blank');
                        KCBPaymentLines.CrAccount := PVLines."Account No";
                    end
                    else
                        if PVLines."Payment Type" = PVLines."payment type"::"Payment Voucher" then begin
                            if PVLines."Payee Bank Account Number" = '' then
                                Error('Bank Account No for ' + BankPaymentsBatchingLines."Document No." + ' is blank');
                            KCBPaymentLines.CrAccount := PVLines."Payee Bank Account Number";
                        end;
                    KCBPaymentLines.CrName := PVLines."Account Name";
                    KCBPaymentLines.CrBnkCode := PVLines."Payee Bank Branch Code";
                    KCBPaymentLines.Reference := BankPaymentsBatchingLines."Document No." + '-' + Format(BankPaymentsBatchingLines."Entry No");
                    KCBPaymentLines.Amount := Format(ROUND(PVLines."Net Amount"));
                    KCBPaymentLines."Amount Decimal" := ROUND(PVLines."Net Amount");
                    KCBPaymentLines."Batch No" := BankPaymentsBatchingLines."Batch No";
                    KCBPaymentLines."Document No" := BankPaymentsBatchingLines."Document No.";
                    KCBPaymentLines."Payment Narration" := BankPaymentsBatchingLines."Payment Narration";
                    KCBPaymentLines.Insert;
                end;

            until BankPaymentsBatchingLines.Next() = 0;
        end;
    end;
}

