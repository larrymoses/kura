#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 70056 "Inspection Header"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Inspection Header1";
    PromotedActionCategories = 'New,Process,Report,Approvals,Request Approval';
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Inspection No"; Rec."Inspection No")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Contract/Order No"; Rec."Contract/Order No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Commitee Appointment No"; Rec."Commitee Appointment No")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("General Committe Remarks"; Rec."General Committe Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000012; "Inspection Lines")
            {
                SubPageLink = "Inspection No" = field("Inspection No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Send Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Request for Approval';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("Cancel Request for Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Request for Approval';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action("View Contract/Order")
                {
                    ApplicationArea = Basic;
                    Caption = 'View Contract/Order';
                    Image = "Order";
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Purchase Order";
                    RunPageLink = "No." = field("Contract/Order No");
                }
                action("Appraise Vendor")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    Promoted = true;
                    PromotedCategory = Process;
                    //  RunObject = Page "Vendor Appraisal Voucher";
                    //RunPageLink = "No." = field("Contract/Order No");
                    trigger OnAction()
                    var
                        VendApp: Record "Vendor Appraisal Voucher";
                    begin
                        if confirm('Are you sure you want to proceed with this Appraisal?', false) = true then begin
                            VendApp.Init();
                            VendApp."Appraisal Method" := VendApp."Appraisal Method"::Inspection;
                            VendApp.Validate("Appraisal Method");
                            VendApp."Document Date" := today;
                            VendApp."Inspection No." := Rec."Inspection No";
                            VENDAPP.VALIDATE("Inspection No.");
                            vendapp."Document Type" := vendapp."Document Type"::Debarment;
                            vendapp.insert(true);
                            page.Run(75449, VendApp);

                        end;
                    end;
                }
                action("Inspection Certificate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Inspection Certificate';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetFilter("Inspection No", Rec."Inspection No");
                        Report.Run(70006, true, true, Rec);
                        Rec.Reset;
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    // trigger OnAction()
                    // var
                    //     DocumentAttachmentDetails: Page "Document Attachment Details";
                    //     RecRef: RecordRef;
                    // begin
                    //     RecRef.GetTable(Rec);
                    //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //     DocumentAttachmentDetails.RunModal;
                    // end;
                }
                action(Submit)
                {
                    ApplicationArea = All;
                    Caption = 'Submit';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    var
                        //DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        //MESSAGE('Start');
                        Rec.TestField("Commitee Appointment No");
                        Rec.TestField("General Committe Remarks");
                        InspectionLines.Reset();
                        InspectionLines.SetRange("Inspection No", Rec."Inspection No");
                        if InspectionLines.FindSet() then begin
                            repeat
                                if InspectionLines."Inspection Decision" = InspectionLines."Inspection Decision"::" " then
                                    Error('Inspection decision cannot be %1', InspectionLines."Inspection Decision"::" ");
                                if InspectionLines."Inspection Decision" = InspectionLines."Inspection Decision"::Reject then
                                    InspectionLines.TestField("Reasons for Rejection");
                            until InspectionLines.Next() = 0;
                        end;
                        PurchaseLine.Reset;
                        PurchaseLine.SetRange(PurchaseLine."Document No.", Rec."Contract/Order No");
                        //PurchaseLine.SETRANGE("Document Type",PurchaseLine."Document Type"::Order);
                        if PurchaseLine.FindSet then begin
                            repeat
                                InspectionLines1.Reset;
                                InspectionLines1.SetRange("Inspection No", Rec."Inspection No");
                                InspectionLines1.SetRange("Line No", PurchaseLine."Line No.");
                                if InspectionLines1.FindSet then begin
                                    PurchaseLine."Qty. to Receive" := InspectionLines1."Quantity Received";
                                    InspectionLines1."Received Qty" := InspectionLines1."Quantity Received";
                                    //PurchaseLine.MODIFY(TRUE);
                                end;
                                PurchaseLine.Modify(true);
                                InspectionLines1.Modify(true);
                            until PurchaseLine.Next = 0;

                            Message('Submitted sucessfully');
                        end;


                    end;
                }
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    /// ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance();
    end;

    var
        PurchaseLine: Record "Purchase Line";
        InspectionLines1: Record "Inspection Lines1";
        InspectionLines: Record "Inspection Lines1";
        InspectionHeader1: Record "Inspection Header1";
        ApprovalEntry: Record "Approval Entry";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

    local procedure SetControlAppearance()
    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
    end;
}




