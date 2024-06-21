#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95321 "Batch Payment Card2"
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
                action("Generate Payment Lines")
                {
                    ApplicationArea = Basic;
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to generate Bank Payment Lines for Batch No. %1', false, "Batch No") = false then exit;

                        BankPaymentsBatching.Reset;
                        BankPaymentsBatching.SetRange("Batch No", "Batch No");
                        BankPaymentsBatching.SetRange("Approval  Status", BankPaymentsBatching."approval  status"::Approved);
                        if BankPaymentsBatching.FindFirst() then begin
                            Error('Document already approved.You cannot modify an approved document.');
                        end;

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
                        end else
                            Error('No payment Vouchers selected');

                        Message('Bank payment file generated succesfully');
                    end;
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
                            // QuickPayIntegration.GeneratePaymentFile("Batch No");
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

                        KCBPaymentLines.Reset;
                        KCBPaymentLines.SetRange("Batch No", "Batch No");
                        if not KCBPaymentLines.FindFirst() then begin
                            Error('Generate Payment Lines before sending document for approval');
                        end;


                        //  if ApprovalsMgmt.CheckBPaymentReqApprovalPossible(Rec) then
                        //    ApprovalsMgmt.OnSendBPaymentReqForApproval(Rec);
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
                        //    ApprovalsMgmt.OnCancelBPaymentReqApprovalRequest(Rec);
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
                        //   ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    begin
                        ApprovalEntry.Reset;
                        ApprovalEntry.SetCurrentkey("Sequence No.");
                        ApprovalEntry.SetAscending("Sequence No.", true);
                        ApprovalEntry.SetRange("Document No.", "Batch No");
                        if ApprovalEntry.FindLast() then begin
                            if ApprovalEntry."Approver ID" = UserId then begin
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

                        // IF "OTP SMS"<>"OTP SMS Verification" THEN
                        //  ERROR('Please Enter OTP received via SMS');

                        // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                        // ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                        // ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ApprovalEntry: Record "Approval Entry";
        BankPaymentsBatching: Record "Bank Payments Batching";


    // procedure FnSendOTPMail()
    // var
    //     LastFieldNo: Integer;
    //     FileName: Text[100];
    //     Window: Dialog;
    //     RunOnceFile: Text[1000];
    //     TimeOut: Integer;
    //     cr: Integer;
    //     lf: Integer;
    //     EmailBody: array [2] of Text[30];
    //     BodyText: Text[250];
    //     mymail: Codeunit Mail;
    //     DefaultPrinter: Text[200];
    //     WindowisOpen: Boolean;
    //    // FileDialog: Codeunit Mail;
    //     SendingDate: Date;
    //     SendingTime: Time;
    //     Counter: Integer;
    //     cu400: Codeunit Mail;
    //     DocLog: Record "Document E-mail Log";
    //     BranchName: Code[80];
    //     DimValue: Record "Dimension Value";
    //     SenderAddress: Text[100];
    //     CustEmail: Text[100];
    //     UserSetup: Record "User Setup";
    //     HRSetup: Record "Company Information";
    //     Emp: Record Vendor;
    //     PayrollMonth: Date;
    //     PayrollMonthText: Text[30];
    //     PayPeriodtext: Text;
    //     PayPeriod: Record "Payroll PeriodX";
    //     CompInfo: Record "Company Information";
    //     StartDate: Date;
    //     EndDAte: Date;
    //     EmailVerifier: Codeunit Payroll3;
    //     IsEmailValid: Boolean;
    //     RequesterName: Text[100];
    //     RequesterEmail: Text[100];
    //     emailhdr: Text[100];
    //     CompanyDetails: Text[250];
    //     SenderMessage: Text[1000];
    //     LoginDetails: Text[1000];
    //     PortalUser: Record "Dynasoft Portal User";
    //     Password: Text[50];
    //     ActivationDetails: Text[1000];
    //     RandomDigit: Text[50];
    // begin


    //     UserSetup.Reset;
    //     UserSetup.SetRange("User ID",UserId);
    //     if UserSetup.FindSet then begin
    //     RequesterEmail:='joe.alfonce@gmail.com';
    //     RequesterName:='';

    //     Window.Open('Sending...');
    //     WindowisOpen := true;

    //     RandomDigit := CreateGuid;
    //     RandomDigit := DelChr(RandomDigit,'=','{}-01');
    //     RandomDigit := CopyStr(RandomDigit,1,5);

    //     //Counter:=Counter+1;

    //       Password:=RandomDigit;


    //     //Create message
    //     // HRSetup.GET();
    //     // IF HRSetup."E-Mail"='' THEN
    //     //  ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');

    //     SenderAddress:='kerra@kerra.go.ke';//HRSetup."E-Mail";

    //     CompanyDetails:='Dear Sir/Madam,';
    //     SenderMessage:='<BR>Please find below system Generated Bank Payments One Time Passcode</B></BR>';
    //     LoginDetails:='<BR>PassCode:'+Password+'</BR>';

    //     emailhdr:='KERRA Online Bank Payments - OTP (Batch No:'+"Batch No"+')';

    //     cu400.CreateMessage(CompInfo.Name,SenderAddress,RequesterEmail,emailhdr,
    //     CompanyDetails+'</BR>'+SenderMessage+LoginDetails, true);

    //     cu400.AddCC(RequesterEmail);

    //     //cu400.AddBodyline(ProcNote);

    //     cu400.Send;
    //     SendingDate:=Today;
    //     SendingTime:=Time;

    //      Sleep(1000);
    //      Window.Close;
    //      //IFS."Sent Cancellation Secret Code":=Password;
    //      //IFSCommitteMembers.MODIFY(TRUE);
    //      //UNTIL IFSCommitteMembers.NEXT=0;
    //      end;
    //end;

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

