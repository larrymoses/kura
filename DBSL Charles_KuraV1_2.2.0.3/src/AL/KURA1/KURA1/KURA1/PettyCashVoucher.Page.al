#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57017 "Petty Cash Voucher"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = payments;
    SourceTableView = where("Payment Type" = const("Petty Cash"),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Caption = 'Job No.';
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = true;
                    Visible = false;
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Job Task No.");
                    end;
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Visible = Openentries1;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Visible = Openentries1;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Visible = Openentries1;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Account Type");
                    end;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    TableRelation = Customer."Customer Posting Group" where("Customer Posting Group" = filter('PCASH'));

                    trigger OnValidate()
                    begin
                        // TESTFIELD("Account No.");
                        // Customers.RESET;
                        Customers.SetRange(Customers."No.", Rec."Account No.");
                        /*IF Customers.FIND('-') THEN
                           Customers.CALCFIELDS(Customers."Balance (LCY)");
                        //          IF Customers."Balance (LCY)" >0 THEN
                        //            BEGIN
                        //            ERROR(Text006,"Account No.",Customers."Balance (LCY)");
                        //            END;
                                   IF Customers."Customer Posting Group"<>'PCASH' THEN
                                     ERROR(Text007,"Account No.");
                        */

                    end;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    Visible = false;
                }
                field(Job; Rec.JobNo)
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Program Name';
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Section Name';
                    Visible = false;
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Total Mpesa Charges"; Rec."Total Mpesa Charges")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee Mobile No"; Rec."Employee Mobile No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Account Code"; Rec."Employee Bank Account Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Ban Account Name"; Rec."Employee Ban Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Brach Code"; Rec."Employee Bank Brach Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Branch Name"; Rec."Employee Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Bank Account Number"; Rec."Employee Bank Account Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cheque No"; Rec."Cheque No")

                {
                    ApplicationArea = basic;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = basic;
                }
            }
            part(Control1000000021; "PCV Lines")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = No = field("No.");
            }
        }
        area(factboxes)
        {
            part("Attached Documents1"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(57000), "No." = FIELD("No.");//, "Document Type" = CONST(0);
                                                                              // SystemCreatedBy = field(SystemCreatedBy);

            }
            systempart(Control1000000019; Notes)
            {
            }
            systempart(Control1000000020; Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    var
                        CustomAPprovals: Codeunit "Custom Approvals Codeunit";
                        Var_Variant: Variant;
                        VarVariant: Variant;
                    //    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        Rec.TestField("Payment Narration");
                        Rec.TestField("Total Amount");
                        Rec.CalcFields("Total Amount");
                        // if Rec."Total Amount" > 30000 then
                        //     Error('');


                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        VarVariant := Rec;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;

                    // trigger OnAction()
                    // var
                    //     VarVariant: Variant;
                    //     CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    // begin
                    //     // Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    //     Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                    //                                          //IF ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) THEN
                    //                                          // ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    //     VarVariant := Rec;
                    //     CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    // end;
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        VarVariant: Variant;
                        RecRef: RecordRef;
                        CustomApprovalEntry: Record "Approval Entry";
                        OldStatus: Option;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        TXT0002: label 'An approval request has been cancelled.';
                    begin
                        // VarVariant := Rec;
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        // if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //cc//cc// ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        //cc//cc// WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                        //Procurement.FnUncommitPRN(Rec);
                        //
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."No.");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                //   OldStatus :=ApprovalEntry.Status;
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                                CustomApprovalEntry.Modify(true);
                            until CustomApprovalEntry.Next = 0;

                        //Notify The User
                        // EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                        Message(TXT0002);
                    end;
                }
                separator(Action1000000043)
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
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57003, true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    // ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction()
                    begin
                        //Post(CODEUNIT::"Sales-Post (Yes/No)");

                        //PVPost."Post Payment Voucher"(Rec);
                        PaymentsPost.PostPettyCash(Rec);
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                        //  ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //    ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                        //    ApprovalsMgmt.GetApprovalComment(Rec);
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
                        //DMSManagement.UploadPettyCashDocuments("No.",'Petty Cash',RECORDID,"Shortcut Dimension 1 Code");
                        //DMSManagement.UploadImprestrequisitionsDocuments("No.",'Petty Cash Voucher',RECORDID,"Shortcut Dimension 1 Code")
                        DMSManagement.UploadStandardContractDocuments(Rec."No.", 'Petty Cash Voucher', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Petty Cash";
        Rec."Account Type" := Rec."account type"::Employee;
        Rec."Document Type" := Rec."document type"::"Petty Cash";
    end;

    trigger OnOpenPage()
    begin
        pcash.Reset;
        pcash.SetFilter(pcash."Customer Posting Group", 'PCASH');
        //David
        SetControlAppearance;

        if Rec.Status <> Rec.Status::Released then
            Openentries1 := false
        else
            Openentries1 := true;
    end;

    var
        //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExist: Boolean;
        PaymentsPost: Codeunit "Payments-Post";
        Customers: Record Customer;
        Text006: label 'The customer No. %1 has not surrendered previous petty cash Amounting to Kshs. %2!';
        pcash: Record Customer;
        Text007: label 'The selected customer no. %1  is not a valid a petty cash customer!';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        Openentries1: Boolean;
        DimensionSetEntry: Record "Dimension Set Entry";
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";

    local procedure SetControlAppearance()
    var
    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        //  OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
    end;
}



