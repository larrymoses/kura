#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Report 72037 "Project Communication Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Project Communication Plan.rdlc';

    dataset
    {
        dataitem("Communication Plan Header";"Communication Plan Header")
        {
            DataItemTableView = where("Document Type"=filter(Project));
            column(ReportForNavId_1; 1)
            {
            }
            column(CName;ObjCInfo.Name)
            {
            }
            column(CPic;ObjCInfo.Picture)
            {
            }
            column(CAddress2;ObjCInfo."Address 2")
            {
            }
            column(CCity;ObjCInfo.City)
            {
            }
            column(CAddress;ObjCInfo.Address)
            {
            }
            column(RegionName;RegionName)
            {
            }
            column(DocumentType_CommunicationPlanHeader;"Communication Plan Header"."Document Type")
            {
            }
            column(DocumentNo_CommunicationPlanHeader;"Communication Plan Header"."Document No")
            {
            }
            column(ProjectID_CommunicationPlanHeader;"Communication Plan Header"."Project ID")
            {
            }
            column(WorkExecutionPlanID_CommunicationPlanHeader;"Communication Plan Header"."Work Execution Plan ID")
            {
            }
            column(Description_CommunicationPlanHeader;"Communication Plan Header".Description)
            {
            }
            column(PrimaryMIssion_CommunicationPlanHeader;"Communication Plan Header"."Primary Mission")
            {
            }
            column(ProjectName_CommunicationPlanHeader;"Communication Plan Header"."Project Name")
            {
            }
            column(ProjectStartDate_CommunicationPlanHeader;Format("Communication Plan Header"."Project Start Date"))
            {
            }
            column(ProjectEndDate_CommunicationPlanHeader;Format("Communication Plan Header"."Project End Date"))
            {
            }
            column(NoOfPlannedMeetings_CommunicationPlanHeader;"Communication Plan Header"."No. Of Planned Meetings")
            {
            }
            column(NoOfMeetingsHeld_CommunicationPlanHeader;"Communication Plan Header"."No. Of Meetings Held")
            {
            }
            column(NoOfProjectReport_CommunicationPlanHeader;"Communication Plan Header"."No. Of Project Report")
            {
            }
            column(Blocked_CommunicationPlanHeader;"Communication Plan Header".Blocked)
            {
            }
            column(Status_CommunicationPlanHeader;"Communication Plan Header".Status)
            {
            }
            column(CreatedBy_CommunicationPlanHeader;"Communication Plan Header"."Created By")
            {
            }
            column(CreatedDateTime_CommunicationPlanHeader;"Communication Plan Header"."Created Date Time")
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
            dataitem("Communication Plan Objective";"Communication Plan Objective")
            {
                DataItemLink = "Document No"=field("Document No");
                column(ReportForNavId_60; 60)
                {
                }
                column(DocumentType_CommunicationPlanObjective;"Communication Plan Objective"."Document Type")
                {
                }
                column(DocumentNo_CommunicationPlanObjective;"Communication Plan Objective"."Document No")
                {
                }
                column(ObjectiveID_CommunicationPlanObjective;"Communication Plan Objective"."Objective ID")
                {
                }
                column(Description_CommunicationPlanObjective;"Communication Plan Objective".Description)
                {
                }
            }
            dataitem("Communication Plan Line";"Communication Plan Line")
            {
                DataItemLink = "Document No"=field("Document No");
                column(ReportForNavId_67; 67)
                {
                }
                column(DocumentType_CommunicationPlanLine;"Communication Plan Line"."Document Type")
                {
                }
                column(DocumentNo_CommunicationPlanLine;"Communication Plan Line"."Document No")
                {
                }
                column(Category_CommunicationPlanLine;"Communication Plan Line".Category)
                {
                }
                column(LineNo_CommunicationPlanLine;"Communication Plan Line"."Line No")
                {
                }
                column(CommunicationType_CommunicationPlanLine;"Communication Plan Line"."Communication Type")
                {
                }
                column(Description_CommunicationPlanLine;"Communication Plan Line".Description)
                {
                }
                column(Frequency_CommunicationPlanLine;"Communication Plan Line".Frequency)
                {
                }
                column(DefaultMeetingMedium_CommunicationPlanLine;"Communication Plan Line"."Default Meeting Medium")
                {
                }
                column(PrimaryOwner_CommunicationPlanLine;"Communication Plan Line"."Primary Owner")
                {
                }
                column(FirstMeetingDate_CommunicationPlanLine;Format("Communication Plan Line"."First Meeting Date"))
                {
                }
                column(NoofTargetStakeholders_CommunicationPlanLine;"Communication Plan Line"."No. of Target Stakeholders")
                {
                }
                column(NoofPlannedMeetings_CommunicationPlanLine;"Communication Plan Line"."No. of Planned Meetings")
                {
                }
                column(NoofMeetingsHeld_CommunicationPlanLine;"Communication Plan Line"."No. of Meetings Held")
                {
                }
                column(DefaultReportMedium_CommunicationPlanLine;"Communication Plan Line"."Default Report Medium")
                {
                }
                column(NoofProjectReports_CommunicationPlanLine;"Communication Plan Line"."No. of Project Reports")
                {
                }
            }
            dataitem("Comm Plan Meeting Schedule";"Comm Plan Meeting Schedule")
            {
                DataItemLink = "Document No"=field("Document No");
                column(ReportForNavId_18; 18)
                {
                }
                column(DocumentType_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule"."Document Type")
                {
                }
                column(DocumentNo_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule"."Document No")
                {
                }
                column(Category_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule".Category)
                {
                }
                column(LineNo_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule"."Line No")
                {
                }
                column(MeetingID_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule"."Meeting ID")
                {
                }
                column(CommunicationType_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule"."Communication Type")
                {
                }
                column(Description_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule".Description)
                {
                }
                column(Frequency_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule".Frequency)
                {
                }
                column(MeetingMedium_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule"."Meeting Medium")
                {
                }
                column(PrimaryOwner_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule"."Primary Owner")
                {
                }
                column(PlannedMeetingDate_CommPlanMeetingSchedule;"Comm Plan Meeting Schedule"."Planned Meeting Date")
                {
                }
            }
            dataitem(Reports;"Communication Plan Line")
            {
                DataItemLink = "Document No"=field("Document No");
                column(ReportForNavId_91; 91)
                {
                }
                column(Category_Reports;Reports.Category)
                {
                }
                column(CommunicationType_Reports;Reports."Communication Type")
                {
                }
                column(Description_Reports;Reports.Description)
                {
                }
                column(Frequency_Reports;Reports.Frequency)
                {
                }
                column(DefaultReportMedium_Reports;Reports."Default Report Medium")
                {
                }
                column(NoofProjectReports_Reports;Reports."No. of Project Reports")
                {
                }
                column(DefaultInitiatorCode_Reports;Reports."Default Initiator Code")
                {
                }
                column(InitiatorDesignation_Reports;Reports."Initiator Designation")
                {
                }
                column(PlannedSubmissionDate_Reports;Reports."Planned Submission Date")
                {
                }
                column(ActualSubmissionDate_Reports;Reports."Actual Submission Date")
                {
                }
                column(SubmissionPeriod_Reports;Reports."Submission Period")
                {
                }
                column(PrimaryOwner_Reports;Reports."Primary Owner")
                {
                }
            }
            dataitem(Correspondences;"Communication Plan Line")
            {
                DataItemLink = "Document No"=field("Document No");
                column(ReportForNavId_94; 94)
                {
                }
                column(CommunicationType_Correspondences;Correspondences."Communication Type")
                {
                }
                column(Description_Correspondences;Correspondences.Description)
                {
                }
                column(Frequency_Correspondences;Correspondences.Frequency)
                {
                }
                column(PrimaryOwner_Correspondences;Correspondences."Primary Owner")
                {
                }
                column(InitiatorDesignation_Correspondences;Correspondences."Initiator Designation")
                {
                }
                column(NoofCorrespondences_Correspondences;Correspondences."No of Correspondences")
                {
                }
            }
            dataitem("Internal Project Resource";"Internal Project Resource")
            {
                DataItemLink = "Project ID"=field("Project ID");
                column(ReportForNavId_30; 30)
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
                column(ReportForNavId_31; 31)
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
                column(EffectiveDate_WEPContractorTeam;"WEP Contractor Team"."Effective Date")
                {
                }
                column(ExpiryDate_WEPContractorTeam;"WEP Contractor Team"."Expiry Date")
                {
                }
            }
            dataitem("Purchase Contract Signatory";"Purchase Contract Signatory")
            {
                DataItemLink = No=field("Project ID");
                column(ReportForNavId_32; 32)
                {
                }
                column(DocumentType_PurchaseContractSignatory;"Purchase Contract Signatory"."Document Type")
                {
                }
                column(No_PurchaseContractSignatory;"Purchase Contract Signatory".No)
                {
                }
                column(EntryNo_PurchaseContractSignatory;"Purchase Contract Signatory"."Entry No")
                {
                }
                column(SignatoryType_PurchaseContractSignatory;"Purchase Contract Signatory"."Signatory Type")
                {
                }
                column(RepresentativeName_PurchaseContractSignatory;"Purchase Contract Signatory"."Representative Name")
                {
                }
                column(ContractSigningRole_PurchaseContractSignatory;"Purchase Contract Signatory"."Contract Signing Role")
                {
                }
                column(Executedonbehalfof_PurchaseContractSignatory;"Purchase Contract Signatory"."Executed on behalf of")
                {
                }
                column(Email_PurchaseContractSignatory;"Purchase Contract Signatory".Email)
                {
                }
                column(ExecutionDate_PurchaseContractSignatory;"Purchase Contract Signatory"."Execution Date")
                {
                }
            }
            dataitem("Comm Plan Line Stakeholder";"Comm Plan Line Stakeholder")
            {
                DataItemLink = "Document No"=field("Document No");
                column(ReportForNavId_87; 87)
                {
                }
                column(Category_CommPlanLineStakeholder;"Comm Plan Line Stakeholder".Category)
                {
                }
                column(StakeholderID_CommPlanLineStakeholder;"Comm Plan Line Stakeholder"."Stakeholder ID")
                {
                }
                column(Description_CommPlanLineStakeholder;"Comm Plan Line Stakeholder".Description)
                {
                }
                column(Name_CommPlanLineStakeholder;"Comm Plan Line Stakeholder".Name)
                {
                }
                column(EmailAddress_CommPlanLineStakeholder;"Comm Plan Line Stakeholder"."Email Address")
                {
                }
            }
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

    trigger OnPreReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    var
        ObjCInfo: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        RegionName: Text[250];
        ApprovalEntries: Record "Approval Entry";
        Approver: array [10] of Code[50];
        ApproverDate: array [10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
}
