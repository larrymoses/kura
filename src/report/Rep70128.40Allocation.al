#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70128 "40%  Allocation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/40%  Allocation.rdlc';

    dataset
    {
        dataitem("Bid Tabulation Header";"Bid Tabulation Header")
        {
            DataItemTableView = where("Document Type"=const("Notice of Award"),"Process Type"=filter(IFS));
            RequestFilterFields = "Document Date";
            column(ReportForNavId_1; 1)
            {
            }
            column(logo;corec.Picture)
            {
            }
            column(CompanyName;corec.Name)
            {
            }
            column(Address;corec.Address)
            {
            }
            column(PhysicalAddress;corec."Address 2")
            {
            }
            column(City;corec.City)
            {
            }
            column(TEL;corec."Phone No.")
            {
            }
            column(Email;corec."E-Mail")
            {
            }
            column(MobileNo;corec."Phone No. 2")
            {
            }
            column(Website;corec."Home Page")
            {
            }
            column(Code_BidTabulationHeader;"Bid Tabulation Header".Code)
            {
            }
            column(DocumentType_BidTabulationHeader;"Bid Tabulation Header"."Document Type")
            {
            }
            column(IFSCode_BidTabulationHeader;"Bid Tabulation Header"."IFS Code")
            {
            }
            column(DocumentDate_BidTabulationHeader;"Bid Tabulation Header"."Document Date")
            {
            }
            column(FinalEvaluationReportID_BidTabulationHeader;"Bid Tabulation Header"."Final Evaluation Report ID")
            {
            }
            column(Description_BidTabulationHeader;"Bid Tabulation Header".Description)
            {
            }
            column(TenderName_BidTabulationHeader;"Bid Tabulation Header"."Tender Name")
            {
            }
            column(RaisedBy_BidTabulationHeader;"Bid Tabulation Header"."Raised By")
            {
            }
            column(Name_BidTabulationHeader;"Bid Tabulation Header".Name)
            {
            }
            column(TenderCommitteeRole_BidTabulationHeader;"Bid Tabulation Header"."Tender Committee Role")
            {
            }
            column(DesignationTitle_BidTabulationHeader;"Bid Tabulation Header"."Designation/Title")
            {
            }
            column(AnnualProcurementPlanID_BidTabulationHeader;"Bid Tabulation Header"."Annual Procurement Plan ID")
            {
            }
            column(ProcurementPlanDate_BidTabulationHeader;"Bid Tabulation Header"."Procurement Plan Date")
            {
            }
            column(FinancialYearCode_BidTabulationHeader;"Bid Tabulation Header"."Financial Year Code")
            {
            }
            column(ProcurementPlanLineNo_BidTabulationHeader;"Bid Tabulation Header"."Procurement Plan Line No.")
            {
            }
            column(ProcurementPlanEntryNo_BidTabulationHeader;"Bid Tabulation Header"."Procurement Plan Entry No")
            {
            }
            column(AvailableProcurementBudget_BidTabulationHeader;"Bid Tabulation Header"."Available Procurement Budget")
            {
            }
            column(BudgetNarration_BidTabulationHeader;"Bid Tabulation Header"."Budget Narration")
            {
            }
            column(BidOpeningDate_BidTabulationHeader;"Bid Tabulation Header"."Bid Opening Date")
            {
            }
            column(EvaluationCompletionDate_BidTabulationHeader;"Bid Tabulation Header"."Evaluation Completion Date")
            {
            }
            column(AppointedBidOpeningComm_BidTabulationHeader;"Bid Tabulation Header"."Appointed Bid Opening Comm")
            {
            }
            column(AppointedBidEvaluationCom_BidTabulationHeader;"Bid Tabulation Header"."Appointed Bid Evaluation Com")
            {
            }
            column(PrimaryRegion_BidTabulationHeader;"Bid Tabulation Header"."Primary Region")
            {
            }
            column(ApprovalStatus_BidTabulationHeader;"Bid Tabulation Header"."Approval Status")
            {
            }
            column(ProfessionalOpinionID_BidTabulationHeader;"Bid Tabulation Header"."Professional Opinion ID")
            {
            }
            column(AwardedBidNo_BidTabulationHeader;"Bid Tabulation Header"."Awarded Bid No")
            {
            }
            column(AwardedBidderNo_BidTabulationHeader;"Bid Tabulation Header"."Awarded Bidder No.")
            {
            }
            column(AwardedBidderName_BidTabulationHeader;"Bid Tabulation Header"."Awarded Bidder Name")
            {
            }
            column(AwardTenderSumIncTaxes_BidTabulationHeader;"Bid Tabulation Header"."Award Tender Sum Inc Taxes")
            {
            }
            column(AwardAcceptanceDeadline_BidTabulationHeader;"Bid Tabulation Header"."Award Acceptance Deadline")
            {
            }
            column(AwardAcceptanceResponse_BidTabulationHeader;"Bid Tabulation Header"."Award Acceptance Response")
            {
            }
            column(MinContractHolding_BidTabulationHeader;"Bid Tabulation Header"."Min. Contract Holding")
            {
            }
            column(EarliestContractIssuanceDt_BidTabulationHeader;"Bid Tabulation Header"."Earliest Contract Issuance Dt")
            {
            }
            column(BidderNoAResponseType_BidTabulationHeader;"Bid Tabulation Header"."Bidder NoA Response Type")
            {
            }
            column(BidderNoAResponseDate_BidTabulationHeader;"Bid Tabulation Header"."Bidder NoA Response Date")
            {
            }
            column(NoofPostAwardDisputes_BidTabulationHeader;"Bid Tabulation Header"."No. of Post-Award Disputes")
            {
            }
            column(DocumentStatus_BidTabulationHeader;"Bid Tabulation Header"."Document Status")
            {
            }
            column(NoSeries_BidTabulationHeader;"Bid Tabulation Header"."No. Series")
            {
            }
            column(CreatedBy_BidTabulationHeader;"Bid Tabulation Header"."Created By")
            {
            }
            column(CreatedDate_BidTabulationHeader;"Bid Tabulation Header"."Created Date")
            {
            }
            column(CreatedTime_BidTabulationHeader;"Bid Tabulation Header"."Created Time")
            {
            }
            column(Posted_BidTabulationHeader;"Bid Tabulation Header".Posted)
            {
            }
            column(PostedBy_BidTabulationHeader;"Bid Tabulation Header"."Posted By")
            {
            }
            column(PostedDate_BidTabulationHeader;"Bid Tabulation Header"."Posted Date")
            {
            }
            column(FinancialEvaluationID_BidTabulationHeader;"Bid Tabulation Header"."Financial Evaluation ID")
            {
            }
            column(GeneralProcurementRemarks_BidTabulationHeader;"Bid Tabulation Header"."General Procurement Remarks")
            {
            }
            column(Noofsubmittedbids_BidTabulationHeader;"Bid Tabulation Header"."No of submitted bids")
            {
            }
            column(NoofOpenedBidsTech_BidTabulationHeader;"Bid Tabulation Header"."No of Opened Bids(Tech)")
            {
            }
            column(NoofOpenedBidsFinance_BidTabulationHeader;"Bid Tabulation Header"."No of Opened Bids(Finance)")
            {
            }
            column(NoofResponsiveTech_BidTabulationHeader;"Bid Tabulation Header"."No of Responsive(Tech)")
            {
            }
            column(NoofnonResponsiveTech_BidTabulationHeader;"Bid Tabulation Header"."No of non- Responsive(Tech)")
            {
            }
            column(NoofResponsiveFinance_BidTabulationHeader;"Bid Tabulation Header"."No of Responsive(Finance)")
            {
            }
            column(NoofnonResponsiveFinance_BidTabulationHeader;"Bid Tabulation Header"."No of non- Responsive(Finance)")
            {
            }
            column(BidOpeningRegisterTech_BidTabulationHeader;"Bid Tabulation Header"."Bid Opening Register(Tech)")
            {
            }
            column(BidOpeningRegisterFinance_BidTabulationHeader;"Bid Tabulation Header"."Bid Opening Register(Finance)")
            {
            }
            column(RequisitionOfficer;UserSetup."Employee Name")
            {
            }
            column(DateRequisitionOfficer;ApproverDate[1])
            {
            }
            column(RequisitionOfficer_Signature;UserSetup.Picture)
            {
            }
            column(AuthorisingOfficer;UserSetup2."Employee Name")
            {
            }
            column(DateAuthorisingOfficer;ApproverDate[2])
            {
            }
            column(AuthorisingOfficer_Signature;UserSetup2.Picture)
            {
            }
            column(IssuedBy;UserSetup3."Employee Name")
            {
            }
            column(DateIssuedBy;ApproverDate[3])
            {
            }
            column(IssuedBy_Signature;UserSetup3.Picture)
            {
            }
            column(AuthorizedBy;UserSetup4."Employee Name")
            {
            }
            column(DateAuthorizedBy;ApproverDate[4])
            {
            }
            column(AuthorizedBy_Signature;UserSetup4.Picture)
            {
            }
            column(Designation;Designation)
            {
            }
            column(SupplierCategory;SupplierCategory)
            {
            }

            trigger OnAfterGetRecord()
            begin
                
                //Approvals Signatures
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID",70181);
                ApprovalEntries.SetRange("Document No.", "Bid Tabulation Header".Code);
                ApprovalEntries.SetRange(Status,ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                   i:=0;
                 repeat
                 i:=i+1;
                if i=1 then begin
                Approver1[1]:=ApprovalEntries."Sender ID";
                ApproverDate[1]:=ApprovalEntries."Date-Time Sent for Approval";
                 if UserSetup.Get(Approver1[1]) then begin
                    UserSetup.CalcFields(Picture);
                
                       ENo:=UserSetup."Employee No.";
                        if Emp.Get(ENo) then
                          DesignationID:=Emp."Job ID";
                          /*JOBID.RESET;
                          JOBID.SETRANGE("Job Id",DesignationID);
                            IF JOBID.FINDSET THEN
                              Designation:=JOBID."Task No";*/
                
                             end;
                Approver1[2]:=ApprovalEntries."Approver ID";
                ApproverDate[2]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup1.Get(Approver1[2]) then begin
                    UserSetup1.CalcFields(Picture);
                    ENo:=UserSetup1."Employee No.";
                        if Emp.Get(ENo) then
                          DesignationID:=Emp."Job ID";
                            /*JOBID.RESET;
                          JOBID.SETRANGE("Job Id",DesignationID);
                            IF JOBID.FINDSET THEN
                              Designation:=JOBID."Task No";*/
                            end;
                end;
                if i=2 then
                begin
                Approver1[3]:=ApprovalEntries."Approver ID";
                ApproverDate[3]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup2.Get(Approver1[3]) then begin
                    UserSetup2.CalcFields(Picture);
                    ENo:=UserSetup2."Employee No.";
                        if Emp.Get(ENo) then
                          DesignationID:=Emp."Job ID";
                            /*JOBID.RESET;
                          JOBID.SETRANGE("Job Id",DesignationID);
                            IF JOBID.FINDSET THEN
                              Designation:=JOBID."Task No";*/
                end;
                end;
                if i=3 then
                begin
                Approver1[4]:=ApprovalEntries."Approver ID";
                ApproverDate[4]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup3.Get(Approver1[4]) then begin
                    UserSetup3.CalcFields(Picture);
                    ENo:=UserSetup3."Employee No.";
                        if Emp.Get(ENo) then
                          DesignationID:=Emp."Job ID";
                           /* JOBID.RESET;
                          JOBID.SETRANGE("Job Id",DesignationID);
                            IF JOBID.FINDSET THEN
                              Designation:=JOBID."Task No";*/
                end;
                end;
                until
                ApprovalEntries.Next=0;
                end;

            end;

            trigger OnPreDataItem()
            begin
                corec.CalcFields(corec.Picture);
                Vend.Reset;
                Vend.SetRange("No.","Bid Tabulation Header"."Awarded Bid No");
                if Vend.FindSet then
                  SupplierCategory:=Vend."Supplier Category";
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        corec: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        ApproverDate: array [10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        Emp: Record Employee;
        DesignationID: Code[50];
        USetup: Record "User Setup";
        ENo: Code[10];
        Designation: Code[50];
        Approver1: array [10] of Code[50];
        JOBID: Record "ManPower Planning Lines";
        Vend: Record Vendor;
        SupplierCategory: Text;
}

