#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57197 "AIE Fund Transfer Card"
{
    DeleteAllowed = false;
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
                    Visible = false;
                }
                field("Source Bank Account Name"; "Source Bank Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Destination Bank Account No"; "Destination Bank Account No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Destination Bank Name"; "Destination Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
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
                field("Constituency Code"; "Constituency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Constituency Name"; "Constituency Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Code"; "Funding Source Code")
                {
                    ApplicationArea = Basic;
                }
                field("Originating Trans. Voucher No"; "Originating Trans. Voucher No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
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
                    Editable = false;
                    Visible = false;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part(Control30; "Inter Bank Requisition Line")
            {
                SubPageLink = "Document No" = field("Document No"),
                              "Document Type" = field("Document Type");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Post Disbursement(F9)")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    //TESTFIELD("Approval Status","Approval Status"::Released);
                    InterBankTransferLine.Reset;
                    InterBankTransferLine.SetRange("Document No", Rec."Document No");
                    InterBankTransferLine.SetRange("Document Type", Rec."Document Type");
                    if InterBankTransferLine.FindSet(true) then
                        InterBankTransferLine.CalcSums(Amount);
                    //MESSAGE(FORMAT(InterBankTransferLine.Amount));

                    TestField(Amount, InterBankTransferLine.Amount);

                    CashManagementSetup.Get;
                    //FnPostInterFundTransfer(Rec);
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                    GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                    if GenJournalLine.FindSet then
                        GenJournalLine.DeleteAll;

                    Batch.Init;
                    Batch."Journal Template Name" := CashManagementSetup."PV Journal Template";
                    Batch.Name := CashManagementSetup."PV Journal Batch Name";
                    if not Batch.Get(CashManagementSetup."PV Journal Template", CashManagementSetup."PV Journal Batch Name") then
                        Batch.Insert;

                    //Dr InterFund Control Account
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := CashManagementSetup."PV Journal Template";
                    GenJournalLine."Journal Batch Name" := CashManagementSetup."PV Journal Batch Name";
                    GenJournalLine."Document No." := "Document No";
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                    GenJournalLine."Account No." := CashManagementSetup."AIE Inter Fund Bank Account";
                    GenJournalLine.Validate("Account No.");
                    //MESSAGE(GenJournalLine."Account No.");
                    CalcFields(Amount, "Amount(LCY)");
                    GenJournalLine.Amount := Amount;
                    /*GenJournalLine."Shortcut Dimension 1 Code":="Region Code";
                    GenJournalLine.VALIDATE("Shortcut Dimension 1 Code");
                    GenJournalLine."Shortcut Dimension 2 Code":="Constituency Code";
                    GenJournalLine.VALIDATE("Shortcut Dimension 2 Code");*/
                    GenJournalLine."Dimension Set ID" := "Dimension Set ID";
                    GenJournalLine.Validate(GenJournalLine."Dimension Set ID");
                    //MESSAGE(FORMAT(GenJournalLine.Amount));
                    GenJournalLine.Validate(Amount);
                    GenJournalLine."Posting Date" := "Posting Date";
                    GenJournalLine.Description := Description;
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                    GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                    if GenJournalLine.FindLast then
                        GenJournalLine."Line No." := GenJournalLine."Line No." + 1000
                    else
                        GenJournalLine."Line No." := 1000;
                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"Bank Account";
                    GenJournalLine."Bal. Account No." := "Source Bank Account No";
                    GenJournalLine.Validate("Bal. Account No.");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;


                    //Debit Region ACCS
                    InterBankTransferLine.Reset;
                    InterBankTransferLine.SetRange("Document No", Rec."Document No");
                    InterBankTransferLine.SetRange("Document Type", Rec."Document Type");
                    if InterBankTransferLine.FindSet(true) then
                        repeat
                            GenJournalLine.Init;
                            GenJournalLine."Journal Template Name" := CashManagementSetup."PV Journal Template";
                            GenJournalLine."Journal Template Name" := CashManagementSetup."PV Journal Batch Name";
                            GenJournalLine.Reset;
                            GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                            GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                            if GenJournalLine.FindLast then
                                GenJournalLine."Line No." := GenJournalLine."Line No." + 1000
                            else
                                GenJournalLine."Line No." := 1000;
                            GenJournalLine."Document No." := "Document No";
                            /*GenJournalLine."Shortcut Dimension 1 Code":=InterBankTransferLine."Shortcut Dimension 1 Code";
                            GenJournalLine.VALIDATE("Shortcut Dimension 1 Code");
                            GenJournalLine."Shortcut Dimension 2 Code":=InterBankTransferLine."Shortcut Dimension 2 Code";
                            GenJournalLine.VALIDATE("Shortcut Dimension 2 Code");*/
                            GenJournalLine."Dimension Set ID" := InterBankTransferLine."Dimension Set ID";
                            GenJournalLine.Validate(GenJournalLine."Dimension Set ID");
                            GenJournalLine.Description := Description;
                            GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                            GenJournalLine."Account No." := InterBankTransferLine."Bank Account No";
                            GenJournalLine.Validate("Account No.");
                            GenJournalLine.Amount := InterBankTransferLine.Amount;
                            GenJournalLine.Validate(Amount);
                            GenJournalLine."Posting Date" := "Posting Date";
                            GenJournalLine."External Document No." := InterBankTransferLine."Payment Reference";
                            GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"Bank Account";
                            GenJournalLine."Bal. Account No." := CashManagementSetup."AIE Inter Fund Bank Account";
                            GenJournalLine.Validate("Bal. Account No.");
                            if GenJournalLine.Amount <> 0 then
                                GenJournalLine.Insert;
                        until InterBankTransferLine.Next = 0;
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine);


                    //Update Requisition
                    "Disbursement Posted" := true;
                    Modify;
                    Validate("Disbursement Posted");

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
                    DMSManagement.UploadAIEAttchmentDocuments("Document No", 'AIE Vouchers', RecordId, 'R48');
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
                Visible = false;

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
                    //  if ApprovalsMgmt.CheckAIEReqApprovalPossible(Rec) then
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
                    //IF ApprovalsMgmt.CheckAIEReqApprovalPossible(Rec) THEN
                    // ApprovalsMgmt.OnCancelAIEReqApprovalRequest(Rec);
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
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    Message('Approved');
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
            action("Post Receipt(F9)")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    //TESTFIELD("Approval Status","Approval Status"::Released);
                    InterBankTransferLine.Reset;
                    InterBankTransferLine.SetRange("Document No", Rec."Document No");
                    InterBankTransferLine.SetRange("Document Type", Rec."Document Type");
                    if InterBankTransferLine.FindSet(true) then
                        InterBankTransferLine.CalcSums(Amount);
                    //MESSAGE(FORMAT(InterBankTransferLine.Amount));

                    TestField(Amount, InterBankTransferLine.Amount);

                    CashManagementSetup.Get;
                    //FnPostInterFundTransfer(Rec);
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                    GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                    if GenJournalLine.FindSet then
                        GenJournalLine.DeleteAll;

                    Batch.Init;
                    Batch."Journal Template Name" := CashManagementSetup."PV Journal Template";
                    Batch.Name := CashManagementSetup."PV Journal Batch Name";
                    if not Batch.Get(CashManagementSetup."PV Journal Template", CashManagementSetup."PV Journal Batch Name") then
                        Batch.Insert;

                    //Dr InterFund Destination
                    GenJournalLine.Init;
                    GenJournalLine."Journal Template Name" := CashManagementSetup."PV Journal Template";
                    GenJournalLine."Journal Batch Name" := CashManagementSetup."PV Journal Batch Name";
                    GenJournalLine."Document No." := "Document No";
                    GenJournalLine."Account Type" := GenJournalLine."account type"::"Bank Account";
                    GenJournalLine."Account No." := "Destination Bank Account No";
                    GenJournalLine.Validate("Account No.");
                    //MESSAGE(GenJournalLine."Account No.");
                    CalcFields(Amount, "Amount(LCY)");
                    GenJournalLine.Amount := Amount;
                    /*GenJournalLine."Shortcut Dimension 1 Code":="Region Code";
                    GenJournalLine.VALIDATE("Shortcut Dimension 1 Code");
                    GenJournalLine."Shortcut Dimension 2 Code":="Constituency Code";
                    GenJournalLine.VALIDATE("Shortcut Dimension 2 Code");*/
                    GenJournalLine."Dimension Set ID" := "Dimension Set ID";
                    GenJournalLine.Validate(GenJournalLine."Dimension Set ID");
                    //MESSAGE(FORMAT(GenJournalLine.Amount));
                    GenJournalLine.Validate(Amount);
                    GenJournalLine."Posting Date" := "Posting Date";
                    GenJournalLine.Description := Description;
                    GenJournalLine.Reset;
                    GenJournalLine.SetRange("Journal Template Name", CashManagementSetup."PV Journal Template");
                    GenJournalLine.SetRange("Journal Batch Name", CashManagementSetup."PV Journal Batch Name");
                    if GenJournalLine.FindLast then
                        GenJournalLine."Line No." := GenJournalLine."Line No." + 1000
                    else
                        GenJournalLine."Line No." := 1000;
                    GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"Bank Account";
                    GenJournalLine."Bal. Account No." := CashManagementSetup."AIE Inter Fund Bank Account";
                    GenJournalLine.Validate("Bal. Account No.");
                    if GenJournalLine.Amount <> 0 then
                        GenJournalLine.Insert;


                    //Debit Region ACCS
                    // InterBankTransferLine.RESET;
                    // InterBankTransferLine.SETRANGE("Document No",Rec."Document No");
                    // InterBankTransferLine.SETRANGE("Document Type",Rec."Document Type");
                    // IF InterBankTransferLine.FINDSET(TRUE) THEN
                    // REPEAT
                    //  GenJournalLine.INIT;
                    //  GenJournalLine."Journal Template Name":=CashManagementSetup."PV Journal Template";
                    //  GenJournalLine."Journal Template Name":=CashManagementSetup."PV Journal Batch Name";
                    //  GenJournalLine.RESET;
                    //  GenJournalLine.SETRANGE("Journal Template Name",CashManagementSetup."PV Journal Template");
                    //  GenJournalLine.SETRANGE("Journal Batch Name",CashManagementSetup."PV Journal Batch Name");
                    //  IF GenJournalLine.FINDLAST THEN
                    //  GenJournalLine."Line No.":= GenJournalLine."Line No."+1000
                    //  ELSE
                    //  GenJournalLine."Line No.":= 1000;
                    //  GenJournalLine."Document No.":="Document No";
                    //  {GenJournalLine."Shortcut Dimension 1 Code":=InterBankTransferLine."Shortcut Dimension 1 Code";
                    //  GenJournalLine.VALIDATE("Shortcut Dimension 1 Code");
                    //  GenJournalLine."Shortcut Dimension 2 Code":=InterBankTransferLine."Shortcut Dimension 2 Code";
                    //  GenJournalLine.VALIDATE("Shortcut Dimension 2 Code");}
                    //  GenJournalLine."Dimension Set ID":=InterBankTransferLine."Dimension Set ID";
                    //  GenJournalLine.VALIDATE(GenJournalLine."Dimension Set ID");
                    //  GenJournalLine.Description:=Description;
                    //  GenJournalLine."Account Type":=GenJournalLine."Account Type"::"Bank Account";
                    //  GenJournalLine."Account No.":=InterBankTransferLine."Bank Account No";
                    //  GenJournalLine.VALIDATE("Account No.");
                    //  GenJournalLine.Amount:=InterBankTransferLine.Amount;
                    //  GenJournalLine.VALIDATE(Amount);
                    //  GenJournalLine."Posting Date":="Posting Date";
                    //  GenJournalLine."External Document No.":=InterBankTransferLine."Payment Reference";
                    //  GenJournalLine."Bal. Account Type":=GenJournalLine."Bal. Account Type"::"Bank Account";
                    //  GenJournalLine."Bal. Account No.":=CashManagementSetup."AIE Inter Fund Bank Account";
                    //  GenJournalLine.VALIDATE("Bal. Account No.");
                    //  IF GenJournalLine.Amount<>0 THEN
                    //  GenJournalLine.INSERT;
                    // UNTIL InterBankTransferLine.NEXT=0;
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJournalLine);


                    //Update Requisition
                    "Receipt Posted" := true;
                    Modify;
                    Validate("Receipt Posted");

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("Document No", "Document No");
                    if FindSet then
                        Report.Run(59100, true, false, Rec);
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
                    /*InterBankTransfer.RESET;
                    InterBankTransfer.SETRANGE(InterBankTransfer."Approval Status",InterBankTransfer."Approval Status"::Released);
                    InterBankTransfer.SETRANGE(InterBankTransfer."Document Type",InterBankTransfer."Document Type"::"AIE Funds Transfer");
                    InterBankTransfer.SETRANGE(InterBankTransfer.Select,TRUE);
                    IF InterBankTransfer.FINDSET THEN BEGIN
                      REPEAT
                      InterBankTransLine.RESET;
                      //InterBankTransLine.SETRANGE(InterBankTransLine."Document No",InterBankTransfer."Document No");
                      InterBankTransLine.SETRANGE(InterBankTransLine."Document Type",InterBankTransLine."Document Type"::"AIE Funds Transfer");
                      IF InterBankTransLine.FINDSET THEN BEGIN
                        REPEAT
                          ObjInterBTLine.INIT;
                          ObjInterBTLine.TRANSFERFIELDS(InterBankTransLine);
                          ObjInterBTLine."Document No":="Document No";
                          ObjInterBTLine."Line No":=ObjInterBTLine."Line No"+1000;
                          ObjInterBTLine."Document Type":=ObjInterBTLine."Document Type"::"InterBank Requisition Voucher";
                          ObjInterBTLine.INSERT(TRUE);
                        UNTIL InterBankTransLine.NEXT = 0;
                        END;
                        UNTIL InterBankTransfer.NEXT =0;
                        END;*/

                    InterBankTransfer.Reset;
                    InterBankTransfer.SetRange(InterBankTransfer."Approval Status", InterBankTransfer."approval status"::Released);
                    InterBankTransfer.SetRange(InterBankTransfer."Document Type", InterBankTransfer."document type"::"AIE Funds Transfer");
                    InterBankTransfer.SetFilter(InterBankTransfer."Posting Date", '%1', 0D);
                    InterBankTransfer.SetFilter(InterBankTransfer."Region Code", "Region Code");
                    if InterBankTransfer.FindSet then begin
                        AIEFundTransfersReleased.SetTableview(InterBankTransfer);
                        AIEFundTransfersReleased.Run;
                    end;

                    InterBankTransfer.Reset;
                    InterBankTransfer.SetRange(InterBankTransfer."Approval Status", InterBankTransfer."approval status"::Released);
                    InterBankTransfer.SetRange(InterBankTransfer."Document Type", InterBankTransfer."document type"::"AIE Funds Transfer");
                    InterBankTransfer.SetRange(InterBankTransfer.Select, true);
                    if InterBankTransfer.FindSet then begin
                        repeat
                            InterBankTransLine.Reset;
                            InterBankTransLine.SetRange(InterBankTransLine."Document Type", InterBankTransLine."document type"::"AIE Funds Transfer");
                            if InterBankTransLine.FindSet then begin
                                repeat
                                    ObjInterBTLine.Init;
                                    ObjInterBTLine.TransferFields(InterBankTransLine);
                                    ObjInterBTLine."Document No" := "Document No";
                                    ObjInterBTLine."Line No" := ObjInterBTLine."Line No" + 1000;
                                    ObjInterBTLine."Document Type" := ObjInterBTLine."document type"::"InterBank Requisition Voucher";
                                    ObjInterBTLine.Insert(true);
                                until InterBankTransLine.Next = 0;
                            end;
                        until InterBankTransfer.Next = 0;
                    end;

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
            action("Import Lines")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = XMLport "Import Inter Bank Disbursement";

                trigger OnAction()
                begin
                    // InterBankTransLine.RESET;
                    // InterBankTransLine.SETRANGE("Document No",Rec."Document No");
                    // IF InterBankTransLine.FINDFIRST THEN BEGIN
                    // ImportInterBankDis.GetVariables(InterBankTransLine);
                    // ImportInterBankDis.RUN;
                    // END;
                end;
            }
            action("Post AIE")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    TestField("Approval Status", "approval status"::Released);
                    "AIE Posted" := true;
                    Modify(true);
                    Message('AIE %1 has been posted successfully', "Document No");
                end;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::"AIE Funds Transfer";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"AIE Funds Transfer";
    end;

    var
        CashManagementSetup: Record "Cash Management Setup";
        GenJournalLine: Record "Gen. Journal Line";
        InterBankTransferLine: Record "Inter Bank Transfer Line";
        Batch: Record "Gen. Journal Batch";
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        InterBankTransfer: Record "Inter Bank Transfer";
        AIEFundTransfersReleased: Page "AIE Fund Transfers Released";
        InterBankTransLine: Record "Inter Bank Transfer Line";
        ObjInterBTLine: Record "Inter Bank Transfer Line";
        ImportInterBankDis: XmlPort "Import Inter Bank Disbursement";
        DMSManagement: Codeunit "DMS Management";
}

