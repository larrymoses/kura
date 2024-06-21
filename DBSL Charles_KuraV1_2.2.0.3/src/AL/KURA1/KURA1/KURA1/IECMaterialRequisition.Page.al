#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 50090 "IEC Material Requisition"
{
    // Caption = 'IEC Material Requisition';
    // PageType = Document;
    // RefreshOnActivate = true;
    // SourceTable = "Purchase Header";
    // SourceTableView = where("Document Type"=filter("Store Requisition"),
    //                         "Requisition Type"=filter(<>Project));

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             Caption = 'General';
    //             field("No.";"No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Requester ID";"Requester ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Request-By No.";"Request-By No.")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Request-By Name";"Request-By Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Location Code";"Location Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = not OpenApprovalEntriesExist;
    //                 Visible = true;
    //             }
    //             field("Order Date";"Order Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Request Date';
    //                 Editable = not OpenApprovalEntriesExist;
    //             }
    //             field(Description;Description)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = not OpenApprovalEntriesExist;
    //             }
    //             field("Requisition Type";"Requisition Type")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Status;Status)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //                 Visible = true;
    //             }
    //             field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = not OpenApprovalEntriesExist;

    //                 trigger OnValidate()
    //                 begin
    //                     ShortcutDimension2CodeOnAfterV;
    //                 end;
    //             }
    //             field("Department Name";"Department Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = not OpenApprovalEntriesExist;
    //             }
    //             field("Project Name";"Project Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Program Name';
    //             }
    //             field("Responsibility Center";"Responsibility Center")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("No. of Archived Versions";"No. of Archived Versions")
    //             {
    //                 ApplicationArea = Basic;
    //                 Importance = Additional;
    //             }
    //             field("Budget Item";"Budget Item")
    //             {
    //                 ApplicationArea = Basic;
    //                 Visible = false;
    //             }
    //             field("Requisition Amount";"Requisition Amount")
    //             {
    //                 ApplicationArea = Basic;
    //                 Style = Favorable;
    //                 StyleExpr = true;
    //             }
    //         }
    //         part(PurchLines;"SR Subform")
    //         {
    //             Editable = not OpenApprovalEntriesExist;
    //             SubPageLink = "Document No."=field("No.");
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         part(Control1903326807;"Item Replenishment FactBox")
    //         {
    //             Provider = PurchLines;
    //             SubPageLink = "No."=field("No.");
    //             Visible = false;
    //         }
    //         part(Control1906354007;"Approval FactBox")
    //         {
    //             SubPageLink = "Table ID"=const(38),
    //                           "Document Type"=field("Document Type"),
    //                           "Document No."=field("No.");
    //             Visible = false;
    //         }
    //         part(Control3;"Purchase Line FactBox")
    //         {
    //             Provider = PurchLines;
    //             SubPageLink = "Document Type"=field("Document Type"),
    //                           "No."=field("No."),
    //                           "Line No."=field("Line No.");
    //         }
    //         part(WorkflowStatus;"Workflow Status FactBox")
    //         {
    //             Editable = false;
    //             Enabled = false;
    //             ShowFilter = false;
    //             Visible = ShowWorkflowStatus;
    //         }
    //         systempart(Control1900383207;Links)
    //         {
    //             Visible = false;
    //         }
    //         systempart(Control1905767507;Notes)
    //         {
    //             Visible = true;
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         group("O&rder")
    //         {
    //             Caption = 'O&rder';
    //             Image = "Order";
    //             action(Dimensions)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Dimensions';
    //                 Image = Dimensions;
    //                 Promoted = true;
    //                 PromotedIsBig = true;
    //                 ShortCutKey = 'Shift+Ctrl+D';

    //                 trigger OnAction()
    //                 begin
    //                     ShowDocDim;
    //                     CurrPage.SaveRecord;
    //                 end;
    //             }
    //             action(Approvals)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Approvals';
    //                 Image = Approvals;
    //                 Promoted = true;
    //                 PromotedIsBig = false;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalEntries: Page "Approval Entries";
    //                 begin
    //                     ApprovalEntries.Setfilters(Database::"Purchase Header",ApprovalEntry."document type"::"Store Requisition"
    //                     ,"No.");
    //                     ApprovalEntries.Run;
    //                 end;
    //             }
    //             action("Co&mments")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Co&mments';
    //                 Image = ViewComments;
    //                 RunObject = Page "Purch. Comment Sheet";
    //                 RunPageLink = "Document Type"=field("Document Type"),
    //                               "No."=field("No."),
    //                               "Document Line No."=const(0);
    //             }
    //         }
    //         group("Request Approval")
    //         {
    //             Caption = 'Request Approval';
    //             action(SendApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Send A&pproval Request';
    //                 Enabled = not OpenApprovalEntriesExist;
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Category9;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     TestField(Description);
    //                     TestField("Shortcut Dimension 1 Code");
    //                     TestField("Shortcut Dimension 2 Code");
    //                     //TESTFIELD("Shortcut Dimension 3 Code");
    //                     if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
    //                       ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
    //                 end;
    //             }
    //             action(CancelApprovalRequest)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Cancel Approval Re&quest';
    //                 Enabled = OpenApprovalEntriesExist;
    //                 Image = Cancel;
    //                 Promoted = true;
    //                 PromotedCategory = Category9;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //                 begin
    //                     ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
    //                 end;
    //             }
    //         }
    //         group(ActionGroup13)
    //         {
    //             Caption = 'Release';
    //             Image = ReleaseDoc;
    //             separator(Action73)
    //             {
    //             }
    //             action(Release)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Re&lease';
    //                 Enabled = false;
    //                 Image = ReleaseDoc;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ShortCutKey = 'Ctrl+F9';

    //                 trigger OnAction()
    //                 var
    //                     ReleasePurchDoc: Codeunit "Release Purchase Document";
    //                 begin
    //                     ReleasePurchDoc.PerformManualRelease(Rec);
    //                 end;
    //             }
    //             action("Re&open")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Re&open';
    //                 Enabled = false;
    //                 Image = ReOpen;

    //                 trigger OnAction()
    //                 var
    //                     ReleasePurchDoc: Codeunit "Release Purchase Document";
    //                 begin
    //                     ReleasePurchDoc.PerformManualReopen(Rec);
    //                 end;
    //             }
    //             separator(Action611)
    //             {
    //             }
    //         }
    //         group(Approval)
    //         {
    //             Caption = 'Approval';
    //             Image = Approval;
    //         }
    //         group(Print)
    //         {
    //             Caption = 'Print';
    //             Image = Print;
    //             action("&Print")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Print';
    //                 Ellipsis = true;
    //                 Image = Print;
    //                 Promoted = true;
    //                 PromotedCategory = Process;

    //                 trigger OnAction()
    //                 begin
    //                     DocPrint.PrintPurchHeader(Rec);
    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnAfterGetCurrRecord()
    // begin
    //     //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    //     ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(RecordId);
    // end;

    // trigger OnAfterGetRecord()
    // begin
    //     JobQueueVisible := "Job Queue Status" = "job queue status"::"Scheduled for Posting";
    //     /*
    //     //KUGUN-Calc Avaliable Budget
    //     SETRANGE("Date Filter",0D,"Order Date");
    //     CALCFIELDS("Budgeted Amount","Actual Budget Costs","Budget Commitments");
        
    //     "Remaining Budget":="Budgeted Amount"-("Actual Budget Costs"+"Budget Commitments");
    //     //End KUGUN-Calc Avaliable Budget
    //     */
    //     SetControlAppearance;

    // end;

    // trigger OnDeleteRecord(): Boolean
    // begin
    //     CurrPage.SaveRecord;
    //     exit(ConfirmDeletion);
    // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "Responsibility Center" := UserMgt.GetPurchasesFilter;
    //     "Requisition Type":="requisition type"::"Internal Use";
    // end;

    // trigger OnOpenPage()
    // begin
    //     if UserMgt.GetPurchasesFilter <> '' then begin
    //       FilterGroup(2);
    //       SetRange("Responsibility Center",UserMgt.GetPurchasesFilter);
    //       FilterGroup(0);
    //     end;
    //     SetControlAppearance;
    //     Usersetup.Get(UserId);
    //     if Usersetup."Procurement officer"=false then
    //       begin
    //         SetFilter("Requester ID",UserId);
    //         end;
    // end;

    // var
    //     ChangeExchangeRate: Page "Change Exchange Rate";
    //     CopyPurchDoc: Report "Copy Purchase Document";
    //     MoveNegPurchLines: Report "Move Negative Purchase Lines";
    //     ReportPrint: Codeunit "Test Report-Print";
    //     DocPrint: Codeunit "Document-Print";
    //     UserMgt: Codeunit "User Setup Management";
    //     ArchiveManagement: Codeunit ArchiveManagement;
    //     [InDataSet]
    //     JobQueueVisible: Boolean;
    //     PurchSetupRec: Record "Purchases & Payables Setup";
    //     ItemJnlTemplate: Record "Item Journal Template";
    //     ItemJnlBatch: Record "Item Journal Batch";
    //     ItemJnlLine: Record "Item Journal Line";
    //     StoreReqHeader: Record "Purchase Header";
    //     StoreReqLine: Record "Purchase Line";
    //     ItemGnl: Record "Item Journal Line";
    //     RequisitionLine: Record "Purchase Line";
    //     Linenumber: Integer;
    //     Req: Record "Purchase Header";
    //     OpenApprovalEntriesExistForCurrUser: Boolean;
    //     OpenApprovalEntriesExist: Boolean;
    //     ShowWorkflowStatus: Boolean;
    //     AvailableBudget: Decimal;
    //     Usersetup: Record "User Setup";
    //     ApprovalEntry: Record "Approval Entry";

    // local procedure Post(PostingCodeunitID: Integer)
    // begin
    //     SendToPosting(PostingCodeunitID);
    //     if "Job Queue Status" = "job queue status"::"Scheduled for Posting" then
    //       CurrPage.Close;
    //     CurrPage.Update(false);
    // end;

    // local procedure ApproveCalcInvDisc()
    // begin
    //     CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    // end;

    // local procedure BuyfromVendorNoOnAfterValidate()
    // begin
    //     if GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
    //       if "Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
    //         SetRange("Buy-from Vendor No.");
    //     CurrPage.Update;
    // end;

    // local procedure PurchaserCodeOnAfterValidate()
    // begin
    //     CurrPage.PurchLines.Page.UpdateForm(true);
    // end;

    // local procedure PaytoVendorNoOnAfterValidate()
    // begin
    //     CurrPage.Update;
    // end;

    // local procedure ShortcutDimension1CodeOnAfterV()
    // begin
    //     CurrPage.PurchLines.Page.UpdateForm(true);
    // end;

    // local procedure ShortcutDimension2CodeOnAfterV()
    // begin
    //     CurrPage.PurchLines.Page.UpdateForm(true);
    // end;

    // local procedure PricesIncludingVATOnAfterValid()
    // begin
    //     CurrPage.Update;
    // end;

    // local procedure CurrencyCodeOnAfterValidate()
    // begin
    //     CurrPage.PurchLines.Page.UpdateForm(true);
    // end;

    // local procedure Prepayment37OnAfterValidate()
    // begin
    //     CurrPage.Update;
    // end;

    // local procedure SetControlAppearance()
    // var
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    // begin
    //     //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
    //     //HasIncomingDocument := "Incoming Document Entry No." <> 0;
    //     //SetExtDocNoMandatoryCondition;
    //     OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
    //     OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    // end;
}

