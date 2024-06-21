#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50076 "Store Requisition"
{
    Caption = 'Store Requisition';
    //  Caption = 'Staff Welfare Requisition';
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Request Approval,Comments';
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    UsageCategory = Documents;


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Funding Source';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Archived Versions"; Rec."No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    Visible = false;
                }
                field("Budget Item"; Rec."Budget Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Requisition Amount"; Rec."Requisition Amount")
                {
                    ApplicationArea = Basic;
                    Style = Favorable;
                    StyleExpr = true;
                }
            }
            part(PurchLines; "SR Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(factboxes)
        {
            part("Attached Documents1"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(38), "No." =
                FIELD("No.");


            }
            part(Control1903326807; "Item Replenishment FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "No." = field("No.");
                Visible = false;
            }
            part(Control1906354007; "Approval FactBox")
            {
                SubPageLink = "Table ID" = const(38),
                                              "Document Type" = field("Document Type"),
                                              "Document No." = field("No.");
                Visible = false;
            }
            part(Control3; "Purchase Line FactBox")
            {
                Provider = PurchLines;
                SubPageLink = "Document Type" = field("Document Type"),
                                              "No." = field("No."),
                                              "Line No." = field("Line No.");
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedIsBig = true;
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
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalEntries.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                                  "No." = field("No."),
                                                  "Document Line No." = const(0);
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        Rec.TestField(Description);
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        //TESTFIELD("Shortcut Dimension 3 Code");
                        VarVariant := Rec;
                        //  IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        //     CustomApprovals.OnSendDocForApproval(VarVariant);
                        Plines.Reset();
                        Plines.SetRange("Document Type", Rec."Document Type");
                        Plines.SetRange("Document No.", Rec."No.");
                        if Plines.FindSet() then begin
                            repeat
                                // Plines.TestField("VAT Prod. Posting Group");
                                Plines.TestField("Location Code");
                                Plines.TestField("Unit of Measure");
                                // Plines.TestField("VAT Bus. Posting Group");
                                Plines.TestField("Gen. Bus. Posting Group");
                                Plines.TestField("Gen. Prod. Posting Group");
                            until Plines.Next() = 0;
                        end;

                        //BYPASS EMPTY VENDOR
                        if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then BEGIN

                            IF REC."Buy-from Vendor No." = '' THEN
                                REC."Buy-from Vendor No." := 'VEND01186';
                        END;
                        IF REC."Buy-from Vendor No." = '' THEN
                            REC."Buy-from Vendor No." := 'VEND01186';
                        if rec.amount = 0 then
                            rec.amount := 1;
                        ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);

                    end;

                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        VarVariant: Variant;
                        RecRef: RecordRef;
                        CustomApprovalEntry: Record "Approval Entry";
                        OldStatus: Option;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        TXT0002: label 'An approval request has been cancelled.';
                    begin
                        // VarVariant := Rec;
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        // if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //cc//cc// ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        //cc//cc// WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                        //Procurement.FnUncommitPRN(Rec);
                        //
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                //   OldStatus :=ApprovalEntry.Status;
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                                CustomApprovalEntry.Modify(true);
                            until CustomApprovalEntry.Next = 0;

                        //Notify The User
                        // EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                        Rec.Status := Rec.Status::Open;
                        Rec."Cancelled?" := true;
                        Rec.Modify(true);
                        Message(TXT0002);
                    end;
                }
            }
            group(ActionGroup13)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action73)
                {
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Enabled = false;
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //  ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //    ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Enabled = false;
                    Image = ReOpen;

                    trigger OnAction()
                    var
                    //   ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        // ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action611)
                {
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                Image = Approval;
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
                        //  DocPrint.PrintPurchHeader(Rec);
                        rec.SETRANGE(rec."No.", rec."No.");
                        //70009
                        REPORT.RUN(70061, TRUE, TRUE, Rec);

                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        Rec."Document Type" := Rec."document type"::"Store Requisition";
        /*
        //KUGUN-Calc Avaliable Budget
        SETRANGE("Date Filter",0D,"Order Date");
        CALCFIELDS("Budgeted Amount","Actual Budget Costs","Budget Commitments");

        "Remaining Budget":="Budgeted Amount"-("Actual Budget Costs"+"Budget Commitments");
        //End KUGUN-Calc Avaliable Budget
        */
        SetControlAppearance;

    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        Rec."Requisition Type" := Rec."requisition type"::"Internal Use";
        Rec."Document Type" := Rec."document type"::"Store Requisition";
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;
        // SetControlAppearance;
        // Usersetup.GET(USERID);
        // IF Usersetup."Procurement officer"=FALSE THEN
        //  BEGIN
        //    SETFILTER("Requester ID",USERID);
        //    END;
        // Rec."Requester ID" := UserId;
        Rec.SetRange("Document Type", Rec."document type"::"Store Requisition");
    end;

    var
        // ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        [InDataSet]
        JobQueueVisible: Boolean;
        PurchSetupRec: Record "Purchases & Payables Setup";
        ItemJnlTemplate: Record "Item Journal Template";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlLine: Record "Item Journal Line";
        StoreReqHeader: Record "Purchase Header";
        StoreReqLine: Record "Purchase Line";
        ItemGnl: Record "Item Journal Line";
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        Req: Record "Purchase Header";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        AvailableBudget: Decimal;
        Usersetup: Record "User Setup";
        ApprovalEntry: Record "Approval Entry";
        Plines: Record "Purchase Line";

    local procedure Post(PostingCodeunitID: Integer)
    begin
        Rec.SendToPosting(PostingCodeunitID);
        if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        //  CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    // local procedure BuyfromVendorNoOnAfterValidate()
    // begin
    //     if Rec.GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
    //         if Rec."Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
    //             Rec.SetRange("Buy-from Vendor No.");
    //     CurrPage.Update;
    // end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.Update(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.Update(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.Update(true);

    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.Update(true);
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

#pragma implicitwith restore


