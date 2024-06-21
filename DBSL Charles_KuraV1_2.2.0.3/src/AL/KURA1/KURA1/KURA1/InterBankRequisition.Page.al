#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57192 "Inter Bank  Requisition"
{
    Caption = 'AIE ';
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = "Inter Bank Transfer";
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Source Bank Account No"; "Source Bank Account No")
                {
                    ApplicationArea = Basic;
                }
                field("Source Bank Account Name"; "Source Bank Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Direct Transfer"; "Direct Transfer")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Region Code"; "Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name"; "Region Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Branch Code"; "Branch Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Branch Name"; "Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Code"; "Constituency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency Name"; "Constituency Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Funding Source Code"; "Funding Source Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount(LCY)"; "Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Originating Trans. Voucher No"; "Originating Trans. Voucher No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Disbursement Posted"; "Disbursement Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Receipt Posted"; "Receipt Posted")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. Series"; "No. Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Payables Account(HQ)"; "Payables Account(HQ)")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control30; "Inter Bank Requisition Line")
            {
                SubPageLink = "Document No" = field("Document No");
            }
            part(Tracking; "Approval Entry")
            {
                Caption = 'Tracking';
                SubPageLink = "Document No." = field("Document No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Post Disbursement")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    GLEntry.Reset;
                    GLEntry.SetRange(GLEntry."Document No.", "Document No");
                    GLEntry.SetRange(GLEntry.Reversed, false);
                    if GLEntry.FindSet then
                        Error('This document %1 as already been posted', "Document No");


                    TestField("Posting Date");
                    TestField("Approval Status", "approval status"::Released);
                    TestField("Project ID");
                    InterBankTransferLine.Reset;
                    InterBankTransferLine.SetRange(InterBankTransferLine."Document No", "Document No");
                    InterBankTransferLine.SetRange(InterBankTransferLine."Document Type", "Document Type");
                    if InterBankTransferLine.FindSet(true) then
                        InterBankTransferLine.CalcSums(Amount);


                    TestField(Amount, InterBankTransferLine.Amount);
                    CashManagementSetup.Get;
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                    GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                    if GenJournalLine.FindSet then
                        GenJournalLine.DeleteAll;

                    //Debit Region ACCS
                    InterBankTransferLine.Reset;
                    InterBankTransferLine.SetRange("Document No", Rec."Document No");
                    InterBankTransferLine.SetRange("Document Type", Rec."Document Type");
                    if InterBankTransferLine.FindSet(true) then
                        repeat

                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := CashManagementSetup."PV Journal Template";
                            GenJournalLine."Journal Batch Name" := CashManagementSetup."PV Journal Batch Name";
                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                            GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                            if GenJournalLine.FindLast then
                                GenJournalLine."Line No." := GenJournalLine."Line No." + 1000
                            else
                                GenJournalLine."Line No." := 10000;
                            GenJournalLine."Document No." := "Document No";
                            GenJournalLine.Validate("Dimension Set ID");
                            GenJournalLine.Description := Description;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                            GenJournalLine."Account No." := "Source Bank Account No";
                            GenJournalLine.Validate("Account No.");
                            GenJournalLine.Amount := -InterBankTransferLine.Amount;
                            GenJournalLine.Validate(Amount);
                            GenJournalLine."Posting Date" := "Posting Date";
                            GenJournalLine."External Document No." := InterBankTransferLine."Payment Reference";
                            /*GenJournalLine."Shortcut Dimension 1 Code":="Region Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine."Shortcut Dimension 2 Code":="Funding Source Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                            GenJournalLine."Shortcut Dimension 3 Code":="Constituency Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 3 Code");
                            GenJournalLine.ValidateShortcutDimCode(5,"Department Code");
                            GenJournalLine.ValidateShortcutDimCode(2,"Funding Source Code");*/
                            GenJournalLine."Dimension Set ID" := "Dimension Set ID";
                            GenJournalLine.Validate("Dimension Set ID");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := CashManagementSetup."PV Journal Template";
                            GenJournalLine."Journal Batch Name" := CashManagementSetup."PV Journal Batch Name";
                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                            GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                            if GenJournalLine.FindLast then
                                GenJournalLine."Line No." := GenJournalLine."Line No." + 1000
                            else
                                GenJournalLine."Line No." := 10000;

                            GenJournalLine."Document No." := "Document No";
                            GenJournalLine.Description := Description;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                            GenJournalLine."Account No." := InterBankTransferLine."Bank Account No";
                            GenJournalLine.Validate("Account No.");
                            GenJournalLine.Amount := InterBankTransferLine.Amount;
                            GenJournalLine.Validate(Amount);
                            GenJournalLine."Posting Date" := "Posting Date";
                            GenJournalLine."External Document No." := InterBankTransferLine."Payment Reference";
                            /*GenJournalLine."Shortcut Dimension 1 Code":=InterBankTransferLine."Shortcut Dimension 1 Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine."Shortcut Dimension 2 Code":=InterBankTransferLine."Shortcut Dimension 2 Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                            GenJournalLine."Shortcut Dimension 3 Code":=InterBankTransferLine."Shortcut Dimension 3 Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 3 Code");
                            GenJournalLine.ValidateShortcutDimCode(5,InterBankTransferLine."Department Code");
                            GenJournalLine.ValidateShortcutDimCode(2,InterBankTransferLine."Shortcut Dimension 2 Code");*/
                            GenJournalLine."Dimension Set ID" := InterBankTransferLine."Dimension Set ID";
                            GenJournalLine.Validate("Dimension Set ID");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;
                        until InterBankTransferLine.Next = 0;

                    //Debit Receivable(Region) Account
                    InterBankTransferLine.Reset;
                    InterBankTransferLine.SetRange("Document No", Rec."Document No");
                    InterBankTransferLine.SetRange("Document Type", Rec."Document Type");
                    if InterBankTransferLine.FindSet(true) then
                        repeat
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := CashManagementSetup."PV Journal Template";
                            GenJournalLine."Journal Batch Name" := CashManagementSetup."PV Journal Batch Name";
                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                            GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                            if GenJournalLine.FindLast then
                                GenJournalLine."Line No." := GenJournalLine."Line No." + 1000
                            else
                                GenJournalLine."Line No." := 1000;
                            GenJournalLine."Document No." := "Document No";
                            GenJournalLine.Description := Description;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Customer;
                            GenJournalLine."Account No." := InterBankTransferLine."Receivable Account(Region)";
                            GenJournalLine.Validate("Account No.");
                            GenJournalLine.Amount := InterBankTransferLine.Amount;
                            GenJournalLine.Validate(Amount);
                            GenJournalLine."Posting Date" := "Posting Date";
                            GenJournalLine."Currency Code" := "Currency Code";
                            GenJournalLine.Validate("Currency Code");
                            GenJournalLine."External Document No." := InterBankTransferLine."Payment Reference";
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := '';
                            GenJournalLine.Validate("Bal. Account No.");
                            /*GenJournalLine."Shortcut Dimension 1 Code":=InterBankTransferLine."Shortcut Dimension 1 Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine."Shortcut Dimension 2 Code":=InterBankTransferLine."Shortcut Dimension 2 Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                            GenJournalLine."Shortcut Dimension 3 Code":=InterBankTransferLine."Shortcut Dimension 3 Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 3 Code");*/
                            GenJournalLine."Dimension Set ID" := InterBankTransferLine."Dimension Set ID";
                            GenJournalLine.Validate("Dimension Set ID");
                            //GenJournalLine.ValidateShortcutDimCode(5,InterBankTransferLine."Department Code");
                            //GenJournalLine.ValidateShortcutDimCode(2,InterBankTransferLine."Shortcut Dimension 2 Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;


                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := CashManagementSetup."PV Journal Template";
                            GenJournalLine."Journal Batch Name" := CashManagementSetup."PV Journal Batch Name";
                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                            GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                            if GenJournalLine.FindLast then
                                GenJournalLine."Line No." := GenJournalLine."Line No." + 1000
                            else
                                GenJournalLine."Line No." := 1000;
                            GenJournalLine."Document No." := "Document No";
                            GenJournalLine.Description := Description;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::Vendor;
                            GenJournalLine."Account No." := "Payables Account(HQ)";
                            GenJournalLine.Validate("Account No.");
                            GenJournalLine.Amount := -InterBankTransferLine.Amount;
                            GenJournalLine.Validate(Amount);
                            GenJournalLine."Posting Date" := "Posting Date";
                            GenJournalLine."Currency Code" := "Currency Code";
                            GenJournalLine.Validate("Currency Code");
                            GenJournalLine."External Document No." := InterBankTransferLine."Payment Reference";
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                            GenJournalLine."Bal. Account No." := '';
                            GenJournalLine.Validate("Bal. Account No.");
                            /*GenJournalLine."Shortcut Dimension 1 Code":="Region Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 1 Code");
                            GenJournalLine."Shortcut Dimension 2 Code":="Funding Source Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 2 Code");
                            GenJournalLine."Shortcut Dimension 3 Code":="Constituency Code";
                            GenJournalLine.VALIDATE(GenJournalLine."Shortcut Dimension 3 Code");*/
                            GenJournalLine."Dimension Set ID" := "Dimension Set ID";
                            GenJournalLine.Validate("Dimension Set ID");
                            //GenJournalLine.ValidateShortcutDimCode(5,"Department Code");
                            //GenJournalLine.ValidateShortcutDimCode(2,"Funding Source Code");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;
                        until InterBankTransferLine.Next = 0;

                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine);//Post


                    //Update Requisition
                    "Disbursement Posted" := true;
                    "Receipt Posted" := true;
                    Modify;
                    Validate("Disbursement Posted");

                    //Post To PayBridge
                    if Confirm('Are you sure you want to post this document to paybridge?') = true then
                        FnInsertNetAmountAIE()
                    else
                        exit;
                    CurrPage.Close();

                end;
            }
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = "Document No" <> '';
                Image = Dimensions;
                Promoted = true;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = ReOpen;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    "Approval Status" := "approval status"::Open;
                    Modify;
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    "Approval Status" := "approval status"::Released;
                    Modify;
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    TestField("Payables Account(HQ)");
                    TestField(Description);
                    TestField("Source Bank Account No");
                    // if ApprovalsMgmt.CheckAIEReqApprovalPossible(Rec) then
                    //   ApprovalsMgmt.OnSendAIEReqForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //  ApprovalsMgmt.OnCancelAIEReqApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //  ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Approve)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approve;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //ApprovalsMgmt.
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Reject;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Rejected');
                end;
            }
            action(Delegate)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Delegate;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Delegated');
                end;
            }
            action("Import Lines")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    InterBankTransLine.Reset;
                    InterBankTransLine.SetRange("Document No", Rec."Document No");
                    if InterBankTransLine.FindFirst then begin
                        ImportInterBankDis.GetVariables(InterBankTransLine);
                        ImportInterBankDis.Run;
                    end;
                end;
            }
            action("Suggest AIE Disbursements")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //Update the lines as not selected
                    InterBankTransfer.Reset;
                    InterBankTransfer.SetRange(InterBankTransfer."Document Type", InterBankTransfer."document type"::"AIE Funds Transfer");
                    if InterBankTransfer.FindSet then begin
                        repeat
                            //InterBankTransfer.Select:=FALSE;
                            InterBankTransfer."From Doc Number" := "Document No";
                            InterBankTransfer."From Document Type" := "Document Type";
                            InterBankTransfer.Modify;
                        until InterBankTransfer.Next = 0;
                    end;

                    InterBankTransfer.Reset;
                    InterBankTransfer.SetRange(InterBankTransfer."Approval Status", InterBankTransfer."approval status"::Released);
                    InterBankTransfer.SetRange(InterBankTransfer."Document Type", InterBankTransfer."document type"::"AIE Funds Transfer");
                    InterBankTransfer.SetFilter(InterBankTransfer."Posting Date", '%1', 0D);
                    if InterBankTransfer.FindSet(true) then begin
                        AIEFundTransfersReleased.SetTableview(InterBankTransfer);
                        //AIEFundTransfersReleased.
                        AIEFundTransfersReleased.Run;
                    end;
                    /*
                    InterBankTransfer.RESET;
                    InterBankTransfer.SETRANGE(InterBankTransfer."Approval Status",InterBankTransfer."Approval Status"::Released);
                    InterBankTransfer.SETRANGE(InterBankTransfer."Document Type",InterBankTransfer."Document Type"::"AIE Funds Transfer");
                    InterBankTransfer.SETFILTER(InterBankTransfer."Posting Date",'%1',0D);
                    InterBankTransfer.SETRANGE(InterBankTransfer."Selected By",USERID);
                    InterBankTransfer.SETFILTER(InterBankTransfer.Select,'%1',TRUE);
                    IF InterBankTransfer.FINDSET(TRUE) THEN BEGIN
                      REPEAT
                      InterBankTransLine.RESET;
                      InterBankTransLine.SETRANGE(InterBankTransLine."Document Type",InterBankTransLine."Document Type"::"AIE Funds Transfer");
                      InterBankTransLine.SETRANGE(InterBankTransLine.Selected,TRUE);
                       IF InterBankTransLine.FINDSET(TRUE) THEN BEGIN
                        REPEAT
                         ObjInterBTLine.RESET;
                          ObjInterBTLine.SETRANGE(ObjInterBTLine."Document Type",ObjInterBTLine."Document Type"::"InterBank Requisition Voucher");
                          IF ObjInterBTLine.FINDLAST THEN
                          LineNo:=ObjInterBTLine."Line No"+1000;
                          ObjInterBTLine.INIT;
                          ObjInterBTLine.TRANSFERFIELDS(InterBankTransLine);
                          ObjInterBTLine."Document No":="Document No";
                          ObjInterBTLine."Line No":=LineNo;
                          ObjInterBTLine."Document Type":=ObjInterBTLine."Document Type"::"InterBank Requisition Voucher";
                          ObjInterBTLine.INSERT(TRUE);
                        UNTIL InterBankTransLine.NEXT = 0;
                        END;
                        UNTIL InterBankTransfer.NEXT =0;
                        END;
                    */

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("Document No", "Document No");
                    Report.Run(57093, true, false, Rec);
                end;
            }
            action("Print AIE")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = PrintAcknowledgement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document No", "Document No");
                    if FindSet then
                        Report.Run(59100, true, false, Rec);
                    Reset;
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::"InterBank Requisition Voucher";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"InterBank Requisition Voucher"
    end;

    trigger OnOpenPage()
    begin
        // // IF "Approval Status"="Approval Status"::Released THEN
        // //  CurrPage.EDITABLE:=FALSE;
    end;

    var
        CashManagementSetup: Record "Cash Management Setup";
        GenJournalLine: Record "Gen. Journal Line";
        InterBankTransferLine: Record "Inter Bank Transfer Line";
        Batch: Record "Gen. Journal Batch";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        GLEntry: Record "G/L Entry";
        InterBankTransfer: Record "Inter Bank Transfer";
        AIEFundTransfersReleased: Page "AIE Fund Transfers Released";
        InterBankTransLine: Record "Inter Bank Transfer Line";
        ObjInterBTLine: Record "Inter Bank Transfer Line";
        LineNo: Integer;
        ShortcutDimCode: array[8] of Code[20];
        ImportInterBankDis: XmlPort "Import Inter Bank Disbursement";
        Payments: Record payments;
        BridgeTransaction: Record "Bridge Transaction";
        BridgeSubTransaction: Record "Bridge Sub Transaction";
        TransIDX: Integer;
        PVLines: Record "PV Lines";
        Vendor: Record Vendor;
        VendorBankAccount: Record "Vendor Bank Account";
        BridgeTransactionType: Record "Bridge Transaction Type";
        ObjJob: Record Job;
        BankAccount: Record "Bank Account";
        BankAccountPostingGroup: Record "Bank Account Posting Group";
        GLAccount: Record "G/L Account";
        TransactionNo: Integer;
        DocNumber: Code[30];
        Customer: Record Customer;
        TransID: Integer;

    local procedure FnInsertNetAmount()
    begin
        TransactionNo := 0;
        InterBankTransferLine.Reset;
        InterBankTransferLine.SetRange(InterBankTransferLine."Document No", "Document No");
        InterBankTransferLine.SetRange(InterBankTransferLine."Document Type", InterBankTransferLine."document type"::"InterBank Requisition Voucher");
        if InterBankTransferLine.FindSet then begin
            repeat
                BridgeTransaction.Init;
                BridgeTransaction.TransactionID := BridgeTransaction.Count + 1;
                TransactionNo := BridgeTransaction.TransactionID;
                BridgeTransaction.VoucherDate := "Posting Date";
                BridgeTransaction.VoucherID := Format(TransactionNo);

                if BridgeTransactionType.Get('REG') then begin
                    BridgeTransaction.TrCode := BridgeTransactionType.Code;
                    BridgeTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                    BridgeTransaction.TrDescription := BridgeTransactionType.Description;
                end;

                BridgeTransaction.TxnModule := 'AR';

                if InterBankTransferLine.Amount <> 0 then
                    BridgeTransaction.TxnAmount := InterBankTransferLine.Amount;
                BridgeTransaction.TxnDescription := InterBankTransferLine.Description;
                BridgeTransaction.TxnReference := InterBankTransferLine."Payment Reference";
                BridgeTransaction.ProjectID := "Project ID";
                BridgeTransaction.ProjectCode := "Project ID";
                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", BridgeTransaction.ProjectCode);
                if ObjJob.FindSet then begin
                    BridgeTransaction.ProjectDescription := ObjJob.Description;
                    BridgeTransaction.ProjectName := ObjJob.Description;
                end;
                BridgeTransaction.SupplierAccount := InterBankTransferLine."Receivable Account(Region)";
                BridgeTransaction.BankName := InterBankTransferLine."Bank Account Name";
                BridgeTransaction.BankCode := InterBankTransferLine."Bank Account No";
                BankAccount.Reset;
                BankAccount.SetRange(BankAccount."Bank Account No.", InterBankTransferLine."Bank Account No");
                if BankAccount.FindSet then begin
                    BridgeTransaction.BankBranchCode := BankAccount."Bank Branch No.";
                    BridgeTransaction.BankBranch := BankAccount."Bank Branch Name";
                    BridgeTransaction.BankAccNum := BankAccount."Bank Account No.";
                end;

                BankAccount.Reset;
                BankAccount.SetRange(BankAccount."No.", "Source Bank Account No");
                if BankAccount.FindSet then begin
                    BridgeTransaction.SourceBankAccountName := BankAccount."Bank Account  Name";
                    BridgeTransaction.SourceBankAccountNumber := BankAccount."Bank Account No.";
                    BridgeTransaction.SourceBankName := BankAccount."Bank Account  Name";
                    BridgeTransaction.SourceBankAccountDescription := BankAccount."Bank Account  Name";
                    BridgeTransaction.SourceBankBranch := BankAccount."Branch Name";
                    BridgeTransaction.SourceBankCode := BankAccount."Bank Branch No.";
                end;
                if not BridgeTransaction.Get(TransactionNo) then
                    BridgeTransaction.Insert(true);
            until InterBankTransferLine.Next = 0;
        end;
    end;

    local procedure FnInsertWVATAmount()
    begin
        /*PVLines.RESET;
        PVLines.SETRANGE(PVLines.No,"No.");
        IF PVLines.FINDSET THEN BEGIN
          IF PVLines."VAT Withheld Amount"<> 0 THEN BEGIN
          REPEAT
            BridgeSubTransaction.INIT;
            BridgeSubTransaction.TransactionID:=COPYSTR("No.",3);
            BridgeSubTransaction.VoucherID:=COPYSTR("No.",3);
            BridgeSubTransaction.VoucherDate:="Posting Date";
        
            IF BridgeTransactionType.GET('WHAT') THEN BEGIN
              ///MESSAGE('Witholding VAT code %1',BridgeTransactionType.Code);
            BridgeSubTransaction.TrCode:=BridgeTransactionType.Code;
            BridgeSubTransaction.TRCodeID:=BridgeTransactionType.TRCodeID;
            BridgeSubTransaction.TrDescription:=BridgeTransactionType.Description;
            END;
        
            BridgeSubTransaction.TxnAmount:=PVLines."VAT Withheld Amount";
            BridgeSubTransaction.TxnDescription:="Payment Narration";
            BridgeSubTransaction.TxnReference:="Cheque No";
            BridgeSubTransaction.SupplierAccount:=PVLines."Account No";
              Vendor.RESET;
              Vendor.SETRANGE(Vendor."No.",BridgeSubTransaction.SupplierAccount);
              IF Vendor.FINDSET THEN BEGIN
                BridgeSubTransaction.SupplierName:=UPPERCASE(Vendor.Name);
                //BridgeSubTransaction.Email:=Vendor.Email;
                END;
                VendorBankAccount.RESET;
                VendorBankAccount.SETRANGE(VendorBankAccount."Vendor No.",BridgeSubTransaction.SupplierAccount);
                IF VendorBankAccount.FINDSET THEN BEGIN
                  BridgeSubTransaction.BankName:=VendorBankAccount.Name;
                  BridgeSubTransaction.BankCode:=VendorBankAccount.Code;
                  BridgeSubTransaction.BankBranchCode:=VendorBankAccount."Bank Branch No.";
                  BridgeSubTransaction.BankBranch:=VendorBankAccount."Bank Branch No.";
                  BridgeSubTransaction.BankAccNum:=VendorBankAccount."Bank Account No."
                 END;
            IF BridgeSubTransaction.TxnAmount<> 0 THEN
            BridgeSubTransaction.INSERT(TRUE);
          UNTIL PVLines.NEXT =0;
          END;
         END;*/

    end;

    local procedure FnInsertWTaxAmount()
    begin
        /*PVLines.RESET;
        PVLines.SETRANGE(PVLines.No,"No.");
        IF PVLines.FINDSET THEN BEGIN
          IF PVLines."W/Tax Amount"<> 0 THEN BEGIN
          REPEAT
            BridgeSubTransaction.INIT;
            BridgeSubTransaction.TransactionID:=COPYSTR("No.",3);
            BridgeSubTransaction.VoucherID:=COPYSTR("No.",3);
            IF BridgeTransactionType.GET('WHT') THEN BEGIN
        //      MESSAGE('Witholding Tax %1',BridgeTransactionType.Code);
            BridgeSubTransaction.TrCode:=BridgeTransactionType.Code;
            BridgeSubTransaction.VoucherDate:="Posting Date";
            BridgeSubTransaction.TRCodeID:=BridgeTransactionType.TRCodeID;
            BridgeSubTransaction.TrDescription:=BridgeTransactionType.Description;
            END;
            BridgeSubTransaction.TxnAmount:=PVLines."W/Tax Amount";
            BridgeSubTransaction.TxnDescription:=PVLines.Description;
            BridgeSubTransaction.TxnReference:="Cheque No";
            BridgeSubTransaction.SupplierAccount:=PVLines."Account No";
              Vendor.RESET;
              Vendor.SETRANGE(Vendor."No.",BridgeSubTransaction.SupplierAccount);
              IF Vendor.FINDSET THEN BEGIN
                BridgeSubTransaction.SupplierName:=UPPERCASE(Vendor.Name);
                //BridgeSubTransaction.Email:=Vendor.Email;
                END;
                VendorBankAccount.RESET;
                VendorBankAccount.SETRANGE(VendorBankAccount."Vendor No.",BridgeSubTransaction.SupplierAccount);
                IF VendorBankAccount.FINDSET THEN BEGIN
                  BridgeSubTransaction.BankName:=VendorBankAccount.Name;
                  BridgeSubTransaction.BankCode:=VendorBankAccount.Code;
                  BridgeSubTransaction.BankBranchCode:=VendorBankAccount."Bank Branch No.";
                  BridgeSubTransaction.BankBranch:=VendorBankAccount."Bank Branch No.";
                  BridgeSubTransaction.BankAccNum:=VendorBankAccount."Bank Account No."
                 END;
            IF BridgeSubTransaction.TxnAmount<> 0 THEN
            BridgeSubTransaction.INSERT(TRUE);
          UNTIL PVLines.NEXT =0;
          END;
          END;*/

    end;

    local procedure FnInsertRetensionAmount()
    begin
        /*PVLines.RESET;
        PVLines.SETRANGE(PVLines.No,"No.");
        IF PVLines.FINDSET THEN BEGIN
          IF PVLines."Retention  Amount"<> 0 THEN BEGIN
          REPEAT
            BridgeSubTransaction.INIT;
            BridgeSubTransaction.TransactionID:=COPYSTR("No.",3);
            BridgeSubTransaction.VoucherID:=COPYSTR("No.",3);
            BridgeSubTransaction.VoucherDate:="Posting Date";
        
            IF BridgeTransactionType.GET('RET') THEN BEGIN
            BridgeSubTransaction.TrCode:=BridgeTransactionType.Code;
            BridgeSubTransaction.TRCodeID:=BridgeTransactionType.TRCodeID;
            BridgeSubTransaction.TrDescription:=BridgeTransactionType.Description;
            END;
        
            BridgeSubTransaction.TxnAmount:=PVLines."Retention  Amount";
            BridgeSubTransaction.TxnDescription:="Payment Narration";
            BridgeSubTransaction.TxnReference:="Cheque No";
            BridgeSubTransaction.SupplierAccount:=PVLines."Account No";
              Vendor.RESET;
              Vendor.SETRANGE(Vendor."No.",BridgeSubTransaction.SupplierAccount);
              IF Vendor.FINDSET THEN BEGIN
                BridgeSubTransaction.SupplierName:=UPPERCASE(Vendor.Name);
                //BridgeSubTransaction.Email:=Vendor.Email;
                END;
                VendorBankAccount.RESET;
                VendorBankAccount.SETRANGE(VendorBankAccount."Vendor No.",BridgeSubTransaction.SupplierAccount);
                IF VendorBankAccount.FINDSET THEN BEGIN
                  BridgeSubTransaction.BankName:=VendorBankAccount.Name;
                  BridgeSubTransaction.BankCode:=VendorBankAccount.Code;
                  BridgeSubTransaction.BankBranchCode:=VendorBankAccount."Bank Branch No.";
                  BridgeSubTransaction.BankBranch:=VendorBankAccount."Bank Branch No.";
                  BridgeSubTransaction.BankAccNum:=VendorBankAccount."Bank Account No."
                 END;
        
            BridgeSubTransaction.INSERT(TRUE);
          UNTIL PVLines.NEXT =0;
          END;
         END;
         */

    end;

    local procedure FnInsertNetAmountAIE()
    begin
        CashManagementSetup.Get();
        TransID := 0;
        InterBankTransferLine.Reset;
        InterBankTransferLine.SetRange(InterBankTransferLine."Document No", "Document No");
        InterBankTransferLine.SetRange(InterBankTransferLine."Document Type", InterBankTransferLine."document type"::"InterBank Requisition Voucher");
        if InterBankTransferLine.FindSet then begin
            CashManagementSetup.Get();
            repeat
                TransID := CashManagementSetup."Last Transaction No Used" + 1;

                BridgeTransaction.Init;
                BridgeTransaction.TransactionID := TransID;
                BridgeTransaction.VoucherDate := "Posting Date";
                BridgeTransaction.VoucherID := Format(BridgeTransaction.TransactionID);

                if BridgeTransactionType.Get('REG') then begin
                    BridgeTransaction.TrCode := BridgeTransactionType.Code;
                    BridgeTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                    BridgeTransaction.TrDescription := BridgeTransactionType.Description;
                end;

                BridgeTransaction.TxnModule := 'AR';
                //BridgeTransaction.IsAIE:=TRUE;
                BridgeTransaction.TxnAmount := InterBankTransferLine.Amount;
                BridgeTransaction.TxnDescription := InterBankTransferLine.Description;
                BridgeTransaction.TxnReference := InterBankTransferLine."Payment Reference";
                BridgeTransaction.ProjectID := CopyStr("Project ID", 8);
                //BridgeTransaction.ProjectID:=DELCHR(BridgeTransaction.ProjectID,'<','/');
                BridgeTransaction.ProjectCode := "Project ID";

                ObjJob.Reset;
                ObjJob.SetRange(ObjJob."No.", BridgeTransaction.ProjectCode);
                if ObjJob.FindSet then begin
                    BridgeTransaction.ProjectName := ObjJob.Description;
                    BridgeTransaction.ProjectDescription := ObjJob.Description;
                end;

                BridgeTransaction.SupplierAccount := InterBankTransferLine."Receivable Account(Region)";

                Customer.Reset;
                Customer.SetRange(Customer."No.", BridgeTransaction.SupplierAccount);
                if Customer.FindSet then begin
                    BridgeTransaction.SupplierName := UpperCase(Customer.Name);
                    BridgeTransaction.Email := Customer."E-Mail";
                end;
                BankAccount.Reset;
                BankAccount.SetRange("No.", InterBankTransferLine."Bank Account No");
                if BankAccount.FindSet then begin
                    BridgeTransaction.BankName := BankAccount."Bank Account  Name";
                    BridgeTransaction.BankCode := BankAccount."Bank Code";
                    BridgeTransaction.BankBranchCode := BankAccount."Bank Branch No.";
                    BridgeTransaction.BankBranch := BankAccount."Bank Branch Name";
                    BridgeTransaction.BankAccNum := BankAccount."Bank Account No.";
                end;
                BankAccount.Reset;
                BankAccount.SetRange("No.", "Source Bank Account No");
                if BankAccount.FindSet then begin
                    BridgeTransaction.SourceBankAccountName := BankAccount."Bank Account  Name";
                    BridgeTransaction.SourceBankCode := BankAccount."Bank Code";
                    ;
                    BridgeTransaction.SourceBankAccountName := BankAccount."Bank Account  Name";
                    BridgeTransaction.SourceBankName := BankAccount."Bank Account  Name";
                    BridgeTransaction.SourceBankBranch := BankAccount."Bank Branch No.";
                    BridgeTransaction.SourceBankAccountNumber := BankAccount."Bank Account No.";
                    BridgeTransaction.SourceBankAccountDescription := BankAccount.Name;
                    BridgeTransaction.SourceBankAccount := BankAccount."Bank Account No.";
                end;

                //IF NOT BridgeTransaction.GET(BridgeTransaction.TransactionID) THEN
                BridgeTransaction.Insert(true);
                //MESSAGE(FORMAT(BridgeTransaction));
                CashManagementSetup."Last Transaction No Used" := CashManagementSetup."Last Transaction No Used" + 1;
                CashManagementSetup.Validate("Last Transaction No Used");
                CashManagementSetup.Modify(true);
                // MESSAGE('Here we are %1',CashManagementSetup."Last Transaction No Used");
                TransID := CashManagementSetup."Last Transaction No Used" + 1;
            until InterBankTransferLine.Next = 0;
            CashManagementSetup."Last Transaction No Used" := CashManagementSetup."Last Transaction No Used" + 1;
            CashManagementSetup.Validate("Last Transaction No Used");
            CashManagementSetup.Modify(true);

        end;



    end;
}

