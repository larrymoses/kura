#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57003 "Approved Payment Voucher"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Posted = const(false),
                            Status = const(Released));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = false;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }

                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Source Bank Acc No."; Rec."Source Bank Acc No.")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Cheque No/Reference No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget/Exchequer Account';
                    Editable = true;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Line';
                    Editable = true;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total VAT Wthheld"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total VAT Wthheld';
                }
                field("Total PAYE Amount"; Rec."Total PAYE Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Supervision Cost"; Rec."Total Supervision Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency Notice VAT';
                }
                field("Obligation Income Tax"; Rec."Obligation Income Tax")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency Notice Income Tax';
                }
                field("Obligation WHT"; Rec."Obligation WHT")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agency Notice WHT';
                }
                field("Total Liquidated Damages"; Rec."Total Liquidated Damages")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                }

                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                }
                group("Employee Bank Details")
                {
                    Caption = 'Employee Bank Details';
                    field("Employee Mobile No"; Rec."Employee Mobile No")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee Bank Account Code"; Rec."Employee Bank Account Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee Ban Account Name"; Rec."Employee Ban Account Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee Bank Brach Code"; Rec."Employee Bank Brach Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee Bank Branch Name"; Rec."Employee Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                    {
                        ApplicationArea = Basic;
                    }
                    part("Attached Documents1"; "Document Attachment Factbox1")
                    {
                        ApplicationArea = All;
                        Caption = 'Attachment';
                        SubPageLink = "Table ID" = CONST(57000), "No." = FIELD("No.");//, "Document Type" = CONST(0);
                        // SystemCreatedBy = field(SystemCreatedBy);
                        //Editable = false;
                    }
                }
            }
            part(Control1000000021; "Posted PV Lines")
            {
                //Editable = false;
                Caption ='Approved PV Lines';
                SubPageLink = No = field("No.");
            }
            part(Control8; "Approval Entry")
            {
                Caption = 'Tracking';
                Editable = false;
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ApprovalEntries.Setfilters(Database::payments, 7, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                        ResponsibilityCenter: Record "Responsibility Center";
                        PV: Record payments;
                    begin
                        if UserSetup.Get(UserId) then begin
                            if ResponsibilityCenter.Get(UserSetup."Responsibility Center") then begin
                                if ResponsibilityCenter.HQ then begin
                                     PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Payment Voucher", true, true, PV)
                                end else begin
                                    PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                                end;
                            end;
                        end else begin
                            if ResponsibilityCenter.Get(Rec."Responsibility Center") then begin
                                if ResponsibilityCenter.HQ then begin
                                    PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Payment Voucher", true, true, PV)
                                end else begin
                                    PV.Reset();
                                    PV.SetRange("No.", Rec."No.");
                                    Report.Run(Report::"Regional Payment Voucher", true, true, PV);
                                end;
                            end;
                        end;
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    // ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                    //  ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        ReopenPV.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
            }
        }
        area(creation)
        {
            action("Banked Payment Voucher")
            {
                ApplicationArea = Basic;
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible =false;
                trigger OnAction()
                begin
                    Payments.Reset;
                    Payments.SetRange("No.", Rec."No.");
                    Payments.SetRange(Select, true);
                    Payments.SetRange("Payment Type", Payments."payment type"::"Payment Voucher");
                    if Payments.Find('-') then begin
                        repeat
                            Payments.banked := true;
                            Payments.Modify;
                        until Payments.Next = 0;
                    end;
                    Message('Banked Successfully');
                end;
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        if Rec."Staff Claim" = false then begin
                            Rec.TestField("Posting Date");
                            Rec.TestField("Cheque No");
                            PVLines.Reset;
                            PVLines.SetRange(PVLines.No, Rec."No.");
                            if PVLines.FindSet then begin
                                repeat
                                    PVLines.TestField(Description);
                                until PVLines.Next = 0;
                            end;
                          //  IF CONFIRM('Are you sure you want to post the Payment Voucher No. ' + REC."No." + ' ?') = TRUE THEN BEGIN
                                PaymentsPost."Post Payment Voucher"(Rec);
                           // END;

                            //Create A bank Transfer
                            //FnCreateInterBankTransferForRetention();
                            //Transfer to PayBridge
                            FnInsertNetAmount();
                            FnInsertWVATAmount();
                            FnInsertWPAYEAmount();
                            FnInsertWTaxAmount();
                            FnInsertRetensionAmount();
                            CurrPage.Close;
                        end
                        else
                            if Rec."Staff Claim" = true then begin
                                PaymentsPost.PostStaffClaims(Rec);
                                FnInsertNetAmountSClaim();
                                CurrPage.Close();
                            end;

                        //Notify Contractor and Directorate when Remaining amount on advance customer number is zero
                        PVLines.Reset;
                        PVLines.SetRange(PVLines.No, Rec."No.");
                        if PVLines.FindSet then begin
                            repeat
                                IF PVLines."Advance Recovery" > 0 THEN begin
                                    Vendor.SetRange(Vendor."No.", PVLines."Account No");
                                    if Vendor.FindSet then begin
                                        Vendor.TestField("Advance Customer No");
                                        ObjCustomer.Reset;
                                        ObjCustomer.SetRange(ObjCustomer."No.", Vendor."Advance Customer No");
                                        if ObjCustomer.FindSet then begin
                                            ObjCustomer.CalcFields(Balance, "Balance (LCY)", "Balance Due", "Balance Due (LCY)");
                                            if ObjCustomer.Balance <= 0 then
                                                EmailNotify.FnNotifyContractorAdvancePaymentFullRecovery(Rec."No.", PVLines."Account No", Rec, PVLines);
                                        end;
                                    end;
                                END;
                            until PVLines.Next = 0;
                        end;
                        //End Notify Contractor and Directorate when Remaining amount on advance customer number is zero
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Payment Voucher";
        Rec."Account Type" := Rec."account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        text0001: label 'The customer Account Number Must have a value. Cannot be Empty.';
        ReopenPV: Codeunit Payments;
        usersetup: Record "User Setup";
        Payments: Record payments;
        BridgeTransaction: Record "Bridge Transaction";
        BridgeSubTransaction: Record "Bridge Sub Transaction";
        TransID: Integer;
        PVLines: Record "PV Lines";
        Vendor: Record Vendor;
        VendorBankAccount: Record "Vendor Bank Account";
        BridgeTransactionType: Record "Bridge Transaction Type";
        ObjJob: Record Job;
        BankAccount: Record "Bank Account";
        BankAccountPostingGroup: Record "Bank Account Posting Group";
        GLAccount: Record "G/L Account";
        TransactionIDSub: Integer;
        Employee: Record Employee;
        EmailNotify: Codeunit "Procurement Processing";
        ObjCustomer: Record Customer;

    local procedure SetControlAppearance()
    var
    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;

    local procedure FnInsertNetAmount()
    begin
        TransactionIDSub := 0;
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, Rec."No.");
        if PVLines.FindSet then begin
            //REPEAT
            BridgeTransaction.Init;
            BridgeTransaction.TransactionID := BridgeTransaction.Count + 1;
            TransactionIDSub := BridgeTransaction.TransactionID;
            BridgeTransaction.VoucherDate := Rec."Posting Date";
            BridgeTransaction.VoucherID := Format(BridgeTransaction.TransactionID);

            if BridgeTransactionType.Get('PM') then begin
                BridgeTransaction.TrCode := BridgeTransactionType.Code;
                BridgeTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                BridgeTransaction.TrDescription := BridgeTransactionType.Description;
            end;

            if PVLines."Account Type" = PVLines."account type"::Vendor then
                BridgeTransaction.TxnModule := 'AP'
            else
                BridgeTransaction.TxnModule := 'AR';

            Rec.CalcFields("Total Net Amount");
            if Rec."Total Net Amount" <> 0 then
                BridgeTransaction.TxnAmount := Rec."Total Net Amount";
            BridgeTransaction.TxnDescription := PVLines.Description;
            BridgeTransaction.TxnReference := Rec."Cheque No";
            BridgeTransaction.ProjectID := CopyStr(Rec.JobNO, 7);
            BridgeTransaction.ProjectID := DelChr(BridgeTransaction.ProjectID, '<', '/');
            BridgeTransaction.ProjectCode := Rec.JobNo;

            ObjJob.Reset;
            ObjJob.SetRange(ObjJob."No.", BridgeTransaction.ProjectCode);
            if ObjJob.FindSet then begin
                BridgeTransaction.ProjectName := ObjJob.Description;
                BridgeTransaction.ProjectDescription := ObjJob.Description;
            end;

            BridgeTransaction.SupplierAccount := PVLines."Account No";

            Vendor.Reset;
            Vendor.SetRange(Vendor."No.", BridgeTransaction.SupplierAccount);
            if Vendor.FindSet then begin
                BridgeTransaction.SupplierName := UpperCase(Vendor.Name);
                BridgeTransaction.Email := Vendor."E-Mail";
            end;
            VendorBankAccount.Reset;
            VendorBankAccount.SetRange(VendorBankAccount."Vendor No.", BridgeTransaction.SupplierAccount);
            if VendorBankAccount.FindSet then begin
                BridgeTransaction.BankName := VendorBankAccount."Bank Account Name";
                BridgeTransaction.BankCode := VendorBankAccount."Bank Code";
                BridgeTransaction.BankBranchCode := VendorBankAccount."Bank Branch No.";
                BridgeTransaction.BankBranch := VendorBankAccount."Bank Branch Name";
                BridgeTransaction.BankAccNum := VendorBankAccount."Bank Account No.";
            end;
            BankAccount.Reset;
            BankAccount.SetRange("No.", Rec."Paying Bank Account");
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
            if not BridgeTransaction.Get(BridgeTransaction.TransactionID) then
                BridgeTransaction.Insert(true);
            //UNTIL PVLines.NEXT=0;
        end;
    end;

    local procedure FnInsertWVATAmount()
    begin
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, Rec."No.");
        if PVLines.FindSet then begin
            if PVLines."VAT Withheld Amount" <> 0 then begin
                repeat
                    BridgeSubTransaction.Init;
                    BridgeSubTransaction.TransactionID := TransactionIDSub;
                    BridgeSubTransaction.VoucherID := Format(TransactionIDSub);
                    BridgeSubTransaction.VoucherDate := Rec."Posting Date";

                    if BridgeTransactionType.Get('WHAT') then begin
                        BridgeSubTransaction.TrCode := BridgeTransactionType.Code;
                        BridgeSubTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                        BridgeSubTransaction.TrDescription := BridgeTransactionType.Description;
                    end;
                    Rec.CalcFields("VAT Wthheld six %");
                    BridgeSubTransaction.TxnAmount := Rec."VAT Wthheld six %";
                    BridgeSubTransaction.TxnDescription := Rec."Payment Narration";
                    BridgeSubTransaction.TxnReference := Rec."Cheque No";
                    BridgeSubTransaction.SupplierAccount := PVLines."Account No";
                    Vendor.Reset;
                    Vendor.SetRange(Vendor."No.", BridgeSubTransaction.SupplierAccount);
                    if Vendor.FindSet then begin
                        BridgeSubTransaction.SupplierName := UpperCase(Vendor.Name);
                        //BridgeSubTransaction.Email:=Vendor.Email;
                    end;
                    VendorBankAccount.Reset;
                    VendorBankAccount.SetRange(VendorBankAccount."Vendor No.", BridgeSubTransaction.SupplierAccount);
                    if VendorBankAccount.FindSet then begin
                        BridgeSubTransaction.BankName := VendorBankAccount."Bank Account Name";
                        BridgeSubTransaction.BankCode := VendorBankAccount."Bank Code";
                        BridgeSubTransaction.BankBranchCode := VendorBankAccount."Bank Branch No.";
                        BridgeSubTransaction.BankBranch := VendorBankAccount."Bank Branch Name";
                        BridgeSubTransaction.BankAccNum := VendorBankAccount."Bank Account No."
                    end;
                    //BridgeSubTransaction.TxnID:=0;
                    if BridgeSubTransaction.TxnAmount <> 0 then begin
                        if not BridgeSubTransaction.Get(BridgeSubTransaction.TransactionID, BridgeSubTransaction.TxnAmount) then
                            BridgeSubTransaction.Insert(true);
                    end;
                until PVLines.Next = 0;
            end;
        end;
    end;

    local procedure FnInsertWTaxAmount()
    begin
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, Rec."No.");
        if PVLines.FindSet then begin
            Rec.CalcFields("Total Witholding Tax Amount");
            if Rec."Total Witholding Tax Amount" <> 0 then begin
                repeat
                    BridgeSubTransaction.Init;
                    BridgeSubTransaction.TransactionID := TransactionIDSub;
                    BridgeSubTransaction.VoucherID := Format(TransactionIDSub);
                    if BridgeTransactionType.Get('WHT') then begin
                        //      MESSAGE('Witholding Tax %1',BridgeTransactionType.Code);
                        BridgeSubTransaction.TrCode := BridgeTransactionType.Code;
                        BridgeSubTransaction.VoucherDate := Rec."Posting Date";
                        BridgeSubTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                        BridgeSubTransaction.TrDescription := BridgeTransactionType.Description;
                    end;
                    BridgeSubTransaction.TxnAmount := Rec."Total Witholding Tax Amount";
                    BridgeSubTransaction.TxnDescription := PVLines.Description;
                    BridgeSubTransaction.TxnReference := Rec."Cheque No";
                    BridgeSubTransaction.SupplierAccount := PVLines."Account No";
                    Vendor.Reset;
                    Vendor.SetRange(Vendor."No.", BridgeSubTransaction.SupplierAccount);
                    if Vendor.FindSet then begin
                        BridgeSubTransaction.SupplierName := UpperCase(Vendor.Name);
                        //BridgeSubTransaction.Email:=Vendor.Email;
                    end;
                    VendorBankAccount.Reset;
                    VendorBankAccount.SetRange(VendorBankAccount."Vendor No.", BridgeSubTransaction.SupplierAccount);
                    if VendorBankAccount.FindSet then begin
                        BridgeSubTransaction.BankName := VendorBankAccount.Name;
                        BridgeSubTransaction.BankCode := VendorBankAccount.Code;
                        BridgeSubTransaction.BankBranchCode := VendorBankAccount."Bank Branch No.";
                        BridgeSubTransaction.BankBranch := VendorBankAccount."Bank Branch No.";
                        BridgeSubTransaction.BankAccNum := VendorBankAccount."Bank Account No."
                    end;
                    // BridgeSubTransaction.TxnID:=0;
                    if BridgeSubTransaction.TxnAmount <> 0 then begin
                        if not BridgeSubTransaction.Get(BridgeSubTransaction.TransactionID, BridgeSubTransaction.TxnAmount) then
                            BridgeSubTransaction.Insert(true);
                    end;
                until PVLines.Next = 0;
            end;
        end;
    end;

    local procedure FnInsertRetensionAmount()
    begin
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, Rec."No.");
        if PVLines.FindSet then begin
            Rec.CalcFields("Total Retention Amount");
            if Rec."Total Retention Amount" <> 0 then begin
                //REPEAT
                BridgeSubTransaction.Init;
                BridgeSubTransaction.TransactionID := TransactionIDSub;
                BridgeSubTransaction.VoucherID := Format(TransactionIDSub);
                BridgeSubTransaction.VoucherDate := Rec."Posting Date";
                if BridgeTransactionType.Get('RET') then begin
                    BridgeSubTransaction.TrCode := BridgeTransactionType.Code;
                    BridgeSubTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                    BridgeSubTransaction.TrDescription := BridgeTransactionType.Description;
                end;
                Rec.CalcFields("Total Retention Amount");
                BridgeSubTransaction.TxnAmount := Rec."Total Retention Amount";
                BridgeSubTransaction.TxnDescription := Rec."Payment Narration";
                BridgeSubTransaction.TxnReference := Rec."Cheque No";
                BridgeSubTransaction.SupplierAccount := PVLines."Account No";
                Vendor.Reset;
                Vendor.SetRange(Vendor."No.", BridgeSubTransaction.SupplierAccount);
                if Vendor.FindSet then begin
                    BridgeSubTransaction.SupplierName := UpperCase(Vendor.Name);
                    //BridgeSubTransaction.Email:=Vendor.Email;
                end;
                VendorBankAccount.Reset;
                VendorBankAccount.SetRange(VendorBankAccount."Vendor No.", BridgeSubTransaction.SupplierAccount);
                if VendorBankAccount.FindSet then begin
                    BridgeSubTransaction.BankName := VendorBankAccount."Bank Account Name";
                    BridgeSubTransaction.BankCode := VendorBankAccount."Bank Code";
                    BridgeSubTransaction.BankBranchCode := VendorBankAccount."Bank Branch No.";
                    BridgeSubTransaction.BankBranch := VendorBankAccount."Bank Branch Name";
                    BridgeSubTransaction.BankAccNum := VendorBankAccount."Bank Account No."
                end;
                BankAccount.Reset;
                BankAccount.SetRange("No.", Rec."Paying Bank Account");
                if BankAccount.FindSet then begin
                    BridgeSubTransaction.GLAccount := BankAccount."No.";
                    BridgeSubTransaction.GLBankAccountName := BankAccount.Name;
                    BridgeSubTransaction.GLBankCode := BankAccount."Bank Code";
                    BridgeSubTransaction.GLBankName := BankAccount."Bank Account  Name";
                    BridgeSubTransaction.GLAccountDescription := BankAccount.Name;
                    BridgeSubTransaction.GLBankBranch := BankAccount."Bank Branch No.";
                    BridgeSubTransaction.GLBankAccNo := BankAccount."Bank Account No.";
                end;
                if BridgeSubTransaction.TxnAmount <> 0 then begin
                    if not BridgeSubTransaction.Get(BridgeSubTransaction.TransactionID, BridgeSubTransaction.TxnAmount) then
                        BridgeSubTransaction.Insert(true);
                end;
                //UNTIL PVLines.NEXT =0;
            end;
        end;
    end;

    local procedure FnInsertRetentionWithBankDetailsAmount()
    begin
        /*PVLines.RESET;
        PVLines.SETRANGE(PVLines.No,"No.");
        IF PVLines.FINDSET THEN BEGIN
          REPEAT
              BridgeTransaction.INIT;
              BridgeTransaction.TransactionID:=COPYSTR("No.",4);
              BridgeTransaction.VoucherDate:="Posting Date";
              BridgeTransaction.VoucherID:=BridgeSubTransaction.TransactionID;
        
              IF BridgeTransactionType.GET('RET') THEN BEGIN
              BridgeTransaction.TrCode:=BridgeTransactionType.Code;
              BridgeTransaction.TRCodeID:=BridgeTransactionType.TRCodeID;
              BridgeTransaction.TrDescription:=BridgeTransactionType.Description;
              END;
        
              IF PVLines."Account Type"=PVLines."Account Type"::Vendor THEN
                BridgeTransaction.TxnModule:='AP'
              ELSE BridgeTransaction.TxnModule:='AR';
        
              CALCFIELDS("Total Retention Amount");
              BridgeTransaction.TxnAmount:="Total Retention Amount";
              BridgeTransaction.TxnDescription:=PVLines.Description;
              BridgeTransaction.TxnReference:="Cheque No";
              BridgeTransaction.ProjectID:=COPYSTR(Job,2);
              BridgeTransaction.ProjectCode:=Job;
              ObjJob.RESET;
              ObjJob.SETRANGE(ObjJob."No.",BridgeTransaction.ProjectCode);
              IF ObjJob.FINDSET THEN BEGIN
                BridgeTransaction.ProjectName:=ObjJob.Description;
                BridgeTransaction.ProjectDescription:=ObjJob.Description;
              END;
        
              BridgeTransaction.SupplierAccount:=PVLines."Account No";
        
              Vendor.RESET;
              Vendor.SETRANGE(Vendor."No.",BridgeTransaction.SupplierAccount);
              IF Vendor.FINDSET THEN BEGIN
                BridgeTransaction.SupplierName:=UPPERCASE(Vendor.Name);
                BridgeTransaction.Email:=Vendor.Email;
                END;
                 VendorBankAccount.RESET;
                VendorBankAccount.SETRANGE(VendorBankAccount."Vendor No.",BridgeTransaction.SupplierAccount);
                IF VendorBankAccount.FINDSET THEN BEGIN
                  BridgeTransaction.BankName:=VendorBankAccount."Bank Account Name";
                  BridgeTransaction.BankCode:=VendorBankAccount."Bank Code";
                  BridgeTransaction.BankBranchCode:=VendorBankAccount."Bank Branch No.";
                  BridgeTransaction.BankBranch:=VendorBankAccount."Bank Branch Name";
                  BridgeTransaction.BankAccNum:=VendorBankAccount."Bank Account No.";
                 END;
                 BankAccount.RESET;
                 BankAccount.SETRANGE("No.","Paying Bank Account");
                 IF BankAccount.FINDSET THEN BEGIN
                 BridgeTransaction.SourceBankAccountName:=BankAccount."Bank Account  Name";
                 BridgeTransaction.SourceBankCode:=BankAccount."Bank Code";;
                 BridgeTransaction.SourceBankAccountName:=BankAccount."Bank Account  Name";
                 BridgeTransaction.SourceBankName:=BankAccount."Bank Account  Name";
                 BridgeTransaction.SourceBankBranch:=BankAccount."Bank Branch No.";
                 BridgeTransaction.SourceBankAccountNumber:=BankAccount."Bank Account No.";
                 BridgeTransaction.SourceBankAccountDescription:=BankAccount.Name;
                 BridgeTransaction.SourceBankAccount:=BankAccount."Bank Account No.";
                 END;
        
                   IF NOT BridgeTransaction.GET(BridgeTransaction.TransactionID) THEN
                 BridgeTransaction.INSERT;
               UNTIL PVLines.NEXT=0;
              END;*/

    end;

    local procedure FnInsertWPAYEAmount()
    begin
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, Rec."No.");
        if PVLines.FindSet then begin
            //IF PVLines."VAT Withheld Amount"<> 0 THEN BEGIN
            //REPEAT
            BridgeSubTransaction.Init;
            BridgeSubTransaction.TransactionID := TransactionIDSub;
            BridgeSubTransaction.VoucherID := Format(TransactionIDSub);
            BridgeSubTransaction.VoucherDate := Rec."Posting Date";

            if BridgeTransactionType.Get('PAYE') then begin
                BridgeSubTransaction.TrCode := BridgeTransactionType.Code;
                BridgeSubTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                BridgeSubTransaction.TrDescription := BridgeTransactionType.Description;
            end;
            Rec.CalcFields("Total PAYE Amount");
            BridgeSubTransaction.TxnAmount := Rec."Total PAYE Amount";
            BridgeSubTransaction.TxnDescription := Rec."Payment Narration";
            BridgeSubTransaction.TxnReference := Rec."Cheque No";
            BridgeSubTransaction.SupplierAccount := PVLines."Account No";
            Vendor.Reset;
            Vendor.SetRange(Vendor."No.", BridgeSubTransaction.SupplierAccount);
            if Vendor.FindSet then begin
                BridgeSubTransaction.SupplierName := UpperCase(Vendor.Name);
                //BridgeSubTransaction.Email:=Vendor.Email;
            end;
            VendorBankAccount.Reset;
            VendorBankAccount.SetRange(VendorBankAccount."Vendor No.", BridgeSubTransaction.SupplierAccount);
            if VendorBankAccount.FindSet then begin
                BridgeSubTransaction.BankName := VendorBankAccount."Bank Account Name";
                BridgeSubTransaction.BankCode := VendorBankAccount."Bank Code";
                BridgeSubTransaction.BankBranchCode := VendorBankAccount."Bank Branch No.";
                BridgeSubTransaction.BankBranch := VendorBankAccount."Bank Branch Name";
                BridgeSubTransaction.BankAccNum := VendorBankAccount."Bank Account No."
            end;
            //BridgeSubTransaction.TxnID:=0;
            if BridgeSubTransaction.TxnAmount <> 0 then begin
                if not BridgeSubTransaction.Get(BridgeSubTransaction.TransactionID, BridgeSubTransaction.TxnAmount) then
                    BridgeSubTransaction.Insert(true);
            end;
            //UNTIL PVLines.NEXT =0;
        end;
        //END;
    end;

    local procedure FnInsertNetAmountSClaim()
    begin
        TransactionIDSub := 0;
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, Rec."No.");
        if PVLines.FindSet then begin
            //REPEAT
            BridgeTransaction.Init;
            BridgeTransaction.TransactionID := BridgeTransaction.Count + 1;
            TransactionIDSub := BridgeTransaction.TransactionID;
            BridgeTransaction.VoucherDate := Rec."Posting Date";
            BridgeTransaction.VoucherID := Format(BridgeTransaction.TransactionID);

            if BridgeTransactionType.Get('PM') then begin
                BridgeTransaction.TrCode := BridgeTransactionType.Code;
                BridgeTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                BridgeTransaction.TrDescription := BridgeTransactionType.Description;
            end;

            if PVLines."Account Type" = PVLines."account type"::Vendor then
                BridgeTransaction.TxnModule := 'AP'
            else
                BridgeTransaction.TxnModule := 'AR';

            Rec.CalcFields("Total Net Amount");
            if Rec."Total Net Amount" <> 0 then
                BridgeTransaction.TxnAmount := Rec."Total Net Amount";
            BridgeTransaction.TxnDescription := PVLines.Description;
            BridgeTransaction.TxnReference := Rec."Cheque No";
            BridgeTransaction.ProjectID := CopyStr(Rec.Job, 7);
            BridgeTransaction.ProjectID := DelChr(BridgeTransaction.ProjectID, '<', '/');
            //  BridgeTransaction.ProjectCode := Job;

            ObjJob.Reset;
            ObjJob.SetRange(ObjJob."No.", BridgeTransaction.ProjectCode);
            if ObjJob.FindSet then begin
                BridgeTransaction.ProjectName := ObjJob.Description;
                BridgeTransaction.ProjectDescription := ObjJob.Description;
            end;

            BridgeTransaction.SupplierAccount := Rec."Account No.";

            Employee.Reset;
            Employee.SetRange(Employee."No.", Rec."Account No.");
            if Employee.FindSet then begin
                BridgeTransaction.SupplierName := UpperCase(Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name");
                BridgeTransaction.Email := Employee."Company E-Mail";
            end;

            BridgeTransaction.BankName := Rec."Employee Ban Account Name";
            BridgeTransaction.BankCode := Rec."Employee Bank Account Code";
            BridgeTransaction.BankBranchCode := Rec."Employee Bank Brach Code";
            BridgeTransaction.BankBranch := Rec."Employee Bank Branch Name";
            BridgeTransaction.BankAccNum := Rec."Employee Bank Account Number";

            BankAccount.Reset;
            BankAccount.SetRange("No.", Rec."Paying Bank Account");
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
            if not BridgeTransaction.Get(BridgeTransaction.TransactionID) then
                BridgeTransaction.Insert(true);
            //UNTIL PVLines.NEXT=0;
        end;
    end;

    local procedure FnCreateInterBankTransferForRetention()
    var
        ObjPVLines: Record "PV Lines";
    begin
        //Create an Interbank Transfer if Retention amount <> 0
        Rec.CalcFields("Total Retention Amount");
        if Rec."Total Retention Amount" <> 0 then begin
            Rec.TestField("Total Liquidated Damages");
            Payments.Init;
            Payments."No." := '';
            Payments."Payment Type" := Payments."payment type"::"Bank Transfer";
            Payments."Account Type" := Payments."account type"::"Bank Account";
            Payments."Paying Bank Account" := Rec."Paying Bank Account";
            //Payments.VALIDATE("Paying Bank Account");
            Payments.Status := Payments.Status::Released;
            Payments."Created By" := UpperCase(UserId);
            Payments."Payment Narration" := 'Bank Transfer for' + ' ' + Rec."No." + ' ' + PVLines."Project No" + ' ' + PVLines."Contractor No";
            Payments.Insert(true);

            ObjPVLines.Init;
            ObjPVLines.No := Payments."No.";
            ObjPVLines."Line No" := ObjPVLines.Count + 1;
            ObjPVLines."Account Type" := ObjPVLines."account type"::"Bank Account";
            //ObjPVLines."Account No" := "Total Liquidated Damages";
            ObjPVLines.Validate("Account No");
            ObjPVLines.Amount := Rec."Total Retention Amount";
            ObjPVLines.Validate(Amount);
            ObjPVLines.Description := 'Retention amount' + ' ' + Rec."No.";
            ObjPVLines.Insert(true);
            Message('Inter bank transfer %1 successfully created', Payments."No.");
        end;
    end;
}

#pragma implicitwith restore

