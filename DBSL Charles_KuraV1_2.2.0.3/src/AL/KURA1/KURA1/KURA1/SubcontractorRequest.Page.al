#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72598 "Subcontractor Request"
{
    PageType = Card;
    SourceTable = "Subcontracting Header";

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
                field("Project Code"; "Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Contract ID"; "Purchase Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Request Justification"; "Request Justification")
                {
                    ApplicationArea = Basic;
                }
                field("Main Contractor No."; "Main Contractor No.")
                {
                    ApplicationArea = Basic;
                }
                field("Main Contractor Name"; "Main Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Required Documents Template ID"; "Required Documents Template ID")
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
                    Editable = TRUE;
                }
                field("Reason For Rejection"; "Reason For Rejection")
                {
                    ApplicationArea = Basic;
                }
                field("Date Subcontracted"; "Date Subcontracted")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control29; "Subcontracting Line Subpage")
            {
                Caption = 'Subcontracting Details';
                SubPageLink = "Document No" = field("Document No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Subcontract(Post)")
            {
                ApplicationArea = Basic;
                Caption = 'Submit Request';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //TESTFIELD("Tax PIN No.");
                    //TESTFIELD(Status,Status::Released);
                    TestField(Posted, false);
                    Vendor.Reset;
                    Vendor.SetRange(Vendor."VAT Registration No.", "Tax PIN No.");
                    if not Vendor.FindSet then begin
                        Vendor.Init;
                        Vendor."No." := '';
                        Vendor."VAT Registration No." := "Tax PIN No.";
                        Vendor.Name := "Subcontractor Name";
                        Vendor."Vendor Posting Group" := 'CONTRACTORS';
                        Vendor.Insert(true);


                        ProjectVendors.Init;
                        ProjectVendors."Contract No" := "Purchase Contract ID";
                        ProjectVendors."Vendor No" := Vendor."No.";
                        ProjectVendors."Vendor Name" := "Subcontractor Name";
                        ProjectVendors."Vendor Type" := Type;
                        if not ProjectVendors.Insert(true) then
                            ProjectVendors.Modify(true);
                    end;
                    if Vendor.FindSet then begin
                        Vendor.Name := "Subcontractor Name";

                        Vendor.Modify(true);
                    end;

                    //Check if all the subcontractors have a PIN
                    SubcontractingLine.Reset;
                    SubcontractingLine.SetRange(SubcontractingLine."Document No", "Document No");
                    if SubcontractingLine.FindSet then
                        repeat
                            SubcontractingLine.TestField("Tax PIN No.");
                        until SubcontractingLine.Next = 0;

                    // Posted:=TRUE;
                    // "Posted By":=USERID;
                    // "Posted Date Time":=CREATEDATETIME(TODAY,TIME);
                    // MODIFY(TRUE);


                    Message('Request %1 Submitted Successfully', "Document No");
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
                    //    if ApprovalsMgmt.CheckSubReqApprovalPossible(Rec) then
                    //       ApprovalsMgmt.OnSendSubReqForApproval(Rec);
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
                    //   ApprovalsMgmt.OnCancelSubReqApprovalRequest(Rec);
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
                    //     ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                    //   ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Document No", 'Testing', RecordId, '');
                    Modify();
                end;
            }
            action("Required Documents")
            {
                ApplicationArea = Basic;
                Image = Submit;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Subcontracting Required Docs";
                RunPageLink = "Document No." = field("Document No");
            }
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
                    ///TESTFIELD("Tax PIN No.");
                    TestField(Status, Status::Released);
                    TestField(Posted, false);

                    SubcontractingLine.Reset;
                    SubcontractingLine.SetRange(SubcontractingLine."Document No", "Document No");
                    if SubcontractingLine.FindSet then begin
                        repeat
                            //    MESSAGE(SubcontractingLine."Subcontractor Name");
                            ObjVendor.Reset;
                            ObjVendor.SetRange(ObjVendor."VAT Registration No.", SubcontractingLine."Tax PIN No.");
                            if not ObjVendor.Find('-') then begin
                                ObjVendor.Init;
                                ObjVendor."No." := '';
                                ObjVendor."VAT Registration No." := SubcontractingLine."Tax PIN No.";
                                ObjVendor.Name := SubcontractingLine."Subcontractor Name";
                                Message(SubcontractingLine."Subcontractor Name");
                                ObjVendor."Vendor Posting Group" := 'CONTRACTORS';
                                if not ObjVendor.Get(ObjVendor."No.") then
                                    ObjVendor.Insert(true);


                                ProjectVendors.Init;
                                ProjectVendors."Contract No" := "Purchase Contract ID";
                                ProjectVendors."Vendor No" := ObjVendor."No.";
                                ProjectVendors."Vendor Name" := SubcontractingLine."Subcontractor Name";
                                ProjectVendors."Vendor Type" := SubcontractingLine.Type;
                                if not ProjectVendors.Get("Purchase Contract ID", ObjVendor."No.") then
                                    ProjectVendors.Insert(true);
                            end;

                        until SubcontractingLine.Next = 0;
                    end;


                    //Check if all the subcontractors have a PIN
                    SubcontractingLine.Reset;
                    SubcontractingLine.SetRange(SubcontractingLine."Document No", "Document No");
                    if SubcontractingLine.FindSet then
                        repeat
                            SubcontractingLine.TestField("Tax PIN No.");
                        until SubcontractingLine.Next = 0;

                    //Update Job
                    Job.Reset;
                    Job.SetRange(Job."No.", Rec."Project Code");
                    if Job.FindSet then begin
                        Job."Last Variation Request No." := "Variation Order No";
                        Job.Modify(true);
                    end;

                    Posted := true;
                    "Posted By" := UserId;
                    "Posted Date Time" := CreateDatetime(Today, Time);
                    Modify(true);
                    Message('Request %1 posted Successfully', "Document No");
                end;
            }
            action("Suggest Required Documents")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //    RMSManagement.FnSuggestSubContractorRequiredDocuments(Rec);
                    Message('Required documents suggested successfully');
                end;
            }
            action("Genarate Evaluation Report")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //  RMSManagement.FnPostSubcontractingHeader(Rec);
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        Vendor: Record Vendor;
        ProjectVendors: Record "Project Vendors";
        SubcontractingLine: Record "Subcontracting Line";
        ObjVendor: Record Vendor;
        RMSManagement: Codeunit "RMS Management";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Job: Record Job;
}

