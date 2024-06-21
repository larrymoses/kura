#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57169 "Posted Petty Cash Voucher"
{
    CardPageID = "Approved Petty Cash Voucher";
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = true;
    PageType = Card;
    ShowFilter = false;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Petty Cash"),
                            Posted = const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = true;
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = false;
                    Enabled = true;
                    Visible = false;
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                    Visible = false;
                }
                field("Job Task Name"; "Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Cheque No/Reference No"; "Cheque No")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Pay Mode"; "Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Date"; "Cheque Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        TestField("Account Type");
                    end;
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    TableRelation = Customer."Customer Posting Group" where("Customer Posting Group" = filter('PCASH'));
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Narration"; "Payment Narration")
                {
                    ApplicationArea = Basic;
                }
                // field(Job;Job)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Job Task No"; "Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Mobile No"; "Employee Mobile No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Bank Account Code"; "Employee Bank Account Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Ban Account Name"; "Employee Ban Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Brach Code"; "Employee Bank Brach Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Bank Branch Name"; "Employee Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Account Number"; "Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit  Name"; "Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                    Visible = false;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000021; "PCV Lines")
            {
                SubPageLink = No = field("No.");
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
                        ShowDocDim;
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
                    ShortCutKey = 'F12';

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        ApprovalEntries.Setfilters(Database::payments, 7, "No.");
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
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;

                    trigger OnAction()
                    begin
                        // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
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
                separator(Action1000000043)
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


                        SetRange("No.", "No.");
                        Report.Run(57003, true, true, Rec)
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
                    Visible = false;

                    trigger OnAction()
                    var
                    //     ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //   ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
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
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        TestField("Posting Date");
                        TestField("Cheque No");
                        TestField(Posted, false);

                        TestField("Employee Ban Account Name");
                        TestField("Employee Bank Account Code");
                        TestField("Employee Bank Account Number");
                        TestField("Employee Bank Brach Code");
                        TestField("Employee Bank Branch Name");
                        //    PaymentsPost.PostPettyCash(Rec);

                        //Insert into Paybrigde
                        FnInsertNetAmount();
                        CurrPage.Close();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //"Cheque No":="No.";
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        //"Cheque No":="No.";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Payment Type" := "payment type"::"Petty Cash";
        "Account Type" := "account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        //"Cheque No":="No.";
    end;

    var
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        //PaymentsPost: Codeunit "Payments-Post";
        PVLines: Record "PV Lines";
        BridgeTransaction: Record "Bridge Transaction";
        BridgeTransactionType: Record "Bridge Transaction Type";
        ObjJob: Record Job;
        Vendor: Record Vendor;
        VendorBankAccount: Record "Vendor Bank Account";
        BankAccount: Record "Bank Account";
        Employee: Record Employee;
        TransactionID: Integer;

    local procedure SetControlAppearance()
    var
    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;

    local procedure FnInsertNetAmount()
    begin
        TransactionID := 0;
        PVLines.Reset;
        PVLines.SetRange(PVLines.No, "No.");
        if PVLines.FindSet then begin
            //REPEAT
            BridgeTransaction.Init;
            BridgeTransaction.TransactionID := BridgeTransaction.Count + 1;
            TransactionID := BridgeTransaction.TransactionID;
            BridgeTransaction.VoucherDate := "Posting Date";
            BridgeTransaction.VoucherID := Format(TransactionID);
            BridgeTransaction.TxnReference := "Cheque No";

            if BridgeTransactionType.Get('PM') then begin
                BridgeTransaction.TrCode := BridgeTransactionType.Code;
                BridgeTransaction.TRCodeID := BridgeTransactionType.TRCodeID;
                BridgeTransaction.TrDescription := BridgeTransactionType.Description;
            end;
            BridgeTransaction.TxnModule := 'AR';

            CalcFields("Petty Cash Amount", "Total Amount");
            if "Total Amount" <> 0 then
                BridgeTransaction.TxnAmount := "Total Amount";
            //MESSAGE(FORMAT(BridgeTransaction.TxnAmount));
            BridgeTransaction.TxnDescription := "Payment Narration";
            //   //BridgeTransaction.TxnReference:="Cheque No";
            //   BridgeTransaction.ProjectID:=CopyStr(Job,8);
            //   BridgeTransaction.ProjectCode:=Job;
            ObjJob.Reset;
            ObjJob.SetRange(ObjJob."No.", BridgeTransaction.ProjectCode);
            if ObjJob.FindSet then begin
                BridgeTransaction.ProjectName := ObjJob.Description;
                BridgeTransaction.ProjectDescription := ObjJob.Description;
            end;
            BridgeTransaction.SupplierAccount := "Account No.";
            BridgeTransaction.SupplierName := "Account Name";
            Employee.Reset;
            Employee.SetRange("No.", "Account No.");
            if Employee.FindSet then
                BridgeTransaction.Email := Employee."E-Mail";

            BridgeTransaction.BankName := "Employee Ban Account Name";
            BridgeTransaction.BankCode := "Employee Bank Account Code";
            BridgeTransaction.BankBranchCode := "Employee Bank Brach Code";
            BridgeTransaction.BankBranch := "Employee Bank Branch Name";
            BridgeTransaction.BankAccNum := "Employee Bank Account Number";

            BankAccount.Reset;
            BankAccount.SetRange(BankAccount."No.", "Paying Bank Account");
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
}

