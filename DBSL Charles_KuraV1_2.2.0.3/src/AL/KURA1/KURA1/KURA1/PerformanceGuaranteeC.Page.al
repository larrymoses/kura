#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72634 "Performance Guarantee C"
{
    PageType = Card;
    SourceTable = "Insurance/Guarantee Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; "Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor ID"; "Contractor ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; "Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Insurer/Guarantor Name"; "Insurer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Policy/Guarantee No"; "Policy/Guarantee No")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Insured/Guaranteed"; "Amount Insured/Guaranteed")
                {
                    ApplicationArea = Basic;
                }
                field("Form of Security"; "Form of Security")
                {
                    ApplicationArea = Basic;
                }
                field("Security Type"; "Security Type")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer Institution Type"; "Issuer Institution Type")
                {
                    ApplicationArea = Basic;
                }
                field("Issuer Registered Offices"; "Issuer Registered Offices")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; "Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date"; "Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Notification Date"; "Expiry Notification Date")
                {
                    ApplicationArea = Basic;
                }
                field("Second Expiry Notification Dat"; "Second Expiry Notification Dat")
                {
                    ApplicationArea = Basic;
                    Caption = 'Second Expiry Notification Date';
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
                {
                    ApplicationArea = Basic;
                }
                field(Expired; Expired)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; "Created DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document Type", "Document Type");
                    SetRange("Document No.", "Document No.");
                    if FindSet then
                        Report.Run(72049, true, true, Rec);
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //ShowDocDim();
                    CurrPage.SaveRecord();
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Approvals');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Approvals sent');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category20;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Message('Approvals Cancelled');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category18;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Approved;
                    Modify();
                    Message('Document %1 released successfully', "Document No.");
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category18;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Open;
                    Modify();
                    Message('Document %1 reopened successfully', "Document No.");
                end;
            }
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Document No.", Format("Document Type"), RecordId, '');
                    Modify();
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // RMSManagement.FnPostPerformanceGuaranteeToContract(Rec);
                    /// Message(Format("Document Type")+'%1 verified and Posted Successfully',"Document No.");
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //Notify the Insurer and let them confirm via another email
                    ProcurementProcessing.FnSendInsurerNotification(Rec);
                    Message(Format("Document Type") + ' %1 Submitted Successfully', "Document No.");
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Performance Guarantee";
        "Security Type" := "security type"::"Performance/Contract Security";
    end;

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        RMSManagement: Codeunit "RMS Management";
        ProcurementProcessing: Codeunit "Procurement Processing";
}

