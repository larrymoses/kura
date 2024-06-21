#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72502 "Contractor Payment Request"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";
    PopulateAllFields = true;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("IPC Number"; Rec."IPC Number")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Code"; Rec."Milestone Code")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = FALSE;
                }
                FIELD("Advance Request No"; Rec."Advance Request No")
                {
                    ApplicationArea = BASIC;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funder Name"; Rec."Funder Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Contract Sum"; Rec."Contract Sum")
                {
                    ApplicationArea = Basic;
                }
                field("Contractor Request Cert Amount"; Rec."Contractor Request Cert Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Rejection Remarks"; Rec."Rejection Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Date"; Rec."Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Sent for Approval"; Rec."Date Sent for Approval")
                {
                    ApplicationArea = Basic;
                }
                field("Date Approved"; Rec."Date Approved")
                {
                    ApplicationArea = Basic;
                }
                field("Invoice No"; Rec."Invoice No")
                {
                    ApplicationArea = Basic;
                }
                field("Certified Amount"; Rec."Certified Amount")
                {
                    ApplicationArea = Basic;
                }
                field("PV Number"; Rec."PV Number")
                {
                    ApplicationArea = Basic;
                }
                field("Settled Amount"; Rec."Settled Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control32; "Contractor Request Task Lines")
            {
                Caption = 'Bill Categories';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Job No." = field("Project ID");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                Editable = false;
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Constituency ID"; Rec."Constituency ID")
                {
                    ApplicationArea = Basic;
                }
                field("County ID"; Rec."County ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Section No."; Rec."Road Section No.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Section Start Chainage"; Rec."Section Start Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Section End Chainage"; Rec."Section End Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Total  Section Length (KMs)"; Rec."Total  Section Length (KMs)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(72188),
                              "No." = FIELD("Document No.");
            }
            systempart(Control55; Links)
            {
            }
            systempart(Control57; Notes)
            {
            }
        }
    }
    actions
    {
        area(navigation)
        {
            action("Suggest Lines")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    // RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
                    // RMSManagement.FnPopulateMaterialsOnSite(Rec);
                    Message('Lines Suggested successfully.Please proceed to process.');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = SuggestElectronicDocument;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                    Message('The document %1 has been reopened successfully', Rec."Document No.");
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = Approve;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                    Message('The document %1 has been released successfully', Rec."Document No.");
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Generate Payment Certificate';
                Image = PostBatch;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField(Posted, false);
                    //Update the job planning lines
                    ContractorRequestPlanLine.Reset;
                    ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Document Type", Rec."Document Type");
                    ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Document No", Rec."Document No.");
                    ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Job No.", Rec."Project ID");
                    ContractorRequestPlanLine.SetFilter(ContractorRequestPlanLine."Qty. to Order", '>%1', 0);
                    if ContractorRequestPlanLine.FindSet then begin
                        repeat
                            JobPlanningLine.Reset;
                            JobPlanningLine.SetRange(JobPlanningLine."Job No.", Rec."Project ID");
                            JobPlanningLine.SetRange(JobPlanningLine."Job Task No.", ContractorRequestPlanLine."Job Task No.");
                            JobPlanningLine.SetRange(JobPlanningLine."Line No.", ContractorRequestPlanLine."Line No.");
                            if JobPlanningLine.FindSet then
                                JobPlanningLine."Qty. to Order" := ContractorRequestPlanLine."Qty. to Order";
                            JobPlanningLine.Modify(true);
                        until ContractorRequestPlanLine.Next = 0;
                    end;

                    //Create Invoice Header
                    PurchasesPayablesSetup.Get;
                    PurchaseHeader.Init;
                    PurchaseHeader."Document Type" := PurchaseHeader."document type"::Invoice;
                    PurchaseHeader."No." := NoSeriesManagement.GetNextNo(PurchasesPayablesSetup."Invoice Nos.", Today, true);
                    PurchaseHeader."Buy-from Vendor No." := Rec."Contractor No";
                    PurchaseHeader.Validate("Buy-from Vendor No.");
                    PurchaseHeader."Posting Description" := Rec.Description;
                    PurchaseHeader."Certificate Number" := Rec."Document No.";
                    PurchaseHeader."Contractor Request No" := Rec."Document No.";
                    PurchaseHeader."Advance Recovery %" := Rec."Less Advance Payment";
                    PurchaseHeader."Retention %" := Rec."Retention %";
                    PurchaseHeader."Posting Date" := Today;


                    PurchaseHeader.Insert;
                    PurchNo := PurchaseHeader."No.";
                    //MESSAGE(PurchNo);

                    //Create the lines
                    ContractorRequestPlanLine.Reset;
                    ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Document No", Rec."Document No.");
                    ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Document Type", Rec."Document Type");
                    ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Job No.", Rec."Project ID");
                    ContractorRequestPlanLine.SetFilter(ContractorRequestPlanLine."Qty. to Order", '>%1', 0);
                    if ContractorRequestPlanLine.FindSet then begin
                        repeat
                            PurchaseLine.Init;
                            PurchaseLine."Document Type" := PurchaseLine."document type"::Invoice;
                            PurchaseLine."Document No." := PurchNo;
                            PurchaseLine."Line No." := PurchaseLine.Count + 1;
                            PurchaseLine.Type := PurchaseLine.Type::"G/L Account";
                            PurchaseLine.Validate(Type);
                            Job.Reset;
                            Job.SetRange("No.", Rec."Project ID");
                            if Job.FindSet then begin
                                JobPostingGroup.Reset;
                                JobPostingGroup.SetRange(JobPostingGroup.Code, Job."Job Posting Group");
                                if JobPostingGroup.FindSet then begin
                                    PurchaseLine.Validate("No.", JobPostingGroup."G/L Expense Acc. (Contract)");
                                end;
                            end;
                            //PurchaseLine."No.":=ContractorRequestPlanLine."No.";
                            PurchaseLine.Validate("No.");
                            PurchaseLine.Description := ContractorRequestPlanLine.Description;
                            PurchaseLine.Quantity := ContractorRequestPlanLine."Qty. to Order";
                            PurchaseLine.Validate(Quantity);
                            PurchaseLine."Direct Unit Cost" := ContractorRequestPlanLine."Total Cost Incl. VAT";
                            PurchaseLine.Validate("Direct Unit Cost");
                            PurchaseLine."Unit Cost" := ContractorRequestPlanLine."Total Cost Incl. VAT";
                            PurchaseLine.Validate("Unit Cost");
                            PurchaseLine."Job No." := Rec."Project ID";
                            PurchaseLine."Job Task No." := ContractorRequestPlanLine."Job Task No.";
                            //PurchaseLine.VALIDATE("Job No.");
                            //    JobTask.RESET;
                            //    JobTask.SETRANGE(JobTask."Job No.","Project ID");
                            //    IF JobTask.fin THEN BEGIN
                            //      PurchaseLine."Job Task No." := JobTask."Job Task No.";
                            //      //PurchaseLine.VALIDATE("Job Task No.");
                            //    END;

                            if not PurchaseLine.Insert(true) then
                                PurchaseLine.Modify(true);
                        until ContractorRequestPlanLine.Next = 0;
                    end;

                    Rec.Posted := true;
                    Rec."Posted By" := UserId;
                    Rec.Modify(true);

                    Job.Reset;
                    Job.SetRange(Job."No.", Rec."Project ID");
                    if Job.FindSet then begin
                        Job."Last IPC Number" := Rec."IPC Number";
                        Job.Modify(true);
                    end;
                    //Open the created invoice
                    PurchaseHeader.Reset;
                    PurchaseHeader.SetRange(PurchaseHeader."No.", PurchNo);
                    PurchaseHeader.SetRange(PurchaseHeader."Document Type", PurchaseHeader."document type"::Invoice);
                    if PurchaseHeader.FindSet then begin
                        PurchaseInvoice.SetTableview(PurchaseHeader);
                        PurchaseInvoice.Run;
                    end;
                end;
            }
            action("Export Template")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Previous IPC';
                Ellipsis = true;
                Image = Excel;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                // trigger OnAction()
                // var
                //     Name: Text;
                //     ReturnValue: Boolean;
                //     TempFile: File;
                //     ToFile: Variant;
                //     NewStream: InStream;
                //     FilePath: label 'C:\QuickPay\ExcelTemplates\TempFiles\';
                //     MeasurementPaymentHeader: Record "Measurement &  Payment Header";
                // begin
                //     ProgressWindow.Open('Generating...');
                //     ProgressWindow.Close;
                //     ContractorRequestTask.Reset;
                //     ContractorRequestTask.SetRange(ContractorRequestTask."Job No.","Project ID");
                //     ContractorRequestTask.SetFilter(ContractorRequestTask."Job Task No.",'<>%1','');
                //     ContractorRequestTask.SetRange(ContractorRequestTask."Document No.","Document No.");
                //     if not ContractorRequestTask.Find('-') then
                //       Error('No Bill Categories added');

                //     ContractorRequestPlanLine.Reset;
                //     ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Job No.","Project ID");
                //     ContractorRequestPlanLine.SetFilter(ContractorRequestPlanLine."Job Task No.",'<>%1','');
                //     ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Document No.","Document No.");
                //     if not ContractorRequestPlanLine.Find('-') then
                //       Error('No Bill Items added');


                //     //MESSAGE('fname'+"Document No."+'_'+"Project Name"+' projID '+"Project ID"+' doc n'+"Document No." );

                //     //contractPeriod:="Project End Date"-"Project Start Date";
                //     //GenerateTemplate("Document No.", "Project ID", "Document No.","Contractor Name","Contract Sum",contractPeriod);


                //     //  TempFile.Open(FilePath+"Document No."+'.xlsx');
                //     //  TempFile.CreateInstream(NewStream);

                //     //  ToFile:="Document No."+'.xlsx';

                //      ReturnValue:=DownloadFromStream(
                //       NewStream,
                //       'Save File to RoleTailored Client',
                //       '',
                //       'Excel Files (*.xlsx;*.xls)|*.xlsx;*.xls',
                //       ToFile);

                //      //TempFile.Close();
                // end;
            }
            action("Import Template")
            {
                ApplicationArea = Basic;
                Caption = 'Import IPC';
                Ellipsis = true;
                Image = Import;
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
                    MeasurementPaymentHeader: Record "Measurement &  Payment Header";
                begin
                    // Add source Code to import Exported Document into folder C:\QuickPay\ExcelTemplates\TempFilesImport
                    Rec.TestField("Region ID");
                    DMSManagement.UploadCPRExportedForImport(DMSDocuments."document type"::"Maintenance Requisition", Rec."Document No.", 'Contractor Payment Request', Rec.RecordId, Rec."Region ID");
                    //ImportTemplate_("Project Name", "Project ID", "Document No.");

                    MeasurementPaymentHeader.Reset;
                    MeasurementPaymentHeader.SetRange("Document No.", Rec."Document No.");
                    if MeasurementPaymentHeader.FindFirst() then begin
                        MeasurementPaymentHeader.Import := true;
                        MeasurementPaymentHeader.Modify();
                    end;
                end;
            }
            action("Print Payment Cert")
            {
                ApplicationArea = Basic;
                Caption = 'Payment Certificate';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    if Rec.FindSet then
                        Report.Run(72015, true, false, Rec)
                end;
            }
            action("Print Request Summary")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    if Rec.FindSet then
                        Report.Run(72045, true, false, Rec)
                end;
            }
            action("Print Reconciliation Report")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    if Rec.FindSet then
                        Report.Run(72043, true, false, Rec)
                end;
            }
            action("Import Bill Items")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = XMLport "Import Job Planning Lines1";
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
            // action("Attach Docs")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Attach Supporting Documents';
            //     Image = Attach;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;
            //     PromotedOnly = true;

            //     trigger OnAction()
            //     begin
            //         DMSManagement.UploadAIEAttchmentDocuments(Rec."Document No.", Format(Rec."Document Type"), Rec.RecordId, '');
            //     end;
            // }
            action("Materials On site")
            {
                ApplicationArea = Basic;
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Materials On site";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
            action("Variation of Price Indices")
            {
                ApplicationArea = Basic;
                Caption = 'VoP Indices';
                Image = Indent;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Variation of Price Indices";
            }
            action("Certificate Instructions")
            {
                ApplicationArea = Basic;
                Image = "1099Form";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Certificate Instructions";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No.");
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    RecVariant := Rec;
                    //  RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVariant, "Project ID", Documenttype::"Work Execution Plan", "Project ID", ApprovalEntry."document type"::PCO, 0, RecordId, FnGetTableNo());
                    Rec.Status := Rec.Status::"Pending Approval";
                    Rec.Modify(true);
                    //EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEntry, "Project ID");
                    Message(TXT0001);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    RecRef: RecordRef;
                    CustomApprovalEntry: Record "Custom Approval Entry";
                    OldStatus: Option;
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    Rec.TestField("Created By", UserId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
                    if CustomApprovalEntry.FindSet then
                        repeat
                            OldStatus := ApprovalEntry.Status;
                            CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                            CustomApprovalEntry.Modify(true);
                        until CustomApprovalEntry.Next = 0;

                    //Notify The User
                    EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);

                    Message(TXT0002);
                end;
            }
            action("Project Approvals")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //ApprovalsMgmt.FnOpenApprovalEntriesPage(RecordId);
                end;
            }
            action(Approve)
            {
                ApplicationArea = Suite;
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Approve the requested changes.';

                trigger OnAction()
                var
                    CustomApprovalEntry: Record "Custom Approval Entry";
                // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //CurrPage.SETSELECTIONFILTER(CustomApprovalEntry);
                    //ApprovalsMgmt.FnApproveRecordApprovalRequest(RecordId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry.Status, CustomApprovalEntry.Status::Approved);
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.", FnGetLargestSequenceNoFromApprovalEntry(Rec."Project ID"));
                    Message(Format(FnGetLargestSequenceNoFromApprovalEntry(Rec."Project ID")));
                    if CustomApprovalEntry.FindFirst then begin
                        //      ReleaseApprovalDocument.ReleaseSAVReq(Rec);
                    end;
                end;
            }
            action(Reject)
            {
                ApplicationArea = Suite;
                Caption = 'Reject';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Reject the approval request.';

                trigger OnAction()
                var
                    ApprovalEntry: Record "Custom Approval Entry";
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    currentRecEntryNo: Integer;
                    CustomApprovalEntryChange: Record "Custom Approval Entry History";
                begin
                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //Added
                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    //Added
                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    CustomApprovalEntry.SetRange(CustomApprovalEntry.Status, CustomApprovalEntry.Status::Open);
                    if CustomApprovalEntry.FindSet then begin
                        currentRecEntryNo := CustomApprovalEntry."Sequence No.";
                    end;//Added

                    ///ApprovalsMgmt.FnRejectRecordApprovalRequest(RecordId);

                    CustomApprovalEntry.Reset;
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                    CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                    //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                    if CustomApprovalEntry.FindSet then
                        repeat
                            CustomApprovalEntry.Status := CustomApprovalEntry.Status::Rejected;
                            CustomApprovalEntry.Modify(true);
                        until CustomApprovalEntry.Next = 0;

                    Rec.Status := Rec.Status::Open;
                    Rec.Modify(true);

                    //Added part 2
                    if currentRecEntryNo > 1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Sequence No.", currentRecEntryNo);
                        if CustomApprovalEntry.FindSet then begin
                            repeat
                                UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Created;
                                CustomApprovalEntry.Modify();
                            until CustomApprovalEntry.Next = 0;
                        end;

                    end;

                    if currentRecEntryNo > 1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        CustomApprovalEntry.SetFilter(CustomApprovalEntry."Sequence No.", '<%1', currentRecEntryNo);
                        if CustomApprovalEntry.FindSet then begin
                            repeat

                                if (CustomApprovalEntry."Sequence No." = (currentRecEntryNo - 1)) then begin
                                    CustomApprovalEntry.Status := CustomApprovalEntry.Status::Open;
                                end
                                else
                                    if (CustomApprovalEntry."Sequence No." > currentRecEntryNo) then begin
                                        CustomApprovalEntry.Status := CustomApprovalEntry.Status::Created;
                                    end else begin
                                        CustomApprovalEntry.Status := CustomApprovalEntry.Status::Approved;
                                    end;
                                UpdateCustomApprovalEntryHistory(CustomApprovalEntry);
                                CustomApprovalEntry.Modify();

                            until CustomApprovalEntry.Next = 0;
                        end;
                    end;
                    if currentRecEntryNo = 1 then begin
                        CustomApprovalEntry.Reset;
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."Project ID");
                        CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
                        //CustomApprovalEntry.SETFILTER(CustomApprovalEntry.Status,'<>%1|<>%2',CustomApprovalEntry.Status::Canceled,CustomApprovalEntry.Status::Rejected);
                        if CustomApprovalEntry.FindSet then
                            repeat
                                CustomApprovalEntry.Status := CustomApprovalEntry.Status::Rejected;
                                CustomApprovalEntry.Modify(true);
                            until CustomApprovalEntry.Next = 0;

                        Rec.Status := Rec.Status::Open;
                        Rec.Modify(true);
                    end;
                    //Added part 2

                    EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);

                end;
            }
            action(Delegate)
            {
                ApplicationArea = Suite;
                Caption = 'Delegate';
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Scope = Repeater;
                ToolTip = 'Delegate the approval to a substitute approver.';

                trigger OnAction()
                var
                    ApprovalEntry: Record "Custom Approval Entry";
                    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    Selected: Integer;
                    USetup: Record "User Setup";
                    Options: Text;
                    "Count": Integer;
                    SelectedUser: Code[50];
                    Region: Text;
                begin
                    //Added
                    Options := 'Default Substitute,';
                    //Get Region
                    USetup.Reset;
                    USetup.SetRange("User ID", UserId);
                    if USetup.Find('-') then begin
                        Region := SelectedUser;
                    end;

                    USetup.Reset;
                    USetup.SetRange("Region Code", Region);
                    if USetup.Find('-') then begin
                        repeat

                            Options := Options + USetup."User ID" + ',';

                        until USetup.Next = 0;
                    end;


                    Selected := Dialog.StrMenu(Options, 1, 'Select User');

                    USetup.Reset;
                    USetup.SetRange("Region Code", Region);
                    if USetup.Find('-') then begin
                        repeat
                            Count := Count + 1;
                            if Selected = Count + 1 then begin
                                SelectedUser := USetup."User ID";
                            end;
                        until USetup.Next = 0;
                    end;

                    USetup.Reset;
                    USetup.SetRange("User ID", UserId);
                    if USetup.Find('-') then begin
                        USetup."Substitute Selected" := true;
                        USetup."Selected Substitute" := SelectedUser;
                        USetup.Modify();
                    end;
                    //Added

                    //CurrPage.SETSELECTIONFILTER(ApprovalEntry);
                    // ApprovalsMgmt.FnDelegateRecordApprovalRequest(RecordId);
                    // EmailNotifications.FnSendRejectApprovalsMailCustom2(CustomApprovalEntry);
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
                    /*TESTFIELD("Rejection Remarks");
                    Rejected:=TRUE;
                    "Rejected By":=USERID;
                    MODIFY();
                    MESSAGE('Document Rejected.');*/

                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec."Opening Date" = 0D then
            Rec."Opening Date" := Today;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec."Opening Date" = 0D then
            Rec."Opening Date" := Today;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Contractor Payment Request";
        Rec."Payment Certificate Type" := Rec."payment certificate type"::"Interim Payment";
    end;

    trigger OnOpenPage()
    begin
        if Rec."Opening Date" = 0D then
            Rec."Opening Date" := Today;

        MeasurementPaymentHeader.Reset;
        MeasurementPaymentHeader.SetRange("Document No.", Rec."Document No.");
        if MeasurementPaymentHeader.FindFirst() then begin
            MeasurementPaymentHeader.Generate := true;
            MeasurementPaymentHeader.Modify();
        end;
    end;

    var
        JobTask: Record "Job Task";
        ContractorRequestPlanLine: Record "Contractor Request Plan Line";
        ContractorRequestTask: Record "Contractor Request Task";
        JobPostingGroup: Record "Job Posting Group";
        PurchLine: Record "Purchase Line";
        DMSDocuments: Record "DMS Documents";
        ProgressWindow: Dialog;
        contractPeriod: Integer;
        MeasurementPaymentHeader: Record "Measurement &  Payment Header";
        MeasurementPaymentEntry: Record "Measurement & Payment Entry";
        MeasurementPaymentLine: Record "Measurement & Payment Line";
        MeasurementSheetBillCode: Record "Measurement Sheet Bill Code";
        ObjMPLine: Record "Measurement & Payment Line";
        ObjMPEntry: Record "Measurement & Payment Entry";
        MPH: Record "Measurement &  Payment Header";
        PurchaseHeader: Record "Purchase Header";
        PaymentCertificateLine: Record "Payment Certificate Line";
        PurchaseLine: Record "Purchase Line";
        PurchaseInvoice: Page "Purchase Invoice";
        PurchNo: Code[20];
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        // PaymentsPost: Codeunit "Payments-Post";
        Job: Record Job;
        RiskManagement: Codeunit "Risk Management";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RiskMEHeader: Record "Risk M&E Header";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskStatusReportLine: Record "Risk Status Report Line";
        NewRiskLineOwnership: Record "New Risk Line Ownership";
        NewRiskLineResponseAction: Record "New Risk Line Resp. Action";
        NewRiskLineJobTask: Record "New Risk Line Job Task";
        RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action";
        RiskStatusRptIncident: Record "Risk Status Rpt Incident";
        ObjRiskMgt: Codeunit "Risk Management";
        RMPLine: Record "Risk Management Plan Line";
        DMSManagement: Codeunit "DMS Management";
        ProcProcess: Codeunit "Procurement Processing";
        DocType: Record "DMS Documents";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        RMS: Codeunit "RMS Management";
        ShowWorkflowStatus: Boolean;
        PRN: Record "Purchase Header";
        ProcCommType: Record "Procurement Committee Types";
        IfsCommitteMembers: Record "IFS Tender Committee Member";
        NoOfMembers: Integer;
        ProjectStaffAppointment: Record "Project Staff Appointment";
        ProjectStaffAppointList: Page "Project Staff Appoint. List";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectStaffTerminationLine: Record "Project Staff Termination Line";
        ProcurementProcessing: Codeunit "Procurement Processing";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        ProjectStaffAppointmentLine: Record "Project Staff Appointment Line";
        PCOInternalProjectTeam: Record "PCO Internal Project Team";
        PCORequiredDocument: Record "PCO Required Document";
        ProjectDocumentTemplate: Record "Project Document Template";
        ProjectDocumentTemplateLine: Record "Project Document Template Line";
        ObjJob: Record Job;
        ProjectMobilizationHeader: Record "Project Mobilization Header";
        WEPExecutionSchedule: Record "WEP Execution Schedule";
        JobPlanningLine: Record "Job Planning Line";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RoadManagementSetup: Record "Road Management Setup";
        ProjectMeetingRegister: Record "Project Meeting Register";
        PCOPlannedMeeting: Record "PCO Planned Meeting";
        //MTPMailSetup: Record "Email Account";
        //SMTPMail: Codeunit Mail;
        EmailBody: Text[250];
        acknowledgementtabvisible: Boolean;
        ProjectMeetingAgendaTemp: Record "Project Meeting Agenda Temp";
        MeetingAgendaItemTemplate: Record "Meeting Agenda Item Template";
        ProjectMeetingAgenda: Record "Project Meeting Agenda";
        ProjectMeetingSummary: Record "Project Meeting Summary";
        CompanyInformation: Record "Company Information";
        HumanResourcesSetup: Record "Human Resources Setup";
        Window: Dialog;
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        //FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        //cu400: Codeunit Mail;
        SenderAddress: Text[100];
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        CustEmail: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        Vendors: Record Vendor;
        ProjectApprovalSetup: Record "Project Approval Setup";
        ApprovalEntry: Record "Approval Entry";
        InternalProjectResource: Record "Internal Project Resource";
        Employee: Record Employee;
        RMSManagement: Codeunit "RMS Management";
        RecVariant: Variant;
        RecID: RecordID;
        ReleaseApprovalDocument: Codeunit "Release Approval Document";
        UserSetup: Record "User Setup";
        EmailNotifications: Codeunit "Email Notifications";
        CustomApprovalEntry: Record "Custom Approval Entry";
        DocumentType: Option " ","Commenncement Order","Communication Plan","Staff Appointments","Internal Staff Disengement","Staff Disengagement","Mobilization Checklist","Mobilization Checklist Status Report","Professional Indemnity","Work Execution Plan","HSE Plan",RMP,QMP,"Contract Supervision Requirement","Site Agent Nomination","Contractor Key Personnel Appointment","Equipment Delivery To Site","Insurance of Works","Advance Payment Guarantee","Performance Guarantee","Equipment Tracking";
        TXT0001: label 'An approval request has been sent and approvers notified successfully.';
        TXT0002: label 'An approval request has been cancelled and approvers notified successfully.';

    // procedure GenerateTemplate(filename: Text;Project_ID: Text;Document_No: Text;mainContractor: Text;contractsum: Decimal;period: Integer)
    // var
    //     "**mscorlib**": Integer;
    //     sb: dotnet StringBuilder;
    //     stream: dotnet StreamWriter;
    //     str: dotnet Stream;
    //     ascii: dotnet Encoder;
    //     "**System**": Integer;
    //     uriObj: dotnet Uri;
    //     lgRequest: dotnet HttpWebRequest;
    //     lgResponse: dotnet HttpWebResponse;
    //     reader: dotnet XmlTextReader;
    //     document: dotnet XmlDocument;
    //     credentials: dotnet CredentialCache;
    //     sbStr: Text;
    // begin
    //     CalcFields("Settled Amount");
    //     sb:=sb.StringBuilder();
    //     sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
    //     sb.Append('<soapenv:Header/>');
    //     sb.Append('<soapenv:Body>');
    //     sb.Append('<tem:GenerateCert>');
    //     sb.Append('<tem:filename>'+filename+'</tem:filename>');
    //     sb.Append('<tem:Project_ID>'+Project_ID+'</tem:Project_ID>');
    //     sb.Append('<tem:Document_No>'+Document_No+'</tem:Document_No>');
    //     sb.Append('<tem:mainContractor>'+mainContractor+'</tem:mainContractor>');
    //     sb.Append('<tem:contractVal>'+Format(contractsum)+'</tem:contractVal>');
    //     sb.Append('<tem:contractNo>'+"Document No."+'</tem:contractNo>');
    //     sb.Append('<tem:certNo>'+Format("IPC Number")+'</tem:certNo>');
    //     sb.Append('<tem:date>'+Format("Project Start Date")+'</tem:date>');
    //     sb.Append('<tem:prev>'+Format("Settled Amount")+'</tem:prev>');
    //     sb.Append('</tem:GenerateCert>');
    //     sb.Append('</soapenv:Body>');
    //     sb.Append('</soapenv:Envelope>');
    //     sbStr:=DelChr(sb.ToString(),'=','&');


    //     uriObj:= uriObj.Uri('http://192.168.1.87:7048/KeRRAExcel.asmx');
    //     lgRequest:= lgRequest.CreateDefault(uriObj);
    //     lgRequest.Method:= 'POST';
    //     lgRequest.ContentType :='text/xml';
    //     lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/GenerateCert');
    //     lgRequest.Credentials:=credentials.DefaultCredentials;
    //     lgRequest.Timeout:=120000;
    //     stream:=stream.StreamWriter(lgRequest.GetRequestStream());
    //     stream.Write(sbStr);
    //     stream.Close();
    //     lgResponse:=lgRequest.GetResponse();
    // end;

    // procedure ImportTemplate_(filename: Text;Project_ID: Text;Document_No: Text)
    // var
    //     "**mscorlib**": Integer;
    //     sb: dotnet StringBuilder;
    //     stream: dotnet StreamWriter;
    //     str: dotnet Stream;
    //     ascii: dotnet Encoder;
    //     "**System**": Integer;
    //     uriObj: dotnet Uri;
    //     lgRequest: dotnet HttpWebRequest;
    //     lgResponse: dotnet HttpWebResponse;
    //     reader: dotnet XmlTextReader;
    //     document: dotnet XmlDocument;
    //     credentials: dotnet CredentialCache;
    // begin
    //     sb:=sb.StringBuilder();
    //     sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
    //     sb.Append('<soapenv:Header/>');
    //     sb.Append('<soapenv:Body>');
    //     sb.Append('<tem:ReadDoc>');
    //     sb.Append('<tem:filename>'+filename+'</tem:filename>');
    //     sb.Append('<tem:Project_ID>'+Project_ID+'</tem:Project_ID>');
    //     sb.Append('<tem:Document_No>'+Document_No+'</tem:Document_No>');
    //     sb.Append('</tem:ReadDoc>');
    //     sb.Append('</soapenv:Body>');
    //     sb.Append('</soapenv:Envelope>');

    //     uriObj:= uriObj.Uri('http://192.168.1.87:7048/KeRRAExcel.asmx');
    //     lgRequest:= lgRequest.CreateDefault(uriObj);
    //     lgRequest.Method:= 'POST';
    //     lgRequest.ContentType :='text/xml';
    //     lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/ReadDoc');
    //     lgRequest.Credentials:=credentials.DefaultCredentials;
    //     lgRequest.Timeout:=120000;
    //     stream:=stream.StreamWriter(lgRequest.GetRequestStream());
    //     stream.Write(sb.ToString());
    //     stream.Close();
    //     lgResponse:=lgRequest.GetResponse();
    // end;

    // local procedure FnSuggestProjectTeam()
    // begin
    //     FnSuggestProjectTeams();
    // end;

    // local procedure FnGetTableNo(): Integer
    // var
    //     RecID: RecordID;
    //     RecRef: RecordRef;
    // begin
    //     RecRef.Open(Database::"Project Mobilization Header");
    //     if RecRef.Find('-') then begin
    //       RecID := RecRef.RecordId;
    //       end;
    //       exit(RecID.TableNo);
    // end;

    procedure FnGetLargestSequenceNoFromApprovalEntry(DocumentNo: Code[50]): Integer
    var
        CustomApprovalEntry: Record "Custom Approval Entry";
    begin
        CustomApprovalEntry.Reset;
        CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", DocumentNo);
        if CustomApprovalEntry.FindLast then
            exit(CustomApprovalEntry."Sequence No.");
    end;

    local procedure FnNotifyRejectionEmailCustom()
    begin
        CompanyInformation.Get;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", Rec."Project ID");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
            if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                if UserSetup."E-Mail" <> '' then begin
                    EmailNotifications.FnSendEmail(CompanyInformation."E-Mail", COMPANYNAME, UserSetup."E-Mail", 'REJECTION APROVALS:', 'This approval has been rejected.' + ' ' + ApprovalEntry."Document No.");
                end;
            end;
        end;
    end;

    local procedure FnNotifyDelegationEmailCustom()
    begin
        CompanyInformation.Get;
        ApprovalEntry.Reset;
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", Rec."Project ID");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Rejected);
        if ApprovalEntry.FindSet then begin
            if UserSetup.Get(ApprovalEntry."Sender ID") then begin
                if UserSetup."E-Mail" <> '' then begin
                    EmailNotifications.FnSendEmail(CompanyInformation."E-Mail", COMPANYNAME, UserSetup."E-Mail", 'DELEGATION APROVALS:', 'This approval has been delegated.' + ' ' + ApprovalEntry."Document No.");
                end;
            end;
        end;
    end;

    local procedure UpdateCustomApprovalEntryHistory(CustomApprovalEntry: Record "Custom Approval Entry")
    var
        CustomApprovalEntryHistory: Record "Custom Approval Entry History";
    begin
        CustomApprovalEntryHistory.Init;
        CustomApprovalEntryHistory."Entry No." := 0;
        CustomApprovalEntryHistory."Old Entry No" := CustomApprovalEntry."Entry No.";
        CustomApprovalEntryHistory."Table ID" := CustomApprovalEntry."Table ID";
        CustomApprovalEntryHistory."Document Type" := CustomApprovalEntry."Document Type";
        CustomApprovalEntryHistory."Document No." := CustomApprovalEntry."Document No.";
        CustomApprovalEntryHistory."Sender ID" := CustomApprovalEntry."Sender ID";
        CustomApprovalEntryHistory."Date-Time Sent for Approval" := CustomApprovalEntry."Date-Time Sent for Approval";
        CustomApprovalEntryHistory."Last Modified By User ID" := CustomApprovalEntry."Last Modified By User ID";
        CustomApprovalEntryHistory."Last Date-Time Modified" := CustomApprovalEntry."Last Date-Time Modified";
        CustomApprovalEntryHistory."Due Date" := CustomApprovalEntry."Due Date";
        CustomApprovalEntryHistory.Amount := CustomApprovalEntry.Amount;
        CustomApprovalEntryHistory."Record ID to Approve" := CustomApprovalEntry."Record ID to Approve";
        CustomApprovalEntryHistory."Approval Type" := CustomApprovalEntry."Approval Type";
        CustomApprovalEntryHistory."Sequence No." := CustomApprovalEntry."Sequence No.";
        CustomApprovalEntryHistory.Status := CustomApprovalEntry.Status;
        CustomApprovalEntryHistory."Approver ID" := CustomApprovalEntry."Approver ID";
        CustomApprovalEntryHistory.Insert(true);
    end;

    local procedure FnSuggestProjectTeams()
    begin
        /*ProjectStaffAppointmentLine.RESET;
        ProjectStaffAppointmentLine.SETRANGE(ProjectStaffAppointmentLine."Document No.","Staff Appointment Voucher No.");
        IF ProjectStaffAppointmentLine.FINDSET THEN
          REPEAT
            PCOInternalProjectTeam.INIT;
            PCOInternalProjectTeam."Commencement Order No.":="Document No.";
            PCOInternalProjectTeam."Resource No.":=ProjectStaffAppointmentLine."Resource No.";
            PCOInternalProjectTeam.Name:=ProjectStaffAppointmentLine.Name;
            PCOInternalProjectTeam.Email:=ProjectStaffAppointmentLine.Email;
            PCOInternalProjectTeam.Designation:=ProjectStaffAppointmentLine.Designation;
            PCOInternalProjectTeam."Role Code":=ProjectStaffAppointmentLine."Role Code";
            PCOInternalProjectTeam.INSERT(TRUE);
          UNTIL ProjectStaffAppointmentLine.NEXT =0;*/

    end;
}

#pragma implicitwith restore

