
Page 57001 "Payment Voucher"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = payments;
    PromotedActionCategories = 'New,Process,Report,Request Approval,Print,Release';
    SourceTableView = where("Payment Type" = const("Payment Voucher"),
                            Posted = const(false),
                            Status = filter(Open | "Pending Approval"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = true;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;

                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
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
                    Visible = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Advance Payment"; Rec."Advance Payment")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Archive Document"; Rec."Archive Document")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No/Reference No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Source Bank Acc No."; Rec."Source Bank Acc No.")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Account"; Rec."Retention Account")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Job No."; Rec.Job)
                {
                    ApplicationArea = basic;
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
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Gross Amount Incl. VAT';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                    Caption = 'VAT Wthheld Amount';
                }
                field("Total PAYE Amount"; Rec."Total PAYE Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Liquidated Damages"; Rec."Total Liquidated Damages")
                {
                    ApplicationArea = Basic;
                }
                field("Obligation WHT"; Rec."Obligation WHT")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Obligation VAT"; Rec."Obligation VAT")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Obligation Income Tax"; Rec."Obligation Income Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Total Obligation Amount"; Rec."Total Obligation Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Supervision Cost"; Rec."Total Supervision Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("PV Remaining Amount"; Rec."PV Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = FALSE;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                group("Employee Bank Details")
                {
                    Caption = 'Employee Bank Details';
                    Editable = EmployeeDetailsEdit;
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
                        Editable = false;
                    }
                    field("Employee Bank Brach Code"; Rec."Employee Bank Brach Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee Bank Branch Name"; Rec."Employee Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
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

                    }
                }
            }
            part(Control1000000021; "PV Lines")
            {
                Editable = TRUE;//not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
            }
            part(Control12; "Approval Entry")
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
                    Promoted = true;
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
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
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
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Message(Rec."Shortcut Dimension 1 Code");
                        DMSManagement.UploadPaymentsDocuments(Rec."No.", 'Payment Vouchers', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = true;//not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        //TESTFIELD("Funding Source");
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                        //TestField(JobNo);
                        //TESTFIELD("Job Task No");
                        /*IF ("Advance Recovery"<>0) AND ("Account No."='')THEN
                        BEGIN
                          ERROR(text0001);
                        END;*/
                        /*IF "Advance Recovery"<>0 THEN
                          "Account Type":="Account Type"::"G/L Account";
                          "Account No."=1250020;*/
                        Rec.TestField("Payment Narration");
                        Rec.TestField(Payee);
                        rec.TestField(rec.Job);
                        Rec.TestField(Date);
                        pvheader.Reset;
                        pvheader.SetRange(pvheader."No.", Rec."No.");
                        if pvheader.FindFirst() then begin
                            pvLines.Reset;
                            pvLines.SetRange(pvLines.No, pvheader."No.");
                            pvLines.SetFilter(pvLines."Account Type", '<>%1', pvLines."account type"::"G/L Account");
                            if pvLines.FindSet() then begin
                                repeat
                                    pvLines.TestField(pvLines."Applies to Doc. No");
                                    pvLines.testfield(pvLines.Description);
                                   // pvLines.TestField("Project No");
                                    pvLines.TestField("Contractor No");
                                until pvLines.Next = 0;
                            end;
                        end;

                        if Rec."Staff Claim" = false then begin
                            pvheader.Reset;
                            pvheader.SetRange(pvheader."No.", Rec."No.");
                            pvheader.SetFilter(pvheader."Pay Mode", '<>%1', 'CHEQUE');
                            if pvheader.FindSet then begin
                                if pvheader."Pay Mode" <> 'CHEQUE' then begin
                                    pvLines.Reset;
                                    pvLines.SetRange(pvLines.No, pvheader."No.");
                                    pvLines.SetRange(pvLines."Account Type", pvLines."account type"::Vendor);
                                    if pvLines.FindSet then begin

                                        repeat
                                            pvLines.TestField(pvLines."Payee Account Name");
                                            pvLines.TestField(pvLines."Payee Bank Account Number");
                                            pvLines.TestField(pvLines."Payee Bank Branch Code");
                                        //pvLines.TESTFIELD(pvLines."Vendor Bank Name");
                                        until pvLines.Next = 0;
                                    end;
                                end;
                            end;
                        end;

                        if Rec."Advance Payment" = true then begin
                            pvLines.Reset;
                            pvLines.SetRange(pvLines.No, Rec."No.");
                            pvLines.SetRange(pvLines."Account Type", pvLines."account type"::Vendor);
                            if pvLines.FindSet then
                                repeat
                                    pvLines.TestField("Obligation Total Amount");
                                    pvLines.TestField("Contractor No");
                                until pvLines.Next = 0;
                        end;

                        if Rec."Staff Claim" = true then begin
                            Rec.TestField("Employee Ban Account Name");
                            Rec.TestField("Employee Bank Account Code");
                            Rec.TestField("Employee Bank Account Number");
                            Rec.TestField("Employee Bank Brach Code");
                            Rec.TestField("Employee Bank Branch Name");
                        end;
                        //Check if the account will be overdrawn
                        Rec.Validate("Paying Bank Account");

                        /*    if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                              ApprovalsMgmt.OnSendPaymentsForApproval(Rec);*/
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);


                        CurrPage.Close();

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                                                                              //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                              //IF ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                                                                              //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
                action("Regional PV Print")
                {
                    ApplicationArea = Basic;
                    Caption = 'Regional PV Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Report "Regional Payment Voucher";
                    Visible = false;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        // IF "Responsibility Center"='R48' THEN BEGIN
                        // RESET;
                        // SETRANGE("No.","No.");
                        // IF FINDSET THEN
                        // REPORT.RUN(57000,TRUE,TRUE,Rec)
                        // END ELSE IF "Responsibility Center"<>'R48' THEN BEGIN
                        // RESET;
                        // SETRANGE("No.","No.");
                        // IF FINDSET THEN
                        // REPORT.RUN(57021,TRUE,TRUE,Rec);
                        // END;
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
                        usersetup.Get(UserId);
                        usersetup.TestField(usersetup."Reopen Document", usersetup."Reopen Document" = true);
                        ReopenPV.PerformManualReopen(Rec);
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
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        PaymentsPost."Post Payment Voucher"(Rec);
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action(Archive)
                {
                    ApplicationArea = Suite;
                    Caption = 'Archive';
                    Image = Archive;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec."Archive Document" := true;
                        Rec.Modify;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
        EmployeeDetailsEdit := false;
        if Rec.Status = Rec.Status::Open then
            EmployeeDetailsEdit := true;

        // TxnReferenceVisible:=TRUE;
        // IF "Director Allowance"=TRUE THEN
        //  TxnReferenceVisible:=FALSE;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        EmployeeDetailsEdit := false;
        if Rec.Status = Rec.Status::Open then
            EmployeeDetailsEdit := true;

        // TxnReferenceVisible:=TRUE;
        // IF "Director Allowance"=TRUE THEN
        //  TxnReferenceVisible:=FALSE;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*IF USERID<>pvheader."Created By" THEN
          ERROR('%1',text0002);*///Machira

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Payment Voucher";
        Rec."Account Type" := Rec."account type"::Customer;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        EmployeeDetailsEdit := false;
        if Rec.Status = Rec.Status::Open then
            EmployeeDetailsEdit := true;

        // TxnReferenceVisible:=TRUE;
        // IF "Director Allowance"=TRUE THEN
        //  TxnReferenceVisible:=FALSE;
    end;

    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        text0001: label 'The customer Account Number Must have a value. Cannot be empty If advance recovery is more than the user.';
        pvLines: Record "PV Lines";
        pvheader: Record payments;
        ReopenPV: Codeunit Payments;
        usersetup: Record "User Setup";
        text0002: label 'This Payment Voucher can only be edited by the initiator';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        GLAccount: Record "G/L Account";
        cod: Integer;
        DMSManagement: Codeunit "DMS Management";
        EmployeeDetailsEdit: Boolean;
        TxnReferenceVisible: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
    end;
}



