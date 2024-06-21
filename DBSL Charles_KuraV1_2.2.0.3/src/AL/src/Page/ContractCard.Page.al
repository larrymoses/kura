
Page 75284 "Contract Card"
{
    PageType = Card;
    SourceTable = "Purchase Header";
    UsageCategory = Documents;
    DeleteAllowed =false;
    PromotedActionCategories = 'New,Process,Report,Contract,Request Approval,Print,Release,Navigate,Implementation Committee';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Description"; Rec."Contract Description")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notice of Award No."; Rec."Notice of Award No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Proffesion Opinion No"; Rec."Proffesion Opinion No")
                {
                    ApplicationArea = Basic;
                }
                field("Awarded Bid No"; Rec."Awarded Bid No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Negotiated Exchange Rate"; Rec."Negotiated Exchange Rate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Award Tender Sum Inc Taxes"; Rec."Award Tender Sum Inc Taxes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Award Tender Sum Inc Taxes (KES)';
                    Visible = false;
                }
                field("Award Tender Sum Incl Taxes(FC"; Rec."Award Tender Sum Incl Taxes(FC")
                {
                    ApplicationArea = Basic;
                    Caption = 'Award Tender Sum Incl Taxes(FCY)';
                    Visible = false;
                }
                field("Bid Sum 1"; Rec."Bid Sum 1")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Bid Sum 2"; Rec."Bid Sum 2")
                {
                    Caption ='Bid Sum';
                    ApplicationArea = Basic;
                }
                field("Total Invoiced"; Rec."Total Invoiced")
                {
                    ApplicationArea = Basic;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Procuring Entity (PE) Name"; Rec."Procuring Entity (PE) Name")
                {
                    ApplicationArea = Basic;
                }
                field("PE Representative"; Rec."PE Representative")
                {
                    ApplicationArea = Basic;
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = Basic;
                }
                field("Acceptance Letter Ref"; Rec."Acceptance Letter Ref")
                {
                    ApplicationArea = Basic;
                }
                field("Acceptance Letter Date"; Rec."Acceptance Letter Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Implementation Team";Rec."Contract Implementation Team")
                {
                  ApplicationArea = Basic;  
                }
            }
            group("Contractor Details")
            {
                Caption = 'Contractor Details';
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ApplicationArea = Suite;
                    Caption = 'Vendor No.';
                    Importance = Additional;
                    NotBlank = true;
                    ToolTip = 'Specifies the number of the vendor who delivers the products.';

                    trigger OnValidate()
                    begin
                        Rec.OnAfterValidateBuyFromVendorNo(Rec, xRec);
                        CurrPage.Update;
                    end;
                }
                field("Buy-from Vendor Name"; Rec."Buy-from Vendor Name")
                {
                    ApplicationArea = Suite;
                    Caption = 'Vendor Name';
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the vendor who delivers the products.';

                    trigger OnValidate()
                    begin
                        Rec.OnAfterValidateBuyFromVendorNo(Rec, xRec);

                        CurrPage.Update;
                    end;
                }
                field("PP Preference/Reservation Code";"PP Preference/Reservation Code")
                {
                   ApplicationArea = Basic; 
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tax Registration (PIN)';
                }
                field("Buy-from Address"; Rec."Buy-from Address")
                {
                    ApplicationArea = Suite;
                    Caption = 'Address';
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the address of the vendor who ships the items.';
                }
                field("Buy-from Address 2"; Rec."Buy-from Address 2")
                {
                    ApplicationArea = Suite;
                    Caption = 'Address 2';
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Buy-from Post Code"; Rec."Buy-from Post Code")
                {
                    ApplicationArea = Suite;
                    Caption = 'Post Code';
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Buy-from City"; Rec."Buy-from City")
                {
                    ApplicationArea = Suite;
                    Caption = 'City';
                    Importance = Additional;
                    QuickEntry = false;
                    ToolTip = 'Specifies the city of the vendor who ships the items.';
                }
                field("Buy-from Contact No."; Rec."Buy-from Contact No.")
                {
                    ApplicationArea = Suite;
                    Caption = 'Contact No.';
                    Importance = Additional;
                    ToolTip = 'Specifies the number of your contact at the vendor.';
                }
                field("Buy-from Country/Region Code"; Rec."Buy-from Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Country';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Project Details")
            {
                Editable = true;
                field("Variation of Price %"; Rec."Variation of Price %")
                {
                    ApplicationArea = Basic;
                }
                field("Contingency Rate"; Rec."Contingency Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Advance Payment Rate"; Rec."Advance Payment Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Estimate (LCY)"; Rec."Engineer Estimate (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Upgrading Works Contract Sum"; Rec."Upgrading Works Contract Sum")
                {
                    ApplicationArea = Basic;
                }
                field("PBRM Works Contract Sum"; Rec."PBRM Works Contract Sum")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Sum"; Rec."Contract Sum")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Contract Sum';
                    Editable = false;
                }
                field("Max Works Kickoff Duration"; Rec."Max Works Kickoff Duration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Works Commencement Order (After Contract/Order)';
                    Editable = false;
                    Visible = false;
                }
                field("Max Works Charter Duration"; Rec."Max Works Charter Duration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Variation of Works %"; Rec."Variation of Works %")
                {
                    ApplicationArea = Basic;
                }
                field("Variation of Works Amount"; Rec."Variation of Works Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Commencement Date"; Rec."Engineer Commencement Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Engineer''s Order to Commence';
                }
                field("Commencement Date"; Rec."Commencement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Max Works Completion Duration"; Rec."Max Works Completion Duration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Works Duration';
                    Editable = true;
                    Visible = true;
                }
                field("Time Of Completion"; Rec."Time Of Completion")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Completion';
                    Visible = true;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = basic;

                }
                field("Defects Liability Period"; Rec."Defects Liability Period")
                {
                    ApplicationArea = Basic;
                }
                field("Daily Liquidated Dam Unit Cost"; Rec."Daily Liquidated Dam Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Liquidated Damages Limit %"; Rec."Liquidated Damages Limit %")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Retention %"; Rec."Payment Retention %")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Amount Limit %"; Rec."Retention Amount Limit %")
                {
                    ApplicationArea = Basic;
                }
                field("Min Interim Certificate Amount"; Rec."Min Interim Certificate Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            part(PurchLines; "Contract Lines Subform")
            {
                ApplicationArea = Suite;
                Caption = 'Bill of Quantities';
                Editable = Rec."Buy-from Vendor No." <> '';
                Enabled = Rec."Buy-from Vendor No." <> '';
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
            part(Control68; "Purchase Contract Payment Term")
            {
                Caption = 'Contract Payments';
                SubPageLink = "No." = field("No.");
            }
            part(Control90; "Bid Securities")
            {
                Caption = 'Guarantees';
                SubPageLink = "No." = field("No."),
                              "Vendor No." = field("Buy-from Vendor No."),
                              "IFS No" = field("IFS Code");
            }
            part(Control99; "Contract Currencies")
            {
                SubPageLink = "Document No" = field("No.");
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(38),
                              "No." = field("No.")
                 , "Document Type" = field("Document Type");
            }
            part(Control30; "Pending Approval FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "Table ID" = const(38),
                              "Document Type" = field("Document Type"),
                              "Document No." = field("No.");
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Suite;
                Visible = false;
            }
            part(Control9; "Vendor Details FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Buy-from Vendor No.");
            }
            part(Control8; "Vendor Statistics FactBox")
            {
                ApplicationArea = Suite;
                SubPageLink = "No." = field("Pay-to Vendor No.");
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control5; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control4; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action(Statistics)
                {
                    ApplicationArea = Suite;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';

                    trigger OnAction()
                    begin
                        Rec.OpenPurchaseOrderStatistics;
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action(Card)
                {
                    ApplicationArea = Suite;
                    Caption = 'Card';
                    Image = EditLines;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Vendor Card";
                    RunPageLink = "No." = field("Buy-from Vendor No.");
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'View or edit detailed information about the vendor on the purchase document.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Suite;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category8;
                    RunObject = Page "Purch. Comment Sheet";
                    RunPageLink = "Document Type" = const("Blanket Order"),
                                  "No." = field("No."),
                                  "Document Line No." = const(0);
                    ToolTip = 'View or add comments for the record.';
                }
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
                    begin
                        WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, Database::"Purchase Header", Rec."Document Type", Rec."No.");
                    end;
                }
                action(AttachDocuments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attach Document';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        DMSManagement.UploadStandardContractDocuments(Rec."No.", 'Standard Contract', Rec.RecordId, Rec.Region);
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attach Contract Documents';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category8;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                    Visible = false;

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
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
                    ToolTip = 'Reject the approval request.';
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
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //   ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(Lock)
            {
                Caption = 'Lock';
                action(LockContract)
                {
                    ApplicationArea = Service;
                    Caption = '&Lock Contract';
                    Image = Lock;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Make sure that the changes will be part of the contract.';
                    Visible = false;

                    trigger OnAction()
                    var
                        LockOpenServContract: Codeunit "Lock-OpenServContract";
                    begin
                        CurrPage.Update;
                        //LockOpenServContract.LockServContract(Rec);
                        CurrPage.Update;
                    end;
                }
                action(OpenContract)
                {
                    ApplicationArea = Service;
                    Caption = '&Open Contract';
                    Image = ReOpen;
                    ToolTip = 'Open the service contract.';
                    Visible = false;

                    trigger OnAction()
                    var
                        LockOpenServContract: Codeunit "Lock-OpenServContract";
                    begin
                        CurrPage.Update;
                        //LockOpenServContract.OpenServContract(Rec);
                        CurrPage.Update;
                    end;
                }
                action(SignContract)
                {
                    ApplicationArea = Service;
                    Caption = 'Si&gn Contract';
                    Image = Signature;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Confirm the contract.';

                    trigger OnAction()
                    var
                        SignServContractDoc: Codeunit SignServContractDoc;
                    begin
                        CurrPage.Update;
                        Rec.TestField(Status, Rec.Status::Released);
                        if Confirm('Are you sure to mark the contract as Signed ?', true) then begin
                            Rec."Contract Status" := Rec."contract status"::Signed;
                            //SignServContractDoc.SignContract(Rec);
                            CurrPage.Close;
                        end;
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CalculateInvoiceDiscount)
                {
                    AccessByPermission = TableData "Vendor Invoice Disc." = R;
                    ApplicationArea = Suite;
                    Caption = 'Calculate &Invoice Discount';
                    Image = CalculateInvoiceDiscount;
                    ToolTip = 'Calculate the invoice discount for the entire purchase invoice.';
                    Visible = false;

                    trigger OnAction()
                    begin
                        ApproveCalcInvDisc;
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                separator(Action49)
                {
                }
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Enabled = Rec."No." <> '';
                    Image = CopyDocument;
                    ToolTip = 'Copy document lines and header information from another sales document to this document. You can copy a posted sales invoice into a new sales invoice to quickly create a similar document.';

                    trigger OnAction()
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RunModal;
                        Clear(CopyPurchDoc);
                    end;
                }
                action("Archi&ve Document")
                {
                    ApplicationArea = Suite;
                    Caption = 'Archi&ve Document';
                    Image = Archive;
                    ToolTip = 'Archive Document.';

                    trigger OnAction()
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.Update(false);
                    end;
                }
                action(Release)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.';

                    trigger OnAction()
                    var
                    //  ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //  ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    Caption = 'Re&open';
                    Enabled = Rec.Status <> Rec.Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed';

                    trigger OnAction()
                    var
                    //   ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //   ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                action("Project Vendors")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Contractors';
                    Image = VendorContact;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Project Vendors";
                    RunPageLink = "Contract No" = field("No.");
                }
                action("Contract Representative")
                {
                    ApplicationArea = Basic;
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Contract Representative";
                    RunPageLink = "No." = field("No.");
                }
                action("Contract Payment Terms")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract Payments';
                    Image = PaymentPeriod;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Contract Payment Term";
                    RunPageLink = "No." = field("No.");
                }
                action("Contract Milestone")
                {
                    ApplicationArea = Basic;
                    Image = PlanningWorksheet;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Contract Milestone";
                    RunPageLink = "No." = field("No.");
                }
                action("Contract Documents")
                {
                    ApplicationArea = Basic;
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Contract Issuance Requirements";
                    RunPageLink = "Document ID" = field("No."),
                                  "Process Area" = const(Contract),
                                  "PRN No" = field("Requisition No");
                }
                action("Contract Securities")
                {
                    ApplicationArea = Basic;
                    Caption = 'Guarantees';
                    Image = SocialSecurity;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Bid_Contract Security Register";
                    RunPageLink = "No." = field("No."),
                                  "Vendor No." = field("Buy-from Vendor No."),
                                  "IFS No" = field("IFS Code");
                }
                action("Contract Insurance")
                {
                    ApplicationArea = Basic;
                    Image = Insurance;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Purchase Contract Insurance";
                    RunPageLink = "No." = field("No.");
                }
                action("Contract Signatories")
                {
                    ApplicationArea = Basic;
                    Image = SignUp;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Puchase Contract Signatories";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  No = field("No.");
                }
                action("Contract Circulation Team")
                {
                    ApplicationArea = Basic;
                    Image = SignUp;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Contract Circulation Team";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  No = field("No.");
                }
                action("Terminate Contract")
                {
                    ApplicationArea = Basic;
                    Image = SignUp;
                    Promoted = true;
                    PromotedCategory = Category4;
                    trigger OnAction()
                    var
                        ContractTermination: Record "Contract Termination";
                    begin
                        ContractTermination.Reset();
                        ContractTermination.SetRange("Contract No.", Rec."No.");
                        if ContractTermination.FindFirst() then
                            Page.Run(Page::"Contract Termination", ContractTermination)
                        else begin
                            ContractTermination.init();
                            ContractTermination.Validate("Contract No.", Rec."No.");
                            if ContractTermination.insert(true) then
                                Page.Run(Page::"Contract Termination", ContractTermination);
                        end;
                    end;
                }
                action("Contract Sub Clauses")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Contract Sub Clauses";
                    RunPageLink = "Contract No" = field("No.");
                }
                action("Notice of Award")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Notice of Award Card";
                    RunPageLink = Code = field("Notice of Award No.");
                }
                action("Contract Required Documents")
                {
                    Caption = 'Documents Required';
                    ApplicationArea = Basic;
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Contract Required Documents";
                    RunPageLink = "Document No." = field("No.");
                }
                action("Professional Opinion")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "IFS Tender Summary Card";
                    RunPageLink = Code = field("Proffesion Opinion No");
                }
                action("Evaluation Report")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Final Evaluation Report Card";
                    RunPageLink = Code = field("Final Evaluation Report");
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  if ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) then
                        //   ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Cancel the approval request.';

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //  ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
            }
            action(MakeOrder)
            {
                ApplicationArea = Suite;
                Caption = 'Make &Order';
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Convert the blank purchase order to a purchase order.';

                trigger OnAction()
                var
                //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // if ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) then
                    //    Codeunit.Run(Codeunit::"Blnkt Purch Ord. to Ord. (Y/N)",Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Suite;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    ;
                    Report.Run(70046, true, true, Rec);
                end;
            }
            action("Print Agreement")
            {
                ApplicationArea = Suite;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                ToolTip = 'Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.';

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    ;
                    Report.Run(70052, true, true, Rec);
                end;
            }
            action("Notify Contract Team")
            {
                ApplicationArea = Suite;
                Image = SendEmailPDF;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Procurement.FnNotifyContractCirculationTeam(Rec);
                    Message('Contract Circulation Team Notified SuccessFully');
                end;
            }
            action("Generate Contract Document")
            {
                ApplicationArea = Basic;
                Image = PrintAttachment;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                var
                    FileName: Text;
                    FileDirectory: Text;
                begin
                    if Confirm('Are you sure to generate the Contract Documents?', true) then begin
                        fngeneratepersonnel();
                        fngenerateAwardLetter();
                        fngenerateFormofAgreement();
                        fngeneratePOP();
                        Message('Contract Documents Generated Successfully');
                    end;
                end;
            }
            action("Merge Contract Document")
            {
                ApplicationArea = Basic;
                Image = PrintAttachment;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                var
                    FileName: Text;
                    FileDirectory: Text;
                begin
                    if Confirm('Are you sure to merge the Contract Documents ?', true) then begin
                        GenerateContract();
                    end;
                end;
            }
            action(Committee)
                {
                    ApplicationArea = Suite;
                    Caption = 'Evaluation Committee';
                    Ellipsis = true;
                    Image = ResourceGroup;
                    Promoted = true;
                    PromotedCategory = Category9;
                     RunObject = Page "Bid Evaluation Committee";
                    RunPageLink = "Document No." = field("No."),Type=const(Contract);
                }
            action(CommitteeReport)
            {
                ApplicationArea = Suite;
                Caption = 'Committee Report';
                Ellipsis = true;
                Image = ResourceGroup;
                Promoted = true;
                PromotedCategory = Category9;
                trigger onAction()
                var
                    PHeader: Record "Purchase Header";
                begin
                    PHeader.Reset();
                    PHeader.SetRange("No.", Rec."No.");
                    if PHeader.findfirst() then
                        Report.Run(Report::"CIT Report",true,true, PHeader);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CalcFields("Total Invoiced");
        Rec.Balance := Rec."Award Tender Sum Inc Taxes" - Rec."Total Invoiced";
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Total Invoiced");
        Rec.Balance := Rec."Award Tender Sum Inc Taxes" - Rec."Total Invoiced";
    end;

    trigger OnOpenPage()
    begin
        Rec.CalcFields("Total Invoiced");
        Rec.Balance := Rec."Award Tender Sum Inc Taxes" - Rec."Total Invoiced";
        if Rec."Contract Status" = Rec."contract status"::Signed then begin
            CurrPage.Editable := false;
        end;
    end;

    var
        CopyPurchDoc: Report "Copy Purchase Document";
        DocPrint: Codeunit "Document-Print";
        UserMgt: Codeunit "User Setup Management";
        ArchiveManagement: Codeunit ArchiveManagement;
        PurchCalcDiscByType: Codeunit "Purch - Calc Disc. By Type";
        ChangeExchangeRate: Page "Change Exchange Rate";
        DocNoVisible: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        Procurement: Codeunit "Procurement Processing";
        MergePDF: Codeunit MergeCurriculum;
        FileDirectory: Text;
        Statuses: Text[250];
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName: Text;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.PurchLines.Page.ApproveCalcInvDisc;
    end;

    local procedure PurchaserCodeOnAfterValidate()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.PurchLines.Page.UpdateForm(true);
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.Update;
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.PurchaseDocumentNoIsVisible(Doctype::"Blanket Order", Rec."No.");
    end;

    local procedure SetControlAppearance()
    var
    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        // OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);

        // CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);
    end;

    procedure fngeneratepersonnel()
    var
        PurchaseHead: Record "Purchase Header";
        ContractIssuanc: Record "Contract Issuance Requirements";
        DocNo: Code[10];
        DocDesc: Text[2000];
        ProcurementDoc: Record "Procurement Document Type";
        ProcurementSetups: Record "Procurement Setup";
        DocTemplateLine: Record "Procurement Doc Template Line";
        ContractIndex: Text[250];
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        licenseno: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        MergePDF: Codeunit MergeCurriculum;
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName1: Text;
        FileName2: Text;
        FileName3: Text;
        FileName4: Text;
        FileName5: Text;
        FileName6: Text;
        FileName7: Text;
        FileName8: Text;
        FileName61: Text;
        FileName71: Text;
        FileName62: Text;
        FileDirectoryX1: Text;
        FileNameX1: Text;
        FileDirectory1: Text;
        FileName31: Text;
        FileName41: Text;
        FileName51: Text;
        FileName66: Text;
        FileName76: Text;
        FileDirectory: Text;
        TestFile: File;
        Statuses: Text[250];
        FileName: Text;
        indec: Text[20];
    begin

        // ProcurementSetups.Get;
        // DocNo := 'PLANT';
        // DocTemplateLine.Reset;
        // DocTemplateLine.SetRange("Template ID", ProcurementSetups."Default Procurement Template");
        // DocTemplateLine.SetRange("Procurement Document Type", DocNo);
        // DocTemplateLine.SetRange("Part of Contract Document", true);
        // if DocTemplateLine.FindFirst then
        //     DocDesc := DocTemplateLine.Description;
        // if DocTemplateLine."Contract Index" < 10 then begin
        //     ContractIndex := '0' + Format(DocTemplateLine."Contract Index");
        // end else begin
        //     ContractIndex := Format(DocTemplateLine."Contract Index");
        // end;
        // // DocDesc:=CONVERTSTR(DocDesc,':','_');
        // DocDesc:=CONVERTSTR(DocDesc,'\','_');
        // DocDesc:=CONVERTSTR(DocDesc,'/','_');
        // FileDirectoryX := 'C:\SCM\Contract\' + "Requisition No" + '\';
        // FileNameX := "Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        // if FILE.Exists(FileDirectoryX + FileNameX) then
        //     FILE.Erase(FileDirectoryX + FileNameX);//51217
        // FileDirectory := 'C:\SCM\Contract\' + "Requisition No" + '\';
        // FileName := "Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        // PurchaseHead.Reset;
        // PurchaseHead.SetRange("Document Type", PurchaseHead."document type"::Quote);
        // PurchaseHead.SetRange("No.", "Awarded Bid No");
        // if PurchaseHead.FindSet then begin
        //     //MESSAGE('Done%1 on %2',PurchaseHead."No.",FileName);
        //     Report.SaveAsPdf(75011, FileDirectory + FileName, PurchaseHead);
        // end;
    end;

    procedure fngenerateAwardLetter()
    var
        PurchaseHead: Record "Purchase Header";
        ContractIssuanc: Record "Contract Issuance Requirements";
        DocNo: Code[10];
        DocDesc: Text[2000];
        ProcurementDoc: Record "Procurement Document Type";
        ProcurementSetups: Record "Procurement Setup";
        DocTemplateLine: Record "Procurement Doc Template Line";
        ContractIndex: Text[250];
        //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        licenseno: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        MergePDF: Codeunit MergeCurriculum;
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName1: Text;
        FileName2: Text;
        FileName3: Text;
        FileName4: Text;
        FileName5: Text;
        FileName6: Text;
        FileName7: Text;
        FileName8: Text;
        FileName61: Text;
        FileName71: Text;
        FileName62: Text;
        FileDirectoryX1: Text;
        FileNameX1: Text;
        FileDirectory1: Text;
        FileName31: Text;
        FileName41: Text;
        FileName51: Text;
        FileName66: Text;
        FileName76: Text;
        FileDirectory: Text;
        TestFile: File;
        Statuses: Text[250];
        FileName: Text;
        BidTabulationHeader: Record "Bid Tabulation Header";
    begin

        // ProcurementSetups.Get;
        // DocNo := 'AWARD';
        // DocTemplateLine.Reset;
        // DocTemplateLine.SetRange("Template ID", ProcurementSetups."Default Procurement Template");
        // DocTemplateLine.SetRange("Procurement Document Type", DocNo);
        // DocTemplateLine.SetRange("Part of Contract Document", true);
        // if DocTemplateLine.FindFirst then
        //     DocDesc := DocTemplateLine.Description;
        // if DocTemplateLine."Contract Index" < 10 then begin
        //     ContractIndex := '0' + Format(DocTemplateLine."Contract Index");
        // end else begin
        //     ContractIndex := Format(DocTemplateLine."Contract Index");
        // end;
        // DocDesc := ConvertStr(DocDesc, ':', '_');
        // DocDesc := ConvertStr(DocDesc, '\', '_');
        // DocDesc := ConvertStr(DocDesc, '/', '_');
        // FileDirectoryX := 'C:\SCM\Contract\' + "Requisition No" + '\';
        // FileNameX := "Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        // if FILE.Exists(FileDirectoryX + FileNameX) then
        //     FILE.Erase(FileDirectoryX + FileNameX);//51217
        // FileDirectory := 'C:\SCM\Contract\' + "Requisition No" + '\';
        // FileName := "Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        // BidTabulationHeader.Reset;
        // BidTabulationHeader.SetRange("Document Type", BidTabulationHeader."document type"::"Notice of Award");
        // BidTabulationHeader.SetRange(Code, "Notice of Award No.");
        // if BidTabulationHeader.FindSet then begin
        //     //MESSAGE('Done%1 on %2',BidTabulationHeader.Code,FileName);
        //     Report.SaveAsPdf(70044, FileDirectory + FileName, BidTabulationHeader);
        // end;
    end;

    procedure fngenerateFormofAgreement()
    var
        PurchaseHead: Record "Purchase Header";
        ContractIssuanc: Record "Contract Issuance Requirements";
        DocNo: Code[10];
        DocDesc: Text[2000];
        ProcurementDoc: Record "Procurement Document Type";
        ProcurementSetups: Record "Procurement Setup";
        DocTemplateLine: Record "Procurement Doc Template Line";
        ContractIndex: Text[250];
        //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        licenseno: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        MergePDF: Codeunit MergeCurriculum;
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName1: Text;
        FileName2: Text;
        FileName3: Text;
        FileName4: Text;
        FileName5: Text;
        FileName6: Text;
        FileName7: Text;
        FileName8: Text;
        FileName61: Text;
        FileName71: Text;
        FileName62: Text;
        FileDirectoryX1: Text;
        FileNameX1: Text;
        FileDirectory1: Text;
        FileName31: Text;
        FileName41: Text;
        FileName51: Text;
        FileName66: Text;
        FileName76: Text;
        FileDirectory: Text;
        TestFile: File;
        Statuses: Text[250];
        FileName: Text;
    begin

        // ProcurementSetups.Get;
        // DocNo := 'FOA';
        // DocTemplateLine.Reset;
        // DocTemplateLine.SetRange("Template ID", ProcurementSetups."Default Procurement Template");
        // DocTemplateLine.SetRange("Procurement Document Type", DocNo);
        // DocTemplateLine.SetRange("Part of Contract Document", true);
        // if DocTemplateLine.FindFirst then
        //     DocDesc := DocTemplateLine.Description;
        // if DocTemplateLine."Contract Index" < 10 then begin
        //     ContractIndex := '0' + Format(DocTemplateLine."Contract Index");
        // end else begin
        //     ContractIndex := Format(DocTemplateLine."Contract Index");
        // end;
        // DocDesc:=CONVERTSTR(DocDesc,':','_');
        // DocDesc:=CONVERTSTR(DocDesc,'\','_');
        // DocDesc:=CONVERTSTR(DocDesc,'/','_');
        // FileDirectoryX := 'C:\SCM\Contract\' + "Requisition No" + '\';
        // FileNameX := "Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        // if FILE.Exists(FileDirectoryX + FileNameX) then
        //     FILE.Erase(FileDirectoryX + FileNameX);//51217
        // FileDirectory := 'C:\SCM\Contract\' + "Requisition No" + '\';
        // FileName := "Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        // PurchaseHead.Reset;
        // //PurchaseHead.SETRANGE("Document Type",PurchaseHead."Document Type"::Quote);
        // PurchaseHead.SetRange("No.", "No.");
        // if PurchaseHead.FindSet then begin
        //     // MESSAGE('Done%1 on %2',PurchaseHead."No.",FileName);
        //     Report.SaveAsPdf(70115, FileDirectory + FileName, PurchaseHead);
        // end;
    end;

    local procedure GenerateContract()
    begin
        // //Contract
        // FileDirectoryX := 'C:\SCM\Contract\' + "Requisition No" + '\';
        // FileNameX := "Requisition No" + 'FinalContract.pdf';
        // if FILE.Exists(FileDirectoryX + FileNameX) then
        //     FILE.Erase(FileDirectoryX + FileNameX);
        // FileName := "Requisition No" + 'FinalContract.pdf';
        // Statuses := MergePDF.fnMergeConPdfs("Requisition No", FileName);
        // if Statuses = 'true' then begin
        //     Message('Contract Document merged Successfully');
        //     DMSManagement.CreateContractReportLink("No.", RecordId, "Requisition No");
        //     //EXIT(status);
        // end else begin
        //     Message('Documents not merged');
        // end;
    end;

    procedure fngeneratePOP()
    var
        PurchaseHead: Record "Purchase Header";
        ContractIssuanc: Record "Contract Issuance Requirements";
        DocNo: Code[10];
        DocDesc: Text[2000];
        ProcurementDoc: Record "Procurement Document Type";
        ProcurementSetups: Record "Procurement Setup";
        DocTemplateLine: Record "Procurement Doc Template Line";
        ContractIndex: Text[250];
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        Procurement: Codeunit "Procurement Processing";
        DMSDocuments: Record "DMS Documents";
        DMSManagement: Codeunit "DMS Management";
        licenseno: Boolean;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        MergePDF: Codeunit MergeCurriculum;
        FileDirectoryX: Text;
        FileNameX: Text;
        FileName1: Text;
        FileName2: Text;
        FileName3: Text;
        FileName4: Text;
        FileName5: Text;
        FileName6: Text;
        FileName7: Text;
        FileName8: Text;
        FileName61: Text;
        FileName71: Text;
        FileName62: Text;
        FileDirectoryX1: Text;
        FileNameX1: Text;
        FileDirectory1: Text;
        FileName31: Text;
        FileName41: Text;
        FileName51: Text;
        FileName66: Text;
        FileName76: Text;
        FileDirectory: Text;
        TestFile: File;
        Statuses: Text[250];
        FileName: Text;
        BidTabulationHeader: Record "Bid Tabulation Header";
    begin

        // ProcurementSetups.Get;
        // DocNo := 'POP';
        // DocTemplateLine.Reset;
        // DocTemplateLine.SetRange("Template ID", ProcurementSetups."Default Procurement Template");
        // DocTemplateLine.SetRange("Procurement Document Type", DocNo);
        // DocTemplateLine.SetRange("Part of Contract Document", true);
        // if DocTemplateLine.FindFirst then
        //     DocDesc := DocTemplateLine.Description;
        // if DocTemplateLine."Contract Index" < 10 then begin
        //     ContractIndex := '0' + Format(DocTemplateLine."Contract Index");
        // end else begin
        //     ContractIndex := Format(DocTemplateLine."Contract Index");
        // end;
        // DocDesc := ConvertStr(DocDesc, ':', '_');
        // DocDesc := ConvertStr(DocDesc, '\', '_');
        // DocDesc := ConvertStr(DocDesc, '/', '_');
        // FileDirectoryX := 'C:\SCM\Contract\' + "Requisition No" + '\';
        // FileNameX := "Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        // if FILE.Exists(FileDirectoryX + FileNameX) then
        //     FILE.Erase(FileDirectoryX + FileNameX);//51217
        // FileDirectory := 'C:\SCM\Contract\' + "Requisition No" + '\';
        // FileName := "Requisition No" + '_' + ContractIndex + '_' + DocNo + '_' + DocDesc + '.pdf';
        // BidTabulationHeader.Reset;
        // BidTabulationHeader.SetRange("Document Type", BidTabulationHeader."document type"::"Professional Opinion");
        // BidTabulationHeader.SetRange(Code, "Proffesion Opinion No");
        // if BidTabulationHeader.FindSet then begin
        //     //MESSAGE('Done%1 on %2',BidTabulationHeader.Code,FileName);
        //     Report.SaveAsPdf(70055, FileDirectory + FileName, BidTabulationHeader);
        // end;
    end;
}



