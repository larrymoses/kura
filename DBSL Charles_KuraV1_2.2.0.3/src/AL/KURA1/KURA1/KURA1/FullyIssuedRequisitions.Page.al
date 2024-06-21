#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 50067 "Fully Issued Requisitions"
{
    Caption = 'Purchase Order';
    Editable = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    // SourceTableView = where("Document Type"=filter("Store Requisition"),
    //                         Status=const(Released),
    //                         "Fully Issued"=const(true),
    //                         "Requisition Type"=filter(<>"Stock Return"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requester ID"; "Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request-By No."; "Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request-By Name"; "Request-By Name")
                {
                    ApplicationArea = Basic;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Order Date"; "Order Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Date';
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requisition Type"; "Requisition Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Currency Code"; "Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("No. of Archived Versions"; "No. of Archived Versions")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                }
                field("Taken By"; "Taken By")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date"; "Posting Date")
                {
                    ApplicationArea = Basic;
                }
            }
            // part(PurchLines;"Approved SR Subform")
            // {
            //     SubPageLink = "Document No."=field("No.");
            // }
        }
        area(factboxes)
        {
            part(Control1903326807; "Item Replenishment FactBox")
            {
                // Provider = PurchLines;
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
                // Provider = PurchLines;
                // SubPageLink = "Document Type"=field("Document Type"),
                //               "No."=field("No."),
                //               "Line No."=field("Line No.");
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
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", "Document Type", "No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Posted Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Entries';
                    Image = ViewPostedOrder;
                    RunObject = Page "Value Entries";
                    RunPageLink = "Document No." = field("No.");
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
                separator(Action611)
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
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := "Job Queue Status" = "job queue status"::"Scheduled for Posting";
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Responsibility Center" := UserMgt.GetPurchasesFilter;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            FilterGroup(2);
            SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            FilterGroup(0);
        end;
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
        Dim: Record "Dimension Set Entry";

    local procedure Post(PostingCodeunitID: Integer)
    begin
        SendToPosting(PostingCodeunitID);
        if "Job Queue Status" = "job queue status"::"Scheduled for Posting" then
            CurrPage.Close;
        CurrPage.Update(false);
    end;

    local procedure ApproveCalcInvDisc()
    begin
        //CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate()
    begin
        if GetFilter("Buy-from Vendor No.") = xRec."Buy-from Vendor No." then
            if "Buy-from Vendor No." <> xRec."Buy-from Vendor No." then
                SetRange("Buy-from Vendor No.");
        CurrPage.Update;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        // CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        //  CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        //   CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure CurrencyCodeOnAfterValidate()
    begin
        //  CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update;
    end;
}

