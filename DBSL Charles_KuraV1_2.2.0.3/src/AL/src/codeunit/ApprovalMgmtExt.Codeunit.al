codeunit 90100 "Approval Mgmt. Ext"

{

    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeApproveApprovalRequests', '', false, false)]
    local procedure Codeunit_1535_OnBeforeApproveApprovalRequests(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    var
        userSetup: Record "User Setup";
    begin
        userSetup.Get(userID);
        if userSetup."Portal User" = True then begin
            exit;

        end else begin
            if GuiAllowed then
            if Confirm('Are you Sure you want to Approve this Document?', TRUE) = FALSE then
                Message('You Have Cancelled the document approval.');
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnBeforeRejectApprovalRequests', '', false, false)]
    local procedure Codeunit_1535_OnBeforeRejectApprovalRequests(var ApprovalEntry: Record "Approval Entry"; var IsHandled: Boolean)
    var
        userSetup: Record "User Setup";
    begin
        userSetup.Get(userID);
        if userSetup."Portal User" = True then begin
            exit;

        end
        else begin
            if Confirm('Are you Sure you want to Reject this Document?', TRUE) = FALSE then
                exit;
        end;

    end;
   
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
    local procedure Codeunit_1535_OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        userSetup: Record "User Setup";
    begin
        userSetup.Get(userID);
        if userSetup."Portal User" = True then begin
            ApprovalEntry.Get(ApprovalEntry."Entry No.");
            ApprovalEntry.Validate(Status, ApprovalEntry.Status::Rejected);
            ApprovalEntry.Modify(true);

        end


    end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnAfterRejectSelectedApprovalRequest', '', false, false)]
    local procedure Codeunit_1535_OnAfterRejectSelectedApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        userSetup: Record "User Setup";
    begin
        userSetup.Get(userID);
        if userSetup."Portal User" = True then begin
           exit;

        end


    end;
  
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnBeforeRunWorkflowOnApproveApprovalRequest', '', true, true)]
    local procedure OnBeforeRunWorkflowOnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        ObjApprovalEntries: Record "Approval Entry";
    begin
        ObjApprovalEntries.RESET;
        ObjApprovalEntries.SetCurrentKey("Table ID", "Document Type", "Document No.", "Sequence No.");
        ObjApprovalEntries.SetRange("Table ID", ApprovalEntry."Table ID");
        ObjApprovalEntries.SetRange("Record ID to Approve", ApprovalEntry."Record ID to Approve");
        ObjApprovalEntries.SETRANGE("Sequence No.", ApprovalEntry."Sequence No.");
        ObjApprovalEntries.SETRANGE("Document No.", ApprovalEntry."Document No.");
        //ObjApprovalEntries.SetRange(Status, ApprovalEntry.Status::Open);
        ObjApprovalEntries.SetRange("Workflow Step Instance ID", ApprovalEntry."Workflow Step Instance ID");
        if ObjApprovalEntries.FindSet() then begin
            repeat
                ObjApprovalEntries.VALIDATE(Status, ApprovalEntry.Status::Approved);
                ObjApprovalEntries.Modify(true);
            //  IsHandled := true;
            until ObjApprovalEntries.Next() = 0;
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]

    procedure PopulateApprovalEntryArgument(RecRef: RecordRef; WorkflowStepInstance: Record "Workflow Step Instance"; VAR ApprovalEntryArgument: Record "Approval Entry")
    var
        CurrExchRate: Record "Currency Exchange Rate";
        //pavement
        PavementTestHeader: Record "Pavement Test Header";
        //IFS tENDER
        Comm: Record "IFS Tender Committee";

        //fleet
        fleet: Record "Transport Requisition";
        //payroll
        Payroll: Record "Payroll Header";
        //prof
        Prof: Record "Bid Tabulation Header";
        //Performance contract
        perform: Record "Perfomance Contract Header";
        //leave
        leave: Record "HR Leave Applications";
        //advancedpayments
        advpay: Record "Measurement &  Payment Header";
        //corporate
        corporate: Record "Corporate Strategic Plans";
        //Monitor
        monitor: Record "Monitoring Card Header";
        //Geval
        Evaluation: Record "Perfomance Evaluation";

        //Board
        board: Record "Perfomance Contract Header";

        //Annual
        Annual: Record "Annual Strategy Workplan";
        //Addend
        Addend: Record "Tender Addendum Notice";
        //evaluation
        Eva: Record "Bid Scoring Template";
        //schedule project
        roadworkprogram: Record "Road Work Program";
        //sales
        salesheader: Record "Sales Header";
        //purchase
        PurchaseHeader: Record "Purchase Header";
        //IFRCARD
        RequestForInformation: Record "Request For Information";
        //procurement plan
        procurementplan: Record "procurement plan";
        //rfq
        StandardPurchaseCode: Record "Standard Purchase Code";
        //Payments
        payments: Record payments;
        //project variation
        projectvariation: Record "Project Variation Header";
        //Imprest Memo
        ImprestMemo: Record "Imprest Memo";
        //InterbankTransfer
        Interbank: Record "Inter Bank Transfer";
        //Standing Imprest
        StandingImprest: Record "Imprest Memo";
        MobilizationHeader: Record "Project Mobilization Header";
        EquipmentRepairTracking: Record "Equipment Repair Tracking";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        MaterialTestRecord: Record "Material Test Record";
        WorkPlanHeader: Record "Work Plan Header";
        RiskMEHeader: Record "Risk M&E Header";
        SiteInstructions:Record "Site Instructions Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        RepaymentSchedule:Record "RE Payment Schedule Header";
        RiskIncidentLog:Record "Risk Incident Log";
        RiskManagementPlan:Record "Risk Management Plan";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        SurveyQualityCheckHeader: Record "Survey Quality Check Header";
        TemporarySupervisionRequirem: Record "Temporary Supervision Requirem";
        CommunicationPlanHeader: Record "Communication Plan Header";
        DailyWorkRecord: Record "Daily Work Record";
        StaffVoucher: Record "Project Staff Voucher";
        VehicleFuelCardLines:Record "Vehicle Fuel Card Lines";
    begin
        // ApprovalEntryArgument.INIT;
        // ApprovalEntryArgument."Table ID" := RecRef.NUMBER;
        // ApprovalEntryArgument."Record ID to Approve" := RecRef.RECORDID;
        // ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::" ";
        // ApprovalEntryArgument."Approval Code" := WorkflowStepInstance."Workflow Code";
        // ApprovalEntryArgument."Workflow Step Instance ID" := WorkflowStepInstance.ID;
        ApprovalEntryArgument."Project Document Type" := GetProjectDocumentType(RecRef, ApprovalEntryArgument);
        CASE RecRef.NUMBER OF
            //pavement
            DATABASE::"Pavement Test Header":
                BEGIN
                    RecRef.SETTABLE(PavementTestHeader);
                    ApprovalEntryArgument."Document No." := PavementTestHeader."Document No.";
                END;
            //ifs tender commitee

            DATABASE::"IFS Tender Committee":
                BEGIN
                    RecRef.SETTABLE(comm);
                    ApprovalEntryArgument."Document No." := Comm."Document No.";
                END;
            //payroll
            DATABASE::"Payroll Header":
                BEGIN
                    RecRef.SETTABLE(Payroll);
                    ApprovalEntryArgument."Document No." := Payroll."No.";
                END;

            //proff
            DATABASE::"Bid Tabulation Header":
                BEGIN
                    RecRef.SETTABLE(Prof);
                    ApprovalEntryArgument."Document No." := Prof.Code;
                END;

            //fleet
            DATABASE::"Transport requisition":
                BEGIN
                    RecRef.SETTABLE(fleet);
                    ApprovalEntryArgument."Document No." := fleet."Transport Requisition No";
                END;
            //leave
            DATABASE::"HR Leave Applications":
                BEGIN
                    RecRef.SETTABLE(leave);
                    ApprovalEntryArgument."Document No." := leave."Application Code";
                    ApprovalEntryArgument.Amount := leave."Days Applied";
                END;
            //advancedpayment
            DATABASE::"Measurement &  Payment Header":
                BEGIN
                    RecRef.SETTABLE(advpay);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Payment;
                    ApprovalEntryArgument."Document No." := advpay."Document No.";
                    advpay.CalcFields("Contractor Request Cert Amount");
                    ApprovalEntryArgument.Amount := advpay."Contractor Request Cert Amount";
                    ApprovalEntryArgument."Amount (LCY)":= advpay."Contractor Request Cert Amount";
                END;

            //project variation
            DATABASE::"Project Variation Header":
                BEGIN
                    RecRef.SETTABLE(projectvariation);
                    ApprovalEntryArgument."Document No." := projectvariation."Document No.";
                END;

            //corporate
            DATABASE::"Corporate Strategic Plans":
                BEGIN
                    RecRef.SETTABLE(corporate);
                    ApprovalEntryArgument."Document No." := corporate.Code;
                END;

            //Monitor
            DATABASE::"Monitoring Card Header":
                BEGIN
                    RecRef.SETTABLE(monitor);
                    ApprovalEntryArgument."Document No." := monitor."Document No.";
                END;
            //performance contract
            DATABASE::"Perfomance Contract Header":
                BEGIN
                    RecRef.SETTABLE(perform);
                    ApprovalEntryArgument."Document No." := perform.No;
                END;
            //Geval
            DATABASE::"Perfomance Evaluation":
                BEGIN
                    RecRef.SETTABLE(Evaluation);
                    ApprovalEntryArgument."Document No." := Evaluation.No;
                END;

            //board
            DATABASE::"Project Contract Header":
                BEGIN
                    RecRef.SETTABLE(board);
                    ApprovalEntryArgument."Document No." := board.No;
                END;

            //Annual
            DATABASE::"Annual Strategy Workplan":
                BEGIN
                    RecRef.SETTABLE(Annual);
                    ApprovalEntryArgument."Document No." := Annual.No;
                END;

            //Addend
            DATABASE::"Tender Addendum Notice":
                BEGIN
                    RecRef.SETTABLE(Addend);
                    ApprovalEntryArgument."Document No." := Addend."Tender No";
                END;

            //Evaluation
            DATABASE::"Bid Scoring Template":
                BEGIN
                    RecRef.SETTABLE(Eva);
                    ApprovalEntryArgument."Document No." := Eva.Code;
                END;
            //schedule projects
            DATABASE::"Road Work Program":
                BEGIN
                    RecRef.SETTABLE(roadworkprogram);
                    ApprovalEntryArgument."Document No." := roadworkprogram.Code;
                END;
            //purchase

            //IFRCARD
            DATABASE::"Request For Information":
                BEGIN
                    RecRef.SETTABLE(RequestForInformation);
                    ApprovalEntryArgument."Document No." := RequestForInformation.Code;
                END;

            //procurement plan
            DATABASE::"procurement plan":
                BEGIN
                    RecRef.SETTABLE(procurementplan);
                    ApprovalEntryArgument."Document No." := procurementplan.Code;
                END;

            //rfq
            DATABASE::"Standard Purchase Code":
                BEGIN
                    RecRef.SETTABLE(StandardPurchaseCode);
                    //ApprovalEntryArgument."Document Type" := StandardPurchaseCode."Document Status"::Draft;
                    ApprovalEntryArgument."Document No." := StandardPurchaseCode.Code;
                END;

            //pv
            DATABASE::"Payments":
                BEGIN
                    RecRef.SETTABLE(payments);
                    ApprovalEntryArgument."Document No." := payments."No.";
                    ApprovalEntryArgument."Sender Name" := payments."Account Name";
                    ApprovalEntryArgument."Currency Code" := payments.Currency;
                    Case payments."Payment Type" of
                        payments."Payment Type"::"Imprest Surrender":
                            begin
                                Payments.CalcFields("Imprest Amount");
                                ApprovalEntryArgument.Amount := payments."Imprest Amount";
                                IF Payments.currency <> '' then
                                    ApprovalEntryArgument."Amount (LCY)" := CurrExchRate.ExchangeAmtFCYToLCY(payments.Date, payments.Currency, payments."Imprest Amount", CurrExchRate.ExchangeRate(payments.Date, payments.Currency))
                                ELSE
                                    ApprovalEntryArgument."Amount (LCY)" := payments."Imprest Amount";
                            end;
                        payments."Payment Type"::Imprest:
                            begin
                                Payments.CalcFields("Imprest Amount");
                                ApprovalEntryArgument.Amount := payments."Imprest Amount";
                                IF Payments.currency <> '' then
                                    ApprovalEntryArgument."Amount (LCY)" := CurrExchRate.ExchangeAmtFCYToLCY(payments.Date, payments.Currency, payments."Imprest Amount", CurrExchRate.ExchangeRate(payments.Date, payments.Currency))
                                ELSE
                                    ApprovalEntryArgument."Amount (LCY)" := payments."Imprest Amount";
                            end;
                        payments."Payment Type"::"Staff Claim":
                            begin
                                Payments.CalcFields("Total Amount");
                                ApprovalEntryArgument.Amount := payments."Total Amount";
                                IF Payments.currency <> '' then
                                    ApprovalEntryArgument."Amount (LCY)" := CurrExchRate.ExchangeAmtFCYToLCY(payments.Date, payments.Currency, payments."Total Amount", CurrExchRate.ExchangeRate(payments.Date, payments.Currency))
                                ELSE
                                    ApprovalEntryArgument."Amount (LCY)" := payments."Total Amount";
                            end;
                    End;
                END;

            //Imprest memo
            DATABASE::"Imprest Memo":
                BEGIN
                    RecRef.SETTABLE(ImprestMemo);
                    ApprovalEntryArgument."Document No." := ImprestMemo."No.";
                    ApprovalEntryArgument."Sender Name" := ImprestMemo."Requestor Name";
                    ApprovalEntryArgument."Currency Code" := ImprestMemo."Currency Code";
                    ImprestMemo.CalcFields("Total Subsistence Allowance", "Total Other Costs", "Total Casuals Cost");
                    ApprovalEntryArgument.Amount := ImprestMemo."Total Subsistence Allowance" + ImprestMemo."Total Other Costs" + ImprestMemo."Total Casuals Cost";
                    if ImprestMemo."Currency Code" <> '' then
                        ApprovalEntryArgument."Amount (LCY)" := Round(CurrExchRate.ExchangeAmtFCYToLCY(ImprestMemo.Date, ImprestMemo."Currency Code", ImprestMemo."Total Subsistence Allowance" + ImprestMemo."Total Other Costs" + ImprestMemo."Total Casuals Cost", ImprestMemo."Currency Factor"))
                    else
                        ApprovalEntryArgument."Amount (LCY)" := ImprestMemo."Total Subsistence Allowance" + ImprestMemo."Total Other Costs" + ImprestMemo."Total Casuals Cost";
                END;
            //purchase
            DATABASE::"Purchase Header":
                BEGIN

                    RecRef.SETTABLE(PurchaseHeader);
                    // CalcPurchaseDocAmount(PurchaseHeader,ApprovalAmount,ApprovalAmountLCY);
                    ApprovalEntryArgument."Document Type" := PurchaseHeader."Document Type";
                    ApprovalEntryArgument."Document No." := PurchaseHeader."No.";
                    ApprovalEntryArgument."Salespers./Purch. Code" := PurchaseHeader."Purchaser Code";
                    //ApprovalEntryArgument.Amount := ApprovalAmount;
                    //ApprovalEntryArgument."Amount (LCY)" := ApprovalAmountLCY;
                    ApprovalEntryArgument."Currency Code" := PurchaseHeader."Currency Code";
                    ApprovalEntryArgument."Sender Name" := PurchaseHeader."Request-By Name";
                END;
            //sales headear
            DATABASE::"Sales Header":
                BEGIN
                    RecRef.SETTABLE(SalesHeader);
                    // CalcSalesDocAmount(SalesHeader,ApprovalAmount,ApprovalAmountLCY);
                    ApprovalEntryArgument."Document Type" := SalesHeader."Document Type";
                    ApprovalEntryArgument."Document No." := SalesHeader."No.";
                    ApprovalEntryArgument."Salespers./Purch. Code" := SalesHeader."Salesperson Code";
                    // ApprovalEntryArgument.Amount := ApprovalAmount;
                    //ApprovalEntryArgument."Amount (LCY)" := ApprovalAmountLCY;
                    ApprovalEntryArgument."Currency Code" := SalesHeader."Currency Code";
                    //  ApprovalEntryArgument."Available Credit Limit (LCY)" := GetAvailableCreditLimit(SalesHeader);
                END;
            //Project mobilization Header
            Database::"Project Mobilization Header":
                begin
                    RecRef.Settable(MobilizationHeader);
                    ApprovalEntryArgument."Document No." := MobilizationHeader."Document No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Mobilization;
                end;
            //Equipment REpair Tracking
            Database::"Equipment Repair Tracking":
                begin
                    RecRef.Settable(EquipmentRepairTracking);
                    ApprovalEntryArgument."Document No." := EquipmentRepairTracking."Document No";
                    // ApprovalEntryArgument."Project Document Type" := EquipmentRepairTracking."Document Type";
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    RecRef.Settable(InsuranceGuarantee);
                    ApprovalEntryArgument."Document No." := InsuranceGuarantee."Document No.";
                    // ApprovalEntryArgument."Project Document Type" := InsuranceGuarantee."Document Type";
                end;
            Database::"Material Test Record":
                begin
                    RecRef.Settable(MaterialTestRecord);
                    ApprovalEntryArgument."Document No." := MaterialTestRecord."Code";
                    // ApprovalEntryArgument."Project Document Type" := MaterialTestRecord."Document Type";
                end;
            Database::"Work Plan Header":
                begin
                    RecRef.settable(WorkPlanHeader);
                    ApprovalEntryArgument."Document No." := WorkPlanHeader."Document No.";
                end;
            Database::"Risk M&E Header":
                begin
                    RecRef.settable(RiskMEHeader);
                    ApprovalEntryArgument."Document No." := RiskMEHeader."Document No";
                end;
            Database::"Site Instructions Header":
            begin
                RecRef.settable(SiteInstructions);
                    ApprovalEntryArgument."Document No." := SiteInstructions."Document No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Site Instruction";
            end;
            Database::"Project Meeting Register":
            begin
                RecRef.Settable(ProjectMeetingRegister);
                ApprovalEntryArgument."Document No." := ProjectMeetingRegister."Meeting ID";
                ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Meeting;
            end;
            Database::"RE Payment Schedule Header":
            begin
                RecRef.Settable(RepaymentSchedule);
                ApprovalEntryArgument."Document No." := RepaymentSchedule."Document No.";
            end;
            Database::"Risk Incident Log":
            begin
                RecRef.SetTable(RiskIncidentLog);
                ApprovalEntryArgument."Document No." := RiskIncidentLog."Incident ID";
            end;
            Database::"Risk Management Plan":
            begin
                RecRef.SetTable(RiskManagementPlan);
                ApprovalEntryArgument."Document No." := RiskManagementPlan."Document No";
            end;
            Database::"WEP Contractor Submission":
            begin
                RecRef.SetTable(WEPContractorSubmission);
                ApprovalEntryArgument."Document No." := WEPContractorSubmission."Document No";
                ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Contractor;
            end;
            Database::"Survey Quality Check Header":
            begin
                RecRef.SetTable(SurveyQualityCheckHeader);
                ApprovalEntryArgument."Document No." := SurveyQualityCheckHeader."Document No";
            end;
            Database::"Temporary Supervision Requirem":
            begin
                RecRef.SetTable(TemporarySupervisionRequirem);
                ApprovalEntryArgument."Document No." := TemporarySupervisionRequirem."Document No";
            end;
            Database::"Communication Plan Header":
            begin
                RecRef.SetTable(CommunicationPlanHeader);
                ApprovalEntryArgument."Document No." := CommunicationPlanHeader."Document No";
            end;
            Database::"Daily Work Record":
            begin
                RecRef.SetTable(DailyWorkRecord);
                ApprovalEntryArgument."Document No." := DailyWorkRecord."Document No.";
            end;
            Database::"Project Staff Voucher":
                begin
                    RecRef.SetTable(StaffVoucher);
                    ApprovalEntryArgument."Document No." := StaffVoucher."Document No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Staff Appointment";
                end;
            Database::"Vehicle Fuel Card Lines":
            begin
                  RecRef.SetTable(VehicleFuelCardLines);
                    ApprovalEntryArgument."Document No." := VehicleFuelCardLines."Reciept No";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::FuelReq;
            end;
        END;

    end;

    Local Procedure GetProjectDocumentType(RecRef: RecordRef; ApprovalEntryArgument: Record "Approval Entry"): Enum "Project Approval Doc Type"
    var
        EquipmentRepairTracking: Record "Equipment Repair Tracking";
        InsuranceGuarantee: Record "Insurance/Guarantee Header";
        MaterialTestRecord: Record "Material Test Record";
        WorkPlanHeader: Record "Work Plan Header";
        RiskMEHeader: Record "Risk M&E Header";
        SiteInstructions: Record "Site Instructions Header";
        ProjectMeetingRegister: Record "Project Meeting Register";
        RepaymentSchedule: Record "RE Payment Schedule Header";
        RiskIncidentLog: Record "Risk Incident Log";
        RiskManagementPlan: Record "Risk Management Plan";
        WEPContractorSubmission: Record "WEP Contractor Submission";
        SurveyQualityCheckHeader: Record "Survey Quality Check Header";
        TemporarySupervisionRequirem: Record "Temporary Supervision Requirem";
        CommunicationPlanHeader: Record "Communication Plan Header";
        DailyWorkRecord: Record "Daily Work Record";
        projectvariation: Record "Project Variation Header";
        PavementTestHeader: Record "Pavement Test Header";
        MobilizationHeader: Record "Project Mobilization Header";
        MeasurementHeader: record "Measurement &  Payment Header";
        StaffVoucher: Record "Project Staff Voucher";
    begin
        CASE RecRef.NUMBER OF
            Database::"Project Staff Voucher":
                begin
                    RecRef.Settable(StaffVoucher);

                    Case StaffVoucher."Document Type" of
                        StaffVoucher."Document Type"::Appointment:
                            ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Staff Appointments";
                        StaffVoucher."Document Type"::Termination:
                            ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Staff Disengagement";
                    End;
            end;
            Database::"Measurement &  Payment Header":
                begin
                    RecRef.Settable(MeasurementHeader);
                    
                    Case MeasurementHeader."Document Type" of
                        MeasurementHeader."Document Type"::"Contractor Payment Request":
                            ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Interim Payment";
                    End;
                end;
            Database::"Project Mobilization Header":
                begin
                    RecRef.Settable(MobilizationHeader);

                    Case MobilizationHeader."Document Type" of
                        MobilizationHeader."Document Type"::"Order-To-Commence":
                            ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Commenncement Order";
                        MobilizationHeader."Document Type"::"Work Execution Programme":
                            ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Work Execution Plan";
                        MobilizationHeader."Document Type"::"Mobilization Checklist":
                            ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Mobilization Checklist";
                        MobilizationHeader."Document Type"::"Mobilization Checklist Status Report":
                            ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Mobilization Checklist Status Report";
                    End;

                end;
            //Equipment REpair Tracking
            Database::"Equipment Repair Tracking":
                begin
                    RecRef.Settable(EquipmentRepairTracking);
                    ApprovalEntryArgument."Document No." := EquipmentRepairTracking."Document No";
                    // ApprovalEntryArgument."Project Document Type" := EquipmentRepairTracking."Document Type";
                end;
            Database::"Insurance/Guarantee Header":
                begin
                    RecRef.Settable(InsuranceGuarantee);
                   // ApprovalEntryArgument."Document No." := InsuranceGuarantee."Document No.";
                    // ApprovalEntryArgument."Project Document Type" := InsuranceGuarantee."Document Type";
                end;
            Database::"Material Test Record":
                begin
                    RecRef.Settable(MaterialTestRecord);
                    //ApprovalEntryArgument."Document No." := MaterialTestRecord."Code";
                    // ApprovalEntryArgument."Project Document Type" := MaterialTestRecord."Document Type";
                end;
            Database::"Work Plan Header":
                begin
                    RecRef.settable(WorkPlanHeader);
                    //  ApprovalEntryArgument."Document No." := WorkPlanHeader."Document No.";
                end;
            Database::"Risk M&E Header":
                begin
                    RecRef.settable(RiskMEHeader);
                    //ApprovalEntryArgument."Document No." := RiskMEHeader."Document No";
                end;
            Database::"Site Instructions Header":
                begin
                    RecRef.settable(SiteInstructions);
                    ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Site Instruction";

                end;
            Database::"Project Meeting Register":
                begin
                    RecRef.Settable(ProjectMeetingRegister);
                    ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Meeting Register";
                    
                end;
            Database::"RE Payment Schedule Header":
                begin
                    RecRef.Settable(RepaymentSchedule);
                    // ApprovalEntryArgument."Document No." := RepaymentSchedule."Document No.";
                end;
            Database::"Risk Incident Log":
                begin
                    RecRef.SetTable(RiskIncidentLog);
                    // ApprovalEntryArgument."Document No." := RiskIncidentLog."Incident ID";
                end;
            Database::"Risk Management Plan":
                begin
                    RecRef.SetTable(RiskManagementPlan);
                    // ApprovalEntryArgument."Document No." := RiskManagementPlan."Document No";
                end;
            Database::"WEP Contractor Submission":
                begin
                    RecRef.SetTable(WEPContractorSubmission);
                    Case
                    WEPContractorSubmission."Document Type" of
                        WEPContractorSubmission."Document Type"::"Site Agent Nomination":
                            ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Site Agent Nomination";
                        WEPContractorSubmission."Document Type"::"Contractor Personnel Appointment":
                            ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Contractor Key Personnel Appointment";
                    ///   WEPContractorSubmission."Document Type"::"Contractor Staff Disengagement":
                    //    ApprovalEntryArgument."Project Document Type" := ApprovalEntryArgument."Project Document Type"::"Contractor Key Personnel Appointment";
                    End;
                end;
            Database::"Survey Quality Check Header":
                begin
                    RecRef.SetTable(SurveyQualityCheckHeader);
                    //ApprovalEntryArgument."Document No." := SurveyQualityCheckHeader."Document No";
                end;
            Database::"Temporary Supervision Requirem":
                begin
                    RecRef.SetTable(TemporarySupervisionRequirem);
                    // ApprovalEntryArgument."Document No." := TemporarySupervisionRequirem."Document No";
                end;
            Database::"Communication Plan Header":
                begin
                    RecRef.SetTable(CommunicationPlanHeader);
                    //  ApprovalEntryArgument."Document No." := CommunicationPlanHeader."Document No";
                end;
            Database::"Daily Work Record":
                begin
                    RecRef.SetTable(DailyWorkRecord);
                    // ApprovalEntryArgument."Document No." := DailyWorkRecord."Document No.";
                end;

        end;
        exit(ApprovalEntryArgument."Project Document Type");
    end;

}
codeunit 50149 MergePDF
{
    //HOW TO USE
    //Just call the AddReportToMerge or AddBase64pdf functions as many times as needed and later get call the GetJArray function.
    //You will get an array with all your pdfs in base64 to provide to the javascript function of the controladd-in


    procedure AddReportToMerge(ReportID: Integer; RecRef: RecordRef)
    var
        Tempblob: Codeunit "Temp Blob";
        Ins: InStream;
        Outs: OutStream;
        Parameters: Text;
        Convert: Codeunit "Base64 Convert";
    begin
        Tempblob.CreateInStream(Ins);
        Tempblob.CreateOutStream(Outs);
        Parameters := '';
        Report.SaveAs(ReportID, Parameters, ReportFormat::Pdf, Outs, RecRef);
        Clear(JObjectPDFToMerge);
        JObjectPDFToMerge.Add('pdf', Convert.ToBase64(Ins));
        JArrayPDFToMerge.Add(JObjectPDFToMerge);
    end;


    procedure AddBase64pdf(base64pdf: text)
    begin
        Clear(JObjectPDFToMerge);
        JObjectPDFToMerge.Add('pdf', base64pdf);
        JArrayPDFToMerge.Add(JObjectPDFToMerge);
    end;


    procedure ClearPDF()
    begin
        Clear(JArrayPDFToMerge);
    end;


    procedure GetJArray() JArrayPDF: JsonArray;
    begin
        JArrayPDF := JArrayPDFToMerge;
    end;


    var
        JObjectPDFToMerge: JsonObject;
        JArrayPDFToMerge: JsonArray;
        JObjectPDF: JsonObject;
        CurrExchRate: Record "Currency Exchange Rate";
}
