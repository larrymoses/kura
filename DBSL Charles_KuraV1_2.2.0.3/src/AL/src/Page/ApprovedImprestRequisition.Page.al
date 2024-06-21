#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57015 "Approved Imprest Requisition"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Released));

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
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Mobile No"; Rec."Employee Mobile No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Account Code"; Rec."Employee Bank Account Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Ban Account Name"; Rec."Employee Ban Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Brach Code"; Rec."Employee Bank Brach Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Branch Name"; Rec."Employee Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
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
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
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
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason to Reopen.';
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
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
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ConvertedAmount; Rec.ConvertedAmount)
                {
                    ApplicationArea = basic;
                    Visible = false;
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                }
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                }
                part("Attached Documents1"; "Document Attachment Factbox1")
                {
                    ApplicationArea = All;
                    Caption = 'Attachment';
                    SubPageLink = "Table ID" = CONST(57000), "No." = FIELD("No.");

                }
            }
            part(Control1000000017; "Imprest Lines")
            {
                SubPageLink = No = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
            }
            systempart(Control1000000016; Links)
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
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = false;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //   if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //   ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;

                    trigger OnAction()
                    begin
                        // ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action1000000033)
                {
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
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57004, true, true, Rec)
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
                    //  ReleasePurchDoc: Codeunit "Release Purchase Document";
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
                    // ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        Usersets.Get(UserId);
                        Usersets.TestField(Usersets."Reopen Document", Usersets."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        ReOpenPayment.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1000000020)
                {
                }
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
                        //Control the posting of the imprest requisitions David

                        Rec.TestField(Posted, false);

                        GLEntry.Reset;
                        GLEntry.SetRange(GLEntry."Document No.", Rec."No.");
                        GLEntry.SetRange(GLEntry.Reversed, false);
                        if GLEntry.FindSet then
                            Error(TXT0001, Rec."No.");


                        Rec.TestField("Reference No.");
                        rec.TestField(rec."Employee Ban Account Name");
                        rec.TestField(rec."Employee Bank Account Code");
                        rec.TestField(rec."Employee Bank Account Number");
                        rec.TestField(rec."Employee Bank Brach Code");
                        rec.TestField(rec."Employee Bank Branch Name");
                        usersetup.Get(UserId);
                        if usersetup."Post Requisition" = false then
                            Error(Text001);
                        Rec.TestField(JobNo);

                        //Commented in effect with a directive from DDF on 09/08/2021 by Fred
                        //Check if the employee has another Imprest that has not been posted.......

                        // ObjPayments.RESET;
                        // ObjPayments.SETRANGE(ObjPayments."Account No.","Account No.");
                        // ObjPayments.SETRANGE(ObjPayments.Posted,FALSE);
                        // ObjPayments.SETRANGE(ObjPayments."Payment Type",ObjPayments."Payment Type"::Imprest);
                        // IF ObjPayments.FINDSET THEN BEGIN
                        //  IF ObjPayments.COUNT >1 THEN
                        //   ERROR('The employee %1 has a another imprest that has not been processed.\\Please contact Finance Department for assistance',ObjPayments."Account No.");
                        //  END;
                        //End Check if the employee has another Imprest that has not been posted...



                        if Confirm('Are you sure you want to post this imprest ' + ' ' + Rec."No." + '?') = true then begin
                            PaymentPost."Post Imprest"(Rec);

                            //Push to PayBridge
                            //FnInsertNetAmount();
                        end;
                        CurrPage.Close;
                    end;
                }
                action("Banked Imprest Requisition")
                {
                    ApplicationArea = Basic;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible =false;
                    trigger OnAction()
                    begin
                        Rec.Select := true;
                        Rec.Modify;
                        Message('Banked Successfully');
                    end;
                }
            }
            action("Attach from Imprest Memo")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.AttachLines(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Rec."Reference No." := Rec."No.";
        // ImprestLines.Reset();
        // ImprestLines.SetRange(ImprestLines.No, REC."No.");
        // IF ImprestLines.FindSet then begin
        //     IMPRESTLINES.Validate("Daily Rate");
        //     IMPRESTLINES.Validate("No. of Days");
        //     IMPRESTLINES.Modify()
        // end;
    end;

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
        Rec."Reference No." := Rec."No.";
        // ImprestLines.Reset();
        // ImprestLines.SetRange(ImprestLines.No, REC."No.");
        // IF ImprestLines.FindSet then begin
        //     IMPRESTLINES.Validate("Daily Rate");
        //     IMPRESTLINES.Validate("No. of Days");
        //     IMPRESTLINES.Modify()
        // end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::Imprest;
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Created By" := UserId;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        Rec."Reference No." := Rec."No.";
    end;

    trigger OnOpenPage()
    begin
        ImprestLines.Reset();
        ImprestLines.SetRange(ImprestLines.No, REC."No.");
        IF ImprestLines.FindSet then begiN
            repeat
                IMPRESTLINES.validate("Daily Rate");
                IMPRESTLINES.Validate("No. of Days");
                IMPRESTLINES.Modify()
            UNTIL IMPRESTLINES.NEXT = 0;
            if rec.Status = rec.Status::Released then
                ImprestLines.modify(false);
        end;
        ShowAttach := Rec.OpenEntries(Rec);
        SetControlAppearance;


        Rec."Reference No." := Rec."No.";
    end;

    var
        IMLINES: RECORD "Imprest Lines";
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        usersetup: Record "User Setup";
        Text001: label 'You do not have sufficient rights to Post An Imprest Requisition! Please! contact System Administrator for Assistance.';
        othercosts: Record "Other Costs";
        ReOpenPayment: Codeunit Payments;
        Usersets: Record "User Setup";
        Text002: label 'You have not granted permisions to reopen documents, Seek assistance from Accounts';
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
        ImprestLines: Record "Imprest Lines";
        TransactionID: Integer;
        Employee: Record Employee;
        ObjPayments: Record payments;
        GLEntry: Record "G/L Entry";
        TXT0001: label 'The document %1 has already been posted.\\ Please contact fiance department.';
        CSSetup: Record "Cash Management Setup";

    local procedure SetControlAppearance()
    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;

    local procedure FnInsertNetAmount()
    begin
        TransactionID := 0;
        CSSetup.Get();
        Rec.CalcFields("Imprest Amount");
        ImprestLines.Reset;
        ImprestLines.SetRange(ImprestLines.No, Rec."No.");
        if ImprestLines.FindSet then begin
            BridgeTransaction.Init;
            BridgeTransaction.TransactionID := CSSetup."Last Transaction No Used" + 1;
            TransactionID := BridgeTransaction.TransactionID;
            // MESSAGE(FORMAT(TransactionID));
            BridgeTransaction.VoucherDate := Rec."Posting Date";
            BridgeTransaction.VoucherID := Format(TransactionID);
            BridgeTransaction.TxnReference := Rec."Cheque No";

            if BridgeTransactionType.Get('PM') then begin
                BridgeTransaction.TrCode := BridgeTransactionType.Code;
                BridgeTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                BridgeTransaction.TrDescription := BridgeTransactionType.Description;
            end;
            BridgeTransaction.TxnModule := 'AR';


            //      IF "Imprest Amount" <> 0 THEN
            BridgeTransaction.TxnAmount := Rec."Imprest Amount";
            //MESSAGE(FORMAT(BridgeTransaction.TxnAmount));
            BridgeTransaction.TxnDescription := Rec."Payment Narration";
            //BridgeTransaction.TxnReference:="Cheque No";
            BridgeTransaction.ProjectID := CopyStr(Rec.JobNo, 8);
            BridgeTransaction.ProjectCode := Rec.JobNo;
            ObjJob.Reset;
            ObjJob.SetRange(ObjJob."No.", BridgeTransaction.ProjectCode);
            if ObjJob.FindSet then begin
                BridgeTransaction.ProjectName := ObjJob.Description;
                BridgeTransaction.ProjectDescription := ObjJob.Description;
            end;
            BridgeTransaction.SupplierAccount := Rec."Account No.";
            BridgeTransaction.SupplierName := Rec."Account Name";
            Employee.Reset;
            Employee.SetRange("No.", Rec."Account No.");
            if Employee.FindSet then
                BridgeTransaction.Email := Employee."E-Mail";

            BridgeTransaction.BankName := Rec."Employee Ban Account Name";
            BridgeTransaction.BankCode := Rec."Employee Bank Account Code";
            BridgeTransaction.BankBranchCode := Rec."Employee Bank Brach Code";
            BridgeTransaction.BankBranch := Rec."Employee Bank Branch Name";
            BridgeTransaction.BankAccNum := Rec."Employee Bank Account Number";

            BankAccount.Reset;
            BankAccount.SetRange(BankAccount."No.", Rec."Paying Bank Account");
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
            //MESSAGE('I am a fool %1',FORMAT(BridgeTransaction.TransactionID));
            CSSetup."Last Transaction No Used" := CSSetup."Last Transaction No Used" + 1;
            ;
            CSSetup.Modify(true);
            //END;
        end;
    end;
}

#pragma implicitwith restore

