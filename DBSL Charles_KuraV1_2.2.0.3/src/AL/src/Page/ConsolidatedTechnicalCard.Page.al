#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 75461 "Consolidated Technical Card"
{
    PageType = Document;
    SourceTable = "Bid Evaluation Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code";Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead";Rec."Evaluation Lead")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Lead Name";Rec."Evaluation Lead Name")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Date";Rec."Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Opening Committee";Rec."Tender Opening Committee")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Evaluation Committee";Rec."Tender Evaluation Committee")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Evaluation Criteria";Rec."Bid Evaluation Criteria")
                {
                    ApplicationArea = Basic;
                }
                field("Total Evaluated Bids";Rec."Total Evaluated Bids")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No Failed Technical";Rec."No Failed Technical")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No Passed Technical";Rec."No Passed Technical")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Status";Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date";Rec."Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time";Rec."Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control19;"Technical Evaluation Lines")
            {
                Editable = false;
                SubPageLink = "Evaluation Type"=field("Evaluation Type"),
                              "IFS Code"=field("IFS Code"),
                              "Evaluator Category"=const("Evaluation Committee"),
                              Posted=filter(true),
                              "Last Evaluation Version No."=field("Last Evaluation Version No.");
            }
        }
        area(factboxes)
        {
            systempart(Control15;Outlook)
            {
            }
            systempart(Control16;Notes)
            {
            }
            systempart(Control17;MyNotes)
            {
            }
            systempart(Control18;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Evaluation)
            {
                Caption = 'Evaluation';
                Image = "Order";
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry"=R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                    begin
                        //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
        }
        area(processing)
        {
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

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
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

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
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

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
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

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(ActionGroup28)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReleaseTenderAddendum(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        //ReleasePurchDoc.ReopenTenderAddendum(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Rec.Code,Rec.Code);
                        Report.Run(70122,true,true,Rec);
                         FileDirectoryX:='C:\SCM\Tender\'+Rec."IFS Code"+'\';
                        // //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                         FileNameX:=Rec."IFS Code"+'_4_Technical.pdf';
                          if FILE.Exists(FileDirectoryX+FileNameX) then
                          FILE.Erase(FileDirectoryX+FileNameX);//51217
                        //MERGE PDF
                        FileDirectory:='C:\SCM\Tender\'+Rec."IFS Code"+'\';
                        //D:\CUENAV_BACKUP\CUENAV_Documents\CUEL\Awaiting Completeness Card\ACC043
                        FileName:=Rec."IFS Code"+'_4_Technical.pdf';
                        Report.SaveAsPdf(70122,FileDirectory+FileName,Rec);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        ReleasePurchDoc: Codeunit "Release Approval Document";
                    begin
                        /*IF ApprovalsMgmt.CheckIFPApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendIFPForApproval(Rec);*/
                        
                         // ReleasePurchDoc.ReleaseTenderAddendum(Rec);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        /*ApprovalsMgmt.OnCancelIFPApprovalRequest(Rec);*/
                        ///WorkflowWebhookMgt.FindAndCancel(RECORDID);

                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Evaluation Type":=Rec."evaluation type"::"Technical Evaluation";
    end;

    var
        BidEvaluationRegister: Record "Bid Evaluation Register";
        BidEvaluationScoreEntry: Record "Bid Evaluation Score Entry";
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName: Text;
        FileDirectory: Text;
}
