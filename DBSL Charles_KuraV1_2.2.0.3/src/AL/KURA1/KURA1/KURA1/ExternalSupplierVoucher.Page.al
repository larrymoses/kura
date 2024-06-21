#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75408 "External Supplier Voucher"
{
    PageType = Card;
    SourceTable = "External Supplier Voucher";

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
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Authority Code"; "External Authority Code")
                {
                    ApplicationArea = Basic;
                }
                field("External Authority Name"; "External Authority Name")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement  Category ID"; "Procurement  Category ID")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; "IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("IFS Description"; "IFS Description")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
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
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; "Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("DateTime Posted"; "DateTime Posted")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Category Name"; "Procurement Category Name")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control18; "External Supplier Voucher Line")
            {
                SubPageLink = "Document No" = field("Document No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                ToolTip = 'Request approval of the document.';

                trigger OnAction()
                var
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    /*IF ApprovalsMgmt.CheckIFSApprovalPossible(Rec) THEN
                      ApprovalsMgmt.OnSendIFSForApproval(Rec);*/


                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Cancel Approval Re&quest';
                Enabled = CanCancelApprovalForRecord;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Cancel the approval request.';

                trigger OnAction()
                var
                //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                //   WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                begin
                    /*ApprovalsMgmt.OnCancelIFSApprovalRequest(Rec);
                    WorkflowWebhookMgt.FindAndCancel(RECORDID);*/

                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'F9';

                trigger OnAction()
                begin
                    TestField(Posted, false);
                    TestField(Status, Status::Released);

                    //Check If Lines exist
                    ExternalSupplierVoucherLine.Reset;
                    ExternalSupplierVoucherLine.SetRange(ExternalSupplierVoucherLine."Document No", "Document No");
                    if ExternalSupplierVoucherLine.IsEmpty then
                        Error('Please add atleast one line');


                    ExternalSupplierVoucherLine.Reset;
                    ExternalSupplierVoucherLine.SetRange(ExternalSupplierVoucherLine."Document No", "Document No");
                    if ExternalSupplierVoucherLine.FindSet then
                        repeat
                            //Create entries to Vendor
                            Vendor.Init;
                            Vendor."No." := '';
                            Vendor."VAT Registration No." := ExternalSupplierVoucherLine."KRA PIN";
                            Vendor.Name := ExternalSupplierVoucherLine."Supplier Name";
                            Vendor."E-Mail" := ExternalSupplierVoucherLine."Primary Email";
                            Vendor.Tel := ExternalSupplierVoucherLine."Telephone No.";
                            Vendor.Reset;
                            Vendor.SetRange(Vendor."VAT Registration No.", ExternalSupplierVoucherLine."KRA PIN");
                            if not Vendor.FindSet then begin
                                if not Vendor.Insert(true) then
                                    Vendor.Modify(true)
                            end
                            else
                                Error('The vendor with %1 already exists', ExternalSupplierVoucherLine."KRA PIN");


                            //Create Entries to External Supplier Entry
                            VendorExternalEntry.Init;
                            VendorExternalEntry."Entry No" := VendorExternalEntry.Count + 1;
                            VendorExternalEntry."Vendor No." := Vendor."No.";
                            VendorExternalEntry."Vendor Name" := ExternalSupplierVoucherLine."Supplier Name";
                            VendorExternalEntry."Procurement Category Code" := ExternalSupplierVoucherLine."Procurement Category ID";
                            VendorExternalEntry."IFP No." := "IFS Code";
                            VendorExternalEntry.Description := "IFS Description";
                            if not VendorExternalEntry.Insert(true) then
                                VendorExternalEntry.Modify(true);
                        until ExternalSupplierVoucherLine.Next = 0;

                    //Mark As Posted
                    Posted := true;
                    "Posted By" := UserId;
                    "DateTime Posted" := CreateDatetime(Today, Time);
                    Modify(true);
                    Message('Posted successfully');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ///ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Status in [Status::Open, Status::"Pending Approval"] then begin
                        Status := Status::Released;
                        Modify();
                        Message('This document %1 has been successfully released', "Document No");
                    end
                    else
                        Error('The status must be open or pending approval. Current value is %1', Format(Status));
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    if Status in [Status::Released, Status::"Pending Approval"] then begin
                        Status := Status::Open;
                        Modify();
                        Message('This document %1 has been successfully reopened', "Document No");
                    end
                    else
                        Error('The status must be released or pending approval. Current value is %1', Format(Status));
                end;
            }
        }
    }

    var
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VendorExternalEntry: Record "Vendor External  Entry";
        ExternalSupplierVoucherLine: Record "External Supplier Voucher Line";
        Vendor: Record Vendor;
}

