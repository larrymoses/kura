#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72740 "Survey/Study/Design Request"
{
    PageType = Card;
    SourceTable = "Survey Request Header";

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
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; "Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Requestor No"; "Requestor No")
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; "Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Region"; "Requestor Region")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Name"; "Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; "Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; "Department Name")
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
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control15; "Survey/Study/Design Req SubPag")
            {
                Caption = 'Survey/Study/Design Request  SubPage';
                SubPageLink = "Document No." = field("Document No.");
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
                    TestField(Status, Status::Approved);
                    TestField(Posted, false);

                    //Write your posting business logic here
                    /*EquipmentRepairLine.RESET;
                    EquipmentRepairLine.SETRANGE(EquipmentRepairLine."Document No.","Document No");
                    EquipmentRepairLine.SETRANGE(EquipmentRepairLine."Document Type","Document Type");
                    IF EquipmentRepairLine.FINDSET THEN
                      REPEAT
                        WEPContractorEquipment.RESET;
                        WEPContractorEquipment.SETRANGE(WEPContractorEquipment."Contractor No.","Contractor No");
                        WEPContractorEquipment.SETRANGE(WEPContractorEquipment."Equipment No.",EquipmentRepairLine."Equipment No.");
                        IF WEPContractorEquipment.FINDSET THEN
                        REPEAT
                          WEPContractorEquipment."Equipment Condition Status":=WEPContractorEquipment."Equipment Condition Status"::"Under Maintenance";
                          WEPContractorEquipment.MODIFY(TRUE);
                        UNTIL WEPContractorEquipment.NEXT=0;
                        UNTIL EquipmentRepairLine.NEXT=0;*/


                    // Posted:=TRUE;
                    // "Posted By":=USERID;
                    // "Posted DateTime":=CURRENTDATETIME();
                    // MODIFY(TRUE);
                    // DIALOG.MESSAGE('Document %1 posted successfully',"Document No");

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
                    //      ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    //  ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    //    ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    Status := Status::Approved;
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
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Document No.", 'Testing', RecordId, '');
                    Modify();
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Document No.", "Document No.");
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

                    Submitted := true;
                    "Submitted By" := UserId;
                    "Submmitted Date" := Today;
                    "Submitted Time" := Time;
                    Modify(true);


                    SurveyRequestLine.Reset;
                    SurveyRequestLine.SetRange(SurveyRequestLine."Document No.", "Document No.");
                    if SurveyRequestLine.FindSet then begin
                        SurveyRequestLine.TestField(SurveyRequestLine."Study/Survey/Design Type");
                        SurveyRequestLine.TestField(SurveyRequestLine."Project ID");
                    end;


                    //Notify RE that a document has been send for their approval/Review
                    ProcurementProcessing.FnNotifyPDEUserDirectorate(Rec);
                    Dialog.Message('Document %1 submitted successfully', "Document No.");
                end;
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin
        TestField(Submitted, true);
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        ProcurementProcessing: Codeunit "Procurement Processing";
        PurchaseHeader: Record "Purchase Header";
        SurveyRequestLine: Record "Survey Request Line";
}

