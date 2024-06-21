#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Report 72025 "Work Execution Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Work Execution Plan.rdlc';

    dataset
    {
        dataitem("Project Mobilization Header";"Project Mobilization Header")
        {
            RequestFilterFields = "Commencement Order ID","Purchase Contract ID","Project ID","Contractor No.","IFS Code";
            column(CompanyPicture; CompanyInfo.Picture)
            {

            }
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyAddress7; CompanyAddr[7])
            {
            }
            column(CompanyAddress8; CompanyAddr[8])
            {
            }
            column(ReportForNavId_1; 1)
            {
            }
            column(CName;ObjCInfo.Name)
            {
            }
            column(CPic;ObjCInfo.Picture)
            {
            }
            column(CAddress;ObjCInfo.Address)
            {
            }
            column(CAddress2;ObjCInfo."Address 2")
            {
            }
            column(CCity;ObjCInfo.City)
            {
            }
            column(DocumentType_ProjectMobilizationHeader;"Project Mobilization Header"."Document Type")
            {
            }
            column(DocumentNo_ProjectMobilizationHeader;"Project Mobilization Header"."Document No.")
            {
            }
            column(DocumentDate_ProjectMobilizationHeader;Format("Project Mobilization Header"."Document Date"))
            {
            }
            column(CommencementOrderID_ProjectMobilizationHeader;"Project Mobilization Header"."Commencement Order ID")
            {
            }
            column(PurchaseContractID_ProjectMobilizationHeader;"Project Mobilization Header"."Purchase Contract ID")
            {
            }
            column(ProjectID_ProjectMobilizationHeader;"Project Mobilization Header"."Project ID")
            {
            }
            column(Description_ProjectMobilizationHeader;"Project Mobilization Header".Description)
            {
            }
            column(ProjectMission_ProjectMobilizationHeader;"Project Mobilization Header"."Project Mission")
            {
            }
            column(StaffAppointmentVoucherNo_ProjectMobilizationHeader;"Project Mobilization Header"."Staff Appointment Voucher No.")
            {
            }
            column(ContractorNo_ProjectMobilizationHeader;"Project Mobilization Header"."Contractor No.")
            {
            }
            column(ContractorName_ProjectMobilizationHeader;"Project Mobilization Header"."Contractor Name")
            {
            }
            column(VendorAddress_ProjectMobilizationHeader;"Project Mobilization Header"."Vendor Address")
            {
            }
            column(VendorAddress2_ProjectMobilizationHeader;"Project Mobilization Header"."Vendor Address 2")
            {
            }
            column(VendorPostCode_ProjectMobilizationHeader;"Project Mobilization Header"."Vendor Post Code")
            {
            }
            column(PrimaryEmail_ProjectMobilizationHeader;"Project Mobilization Header"."Primary E-mail")
            {
            }
            column(VendorCity_ProjectMobilizationHeader;"Project Mobilization Header"."Vendor City")
            {
            }
            column(ProjectDeliveryStrategy_ProjectMobilizationHeader;"Project Mobilization Header"."Project Delivery Strategy")
            {
            }
            column(IFSCode_ProjectMobilizationHeader;"Project Mobilization Header"."IFS Code")
            {
            }
            column(TenderDate_ProjectMobilizationHeader;"Project Mobilization Header"."Tender Date")
            {
            }
            column(TenderName_ProjectMobilizationHeader;"Project Mobilization Header"."Tender Name")
            {
            }
            column(NoticeofAwardNo_ProjectMobilizationHeader;"Project Mobilization Header"."Notice of Award No.")
            {
            }
            column(AwardDate_ProjectMobilizationHeader;"Project Mobilization Header"."Award Date")
            {
            }
            column(ContractStartDate_ProjectMobilizationHeader;Format("Project Mobilization Header"."Contract Start Date"))
            {
            }
            column(ContractEndDate_ProjectMobilizationHeader;Format("Project Mobilization Header"."Contract End Date"))
            {
            }
            column(AwardTendSumIncTaxesLCY_ProjectMobilizationHeader;Format("Project Mobilization Header"."Award Tend Sum Inc Taxes (LCY)"))
            {
            }
            column(ProjectName_ProjectMobilizationHeader;"Project Mobilization Header"."Project Name")
            {
            }
            column(ProjectStartDate_ProjectMobilizationHeader;Format("Project Mobilization Header"."Project Start Date"))
            {
            }
            column(ProjectEndDate_ProjectMobilizationHeader;Format("Project Mobilization Header"."Project End  Date"))
            {
            }
            column(DefectLiabilityStartDate_ProjectMobilizationHeader;Format("Project Mobilization Header"."Defect Liability Start Date"))
            {
            }
            column(DefectLiabilityEndDate_ProjectMobilizationHeader;Format("Project Mobilization Header"."Defect Liability End Date"))
            {
            }
            column(ProjectEngineerNo_ProjectMobilizationHeader;"Project Mobilization Header"."Project Engineer No.")
            {
            }
            column(ProjectManager_ProjectMobilizationHeader;"Project Mobilization Header"."Project Manager")
            {
            }
            column(ProjectEngineerName_ProjectMobilizationHeader;"Project Mobilization Header"."Project Engineer Name")
            {
            }
            column(EngineerRepresentativeNo_ProjectMobilizationHeader;"Project Mobilization Header"."Engineer Representative No.")
            {
            }
            column(EngineerRepresentativeName_ProjectMobilizationHeader;"Project Mobilization Header"."Engineer Representative Name")
            {
            }
            column(ImplementingAgencyID_ProjectMobilizationHeader;"Project Mobilization Header"."Implementing Agency ID")
            {
            }
            column(RegionID_ProjectMobilizationHeader;"Project Mobilization Header"."Region ID")
            {
            }
            column(DirectorateID_ProjectMobilizationHeader;"Project Mobilization Header"."Directorate ID")
            {
            }
            column(DepartmentID_ProjectMobilizationHeader;"Project Mobilization Header"."Department ID")
            {
            }
            column(ConstituencyID_ProjectMobilizationHeader;"Project Mobilization Header"."Constituency ID")
            {
            }
            column(CountyID_ProjectMobilizationHeader;"Project Mobilization Header"."County ID")
            {
            }
            column(FundingAgencyNo_ProjectMobilizationHeader;"Project Mobilization Header"."Funding Agency No.")
            {
            }
            column(FunderName_ProjectMobilizationHeader;"Project Mobilization Header"."Funder Name")
            {
            }
            column(FunderAddress_ProjectMobilizationHeader;"Project Mobilization Header"."Funder Address")
            {
            }
            column(FunderAddress2_ProjectMobilizationHeader;"Project Mobilization Header"."Funder Address 2")
            {
            }
            column(FunderPostCode_ProjectMobilizationHeader;"Project Mobilization Header"."Funder Post Code")
            {
            }
            column(FunderCity_ProjectMobilizationHeader;"Project Mobilization Header"."Funder City")
            {
            }
            column(FunderCounty_ProjectMobilizationHeader;"Project Mobilization Header"."Funder County")
            {
            }
            column(RoadCode_ProjectMobilizationHeader;"Project Mobilization Header"."Road Code")
            {
            }
            column(RoadSectionNo_ProjectMobilizationHeader;"Project Mobilization Header"."Road Section No.")
            {
            }
            column(SectionName_ProjectMobilizationHeader;"Project Mobilization Header"."Section Name")
            {
            }
            column(Status_ProjectMobilizationHeader;"Project Mobilization Header".Status)
            {
            }
            column(Posted_ProjectMobilizationHeader;"Project Mobilization Header".Posted)
            {
            }
            column(CreatedBy_ProjectMobilizationHeader;"Project Mobilization Header"."Created By")
            {
            }
            column(CreatedDateTime_ProjectMobilizationHeader;"Project Mobilization Header"."Created DateTime")
            {
            }
            column(ProjectSiteDescription_ProjectMobilizationHeader;"Project Mobilization Header"."Project Site Description")
            {
            }
            column(StartChainage_ProjectMobilizationHeader;Format("Project Mobilization Header"."Start Chainage"))
            {
            }
            column(EndChainage_ProjectMobilizationHeader;Format("Project Mobilization Header"."End  Chainage"))
            {
            }
            column(StartPointLongitude_ProjectMobilizationHeader;Format("Project Mobilization Header"."Start Point Longitude"))
            {
            }
            column(EndPointLongitude_ProjectMobilizationHeader;Format("Project Mobilization Header"."Start  Point Latitude"))
            {
            }
            column(WorkExecutionPlanID_ProjectMobilizationHeader;"Project Mobilization Header"."Work Execution Plan ID")
            {
            }
            column(NoSeries_ProjectMobilizationHeader;"Project Mobilization Header"."No. Series")
            {
            }
            column(DefaultCheckListTemplateID_ProjectMobilizationHeader;"Project Mobilization Header"."Default CheckList Template ID")
            {
            }
            column(RequiredDocumentsTemplateID_ProjectMobilizationHeader;"Project Mobilization Header"."Required Documents Template ID")
            {
            }
            column(PreparedBy;UserSetup."Employee Name")
            {
            }
            column(DatePrepared;ApproverDate[1])
            {
            }
            column(PreparedBy_Signature;UserSetup.Picture)
            {
            }
            column(ExaminedBy;UserSetup1."Employee Name")
            {
            }
            column(DateApproved;Format(ApproverDate[2]))
            {
            }
            column(ExaminedBy_Signature;UserSetup1.Picture)
            {
            }
            column(VBC;UserSetup2."Employee Name")
            {
            }
            column(VBCDate;ApproverDate[3])
            {
            }
            column(VBC_Signature;UserSetup2.Picture)
            {
            }
            column(Authorizer;UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized;ApproverDate[4])
            {
            }
            column(Authorizer_Signature;UserSetup3.Picture)
            {
            }
            dataitem("WEP Execution Schedule";"WEP Execution Schedule")
            {
                DataItemLink = "Document Type"=field("Document Type"),"Document No"=field("Document No.");
                column(ReportForNavId_62; 62)
                {
                }
                column(DocumentType_WEPExecutionSchedule;"WEP Execution Schedule"."Document Type")
                {
                }
                column(DocumentNo_WEPExecutionSchedule;"WEP Execution Schedule"."Document No")
                {
                }
                column(JobNo_WEPExecutionSchedule;"WEP Execution Schedule"."Job No")
                {
                }
                column(JobTaskNo_WEPExecutionSchedule;"WEP Execution Schedule"."Job Task No")
                {
                }
                column(Description_WEPExecutionSchedule;"WEP Execution Schedule".Description)
                {
                }
                column(ScheduledStartDate_WEPExecutionSchedule;Format("WEP Execution Schedule"."Scheduled Start Date"))
                {
                }
                column(ScheduledEndDate_WEPExecutionSchedule;Format("WEP Execution Schedule"."Scheduled End Date"))
                {
                }
                column(BudgetTotalCost_WEPExecutionSchedule;Format("WEP Execution Schedule"."Budget (Total Cost)"))
                {
                }
                column(JobTaskType_WEPExecutionSchedule;"WEP Execution Schedule"."Job Task Type")
                {
                }
                column(LineNo_WEPExecutionSchedule;"WEP Execution Schedule"."Line No")
                {
                }
            }
            dataitem("WEP Method of Work";"WEP Method of Work")
            {
                DataItemLink = "Document No"=field("Document No."),"Document Type"=field("Document Type");
                column(ReportForNavId_82; 82)
                {
                }
                column(DocumentType_WEPMethodofWork;"WEP Method of Work"."Document Type")
                {
                }
                column(DocumentNo_WEPMethodofWork;"WEP Method of Work"."Document No")
                {
                }
                column(EntryNo_WEPMethodofWork;"WEP Method of Work"."Entry No")
                {
                }
                column(Description_WEPMethodofWork;"WEP Method of Work".Description)
                {
                }
                column(BenefitsSummary_WEPMethodofWork;"WEP Method of Work"."Benefits Summary")
                {
                }
            }
            dataitem("Internal Project Resource";"Internal Project Resource")
            {
                DataItemLink = "Project ID"=field("Project ID");
                column(ReportForNavId_88; 88)
                {
                }
                column(ProjectID_InternalProjectResource;"Internal Project Resource"."Project ID")
                {
                }
                column(ResourceNo_InternalProjectResource;"Internal Project Resource"."Resource No.")
                {
                }
                column(Name_InternalProjectResource;"Internal Project Resource".Name)
                {
                }
                column(Email_InternalProjectResource;"Internal Project Resource".Email)
                {
                }
                column(RoleCode_InternalProjectResource;"Internal Project Resource"."Role Code")
                {
                }
                column(Designation_InternalProjectResource;"Internal Project Resource".Designation)
                {
                }
                column(StaffCategory_InternalProjectResource;"Internal Project Resource"."Staff Category")
                {
                }
            }
            dataitem("WEP Contractor Team";"WEP Contractor Team")
            {
                DataItemLink = "Document No"=field("Document No."),"Contractor No."=field("Contractor No.");
                column(ReportForNavId_96; 96)
                {
                }
                column(DocumentType_WEPContractorTeam;"WEP Contractor Team"."Document Type")
                {
                }
                column(DocumentNo_WEPContractorTeam;"WEP Contractor Team"."Document No")
                {
                }
                column(ContractorNo_WEPContractorTeam;"WEP Contractor Team"."Contractor No.")
                {
                }
                column(ContractorStaffNo_WEPContractorTeam;"WEP Contractor Team"."Contractor Staff No.")
                {
                }
                column(Name_WEPContractorTeam;"WEP Contractor Team".Name)
                {
                }
                column(Email_WEPContractorTeam;"WEP Contractor Team".Email)
                {
                }
                column(Telephone_WEPContractorTeam;"WEP Contractor Team".Telephone)
                {
                }
                column(RoleCode_WEPContractorTeam;"WEP Contractor Team"."Role Code")
                {
                }
                column(Designation_WEPContractorTeam;"WEP Contractor Team".Designation)
                {
                }
                column(StaffCategory_WEPContractorTeam;"WEP Contractor Team"."Staff Category")
                {
                }
            }
            dataitem("WEP Contractor Equipment";"WEP Contractor Equipment")
            {
                DataItemLink = "Document No."=field("Document No.");
                column(ReportForNavId_97; 97)
                {
                }
                column(DocumentNo_WEPContractorEquipment;"WEP Contractor Equipment"."Document No.")
                {
                }
                column(ContractorNo_WEPContractorEquipment;"WEP Contractor Equipment"."Contractor No.")
                {
                }
                column(EquipmentNo_WEPContractorEquipment;"WEP Contractor Equipment"."Equipment No.")
                {
                }
                column(EquipmentTypeCode_WEPContractorEquipment;"WEP Contractor Equipment"."Equipment Type Code")
                {
                }
                column(Description_WEPContractorEquipment;"WEP Contractor Equipment".Description)
                {
                }
                column(OwnershipType_WEPContractorEquipment;"WEP Contractor Equipment"."Ownership Type")
                {
                }
                column(EquipmentSerialNo_WEPContractorEquipment;"WEP Contractor Equipment"."Equipment Serial No.")
                {
                }
                column(EquipmentUsabilityCode_WEPContractorEquipment;"WEP Contractor Equipment"."Equipment Usability Code")
                {
                }
                column(YearsofPreviousUse_WEPContractorEquipment;"WEP Contractor Equipment"."Years of Previous Use")
                {
                }
                column(EquipmentConditionCode_WEPContractorEquipment;"WEP Contractor Equipment"."Equipment Condition Code")
                {
                }
            }
            dataitem("WEP Equipment Repair Plan";"WEP Equipment Repair Plan")
            {
                DataItemLink = "Document No."=field("Document No.");
                column(ReportForNavId_98; 98)
                {
                }
                column(EquipmentNo_WEPEquipmentRepairPlan;"WEP Equipment Repair Plan"."Equipment No.")
                {
                }
                column(EntryNo_WEPEquipmentRepairPlan;"WEP Equipment Repair Plan"."Entry  No")
                {
                }
                column(MaintenanceType_WEPEquipmentRepairPlan;"WEP Equipment Repair Plan"."Maintenance Type")
                {
                }
                column(ScheduledDate_WEPEquipmentRepairPlan;"WEP Equipment Repair Plan"."Scheduled Date")
                {
                }
                column(TodoDescription_WEPEquipmentRepairPlan;"WEP Equipment Repair Plan"."To-do Description")
                {
                }
                column(ResponsibleStaffNo_WEPEquipmentRepairPlan;"WEP Equipment Repair Plan"."Responsible Staff No.")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID",72157);
                ApprovalEntries.SetRange("Document No.","Project Mobilization Header"."Document No.");
                ApprovalEntries.SetRange(Status,ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                   i:=0;
                 repeat
                 i:=i+1;
                if i=1 then begin
                Approver[1]:=ApprovalEntries."Sender ID";

                ApproverDate[1]:=ApprovalEntries."Date-Time Sent for Approval";
                 if UserSetup.Get(Approver[1]) then
                    UserSetup.CalcFields(Picture);

                Approver[2]:=ApprovalEntries."Approver ID";
                ApproverDate[2]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup1.Get(Approver[2]) then
                    UserSetup1.CalcFields(Picture);
                end;
                if i=2 then
                begin
                Approver[3]:=ApprovalEntries."Approver ID";
                ApproverDate[3]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup2.Get(Approver[3]) then
                    UserSetup2.CalcFields(Picture);
                end;
                if i=3 then
                begin
                Approver[4]:=ApprovalEntries."Approver ID";
                ApproverDate[4]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup3.Get(Approver[4]) then
                    UserSetup3.CalcFields(Picture);
                end;
                until
                ApprovalEntries.Next=0;

                end;
                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Region ID", RespCenter, CompanyInfo, CompanyAddr);
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

    trigger OnInitReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    trigger OnPostReport()
    begin
        //MESSAGE('You have successfully generated Work Execution Plan for Project No:'+' '+"Project Mobilization Header"."Project ID");
    end;

    trigger OnPreReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    var
        ObjCInfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        Approver: array [10] of Code[50];
        ApproverDate: array [10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
}
