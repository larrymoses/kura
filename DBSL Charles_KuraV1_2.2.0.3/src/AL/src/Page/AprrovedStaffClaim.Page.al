#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57109 "Aprroved Staff Claim"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"),
                            Status =const(Released),
                            Posted = const(false),
                            banked = const(false),
                            "Archive Document" = const(false),
                            "Payment processed" = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; "Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Account Name"; "Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Payee; Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Pay Mode"; "Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Paying Bank Account"; "Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Bank Account";
                }
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; "Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cheque No.';
                }
                field("Cheque Date"; "Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cheque Date';//Cheque Date
                }
                field("Payment Narration"; "Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Total Amount"; "Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
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
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate Code"; "Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field(Job;Job)
                // {
                //     ApplicationArea = Basic;
                //     Editable = true;
                // }
                field("Job Task No"; "Job Task No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Job Name"; "Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                }
                field("Employee Bank Brach Code"; "Employee Bank Brach Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Bank Branch Name"; "Employee Bank Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Bank Account Number"; "Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000021; "Staff Claim Lines")
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
                        Report.Run(57011, true, true, Rec)
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
                    //   ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
                action("Banked Staff Claim")
                {
                    ApplicationArea = Basic;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Payments.Reset;
                        Payments.SetRange("No.", "No.");
                        Payments.SetRange(Select, true);
                        Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
                        if Payments.Find('-') then begin
                            repeat
                                Payments.banked := true;
                                Payments.Modify;
                            until Payments.Next = 0;
                        end;
                        Message('Banked Successfully');
                    end;
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
                    Visible = false;

                    trigger OnAction()
                    begin
                        CalcFields("Total Amount");
                        TotalImprestAmount := "Total Amount";
                        if (TotalImprestAmount > "Job Task Remaining Amount") then
                            Message('Applied Staff Claim of Amount (%1) is more than Available Amount (%2)', TotalImprestAmount, "Job Task Remaining Amount");
                        //     PaymentsPost.PostStaffClaims(Rec);
                        Commitment.StaffUnCommittment(Rec);

                        //Post To PayBridge
                        FnInsertNetAmount();
                    end;
                }
                action("Process Payments")
                {
                    ApplicationArea = Basic;
                    Image = Payment;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        //add pv from claims
                        //added on 27/04/2017
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Process Claims", usersetup."Process Claims" = true);
                        if Confirm(Text004, false, "No.") then begin
                            if "Payment processed" = false then begin
                                Claimheaders.Reset;
                                Claimheaders.SetRange(Claimheaders."No.", "No.");
                                if Claimheaders.Find('-') then begin

                                    //get the no. series
                                    CashMgt.Reset;
                                    if CashMgt.Find('-') then begin
                                        Noseries := CashMgt."PV Nos";
                                    end;

                                    pvheaders.Init;
                                    pvheaders.TransferFields(Rec);
                                    pvheaders."No." := '';
                                    //pvheaders."Document Type":=pvheaders."Document Type"::"Payment Voucher";
                                    pvheaders."Payment Type" := pvheaders."payment type"::"Payment Voucher";
                                    pvheaders."Document Type" := pvheaders."document type"::"Payment Voucher";
                                    pvheaders.Project := Project;
                                    pvheaders."Project Description" := "Project Description";
                                    pvheaders.Date := Today;
                                    pvheaders."Responsibility Center" := "Responsibility Center";
                                    pvheaders.Payee := Payee;
                                    pvheaders.Status := pvheaders.Status::Open;
                                    pvheaders."On behalf of" := Claimheaders."Account Name";
                                    pvheaders."Payment Narration" := "Payment Narration";
                                    pvheaders."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
                                    pvheaders."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                                    pvheaders."Shortcut Dimension 3 Code" := "Shortcut Dimension 3 Code";
                                    pvheaders."Created By" := UserId;
                                    pvheaders."Staff Claim No" := "No.";
                                    pvheaders."Staff Claim" := true;
                                    pvheaders.Insert(true);

                                    Claimlines.Reset;
                                    Claimlines.SetRange(Claimlines.No, Claimheaders."No.");
                                    if Claimlines.Find('-') then begin
                                        repeat
                                            PVLines.Init;
                                            PVLines.TransferFields(Claimlines);
                                            PVLines.No := pvheaders."No.";
                                            PVLines."Line No" := PVLines.Count + 1;
                                            PVLines.Type := 'STAFF CLAIM';
                                            //PVLines."Account Type":=Claimheaders."Account Type";
                                            //PVLines."Account No":=Claimheaders."Account No.";
                                            //PVLines."Account Name":=Claimheaders."Account Name";
                                            PVLines."Applies to Doc. No" := Claimheaders."No.";
                                            PVLines.Amount := Claimlines.Amount;
                                            PVLines."Net Amount" := Claimlines.Amount;
                                            PVLines.Insert(true);
                                        until Claimlines.Next = 0;
                                    end;
                                    pvheaders."Payment processed" := true;
                                    Claimheaders."Payment processed" := true;
                                    Claimheaders.Modify;
                                end;
                                Message('Payment voucher for the staff claim No. %1 has been processed, Kindly send it for approval', "No.");
                            end else
                                Error('The payment for claim No. %1 has already been processed.', Claimheaders."No.");
                        end;

                        //Open The Page
                        PV.Reset;
                        PV.SetRange(PV."No.", pvheaders."No.");
                        if PV.FindSet then begin
                            PaymentVoucher.SetTableview(PV);
                            PaymentVoucher.Run;
                        end;
                    end;
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::"Staff Claim", "No.", 'Staff Claim', RecordId, "Shortcut Dimension 1 Code");
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
        "Payment Type" := "payment type"::"Staff Claim";
        "Account Type" := "account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        //PaymentsPost: Codeunit "Payments-Post";
        Payments: Record payments;
        Commitment: Codeunit "Procurement Processing";
        TotalImprestAmount: Decimal;
        TransactionID: Integer;
        PVLines: Record "PV Lines";
        BridgeTransaction: Record "Bridge Transaction";
        BridgeTransactionType: Record "Bridge Transaction Type";
        ObjJob: Record Job;
        Employee: Record Employee;
        BankAccount: Record "Bank Account";
        pvheaders: Record payments;
        Claimlines: Record "PV Lines";
        Claimheaders: Record payments;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        usersetup: Record "User Setup";
        ReopenStaff: Codeunit Payments;
        Text004: label 'Are you sure you want to process a payment voucher for staff claim No. %1?';
        PV: Record payments;
        PaymentVoucher: Page "Payment Voucher";
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";

    local procedure SetControlAppearance()
    var
    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
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

            CalcFields("Total Amount");
            if "Petty Cash Amount" <> 0 then
                BridgeTransaction.TxnAmount := "Total Amount";
            Message(Format(BridgeTransaction.TxnAmount));
            BridgeTransaction.TxnDescription := "Payment Narration";
            //BridgeTransaction.TxnReference:="Cheque No";
            //    BridgeTransaction.ProjectID:=CopyStr(Job,8);
            //    BridgeTransaction.ProjectCode:=Job;
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

