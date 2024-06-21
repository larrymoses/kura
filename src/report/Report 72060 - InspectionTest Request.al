report 72060 "Inspection/Test Request"
{
    DefaultLayout = RDLC;
    RDLCLayout = './InspectionTest Request.rdl';

    dataset
    {
        dataitem("Contractor Inspection Request"; "Contractor Inspection Request")
        {
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
            column(CName; CompanyInformation.Name)
            {
            }
            column(CAddress; CompanyInformation.Address)
            {
            }
            column(CAddree2; CompanyInformation."Address 2")
            {
            }
            column(CCity; CompanyInformation.City)
            {
            }
            column(CPhoneNo; CompanyInformation."Phone No.")
            {
            }
            column(CEmail; CompanyInformation."E-Mail")
            {
            }
            column(CWebsite; CompanyInformation."Home Page")
            {
            }
            column(CPic; CompanyInformation.Picture)
            {
            }
            column(CMotto; CompanyInformation.Motto)
            {
            }
            column(DocumentNo_ContractorInspectionRequest; "Contractor Inspection Request"."Document No.")
            {
            }
            column(DocumentDate_ContractorInspectionRequest; "Contractor Inspection Request"."Document Date")
            {
            }
            column(RequiresLabTest_ContractorInspectionRequest; "Contractor Inspection Request"."Requires Lab Test")
            {
            }
            column(ProjectID_ContractorInspectionRequest; "Contractor Inspection Request"."Project ID")
            {
            }
            column(ProjectName_ContractorInspectionRequest; "Contractor Inspection Request"."Project Name")
            {
            }
            column(PurchaseContractID_ContractorInspectionRequest; "Contractor Inspection Request"."Purchase Contract ID")
            {
            }
            column(ContractName_ContractorInspectionRequest; "Contractor Inspection Request"."Contract Name")
            {
            }
            column(ContractorNo_ContractorInspectionRequest; "Contractor Inspection Request"."Contractor No.")
            {
            }
            column(ContractorName_ContractorInspectionRequest; "Contractor Inspection Request"."Contractor Name")
            {
            }
            column(ResidentEngineerID_ContractorInspectionRequest; "Contractor Inspection Request"."Resident Engineer ID")
            {
            }
            column(ResidnetEngineerName_ContractorInspectionRequest; "Contractor Inspection Request"."Resident Engineer Name")
            {
            }
            column(SiteAgentNo_ContractorInspectionRequest; "Contractor Inspection Request"."Site Agent No.")
            {
            }
            column(SiteAgentName_ContractorInspectionRequest; "Contractor Inspection Request"."Site Agent Name")
            {
            }
            column(LabRemarks_ContractorInspectionRequest; "Contractor Inspection Request"."Lab Remarks")
            {
            }
            column(RERemarks_ContractorInspectionRequest; "Contractor Inspection Request"."RE Remarks")
            {
            }
            column(SurveyRemarks_ContractorInspectionRequest; "Contractor Inspection Request"."Survey Remarks")
            {
            }
            column(LabRemarksDateTimeEntered_ContractorInspectionRequest; "Contractor Inspection Request"."Lab Remarks DateTime Entered")
            {
            }
            column(RERemarksDatetimeEntered_ContractorInspectionRequest; "Contractor Inspection Request"."RE Remarks Datetime Entered")
            {
            }
            column(SurveyRemarksDateTimeEnter_ContractorInspectionRequest; "Contractor Inspection Request"."Survey Remarks Date Time Enter")
            {
            }
            column(RERemarksBy_ContractorInspectionRequest; "Contractor Inspection Request"."RE Remarks By")
            {
            }
            column(InspectorateRemarks_ContractorInspectionRequest; "Contractor Inspection Request"."Inspectorate Remarks")
            {
            }
            column(InspectedDateTime_ContractorInspectionRequest; "Contractor Inspection Request"."Inspected Date Time")
            {
            }
            column(Inspected_ContractorInspectionRequest; "Contractor Inspection Request".Inspected)
            {
            }
            column(Tested_ContractorInspectionRequest; "Contractor Inspection Request".Tested)
            {
            }
            column(Measured_ContractorInspectionRequest; "Contractor Inspection Request".Measured)
            {
            }
            column(Approved_ContractorInspectionRequest; "Contractor Inspection Request".Approved)
            {
            }
            column(InspectedButNotApproved_ContractorInspectionRequest; "Contractor Inspection Request"."Inspected But Not Approved")
            {
            }
            column(RequiresSurvey_ContractorInspectionRequest; "Contractor Inspection Request"."Requires Survey")
            {
            }
            column(SubmissionDate_ContractorInspectionRequest; "Contractor Inspection Request"."Submission Date")
            {
            }
            column(ARERemarks_ContractorInspectionRequest; "Contractor Inspection Request"."ARE Remarks")
            {
            }
            column(ARERemarksDateTime_ContractorInspectionRequest; "Contractor Inspection Request"."ARE Remarks Date Time")
            {
            }
            column(ARERemarksBy_ContractorInspectionRequest; "Contractor Inspection Request"."ARE Remarks By")
            {
            }
            column(InspectedR; InspectedR)
            {
            }
            column(TestedR; TestedR)
            {
            }
            column(MeasuredR; MeasuredR)
            {
            }
            column(ApprovedR; ApprovedR)
            {
            }
            column(InspectedButNotApprovedR; InspectedButNotApprovedR)
            {
            }
            column(SurveyName; SurveyName)
            {
            }
            column(LabName; LabName)
            {
            }
            column(InspectorateName; InspectorateName)
            {
            }
            column(AREName; AREName)
            {
            }
            column(Road_Code;"Road Code")
            {

            }
            column(Road_Name;"Road Name")
            {

            }
            dataitem("Test Request Line"; "Test Request Line")
            {
                DataItemLink = "Document No." = FIELD("Document No.");
                
                column(ActivityCode_TestRequestLine; "Test Request Line"."Activity Code")
                {
                }
                column(ActivityDescription_TestRequestLine; "Test Request Line"."Activity Description")
                {
                }
                column(TotalDoneTodate_TestRequestLine; "Test Request Line"."Total Done Todate")
                {
                }
                column(UnitOfMeasure_TestRequestLine; "Test Request Line"."Unit Of Measure")
                {
                }
                column(ForemanID_TestRequestLine; "Test Request Line"."Foreman ID")
                {
                }
                column(ForemanName_TestRequestLine; "Test Request Line"."Foreman Name")
                {
                }
                column(TestsRequired_TestRequestLine; "Test Request Line"."Tests Required")
                {
                }
                column(WorksStartChainageKM_TestRequestLine; "Test Request Line"."Works Start Chainage(KM)")
                {
                }
                column(WorksEndChanageKM_TestRequestLine; "Test Request Line"."Works End Chanage(KM)")
                {
                }
                column(Site_Instruction_No_;"Site Instruction No.")
                {

                }
                column(Planning_Line_No_;"Planning Line No.")
                {
                    
                }
                column(Bill_Item_No_;"Bill Item No.")
                {

                }
                column(Bill_Item_Description;"Bill Item Description")
                {

                }
            }

            trigger OnAfterGetRecord()
            begin
                IF "Contractor Inspection Request".Inspected = TRUE THEN
                    InspectedR := InspectedR::Yes
                ELSE
                    InspectedR := InspectedR::No;

                IF "Contractor Inspection Request".Tested = TRUE THEN
                    TestedR := TestedR::Yes
                ELSE
                    TestedR := TestedR::No;

                IF "Contractor Inspection Request".Measured = TRUE THEN
                    MeasuredR := MeasuredR::Yes
                ELSE
                    MeasuredR := MeasuredR::No;

                IF "Contractor Inspection Request".Approved = TRUE THEN
                    ApprovedR := ApprovedR::Yes
                ELSE
                    ApprovedR := ApprovedR::No;

                IF "Contractor Inspection Request"."Inspected But Not Approved" = TRUE THEN
                    InspectedButNotApprovedR := InspectedButNotApprovedR::Yes
                ELSE
                    InspectedButNotApprovedR := InspectedButNotApprovedR::No;

                UserSetup.RESET;
                UserSetup.SETRANGE(UserSetup."User ID", "Contractor Inspection Request"."Inspected By");
                IF UserSetup.FINDSET THEN BEGIN
                    InspectorateName := UserSetup."Employee Name";
                END;

                UserSetup.RESET;
                UserSetup.SETRANGE(UserSetup."User ID", "Contractor Inspection Request"."Survey Remarks By");
                IF UserSetup.FINDSET THEN BEGIN
                    SurveyName := UserSetup."Employee Name";
                END;

                UserSetup.RESET;
                UserSetup.SETRANGE(UserSetup."User ID", "Contractor Inspection Request"."Lab Remarks By");
                IF UserSetup.FINDSET THEN BEGIN
                    LabName := UserSetup."Employee Name";
                END;

                UserSetup.RESET;
                UserSetup.SETRANGE(UserSetup."User ID", "Contractor Inspection Request"."ARE Remarks By");
                IF UserSetup.FINDSET THEN BEGIN
                    AREName := UserSetup."Employee Name";
                END;

                CompanyInfo.Get();
                CompanyInfo.CalcFields(Picture);
                FormatAddr.GetCompanyAddr("Global Dimension 1 Code", RespCenter, CompanyInfo, CompanyAddr);
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
        InspectedR: Option No,Yes;
        TestedR: Option No,Yes;
        MeasuredR: Option No,Yes;
        ApprovedR: Option No,Yes;
        InspectedButNotApprovedR: Option No,Yes;
        UserSetup: Record "User Setup";
        SurveyName: Text[100];
        LabName: Text[100];
        InspectorateName: Text[100];
        AREName: Text[100];
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        RespCenter: Record "Responsibility Center";
}

