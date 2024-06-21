codeunit 67011 "Page Management Ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Page Management", 'OnAfterGetPageID', '', false, false)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    begin
        //if PageID = 0 then
        PageID := GetConditionalCardPageID(RecordRef);


    end;

    local procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    var
        PV: Record "Payments";
        Payments: Record Payments;
        imprest: Record "Imprest Memo";
        Corporate: Record "Corporate Strategic Plans";
        pavement: Record "Pavement Test Header";
        ifp: record "Request For Information";
        pplan: record "Procurement Plan";
        PURCHREQ: Record "Purchase Header";
        Gbatch: record 232;
        Payroll: record "Payroll Header";
        measure: record "Measurement &  Payment Header";
        comm: record "ifs tender committee";
        gen: record 81;
        roadsceiling: record "Road Works Budget Ceilings";
        Sales: record "Sales Header";
        Leave: record "HR Leave Applications";
        Receipts: record "Receipts Header1";
        StaffAppointment: Record "Project Staff Voucher";
        ProjectMobilization: Record "Project Mobilization Header";
        VehicleFuelCardLines: Record "Vehicle Fuel Card Lines";
        RFQ: Record "Standard Purchase Code";
        VendorAppraisalVoucher: Record "Vendor Appraisal Voucher";
        PayrollHeaderT: Record "Payroll HeaderT";
        ContractTermination: Record "Contract Termination";
        TransportRequisition: Record "Transport Requisition";
    // Budget: Record "Budget Header";
    // TS: Record "Consultant Time Sheet";
    // BankRec: Record "Bank Acc. Reconciliation";
    begin
        case RecordRef.Number of
            database::"Gen. Journal Batch":
                begin
                    RecordRef.SetTable(Gbatch);
                    exit(Page::"General Journal")
                end;


            database::"Road Works Budget Ceilings":
                begin
                    RecordRef.SetTable(roadsceiling);
                    exit(Page::"Road works budget Ceiling")
                end;
            database::"Gen. Journal line":
                begin
                    RecordRef.SetTable(gen);
                    exit(Page::"General Journal")
                end;


            database::"Payments":
                begin
                    RecordRef.SetTable(PV);
                    if pv."Payment Type" = pv."Payment Type"::"Payment Voucher" then
                        exit(Page::"Payment Voucher")
                    else
                        if pv."Payment Type" = pv."Payment Type"::"Surrender" then
                            exit(Page::"Imprest Surrender")
                        else
                            if pv."Payment Type" = pv."Payment Type"::Imprest then
                                exit(Page::"Imprest Requisition")

                            else
                                if pv."Payment Type" = pv."Payment Type"::"Staff Claim" then
                                    exit(Page::"Staff Claim")
                                else
                                    if pv."Payment Type" = pv."Payment Type"::"Petty Cash" then
                                        exit(Page::"Petty Cash Voucher")
                                    else
                                        if pv."Payment Type" = pv."Payment Type"::"Petty Cash Surrender" then
                                            exit(Page::"Petty Cash Surrender")
                                        else
                                            if pv."Payment Type" = pv."Payment Type"::"Bank Transfer" then
                                                exit(Page::"Bank Transfer")
                                            else
                                                exit(Page::"Imprest Requisition");
                end;
            Database::"Corporate Strategic Plans":
                begin
                    RecordRef.SetTable(Corporate);
                    exit(Page::"All CSP CARD")
                end;
            Database::"Pavement Test Header":
                begin
                    RecordRef.SetTable(pavement);
                    exit(Page::"Pavement Lab Test")
                end;
            Database::"Sales Header":
                begin
                    RecordRef.SetTable(sales);
                    exit(Page::"Sales Invoice")
                end;
            Database::"Receipts Header1":
                begin
                    RecordRef.SetTable(Receipts);
                    exit(Page::"Receipt")
                end;
            Database::"HR Leave Applications":
                begin
                    RecordRef.SetTable(Leave);
                    exit(Page::"Leave Applications Card")
                end;
            Database::"Payroll Header":
                begin
                    RecordRef.SetTable(Payroll);
                    exit(Page::"Payroll Header")
                end;
            Database::"Measurement &  Payment Header":
                begin
                    RecordRef.SetTable(measure);
                    Case measure."Document Type" of
                        measure."Document Type"::"Contractor Payment Request":
                            begin
                                Case measure."Payment Certificate Type" of
                                    measure."Payment Certificate Type"::"Advance Payment":
                                        exit(Page::"Advance Payment Certificate");
                                    measure."Payment Certificate Type"::"Interim Payment":
                                        exit(Page::"Interim Payment Request");
                                End;
                            end;
                    End;


                end;
            Database::"Request For Information":
                begin
                    RecordRef.SetTable(ifp);
                    exit(Page::"IFP Card")
                end;
            Database::"Procurement Plan":
                begin
                    RecordRef.SetTable(pplan);
                    exit(Page::"Procurement Plan Card")
                end;
            Database::"ifs tender committee":
                begin
                    RecordRef.SetTable(comm);
                    exit(Page::"IFS Tender Committee Card")
                end;
            Database::"Vehicle Fuel Card Lines":
                begin
                    RecordRef.SetTable(VehicleFuelCardLines);
                    exit(Page::"Fuel Expenses Card");
                end;
            Database::"Purchase Header":
                begin
                    RecordRef.SetTable(PURCHREQ);
                    Case PURCHREQ."Document Type" of
                        PURCHREQ."Document Type"::Order:
                            exit(Page::"Purchase Order");
                        PURCHREQ."Document Type"::Invoice:
                            exit(Page::"Purchase Invoice");
                        PURCHREQ."Document Type"::"Store Requisition":
                            exit(Page::"Store Requisition");
                        PURCHREQ."Document Type"::"Purchase Requisition":
                            begin
                                if PURCHREQ."PRN Type" = PURCHREQ."PRN Type"::Standard then
                                    exit(Page::"Standard Purchase Requisition")
                                else
                                    if PURCHREQ."PRN Type" = PURCHREQ."PRN Type"::"Project Works" then
                                        exit(Page::"Projects Works PRNs")
                            end;
                    End;

                end;
            Database::"Imprest Memo":
                begin
                    RecordRef.SetTable(imprest);
                    exit(Page::"Imprest Memo")
                end;
            Database::"Project Staff Voucher":
                begin
                    RecordRef.SetTable(StaffAppointment);
                    Case StaffAppointment."Document Type" of
                        StaffAppointment."Document Type"::Appointment:
                            exit(Page::"Project Staff Appointment Card");
                        StaffAppointment."Document Type"::Termination:
                            exit(Page::"Project Staff Termination");
                    End;
                end;
            Database::"Project Mobilization Header":
                begin
                    RecordRef.SetTable(ProjectMobilization);
                    Case ProjectMobilization."Document Type" of
                        ProjectMobilization."Document Type"::"Order-To-Commence":
                            exit(Page::"Project Commencement Order");
                        ProjectMobilization."Document Type"::"Work Execution Programme":
                            exit(Page::"Work Execution Plan");
                        ProjectMobilization."Document Type"::"Mobilization Checklist":
                            exit(page::"Mobilization Checklist");
                        ProjectMobilization."Document Type"::"Mobilization Checklist Status Report":
                            exit(page::"Mobilization Checklist");
                    End;
                end;
            Database::"Standard Purchase Code":
                begin
                    RecordRef.SetTable(RFQ);
                    Case RFQ."Procurement Method" of
                        RFQ."Procurement Method"::"Open Tender":
                            Exit(Page::"Invitation to Tender Card");
                        RFQ."Procurement Method"::RFQ:
                            exit(Page::"Request For Quotation (RFQ)");
                    End
                end;
            Database::"Vendor Appraisal Voucher":
                begin
                    RecordRef.SetTable(VendorAppraisalVoucher);
                    exit(Page::"Vendor Appraisal Voucher");
                end;
            Database::"Payroll HeaderT":
                begin
                    RecordRef.SetTable(PayrollHeaderT);
                    exit(Page::"Salary Voucher Temp");
                end;
                Database::"Contract Termination":
                begin
                    RecordRef.SetTable(ContractTermination);
                    exit(Page::"Contract Termination");
                end;
                Database::"Transport Requisition":
                begin
                    RecordRef.SetTable(TransportRequisition);
                    exit(Page::"Fleet Requisition Card");
                end;
        end;
    end;

}
