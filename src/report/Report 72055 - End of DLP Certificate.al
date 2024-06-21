report 72055 "End of DLP Certificate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './End of DLP Certificate.rdl';

    dataset
    {
        dataitem("Inspection Headersss"; "Inspection Headersss")
        {
            //The property 'DataItemTableView' shouldn't have an empty value.
            //DataItemTableView = '';
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
            column(CIName; CompanyInformation.Name)
            {
            }
            column(CIAddress; CompanyInformation.Address)
            {
            }
            column(CIAddress2; CompanyInformation."Address 2")
            {
            }
            column(CICity; CompanyInformation.City)
            {
            }
            column(CIPicture; CompanyInformation.Picture)
            {
            }
            column(DirectorateName; DirectorateName)
            {
            }
            column(DepartmentName; DepartmentName)
            {
            }
            column(InspectionNo_InspectionHeadersss; "Inspection Headersss"."Inspection No")
            {
            }
            column(InspectionType_InspectionHeadersss; "Inspection Headersss"."Inspection Type")
            {
            }
            column(ProjectID_InspectionHeadersss; "Inspection Headersss"."Project ID")
            {
            }
            column(ContractID_InspectionHeadersss; "Inspection Headersss"."Contract ID")
            {
            }
            column(InspectionDate_InspectionHeadersss; FORMAT("Inspection Headersss"."Inspection Date"))
            {
            }
            column(ContractorNo_InspectionHeadersss; "Inspection Headersss"."Contractor No")
            {
            }
            column(ContractorName_InspectionHeadersss; "Inspection Headersss"."Contractor Name")
            {
            }
            column(ProjectStartDate_InspectionHeadersss; FORMAT("Inspection Headersss"."Project Start Date"))
            {
            }
            column(ProjectEndDate_InspectionHeadersss; FORMAT("Inspection Headersss"."Project End Date"))
            {
            }
            column(DLPStartDate_InspectionHeadersss; FORMAT("Inspection Headersss"."DLP Start Date"))
            {
            }
            column(DLPPeriod_InspectionHeadersss; "Inspection Headersss"."DLP Period")
            {
            }
            column(DLPEndDate_InspectionHeadersss; FORMAT("Inspection Headersss"."DLP End Date"))
            {
            }
            column(AwardedTenderSumIncTax_InspectionHeadersss; "Inspection Headersss"."Awarded Tender Sum Inc Tax")
            {
            }
            column(PaymentsToDate_InspectionHeadersss; "Inspection Headersss"."Payments To Date")
            {
            }
            column(Status_InspectionHeadersss; "Inspection Headersss".Status)
            {
            }
            column(CommitteeDecision_InspectionHeadersss; "Inspection Headersss"."Committee Decision")
            {
            }
            column(PrimaryContractorRep_InspectionHeadersss; "Inspection Headersss"."Primary Contractor Rep.")
            {
            }
            column(ContractorRepresentativeRole_InspectionHeadersss; "Inspection Headersss"."Contractor Representative Role")
            {
            }
            column(ContractorRepEmail_InspectionHeadersss; "Inspection Headersss"."Contractor Rep. Email")
            {
            }
            column(WorkExecutionPlan1D_InspectionHeadersss; "Inspection Headersss"."Work Execution Plan 1D")
            {
            }
            column(CommencementOrderNo_InspectionHeadersss; "Inspection Headersss"."Commencement Order No")
            {
            }
            column(ProjectName_InspectionHeadersss; "Inspection Headersss"."Project Name")
            {
            }
            column(ProjectManagerEngineer_InspectionHeadersss; "Inspection Headersss"."Project Manager/Engineer")
            {
            }
            column(RegionID_InspectionHeadersss; "Inspection Headersss"."Region ID")
            {
            }
            column(DirectorateID_InspectionHeadersss; "Inspection Headersss"."Directorate ID")
            {
            }
            column(DepartmentID_InspectionHeadersss; "Inspection Headersss"."Department ID")
            {
            }
            column(VendorAddress; VendorAddress)
            {

            }
            column(VendorAddress2; VendorAddress2)
            {

            }
            dataitem("Taking Over Section"; "Taking Over Section")
            {
                DataItemLink = "Inspection No" = FIELD("Inspection No"),
                               "Document Type" = FIELD("Inspection Type");
                column(InspectionNo_TakingOverSection; "Taking Over Section"."Inspection No")
                {
                }
                column(InspectionType_TakingOverSection; "Taking Over Section"."Document Type")
                {
                }
                column(LineNo_TakingOverSection; "Taking Over Section"."Line No")
                {
                }
                column(TakingOverStartChainage_TakingOverSection; "Taking Over Section"."Taking Over Start Chainage")
                {
                }
                column(TakingOverEndChainage_TakingOverSection; "Taking Over Section"."Taking Over End Chainage")
                {
                }
                column(Comments_TakingOverSection; "Taking Over Section".Comments)
                {
                }
                column(ProjectID_TakingOverSection; "Taking Over Section"."Project ID")
                {
                }
                column(ContractID_TakingOverSection; "Taking Over Section"."Contract ID")
                {
                }
                column(RoadCode_TakingOverSection; "Taking Over Section"."Road Code")
                {
                }
                column(RoadSectionNo_TakingOverSection; "Taking Over Section"."Road Section No")
                {
                }
                column(LinkName_TakingOverSection; "Taking Over Section"."Link Name")
                {
                }
                column(SectionName_TakingOverSection; "Taking Over Section"."Section Name")
                {
                }
                column(StartChainage_TakingOverSection; "Taking Over Section"."Start Chainage")
                {
                }
                column(EndChainage_TakingOverSection; "Taking Over Section"."End Chainage")
                {
                }
                column(WorkplannnedLength_TakingOverSection; "Taking Over Section"."Workplannned Length")
                {
                }
                column(TakingOverLength_TakingOverSection; "Taking Over Section"."Taking Over Length")
                {
                }
            }
            dataitem("Taking Over Section Line"; "Taking Over Section Line")
            {
                DataItemLink = "Document No" = FIELD("Inspection No");
                column(InspectionNo_TakingOverSectionLine; "Taking Over Section Line"."Document No")
                {
                }
                column(InspectionType_TakingOverSectionLine; "Taking Over Section Line"."Document Type")
                {
                }
                column(LineNo_TakingOverSectionLine; "Taking Over Section Line"."Line No")
                {
                }
                column(TakingOverStartChainage_TakingOverSectionLine; "Taking Over Section Line"."Taking Over Start Chainage")
                {
                }
                column(TakingOverEndChainage_TakingOverSectionLine; "Taking Over Section Line"."Taking Over End Chainage")
                {
                }
                column(Comments_TakingOverSectionLine; "Taking Over Section Line".Comments)
                {
                }
                column(ProjectID_TakingOverSectionLine; "Taking Over Section Line"."Project ID")
                {
                }
                column(ContractID_TakingOverSectionLine; "Taking Over Section Line"."Contract ID")
                {
                }
                column(RoadCode_TakingOverSectionLine; "Taking Over Section Line"."Road Code")
                {
                }
                column(RoadSectionNo_TakingOverSectionLine; "Taking Over Section Line"."Road Section No")
                {
                }
                column(LinkName_TakingOverSectionLine; "Taking Over Section Line"."Link Name")
                {
                }
                column(SectionName_TakingOverSectionLine; "Taking Over Section Line"."Section Name")
                {
                }
                column(StartChainage_TakingOverSectionLine; "Taking Over Section Line"."Start Chainage")
                {
                }
                column(EndChainage_TakingOverSectionLine; "Taking Over Section Line"."End Chainage")
                {
                }
                column(WorkplannnedLength_TakingOverSectionLine; "Taking Over Section Line"."Workplannned Length")
                {
                }
                column(TakingOverLength_TakingOverSectionLine; "Taking Over Section Line"."Taking Over Length")
                {
                }
                column(EntryNo_TakingOverSectionLine; "Taking Over Section Line"."Entry No.")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Inspection Headersss"."Directorate ID");
                IF ResponsibilityCenter.FINDSET THEN BEGIN
                    DirectorateName := ResponsibilityCenter.Name;
                END;
                ResponsibilityCenter.RESET;
                ResponsibilityCenter.SETRANGE(ResponsibilityCenter.Code, "Inspection Headersss"."Department ID");
                IF ResponsibilityCenter.FINDSET THEN BEGIN
                    DepartmentName := ResponsibilityCenter.Name;
                END;
                ObjJob.RESET;
                ObjJob.SETRANGE(ObjJob."No.", "Inspection Headersss"."Project ID");
                IF ObjJob.FindFirst() THEN BEGIN
                    Vendor.Reset();
                    Vendor.SetRange("No.", ObjJob."Contractor No.");
                    if Vendor.FindFirst() then begin
                        VendorAddress := Vendor.Address;
                        VendorAddress2 := Vendor."Address 2";
                    end;
                END;
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
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        Vendor: Record Vendor;
        PurchaseHeader: Record "Purchase Header";
        ResponsibilityCenter: Record "Responsibility Center";
        DirectorateName: Text[250];
        DepartmentName: Text[250];
        ObjJob: Record Job;
        VendorAddress: Text;
        VendorAddress2: Text;
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
}
