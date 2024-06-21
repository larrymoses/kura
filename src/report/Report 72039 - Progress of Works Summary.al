/// <summary>
/// Report Progress of Works Summary (ID 72039).
/// </summary>
report 72039 "Progress of Works Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Progress of Works Summary.rdl';

    dataset
    {
        dataitem("Daily Work Record"; "Daily Work Record")
        {
            column(DocumentNo_DailyWorkRecord; "Daily Work Record"."Document No.")
            {
            }
            column(DocumentDate_DailyWorkRecord; FORMAT("Daily Work Record"."Document Date"))
            {
            }
            column(Document_Date_Day; Document_Date_Day)
            {

            }
            column(WorkExecutionProgrammeID_DailyWorkRecord; "Daily Work Record"."Work Execution Programme ID")
            {
            }
            column(ProjectID_DailyWorkRecord; "Daily Work Record"."Project ID")
            {
            }
            column(Description_DailyWorkRecord; "Daily Work Record".Description)
            {
            }
            column(WorkingStartTime_DailyWorkRecord; FORMAT("Daily Work Record"."Working Start Time"))
            {
            }
            column(WorkingEndTime_DailyWorkRecord; FORMAT("Daily Work Record"."Working End Time"))
            {
            }
            column(WorksStartChainage_DailyWorkRecord; FORMAT("Daily Work Record"."Works Start Chainage"))
            {
            }
            column(WorksEndChainage_DailyWorkRecord; FORMAT("Daily Work Record"."Works End Chainage"))
            {
            }
            column(NoofCasualStaff_DailyWorkRecord; "Daily Work Record"."No. of Casual Staff")
            {
            }
            column(AverageTemperature_DailyWorkRecord; "Daily Work Record"."Average Temperature")
            {
            }
            column(Rainfallmm_DailyWorkRecord; "Daily Work Record"."Rainfall (mm)")
            {
            }
            column(OtherWeatherCondition_DailyWorkRecord; "Daily Work Record"."Other Weather Condition")
            {
            }
            column(PurchaseContractID_DailyWorkRecord; "Daily Work Record"."Purchase Contract ID")
            {
            }
            column(ContractorNo_DailyWorkRecord; "Daily Work Record"."Contractor No.")
            {
            }
            column(ContractorName_DailyWorkRecord; "Daily Work Record"."Contractor Name")
            {
            }
            column(RegionID_DailyWorkRecord; "Daily Work Record"."Region ID")
            {
            }
            column(DirectorateID_DailyWorkRecord; "Daily Work Record"."Directorate ID")
            {
            }
            column(DepartmentID_DailyWorkRecord; "Daily Work Record"."Department ID")
            {
            }
            column(Status_DailyWorkRecord; "Daily Work Record".Status)
            {
            }
            column(CreatedBy_DailyWorkRecord; "Daily Work Record"."Created By")
            {
            }
            column(CreatedDateTime_DailyWorkRecord; "Daily Work Record"."Created Date/Time")
            {
            }
            column(Posted_DailyWorkRecord; "Daily Work Record".Posted)
            {
            }
            column(NoSeries_DailyWorkRecord; "Daily Work Record"."No. Series")
            {
            }
            column(DimensionSetID_DailyWorkRecord; "Daily Work Record"."Dimension Set ID")
            {
            }
            column(ShortcutDimension1Code_DailyWorkRecord; "Daily Work Record"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_DailyWorkRecord; "Daily Work Record"."Shortcut Dimension 2 Code")
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(CompanyInformation_Address; CompanyInformation.Address)
            {
            }
            column(CompanyInformation_Address2; CompanyInformation."Address 2")
            {
            }
            column(CompanyInformation_City; CompanyInformation.City)
            {
            }
            column(CompanyInformation_Picture; CompanyInformation.Picture)
            {
            }
            column(CompanyInformation_PostCode; CompanyInformation."Post Code")
            {
            }
            column(CompanyInformation_Motto; CompanyInformation.Motto)
            {
            }
            column(RegionName; RegionName)
            {
            }
            column(DirectorateName; DirectorateName)
            {
            }
            column(DepartmentName; DepartmentName)
            {
            }
            column(ProjectName; ProjectName)
            {
            }
            column(PreparedBy; UserSetup."Employee Name")
            {
            }
            column(DatePrepared; ApproverDate[1])
            {
            }
            column(PreparedBy_Signature; UserSetup.Picture)
            {
            }
            column(ExaminedBy; UserSetup1."Employee Name")
            {
            }
            column(DateApproved; FORMAT(ApproverDate[2]))
            {
            }
            column(ExaminedBy_Signature; UserSetup1.Picture)
            {
            }
            column(VBC; UserSetup2."Employee Name")
            {
            }
            column(VBCDate; ApproverDate[3])
            {
            }
            column(VBC_Signature; UserSetup2.Picture)
            {
            }
            column(Authorizer; UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized; ApproverDate[4])
            {
            }
            column(Authorizer_Signature; UserSetup3.Picture)
            {
            }
            dataitem("Daily Work Record Execution"; "Daily Work Record Execution")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(DocumentNo_DailyWorkRecordExecution; "Daily Work Record Execution"."Document No.")
                {
                }
                column(RecordNo_DailyWorkRecordExecution; "Daily Work Record Execution"."Record No.")
                {
                }
                column(JobNo_DailyWorkRecordExecution; "Daily Work Record Execution"."Job No.")
                {
                }
                column(JobTaskNo_DailyWorkRecordExecution; "Daily Work Record Execution"."Job Task No.")
                {
                }
                column(LineNo_DailyWorkRecordExecution; "Daily Work Record Execution"."Line No.")
                {
                }
                column(Type_DailyWorkRecordExecution; "Daily Work Record Execution".Type)
                {
                }
                column(No_DailyWorkRecordExecution; "Daily Work Record Execution"."No.")
                {
                }
                column(Description_DailyWorkRecordExecution; "Daily Work Record Execution".Description)
                {
                }
                column(UnitofMeasureCode_DailyWorkRecordExecution; "Daily Work Record Execution"."Unit of Measure Code")
                {
                }
                column(BillItemCategoryCode_DailyWorkRecordExecution; "Daily Work Record Execution"."Bill Item Category Code")
                {
                }
                column(ContractQuantity_DailyWorkRecordExecution; "Daily Work Record Execution"."Contract Quantity")
                {
                }
                column(QuantityDone_DailyWorkRecordExecution; "Daily Work Record Execution"."Quantity Done")
                {
                }
                column(WorksStartChainage_DailyWorkRecordExecution; FORMAT("Daily Work Record Execution"."Works Start Chainage"))
                {
                }
                column(WorksEndChainage_DailyWorkRecordExecution; FORMAT("Daily Work Record Execution"."Works End Chainage"))
                {
                }
                column(AdditionalCommentsNotes_DailyWorkRecordExecution; "Daily Work Record Execution"."Additional Comments/Notes")
                {
                }
                column(PhotoNo_DailyWorkRecordExecution; "Daily Work Record Execution"."Photo No.")
                {
                }
                column(DimensionSetID_DailyWorkRecordExecution; "Daily Work Record Execution"."Dimension Set ID")
                {
                }
                column(ShortcutDimension1Code_DailyWorkRecordExecution; "Daily Work Record Execution"."Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_DailyWorkRecordExecution; "Daily Work Record Execution"."Shortcut Dimension 2 Code")
                {
                }
                column(DocumentDate_DailyWorkRecordExecution; "Daily Work Record Execution"."Document Date")
                {
                }
                column(ProjectRoadLinkCode_DailyWorkRecordExecution; "Daily Work Record Execution"."Road Side")
                {
                }
            }
            dataitem("Materials Delivered To Site"; "Daily Work Record Material")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                DataItemTableView = WHERE("Movement Type" = FILTER("Delivered To Site"));
                column(DocumentNo_MaterialsDeliveredToSite; "Materials Delivered To Site"."Document No.")
                {
                }
                column(MovementType_MaterialsDeliveredToSite; "Materials Delivered To Site"."Movement Type")
                {
                }
                column(MaterialID_MaterialsDeliveredToSite; "Materials Delivered To Site"."Material ID")
                {
                }
                column(Description_MaterialsDeliveredToSite; "Materials Delivered To Site".Description)
                {
                }
                column(BaseUnitofMeasure_MaterialsDeliveredToSite; "Materials Delivered To Site"."Base Unit of Measure")
                {
                }
                column(Quantity_MaterialsDeliveredToSite; "Materials Delivered To Site".Quantity)
                {
                }
                column(PhotoNo_MaterialsDeliveredToSite; "Materials Delivered To Site"."Photo No.")
                {
                }
                column(MaterialTestRecordID_MaterialsDeliveredToSite; "Materials Delivered To Site"."Material Test Record ID")
                {
                }
                column(JobNo_MaterialsDeliveredToSite; "Materials Delivered To Site"."Job No.")
                {
                }
                column(DocumentDate_MaterialsDeliveredToSite; "Materials Delivered To Site"."Document Date")
                {
                }
            }
            dataitem("Materials Removed From Site"; "Daily Work Record Material")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                DataItemTableView = WHERE("Movement Type" = FILTER("Removed From Site"));
                column(DocumentNo_MaterialsRemovedFromSite; "Materials Removed From Site"."Document No.")
                {
                }
                column(MovementType_MaterialsRemovedFromSite; "Materials Removed From Site"."Movement Type")
                {
                }
                column(MaterialID_MaterialsRemovedFromSite; "Materials Removed From Site"."Material ID")
                {
                }
                column(Description_MaterialsRemovedFromSite; "Materials Removed From Site".Description)
                {
                }
                column(BaseUnitofMeasure_MaterialsRemovedFromSite; "Materials Removed From Site"."Base Unit of Measure")
                {
                }
                column(Quantity_MaterialsRemovedFromSite; "Materials Removed From Site".Quantity)
                {
                }
                column(PhotoNo_MaterialsRemovedFromSite; "Materials Removed From Site"."Photo No.")
                {
                }
                column(MaterialTestRecordID_MaterialsRemovedFromSite; "Materials Removed From Site"."Material Test Record ID")
                {
                }
                column(JobNo_MaterialsRemovedFromSite; "Materials Removed From Site"."Job No.")
                {
                }
                column(DocumentDate_MaterialsRemovedFromSite; "Materials Removed From Site"."Document Date")
                {
                }
            }
            dataitem("Daily Work Record Equipment"; "Daily Work Record Equipment")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(DocumentNo_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Document No.")
                {
                }
                column(LineNo_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Line No.")
                {
                }
                column(EquipmentNo_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Equipment No.")
                {
                }
                column(EquipmentTypeCode_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Equipment Type Code")
                {
                }
                column(Description_DailyWorkRecordEquipment; "Daily Work Record Equipment".Description)
                {
                }
                column(SerialRegistrationNo_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Serial/Registration No.")
                {
                }
                column(PhotoNo_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Photo No.")
                {
                }
                column(EquipmentUtilization_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Equipment Utilization")
                {
                }
                column(Remarks_DailyWorkRecordEquipment; "Daily Work Record Equipment".Remarks)
                {
                }
                column(WorkExecutionProgrammeID_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Work Execution Programme ID")
                {
                }
                column(JobNo_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Job No.")
                {
                }
                column(EquipmentUsageHours_DailyWorkRecordEquipment; "Daily Work Record Equipment"."Equipment Usage Hours")
                {
                }
            }
            dataitem("Daily Work Record Key Team"; "Daily Work Record Key Team")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(DocumentType_DailyWorkRecordKeyTeam; "Daily Work Record Key Team"."Document Type")
                {
                }
                column(DocumentNo_DailyWorkRecordKeyTeam; "Daily Work Record Key Team"."Document No.")
                {
                }
                column(LineNo_DailyWorkRecordKeyTeam; "Daily Work Record Key Team"."Line No.")
                {
                }
                column(ContractorStaffNo_DailyWorkRecordKeyTeam; "Daily Work Record Key Team"."Contractor Staff No.")
                {
                }
                column(Name_DailyWorkRecordKeyTeam; "Daily Work Record Key Team".Name)
                {
                }
                column(RoleCode_DailyWorkRecordKeyTeam; "Daily Work Record Key Team"."Role Code")
                {
                }
                column(Designation_DailyWorkRecordKeyTeam; "Daily Work Record Key Team".Designation)
                {
                }
                column(StaffCategory_DailyWorkRecordKeyTeam; "Daily Work Record Key Team"."Staff Category")
                {
                }
                column(WorkExecutionProgrammeID_DailyWorkRecordKeyTeam; "Daily Work Record Key Team"."Work Execution Programme ID")
                {
                }
                column(JobNo_DailyWorkRecordKeyTeam; "Daily Work Record Key Team"."Job No.")
                {
                }
            }
            dataitem("Daily Work Record Visitor"; "Daily Work Record Visitor")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(DocumentNo_DailyWorkRecordVisitor; "Daily Work Record Visitor"."Document No.")
                {
                }
                column(LineNo_DailyWorkRecordVisitor; "Daily Work Record Visitor"."Line No.")
                {
                }
                column(VisitorName_DailyWorkRecordVisitor; "Daily Work Record Visitor"."Visitor Name")
                {
                }
                column(Organization_DailyWorkRecordVisitor; "Daily Work Record Visitor".Organization)
                {
                }
                column(TimeIn_DailyWorkRecordVisitor; FORMAT("Daily Work Record Visitor"."Time In"))
                {
                }
                column(TimeOut_DailyWorkRecordVisitor; FORMAT("Daily Work Record Visitor"."Time Out"))
                {
                }
                column(PurposeofVisit_DailyWorkRecordVisitor; "Daily Work Record Visitor"."Purpose of Visit")
                {
                }
                column(TelephoneNo_DailyWorkRecordVisitor; "Daily Work Record Visitor"."Telephone No.")
                {
                }
                column(IDPassportNo_DailyWorkRecordVisitor; "Daily Work Record Visitor"."ID/Passport No.")
                {
                }
                column(SiteInductionDone; SiteInductionDone)
                {
                }
                column(SiteInductionDone_DailyWorkRecordVisitor; "Daily Work Record Visitor"."Site Induction Done")
                {
                }
                column(Remarks_DailyWorkRecordVisitor; "Daily Work Record Visitor".Remarks)
                {
                }
                column(VisitorEmail_DailyWorkRecordVisitor; "Daily Work Record Visitor"."Visitor Email")
                {
                }
                column(DocumentDate_DailyWorkRecordVisitor; "Daily Work Record Visitor"."Document Date")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    IF "Daily Work Record Visitor"."Site Induction Done" = TRUE THEN
                        SiteInductionDone := SiteInductionDone::Done
                    ELSE
                        SiteInductionDone := SiteInductionDone::"Not Done";
                end;
            }
            dataitem("Daily Work Record Incident"; "Daily Work Record Incident")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(DocumentNo_DailyWorkRecordIncident; "Daily Work Record Incident"."Document No.")
                {
                }
                column(LineNo_DailyWorkRecordIncident; "Daily Work Record Incident"."Line No.")
                {
                }
                column(IncidentDescription_DailyWorkRecordIncident; "Daily Work Record Incident"."Incident Description")
                {
                }
                column(SeverityLevel_DailyWorkRecordIncident; "Daily Work Record Incident"."Severity Level")
                {
                }
                column(OccurrenceType_DailyWorkRecordIncident; "Daily Work Record Incident"."Occurrence Type")
                {
                }
                column(IncidentDate_DailyWorkRecordIncident; FORMAT("Daily Work Record Incident"."Incident Date"))
                {
                }
                column(IncidentStartTime_DailyWorkRecordIncident; FORMAT("Daily Work Record Incident"."Incident Start Time"))
                {
                }
                column(IncidentEndTime_DailyWorkRecordIncident; FORMAT("Daily Work Record Incident"."Incident End Time"))
                {
                }
                column(IncidentLocationDetails_DailyWorkRecordIncident; FORMAT("Daily Work Record Incident"."Incident Location Details"))
                {
                }
                column(PrimaryTriggerID_DailyWorkRecordIncident; "Daily Work Record Incident"."Primary Trigger ID")
                {
                }
                column(RootCauseSummary_DailyWorkRecordIncident; "Daily Work Record Incident"."Root Cause Summary")
                {
                }
                column(CategoryofPersonReporting_DailyWorkRecordIncident; "Daily Work Record Incident"."Category of Person Reporting")
                {
                }
                column(ReportedByName_DailyWorkRecordIncident; "Daily Work Record Incident"."Reported By (Name)")
                {
                }
                column(IncidentClass_DailyWorkRecordIncident; "Daily Work Record Incident"."Incident Class")
                {
                }
                column(JobNo_DailyWorkRecordIncident; "Daily Work Record Incident"."Job No.")
                {
                }
                column(RiskManagementPlanID_DailyWorkRecordIncident; "Daily Work Record Incident"."Risk Management Plan ID")
                {
                }
                column(RiskID_DailyWorkRecordIncident; "Daily Work Record Incident"."Risk ID")
                {
                }
                column(RiskIncidentCategory_DailyWorkRecordIncident; "Daily Work Record Incident"."Risk Incident Category")
                {
                }
                column(HSEPlanID_DailyWorkRecordIncident; "Daily Work Record Incident"."HSE Plan ID")
                {
                }
                column(HazardID_DailyWorkRecordIncident; "Daily Work Record Incident"."Hazard ID")
                {
                }
                column(ActualFinancialImpactLCY_DailyWorkRecordIncident; "Daily Work Record Incident"."Actual Financial Impact (LCY)")
                {
                }
                column(ActualDelayDisruptionDays_DailyWorkRecordIncident; "Daily Work Record Incident"."Actual Delay Disruption (Days)")
                {
                }
                column(ActualNoInjuredPersons_DailyWorkRecordIncident; "Daily Work Record Incident"."Actual No. Injured Persons")
                {
                }
                column(ActualNoofFatalities_DailyWorkRecordIncident; "Daily Work Record Incident"."Actual No. of Fatalities")
                {
                }
                column(PoliceReportReferenceNo_DailyWorkRecordIncident; "Daily Work Record Incident"."Police Report Reference No.")
                {
                }
                column(PoliceReportDate_DailyWorkRecordIncident; "Daily Work Record Incident"."Police Report Date")
                {
                }
                column(PoliceStation_DailyWorkRecordIncident; "Daily Work Record Incident"."Police Station")
                {
                }
                column(ReportingOfficer_DailyWorkRecordIncident; "Daily Work Record Incident"."Reporting Officer")
                {
                }
            }
            dataitem("Daily Work Record Meeting"; "Daily Work Record Meeting")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(DocumentNo_DailyWorkRecordMeeting; "Daily Work Record Meeting"."Document No.")
                {
                }
                column(LineNo_DailyWorkRecordMeeting; "Daily Work Record Meeting"."Line No.")
                {
                }
                column(MeetingType_DailyWorkRecordMeeting; "Daily Work Record Meeting"."Meeting Type")
                {
                }
                column(ProjectID_DailyWorkRecordMeeting; "Daily Work Record Meeting"."Project ID")
                {
                }
                column(Description_DailyWorkRecordMeeting; "Daily Work Record Meeting".Description)
                {
                }
                column(ProjectName_DailyWorkRecordMeeting; "Daily Work Record Meeting"."Project Name")
                {
                }
                column(MeetingOrganizerID_DailyWorkRecordMeeting; "Daily Work Record Meeting"."Meeting Organizer ID")
                {
                }
                column(AllDayEvent_DailyWorkRecordMeeting; "Daily Work Record Meeting"."All Day Event")
                {
                }
                column(StartDate_DailyWorkRecordMeeting; FORMAT("Daily Work Record Meeting"."Start Date"))
                {
                }
                column(StartTime_DailyWorkRecordMeeting; FORMAT("Daily Work Record Meeting"."Start Time"))
                {
                }
                column(EndDate_DailyWorkRecordMeeting; FORMAT("Daily Work Record Meeting"."End Date"))
                {
                }
                column(EndTime_DailyWorkRecordMeeting; FORMAT("Daily Work Record Meeting"."End Time"))
                {
                }
                column(VenueLocation_DailyWorkRecordMeeting; FORMAT("Daily Work Record Meeting"."Venue/Location"))
                {
                }
                column(MeetingStatus_DailyWorkRecordMeeting; "Daily Work Record Meeting"."Meeting Status")
                {
                }
            }
            dataitem("Daily Work Record Labor"; "Daily Work Record Labor")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                column(DocumentNo_DailyWorkRecordLabor; "Daily Work Record Labor"."Document No.")
                {
                }
                column(LineNo_DailyWorkRecordLabor; "Daily Work Record Labor"."Line No.")
                {
                }
                column(LabourType_DailyWorkRecordLabor; "Daily Work Record Labor".Gender)
                {
                }
                column(Description_DailyWorkRecordLabor; "Daily Work Record Labor".Description)
                {
                }
                column(TotalNoofStaff_DailyWorkRecordLabor; "Daily Work Record Labor"."Total No. of Staff")
                {
                }
                column(AverageManHoursWorked_DailyWorkRecordLabor; "Daily Work Record Labor"."Average ManHours Worked")
                {
                }
                column(EstimateTotalWagesPaid_DailyWorkRecordLabor; "Daily Work Record Labor"."Estimate Total Wages Paid")
                {
                }
                column(DocumentDate_DailyWorkRecordLabor; "Daily Work Record Labor"."Document Date")
                {
                }
            }
            dataitem("Material Test Record"; "Material Test Record")
            {
                DataItemLink = "Testing Date" = FIELD("Document Date"),
                               "Project ID" = FIELD("Project ID");
                column(Code_MaterialTestRecord; "Material Test Record".Code)
                {
                }
                column(MaterialDeliveryDate_MaterialTestRecord; "Material Test Record"."Material Delivery Date")
                {
                }
                column(ProjectID_MaterialTestRecord; "Material Test Record"."Project ID")
                {
                }
                column(MaterialID_MaterialTestRecord; "Material Test Record"."Material ID")
                {
                }
                column(Description_MaterialTestRecord; "Material Test Record".Description)
                {
                }
                column(MaterialTestTemplateID_MaterialTestRecord; "Material Test Record"."Material Test Template ID")
                {
                }
                column(BaseUnitofMeasure_MaterialTestRecord; "Material Test Record"."Base Unit of Measure")
                {
                }
                column(TestLeadNo_MaterialTestRecord; "Material Test Record"."Test Lead No.")
                {
                }
                column(SiteDescription_MaterialTestRecord; "Material Test Record"."Site Description")
                {
                }
                column(JobTaskNo_MaterialTestRecord; "Material Test Record"."Job Task No.")
                {
                }
                column(FinalTestResult_MaterialTestRecord; "Material Test Record"."Final Test Result")
                {
                }
                column(PurchaseContractID_MaterialTestRecord; "Material Test Record"."Purchase Contract ID")
                {
                }
                column(ContractorNo_MaterialTestRecord; "Material Test Record"."Contractor No.")
                {
                }
                column(ContractorName_MaterialTestRecord; "Material Test Record"."Contractor Name")
                {
                }
                column(RoadCode_MaterialTestRecord; "Material Test Record"."Road Code")
                {
                }
                column(RoadSectionNo_MaterialTestRecord; "Material Test Record"."Road Section No.")
                {
                }
                column(RegionID_MaterialTestRecord; "Material Test Record"."Region ID")
                {
                }
                column(DirectorateID_MaterialTestRecord; "Material Test Record"."Directorate ID")
                {
                }
                column(DepartmentID_MaterialTestRecord; "Material Test Record"."Department ID")
                {
                }
                column(Status_MaterialTestRecord; "Material Test Record".Status)
                {
                }
                column(CreatedBy_MaterialTestRecord; "Material Test Record"."Created By")
                {
                }
                column(CreatedDateTime_MaterialTestRecord; "Material Test Record"."Created Date/Time")
                {
                }
                column(Posted_MaterialTestRecord; "Material Test Record".Posted)
                {
                }
                column(Quantity_MaterialTestRecord; "Material Test Record".Quantity)
                {
                }
                column(NoSeries_MaterialTestRecord; "Material Test Record"."No. Series")
                {
                }
                column(TestingDate_MaterialTestRecord; FORMAT("Material Test Record"."Testing Date"))
                {
                }
                column(DriverName_MaterialTestRecord; "Material Test Record"."Driver Name")
                {
                }
                column(VehicleNo_MaterialTestRecord; "Material Test Record"."Vehicle No.")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Daily Work Record"."Region ID");
                IF ResponsibilityCenter.FINDSET THEN
                    RegionName := ResponsibilityCenter.Name;

                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Daily Work Record"."Directorate ID");
                IF ResponsibilityCenter.FINDSET THEN
                    DirectorateName := ResponsibilityCenter.Name;

                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Daily Work Record"."Department ID");
                IF ResponsibilityCenter.FINDSET THEN
                    DepartmentName := ResponsibilityCenter.Name;

                Job.RESET;
                Job.SETRANGE(Job."No.", "Daily Work Record"."Project ID");
                IF Job.FINDSET THEN
                    ProjectName := Job.Description;
                if DateforWeek.get(DateforWeek."Period Type"::Date, "Document Date") then
                    Document_Date_Day := DateforWeek."Period Name";
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
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        ResponsibilityCenter: Record "Responsibility Center";
        RegionName: Text[250];
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        SiteInductionDone: Option " ",Done,"Not Done";
        DirectorateName: Text[100];
        DepartmentName: Text[100];
        ProjectName: Text[250];
        Job: Record Job;
        Document_Date_Day: Text;
        DateforWeek: Record Date;
}

