#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
/// <summary>
/// Page Taking Over inspection (ID 72570).
/// </summary>
Page 72570 "Taking Over inspection"
{
    PageType = Card;
    SourceTable = "Inspection Headersss";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No"; "Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type"; "Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract ID"; "Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field("Final Taking Over Inspection?"; "Final Taking Over Inspection?")
                {
                    ApplicationArea = Basic;
                }
               
                field("Contractor Request No"; "Contractor Request No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; "Inspection Date")
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
                field("Committee No"; "Committee No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Supervision Template"; "Project Supervision Template")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; "Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; "Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Revised End Date"; "Revised End Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Start Date"; "DLP Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("DLP Period"; "DLP Period")
                {
                    ApplicationArea = Basic;
                }
                field("DLP End Date"; "DLP End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Period"; "Maintenance Period")
                {
                    ApplicationArea = Basic;
                }
                 field("Agreed Take Over Date";"Agreed Take Over Date")
                {
                     ApplicationArea = Basic;
                }
                field("Awarded Tender Sum Inc Tax"; "Awarded Tender Sum Inc Tax")
                {
                    ApplicationArea = Basic;
                }
                field("Payments To Date"; "Payments To Date")
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
                field("Taking Over Certificate No."; "Taking Over Certificate No.")
                {
                    ApplicationArea = Basic;
                }
                field("Clause No."; "Clause No.")
                {
                    ApplicationArea = Basic;
                }
                field("Clause Description"; "Clause Description")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control40; "Project Inspection Line Subpag")
            {
                SubPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                Editable = false;
                field("Works Start Chainage"; "Works Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Works End Chainage"; "Works End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Contractor Rep."; "Primary Contractor Rep.")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Representative Role"; "Contractor Representative Role")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Rep. Email"; "Contractor Rep. Email")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan 1D"; "Work Execution Plan 1D")
                {
                    ApplicationArea = Basic;
                }
                field("Commencement Order No"; "Commencement Order No")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager/Engineer"; "Project Manager/Engineer")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; "Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; "Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency No."; "Funding Agency No.")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Overall Committee Decision")
            {
                Caption = 'Overall Committee Decision';
                field("Committee Decision"; "Committee Decision")
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
            action("Inspection Recommendations")
            {
                ApplicationArea = Basic;
                Caption = 'Inspection Committee Recommendations';
                Image = LedgerEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Committee Recommendations";
                RunPageLink = "Inpection Type" = field("Inspection Type"),
                              "Inspection No" = field("Inspection No");
            }
            action("Committee Members")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "IFS Tender Committee Member";
                RunPageLink = "Document No." = field("Committee No");
            }
            action("Inspection Snag List")
            {
                ApplicationArea = Basic;
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Inspection Snag List";
                RunPageLink = "Inspection No" = field("Inspection No"),
                              "Inspection Type" = field("Inspection Type");
            }
            action("Sections Taken Over")
            {
                ApplicationArea = Basic;
                Image = SKU;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Taking Over Sections";
                RunPageLink = "Inspection No" = field("Inspection No"),
                              "Document Type" = field("Inspection Type");
            }
            action("Circulation Team")
            {
                ApplicationArea = Basic;
                Image = SignUp;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Contract Circulation Team";
                RunPageLink = "Document Type" = const("Taking Over Inspection"),
                              No = field("Inspection No");
            }
            action("Taking Over Certificate")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Inspection Type", "Inspection Type");
                    SetRange("Inspection No", "Inspection No");
                    if FindSet then begin
                        Report.Run(72054, true, false, Rec);
                    end;
                end;
            }
            action("Attach Docs")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Meeting Minutes';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    DMSManagement.UploadStaffClaimDocuments(DocType."document type"::"Transport Requisition", Rec."Inspection No", 'Testing', RecordId, '');
                    //Attached:=TRUE;
                    Modify();
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
                    // if ApprovalsMgmt.CheckIHReqApprovalPossible(Rec) then
                    //   ApprovalsMgmt.OnSendIHReqForApproval(Rec);
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
                    //  ApprovalsMgmt.OnCancelIHReqApprovalRequest(Rec);
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
                    //    ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField(Status, Status::Released);
                    TestField(Posted, false);

                    ProjectVendors.Reset;
                    ProjectVendors.SetRange(ProjectVendors."Contract No", "Contract ID");
                    if ProjectVendors.FindSet then begin
                        TakingOverSection.Reset;
                        TakingOverSection.SetRange(TakingOverSection."Inspection No", Rec."Inspection No");
                        if TakingOverSection.FindSet then
                            repeat
                                if ((TakingOverSection."Start Chainage" >= ProjectVendors."Start Chainage(KM)") and (TakingOverSection."End Chainage" <= ProjectVendors."End Chainage(KM)")) then begin

                                    if "Committee Decision" = "committee decision"::Accept then begin
                                        ProcurementProcessing.FnNotifyContractorTakingOverInspectionAccept(Rec);
                                        ObjJob.Reset;
                                        ObjJob.SetRange(ObjJob."No.", "Project ID");
                                        if ObjJob.FindSet then begin
                                            ObjJob.Status := ObjJob.Status::Completed;
                                            ObjJob.Modify(true);
                                        end;
                                    end;
                                    if "Committee Decision" = "committee decision"::Reject then begin
                                        ProcurementProcessing.FnNotifyContractorTakingOverInspectionReject(Rec);
                                    end;
                                end;
                            until ProjectVendors.Next = 0;
                    end;
                    Posted := true;
                    Modify(true);
                    Message('Posted successfully.');
                end;
            }
            action("Reject Document")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    TestField("Rejection Remarks");
                    Rejected := true;
                    "Rejected By" := UserId;
                    Modify();
                    Message('Document Rejected.');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Inspection Type" := "inspection type"::"Taking Over Inspection";
    end;

    var
        DMSManagement: Codeunit "DMS Management";
        DocType: Record "DMS Documents";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ProcurementProcessing: Codeunit "Procurement Processing";
        ProjectVendors: Record "Project Vendors";
        TakingOverSection: Record "Taking Over Section";
        ObjJob: Record Job;
}

