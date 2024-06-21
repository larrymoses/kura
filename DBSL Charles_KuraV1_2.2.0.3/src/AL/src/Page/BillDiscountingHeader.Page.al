#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57215 "Bill Discounting Header"
{
    PageType = Card;
    SourceTable = "Bill Discounting Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Crearted Time"; "Crearted Time")
                {
                    ApplicationArea = Basic;
                }
                field("Region Code"; "Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; "Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Code"; "Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name"; "Region Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank No"; "Bank No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Bank Code"; "Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch No"; "Bank Branch No")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch Name"; "Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank Account Name"; "Bank Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank Account Number"; "Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Approval  Status"; "Approval  Status")
                {
                    ApplicationArea = Basic;
                }
                field("Total Discountable Amount"; "Total Discountable Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Discounted Amount';
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Posted DateTime"; "Posted DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Total Discounted Amount"; "Total Discounted Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Gross Amount';
                }
                field("Total VAT Amount"; "Total VAT Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Witholding Tax Amount"; "Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Wthheld six %"; "VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                }
                field("Total Retention"; "Total Retention")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Advance Recovery"; "Total Advance Recovery")
                {
                    ApplicationArea = Basic;
                }
                field("Total Net Amount"; "Total Net Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Discountable Amount';
                }
            }
            part(Control19; "Bill Discounting Line SubPage")
            {
                SubPageLink = "Document No" = field("Document No"),
                              "Contractor No" = field("Contractor No");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    if not Confirm('Are you sure you want to post the Bill?') then
                        exit;
                    //TESTFIELD(Posted);

                    // BillDiscountingLine.RESET;
                    // BillDiscountingLine.SETRANGE("Document No","Document No");
                    // BillDiscountingLine.SETRANGE("Contractor No","Contractor No");
                    // IF BillDiscountingLine.FINDSET THEN BEGIN
                    //  REPEAT
                    //    VendorLedgerEntry.RESET;
                    //    VendorLedgerEntry.SETRANGE("Document No.",BillDiscountingLine."Pending Certificate No.");
                    //    IF VendorLedgerEntry.FINDSET THEN BEGIN
                    //      VendorLedgerEntry.Discounted:=TRUE;
                    //      VendorLedgerEntry.MODIFY(TRUE);
                    //      END;
                    // UNTIL BillDiscountingLine.NEXT=0;
                    //  END;


                    BillDiscountingLine.Reset;
                    BillDiscountingLine.SetRange("Document No", "Document No");
                    if BillDiscountingLine.FindSet then begin
                        PurchInvHeader.Reset;
                        PurchInvHeader.SetRange(PurchInvHeader."No.", BillDiscountingLine."Pending Certificate No.");
                        if PurchInvHeader.FindSet then begin
                            PurchInvHeader.Discounted := true;
                            PurchInvHeader.Modify(true);
                        end;
                    end;

                    Posted := true;
                    "Posted By" := UserId;
                    "Posted DateTime" := CreateDatetime(Today, Time);
                    Modify(true);
                    Message('Posted Successfully');
                    CurrPage.Close;
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
                    DMSManagement.UploadPaymentsDocuments("Document No", 'Bill Discounting', RecordId, "Region Code");
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // if ApprovalsMgmt.CheckBDiscountReqApprovalPossible(Rec) then
                    //   ApprovalsMgmt.OnSendBDiscountReqForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OnCancelBDiscountReqApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Approve)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                end;
            }
            action(Reject)
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                end;
            }
            action(Delegate)
            {
                ApplicationArea = Basic;
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                end;
            }
            action("Bill Discount")
            {
                ApplicationArea = Basic;
                Caption = 'Bill Discounting Report';
                Image = PrintDocument;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                var
                    PVLines: Record "PV Lines";
                begin
                    Reset;
                    SetRange("Document No", "Document No");
                    if FindSet then
                        Report.Run(59104, true, true, Rec);
                end;
            }
        }
    }

    var
        BillDiscHeader: Record "Bill Discounting Header";
        DMSManagement: Codeunit "DMS Management";
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        BillDiscountingLine: Record "Bill Discounting Line";
        PurchInvHeader: Record "Purch. Inv. Header";
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
}

