codeunit 50018 "Custom Function"
{
    trigger OnRun()
    begin
        GetPseudoNames();
    end;

    var
        CurrExchRate: Record "Currency Exchange Rate";
        //table approval workflow
        UserIdNotInSetupErr: Label 'User ID %1 does not exist in the Approval User Setup window.', Comment = 'User ID NAVUser does not exist in the Approval User Setup window.';
        ApproverUserIdNotInSetupErr: Label 'You must set up an approver for user ID %1 in the Approval User Setup window.', Comment = 'You must set up an approver for user ID NAVUser in the Approval User Setup window.';
        WFUserGroupNotInSetupErr: Label 'The workflow user group member with user ID %1 does not exist in the Approval User Setup window.', Comment = 'The workflow user group member with user ID NAVUser does not exist in the Approval User Setup window.';
        SubstituteNotFoundErr: Label 'There is no substitute, direct approver, or approval administrator for user ID %1 in the Approval User Setup window.', Comment = 'There is no substitute for user ID NAVUser in the Approval User Setup window.';
        NoSuitableApproverFoundErr: Label 'No qualified approver was found.';
        DelegateOnlyOpenRequestsErr: Label 'You can only delegate open approval requests.';
        NoWFUserGroupMembersErr: Label 'The workflow must have at least one member';
        WorkflowManagement: Codeunit "Workflow Management";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        NoWorkflowEnabledErr: label 'This record is not supported by related approval workflow.';

    [EventSubscriber(ObjectType::Page, 51, 'OnBeforeActionEvent', 'SendApprovalRequest', false, false)]
    local procedure SendApproval(var Rec: Record "Purchase Header")
    var
        CheckDimensions: Codeunit "Check Dimensions";
        PurchLine: Record "Purchase Line";
    begin
        CheckDimensions.CheckPurchDim(Rec, PurchLine);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice", 'OnBeforeActionEvent', 'SendApprovalRequest', false, false)]
    local procedure SendApprovalSales(var Rec: Record "Sales Header")
    var
        CheckDimensions: Codeunit "Check Dimensions";
        SalesLine: Record "Sales Line" temporary;
    begin
        CheckDimensions.CheckSalesDim(Rec, SalesLine);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeCheckPurchaseApprovalPossible', '', false, false)]
    local procedure OnBeforeCheckPurchaseApprovalPossible(PurchaseHeader: Record "Purchase Header"; var Result: Boolean; var IsHandled: Boolean)
    var
        PurchaseLine: Record "Purchase Line";
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::Order then begin
            PurchaseHeader.TestField("Quotation No.");
            PurchaseHeader.TestField("Quotation Description");
            PurchaseHeader.TestField("PP Preference/Reservation Code");
            PurchaseLine.Reset();
            PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
            PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
            if PurchaseLine.FindSet() then begin
                repeat
                    PurchaseLine.TestField("Gen. Bus. Posting Group");
                    PurchaseLine.TestField("Gen. Prod. Posting Group");
                    PurchaseLine.TestField("Location Code");
                    PurchaseLine.TestField("Unit of Measure");
                    PurchaseLine.TestField("Qty. to Receive");
                    PurchaseLine.TestField("Qty. to Invoice");
                until PurchaseLine.Next() = 0;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnInitInsertOnBeforeInitRecord', '', false, false)]
    local procedure OnInitInsertOnBeforeInitRecord(var PurchaseHeader: Record "Purchase Header"; var xPurchaseHeader: Record "Purchase Header")
    var
        usersetup: Record "User Setup";
        Emp: Record Employee;
    begin
        PurchaseHeader."Requester ID" := UserId;
        if usersetup.get(UserId) then begin
            if not usersetup."Portal User" then begin
                PurchaseHeader.Region := usersetup."Region Code";
                PurchaseHeader."Request-By No." := usersetup."Employee No.";
                PurchaseHeader."Request-By Name" := usersetup."Employee Name";
                PurchaseHeader."Location Code" := usersetup."Responsibility Center";
                if Emp.Get(usersetup."Employee No.") then begin
                    PurchaseHeader.Validate("Directorate Code", Emp."Directorate Code");
                    PurchaseHeader.Validate("Department Code", Emp."Department Code");
                end
            end;
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeCheckPurchLines', '', false, false)]
    local procedure OnBeforeCheckPurchLines(var PurchaseHeader: Record "Purchase Header"; var PurchLine: Record "Purchase Line"; var IsHandled: Boolean)
    begin
        if PurchaseHeader."Document Type" = PurchaseHeader."Document Type"::"Store Requisition" then
            IsHandled := true;
    end;

    /* [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnBeforeReleasePurchaseDoc', '', false, false)]
     local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header"; PreviewMode: Boolean)
     begin
         IF PurchaseHeader."Buy-from Vendor No." = '' THEN
             PurchaseHeader."Buy-from Vendor No." := 'VEND01186'
     end;

     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", 'OnCodeOnAfterCheck', '', false, false)]
     local procedure OnCodeOnAfterCheck(PurchaseHeader: Record "Purchase Header"; var PurchaseLine: Record "Purchase Line"; var LinesWereModified: Boolean)
     begin
         if PurchaseHeader."Buy-from Vendor No." = 'VEND01186' then
             PurchaseHeader.Validate("Buy-from Vendor No.", '');
     end;*/
    //Update job planning lines amounts
    [EventSubscriber(ObjectType::Table, Database::"Job Planning Line", 'OnAfterUpdateAllAmounts', '', false, false)]
    local procedure OnAfterUpdateAllAmounts(var JobPlanningLine: Record "Job Planning Line"; var xJobPlanningLine: Record "Job Planning Line")
    var
        AmountRoundingPrecision: Decimal;
        AmountRoundingPrecisionFCY: Decimal;
        Currency: Record Currency;
    begin
        if (AmountRoundingPrecision = 0) or
         (AmountRoundingPrecisionFCY = 0)
      then begin
            Clear(Currency);
            Currency.InitRoundingPrecision;
            AmountRoundingPrecision := Currency."Amount Rounding Precision";
            AmountRoundingPrecisionFCY := Currency."Amount Rounding Precision";
        end;
        JobPlanningLine.Validate("VAT Bus. Posting Group");
        JobPlanningLine."Total Cost Incl. VAT" := Round(JobPlanningLine."Unit Cost Inc VAT" * JobPlanningLine.Quantity, AmountRoundingPrecisionFCY);
        JobPlanningLine."Total Cost Incl. VAT LCY" := ConvertAmountToLCY(JobPlanningLine, JobPlanningLine."Total Cost Incl. VAT", AmountRoundingPrecision);
    end;

    local procedure ConvertAmountToLCY(JobPlanningLine: Record "Job Planning Line"; AmountFCY: Decimal; Precision: Decimal): Decimal;
    begin
        exit(ConvertAmountToLCY(JobPlanningLine, JobPlanningLine."Currency Date", AmountFCY, JobPlanningLine."Currency Factor", Precision));
    end;

    local procedure ConvertAmountToLCY(JobPlanningLine: Record "Job Planning Line"; PostingDate: Date; AmountFCY: Decimal; CurrencyFactor: Decimal; Precision: Decimal) AmountLCY: Decimal;
    begin
        AmountLCY :=
            Round(
                CurrExchRate.ExchangeAmtFCYToLCY(
                    PostingDate, JobPlanningLine."Currency Code", AmountFCY, CurrencyFactor),
                Precision);
    end;
    //Update job planning lines amounts
    //modify inserting purchase receipt header
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnBeforePurchRcptHeaderInsert', '', false, false)]
    local procedure OnBeforePurchRcptHeaderInsert(var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchaseHeader: Record "Purchase Header"; CommitIsSupressed: Boolean; WarehouseReceiptHeader: Record "Warehouse Receipt Header"; WhseReceive: Boolean; WarehouseShipmentHeader: Record "Warehouse Shipment Header"; WhseShip: Boolean)
    begin
        PurchRcptHeader.Description := PurchaseHeader.Description;
        PurchRcptHeader."Quotation No." := PurchaseHeader."Quotation No.";
        PurchRcptHeader."Quotation Description" := PurchaseHeader."Quotation Description";
        PurchRcptHeader."PP Preference/Reservation Code" := PurchaseHeader."PP Preference/Reservation Code";
    end;

    ///Modify Approvals


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnCreateApprovalRequestsOnElseCase', '', false, false)]
    local procedure OnCreateApprovalRequestsOnElseCase(WorkflowStepArgument: Record "Workflow Step Argument"; var ApprovalEntryArgument: Record "Approval Entry")
    var
        PCSumExpensing: Record "Request for PC sum Expensing";
        ProjectApprovalSetup: Record "Project Approval Setup Matrix";
        MeasurementHeader: Record "Measurement &  Payment Header";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectMobilization: Record "Project Mobilization Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        RAMWorkplanHeader: Record "RAM Workplan Header";
        PurchHeader: Record "Purchase Header";
        CommunicationPlan: Record "Communication Plan Header";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        RepaymentSchedule: Record "RE Payment Schedule Header";
        ProjectVariation: Record "Project Variation Header";
        Subcontracting: Record "Subcontracting Header";
        ContractorInspectionRequest: Record "Contractor Inspection Request";
        RiskManagementplan: Record "Risk Management Plan";
        InspectionHeaderss: Record "Inspection Headersss";
        InspectionHeader: Record "Inspection Header1";
        SiteInstructions: Record "Site Instructions Header";
        Jobs: Record Job;
        RecRef: RecordRef;
        ApproverId: Code[50];
        SequenceNo: Integer;
        IsHandled: Boolean;
        ApprovalsMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
        ProjectID: Code[20];
    begin
        case WorkflowStepArgument."Approver Type" of
            WorkflowStepArgument."Approver Type"::"Use Table":
                begin
                    //  RecRef := ApprovalEntryArgument."Record ID to Approve".GetRecord();
                    RecRef.Get(ApprovalEntryArgument."Record ID to Approve");
                    // if not UserSetup.Get(UserId) then
                    //     Error(UserIdNotInSetupErr, UserId);
                    // SequenceNo := ApprovalsMgt.GetLastSequenceNo(ApprovalEntryArgument);
                    case RecRef.Number of
                        Database::"Request for PC sum Expensing":
                            begin
                                RecRef.setTable(PCSumExpensing);
                                GetFromProjectApprovalSetup(PCSumExpensing."Project ID", ApprovalEntryArgument);
                                ProjectID := PCSumExpensing."Project ID";
                            end;
                        Database::"Measurement &  Payment Header":
                            begin
                                RecRef.setTable(MeasurementHeader);
                                GetFromProjectApprovalSetup(MeasurementHeader."Project ID", ApprovalEntryArgument);
                                ProjectID := MeasurementHeader."Project ID";
                            end;
                        Database::"Project Staff Voucher":
                            begin
                                RecRef.setTable(ProjectStaffVoucher);
                                GetFromProjectApprovalSetup(ProjectStaffVoucher."Project ID", ApprovalEntryArgument);
                                ProjectID := ProjectStaffVoucher."Project ID";
                            end;
                        Database::"Project Mobilization Header":
                            begin
                                RecRef.Settable(ProjectMobilization);
                                GetFromProjectApprovalSetup(ProjectMobilization."Project ID", ApprovalEntryArgument);
                                ProjectID := ProjectMobilization."Project ID";
                            end;
                        Database::"Project Meeting Register":
                            begin
                                RecRef.SetTable(ProjectMeetingRegister);
                                GetFromProjectApprovalSetup(ProjectMeetingRegister."Project ID", ApprovalEntryArgument);
                                ProjectID := ProjectMeetingRegister."Project ID";
                            end;
                        Database::"RAM Workplan Header":
                            begin
                                RecRef.SetTable(RAMWorkplanHeader);
                                Error('No link to project');
                                // GetFromProjectApprovalSetup(RAMWorkplanHeader.);
                                //ProjectID :=RAMWorkplanHeader.
                            end;
                        Database::Job:
                            begin
                                RecRef.SetTable(Jobs);
                                GetFromProjectApprovalSetup(Jobs."No.", ApprovalEntryArgument);
                                ProjectID := Jobs."No.";
                            end;
                        Database::"Purchase Header":
                            begin
                                RecRef.SetTable(PurchHeader);
                                GetFromProjectApprovalSetup(PurchHeader."Project No", ApprovalEntryArgument);
                                ProjectID := PurchHeader."Project No";
                            end;
                        Database::"Communication Plan Header":
                            begin
                                RecRef.SetTable(CommunicationPlan);
                                GetFromProjectApprovalSetup(CommunicationPlan."Project ID", ApprovalEntryArgument);
                                ProjectID := CommunicationPlan."Project ID";
                            end;
                        Database::"Insurance/Guarantee Header":
                            begin
                                RecRef.SetTable(InsuranceGuarantee);
                                GetFromProjectApprovalSetup(InsuranceGuarantee."Project ID", ApprovalEntryArgument);
                                ProjectID := InsuranceGuarantee."Project ID";
                            end;
                        Database::"WEP Contractor Submission":
                            begin
                                RecRef.SetTable(WEPContractorSubmission);
                                GetFromProjectApprovalSetup(WEPContractorSubmission."Project No", ApprovalEntryArgument);
                                ProjectID := WEPContractorSubmission."Project No";
                            end;
                        Database::"RE Payment Schedule Header":
                            begin
                                RecRef.SetTable(RepaymentSchedule);
                                GetFromProjectApprovalSetup(RepaymentSchedule."Project ID", ApprovalEntryArgument);
                                ProjectID := RepaymentSchedule."Project ID";
                            end;
                        Database::"Project Variation Header":
                            begin
                                RecRef.SetTable(ProjectVariation);
                                GetFromProjectApprovalSetup(ProjectVariation."Project ID", ApprovalEntryArgument);
                                ProjectID := ProjectVariation."Project ID";
                            end;
                        Database::"Subcontracting Header":
                            begin
                                RecRef.SetTable(Subcontracting);
                                GetFromProjectApprovalSetup(Subcontracting."Project Code", ApprovalEntryArgument);
                                ProjectID := Subcontracting."Project Code";
                            end;
                        Database::"Contractor Inspection Request":
                            begin
                                RecRef.SetTable(ContractorInspectionRequest);
                                GetFromProjectApprovalSetup(ContractorInspectionRequest."Project ID", ApprovalEntryArgument);
                                ProjectID := ContractorInspectionRequest."Project ID";
                            end;
                        Database::"Risk Management Plan":
                            begin
                                RecRef.SetTable(RiskManagementplan);
                                GetFromProjectApprovalSetup(RiskManagementplan."Project ID", ApprovalEntryArgument);
                                ProjectID := RiskManagementplan."Project ID";
                            end;
                        Database::"Inspection Headersss":
                            begin
                                RecRef.SetTable(InspectionHeaderss);
                                GetFromProjectApprovalSetup(InspectionHeaderss."Project ID", ApprovalEntryArgument);
                                ProjectID := InspectionHeaderss."Project ID";
                            end;
                        Database::"Inspection Header1":
                            begin
                                RecRef.SetTable(InspectionHeader);
                                error('No linked project');
                                // GetFromProjectApprovalSetup(InspectionHeader."Project ID,ApprovalEntryArgument);
                                // ProjectID :=InspectionHeader."Project ID";
                            end;
                        Database::"Site Instructions Header":
                            begin
                                RecRef.SetTable(SiteInstructions);
                                GetFromProjectApprovalSetup(SiteInstructions."Project ID", ApprovalEntryArgument);
                                ProjectID := SiteInstructions."Project ID";
                            end;
                        else
                            Error('Please contact the administrator to  set up the project approval for this record');
                    end;
                    CreateApprReqForApprTypeWorkflowUserGroup(WorkflowStepArgument, ApprovalEntryArgument, ProjectID);
                end;
        end;
    end;

    Local procedure CreateApprReqForApprTypeWorkflowUserGroup(WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntryArgument: Record "Approval Entry"; UserGroup: Code[20])
    var
        UserSetup: Record "User Setup";
        WorkflowUserGroupMember: Record "Workflow User Group Member";
        ApproverId: Code[50];
        SequenceNo: Integer;
        IsHandled: Boolean;
        ApprovalsMgt: Codeunit "Approvals Mgmt.";
    begin
        IsHandled := false;
        if not IsHandled then begin
            if not UserSetup.Get(UserId) then
                Error(UserIdNotInSetupErr, UserId);
            SequenceNo := ApprovalsMgt.GetLastSequenceNo(ApprovalEntryArgument);
            WorkflowUserGroupMember.Reset();
            WorkflowUserGroupMember.SetRange("Workflow User Group Code", UserGroup);
            if WorkflowUserGroupMember.FindSet() then begin
                // SetCurrentKey("Workflow User Group Code", "Sequence No.");
                repeat
                    ApproverId := WorkflowUserGroupMember."User Name";
                    if not UserSetup.Get(ApproverId) then
                        Error(WFUserGroupNotInSetupErr, ApproverId);
                    ApprovalsMgt.MakeApprovalEntry(ApprovalEntryArgument, SequenceNo + WorkflowUserGroupMember."Sequence No.", ApproverId, WorkflowStepArgument);
                until WorkflowUserGroupMember.Next() = 0;
            end
            else
                Error(NoWFUserGroupMembersErr);
        end;

    end;

    Local procedure GetFromProjectApprovalSetup(ProjectID: Code[20]; ApprovalEntry: Record "Approval Entry")
    var
        ProjectApprovalSetup: Record "Project Approval Setup Matrix";
    begin
        clearusergroup(ProjectID);
        InsertUserGroup(ProjectID, true);
        ProjectApprovalSetup.Reset();
        ProjectApprovalSetup.SetRange("Project ID", ProjectID);
        ProjectApprovalSetup.SetRange("Document Type", ApprovalEntry."Project Document Type");
        IF ProjectApprovalSetup.FindSet() then begin
            repeat
                InsertUserGroupMembers(ProjectID, ProjectApprovalSetup."Approver ID", ProjectApprovalSetup."Sequence No.");
            until ProjectApprovalSetup.next() = 0;
        end
        else
            Error('Please create an approval setup for the project %1', ProjectID);
    end;

    local Procedure InsertUserGroup(UserGroupCode: Code[20]; ProjectBased: Boolean)
    var
        UserGroup: Record "Workflow User Group";
        Jobs: Record Job;
    begin
        UserGroup.Init();
        UserGroup.Code := UserGroupCode;
        UserGroup."Project Based" := ProjectBased;
        Jobs.Reset();
        Jobs.SetRange("No.", UserGroupCode);
        if Jobs.FindFirst() then begin
            UserGroup."Project Name" := Jobs.Description;
            UserGroup."Project ID" := jobs."No.";
        end;
        UserGroup.Insert();
    end;

    local procedure clearusergroup(UserGroupCode: Code[20])
    var
        UserGroup: Record "Workflow User Group";
        UserGroupMember: Record "Workflow User Group Member";
    begin
        UserGroup.Reset();
        UserGroup.SetRange(Code, UserGroupCode);
        if UserGroup.FindFirst() then begin
            UserGroup.DeleteAll();
            UserGroupMember.Reset();
            UserGroupMember.SetRange("Workflow User Group Code", UserGroupCode);
            if UserGroupMember.FindSet() then
                UserGroupMember.DeleteAll();
        end;
        //exit;
    end;

    local procedure InsertUserGroupMembers(UserGroupCode: Code[20]; UserName: Code[50]; Sequence: Integer)
    var
        //UserGroup: Record "Table Approval User Groups";
        UserGroupMember: Record "Workflow User Group Member";
    begin
        UserGroupMember.Init();
        UserGroupMember."Workflow User Group Code" := UserGroupCode;
        UserGroupMember."User Name" := UserName;
        UserGroupMember."Sequence No." := Sequence;
        UserGroupMember."Project ID" := UserGroupCode;
        UserGroupMember.insert();
    end;

    //DimensionName
    /// <summary>
    /// DimensionName.
    /// </summary>
    /// <param name="DimensionNo">Integer.</param>
    /// <param name="DimensionCode">Code[20].</param>
    /// <returns>Return value of type Text.</returns>
    procedure DimensionName(DimensionNo: Integer; DimensionCode: Code[20]): Text
    var
        DimensionValues: Record "Dimension Value";
    begin
        DimensionValues.Reset();
        DimensionValues.SetRange("Global Dimension No.", DimensionNo);
        DimensionValues.SetRange(Code, DimensionCode);
        if DimensionValues.FindFirst() then
            exit(DimensionValues.Name);
    end;
    //Make document attachments uneditable when documents are not open
    procedure CheckDocAttachmentStatusOpen(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef);
    var
        Customer: Record Customer;
        Vendor: Record Vendor;
        Item: Record Item;
        Employee: Record Employee;
        FixedAsset: Record "Fixed Asset";
        Resource: Record Resource;
        SalesHeader: Record "Sales Header";
        PurchaseHeader: Record "Purchase Header";
        Job: Record Job;
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
        VATReportHeader: Record "VAT Report Header";
        PaymentTerms: Record "Payments";
        PayTerms: Record "Payment Terms";
        PHeader: Record "Purchase Header";
        Receipts: record "Receipts Header1";
        imemo: record "Imprest Memo";
        Measurements: Record "Measurement &  Payment Header";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        SiteInstructionsHeader: Record "Site Instructions Header";
        ProjectStaffVoucher: Record "Project Staff Voucher";
        ProjectMobilization: Record "Project Mobilization Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        TemporarySupervisionReq: Record "Temporary Supervision Requirem";
        WeeklyWorkPlan: Record "Work Plan Header";
        ContractorInspectionRequest: Record "Contractor Inspection Request";
        DailyWorkRecord: Record "Daily Work Records";
        SurveyQualityCheckH: Record "Survey Quality Check Header";
        MaterialTestRecord: Record "Material Test Record";
        InspectionHeader: Record "Inspection Headersss";
        InspectionHeader1: Record "Inspection Header1";
        PostedDocumentErr: Label 'You cannot add/modify attachments for a posted document. %1, %2';
        Jobs: Record Job;
    begin
        //  RecRef.Close();
        case DocumentAttachment."Table ID" of
            0:
                exit;
            DATABASE::Customer:
                begin
                    //RecRef.Open(DATABASE::Customer);
                    if Customer.Get(DocumentAttachment."No.") then
                        Customer.TestField(Status, Customer.Status::Open);
                end;
            DATABASE::Vendor:
                begin
                    //RecRef.Open(DATABASE::Vendor);
                    if Vendor.Get(DocumentAttachment."No.") then
                        Vendor.TestField(Status, Vendor.Status::Open);
                end;
            DATABASE::Item:
                begin
                    // RecRef.Open(DATABASE::Item);
                    if Item.Get(DocumentAttachment."No.") then
                        exit;
                end;
            DATABASE::Employee:
                begin
                    RecRef.Open(DATABASE::Employee);
                    if Employee.Get(DocumentAttachment."No.") then
                        exit;//Employee.TestField(Status, Employee.Status::Open);
                end;
            DATABASE::"Fixed Asset":
                begin
                    //RecRef.Open(DATABASE::"Fixed Asset");
                    if FixedAsset.Get(DocumentAttachment."No.") then
                        exit;//FixedAsset.TestField(Status, FixedAsset.Status::Open);
                end;
            DATABASE::Resource:
                begin
                    //RecRef.Open(DATABASE::Resource);
                    if Resource.Get(DocumentAttachment."No.") then
                        exit; //Resource.TestField(Status, Resource.Status::Open);
                end;
            DATABASE::Job:
                begin
                    // RecRef.Open(DATABASE::Job);
                    if Job.Get(DocumentAttachment."No.") then
                        Job.TestField("Approval Status", Job."Approval Status"::Open);
                end;
            DATABASE::"Sales Header":
                begin
                    // RecRef.Open(DATABASE::"Sales Header");
                    if SalesHeader.Get(DocumentAttachment."Document Type", DocumentAttachment."No.") then
                        SalesHeader.TestField(Status, SalesHeader.Status::Open);
                end;
            DATABASE::"Sales Invoice Header":
                begin
                    // RecRef.Open(DATABASE::"Sales Invoice Header");
                    if SalesInvoiceHeader.Get(DocumentAttachment."No.") then
                        error(PostedDocumentErr, SalesInvoiceHeader.TableCaption, SalesInvoiceHeader."No.");
                end;
            DATABASE::"Sales Cr.Memo Header":
                begin
                    // RecRef.Open(DATABASE::"Sales Cr.Memo Header");
                    if SalesCrMemoHeader.Get(DocumentAttachment."No.") then
                        error(PostedDocumentErr, SalesCrMemoHeader.TableCaption, SalesCrMemoHeader."No.");
                end;
            DATABASE::"Purchase Header":
                begin
                    // RecRef.Open(DATABASE::"Purchase Header");
                    if PurchaseHeader.Get(DocumentAttachment."Document Type", DocumentAttachment."No.") then
                        PurchaseHeader.TestField(Status, PurchaseHeader.Status::Open);
                end;
            DATABASE::"Purch. Inv. Header":
                begin
                    //  RecRef.Open(DATABASE::"Purch. Inv. Header");
                    if PurchInvHeader.Get(DocumentAttachment."No.") then
                        error(PostedDocumentErr, PurchInvHeader.TableCaption, PurchInvHeader."No.");
                end;
            DATABASE::"Purch. Cr. Memo Hdr.":
                begin
                    // RecRef.Open(DATABASE::"Purch. Cr. Memo Hdr.");
                    if PurchCrMemoHdr.Get(DocumentAttachment."No.") then
                        error(PostedDocumentErr, PurchCrMemoHdr.TableCaption, PurchCrMemoHdr."No.");
                end;
            DATABASE::"VAT Report Header":
                begin
                    // RecRef.Open(DATABASE::"VAT Report Header");
                    if VATReportHeader.Get(DocumentAttachment."VAT Report Config. Code", DocumentAttachment."No.") then
                        VATReportHeader.TestField(Status, VATReportHeader.Status::Open);
                end;
            DATABASE::"Payments":
                begin
                    // RecRef.Open(DATABASE::"Payments");
                    if PaymentTerms.Get(DocumentAttachment."No.") then
                        PaymentTerms.TestField(Status, PaymentTerms.Status::Open);
                end;
            DATABASE::"Imprest Memo":
                begin
                    //RecRef.Open(DATABASE::"Imprest Memo");
                    if imemo.Get(DocumentAttachment."No.") then
                        imemo.TestField(Status, imemo.Status::Open);
                end;
            DATABASE::"Payment Terms":
                begin
                    ////  RecRef.Open(DATABASE::"Payment Terms");
                    if PayTerms.Get(DocumentAttachment."No.") then
                        Exit;//PayTerms.TestField(Status, PayTerms.Status::Open);
                end;
            DATABASE::"Receipts Header1":
                begin
                    // RecRef.Open(DATABASE::"Receipts Header1");
                    if Receipts.Get(DocumentAttachment."No.") then
                        Receipts.TestField(Status, Receipts.Status::Open);
                end;
            Database::"Measurement &  Payment Header":
                begin
                    //RecRef.Open(Database::"Measurement &  Payment Header");
                    Measurements.Reset();
                    Measurements.SetRange("Document No.", DocumentAttachment."No.");
                    if Measurements.findfirst() then
                        Measurements.TestField(Status, Measurements.Status::Open);
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    //RecRef.Open(Database::"Insurance/Guarantee Header");
                    InsuranceGuarantee.Reset();
                    InsuranceGuarantee.SetRange("Document No.", DocumentAttachment."No.");
                    if InsuranceGuarantee.findfirst() then
                        InsuranceGuarantee.TestField(Status, InsuranceGuarantee.Status::Open);
                end;
            Database::"Site Instructions Header":
                begin
                    // RecRef.Open(Database::"Site Instructions Header");
                    SiteInstructionsHeader.Reset();
                    SiteInstructionsHeader.SetRange("Document No.", DocumentAttachment."No.");
                    if SiteInstructionsHeader.FindFirst() then
                        SiteInstructionsHeader.TestField(Status, SiteInstructionsHeader.Status::Open);
                end;
            Database::"Project Staff Voucher":
                begin
                    //RecRef.Open(Database::"Project Staff Voucher");
                    ProjectStaffVoucher.Reset();
                    ProjectStaffVoucher.SetRange("Document No.", DocumentAttachment."No.");
                    if ProjectStaffVoucher.findfirst() then
                        ProjectStaffVoucher.TestField(Status, ProjectStaffVoucher.Status::Open);
                end;
            Database::"Project Mobilization Header":
                begin
                    //RecRef.Open(Database::"Project Mobilization Header");
                    ProjectMobilization.Reset();
                    ProjectMobilization.SetRange("Document No.", DocumentAttachment."No.");
                    if ProjectMobilization.findfirst() then
                        ProjectMobilization.TestField(Status, ProjectMobilization.Status::Open);
                end;
            Database::"Project Meeting Register":
                begin
                    //RecRef.Open(Database::"Project Meeting Register");
                    ProjectMeetingRegister.Reset();
                    ProjectMeetingRegister.SetRange("Meeting ID", DocumentAttachment."No.");
                    if ProjectMeetingRegister.findfirst() then
                        ProjectMeetingRegister.TestField(Status, ProjectMeetingRegister.Status::Open);
                end;
            Database::"WEP Contractor Submission":
                begin
                    //RecRef.Open(Database::"WEP Contractor Submission");
                    WEPContractorSubmission.Reset();
                    WEPContractorSubmission.SetRange("Document No", DocumentAttachment."No.");
                    if WEPContractorSubmission.findfirst() then
                        WEPContractorSubmission.TestField(Status, WEPContractorSubmission.Status::Open);
                end;
            Database::"Temporary Supervision Requirem":
                begin
                    //  RecRef.Open(Database::"Temporary Supervision Requirem");
                    TemporarySupervisionReq.Reset();
                    TemporarySupervisionReq.SetRange("Document No", DocumentAttachment."No.");
                    if TemporarySupervisionReq.findfirst() then
                        TemporarySupervisionReq.TestField(Status, TemporarySupervisionReq.Status::Open);
                end;
            Database::"Work Plan Header":
                begin
                    //RecRef.Open(Database::"Work Plan Header");
                    WeeklyWorkPlan.Reset();
                    WeeklyWorkPlan.SetRange("Document No.", DocumentAttachment."No.");
                    if WeeklyWorkPlan.findfirst() then
                        WeeklyWorkPlan.TestField(Status, WeeklyWorkPlan.Status::Open);
                end;
            Database::"Contractor Inspection Request":
                begin
                    //RecRef.Open(Database::"Contractor Inspection Request");
                    ContractorInspectionRequest.Reset();
                    ContractorInspectionRequest.SetRange("Document No.", DocumentAttachment."No.");
                    if ContractorInspectionRequest.findfirst() then
                        ContractorInspectionRequest.TestField("Approval Status", ContractorInspectionRequest."Approval Status"::Open);
                end;
            Database::"Daily Work Records":
                begin
                    //  RecRef.Open(Database::"Daily Work Records");
                    DailyWorkRecord.Reset();
                    DailyWorkRecord.SetRange("Daily Work No", DocumentAttachment."No.");
                    if DailyWorkRecord.findfirst() then
                        exit;//DailyWorkRecord.TestField(Status, DailyWorkRecord.Status::Open);
                end;
            Database::"Survey Quality Check Header":
                begin
                    // RecRef.Open(Database::"Survey Quality Check Header");
                    SurveyQualityCheckH.Reset();
                    SurveyQualityCheckH.SetRange("Document No", DocumentAttachment."No.");
                    if SurveyQualityCheckH.findfirst() then
                        SurveyQualityCheckH.TestField(Status, SurveyQualityCheckH.Status::Open);
                end;
            Database::"Material Test Record":
                begin
                    //RecRef.Open(Database::"Material Test Record");
                    MaterialTestRecord.Reset();
                    MaterialTestRecord.SetRange(Code, DocumentAttachment."No.");
                    if MaterialTestRecord.findfirst() then
                        MaterialTestRecord.TestField(Status, MaterialTestRecord.Status::Open);
                end;
            Database::"Inspection Headersss":
                begin
                    // RecRef.Open(Database::"Inspection Headersss");
                    InspectionHeader.Reset();
                    InspectionHeader.SetRange("Inspection No", DocumentAttachment."No.");
                    if InspectionHeader.findfirst() then
                        InspectionHeader.TestField(Status, InspectionHeader.Status::Open);
                end;
            Database::"Inspection Header1":
                begin
                    //RecRef.Open(Database::"Inspection Header1");
                    InspectionHeader1.Reset();
                    InspectionHeader1.SetRange("Inspection No", DocumentAttachment."No.");
                    if InspectionHeader1.findfirst() then
                        InspectionHeader1.TestField(Status, InspectionHeader.Status::Open);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnBeforeInsertAttachment', '', false, false)]
    local procedure OnBeforeInsertAttachment(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    begin
        CheckDocAttachmentStatusOpen(DocumentAttachment, RecRef);
    end;
    //[EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false,false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    begin
        //  CheckDocAttachmentStatusOpen(DocumentAttachment, RecRef);
    end;

    //Get Region Head
    procedure GetReportsTo(operatingUnitType: Enum "Responsibility Center Operating unit types"; UnitCode: Code[20]): Text
    var
        ResponsibilityCenter: Record "Responsibility Center";
        ResponsibilityCenter2: Record "Responsibility Center";
        Positions: Record "Company Positions";
    begin
        ResponsibilityCenter.Reset();
        ResponsibilityCenter.SetRange("Operating Unit Type", operatingUnitType);
        ResponsibilityCenter.SetRange(Code, UnitCode);
        if ResponsibilityCenter.FindFirst() then begin
            Positions.Reset();
            Positions.SetRange("Position ID", ResponsibilityCenter."Headed By (Title)");
            if Positions.FindFirst() then
                if Positions."Job Title" <> '' then
                    exit(Positions."Job Title")
                else begin
                    ResponsibilityCenter2.Reset();
                    ResponsibilityCenter2.SetRange(Code, ResponsibilityCenter."Direct Reports To");
                    if ResponsibilityCenter2.FindFirst() then begin
                        Positions.Reset();
                        Positions.SetRange("Position ID", ResponsibilityCenter2."Headed By (Title)");
                        if Positions.FindFirst() then
                            if Positions."Job Title" <> '' then
                                exit(Positions."Job Title")
                            else
                                exit('Director General');
                    end;
                end;

        end
        else
            exit('Director General');
    end;

    Procedure IsHoliday(CheckDate: Date): Boolean
    var
        BaseCalendar1: Record "Base Calendar Change";
        CompanyInformation: Record "Human Resources Setup";
        HolidayMonthNo: Integer;
        CurrentMonthNo: Integer;
        HolidayDate: Integer;
        CurrentDate: Integer;
    begin
        CompanyInformation.Get();
        BaseCalendar1.Reset;
        BaseCalendar1.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
        BaseCalendar1.SetRange("Recurring System", BaseCalendar1."Recurring System"::"Annual Recurring");
        BaseCalendar1.SetRange(Nonworking, true);
        if BaseCalendar1.FindSet() then begin
            repeat
                CurrentMonthNo := Date2DMY(CheckDate, 2);
                CurrentDate := Date2DMY(CheckDate, 1);
                HolidayMonthNo := Date2DMY(BaseCalendar1.Date, 2);
                HolidayDate := Date2DMY(BaseCalendar1.Date, 1);
                IF (CurrentMonthNo = HolidayMonthNo) and (CurrentDate = HolidayDate) then begin
                    exit(true);
                end;
            until BaseCalendar1.next() = 0;
        end;
    end;

    Procedure BaseCalendarRemoveNonWorkingDays("Start Date": Date; "No. of Days": Decimal; "Includes Holidays": Boolean; "Includes Saturday": Boolean; "Includes Sunday": Boolean) "End Date": Date
    var
        HumanResSetup: Record "Human Resources Setup";
        BaseCalendar: Record "Customized Calendar Change";
        Weekend: Decimal;
        Holidays: Decimal;
        Saturdays: Decimal;
        Sundays: Decimal;
        FromDate: Date;
        ToDate: Date;
        TotalDays: Decimal;
        CompanyInformation: Record "Human Resources Setup";
    begin
        CompanyInformation.get();
        if ("Start Date" <> 0D) and ("No. of Days" <> 0) then begin
            if (not "Includes Holidays") or (not "Includes Saturday") or (not "Includes Sunday") then begin
                Holidays := 0;
                Saturdays := 0;
                Sundays := 0;
                FromDate := "Start Date";
                ToDate := FromDate + "No. of Days";
                if not "Includes Holidays" then begin
                    BaseCalendar.Reset;
                    BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                    BaseCalendar.SetFilter(Date, '%1..%2', FromDate, ToDate);
                    BaseCalendar.SetRange(Nonworking, true);
                    if BaseCalendar.FindSet() then begin
                        repeat
                            if IsHoliday(BaseCalendar.Date) then
                                Holidays += 1;
                        until BaseCalendar.Next() = 0;
                    end;
                end;
                ToDate := FromDate + ("No. of Days" + Holidays);
                if not "Includes Saturday" then begin
                    BaseCalendar.Reset;
                    BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                    BaseCalendar.SetFilter(Date, '%1..%2', FromDate, ToDate);
                    BaseCalendar.SetRange(Day, BaseCalendar.Day::Saturday);
                    if BaseCalendar.FindSet() then begin
                        repeat
                            Saturdays += 1;
                        until BaseCalendar.Next() = 0;
                    end;
                end;
                ToDate := FromDate + ("No. of Days" + Holidays + Saturdays);
                if not "Includes Sunday" then begin
                    BaseCalendar.Reset;
                    BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                    BaseCalendar.SetFilter(Date, '%1..%2', FromDate, ToDate);
                    BaseCalendar.SetRange(Day, BaseCalendar.Day::Sunday);
                    if BaseCalendar.FindSet() then begin
                        repeat
                            Sundays += 1;
                        until BaseCalendar.Next() = 0;
                    end;
                end;
                TotalDays := ("No. of Days" + Holidays + Saturdays + Sundays);
                "End Date" := "Start Date" + TotalDays;
            end else begin
                "End Date" := "Start Date" + "No. of Days";
            end;
            "End Date" := "End Date" - 1;
            //   Message(Format("End Date"));
        end;
    end;

    Procedure BaseCalendarAddNonWorkingDays("Start Date": Date; "No. of Days": Decimal; "Includes Holidays": Boolean; "Includes Saturday": Boolean; "Includes Sunday": Boolean) "End Date": Date
    var
        HumanResSetup: Record "Human Resources Setup";
        BaseCalendar: Record "Customized Calendar Change";
        Weekend: Decimal;
        Holidays: Decimal;
        Saturdays: Decimal;
        Sundays: Decimal;
        FromDate: Date;
        ToDate: Date;
        TotalDays: Decimal;
        CompanyInformation: Record "Human Resources Setup";
        Typehelper: Codeunit "Type Helper";
    begin
    end;

    Procedure CheckIfEndDateIsNonWorking("End Date": Date; "Includes Holidays": Boolean; "Includes Saturday": Boolean; "Includes Sunday": Boolean): Date
    var
        BaseCalendar: Record "Customized Calendar Change";
        CompanyInformation: Record "Human Resources Setup";
    begin
        CompanyInformation.Get();
        if (not "Includes Holidays") or (not "Includes Saturday") or (not "Includes Sunday") then begin
            if not "Includes Holidays" then begin
                BaseCalendar.Reset;
                BaseCalendar.SetRange(BaseCalendar."Base Calendar Code", CompanyInformation."Base Calender Code");
                BaseCalendar.SetRange("Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
                BaseCalendar.SetRange(Nonworking, true);
                BaseCalendar.SetRange(Date, "End Date");
                if BaseCalendar.FindFirst() then
                    "End Date" := "End Date" - 1;
            end;
            if not "Includes Sunday" then begin
                BaseCalendar.Reset;
                BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                BaseCalendar.SetRange(Date, "End Date");
                BaseCalendar.SetRange(Day, BaseCalendar.Day::Sunday);
                if BaseCalendar.FindFirst() then
                    "End Date" := "End Date" - 1;
            end;
            if not "Includes Saturday" then begin
                BaseCalendar.Reset;
                BaseCalendar.SetRange("Base Calendar Code", CompanyInformation."Base Calender Code");
                BaseCalendar.SetRange(Date, "End Date");
                BaseCalendar.SetRange(Day, BaseCalendar.Day::Saturday);
                if BaseCalendar.FindFirst() then
                    "End Date" := "End Date" - 1;
            end;
            if not "Includes Holidays" then begin
                BaseCalendar.Reset;
                BaseCalendar.SetRange(BaseCalendar."Base Calendar Code", CompanyInformation."Base Calender Code");
                BaseCalendar.SetRange("Recurring System", BaseCalendar."Recurring System"::"Annual Recurring");
                BaseCalendar.SetRange(Nonworking, true);
                BaseCalendar.SetRange(Date, "End Date");
                if BaseCalendar.FindFirst() then
                    "End Date" := "End Date" - 1;
            end;
            exit("End Date");
        end;
    end;

    //Transfer Custom fields on approval
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeApprovalEntryInsert', '', false, false)]
    local procedure OnBeforeApprovalEntryInsert(var ApprovalEntry: Record "Approval Entry"; ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepArgument: Record "Workflow Step Argument"; ApproverId: Code[50]; var IsHandled: Boolean)
    var
        EmpLeaveApp: Record "Employee Leave Application";
        UserSetup: Record "User Setup";
        HrSetup: Record "Human Resources Setup";
    begin
        ApprovalEntry."Project Document Type" := ApprovalEntryArgument."Project Document Type";
        ApprovalEntry."Statement No." := ApprovalEntryArgument."Statement No.";
        ApprovalEntry."Employee No." := ApprovalEntryArgument."Employee No.";
        ApprovalEntry."Employee Name" := ApprovalEntryArgument."Employee Name";
        ApprovalEntry."Approver Position" := ApprovalEntryArgument."Approver Position";
        if CheckforActiveDelegationRequest(ApproverId) then begin
            ApprovalEntry."Original Approver ID" := ApproverId;
            ApprovalEntry."Approver ID" := GetDelegationSubstitute(ApproverId);
            ApprovalEntry.Delegated := true;
        end;
    end;
    //Delegate
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeMakeApprovalEntry', '', false, false)]

    local procedure OnBeforeMakeApprovalEntry(var ApprovalEntry: Record "Approval Entry"; ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepArgument: Record "Workflow Step Argument"; ApproverId: Code[50]; var IsHandled: Boolean)
    begin

    end;

    Procedure CheckforActiveDelegationRequest(ApproverID: Code[50]): Boolean
    var
        DocumentApprovalDelegation: Record "Document Approval Delegation";
    begin
        DocumentApprovalDelegation.Reset();
        DocumentApprovalDelegation.SetRange("Current Approver ID", ApproverID);
        DocumentApprovalDelegation.SetRange(Status, DocumentApprovalDelegation.Status::Processed);
        DocumentApprovalDelegation.SetRange(Delegated, true);
        DocumentApprovalDelegation.SetFilter("Start Date", '<=%1', Today);
        DocumentApprovalDelegation.SetFilter("End Date", '>=%1', Today);
        if DocumentApprovalDelegation.FindFirst() then begin
            if ApproverID <> UserId then
                exit(true);
        end;
    end;

    Procedure GetDelegationSubstitute(ApproverID: Code[50]): Code[50]
    var
        DocumentApprovalDelegation: Record "Document Approval Delegation";
    begin
        DocumentApprovalDelegation.Reset();
        DocumentApprovalDelegation.SetRange("Current Approver ID", ApproverID);
        DocumentApprovalDelegation.SetRange(Status, DocumentApprovalDelegation.Status::Processed);
        DocumentApprovalDelegation.SetRange(Delegated, true);
        DocumentApprovalDelegation.SetFilter("Start Date", '<=%1', Today);
        DocumentApprovalDelegation.SetFilter("End Date", '>=%1', Today);
        if DocumentApprovalDelegation.FindFirst() then begin
            if DocumentApprovalDelegation."New Approver ID" <> '' then
                exit(DocumentApprovalDelegation."New Approver ID")
            else
                error('Alternate/Substitute approver cannot be blank');
        end;
    end;
    //Delegate


    //Modify CompanyAddress format
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Format Address", 'OnBeforeCompany', '', false, false)]
    local procedure OnBeforeCompany(var AddrArray: array[8] of Text[100]; var CompanyInfo: Record "Company Information"; var IsHandled: Boolean)
    var
        FormatAddress: Codeunit "Format Address";
    begin
        AddrArray[1] := UpperCase(CompanyInfo.Name);
        AddrArray[2] := CompanyInfo.Address;
        AddrArray[3] := CompanyInfo."Address 2" + ' ' + 'NAIROBI' + ', ' + CompanyInfo."Country/Region Name";
        if CompanyInfo."Tel Phone" <> '' then
            AddrArray[4] := CompanyInfo."Phone No." + '/' + CompanyInfo."Phone No. 2" + '/' + CompanyInfo."Tel Phone"
        else
            AddrArray[4] := CompanyInfo."Phone No." + ' / ' + CompanyInfo."Phone No. 2";
        AddrArray[5] := CompanyInfo."E-Mail" + '   ' + CompanyInfo."Home Page";
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Format Address", 'OnBeforeRespCenter', '', false, false)]
    local procedure OnBeforeRespCenter(var AddrArray: array[8] of Text[100]; var RespCenter: Record "Responsibility Center"; var IsHandled: Boolean)
    var
        CompanyInfo: Record "Company Information";
        FormatAddress: Codeunit "Format Address";
    begin
        // if not RespCenter.HQ then begin
        CompanyInfo.Get();
        AddrArray[1] := UpperCase(CompanyInfo.Name);
        AddrArray[2] := RespCenter.Name;
        AddrArray[3] := RespCenter.Address;
        AddrArray[4] := RespCenter."Address 2";
        AddrArray[5] := RespCenter."Phone No.";
        AddrArray[6] := RespCenter."E-Mail" + '   ' + CompanyInfo."Home Page";
        // FormatAddress.FormatAddr(
        //       AddrArray, CompanyInfo.Name, RespCenter.Name, RespCenter.Contact, RespCenter.Address, RespCenter."Address 2",
        //       RespCenter.City, RespCenter."Post Code", RespCenter.County, RespCenter."Country/Region Code");
        IsHandled := true;
        //end;
    end;


    //Modify CompanyAddress format


    procedure ApproverLabel(var ApproverArray: array[8] of Text[100])
    var
        FormatAddress: Codeunit "Format Address";
    begin
        ApproverArray[1] := 'Checked By: ';
        ApproverArray[2] := 'Confirmed By: ';
        ApproverArray[3] := 'Label 3';
        ApproverArray[4] := 'Label 4';
        ApproverArray[5] := 'Label 5';
    end;

    procedure PositionLabel(var TitleArray: array[8] of Text[100]; CompanyPositions: Record "Company Positions")
    begin
        TitleArray[1] := 'Direcror General: ';
        TitleArray[2] := 'Deputy Director: ';
        TitleArray[3] := 'Resident Engineer: ';
        TitleArray[4] := 'Engineer: ';
        TitleArray[5] := 'Other: ';
    end;



    ///Copy Attachments
    procedure CopyAttachments(var FromRecRef: RecordRef; var ToRecRef: RecordRef; FromDocNoFieldNo: Integer; FromDocumentType: Enum "Attachment Document Type"; ToDocNoFieldNo: Integer; ToDocumentType: Enum "Attachment Document Type")
    var
        FromDocumentAttachment: Record "Document Attachment";
        ToDocumentAttachment: Record "Document Attachment";
        FromFieldRef: FieldRef;
        ToFieldRef: FieldRef;
        FromNo: Code[20];
        ToNo: Code[20];
        IsHandled: Boolean;
    begin
        FromDocumentAttachment.SetRange("Table ID", FromRecRef.Number);
        FromDocumentAttachment.SetRange("Document Type", FromDocumentType);
        FromFieldRef := FromRecRef.Field(FromDocNoFieldNo);
        FromNo := FromFieldRef.Value();
        FromDocumentAttachment.SetRange("No.", FromNo);
        if FromDocumentAttachment.FindSet() then begin
            repeat
                Clear(ToDocumentAttachment);
                ToDocumentAttachment.Init();
                ToDocumentAttachment.TransferFields(FromDocumentAttachment);
                ToDocumentAttachment.Validate("Table ID", ToRecRef.Number);
                ToFieldRef := ToRecRef.Field(ToDocNoFieldNo);
                ToNo := ToFieldRef.Value();
                ToDocumentAttachment.Validate("No.", ToNo);
                ToDocumentAttachment.Validate("Document Type", ToDocumentType);
                ToDocumentAttachment.Insert(true);
            until FromDocumentAttachment.Next() = 0;
        end;
    end;

    local procedure CopyAttachmentsLines(var FromRecRef: RecordRef; var ToRecRef: RecordRef)
    var
        FromDocumentAttachmentLines: Record "Document Attachment";
        ToDocumentAttachmentLines: Record "Document Attachment";
        FromFieldRef: FieldRef;
        ToFieldRef: FieldRef;
        FromDocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        FromNo: Code[20];
        ToNo: Code[20];
    begin
        FromFieldRef := FromRecRef.Field(3);
        FromNo := FromFieldRef.Value();
        FromDocumentAttachmentLines.Reset();

        FromFieldRef := FromRecRef.Field(1);
        FromDocumentType := FromFieldRef.Value();
        FromDocumentAttachmentLines.SetRange("Document Type", FromDocumentType);

        ToFieldRef := ToRecRef.Field(3);
        ToNo := ToFieldRef.Value();

        case FromRecRef.Number() of
            DATABASE::"Sales Header":
                FromDocumentAttachmentLines.SetRange("Table ID", DATABASE::"Sales Line");
            DATABASE::"Purchase Header":
                FromDocumentAttachmentLines.SetRange("Table ID", DATABASE::"Purchase Line");
        end;
        FromDocumentAttachmentLines.SetRange("No.", FromNo);
        FromDocumentAttachmentLines.SetRange("Document Type", FromDocumentType);

        if FromDocumentAttachmentLines.FindSet() then
            repeat
                ToDocumentAttachmentLines.TransferFields(FromDocumentAttachmentLines);
                case ToRecRef.Number of
                    DATABASE::"Sales Invoice Header":
                        ToDocumentAttachmentLines.Validate("Table ID", DATABASE::"Sales Invoice Line");
                    DATABASE::"Sales Cr.Memo Header":
                        ToDocumentAttachmentLines.Validate("Table ID", DATABASE::"Sales Cr.Memo Line");
                    DATABASE::"Purch. Inv. Header":
                        ToDocumentAttachmentLines.Validate("Table ID", DATABASE::"Purch. Inv. Line");
                    DATABASE::"Purch. Cr. Memo Hdr.":
                        ToDocumentAttachmentLines.Validate("Table ID", DATABASE::"Purch. Cr. Memo Line");
                end;

                Clear(ToDocumentAttachmentLines."Document Type");
                ToDocumentAttachmentLines.Validate("No.", ToNo);

                if ToDocumentAttachmentLines.Insert(true) then;
            until FromDocumentAttachmentLines.Next() = 0;
    end;


    Procedure GetEmployeeNameFromUserID(UsersID: Code[50]): Text
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.get(UsersID) then
            exit(UserSetup."Employee Name");
    end;


    //Sto checking job status when posting invoice
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Check Line", 'OnRunCheckOnBeforeTestFieldJobStatus', '', false, false)]

    local procedure OnRunCheckOnBeforeTestFieldJobStatus(var IsHandled: Boolean; var JobJnlLine: Record "Job Journal Line")
    begin
        IsHandled := true;
    end;


    //Get document
    Procedure GetDocument(FilePath: Text)
    var
        ImportXmlFile: File;
        XmlINStream: InStream;
        FileManagement: Codeunit "File Management";
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;
        InStream: InStream;
        InputFile: File;
        FileDoesNotExistErr: Label 'The file %1 does not exist.', Comment = '%1 File Path';
    begin
        if FileManagement.ServerFileExists(FilePath) then begin
            FileManagement.IsAllowedPath(FilePath, false);

            if not FILE.Exists(FilePath) then
                Error(FileDoesNotExistErr, FilePath);

            InputFile.Open(FilePath);
            InputFile.CreateInStream(InStream);
            TempBlob.CreateOutStream(OutStream);
            CopyStream(OutStream, InStream);
            FileManagement.GetFileName(FilePath);
            FileManagement.GetFileNameMimeType(FilePath);
        end;


    end;

    /********************************Commitment Entries*********************/
    [Scope('OnPrem')]
    procedure FnCommitAmount(Amount: Decimal; "Account Type": Enum "Gen. Journal Account Type"; AccountNo: Code[50]; Budget: Code[50]; DocNo: Code[50]; SourceType: Enum "Commitment Document Type"; Dim1: Code[30]; Dim2: Code[30]; Dim3: Code[30]; DocDate: Date; "Commitment Type": Enum "Commitment Type"; Description: Text[250])
    var
        CommitmentEntries1: Record "Commitment Entries";
        LastEnrtyNo: Integer;
    begin
        TestFieldDatesOnGLBudgets();
        CommitmentEntries1.Init;
        CommitmentEntries1."Entry No" := FnGetLastCommitmentEntryNo() + 1;
        CommitmentEntries1."Commitment Type" := "Commitment Type";
        CommitmentEntries1."Account Type" := "Account Type";
        CommitmentEntries1."Account No." := AccountNo;
        CommitmentEntries1.Validate("Account No.");
        CommitmentEntries1."Budget Year" := Budget;
        CommitmentEntries1."Commitment No" := DocNo;
        // CommitmentEntries1."Document No" := DocNo;
        CommitmentEntries1."Committed Amount" := Amount;
        CommitmentEntries1."Global Dimension 1 Code" := Dim1;
        CommitmentEntries1."Global Dimension 2 Code" := Dim2;
        CommitmentEntries1."Shortcut Dimension 3 Code" := Dim3;
        CommitmentEntries1.Description := Description;
        CommitmentEntries1."Source Type" := SourceType;
        CommitmentEntries1."Commitment Date" := DocDate;
        CommitmentEntries1."Time Stamp" := CurrentDateTime;
        CommitmentEntries1."Commitment Date" := Today;
        CommitmentEntries1.User := UserId;
        if Amount <> 0 then
            CommitmentEntries1.Insert(true);
    end;

    procedure FnGetLastCommitmentEntryNo(): Integer
    var
        ObjCommEntries: Record "Commitment Entries";
    begin
        ObjCommEntries.Reset();
        ObjCommEntries.SetCurrentKey("Entry No");
        if ObjCommEntries.FindLast() then
            exit(ObjCommEntries."Entry No")
        else
            exit(0);
    end;


    Procedure TestFieldDatesOnGLBudgets()
    var
        GLBudgetName: Record "G/L Budget Name";
    begin
        GLBudgetName.Reset();
        GLBudgetName.SetFilter(Name, '<>%1', '');
        if GLBudgetName.findset() then begin
            repeat
                if (GLBudgetName."Start Date" = 0D) or (GLBudgetName."End Date" = 0D) then
                    error('Budget %1 must have both start and end Date', GLBudgetName.Name);
            until GLBudgetName.next() = 0;
        end;
    end;

    Procedure GetBudgetYear(PostingDate: Date): Code[10]
    var
        GLBudgetName: Record "G/L Budget Name";
    begin
        GLBudgetName.Reset();
        GLBudgetName.SetFilter("Start Date", '<=%1', PostingDate);
        GLBudgetName.SetFilter("End Date", '>=%1', PostingDate);
        if GLBudgetName.FindFirst() then
            exit(GLBudgetName.Name);
    end;

    Procedure GetBudgetYearStartDate(FY: Code[30]): Date
    var
        GLBudgetName: Record "G/L Budget Name";
    begin
        GLBudgetName.Reset();
        GLBudgetName.SetRange(Name, FY);
        if GLBudgetName.FindFirst() then
            exit(GLBudgetName."Start Date");
    end;


    Procedure GetCommittedAmount(AccountNo: Code[20]; FinancialYear: Code[20]; "Global Dimension 1 Code": Code[20]; "Global Dimension 2 Code": Code[20]; "Shortcut Dimension 3 Code": Code[20]): Decimal
    var
        CommitmentEntries: Record "Commitment Entries";
        CommittedAmount: Decimal;
        Dimensions: Record Dimension;
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        CommittedAmount := 0;
        CommitmentEntries.Reset();
        CommitmentEntries.SetRange("Account No.", AccountNo);
        CommitmentEntries.SETRANGE("Budget Year", FinancialYear);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 1 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            CommitmentEntries.SetRange("Global Dimension 1 Code", "Global Dimension 1 Code");
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 2 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            CommitmentEntries.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Shortcut Dimension 3 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            CommitmentEntries.SetRange("Shortcut Dimension 3 Code", "Shortcut Dimension 3 Code");
        if CommitmentEntries.FindSet() then begin
            repeat
                CommittedAmount := CommittedAmount + CommitmentEntries."Committed Amount";
            until CommitmentEntries.next() = 0;
        end;
        exit(CommittedAmount);
    end;

    Procedure GetActualSpent(AccountNo: Code[20]; "Global Dimension 1 Code": Code[20]; "Global Dimension 2 Code": Code[20]; "Shortcut Dimension 3 Code": Code[20]): Decimal
    var
        GLEntry: Record "G/L Entry";
        "Actual Spent": Decimal;
        Dimensions: Record Dimension;
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        "Actual Spent" := 0;
        GLEntry.Reset;
        GLEntry.SetRange(GLEntry."G/L Account No.", AccountNo);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 1 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            GLEntry.SetRange("Global Dimension 1 Code", "Global Dimension 1 Code");
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 2 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            GLEntry.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Shortcut Dimension 3 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            GLEntry.SetRange("Shortcut Dimension 3 Code", "Shortcut Dimension 3 Code");
        if GLEntry.Findset() then begin
            repeat
                if GetBudgetYear(GLEntry."Posting Date") = GLSetup."Current Budget" then
                    "Actual Spent" := "Actual Spent" + GLEntry.Amount;
            until GLEntry.next() = 0
        end;
        exit("Actual Spent");
    end;

    Procedure GetBudgtedAmount(AccountNo: Code[20]; Dim1: Code[20]; Dim2: Code[20]; Dim3: Code[20]): Decimal
    var
        BudgetEntry: Record "G/L Budget Entry";
        GLSetup: Record "General Ledger Setup";
        CMS: Record "Cash Management Setup";
        BudgettedAmount: Decimal;
        Dimensions: Record Dimension;
    begin
        BudgettedAmount := 0;
        CMS.Get;
        GLSetup.get();
        BudgetEntry.Reset();
        BudgetEntry.SetRange(BudgetEntry."Budget Name", CMS."Current Budget");
        BudgetEntry.SetRange(BudgetEntry."G/L Account No.", AccountNo);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 1 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            BudgetEntry.SetRange(BudgetEntry."Global Dimension 1 Code", Dim1);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Global Dimension 2 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            BudgetEntry.SetRange(BudgetEntry."Global Dimension 2 Code", Dim2);
        Dimensions.Reset();
        Dimensions.SetRange(Code, GLSetup."Shortcut Dimension 3 Code");
        Dimensions.SetRange("Affects Budget", true);
        if Dimensions.FindFirst() then
            BudgetEntry.SetRange(BudgetEntry."Shortcut Dimension 3 Code", Dim3);
        if BudgetEntry.FindFirst() then begin
            BudgetEntry.CalcSums(Amount);
            BudgettedAmount := BudgetEntry.Amount;
        end;
        exit(BudgettedAmount);
    end;

    Procedure CommitImprest(ImprestMemo: Record "Imprest Memo")
    var
        ProjectMembers: Record "Project Members";
        OtherCosts: Record "Other Costs";
        Casual: Record Casuals;
        ProjectMembers2: Record "Project Members";

        Casual2: Record Casuals;
        PaymentTypes: Record "Receipts and Payment Types1";
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentEntries: Record "Commitment Entries";
        CommitmentType: Enum "Commitment Type";
        CustomFunction: Codeunit "Custom Function";
        WorkTypes: Record "Work Type";
    begin
        //project members
        ProjectMembers.Reset();
        ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if ProjectMembers.findset() then begin
            repeat
                if ProjectMembers."Available Amount" < (OtherLineAmountsProject(ProjectMembers) + ProjectMembers."Total Entitlement") then
                    Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', ProjectMembers."Available Amount", ProjectMembers."Budgeted Amount", ProjectMembers."Total Entitlement");
                PaymentTypes.Reset();
                PaymentTypes.SetRange(Code, ProjectMembers."Vote Item");
                if PaymentTypes.findfirst() then
                    CustomFunction.FnCommitAmount(ProjectMembers."Total Entitlement", "Account Type"::"G/L Account", PaymentTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestMemo."Project Description", 1, 2048));
            until ProjectMembers.next() = 0;
        end;
        //casuals
        Casual.Reset();
        Casual.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if Casual.findset() then begin
            repeat
                if Casual."Available Amount" < (OtherLineAmountsCasuals(Casual) + Casual.Amount) then
                    Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', Casual."Available Amount", Casual."Budgeted Amount", Casual.Amount);
                WorkTypes.Reset();
                WorkTypes.SetRange(Code, Casual."Work Type");
                if WorkTypes.FindFirst() then
                    CustomFunction.FnCommitAmount(Casual.Amount, "Account Type"::"G/L Account", WorkTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestMemo."Project Description", 1, 2048));
            until Casual.next() = 0;
        end;
        //other costs
        OtherCosts.Reset();
        OtherCosts.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if OtherCosts.findset() then begin
            repeat
                if OtherCosts."Available Amount" < (OtherCosts."Line Amount" + OtherLineAmountsOtherCosts(OtherCosts)) then
                    Error('You have exceeded the budget. Available amount is %1 and the budgetted amount is %2.The amount you are applying for is %3.', OtherCosts."Available Amount", OtherCosts."Budgeted Amount", OtherCosts."Vote Amount");
                PaymentTypes.Reset();
                PaymentTypes.SetRange(Code, OtherCosts."Vote Item");
                if PaymentTypes.findfirst() then
                    CustomFunction.FnCommitAmount(OtherCosts."Line Amount", "Account Type"::"G/L Account", PaymentTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestMemo."Project Description", 1, 2048));
            until OtherCosts.next() = 0;
        end;
    end;

    Local Procedure OtherLineAmountsCasuals(Casual: Record Casuals): Decimal
    var
        Casual2: Record Casuals;
        LineAmount: Decimal;
    begin
        LineAmount := 0;
        Casual2.Reset();
        Casual2.SetRange("Imprest Memo No.", Casual."Imprest Memo No.");
        Casual2.SetRange("Work Type", Casual."Work Type");
        Casual2.Setfilter("Resource No.", '<>%1', Casual."Resource No.");
        if Casual2.findset() then begin
            repeat
                LineAmount := LineAmount + Casual2.Amount;
            until Casual2.Next() = 0;
        end;
        exit(LineAmount);
    end;

    Local Procedure OtherLineAmountsProject(ProjectMembers: Record "Project Members"): Decimal
    var
        ProjectMembers2: Record "Project Members";
        LineAmount: Decimal;
    begin
        LineAmount := 0;
        ProjectMembers2.Reset();
        ProjectMembers2.SetRange("No.", ProjectMembers."No.");
        ProjectMembers2.SetRange("Vote Item", ProjectMembers."Vote Item");
        ProjectMembers2.Setfilter("Line No", '<>%1', ProjectMembers."Line No");
        if ProjectMembers2.findset() then begin
            repeat
                LineAmount := LineAmount + ProjectMembers2."Vote Amount";
            until ProjectMembers2.Next() = 0;
        end;
        exit(LineAmount);
    end;

    Local Procedure OtherLineAmountsOtherCosts(OtherCosts: Record "Other Costs"): Decimal
    var
        OtherCosts2: Record "Other Costs";
        LineAmount: Decimal;
    begin
        LineAmount := 0;
        OtherCosts2.Reset();
        OtherCosts2.SetRange("No.", OtherCosts."No.");
        OtherCosts2.SetRange(Type, OtherCosts2.Type::"G/L Account");
        OtherCosts2.SetRange("Vote Item", OtherCosts."Vote Item");
        OtherCosts2.Setfilter("Line No.", '<>%1', OtherCosts."Line No.");
        if OtherCosts2.findset() then begin
            repeat
                LineAmount := LineAmount + OtherCosts2."Vote Amount";
            until OtherCosts2.Next() = 0;
        end;
        exit(LineAmount);
    end;

    Procedure UnCommitImprest(ImprestMemo: Record "Imprest Memo")
    var
        ProjectMembers: Record "Project Members";
        OtherCosts: Record "Other Costs";
        PaymentTypes: Record "Receipts and Payment Types1";
        "Account Type": Enum "Gen. Journal Account Type";
        CommitmentEntries: Record "Commitment Entries";
        CommitmentType: Enum "Commitment Type";
        CustomFunction: Codeunit "Custom Function";
        Casual: Record Casuals;
        WorkTypes: Record "Work Type";
    begin
        //project members
        ProjectMembers.Reset();
        ProjectMembers.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if ProjectMembers.findset() then begin
            repeat
                PaymentTypes.Reset();
                PaymentTypes.SetRange(Code, ProjectMembers."Vote Item");
                if PaymentTypes.findfirst() then
                    CustomFunction.FnCommitAmount(-ProjectMembers."Total Entitlement", "Account Type"::"G/L Account", PaymentTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestMemo."Project Description", 1, 2048));
            until ProjectMembers.next() = 0;
        end;
        //casuals
        Casual.Reset();
        Casual.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if Casual.findset() then begin
            repeat
                WorkTypes.Reset();
                WorkTypes.SetRange(Code, Casual."Work Type");
                if WorkTypes.FindFirst() then
                    CustomFunction.FnCommitAmount(-Casual.Amount, "Account Type"::"G/L Account", WorkTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestMemo."Project Description", 1, 2048));
            until Casual.next() = 0;
        end;
        //other costs
        OtherCosts.Reset();
        OtherCosts.SetRange("Imprest Memo No.", ImprestMemo."No.");
        if OtherCosts.findset() then begin
            repeat
                PaymentTypes.Reset();
                PaymentTypes.SetRange(Code, OtherCosts."Vote Item");
                if PaymentTypes.findfirst() then
                    CustomFunction.FnCommitAmount(-OtherCosts."Vote Amount", "Account Type"::"G/L Account", PaymentTypes."G/L Account", CustomFunction.GetBudgetYear(ImprestMemo.Date), ImprestMemo."No.", CommitmentEntries."Source Type"::Imprest, ImprestMemo."Shortcut Dimension 1 Code", ImprestMemo."Shortcut Dimension 2 Code", ImprestMemo."Shortcut Dimension 3 Code", ImprestMemo.Date, CommitmentType::Reversal, CopyStr('Cancellation ' + ImprestMemo."Project Description", 1, 2048));
            until OtherCosts.next() = 0;
        end;
    end;

    /********************************Commitment Entries******************/

    /****************Try to add a teams meeting to outlook**********/
    local procedure GenerateICS(Cancel: Boolean; LeaveApplication: Record "Employee Leave Application") ICS: Text
    var
        StringBuilder: DotNet StringBuilder;
        Location: Text;
        Summary: Text;
        Status: Text;
        Method: Text;
        Description: Text;
        ProdIDTxt: Label '//Microsoft Corporation//Dynamics 365//EN', Locked = true;
        DateTimeFormatTxt: Label '<Year4><Month,2><Day,2>T<Hours24,2><Minutes,2><Seconds,2>', Locked = true;
        StartTime: Time;
        EndTime: Time;
    begin
        Location := GetLocation();
        Summary := StrSubstNo('%1 LEAVE :%2', LeaveApplication."Leave Code", LeaveApplication."Employee Name");

        if Cancel then begin
            Method := 'CANCEL';
            Status := 'CANCELLED';
        end else begin
            Method := 'REQUEST';
            Status := 'CONFIRMED';
        end;
        Description := GetDescription(LeaveApplication);

        StringBuilder := StringBuilder.StringBuilder;
        with StringBuilder do begin
            AppendLine('BEGIN:VCALENDAR');
            AppendLine('VERSION:2.0');
            AppendLine('PRODID:-' + ProdIDTxt);
            AppendLine('METHOD:' + Method);
            AppendLine('BEGIN:VEVENT');
            AppendLine('UID:' + DelChr(LeaveApplication."User ID", '<>', '{}'));
            AppendLine('ORGANIZER:' + GetOrganizer);
            AppendLine('LOCATION:' + '');
            Evaluate(EndTime, '08:00');
            Evaluate(StartTime, '08:30');
            AppendLine('DTSTART;TZID=E. Africa Standard Time:' + format(CreateDateTime(WorkDate, StartTime), 0, DateTimeFormatTxt));
            AppendLine('DTEND;TZID=E. Africa Standard Time:' + format(CreateDateTime(WorkDate, EndTime), 0, DateTimeFormatTxt));
            AppendLine('SUMMARY:' + Summary);
            AppendLine('DESCRIPTION:' + Description);
            AppendLine('X-ALT-DESC;FMTTYPE=' + GetHtmlDescription(Description));
            AppendLine('isOnlineMeeting: true');
            AppendLine('onlineMeetingProvider: teamsForBusiness');
            AppendLine('SEQUENCE:' + Format('Document No'));
            AppendLine('STATUS:' + Status);
            AppendLine('END:VEVENT');
            AppendLine('END:VCALENDAR');
        end;

        ICS := StringBuilder.ToString;
    end;

    local procedure GetLocation(): Text
    var
        CompanyInfo: Record "Company Information";
    begin
        if CompanyInfo.get() then begin
            exit(StrSubstNo('%1, %2, %3', CompanyInfo.Address, CompanyInfo.City, CompanyInfo."Country/Region Code"));
        end;
    end;

    local procedure GetOrganizer(): Text
    var
        CompanyInfo: Record "Company Information";
    begin
        if CompanyInfo.Get() then
            exit(CompanyInfo."E-Mail");
    end;

    local procedure GetHtmlDescription(Description: Text) HtmlAppointDescription: Text
    var
        Regex: Codeunit Regex;
    begin
        HtmlAppointDescription := Regex.Replace(Description, '\\r', '');
        HtmlAppointDescription := Regex.Replace(HtmlAppointDescription, '\\n', '<br>');
        HtmlAppointDescription := 'text/html:<html><body>' + HtmlAppointDescription + '</html></body>';
    end;



    local procedure GetDescription(var LeaveApplication: Record "Employee Leave Application") AppointmentDescription: Text
    var
        AppointmentFormat: Text;
        Application: Text;
        Emp: Text;
        LeaveCode: Text;
        StartDat: Text;
        EndDate: Text;
        NoOfDays: Text;
    begin
        Application := 'Application No: ' + LeaveApplication."Application No";
        Emp := 'Employee: ' + LeaveApplication."Employee Name";
        LeaveCode := 'Leave Code: ' + LeaveApplication."Leave Code";
        StartDat := 'Start Date: ' + format(LeaveApplication."Start Date", 0, 4);
        EndDate := 'End Date: ' + format(LeaveApplication."End Date", 0, 4);
        NoOfDays := 'No of Days: ' + format(LeaveApplication."Approved Days");
        AppointmentFormat := Application + '\n\n';
        AppointmentFormat += Emp + '\n\n';
        AppointmentFormat += LeaveCode + '\n\n';
        AppointmentFormat += StartDat + '\n\n';
        AppointmentFormat += EndDate + '\n\n';
        AppointmentFormat += NoOfDays;
        AppointmentDescription := AppointmentFormat;
    end;

    procedure GenerateEmail(var RecipientEmail: Text[80]; Cancel: Boolean)
    var
        TempBlob: Codeunit "Temp Blob";
        Stream: OutStream;
        InStream: Instream;
        ICS: Text;
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        LeaveApplication: Record "Employee Leave Application";
    begin
        LeaveApplication.Reset();
        if LeaveApplication.FindLast() then
            ICS := GenerateICS(Cancel, LeaveApplication);
        TempBlob.CreateOutStream(Stream, TextEncoding::UTF8);
        Stream.Write(ICS);
        TempBlob.CreateInStream(InStream);

        // TempEmailItem.Initialize;
        // TempEmailItem.Subject := StrSubstNo('%1 LEAVE: %2', LeaveApplication."Leave Code", LeaveApplication."Employee Name");
        // TempEmailItem.AddAttachment(InStream, StrSubstNo('%1,%2,%3.ics', LeaveApplication.TableCaption, LeaveApplication."Application No", LeaveApplication."Employee No"));
        // TempEmailItem."Send to" := RecipientEmail;
        // TempEmailItem.SetBodyText(GetBody(LeaveApplication));

        // TempEmailItem.GetBodyText();
        Mail.Create(RecipientEmail, 'Tech Bid Opening', GetBody, true);
        Mail.AddAttachment('bidopening.ics', '.ics', InStream);
        Email.Send(Mail);
    end;

    local procedure GetBody() Bodytext: Text
    var
        Employee: Record Employee;
        EmployeeMail: Text;
        Recepients: list of [Text];
        Outs: OutStream;
        Parameters: Text;
        RecRef: RecordRef;
        EmailItem: Record "Email Item";
        Subject: Text;
        FRef: FieldRef;
        TempBlob: Codeunit "Temp Blob";
        Ins: InStream;
        Body: Text;
    begin
        // TempBlob.CreateOutStream(Outs);
        // RecRef.Open(Database::"Employee Leave Application");
        // FRef := RecRef.Field(2);
        // Fref.SetRange(LeaveApplication."Application No");
        // Report.Saveas(Report::"Leave Approval  Notification", '', ReportFormat::Html, Outs, RecRef);
        // TempBlob.CreateInStream(Ins);
        // Ins.ReadText(Body);
        Bodytext := 'Please plan accordingly';
    end;

    Procedure CreateMeeting() Response: Text
    var
        JsonObj: JsonObject;
        JsonObj1: JsonObject;
        JsonObj2: JsonObject;
        JsonObj3: JsonObject;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        Contents: HttpContent;
        Headers: HttpHeaders;
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        httprequest: HttpRequestMessage;
        DateTimeFormatTxt: Label '<Year4><Month,2><Day,2>T<Hours24,2><Minutes,2><Seconds,2>', Locked = true;
        StartTime: Time;
        EndTime: Time;
        JArray: JsonArray;
        url: Text;
        ContentText: Text;
        Token: Text;
        Mail: Codeunit "Email Message";
        Email: Codeunit Email;
        TokenB: Text;
        ObjOrganizer: JsonObject;
        ArrOrganizer: JsonArray;
        objid: JsonObject;
    begin

        //Token := 'eyJ0eXAiOiJKV1QiLCJub25jZSI6IjZCY29hdWZVRW0zTGs0emFuaHkzN1pISUJJYUFNR0ZJRXB5cFVvZlc3VW8iLCJhbGciOiJSUzI1NiIsIng1dCI6IlhSdmtvOFA3QTNVYVdTblU3Yk05blQwTWpoQSIsImtpZCI6IlhSdmtvOFA3QTNVYVdTblU3Yk05blQwTWpoQSJ9.eyJhdWQiOiJodHRwczovL2dyYXBoLm1pY3Jvc29mdC5jb20iLCJpc3MiOiJodHRwczovL3N0cy53aW5kb3dzLm5ldC9lMDdlMmVhYS02YzdmLTQ0MzYtYjZjYS02ZjAxOTQzMWNhZjMvIiwiaWF0IjoxNzEwMTcyNjQzLCJuYmYiOjE3MTAxNzI2NDMsImV4cCI6MTcxMDE3NjU0MywiYWlvIjoiRTJOZ1lKQ09uN2pCN2NHbGFScXZEZm80YkxtbkFnQT0iLCJhcHBfZGlzcGxheW5hbWUiOiJLZWxseSIsImFwcGlkIjoiZmI1YTlmNDUtMDdiOC00NmZlLTlmMjktMGYxNjQyMDM4ZTE2IiwiYXBwaWRhY3IiOiIxIiwiaWRwIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvZTA3ZTJlYWEtNmM3Zi00NDM2LWI2Y2EtNmYwMTk0MzFjYWYzLyIsImlkdHlwIjoiYXBwIiwib2lkIjoiMDdlNzcyMzctNGRmZi00OThkLWEzNTEtMDdhZTZiODg1MWRlIiwicmgiOiIwLkFTRUFxaTUtNEg5c05rUzJ5bThCbERISzh3TUFBQUFBQUFBQXdBQUFBQUFBQUFBaEFBQS4iLCJyb2xlcyI6WyJPbmxpbmVNZWV0aW5ncy5SZWFkLkFsbCIsIk9ubGluZU1lZXRpbmdzLlJlYWRXcml0ZS5BbGwiXSwic3ViIjoiMDdlNzcyMzctNGRmZi00OThkLWEzNTEtMDdhZTZiODg1MWRlIiwidGVuYW50X3JlZ2lvbl9zY29wZSI6IkFGIiwidGlkIjoiZTA3ZTJlYWEtNmM3Zi00NDM2LWI2Y2EtNmYwMTk0MzFjYWYzIiwidXRpIjoiVnBPZFJFczRyRWFGa000VzhFVk5BQSIsInZlciI6IjEuMCIsIndpZHMiOlsiMDk5N2ExZDAtMGQxZC00YWNiLWI0MDgtZDVjYTczMTIxZTkwIl0sInhtc190Y2R0IjoxNDg3MzMxMDk4fQ.W5UHbS-j4828V7MsQJ55WSutH0DTtCNUzScSuNlhKyvJgg65pW3RSgP_XlQoqriODNPllf1J0MEzapTf4NJ1GUZMiZhLAUnIyKDK2iTuWg20gXtMZUS6LZtFRku0ia9xkDo-K3aZYo5kcgdna5spGJSABxpNBCE8CVSZXmxGBD3Mur55ReMiHdtjzdi7B7Oy1gz3-EWynypSl90hZfrMOBlIERIkDYimYzCWtxYqjccURwhUwL2_RiyLR_zpwiH8UQ1QnmlHWTOZfI-3zDusom4oC6-r_0_uT8TrJD-QGyCYFWMjge6BF8ToBcUWFfNyq5DwRnCgE1VQJxvxYN70tg';
        Token := GetAccessToken;
        TokenB := 'Bearer ' + Token;
        Clear(JsonObj);
        clear(Headers);
        Clear(JsonObj1);
        Clear(JsonObj2);
        Clear(JsonObj3);
        Clear(ObjOrganizer);
        Clear(ArrOrganizer);
        Evaluate(EndTime, '09:00');
        Evaluate(StartTime, '08:30');
        JsonObj.add('startDateTime', '2024-03-12T14:30:34.2444915-07:00');// format(CreateDateTime(WorkDate, StartTime), 0, DateTimeFormatTxt));
        JsonObj.add('endDateTime', '2024-03-12T15:00:34.2464912-07:00');//format(CreateDateTime(WorkDate, EndTime), 0, DateTimeFormatTxt));
        JsonObj.add('subject', 'Test Meeting');
        JsonObj.Add('body', 'Add body here');
        JsonObj.Add('isOnlineMeeting', true);
        JsonObj.Add('onlineMeetingProvider', 'teamsForBusiness');
        JsonObj1.Add('address', 'kellykiprotich.dynasoft.co.ke');
        JsonObj2.Add('emailAddress', JsonObj1);
        ObjOrganizer.Add('user', '');
        objid.Add('id', 'kellykiprotich.dynasoft.co.ke');
        JArray.Add(JsonObj2);
        ArrOrganizer.Add(ObjOrganizer);
        JsonObj3.Add('attendees', JArray);
        //JsonObj3.Add('Organizer', ArrOrganizer);
        // JsonObj.Add('participants', JsonObj3);
        JsonObj.WriteTo(ContentText);
        Message(ContentText);
        Contents.Clear();

        Contents.WriteFrom(ContentText);
        //Contents.WriteFrom('{"startDateTime":"2024-03-12T14:30:34.2444915-07:00","endDateTime":"2024-03-12T15:00:34.2464912-07:00","subject":"User meeting in Microsoft Teams channel."}');
        Contents.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Remove('Charset');
        Headers.Add('Content-Type', 'application/json');
        httpRequest.GetHeaders(Headers);
        //Contents.WriteFrom('{"startDateTime":"2024-03-10T14:30:34.2444915-07:00","endDateTime":"2024-03-10T15:00:34.2464912-07:00","subject":"User Token Meeting"}');
        httpRequest.Content(Contents);
        httpRequest.Method('POST');
        url := 'https://graph.microsoft.com/v1.0/users/17555c57-5b87-4e68-b707-d389e9b4a867/onlineMeetings';
        //  url := 'https://graph.microsoft.com/beta/users/81666d68-949f-4300-9185-74519e6f4bae/onlineMeetings';
        //url := 'https://graph.microsoft.com/beta/me/onlineMeetings';
        client.Clear();
        Client.SetBaseAddress(url);
        Client.DefaultRequestHeaders.Add('Charset', 'utf-8');
        //Client.DefaultRequestHeaders.Add('Content-Type','application/json');
        Client.DefaultRequestHeaders.Add('Authorization', TokenB);
        if Client.Post(url, contents, ResponseMessage) then
            //if Client.Send(httpRequest, ResponseMessage) then
                ResponseMessage.Content.ReadAs(Response);
        if ResponseMessage.IsSuccessStatusCode = false then
            Error(Response);
        Clear(ResultObj);
        ResultObj.ReadFrom(Response);
        ResultObj.get('joinUrl', ResultJtoken);
        Response := ResultJtoken.AsValue().AsText();
        Mail.Create('kellykiprotich@dynasoft.co.ke', 'Online Meeting', '<a href="' + Response + '"">Meeting Link</a>', true);
        Email.Send(Mail);
    end;


    Procedure GetAccessToken() Response: Text
    var
        BearerToken: Text;
        graph: Record "Microsoft Graphs";
        JsonObj: JsonObject;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        Contents: HttpContent;
        Headers: HttpHeaders;
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        httprequest: HttpRequestMessage;
        ContentText: Text;
        url: Text;
        BodyText: JsonArray;
        objbody: JsonObject;
        Body: Text;
        oauth2: Codeunit OAuth2;
        Scope: List of [Text];
        IdToken: Text;
        accesstoken: Text;
        ScopesArray: DotNet StringArray;
    // CompoundToken: DotNet CompoundTokenInfo;
    // AuthFlow: DotNet ALAzureAdCodeGrantFlow;
    begin

        Clear(objbody);
        Clear(BodyText);
        Clear(JsonObj);
        Clear(Headers);
        graph.Reset();
        graph.SetRange(Type, graph.Type::Graph);
        if graph.FindFirst() then begin


            //  JsonObj.Add('grant_type', 'client_credentials');
            JsonObj.Add('Host', graph.Host);
            JsonObj.Add('client_id', graph."Client ID");
            JsonObj.Add('client_secret', graph."Client Secret");
            JsonObj.Add('resource', 'https://graph.microsoft.com');
            //  JsonObj.Add('scope', 'OnlineMeetings.ReadWrite.All');

            url := 'https://login.microsoftonline.com/' + graph."Tenant ID" + '/oauth2/token';

            objbody.Add('grant_type', 'client_credentials');
            objbody.Add('scope', 'OnlineMeetings.ReadWrite.All');
            BodyText.Add(objbody);
            JsonObj.Add('Body Text', 'grant_type=client_credentials');//BodyText);
                                                                      // 

            Body := 'client_id=' + graph."Client ID" + '&client_secret=' + graph."Client Secret" + '&grant_type=client_credentials&resource=' + 'https://graph.microsoft.com';
            Clear(JsonObj);
            JsonObj.Add('', Body);
            Contents.Clear();
            //JsonObj.WriteTo(ContentText);
            ContentText := Body;
            //Message(ContentText);
            Contents.WriteFrom(ContentText);
            Contents.GetHeaders(Headers);
            Headers.Remove('Content-Type');
            Headers.Remove('Charset');
            Headers.Add('Content-Type', 'application/x-www-form-urlencoded');
            // Headers.Add('Host','https://login.microsoftonline.com');
            httpRequest.GetHeaders(Headers);
            // Scope.Add('OnlineMeetings.ReadWrite.All');
            // Scope.Add('https://graph.microsoft.com/.default');
            // if oauth2.AcquireTokensWithUserCredentials(url, graph."Client ID", Scope, 'Kellykiprotich@dynasoft.co.ke', 'Ledger@1', accesstoken, IdToken) then begin
            //     Message(accesstoken);
            //     Message(IdToken);
            //     //oauth2.
            // end;

            if Client.Post(url, contents, ResponseMessage) then
                //if Client.Send(httpRequest, ResponseMessage) then
                ResponseMessage.Content.ReadAs(Response);
            if ResponseMessage.IsSuccessStatusCode = false then
                Error(Response);
            Clear(ResultObj);
            ResultObj.ReadFrom(Response);
            ResultObj.get('access_token', ResultJtoken);
            Response := ResultJtoken.AsValue().AsText()
        end;
    end;
    /****************Try to add a teams meeting to outlook**********/
    //Trim Spaces
    Procedure ReduceSpaces(InputString: Text) OutputString: Text
    var
        n: integer;
        i: integer;
    begin
        n := STRLEN(InputString);
        FOR i := 1 TO n DO
            IF (InputString[i] = ' ') AND (i < n) THEN BEGIN
                IF NOT (InputString[i + 1] IN [32 .. 47, 58 .. 63]) THEN //if the next char is special as 'empty space,.,!' etc we do not copy the current space
                    OutputString += FORMAT(InputString[i])
            END ELSE
                OutputString += FORMAT(InputString[i]);

        OutputString := DELCHR(OutputString, '<>', ' ');
    end;
    //Trim Spaces
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Check Dimensions", 'OnBeforeCheckPurchDim', '', false, false)]
    local procedure OnBeforeCheckPurchDim(PurchaseHeader: Record "Purchase Header"; var TempPurchaseLine: Record "Purchase Line" temporary; var IsHandled: Boolean)
    begin
        IsHandled := true;
    end;


    ///Copy custom job planning lines to ledger entry
    [EventSubscriber(ObjectType::Table, Database::"Job Journal Line", 'OnAfterCopyTrackingFromJobPlanningLine', '', false, false)]
    local procedure OnAfterCopyTrackingFromJobPlanningLine(var JobJournalLine: Record "Job Journal Line"; JobPlanningLine: Record "Job Planning Line")
    begin
        JobJournalLine."Road Code" := JobPlanningLine."Road Code";
        //JobJournalLine."Project No." := JobPlanningLine;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Job Ledger Entry", 'OnAfterCopyTrackingFromJobJnlLine', '', false, false)]
    local procedure OnAfterCopyTrackingFromJobJnlLine(var JobLedgerEntry: Record "Job Ledger Entry"; JobJnlLine: Record "Job Journal Line")
    begin
        JobLedgerEntry."Road Code" := JobJnlLine."Road Code";
        JobLedgerEntry."Road Section No" := JobJnlLine."Road Section No";
        JobLedgerEntry."Constituency ID" := JobJnlLine."Constituency ID";
        JobLedgerEntry."County ID" := JobJnlLine."County ID";
        JobLedgerEntry."Region ID" := JobJnlLine."Region ID";
        JobLedgerEntry."Road Project Category" := JobJnlLine."Road Project Category";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromPlanningLineToJnlLine', '', false, false)]
    local procedure OnAfterFromPlanningLineToJnlLine(var JobJournalLine: Record "Job Journal Line"; JobPlanningLine: Record "Job Planning Line")
    begin
        JobJournalLine."Road Code" := JobPlanningLine."Road Code";
        JobJournalLine."Road Section No" := JobPlanningLine."Road Section No";
        JobJournalLine."Constituency ID" := JobPlanningLine."Constituency ID";
        JobJournalLine."County ID" := JobPlanningLine."County ID";
        JobJournalLine."Region ID" := JobPlanningLine."Region ID";
        JobJournalLine."Road Project Category" := JobPlanningLine."Road Project Category";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromPurchaseLineToJnlLine', '', false, false)]
    local procedure OnAfterFromPurchaseLineToJnlLine(var JobJnlLine: Record "Job Journal Line"; PurchHeader: Record "Purchase Header"; PurchInvHeader: Record "Purch. Inv. Header"; PurchCrMemoHeader: Record "Purch. Cr. Memo Hdr."; PurchLine: Record "Purchase Line"; SourceCode: Code[10])
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Transfer Line", 'OnAfterFromGenJnlLineToJnlLine', '', false, false)]
    local procedure OnAfterFromGenJnlLineToJnlLine(var JobJnlLine: Record "Job Journal Line"; GenJnlLine: Record "Gen. Journal Line")
    begin
        JobJnlLine."Road Code" := GenJnlLine."Road Code";
        // JobJnlLine."Road Code" := GenJnlLine."Road Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Post Line", 'OnBeforeJobLedgEntryInsert', '', false, false)]
    local procedure OnBeforeJobLedgEntryInsert(var JobLedgerEntry: Record "Job Ledger Entry"; JobJournalLine: Record "Job Journal Line")
    begin
        JobLedgerEntry."Road Code" := JobJournalLine."Road Code";
        JobJournalLine."Road Section No" := JobJournalLine."Road Section No";
        JobJournalLine."Constituency ID" := JobJournalLine."Constituency ID";
        JobJournalLine."County ID" := JobJournalLine."County ID";
        JobJournalLine."Region ID" := JobJournalLine."Region ID";
        JobJournalLine."Road Project Category" := JobJournalLine."Road Project Category";
        JobJournalLine."Project No." := JobJournalLine."Project No.";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Post-Line", 'OnPostGenJnlLineOnAfterTransferToJnlLine', '', false, false)]
    local procedure OnPostGenJnlLineOnAfterTransferToJnlLine(var JobJnlLine: Record "Job Journal Line"; GenJnlLine: Record "Gen. Journal Line"; var JobJnlPostLine: Codeunit "Job Jnl.-Post Line")
    begin
        JobJnlLine."Project No." := GenJnlLine."Project No";
        JobJnlLine."Road Code" := GenJnlLine."Road Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::Contact, 'OnAfterCreateVendor', '', false, false)]
    local procedure OnAfterCreateVendor(var Contact: Record Contact; var Vendor: Record Vendor)
    var
        RandomDigit: Text[50];
        Email: Codeunit Email;
        Mail: Codeunit "Email Message";
        Header: Text;
        Recepient: List of [Text];
        Body: Text;
        CompanyInfo: Record "Company Information";
        ProcurementSetup: Record "Procurement Setup";
        Portal: Record "Dynasoft Portal User";
        Cont: Page "Contact Card";
    begin
        RandomDigit := '';
        RandomDigit := CreateGuid;
        RandomDigit := DelChr(RandomDigit, '=', '{}-01');
        RandomDigit := CopyStr(RandomDigit, 1, 8);
        Clear(Recepient);
        Header := '';
        Body := '';
        Header := 'Registration Successful';
        CompanyInfo.Get();
        ProcurementSetup.Get();
        Portal.Init();
        Portal."Full Name" := Contact.Name;
        Portal."Authentication Email" := Contact."E-Mail";
        Portal."Mobile Phone No." := Contact."Phone No.";
        Portal.State := Portal.State::Enabled;
        Portal."Record Type" := Portal."Record Type"::Vendor;
        Portal."Record ID" := Vendor."No.";
        Portal."Password Value" := RandomDigit;
        Portal."Login Type" := Portal."Login Type"::Contractor;
        Portal."Change Password" := true;
        if Portal.Insert(true) then begin
            Body := 'Dear ' + Contact.Name + ',<br> Your registration as a vendor to ' + CompanyInfo.Name + ' is successful. <br><br> Your one time password to the supplier portal is <b> ' + RandomDigit + '</b>.<br> <br> Please login using the <a href="' + ProcurementSetup."Procurement Link" + '">link</a> to change your password. <br> Regards, <br> ' + CompanyInfo.Name;
            Recepient.Add(contact."E-Mail");
            Mail.Create(Recepient, Header, Body, TRUE);
            Email.Send(Mail);
        end;
    end;

    Procedure GetPseudoNames()
    var
        JsonObj: JsonObject;
        JsonObj1: JsonObject;
        JsonObj2: JsonObject;
        JsonObj3: JsonObject;
        ResultObj: JsonObject;
        ResultJtoken: JsonToken;
        Contents: HttpContent;
        Headers: HttpHeaders;
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        httprequest: HttpRequestMessage;
        DateTimeFormatTxt: Label '<Year4><Month,2><Day,2>T<Hours24,2><Minutes,2><Seconds,2>', Locked = true;
        StartTime: Time;
        EndTime: Time;
        JArray: JsonArray;
        ContentText: Text;
        url: Text;
        Response: Text;
        Name: Text;
        Email: Text;
        DOB: Text;
        address: Text;
        addressObj: JsonObject;
        addressToken: JsonToken;
        NameObj: JsonObject;
        EmailObj: JsonObject;
        DOBObj: JsonObject;
        NameToken: JsonToken;
        EmailToken: JsonToken;
        DOBToken: JsonToken;
    begin
        Clear(JsonObj);
        clear(Headers);
        Clear(JsonObj1);
        Clear(JsonObj2);
        Clear(JsonObj3);



        JsonObj.WriteTo(ContentText);
        // Message(ContentText);
        Contents.Clear();

        Contents.WriteFrom(ContentText);
        //Contents.WriteFrom('{"startDateTime":"2024-03-12T14:30:34.2444915-07:00","endDateTime":"2024-03-12T15:00:34.2464912-07:00","subject":"User meeting in Microsoft Teams channel."}');
        Contents.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Remove('Charset');
        Headers.Add('Content-Type', 'application/json');
        //Headers.Add('X-Api-Key','lkfJNcmQeoF5ut+5WO48Aw==cfVhqT4gbg3RJUY0');
        httpRequest.GetHeaders(Headers);
        //Contents.WriteFrom('{"startDateTime":"2024-03-10T14:30:34.2444915-07:00","endDateTime":"2024-03-10T15:00:34.2464912-07:00","subject":"User Token Meeting"}');
        httpRequest.Content(Contents);
        httpRequest.Method('GET');
        url := 'https://api.api-ninjas.com/v1/randomuser';
        client.Clear();
        Client.SetBaseAddress(url);
        Client.DefaultRequestHeaders.Add('Charset', 'utf-8');
        Client.DefaultRequestHeaders.Add('X-Api-Key', 'lkfJNcmQeoF5ut+5WO48Aw==cfVhqT4gbg3RJUY0');
        if Client.Get(url, ResponseMessage) then
            //(url, contents, ResponseMessage) then
            //if Client.Send(httpRequest, ResponseMessage) then
            ResponseMessage.Content.ReadAs(Response);
        if ResponseMessage.IsSuccessStatusCode = false then
            Error(Response);
        Clear(NameObj);
        Clear(EmailObj);
        Clear(DOBObj);
        Clear(NameToken);
        Clear(EmailToken);
        Clear(DOBToken);

        Name := '';
        Email := '';
        DOB := '';
        address := '';
        NameObj.ReadFrom(Response);
        NameObj.get('name', NameToken);
        Name := NameToken.AsValue().AsText();
        EmailObj.ReadFrom(Response);
        EmailObj.get('email', EmailToken);
        Email := EmailToken.AsValue().AsText();
        DOBObj.ReadFrom(Response);
        DOBObj.get('birthday', DOBToken);
        DOB := DOBToken.AsValue().AsText();
        addressObj.ReadFrom(Response);
        addressObj.get('address', addressToken);
        address := addressToken.AsValue().AsText();
        message('Name: ' + Name + ' Email ' + Email + ' DOB: ' + DOB + ' Address ' + address);
    end;


    [EventSubscriber(ObjectType::Table, Database::Employee, 'OnBeforeOnInsert', '', false, false)]
    local procedure OnBeforeOnInsert(var Employee: Record Employee; var xEmployee: Record Employee; var IsHandled: Boolean)
    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        HumanResSetup.Get();
        Case Employee."Employee Category" of
            Employee."Employee Category"::Intern:
                begin
                    if Employee."No." = '' then begin
                        HumanResSetup.TestField("Interns Nos");
                        NoSeriesMgt.InitSeries(HumanResSetup."Interns Nos", xEmployee."No. Series", 0D, Employee."No.", Employee."No. Series");
                    end;
                end;
            Employee."Employee Category"::Casual:
                begin
                    if Employee."No." = '' then begin
                        HumanResSetup.TestField("Temporary Employee Nos");
                        NoSeriesMgt.InitSeries(HumanResSetup."Temporary Employee Nos", xEmployee."No. Series", 0D, Employee."No.", Employee."No. Series");
                    end;
                end;
        End
    end;


    //Extended posting functions
    [EventSubscriber(ObjectType::Table, Database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure "G/L Entry_OnAfterCopyGLEntryFromGenJnlLine"
    (
        var GLEntry: Record "G/L Entry";
        var GenJournalLine: Record "Gen. Journal Line"
    )
    begin
        GLEntry."Earning Code" := GenJournalLine."Earning Code";
        GLEntry."Project No" := GenJournalLine."Project No";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure "Cust. Ledger Entry_OnAfterCopyCustLedgerEntryFromGenJnlLine"
    (
        var CustLedgerEntry: Record "Cust. Ledger Entry";
        GenJournalLine: Record "Gen. Journal Line"
    )
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Detailed CV Ledg. Entry Buffer", 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure "Detailed CV Ledg. Entry Buffer_OnAfterCopyFromGenJnlLine"
    (
        var DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer";
        GenJnlLine: Record "Gen. Journal Line"
    )
    begin
        DtldCVLedgEntryBuffer."Earning Code" := GenJnlLine."Earning Code";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure "Vendor Ledger Entry_OnAfterCopyVendLedgerEntryFromGenJnlLine"
    (
        var VendorLedgerEntry: Record "Vendor Ledger Entry";
        GenJournalLine: Record "Gen. Journal Line"
    )
    begin
        VendorLedgerEntry."Earning Code" := GenJournalLine."Earning Code";
        VendorLedgerEntry."Project No" := GenJournalLine."Project No";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Bank Account Ledger Entry", 'OnAfterCopyFromGenJnlLine', '', true, true)]
    local procedure "Bank Account Ledger Entry_OnAfterCopyFromGenJnlLine"
   (
       var BankAccountLedgerEntry: Record "Bank Account Ledger Entry";
       GenJournalLine: Record "Gen. Journal Line"
   )
    begin
    end;


    Procedure CheckIfUserHasDelegated("User ID": Code[20]; StartDate: Date; EndDate: Date; Var VarStartDate: Date; Var VarEndDate: Date): Boolean
    var
        Delegation: Record "Document Approval Delegation";
    begin
        Delegation.Reset();
        Delegation.SetRange("Current Approver ID", "User ID");
        Delegation.SetFilter("Start Date", '>=%1', StartDate);
        Delegation.SetFilter("End Date", '<=%1', EndDate);
        if Delegation.FindFirst() then
            exit(true);
    end;

    Procedure CheckIfUserIsOnLeave("User ID": Code[20]; StartDate: Date; EndDate: Date; Var VarStartDate: Date; Var VarEndDate: Date): Boolean
    var
        Leave: Record "HR Leave Applications";
        Emp: Record Employee;
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get("User ID") then
            if Emp.Get(UserSetup."Employee No.") then begin
                Leave.Reset();
                Leave.SetRange("Employee No", Emp."No.");
                Leave.SetFilter("Start Date", '>=%1', StartDate);
                Leave.SetFilter("End Date", '<=%1', EndDate);
                Leave.SetRange(Status,Leave.Status::Released);
                if Leave.FindFirst() then
                    exit(true);
            end;
    end;


}