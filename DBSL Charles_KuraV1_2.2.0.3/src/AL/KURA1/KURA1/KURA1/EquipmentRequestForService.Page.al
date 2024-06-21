#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72749 "Equipment Request For Service"
{
    Caption = 'Equipment Repair Tracking';
    PageType = Card;
    SourceTable = "Equipment Repair Tracking";

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
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project No"; "Project No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer No."; "Resident Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer Name"; "Resident Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Resident Engineer Email"; "Resident Engineer Email")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Equipment On Repair"; "No. Of Equipment On Repair")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; "Contract ID")
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
                field("Project Name"; "Project Name")
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
                field(Status; Status)
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
                field("Posted DateTime"; "Posted DateTime")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control18; "Request For Service Lines")
            {
                Caption = 'Equipment Repair Lines';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField(Status, Status::Released);
                    TestField(Posted, false);

                    //Write your posting business logic here
                    EquipmentRepairLine.Reset;
                    EquipmentRepairLine.SetRange(EquipmentRepairLine."Document No.", "Document No");
                    EquipmentRepairLine.SetRange(EquipmentRepairLine."Document Type", "Document Type");
                    if EquipmentRepairLine.FindSet then
                        repeat
                            WEPContractorEquipment.Reset;
                            WEPContractorEquipment.SetRange(WEPContractorEquipment."Contractor No.", "Contractor No");
                            WEPContractorEquipment.SetRange(WEPContractorEquipment."Equipment No.", EquipmentRepairLine."Equipment No.");
                            if WEPContractorEquipment.FindSet then
                                repeat
                                    WEPContractorEquipment."Equipment Condition Status" := WEPContractorEquipment."equipment condition status"::"Under Maintenance";
                                    WEPContractorEquipment.Modify(true);
                                until WEPContractorEquipment.Next = 0;
                        until EquipmentRepairLine.Next = 0;


                    Posted := true;
                    "Posted By" := UserId;
                    "Posted DateTime" := CurrentDatetime();
                    Modify(true);
                    Dialog.Message('Document %1 posted successfully', "Document No");

                    //Notify Contractor That RE has Approved
                    //ProcurementProcessing.
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
                    // IF ApprovalsMgmt.CheckSubReqApprovalPossible(Rec) THEN
                    //  ApprovalsMgmt.OnSendSubReqForApproval(Rec);
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
                    //ApprovalsMgmt.OnCancelSubReqApprovalRequest(Rec);
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
                    //   ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    //  ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    //  ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Open;
                    Modify();
                    Dialog.Message('Document Reopened successfully');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Status := Status::Released;
                    Modify();
                    Dialog.Message('Document Released successfully');
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
                    // DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition",Rec."Document No",'Testing',RecordId,'');
                    Modify();
                end;
            }
            action("Print Tracking Report")
            {
                ApplicationArea = Basic;
                Image = PrintDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document No", "Document No");
                    Report.Run(72052, true, true, Rec);
                end;
            }
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'Submit';
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //TESTFIELD(Status,Status::Released);
                    TestField(Posted, false);

                    "Portal Status" := "portal status"::Submitted;
                    Modify();

                    Dialog.Message('Document %1 submitted successfully', "Document No");

                    //Notify RE that a document has been send for their approval/Review
                    //ProcurementProcessing.
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Request For Service";
    end;

    var
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        VendorProfessionalStaff: Record "Vendor Professional Staff";
        PurchaseHeader: Record "Purchase Header";
        WEPContractorTeam: Record "WEP Contractor Team";
        BidKeyStaff: Record "Bid Key Staff";
        WEPContractorEquipment: Record "WEP Contractor Equipment";
        BidEquipmentSpecification: Record "Bid Equipment Specification";
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        EquipmentRepairLine: Record "Equipment Repair Line";
        ProcurementProcessing: Codeunit "Procurement Processing";
}

