#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57022 "Petty Cash Surrender"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Petty Cash Surrender"),
                            Status = filter(Open | "Pending Approval" | Released),
                            Posted = const(false),
                            Surrendered = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = true;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Account Type");
                    end;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                    Visible = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Acknowledged; Rec.Acknowledged)
                {
                    ApplicationArea = Basic;
                }
                field(Acknowledger; Rec.Acknowledger)
                {
                    ApplicationArea = Basic;
                }
                field("Acknowledged On"; Rec."Acknowledged On")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Petty Cash Amount Spent"; Rec."Actual Petty Cash Amount Spent")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Petty Cash Amount"; Rec."Remaining Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field("Receipted Petty Cash Amount"; Rec."Receipted Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
            }
            part(Control1000000021; "Petty Cash Surrender Lines")
            {
                SubPageLink = No = field("No.");
            }
        }
        area(factboxes)
        {
              part("Attached Documents1"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(57000), "No." =
                FIELD("No.");
            }
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);

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

                    trigger OnAction()
                    var
                        Var_Variant: Variant;
                        CustomApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Var_Variant := Rec;
                        if CustomApprovalsMgmt.CheckApprovalsWorkflowEnabled(Var_Variant) then
                            CustomApprovalsMgmt.OnSendDocForApproval(Var_Variant);
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

                    trigger OnAction()
                    var
                        Var_Variant: Variant;
                        CustomApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Var_Variant := Rec;
                        CustomApprovalsMgmt.OnCancelDocApprovalRequest(Var_Variant);
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


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57012, true, true, Rec)
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
                        Rec.TestField(Posted, false);
                        GLEntry.Reset;
                        GLEntry.SetRange(GLEntry."Document No.", Rec."No.");
                        GLEntry.SetRange(GLEntry.Reversed, false);
                        if GLEntry.FindSet then
                            Error(TXT0001, Rec."No.");

                        PaymentsPost.PostPettyCashSurrender(Rec);
                        Rec.CalcFields("Remaining Petty Cash Amount");
                        if Rec."Remaining Petty Cash Amount" < 0 then begin
                            if Confirm('Are you sure you want to create a staff claim for the excess amount?', false) = true then begin

                                CashMgt.Get;
                                //Insert Staff Claim Header
                                ObjPayments.Init;
                                ObjPayments.TransferFields(Rec);
                                ObjPayments."No." := NoSeriesManagement.GetNextNo(CashMgt."Staff Claim Nos.", Today, true);
                                ObjPayments."Document Type" := ObjPayments."document type"::"Staff Claims";
                                ObjPayments.Posted := false;
                                ObjPayments."Payment Type" := ObjPayments."payment type"::"Staff Claim";
                                ObjPayments.Status := ObjPayments.Status::Released;
                                ObjPayments."Posted By" := '';
                                ObjPayments."Posted Date" := 0D;
                                ObjPayments.Insert(true);


                                //Insert Staff Claim Lines
                                PVLines.Reset;
                                PVLines.SetRange(PVLines.No, Rec."No.");
                                if PVLines.FindSet then
                                    repeat
                                        PVLines.Reset;
                                        PVLines.SetRange(PVLines.No, Rec."No.");
                                        if PVLines.FindLast then
                                            LineNo := PVLines."Line No" + 100;
                                        ObjPVLines.Init;
                                        ObjPVLines.TransferFields(PVLines);
                                        ObjPVLines.No := ObjPayments."No.";
                                        ObjPVLines."Line No" := LineNo + 1000;
                                        ObjPVLines.Amount := Abs(Rec."Remaining Petty Cash Amount");
                                        ObjPVLines."Type of Expense" := PVLines.Type;
                                        ObjPVLines.Description := PVLines."Transaction Name";
                                        ObjPVLines.Insert(true);
                                    until PVLines.Next = 0;
                            end
                            else
                                exit;
                            Message('Staff Claim %1 of amount %2 successfully created', ObjPayments."No.", Abs(Rec."Remaining Petty Cash Amount"));
                        end;

                        CurrPage.Close();
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    //      ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    //      ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.GetApprovalComment(Rec);
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
                        //DMSManagement.UploadPettyCashDocuments("No.",'Petty Cash Surrender',RECORDID,"Shortcut Dimension 1 Code");
                        DMSManagement.UploadRoadLinkDocuments(Rec."No.", 'Petty Cash Surrender', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                    end;
                }
            }
            action("Archive Document")
            {
                ApplicationArea = Basic;
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    usersetup.Reset;
                    usersetup.SetRange("User ID", UserId);
                    usersetup.SetRange("Archive Document", true);
                    if usersetup.Find('-') then begin
                        Rec.SetRange("No.", Rec."No.");
                        Rec."Archive Document" := true;
                        Rec.Modify;
                    end else
                        Error('You don''t have rights to archive finance documents,Contact System administrator');
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        //"Payment Type":="Payment Type"::"Petty Cash Surrender";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Petty Cash Surrender";
        Rec."Account Type" := Rec."account type"::Employee;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        ObjPayments: Record payments;
        CashMgt: Record "Cash Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PVLines: Record "PV Lines";
        ObjPVLines: Record "PV Lines";
        LineNo: Integer;
        DMSManagement: Codeunit "DMS Management";
        usersetup: Record "User Setup";
        TXT0001: label 'The document %1 has already been posted.\\ Please contact fiance department.';
        GLEntry: Record "G/L Entry";

    local procedure SetControlAppearance()
    var
    //    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        //  OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
    end;
}

#pragma implicitwith restore

