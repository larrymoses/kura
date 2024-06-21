#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75066 "Projects Works PRNs"
{
    Caption = 'Project Purchase Requisition';
    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = filter("Purchase Requisition"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        IF Rec."No." <> '' THEN BEGIN
                            ProcurementSetup.GET;
                            ContractIssuanceDocs.RESET;
                            ContractIssuanceDocs.SETRANGE("Document ID", Rec."No.");
                            IF ContractIssuanceDocs.FINDSET THEN
                                ContractIssuanceDocs.DELETEALL;
                            DocTemplateLine.RESET;
                            DocTemplateLine.SETRANGE("Template ID", ProcurementSetup."Default Procurement Template");
                            DocTemplateLine.SETRANGE("Procurement Process", DocTemplateLine."Procurement Process"::"Purchase Requisition Notes");
                            IF DocTemplateLine.FINDSET THEN BEGIN
                                REPEAT
                                    ContractIssuanceDocs.INIT;
                                    ContractIssuanceDocs."Document ID" := Rec."No.";
                                    ContractIssuanceDocs."Process Area" := ContractIssuanceDocs."Process Area"::PRN;
                                    ContractIssuanceDocs."Procurement Document Type" := DocTemplateLine."Procurement Document Type";
                                    ContractIssuanceDocs.Description := DocTemplateLine.Description;
                                    ContractIssuanceDocs."Requirement Type" := DocTemplateLine."Requirement Type";
                                    ContractIssuanceDocs."Track Certificate Expiry" := DocTemplateLine."Track Certificate Expiry";
                                    ContractIssuanceDocs."Guidelines/Instruction" := DocTemplateLine."Guidelines/Instruction";
                                    //ContractIssuanceDocs."Contract ID":="Purchase Contract ID";
                                    ContractIssuanceDocs."Contract Index" := DocTemplateLine."Contract Index";
                                    ContractIssuanceDocs."PRN No" := Rec."No.";
                                    //ContractIssuanceDocs."IFS Code":="IFS Code";
                                    ContractIssuanceDocs.INSERT(TRUE);
                                UNTIL DocTemplateLine.NEXT = 0;
                            END;
                            //  Mergefiles.fnCreateConFolder("No.");
                        END;
                    end;
                }
                field("PRN Type"; Rec."PRN Type")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Scoring Template"; Rec."Bid Scoring Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Evaluation Criteria';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    //Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }

                field("Requisition Product Group"; Rec."Requisition Product Group")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Template ID"; Rec."Requisition Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Priority Level"; Rec."Priority Level")
                {
                    ApplicationArea = Basic;
                    OptionCaption = '<,Normal,Urgent,Very Urgent>';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request-By No."; Rec."Request-By No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request-By Name"; Rec."Request-By Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    editable = false;
                    Caption = 'Department/Center Code';
                }

                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    editable = false;
                }
                field("Procurement Plan Entry No"; Rec."Procurement Plan Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Cost"; rec."Estimated Cost")
                {
                    ApplicationArea = basic;
                }

                field("Assigded Procument Officer"; Rec."Assigded Procument Officer")
                {
                    VISIBLE = TRUE;
                    ApplicationArea = Basic;
                    Caption = 'Assigned Procurement Officer';
                }

                // field("Purchaser Code"; Rec."Purchaser Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Assigned Procurement Officer';
                //     Editable = PurchaseCode;
                //     Visible = PurchaseCode;
                // }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Caption = 'Project ID';
                    ShowMandatory = true;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    visible = false;
                }
                field("PP Planning Category"; Rec."PP Planning Category")
                {
                    ApplicationArea = Basic;
                }
                field("PP Funding Source ID"; Rec."PP Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("PP Solicitation Type"; Rec."PP Solicitation Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;

                }
                field("PP Bid Selection Method"; Rec."PP Bid Selection Method")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PP Procurement Method"; Rec."PP Procurement Method")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        IF UserSetup.GET(USERID) THEN BEGIN
                            IF UserSetup."Procurement Manager" = FALSE THEN BEGIN
                                ERROR('Sorry, You are not allowed to Assign the Procurement Method');
                            END;
                        END;

                    end;
                }
                field("PP  Invitation Notice Type"; Rec."PP  Invitation Notice Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("PP Preference/Reservation Code"; Rec."PP Preference/Reservation Code")
                {
                    ApplicationArea = Basic;
                }
                field("PRN Conversion Procedure"; Rec."PRN Conversion Procedure")
                {
                    ApplicationArea = Basic;
                }
                field("Reason to reopen"; Rec."Reason to reopen")
                {
                    ApplicationArea = Basic;
                }
                field("Survey/Study/Design Done?"; Rec."Survey/Study/Design Done?")
                {
                    ApplicationArea = Basic;
                    Caption = 'ESIA Study Done?';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                   //Editable = true;
                    Visible = true;
                }
                field("Multiple IFS"; Rec."Multiple IFS")
                {
                    ApplicationArea = Basic;
                }
                field("Ordered PRN";Rec."Ordered PRN")
                {
                    ApplicationArea = Basic;
                }
                field("First Approver ID"; Rec."First Approver ID")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                }
                field("Second Approver ID"; Rec."Second Approver ID")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                }
                field("Third Approver ID"; Rec."Third Approver ID")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                }
                field("Fourth Approver ID"; Rec."Fourth Approver ID")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                }
                field("Fifth Approver ID"; Rec."Fifth Approver ID")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                }
                field("Sixth Approver ID"; Rec."Sixth Approver ID")
                {
                    ApplicationArea = Basic;
                    Visible = FALSE;
                }
                field("Approval Approve Remarks"; Rec."Approval Approve Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Rejection Remarks"; Rec."Approval Rejection Remarks")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                Editable = TRUE;
                field("Project Staffing Template ID"; Rec."Project Staffing Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Works Equipment Template ID"; Rec."Works Equipment Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                }
                field("Works Length (Km)"; Rec."Works Length (Km)")
                {
                    ApplicationArea = Basic;
                }
                field(Consitituency; Rec.Consitituency)
                {
                    ApplicationArea = Basic;
                }
                field("WorkPlan No"; Rec."WorkPlan No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part(Control59; "BoQ Specifications")
            {
                SubPageLink = "Document No." = field("No.");
            }
            group(PurchLines)
            {
                Caption = 'Project Details';
                //Editable = True;
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(39),
                              "No." = field("No.");
            }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = true;
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Suite;
                ShowFilter = false;
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = true;
                Enabled = true;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Notes;
            }
            systempart(Control8; Outlook)
            {
            }
            systempart(Control7; Notes)
            {
            }
            systempart(Control6; MyNotes)
            {
            }
            systempart(Control3; Links)
            {
            }
            chartpart("Q5402-01"; "Q5402-01")
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Purchase Requisition")
            {
                Caption = 'Purchase Requisition';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension = R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Enabled = Rec."No." <> '';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData "Approval Entry" = R;
                    ApplicationArea = Suite;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';

                    trigger OnAction()
                    var
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RECORDID,DATABASE::"Purchase Header","Document Type","No.");
                        //ApprovalEntries.Setfilters(Database::"Purchase Header", Rec."Document Type", Rec."No.");
                        ApprovalEntries.SetRecordFilters(Database::"Purchase Header", "Approval Document Type"::Quote, Rec."No.");
                        // ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;
                    Image = Attach;
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
                    Visible = True;


                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Procurement Manager" = true then begin
                                Rec.TestField("Purchaser Code");
                                Rec.TestField("PP Solicitation Type");
                            end;
                        end;
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
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
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
                action("Send To Next Approver")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send To Approver';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Send to an approver';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*TESTFIELD("Shortcut Dimension 1 Code");
                        TESTFIELD("Shortcut Dimension 2 Code");
                        TESTFIELD(Description);
                        //TESTFIELD("Requisition Amount");
                        ProcSetup.GET;
                        IF ProcSetup."Enforce Strict Proc Budget che"=TRUE THEN BEGIN
                          IF "Total PRN Amount (LCY)">= "PP Total Available Budget" THEN
                            ERROR('There is no enough Budget for No %1 Line No %2 Budget Available %3',"Procurement Plan ID","Procurement Plan Entry No","PP Total Available Budget");
                          END;
                        
                        IF ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                        //Procurement.FnPRNCommittment(Rec);*/

                        //TESTFIELD(Status,Status::Open);
                        //PAGE.RUN(119);




                        if ((Rec."First Approver ID" <> '') or (Rec."Second Approver ID" <> '') or (Rec."Third Approver ID" <> '') or (Rec."Fourth Approver ID" <> '') or (Rec."Fifth Approver ID" <> '') or (Rec."Sixth Approver ID" <> '')) then begin
                            ProcProcess.FnNotifyApproverWorksPRN(Rec);
                        end;

                    end;
                }
                action("Approve Document")
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
                        /*IF UserSetup.GET(USERID) THEN BEGIN
                          IF UserSetup."Procurement Manager" = TRUE THEN BEGIN
                        TESTFIELD("Purchaser Code");
                        TESTFIELD("PP Solicitation Type");
                        END;
                        END;
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);*/

                        Rec.TestField("Approval Approve Remarks");
                        if Confirm('Are you sure you want to approve this document?. Are you the final approver?', true) then begin
                            Rec.Status := Rec.Status::Released;
                            Rec.Modify(true);
                        end;

                    end;
                }
                action("Reject Document")
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
                        Rec.TestField("Approval Rejection Remarks");
                        if Confirm('Are you sure you want to reject this document?', true) then begin
                            Rec.Status := Rec.Status::Open;
                            Rec.Modify(true);
                        end;
                    end;
                }
                action(OK)
                {
                    ApplicationArea = Suite;
                    Caption = 'OK';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'OKAY the requested changes.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // IF UserSetup.GET(USERID) THEN BEGIN
                        //  IF UserSetup."Procurement Manager" = TRUE THEN BEGIN
                        // TESTFIELD("Purchaser Code");
                        // TESTFIELD("PP Solicitation Type");
                        // END;
                        // END;
                        // ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);

                        Rec.TestField("Approval Rejection Remarks");
                        if Confirm('Are you sure you want to okay this document?', true) then begin
                            //Status:=Status::Open;
                            //MODIFY(TRUE);
                        end;
                    end;
                }
            }
            group(ActionGroup71)
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
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //check Budget Control
                        ProcSetup.Get;
                        if ProcSetup."Enforce Strict Proc Budget che" = true then begin
                            if Rec."Total PRN Amount (LCY)" >= Rec."PP Total Available Budget" then
                                Error('There is no enough Budget for No %1 Line No %2 Budget Available %3', Rec."Procurement Plan ID", Rec."Procurement Plan Entry No", Rec."PP Total Available Budget");
                        end;


                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                        ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal;
                        Clear(CopyPurchDoc);
                        if Rec.Get(Rec."Document Type", Rec."No.") then;
                    end;
                }
                action("Contract  Required Documents")
                {
                    ApplicationArea = Basic;
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Contract Issuance Requirements";
                    RunPageLink = "Document ID" = field("No."),
                                  "Process Area" = const(PRN),
                                  "PRN No" = field("No.");
                }
                action("Variation Of Price Indices")
                {
                    ApplicationArea = Basic;
                    Image = ContactReference;
                    Promoted = true;
                    Caption = 'Variation Of Price Indices';
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Variation of Price Indices";
                    RunPageLink = "No." = field("No.");
                }
                action("Suggest Lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Lines From Requisition Template';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = SuggestCapacity;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = false;

                    trigger OnAction()
                    begin

                        Procurement.SuggestLinesFromRequisitionWorksTemplate(Rec);
                    end;
                }
                action("Suggest req lines")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest BOQ Lines';
                    Ellipsis = true;
                    Enabled = true;
                    Image = SuggestCapacity;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = TRUE;

                    trigger OnAction()
                    begin

                        Procurement.SuggestLinesFromRequisitionTemplate(Rec);
                    end;
                }
                action("Suggest Personnel")
                {
                    ApplicationArea = Suite;
                    Caption = 'Suggest Personnel/Equipment';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = SuggestCapacity;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.';
                    Visible = Config;

                    trigger OnAction()
                    begin

                        Procurement.SuggestPRNPersonnel_equipmentSpecification(Rec);
                    end;
                }
                // action(AttachDocuments)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Attach Document';
                //     Image = Attach;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     PromotedOnly = true;
                //     Visible = true;

                //     trigger OnAction()
                //     begin
                //         DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::"Purchase Requisition", Rec."No.", 'Works Purchase Requisition', Rec.RecordId, Rec."Shortcut Dimension 1 Code");
                //     end;
                // }
                // action("Notify Procurement Officer")
                // {
                //     ApplicationArea = Basic;
                //     Image = Apply;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;

                //     trigger OnAction()
                //     begin
                //         Req.Reset;

                //         //PurchHeader.RESET;

                //         Email2 := CompanyInfo."Administrator Email";
                //         SalespersonPurch.Reset;
                //         SalespersonPurch.SetRange(Code, Rec."Purchaser Code");
                //         if SalespersonPurch.Find('-') then begin
                //             //   SendMail();
                //             Usersetup.RESET;
                //             /*  Usersetup.SETRANGE("User ID","Assigned User ID");
                //               IF Usersetup.FIND('-') THEN BEGIN */
                //             Body := 'You have been assigned a purchase requisition number' + ' ' + Rec."No." + ' ' + ',Kindly login to the ERP and facilitate.';

                //             SMTP.CreateMessage(SalespersonPurch."E-Mail", '', '', 'Purchase Requisition ' + 'No: ' + Rec."No." + ' ' + rec."Description",
                //        'Dear ' + Usersetup."User ID" + ',<BR><BR>' +
                //              Body,
                //         true, true);

                //             SMTP.AddBodyline('<BR><BR>Kind Regards,' + '<BR><BR>Supply Chain Department.<BR>' + '<BR>');
                //             SMTP.Send();
                //         end;
                //         Message('Notified Successfully');

                //     end;
                // }
                action("Create Invitation Notice")
                {
                    ApplicationArea = Basic;
                    Image = CreateForm;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = Rec.status = Rec.status::Released;

                    trigger OnAction()
                    begin
                        Procurement.CreateInvitationNotice(Rec);
                    end;
                }
                action("Notify Procurement Officer")
                {
                    ApplicationArea = Basic;
                    Image = Apply;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        Mail: codeunit eMail;
                        EmailMsg: codeunit "Email Message";
                        oustream: outstream;
                        recref: recordref;
                        tempblob: codeunit "Temp Blob";
                        istream: InStream;
                        EmailScenario: enum "Email Scenario";
                        email: text;
                        req1: record 38;

                    begin
                        SalespersonPurch.Reset;
                        SalespersonPurch.SetRange(Code, Rec."Purchaser Code");
                        if SalespersonPurch.FindSet then begin
                            // message('%1', SalespersonPurch."E-mail");
                            email := SalespersonPurch."E-Mail";
                        end;
                        Usersetup.RESET;
                        Body := 'You have been assigned a purchase requisition number' + ' ' + Rec."No." + ' ' + ',Kindly login to the ERP and facilitate.';
                        EmailMsg.Create('dennisonkyalo@dynasoft.co.ke', 'Purchase Requisition ' + 'No: ' + Rec."No." + ' ' + rec."Description", '', true);

                        EmailMsg.AppendToBody(Body + '<BR><BR>Kind Regards,' + '<BR><BR>Supply Chain Department.<BR>' + '<BR>');
                        req1.reset;
                        req1.setrange("No.", req1."No.");
                        if req.findset then begin



                            recref.GetTable(rec);
                            tempblob.CreateOutStream(oustream);

                            report.saveas(Report::"Purchase Requisition", '', ReportFormat::pdf, oustream, recref);
                            tempblob.CreateInStream(istream);
                            EmailMsg.addattachment(req."No." + '.pdf', '', istream);
                        end;

                        mail.Send(emailmsg, EmailScenario::"Sales Invoice");
                        Message('%1', 'Notified Successfully!', mail);
                    end;
                }



                action("Export Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Export To Excel';
                    Ellipsis = true;
                    Image = Excel;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    var
                        Name: Text;
                        ReturnValue: Boolean;
                        TempFile: File;
                        ToFile: Variant;
                        NewStream: InStream;
                        FilePath: label 'C:\QuickPay\ExcelTemplates\TempFiles\';
                    begin
                        if not Confirm('Are you sure you want to generate an excel?') then
                            exit;

                        RowNo := 1;
                        //  RMSMgt.FnMakeExcelHeader();
                        StoreReqLine.Reset;
                        StoreReqLine.SetRange("Document No.", Rec."No.");
                        StoreReqLine.SetRange("Document Type", Rec."Document Type");
                        if StoreReqLine.FindSet then begin
                            repeat
                                RowNo := RowNo + 1;
                                StoreReqLine.TestField(Type);
                                StoreReqLine.TestField("No.");
                                StoreReqLine.TestField(Description);
                            //RMSMgt.FnCreateExcelLines(Format(StoreReqLine.Type), StoreReqLine."No.", StoreReqLine.Description,
                            // StoreReqLine.Quantity, StoreReqLine."Direct Unit Cost", StoreReqLine.Amount, StoreReqLine."Amount Including VAT", RowNo);
                            until StoreReqLine.Next = 0;
                        end;
                        //RMSMgt.FnOpenExcelFile('BoQ', 'BoQ.xlsx');
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = TRUE;//not OpenApprovalEntriesExist and CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                        PurchHeader: record "Purchase Header";
                        PPlanEntry: record "Procurement Plan Entry";
                        approvalRequestRec: Record "Approval Entry";
                        ApprovalRequest: Codeunit "Approvals Mgmt.";
                        PurchaseOrder: RECORD "Purchase Header";
                    begin
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
                        Rec.TestField(Description);
                        ProcSetup.Get;
                        if ProcSetup."Enforce Strict Proc Budget che" = true then begin
                            if Rec."Total PRN Amount (LCY)" >= Rec."PP Total Available Budget" then
                                Error('There is no enough Budget for No %1 Line No %2 Budget Available %3', Rec."Procurement Plan ID", Rec."Procurement Plan Entry No", Rec."PP Total Available Budget");
                        end;


                        ///////// PurchaseOrder := PurchHeader.Get(PurchHeader."No." = 'PO-001');

                        // Create an approval request record for the purchase order
                        /// //////// approvalrequestrecol := ApprovalRequest.CreateApprovalRequest(ApprovalRequest.Type::Purchase);

                        // Set the purchase order on the approval request record
                        //// //////// approvalRequestRec."Document No." := purchaseOrder."No.";
                        ////  //////// approvalRequestRec."Document Type" := approvalRequestRec."Document Type"::"Purchase Order";

                        // Submit the approval request
                        //   //////////// approvalRequestRec.SubmitApprovalRequest;

                        // Check if the approval was successful
                        ////  //// IF approvalRequestRec.Status = approvalRequestRec.Status::Approved THEN BEGIN
                        // MESSAGE('The purchase order has been approved.');
                        //// END ELSE BEGIN
                        ///  MESSAGE('The purchase order was not approved.');
                        /////END;

                        //VarVariant := Rec;
                        //IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        //
                        //    CustomApprovals.OnSendDocForApproval(VarVariant);
                        PPlanEntry.Reset;
                        PPlanEntry.SetRange(PPlanEntry."Entry No.", rec."Procurement Plan Entry No");
                        if PPlanEntry.Find('-') then begin
                            PPlanEntry."Entry Used" := true;
                            PPlanEntry.modify(True);
                        end;

                        if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                            ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = TRUE;//CanCancelApprovalForRecord or CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                    begin
                        //VarVariant := Rec;
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        // WorkflowWebhookMgt.FindAndCancel(Rec.RecordId);
                    end;
                }
                action("Required Personnel")
                {
                    ApplicationArea = Basic;
                    Image = Employee;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    RunObject = Page "PRN Personnel Specification";
                    RunPageLink = "Document No." = field("No."),
                                  "Document Type" = field("Document Type");
                }
                action("Required Equipment")
                {
                    ApplicationArea = Basic;
                    Image = Giro;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    RunObject = Page "PRN Equipment Specification";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("No.");
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("Check Budget Availability")
                {
                    ApplicationArea = Basic;
                    Caption = 'Check Budget Availability';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin

                        /*BCSetup.GET;
                        IF NOT BCSetup.Mandatory THEN
                           EXIT;*/

                        /*F NOT CheckforRequiredFields THEN
                           ERROR('There might be some lines missing the key fields: [TYPE, NO.,AMOUNT] Please recheck your document lines');*/

                        if Rec.Status = Rec.Status::Released then
                            Error('This document has already been released. This functionality is available for open documents only');
                        /*IF SomeLinesCommitted THEN BEGIN
                           IF NOT CONFIRM( 'Some or All the Lines Are already Committed do you want to continue',TRUE, "Document Type") THEN
                                ERROR('Budget Availability Check and Commitment Aborted');
                          DeleteCommitment.RESET;
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document Type",DeleteCommitment."Document Type"::LPO);
                          DeleteCommitment.SETRANGE(DeleteCommitment."Document No.","No.");
                          DeleteCommitment.DELETEALL;
                        END;*/
                        Commitment.CheckLPOCommittment(Rec);

                        //MESSAGE('Commitments done Successfully for Doc. No %1',"No.");

                    end;
                }
                action("Cancel Budget Commitment")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Budget Commitment';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);

                        if not Confirm('Are you sure you want to Cancel All Commitments Done for this document', true, Rec."Document Type") then
                            Error('Budget Availability Check and Commitment Aborted');

                        DeleteCommitment.Reset;
                        DeleteCommitment.SetRange(DeleteCommitment."Commitment Type", DeleteCommitment."commitment type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", Rec."No.");
                        DeleteCommitment.DeleteAll;
                        //Tag all the Purchase Line entries as Uncommitted
                        /*PurchLine.RESET;
                        PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
                        PurchLine.SETRANGE(PurchLine."Document No.","No.");
                        IF PurchLine.FIND('-') THEN BEGIN
                           REPEAT
                              PurchLine.Committed:=FALSE;
                              PurchLine.MODIFY;
                           UNTIL PurchLine.NEXT=0;
                        END;*/

                        Message('Commitments Cancelled Successfully for Doc. No %1', Rec."No.");

                    end;
                }
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Detailed Print Works PRN';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        /*IF Status<>Status::Released THEN
                        ERROR(Text001);
                        IF Status=Status::Released THEN BEGIN
                        DocPrint.PrintPurchHeader(Rec);
                          END;*/

                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(50097, true, true, Rec)

                    end;
                }
                action("&Print Works PRN")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print Works PRN';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        /*IF Status<>Status::Released THEN
                        ERROR(Text001);
                        IF Status=Status::Released THEN BEGIN
                        DocPrint.PrintPurchHeader(Rec);
                          END;*/

                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(75006, true, true, Rec)

                    end;
                }
                // action("&Print Works PRN1")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Print Detailed Works PRN';
                //     Ellipsis = true;
                //     Image = Print;
                //     Promoted = true;
                //     PromotedCategory = Process;

                //     trigger OnAction()
                //     begin
                //         /*IF Status<>Status::Released THEN
                //         ERROR(Text001);
                //         IF Status=Status::Released THEN BEGIN
                //         DocPrint.PrintPurchHeader(Rec);
                //           END;*/

                //         Rec.SetRange("No.", Rec."No.");
                //         Report.Run(75006, true, true, Rec)

                //     end;
                // }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.Page.SetFilterOnWorkflowRecord(Rec.RecordId);
        //   if (Rec.Status = Rec.Status::"Pending Approval") then begin
        //     CurrPage.Editable := false;
        //  end;
    end;

    trigger OnAfterGetRecord()
    begin
        JobQueueVisible := Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting";
        SetControlAppearance;

        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."Procurement Type" := 'WORKS';
        //
        // if (Rec.Status = Rec.Status::"Pending Approval") then begin
        //     CurrPage.Editable := false;
        //end;

        PurchaseCode := false;
        // if ((Rec.Status = Rec.Status::"Pending Approval") or (Rec.Status = Rec.Status::Released)) then begin
        //     PurchaseCode := true;
        // end;
        Config := true;
        if (Rec.Status = Rec.Status::Released) then begin
            Config := false;
        end;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord;
        exit(Rec.ConfirmDeletion);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean

    begin
        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."PRN Type" := Rec."prn type"::"Project Works";
        Rec."Requisition Product Group" := Rec."requisition product group"::Works;
        Rec."Procurement Type" := 'WORKS';
        Rec."Procurement Plan ID" := ProcSetup."Effective Procurement Plan";
        rec."Requester ID" := UserId;

        if usersetup.get(UserId) then begin
            rec.Region := usersetup."Region Code";
            Rec."Shortcut Dimension 1 Code" := UserSetup."Region Code";
            rec."Request-By No." := usersetup."Employee No.";
            rec."Request-By Name" := usersetup."Employee Name"
            ;

            PurchSetup.get;
            PurchSetup.testfield("Effective Procurement Plan");
            rec."Procurement Plan ID" := PurchSetup."Effective Procurement Plan";
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ///
        //"Responsibility Center" := UserMgt.GetPurchasesFilter;

        Rec."Requisition Type" := Rec."requisition type"::Project;
        Rec."Document Type" := Rec."document type"::"Purchase Requisition";
        Rec."PRN Type" := Rec."prn type"::"Project Works";
        Rec."Requisition Product Group" := Rec."requisition product group"::Works;
        Rec."Procurement Type" := 'WORKS';
        Rec."Procurement Plan ID" := ProcSetup."Effective Procurement Plan";
        rec."Requester ID" := UserId;
        Rec."Buy-from Vendor No." := 'VEND01186';

        if usersetup.get(UserId) then begin
            rec.Region := usersetup."Region Code";
            Rec."Shortcut Dimension 1 Code" := UserSetup."Region Code";
            rec."Request-By No." := usersetup."Employee No.";
            rec."Request-By Name" := usersetup."Employee Name"
            ;
            if emp.get(UserSetup."Employee No.") then begin
                rec."Directorate Code" := emp."Directorate Code";
                rec."Department Code" := emp."Department Code";
            end;

            PurchSetup.get;
            PurchSetup.testfield("Effective Procurement Plan");
            rec."Procurement Plan ID" := PurchSetup."Effective Procurement Plan";
        end;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    var
        PurchSetup: Record "Procurement Setup";
    begin
        PurchaseCode := false;
        if (Rec.Status = Rec.Status::Released) then begin
            PurchaseCode := true;
        end;
        rec."Requester ID" := UserId;

        if usersetup.get(UserId) then begin
            rec.Region := usersetup."Region Code";
            Rec."Shortcut Dimension 1 Code" := UserSetup."Region Code";
            rec."Request-By No." := usersetup."Employee No.";
            rec."Request-By Name" := usersetup."Employee Name"
            ;
            if emp.get(UserSetup."Employee No.") then begin
                rec."Directorate Code" := emp."Directorate Code";
                rec."Department Code" := emp."Department Code";
            end;

            PurchSetup.get;
            PurchSetup.testfield("Effective Procurement Plan");
            rec."Procurement Plan ID" := PurchSetup."Effective Procurement Plan";
        end;
        PurchaseCode := false;
        if ((Rec.Status = Rec.Status::"Pending Approval") or (Rec.Status = Rec.Status::Released)) then begin
            PurchaseCode := true;
        end;
        Config := true;
        if (Rec.Status = Rec.Status::Released) then begin
            Config := false;
        end;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        // IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
        //  FILTERGROUP(2);
        //  SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
        //  FILTERGROUP(0);
        // END;
        rec."Requester ID" := UserId;

        if usersetup.get(UserId) then begin
            rec.Region := usersetup."Region Code";
            Rec."Shortcut Dimension 1 Code" := UserSetup."Region Code";
            rec."Request-By No." := usersetup."Employee No.";
            rec."Request-By Name" := usersetup."Employee Name"
            ;
            if emp.get(UserSetup."Employee No.") then begin
                rec."Directorate Code" := emp."Directorate Code";
                rec."Department Code" := emp."Department Code";
            end;

            PurchSetup.get;
            PurchSetup.testfield("Effective Procurement Plan");
            rec."Procurement Plan ID" := PurchSetup."Effective Procurement Plan";
        end;
        // if (Rec.Status = Rec.Status::"Pending Approval") then begin
        //    CurrPage.Editable := false;
        //   end;

        PurchaseCode := false;
        if ((Rec.Status = Rec.Status::"Pending Approval") or (Rec.Status = Rec.Status::Released)) then begin
            PurchaseCode := true;
        end;
        Config := true;
        if (Rec.Status = Rec.Status::Released) then begin
            Config := false;
        end;
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        CopyPurchDoc: Report "Copy Purchase Document";
        MoveNegPurchLines: Report "Move Negative Purchase Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        emp: record Employee;
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        [InDataSet]

        JobQueueVisible: Boolean;
        PurchSetupRec: Record "Purchases & Payables Setup";
        ItemJnlTemplate: Record "Item Journal Template";
        PurchSetup: Record "Procurement Setup";
        ItemJnlBatch: Record "Item Journal Batch";
        ItemJnlLine: Record "Item Journal Line";
        StoreReqHeader: Record "Purchase Header";
        ProcSetup: Record "Procurement Setup";
        StoreReqLine: Record "Purchase Line";
        ItemGnl: Record "Item Journal Line";
        Config: Boolean;
        RequisitionLine: Record "Purchase Line";
        Linenumber: Integer;
        Req: Record "Purchase Header";
        AvailableBudget: Decimal;
        Commitment: Codeunit "Procurement Processing";
        DeleteCommitment: Record "Commitment Entries1";
        s: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        //   ProcSetup: Record "Procurement Setup";
        PurchaseCode: Boolean;
        EmailObj: Codeunit Email;

        EmailMsg: Codeunit "Email Message";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        SalespersonPurch: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        Email2: Code[50];
        Body: Code[150];
        SMTP: Codeunit Mail;
        UserSetup: Record "User Setup";
        ProgressWindow: Dialog;
        contractPeriod: Integer;
        RMSMgt: Codeunit "RMS Management";
        RowNo: Integer;
        ProcProcess: Codeunit "Procurement Processing";
        DocTemplateLine: Record "Procurement Doc Template Line";
        ContractIssuanceDocs: Record "Contract Issuance Requirements";
        ProcurementSetup: Record "Procurement Setup";
        Mergefiles: Codeunit MergeCurriculum;



    procedure SendMail()
    var
        TxtDefaultCCMailList: List of [Text];
        TxtDefaultBCCMailList: List of [Text];
        TxtReceipientsList: List of [Text];
        AttachmentTempBlob: Codeunit "Temp Blob";
        AttachmentIntStream: instream;
        FileMgt: Codeunit "File Management";

    begin
        TxtReceipientsList.Add('Charlescheptumo@dynasoft.co.ke');
        TxtDefaultCCMailList.Add('mohancharlz@gmail.com');
        TxtDefaultBCCMailList.Add('');

        EmailMsg.Create(TxtReceipientsList, 'This is a test', 'Alaaaaaaaaaaaaa', false, TxtDefaultCCMailList,
            TxtDefaultBCCMailList
        );
        /* 
        //Attachment
        FileMgt.BLOBImportFromServerFile(
            AttachmentTempBlob,
            'C:\DATABASE\AL\Picture6.pdf'
        );
        AttachmentTempBlob.CreateInStream(AttachmentIntStream);
        //attachment Function
        emailMsg.AddAttachment(
            'Picture6.pdf',
            'Pdf',
         AttachmentIntStream
        );
         */


        EmailObj.Send(EmailMsg, Enum::"Email Scenario"::"Sales Invoice");
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        //OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        if Rec.Status <> Rec.Status::Open then
        CurrPage.Editable(false);

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
    end;

    procedure GenerateTemplate(filename: Text; Project_ID: Text; Document_No: Text; mainContractor: Text; contractsum: Decimal; period: Integer)
    var
    // "**mscorlib**": Integer;
    // sb: dotnet StringBuilder;
    // stream: dotnet StreamWriter;
    // str: dotnet Stream;
    // ascii: dotnet Encoder;
    // "**System**": Integer;
    // uriObj: dotnet Uri;
    // lgRequest: dotnet HttpWebRequest;
    // lgResponse: dotnet HttpWebResponse;
    // reader: dotnet XmlTextReader;
    // document: dotnet XmlDocument;
    // credentials: dotnet CredentialCache;
    begin


        // sb:=sb.StringBuilder();
        // sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
        // sb.Append('<soapenv:Header/>');
        // sb.Append('<soapenv:Body>');
        // sb.Append('<tem:GenerateCert>');
        // sb.Append('<tem:filename>'+filename+'</tem:filename>');
        // sb.Append('<tem:Project_ID>'+Project_ID+'</tem:Project_ID>');
        // sb.Append('<tem:Document_No>'+Document_No+'</tem:Document_No>');
        // //sb.Append('<tem:mainContractor>'+mainContractor+'</tem:mainContractor>');
        // // sb.Append('<tem:contractVal>'+FORMAT(contractsum)+'</tem:contractVal>');
        // // sb.Append('<tem:period>'+FORMAT(period)+'</tem:period>');
        // sb.Append('</tem:GenerateCert>');
        // sb.Append('</soapenv:Body>');
        // sb.Append('</soapenv:Envelope>');


        // uriObj:= uriObj.Uri('http://192.168.1.87:7048/KeRRAExcel.asmx');
        // lgRequest:= lgRequest.CreateDefault(uriObj);
        // lgRequest.Method:= 'POST';
        // lgRequest.ContentType :='text/xml';
        // lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/GenerateCert');
        // lgRequest.Credentials:=credentials.DefaultCredentials;
        // lgRequest.Timeout:=120000;
        // stream:=stream.StreamWriter(lgRequest.GetRequestStream());
        // stream.Write(sb.ToString());
        // stream.Close();
        // lgResponse:=lgRequest.GetResponse();
    end;
}

#pragma implicitwith restore

