
Page 72301 "Interim Payment Certificate"
{
    PageType = Card;
    SourceTable = "Measurement &  Payment Header";

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
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Payment Certificate Type"; Rec."Payment Certificate Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.Description := 'Interim Payment Request' + ' ' + Rec."Project ID";
                    end;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Editable = false;
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                }
                field("Reason For Reversal"; Rec."Reason For Reversal")
                {
                    ApplicationArea = Basic;
                }
                field("Reversed By"; Rec."Reversed By")
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
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                }
                field("This Certificate Amount"; Rec."This Certificate Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Certificate Amount"; Rec."Previous Certificate Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Retention %"; Rec."Retention %")
                {
                    ApplicationArea = Basic;
                }
                field("Less Advance Payment"; Rec."Less Advance Payment")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control44; "Contractor Payment Line Entry")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No.");
            }
            group("Project Details")
            {
                Caption = 'Project Details';
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer No."; Rec."Project Engineer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Project Engineer Name"; Rec."Project Engineer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative No."; Rec."Engineer Representative No.")
                {
                    ApplicationArea = Basic;
                }
                field("Engineer Representative Name"; Rec."Engineer Representative Name")
                {
                    ApplicationArea = Basic;
                }
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
                field("Funding Agency ID"; Rec."Funding Agency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funder Name"; Rec."Funder Name")
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
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                }
                field("Portal Status"; Rec."Portal Status")
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
            action("Suggest Lines")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                RoadManagementSetup: Record "Road Management Setup";
                begin
                    Rec.TestField("From Date");//Check if these fields have been populated
                    Rec.TestField("To Date");//Check if these fields have been populated

                    //Populate the Lines
                    MeasurementPaymentEntry.Reset;
                    MeasurementPaymentEntry.SetRange(MeasurementPaymentEntry."Posting Date", Rec."From Date", Rec."To Date");
                    MeasurementPaymentEntry.SetRange(MeasurementPaymentEntry.Reversed, false);
                    MeasurementPaymentEntry.SetRange(MeasurementPaymentEntry.Posted, true);
                    MeasurementPaymentEntry.SetFilter(MeasurementPaymentEntry."Measured Quantity", '>%1', 0);
                    if MeasurementPaymentEntry.FindSet then begin
                        //Delete The existing Lines
                        MeasurementPaymentLine.Reset;
                        MeasurementPaymentLine.SetRange(MeasurementPaymentLine."Document No", Rec."Document No.");
                        if MeasurementPaymentLine.FindSet then
                            MeasurementPaymentLine.DeleteAll;
                        repeat
                            MeasurementPaymentLine.Init;
                            MeasurementPaymentLine."Document No" := Rec."Document No.";
                            MeasurementPaymentLine."Document Type" := Rec."Document Type";
                            MeasurementPaymentLine."Line No." := MeasurementPaymentLine.Count + 100;
                            MeasurementPaymentLine."Job No." := MeasurementPaymentEntry."Job No.";
                            MeasurementPaymentLine."Job Task No." := MeasurementPaymentEntry."Job Task No.";
                            MeasurementPaymentLine.Type := MeasurementPaymentLine.Type::Item;
                            MeasurementPaymentLine."No." := MeasurementPaymentEntry."No.";
                            MeasurementPaymentLine.Description := MeasurementPaymentEntry.Description;
                            MeasurementPaymentLine."Unit of Measure Code" := MeasurementPaymentEntry."Unit of Measure Code";
                            MeasurementPaymentLine."Measurement Type" := MeasurementPaymentEntry."Measurement Type";
                            MeasurementPaymentLine."Measured Quantity" := MeasurementPaymentEntry."Measured Quantity";
                            MeasurementPaymentLine."Contract Quantity" := MeasurementPaymentEntry."Contract Quantity";
                            MeasurementPaymentLine."Direct Unit Cost (LCY)" := MeasurementPaymentEntry."Direct Unit Cost (LCY)";
                            MeasurementPaymentLine."Unit Cost (LCY)" := MeasurementPaymentEntry."Unit Cost (LCY)";
                            MeasurementPaymentLine."Technology Type" := MeasurementPaymentEntry."Technology Type";
                            MeasurementPaymentLine."Gen. Prod. Posting Group" := MeasurementPaymentEntry."Gen. Prod. Posting Group";
                            MeasurementPaymentLine."Bill Item Category Code" := MeasurementPaymentEntry."Bill Item Category Code";
                            MeasurementPaymentLine."Total Cost (LCY)" := MeasurementPaymentEntry."Total Cost (LCY)";
                            MeasurementPaymentLine."Works Start Chainage" := MeasurementPaymentEntry."Works Start Chainage";
                            MeasurementPaymentLine."Works End Chainage" := MeasurementPaymentEntry."Works End Chainage";
                            RoadManagementSetup.Get();
                            MeasurementPaymentLine."Gen. Prod. Posting Group" :=RoadManagementSetup."Gen. Prod Posting Group";
                            if MeasurementPaymentLine."Measured Quantity" <> 0 then
                                MeasurementPaymentLine.Insert(true);
                        until MeasurementPaymentEntry.Next = 0;
                        Message('Lines created successfully');
                    end
                    else
                        Message('No measured quantity exist for the dates entered');

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
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Message('Great');
                end;
            }
            action("Generate Payment Certificate")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //Create Invoice Header
                    PurchasesPayablesSetup.Get;
                    PurchaseHeader.Init;
                    PurchaseHeader."Document Type" := PurchaseHeader."document type"::Invoice;
                    PurchaseHeader."No." := NoSeriesManagement.GetNextNo(PurchasesPayablesSetup."Invoice Nos.", Today, true);

                    PurchaseHeader."Buy-from Vendor No." := Rec."Contractor No";
                    PurchaseHeader.Validate("Buy-from Vendor No.");
                    PurchaseHeader."Posting Description" := Rec.Description;
                    PurchaseHeader."Certificate Number" := Rec."Document No.";
                    PurchaseHeader."Advance Recovery %" := Rec."Less Advance Payment";
                    PurchaseHeader."Retention %" := Rec."Retention %";

                    PurchaseHeader.Insert;
                    PurchNo := PurchaseHeader."No.";
                    //MESSAGE(PurchNo);

                    //Create the lines
                    MeasurementPaymentLine.Reset;
                    MeasurementPaymentLine.SetRange(MeasurementPaymentLine."Document No", Rec."Document No.");
                    MeasurementPaymentLine.SetRange(MeasurementPaymentLine."Document Type", Rec."Document Type");
                    if MeasurementPaymentLine.FindSet(true) then begin
                        repeat
                            PurchaseLine.Init;
                            PurchaseLine."Document Type" := PurchaseLine."document type"::Invoice;
                            PurchaseLine."Document No." := PurchNo;
                            //    PurchaseLine.RESET;
                            //    PurchaseLine.SETRANGE(PurchaseLine."Document No.","Document No.");
                            //    PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type"::Invoice);
                            //    IF PurchaseLine.FINDLAST THEN
                            PurchaseLine."Line No." := PurchaseLine.Count + 1;
                            PurchaseLine.Type := MeasurementPaymentLine.Type;
                            PurchaseLine."No." := MeasurementPaymentLine."No.";
                            PurchaseLine.Validate("No.");
                            PurchaseLine.Description := MeasurementPaymentLine.Description;
                            PurchaseLine.Quantity := MeasurementPaymentLine."Contract Quantity";
                            PurchaseLine.Validate(Quantity);
                            PurchaseLine."Direct Unit Cost" := MeasurementPaymentLine."Direct Unit Cost (LCY)";
                            PurchaseLine.Validate("Direct Unit Cost");
                            PurchaseLine."Unit Cost" := MeasurementPaymentLine."Direct Unit Cost (LCY)";
                            PurchaseLine."Job No." := Rec."Project ID";
                            //PurchaseLine.VALIDATE("Job No.");
                            JobTask.Reset;
                            JobTask.SetRange(JobTask."Job No.", Rec."Project ID");
                            if JobTask.FindLast then begin
                                PurchaseLine."Job Task No." := JobTask."Job Task No.";
                                //PurchaseLine.VALIDATE("Job Task No.");
                            end;

                            if not PurchaseLine.Get(PurchaseLine."Document Type", PurchaseLine."Document No.", PurchaseLine."Line No.") then
                                PurchaseLine.Insert(true)
                            else
                                PurchaseLine.Modify(true);
                        until MeasurementPaymentLine.Next = 0;
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
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
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
                    //   RMSManagement.FnPopulateApprovalEntryCustomeWorkflow(RecVariant, "Project ID", Documenttype::"Work Execution Plan", "Project ID", ApprovalEntry."document type"::PCO, 0, RecordId, FnGetTableNo());
                    Rec.Status := Rec.Status::"Pending Approval";
                    Rec.Modify(true);
                    //  EmailNotifications.FnSendApprovalsMailCustom(CustomApprovalEntry, "Project ID");
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
                    //EmailNotifications.FnSendCancelApprovalMailCustom(CustomApprovalEntry);
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
                    //  ApprovalsMgmt.FnOpenApprovalEntriesPage(RecordId);
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
                //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //CurrPage.SETSELECTIONFILTER(CustomApprovalEntry);
                    // ApprovalsMgmt.FnApproveRecordApprovalRequest(RecordId);

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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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

                    // ApprovalsMgmt.FnRejectRecordApprovalRequest(RecordId);

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


                    Find
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
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Contractor Payment Request";
        Rec."Payment Certificate Type" := Rec."payment certificate type"::"Interim Payment";
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
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
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
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit Mail;
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

    procedure GenerateTemplate(filename: Text; Project_ID: Text; Document_No: Text; mainContractor: Text; contractsum: Decimal; period: Integer)
    var
        "**mscorlib**": Integer;
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
    // sbStr: Text;
    begin
        // CalcFields("Settled Amount");
        // sb := sb.StringBuilder();
        // sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
        // sb.Append('<soapenv:Header/>');
        // sb.Append('<soapenv:Body>');
        // sb.Append('<tem:GenerateCert>');
        // sb.Append('<tem:filename>' + filename + '</tem:filename>');
        // sb.Append('<tem:Project_ID>' + Project_ID + '</tem:Project_ID>');
        // sb.Append('<tem:Document_No>' + Document_No + '</tem:Document_No>');
        // sb.Append('<tem:mainContractor>' + mainContractor + '</tem:mainContractor>');
        // sb.Append('<tem:contractVal>' + Format(contractsum) + '</tem:contractVal>');
        // sb.Append('<tem:contractNo>' + "Document No." + '</tem:contractNo>');
        // sb.Append('<tem:certNo>' + Format("IPC Number") + '</tem:certNo>');
        // sb.Append('<tem:date>' + Format("Project Start Date") + '</tem:date>');
        // sb.Append('<tem:prev>' + Format("Settled Amount") + '</tem:prev>');
        // sb.Append('</tem:GenerateCert>');
        // sb.Append('</soapenv:Body>');
        // sb.Append('</soapenv:Envelope>');
        // sbStr := DelChr(sb.ToString(), '=', '&');


        // uriObj := uriObj.Uri('http://192.168.1.87:7048/KeRRAExcel.asmx');
        // lgRequest := lgRequest.CreateDefault(uriObj);
        // lgRequest.Method := 'POST';
        // lgRequest.ContentType := 'text/xml';
        // lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/GenerateCert');
        // lgRequest.Credentials := credentials.DefaultCredentials;
        // lgRequest.Timeout := 120000;
        // stream := stream.StreamWriter(lgRequest.GetRequestStream());
        // stream.Write(sbStr);
        // stream.Close();
        // lgResponse := lgRequest.GetResponse();
    end;

    procedure ImportTemplate_(filename: Text; Project_ID: Text; Document_No: Text)
    var
        "**mscorlib**": Integer;
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
        // sb := sb.StringBuilder();
        // sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
        // sb.Append('<soapenv:Header/>');
        // sb.Append('<soapenv:Body>');
        // sb.Append('<tem:ReadDoc>');
        // sb.Append('<tem:filename>' + filename + '</tem:filename>');
        // sb.Append('<tem:Project_ID>' + Project_ID + '</tem:Project_ID>');
        // sb.Append('<tem:Document_No>' + Document_No + '</tem:Document_No>');
        // sb.Append('</tem:ReadDoc>');
        // sb.Append('</soapenv:Body>');
        // sb.Append('</soapenv:Envelope>');

        // uriObj := uriObj.Uri('http://192.168.1.87:7048/KeRRAExcel.asmx');
        // lgRequest := lgRequest.CreateDefault(uriObj);
        // lgRequest.Method := 'POST';
        // lgRequest.ContentType := 'text/xml';
        // lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/ReadDoc');
        // lgRequest.Credentials := credentials.DefaultCredentials;
        // lgRequest.Timeout := 120000;
        // stream := stream.StreamWriter(lgRequest.GetRequestStream());
        // stream.Write(sb.ToString());
        // stream.Close();
        // lgResponse := lgRequest.GetResponse();
    end;

    local procedure FnSuggestProjectTeam()
    begin
        FnSuggestProjectTeams();
    end;

    local procedure FnGetTableNo(): Integer
    var
        RecID: RecordID;
        RecRef: RecordRef;
    begin
        RecRef.Open(Database::"Project Mobilization Header");
        if RecRef.Find('-') then begin
            RecID := RecRef.RecordId;
        end;
        exit(RecID.TableNo);
    end;

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



