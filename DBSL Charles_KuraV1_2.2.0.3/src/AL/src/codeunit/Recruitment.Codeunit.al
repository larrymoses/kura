#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 69600 "Recruitment"
{

    trigger OnRun()
    begin
    end;

    procedure TransferPlanToVacancy(RecruitmentPlanPosition: Record "Recruitment Plan Position")
    var
        Vacancy: Record "Recruitment Requisition Header";
        PositionRequirements: Record "Position Requirement";
        PositionWorkCondition: Record "Position Work Condition";
        PositionResponsibilities: Record "Positions Responsibility";
        VacancyRequirement: Record "Recruitment Req Requirement";
        VacancyWorkCondition: Record "Recruitment Req Work Condition";
        VacancyResponsibility: Record "Recruitment Req Responsibility";
        LineNo: Integer;
        PositionRequirements1: Record "Position Requirement";
        PositionWorkCondition1: Record "Position Work Condition";
        PositionResponsibilities1: Record "Positions Responsibility";
        VacancyNo: Code[30];
        NoSeriesManagement: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
    begin
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("HQ Responsibility Center");
        NoSeriesManagement.InitSeries(HumanResourcesSetup."HQ Responsibility Center", HumanResourcesSetup."HQ Responsibility Center", 0D, VacancyNo, HumanResourcesSetup."HQ Responsibility Center");
        Vacancy."Document No." := VacancyNo;
        Vacancy."Recruitment Plan Type" := Vacancy."recruitment plan type"::"Annual HR Plan";
        Vacancy."Recruitment Plan ID" := RecruitmentPlanPosition."Recruitment Plan ID";
        Vacancy."Position ID" := RecruitmentPlanPosition."Position ID";
        Vacancy.Validate("Position ID");
        Vacancy."Document Type" := Vacancy."document type"::"Job Vacancy";
        Vacancy."Document Date" := Today;
        Vacancy."Created By" := UserId;
        Vacancy."Created On" := Today;
        Vacancy."Created Time" := Time;
        Vacancy.Insert;

        //requirements

        PositionRequirements1.Reset;
        if PositionRequirements1.FindLast then begin
            LineNo := PositionRequirements1."Requirement ID";
        end;
        PositionRequirements.Reset;
        PositionRequirements.SetRange("Position ID", RecruitmentPlanPosition."Position ID");
        if PositionRequirements.FindSet then begin
            repeat
                VacancyRequirement."Line No." := LineNo + 1;
                VacancyRequirement."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyRequirement."Document No." := VacancyNo;
                VacancyRequirement."Requirement ID" := PositionRequirements."Requirement ID";
                VacancyRequirement."Qualification Category" := PositionRequirements."Qualification Category";
                VacancyRequirement.Description := PositionRequirements.Description;
                VacancyRequirement."Requirement Type" := PositionRequirements."Requirement Type";
                VacancyRequirement."Substitute Qualification Exist" := PositionRequirements."Substitute Qualification";
                VacancyRequirement.Insert;
                LineNo += 1;
            until PositionRequirements.Next = 0;
        end;

        //Responsibilities

        PositionResponsibilities1.Reset;
        if PositionResponsibilities1.FindLast then begin
            LineNo := PositionResponsibilities1."Line No";
        end;
        PositionResponsibilities.Reset;
        PositionResponsibilities.SetRange("Position ID", RecruitmentPlanPosition."Position ID");
        if PositionResponsibilities.FindSet then begin
            repeat
                VacancyResponsibility."Line No." := LineNo + 1;
                VacancyResponsibility."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyResponsibility."Document No." := VacancyNo;
                VacancyResponsibility.Description := PositionResponsibilities.Description;
                VacancyResponsibility.Insert;
                LineNo += 1;
            until PositionResponsibilities.Next = 0;
        end;


        //work conditions

        PositionWorkCondition1.Reset;
        if PositionWorkCondition1.FindLast then begin
            LineNo := PositionWorkCondition1."Line No";
        end;
        PositionWorkCondition.Reset;
        PositionWorkCondition.SetRange("Position ID", RecruitmentPlanPosition."Position ID");
        if PositionWorkCondition.FindSet then begin
            repeat
                VacancyWorkCondition."Line No" := LineNo + 1;
                VacancyWorkCondition."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyWorkCondition."Document No" := VacancyNo;
                VacancyWorkCondition."Working Condition Category" := PositionWorkCondition."Work Condition Category";
                VacancyWorkCondition.Description := PositionWorkCondition.Description;
                VacancyWorkCondition.Insert;
                LineNo += 1;
            until PositionWorkCondition.Next = 0;
        end;
        Message('Vacancy %1,has been created successfully', VacancyNo);
        Page.Run(69630, Vacancy);
    end;

    procedure CopyApplicantDetails(ApplicantNo: Record "Job Applications")
    var
        Applicant: Record Applicant;
        JobApplicantsQualification: Record "Job Applicants Qualification";
        ApplicantQualificationHistor: Record "Applicant Qualification Histor";
        Applicant_EmployeeHobby: Record "Applicant_Employee Hobby";
        Employee_ApplicantReferees: Record "Employee_Applicant Referees";
        Employee_ApplicantLanguage: Record "Employee_Applicant Language";
        JobApplications: Record "Job Applications";
        JobApplicantsQualification1: Record "Application Qualification";
        ApplicantQualificationHistor1: Record "Application Qualification His";
        Applicant_EmployeeHobby1: Record "Application Hobby";
        Employee_ApplicantReferees1: Record "Application Referees";
        Employee_ApplicantLanguage1: Record "Application Language";
    begin
        JobApplicantsQualification.Reset;
        JobApplicantsQualification.SetRange("Candidate No.", ApplicantNo."Candidate No.");
        if JobApplicantsQualification.FindSet then begin
            JobApplicantsQualification1.TransferFields(JobApplicantsQualification);
            JobApplicantsQualification1."Application No." := ApplicantNo."Application No.";
            JobApplicantsQualification1.Modify;
        end
    end;

    procedure CopyPositionDetails(RecruitmentRequisitionHeader: Record "Recruitment Requisition Header")
    var
        CompanyPositions: Record "Company Positions";
        RequisitionHeader: Record "Recruitment Requisition Header";
        ReqWorkCondition: Record "Recruitment Req Work Condition";
        ReqRequirement: Record "Recruitment Req Requirement";
        ReqResponsibility: Record "Recruitment Req Responsibility";
        PositionsResponsibility: Record "Positions Responsibility";
        PositionReqSubstitute: Record "Position Req Substitute";
        PositionRequirement: Record "Position Requirement";
        LineNo: Integer;
        ReqRequirement1: Record "Recruitment Req Requirement";
        ReqResponsibility1: Record "Recruitment Req Responsibility";
        ReqWorkCondition1: Record "Recruitment Req Work Condition";
    begin
        if not Confirm('Are you sure you want to populate requirements for the Position?', true) then
            Error('Requirements not populated');
        CompanyPositions.Reset;
        CompanyPositions.SetRange("Position ID", RecruitmentRequisitionHeader."Position ID");
        if CompanyPositions.FindFirst then begin
            //clear entries first
            ReqRequirement1.Reset;
            ReqRequirement1.SetRange("Document Type", ReqRequirement1."document type"::"Recruitment Requisition");
            ReqRequirement1.SetRange("Document No.", RecruitmentRequisitionHeader."Document No.");
            if ReqRequirement1.FindSet then begin
                ReqRequirement1.DeleteAll;
            end;
            ReqResponsibility1.Reset;
            ReqResponsibility1.SetRange("Document No.", RecruitmentRequisitionHeader."Document No.");
            if ReqResponsibility1.FindSet then begin
                ReqResponsibility1.DeleteAll;
            end;

            ReqRequirement1.Reset;
            if ReqRequirement1.FindLast then begin
                LineNo := ReqRequirement1."Line No.";
            end;
            PositionRequirement.Reset;
            PositionRequirement.SetRange("Position ID", CompanyPositions."Position ID");
            if PositionRequirement.FindSet then begin
                repeat
                    ReqRequirement."Document No." := RecruitmentRequisitionHeader."Document No.";
                    ReqRequirement."Line No." := LineNo + 1;
                    ReqRequirement."Document Type" := ReqRequirement."document type"::"Recruitment Requisition";
                    ReqRequirement."Requirement ID" := PositionRequirement."Requirement ID";
                    ReqRequirement."Requirement Type" := PositionRequirement."Requirement Type";
                    ReqRequirement."Qualification Category" := PositionRequirement."Qualification Category";
                    ReqRequirement."Qualification Code" := PositionRequirement."Qualification Code";
                    ReqRequirement.Description := PositionRequirement.Description;
                    LineNo += 1;
                    ReqRequirement.Insert;

                until PositionRequirement.Next = 0;
            end;
            //copy responsibilities
            ReqResponsibility1.Reset;
            if ReqResponsibility1.FindLast then begin
                LineNo := ReqResponsibility1."Line No.";
            end;
            PositionsResponsibility.Reset;
            PositionsResponsibility.SetRange("Position ID", RecruitmentRequisitionHeader."Position ID");
            if PositionsResponsibility.FindSet then begin
                repeat

                    ReqResponsibility."Document No." := RecruitmentRequisitionHeader."Document No.";
                    ReqResponsibility."Line No." := LineNo + 1;
                    ReqResponsibility."Document Type" := ReqResponsibility."document type"::"Recruitment Requisition";
                    ReqResponsibility.Description := PositionsResponsibility.Description;
                    ReqResponsibility.Insert;
                    LineNo += 1;
                until PositionsResponsibility.Next = 0;
            end;
            //position details
            RecruitmentRequisitionHeader."Job Grade ID" := CompanyPositions."Job Grade ID";
            RecruitmentRequisitionHeader."Estimate Annual Salary" := CompanyPositions."Average Monthly Salary (LCY)" * 12;
            RecruitmentRequisitionHeader."Duty Station ID" := CompanyPositions."Default Duty Station";
            RecruitmentRequisitionHeader.Modify(true);
            Message('The requirements and responsibilities for the position %1, have been populated', CompanyPositions."Job Title");
        end
    end;

    procedure PostFuncPlanToAnnual(RecruitmentPlan: Record "Recruitment Plan")
    var
        AnnualPlan: Record "Recruitment Plan";
        AnnualPlanPosition: Record "Recruitment Plan Position";
        AnnualPlanningLine: Record "Recruitment Planning Line";
        FunctionalPlanPosition: Record "Recruitment Planning Line";
        AnnualPlanningLine1: Record "Recruitment Planning Line";
        LineNo: Integer;
        AnnualPlanPosition1: Record "Recruitment Plan Position";
        RecruitmentPlanPosition: Record "Recruitment Plan Position";
    begin
        if not Confirm('Are you sure you want to post Functional Recruitment Plan to the Selected Annual Plan?', true)
          then
            Error('Functional Plan not posted');

        AnnualPlan.Reset;
        AnnualPlan.SetRange("Document No.", RecruitmentPlan."Annual Recruitment Plan No.");
        if AnnualPlan.FindFirst then begin
            //insert into position and lines
            FunctionalPlanPosition.Reset;
            FunctionalPlanPosition.SetRange("Recruitment Plan ID", RecruitmentPlan."Document No.");
            if FunctionalPlanPosition.FindSet then begin
                repeat
                    AnnualPlanPosition.Reset;
                    AnnualPlanPosition.SetRange("Recruitment Plan ID", RecruitmentPlan."Annual Recruitment Plan No.");
                    AnnualPlanPosition.SetRange("Position ID", FunctionalPlanPosition."Position ID");
                    if not AnnualPlanPosition.FindFirst then begin
                        //insert position and relevant lines
                        AnnualPlanPosition1.Init;
                        AnnualPlanPosition1."Recruitment Plan ID" := RecruitmentPlan."Annual Recruitment Plan No.";
                        AnnualPlanPosition1."Position ID" := FunctionalPlanPosition."Position ID";
                        AnnualPlanPosition1.Validate("Position ID");
                        AnnualPlanPosition1."Staff Establishment" := FunctionalPlanPosition."Staff Establishment";
                        AnnualPlanPosition1."Total Planned New Hires" := FunctionalPlanPosition."No. of Planned New Hires";
                        AnnualPlanPosition1."Target Candidate Source" := FunctionalPlanPosition."Target Candidate Source";
                        AnnualPlanPosition1.Insert(true);
                        //lines
                        CreateLines(AnnualPlan, FunctionalPlanPosition);


                    end
                    else begin
                        CreateLines(AnnualPlan, FunctionalPlanPosition);
                    end
                until FunctionalPlanPosition.Next = 0;
                Message('Functional Plan-%1,has been posted succesfully to %2', RecruitmentPlan."Document No.", RecruitmentPlan."Annual Recruitment Plan No.")
            end;
            RecruitmentPlan.Posted := true;
            RecruitmentPlan."Posted By" := UserId;
            RecruitmentPlan."Posted On" := CurrentDatetime;
            RecruitmentPlan.Modify(true);
        end;
    end;

    local procedure CreateLines(AnnualPlan: Record "Recruitment Plan"; FunctionalPlanPosition: Record "Recruitment Planning Line")
    var
        AnnualPlanningLine: Record "Recruitment Planning Line";
        AnnualPlanningLine1: Record "Recruitment Planning Line";
        LineNo: Integer;
    begin
        //delet previous entries

        AnnualPlanningLine.Reset;
        if AnnualPlanningLine.FindLast then
            LineNo := AnnualPlanningLine."Line No";
        AnnualPlanningLine1.Init;
        AnnualPlanningLine1."Line No" := LineNo + 1;
        AnnualPlanningLine1."Recruitment Plan ID" := AnnualPlan."Document No.";
        AnnualPlanningLine1."Position ID" := FunctionalPlanPosition."Position ID";
        AnnualPlanningLine1.Validate("Position ID");
        AnnualPlanningLine1."Designation Group" := FunctionalPlanPosition."Designation Group";
        AnnualPlanningLine1."Job No." := FunctionalPlanPosition."Job No.";
        AnnualPlanningLine1."Job Task No." := FunctionalPlanPosition."Job Task No.";
        AnnualPlanningLine1.Directorate := FunctionalPlanPosition.Directorate;
        AnnualPlanningLine1.Department := FunctionalPlanPosition.Department;
        AnnualPlanningLine1."Recruiter Fees %" := FunctionalPlanPosition."Recruiter Fees %";
        AnnualPlanningLine1."Direct Hire Unit Cost" := FunctionalPlanPosition."Direct Hire Unit Cost";
        AnnualPlanningLine1."Average Monthly Salary (LCY)" := FunctionalPlanPosition."Average Monthly Salary (LCY)";
        AnnualPlanningLine1."Average Cost/Hire" := FunctionalPlanPosition."Average Cost/Hire";
        AnnualPlanningLine1."Recruitment Cycle Type" := FunctionalPlanPosition."Recruitment Cycle Type";
        AnnualPlanningLine1."Recruitment Justification" := FunctionalPlanPosition."Recruitment Justification";
        AnnualPlanningLine1."Primary Recruitment Reason" := FunctionalPlanPosition."Primary Recruitment Reason";
        AnnualPlanningLine1."Recruitment Lead Time" := FunctionalPlanPosition."Recruitment Lead Time";
        AnnualPlanningLine1."Recruitment Line Budget Cost" := FunctionalPlanPosition."Recruitment Line Budget Cost";
        AnnualPlanningLine1."Recruitment Plan Type" := FunctionalPlanPosition."recruitment plan type"::"Annual HR Plan";
        AnnualPlanningLine1."Planned Start Date" := FunctionalPlanPosition."Planned Start Date";
        AnnualPlanningLine1.Validate("Planned Start Date");
        AnnualPlanningLine1."Planned Employment Start Date" := FunctionalPlanPosition."Planned Employment Start Date";
        AnnualPlanningLine1."Planned Employment End Date" := FunctionalPlanPosition."Planned Employment End Date";
        AnnualPlanningLine1."Staff Establishment" := FunctionalPlanPosition."Staff Establishment";
        AnnualPlanningLine1."No. of Planned New Hires" := FunctionalPlanPosition."No. of Planned New Hires";
        AnnualPlanningLine1.Insert(true);
    end;

    procedure ShortlistBasedOnRequirements(JobApplications: Record "Job Applications")
    var
        RecruitmentReqRequirement: Record "Recruitment Req Requirement";
        RequirementsChecklist: Record "Requirements Checklist";
        PassedMandatory: Record "Passed Mandatory";
        EntryNo: Integer;
    begin
        /* EntryNo:=0;
        RecruitmentReqRequirement.RESET;
        RecruitmentReqRequirement.SETRANGE("Document No.",JobApplications."Vacancy Id");
        IF RecruitmentReqRequirement.FINDSET THEN BEGIN
          REPEAT
            IF RecruitmentReqRequirement."Requirement Type"=RecruitmentReqRequirement."Requirement Type"::Mandatory THEN
              BEGIN
              RequirementsChecklist.RESET;
              RequirementsChecklist.SETRANGE("Application No.",JobApplications."Application No.");
              RequirementsChecklist.SETRANGE("Qualification Code",RecruitmentReqRequirement."Qualification Code");
              RequirementsChecklist.SETFILTER("Candidates Response",'<>%1','');
              IF RequirementsChecklist.FINDSET THEN BEGIN
                PassedMandatory.RESET;
                PassedMandatory.SETRANGE(Code,RequirementsChecklist."Application No.");
                IF PassedMandatory.FINDSET THEN BEGIN
                 PassedMandatory.DELETEALL;
                END;
                PassedMandatory.RESET;
                IF PassedMandatory.FINDLAST THEN BEGIN
                  EntryNo:=PassedMandatory."Line No";
                END;
                //insert on qualified
                PassedMandatory.INIT;
                PassedMandatory."Line No":=EntryNo+1;
                PassedMandatory.Code:=RequirementsChecklist."Application No.";
                PassedMandatory."Vacancy ID":=RequirementsChecklist."Qualification Code";

                IF RequirementsChecklist."Rating Type"=RequirementsChecklist."Rating Type"::"Yes/No"
                  THEN
                  IF RequirementsChecklist."Candidates Response"='Yes' THEN
                  PassedMandatory.Description:=TRUE;

                  PassedMandatory.INSERT(TRUE);
                 EntryNo+=1;
                END;
                END;

            //check if matched
          UNTIL
        RecruitmentReqRequirement.NEXT=0;
        END
        */

    end;

    procedure TransferRequisitionToVacancy(RequisitionHeader: Record "Recruitment Requisition Header")
    var
        Vacancy: Record "Recruitment Requisition Header";
        RecruitmentReqRequirement: Record "Recruitment Req Requirement";
        RecruitmentReqWorkCondition: Record "Recruitment Req Work Condition";
        RecruitmentReqResponsibility: Record "Recruitment Req Responsibility";
        VacancyRequirement: Record "Recruitment Req Requirement";
        VacancyWorkCondition: Record "Recruitment Req Work Condition";
        VacancyResponsibility: Record "Recruitment Req Responsibility";
        LineNo: Integer;
        RecruitmentReqRequirement1: Record "Recruitment Req Requirement";
        RecruitmentReqWorkCondition1: Record "Recruitment Req Work Condition";
        RecruitmentReqResponsibility1: Record "Recruitment Req Responsibility";
        VacancyNo: Code[30];
        NoSeriesManagement: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
    begin
        //transfer field
        if not Confirm('Are you sure you want to create this vacancy?', true) then
            Error('Vacancy not created');
        Vacancy.TransferFields(RequisitionHeader);
        Vacancy."Document Type" := Vacancy."document type"::"Job Vacancy";
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Vacancy Nos.");
        NoSeriesManagement.InitSeries(HumanResourcesSetup."Vacancy Nos.", HumanResourcesSetup."Vacancy Nos.", 0D, VacancyNo, HumanResourcesSetup."Director Payroll Nos");
        Vacancy."Document No." := VacancyNo;
        Vacancy."Document Date" := Today;
        Vacancy."Created By" := UserId;
        Vacancy."Created On" := Today;
        Vacancy."Created Time" := Time;
        Vacancy."Requisition ID" := RequisitionHeader."Document No.";
        Vacancy.Insert;

        //requirements
        RecruitmentReqRequirement1.Reset;
        if RecruitmentReqRequirement1.FindLast then begin
            LineNo := RecruitmentReqRequirement1."Line No.";
        end;
        RecruitmentReqRequirement.Reset;
        RecruitmentReqRequirement.SetRange("Document No.", RequisitionHeader."Document No.");
        if RecruitmentReqRequirement.FindSet then begin
            repeat
                //get last no

                VacancyRequirement.TransferFields(RecruitmentReqRequirement);
                VacancyRequirement."Line No." := LineNo + 1;
                VacancyRequirement."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyRequirement."Document No." := VacancyNo;
                VacancyRequirement.Insert;
                LineNo += 1;
            until RecruitmentReqRequirement.Next = 0;
        end;

        //Responsibilities

        RecruitmentReqResponsibility1.Reset;
        if RecruitmentReqResponsibility1.FindLast then begin
            LineNo := RecruitmentReqResponsibility1."Line No.";
        end;
        RecruitmentReqResponsibility.Reset;
        RecruitmentReqResponsibility.SetRange("Document No.", RequisitionHeader."Document No.");
        if RecruitmentReqResponsibility.FindSet then begin
            repeat
                //get last no

                VacancyResponsibility.TransferFields(RecruitmentReqResponsibility);
                VacancyResponsibility."Line No." := LineNo + 1;
                VacancyResponsibility."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyResponsibility."Document No." := VacancyNo;
                VacancyResponsibility.Insert;
                LineNo += 1;
            until RecruitmentReqResponsibility.Next = 0;
        end;


        //work conditions

        RecruitmentReqWorkCondition1.Reset;
        if RecruitmentReqWorkCondition1.FindLast then begin
            LineNo := RecruitmentReqWorkCondition1."Line No";
        end;
        RecruitmentReqWorkCondition.Reset;
        RecruitmentReqWorkCondition.SetRange("Document No", RequisitionHeader."Document No.");
        if RecruitmentReqWorkCondition.FindSet then begin
            repeat
                //get last no

                VacancyWorkCondition.TransferFields(RecruitmentReqWorkCondition);
                VacancyWorkCondition."Line No" := LineNo + 1;
                VacancyWorkCondition."Document Type" := VacancyRequirement."document type"::"Job Vacancy";
                VacancyWorkCondition."Document No" := VacancyNo;
                VacancyWorkCondition.Insert;
                LineNo += 1;
            until RecruitmentReqWorkCondition.Next = 0;
        end;

        RequisitionHeader."Vacancy Created" := true;
        RequisitionHeader.Modify;
        Message('Vacancy %1,has been created successfully', VacancyNo);
    end;

    procedure AdvertiseVacancy(Announcement: Record "Vacancy Announcement")
    var
        Vacancy: Record "Recruitment Requisition Header";
        AnnouncementHeader: Record "Vacancy Announcement";
        AnnouncementLine: Record "Vacancy Announcement Line";
        AnnouncementPosting: Record "Vacancy Announcement Posting";
        LineNo: Integer;
        TXT001: label 'The vacancies on this document have been advertised successfully';
    begin
        AnnouncementLine.Reset;
        AnnouncementLine.SetRange("Announcement No.", Announcement."Announcement No.");
        if AnnouncementLine.FindSet then begin
            repeat
                //advertise no
                Vacancy.Reset;
                Vacancy.SetRange("Document No.", AnnouncementLine."Vacancy ID");
                if Vacancy.FindFirst then begin
                    Vacancy.Published := true;
                    Vacancy."Date Published" := Today;
                    Vacancy."Target Candidate Source" := AnnouncementHeader."Target Candidate Source";
                    Vacancy."Target Candidate Source" := AnnouncementLine."Target Candidate Source";
                    Vacancy."Application Closing Date" := AnnouncementLine."Application Closing Date";
                    Vacancy."Application Closing Time" := AnnouncementLine."Application Closing  Time";
                    Vacancy."Vacancy Status" := Vacancy."vacancy status"::Published;
                    Vacancy.Modify(true);
                end
            until
          AnnouncementLine.Next = 0;
            Announcement."Date Published" := Today;
            Announcement."Vacancy Status" := Announcement."vacancy status"::Published;
            Announcement.Modify(true);
            Message(TXT001);
        end
    end;

    procedure ShortlistBasedOnMandatory(JobApplications: Record "Job Applications")
    var
        JobApplicationRequirements: Record "Job Application Requirements";
        ApplicationRequirements: Record "Job Application Requirements";
        PassedMandatory: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
    begin
        ApplicationRequirements.Reset;
        ApplicationRequirements.SetRange("Application No.", JobApplications."Application No.");
        ApplicationRequirements.SetRange("Requirement Type", ApplicationRequirements."requirement type"::Mandatory);
        if ApplicationRequirements.FindSet then begin
            repeat
                if ApplicationRequirements."Candidates Response" = ApplicationRequirements."candidates response"::"Meets Criterion" then
                    Passed := true
                else
                    Passed := false;
            until ApplicationRequirements.Next = 0;
            if Passed = true
              then begin
                JobApplications."Application Status" := JobApplications."application status"::"System Shortlisting";
                JobApplications.Modify;
            end else begin
                JobApplications."Application Status" := JobApplications."application status"::"Failed System Shortlisting";
                JobApplications.Modify;
            end
        end;
    end;

    procedure ShortlistBasedOnDefinedParameters(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
        ShortlistFailedManagement: Record "Shortlist Failed Management";
        ShortlistFailedGeneral: Record "Shortlist Failed General";
        ShortlistFailedAcademic: Record "Shortlist Failed Academic";
    begin
        //delete qualified amd failed entries
        SelectionLine.Reset;
        SelectionLine.SetRange("Document No", SelectionHeader."Document No.");
        if SelectionLine.FindSet then begin
            SelectionLine.DeleteAll;
        end;

        ShortlistFailedAcademic.Reset;
        ShortlistFailedAcademic.SetRange("Document No.", SelectionHeader."Document No.");
        if ShortlistFailedAcademic.FindSet then begin
            ShortlistFailedAcademic.DeleteAll;
        end;

        ShortlistFailedGeneral.Reset;
        ShortlistFailedGeneral.SetRange("Document No.", SelectionHeader."Document No.");
        if ShortlistFailedGeneral.FindSet then begin
            ShortlistFailedGeneral.DeleteAll;
        end;


        ShortlistFailedManagement.Reset;
        ShortlistFailedManagement.SetRange("Document No.", SelectionHeader."Document No.");
        if ShortlistFailedManagement.FindSet then begin
            ShortlistFailedManagement.DeleteAll;
        end;

        //end delete  qualified and failed entries

        JobApplications.Reset;
        JobApplications.SetRange("Application Status", JobApplications."application status"::Open);
        JobApplications.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
        if JobApplications.FindSet then begin
            repeat
                //academic

                if SelectionHeader."Minimum Academic Qualification" <> '' then begin
                    Qualification.Reset;
                    Qualification.SetRange(Code, SelectionHeader."Minimum Academic Qualification");
                    if Qualification.FindSet then begin
                        //get the hierarchy code
                        HierarchyCode := Qualification."Academic Hierachy Code";
                        if JobApplications."Highest Academic Qualification" <> '' then begin
                            //JobApplications.TESTFIELD("Highest Academic Qualification");
                            Qualification1.Reset;
                            Qualification1.SetRange(Code, JobApplications."Highest Academic Qualification");
                            if Qualification1.FindSet then begin
                                if Qualification1."Academic Hierachy Code" < HierarchyCode then begin
                                    Passed := false;
                                    //insert on academic table
                                    CreateFailedApplicantAcc(JobApplications, SelectionHeader);
                                end
                                else
                                    Passed := true
                            end;
                        end;//checker for academic
                    end;
                end;

                //General experience
                if Passed = true then begin
                    if SelectionHeader."Minimum Work Experience" <> 0 then begin
                        if JobApplications."Work Experience (Years)" < SelectionHeader."Minimum Work Experience" then begin
                            Passed := false;
                            CreateFailedApplicantGen(JobApplications, SelectionHeader);
                        end
                        else
                            Passed := true
                    end;
                end;
                //Management experience
                if Passed = true then begin
                    if SelectionHeader."Minimum Mngmnt Experience" <> 0 then begin
                        //check if appplication meets
                        if JobApplications."Management Experience (Years)" < SelectionHeader."Minimum Mngmnt Experience" then begin
                            Passed := false;

                            CreateFailedApplicantMgmnt(JobApplications, SelectionHeader);
                        end
                        else
                            Passed := true
                    end;
                end;
                if Passed = true then begin
                    //insert in selection line

                    SelectionLine.Init;
                    SelectionLine."Document Type" := SelectionLine."document type"::"Candidate Shortlisting";
                    SelectionLine."Document No" := SelectionHeader."Document No.";
                    SelectionLine."Application No." := JobApplications."Application No.";
                    SelectionLine.Validate("Application No.");
                    //  SelectionLine .Insert(true);

                end;
            until JobApplications.Next = 0;
        end
        // JobApplications.RESET;
        // //JobApplications.SETRANGE("Application Status",JobApplications."Application Status"::"System Shortlisting");
        // JobApplications.SETRANGE("Vacancy Id",SelectionHeader."Vacancy ID");
        // IF JobApplications.FINDSET THEN BEGIN
        //  REPEAT
        //    //academic
        //
        //          IF SelectionHeader."Minimum Academic Qualification"<>'' THEN BEGIN
        //            Qualification.RESET;
        //            Qualification.SETRANGE(Code,SelectionHeader."Minimum Academic Qualification");
        //            IF Qualification.FINDSET THEN BEGIN
        //              //get the hierarchy code
        //              HierarchyCode:=Qualification."Academic Hierachy Code";
        //              JobApplications.TESTFIELD("Highest Academic Qualification");
        //              Qualification1.RESET;
        //              Qualification1.SETRANGE(Code,JobApplications."Highest Academic Qualification");
        //              IF Qualification1.FINDSET THEN BEGIN
        //                IF Qualification1."Academic Hierachy Code"<HierarchyCode THEN BEGIN
        //                  Passed:=FALSE;
        //                //insert on academic table
        //                CreateFailedApplicantAcc(JobApplications,SelectionHeader);
        //                END
        //                ELSE
        //                  Passed:=TRUE
        //              END
        //            END;
        //          END;
        //
        //     //General experience
        //      IF Passed=TRUE THEN BEGIN
        //        IF SelectionHeader."Minimum Work Experience"<>0 THEN BEGIN
        //          IF JobApplications."Work Experience (Years)"<SelectionHeader."Minimum Work Experience" THEN
        //            BEGIN
        //            Passed:=FALSE;
        //             CreateFailedApplicantGen(JobApplications,SelectionHeader);
        //             END
        //          ELSE
        //            Passed:=TRUE
        //        END;
        //      END;
        //    //Management experience
        //       IF Passed=TRUE THEN BEGIN
        //      IF SelectionHeader."Minimum Mngmnt Experience"<>0 THEN BEGIN
        //      //check if appplication meets
        //      IF JobApplications."Management Experience (Years)"<SelectionHeader."Minimum Mngmnt Experience" THEN
        //        BEGIN
        //        Passed:=FALSE;
        //
        //         CreateFailedApplicantMgmnt(JobApplications,SelectionHeader);
        //         END
        //      ELSE
        //        Passed:=TRUE
        //     END;
        //      END;
        //      IF Passed=TRUE THEN BEGIN
        //      //insert in selection line
        //
        //        SelectionLine.RESET;
        //        SelectionLine.SETRANGE("Document No",SelectionHeader."Document No.");
        //        IF SelectionLine.FINDSET THEN BEGIN
        //          SelectionLine.DELETEALL;
        //        END;
        // //        JobApplications.RESET;
        // //        JobApplications.SETRANGE("Application No.",JobApplications."Application No.");
        // //        IF JobApplications.FINDSET THEN BEGIN
        // //          REPEAT
        //        SelectionLine.INIT;
        //        SelectionLine."Document Type":=SelectionLine."Document Type"::"Candidate Shortlisting";
        //        SelectionLine."Document No":=SelectionHeader."Document No.";
        //        SelectionLine."Application No.":=JobApplications."Application No.";
        //        SelectionLine.VALIDATE("Application No.");
        //        SelectionLine.INSERT:=TRUE;
        //        //UNTIL JobApplications.NEXT=0;
        //      END;
        //      //END;
        //  UNTIL JobApplications.NEXT=0;
        // END
    end;

    local procedure CreateFailedApplicantAcc(JobApplication: Record "Job Applications"; SelectionHeader: Record "Candidate Selection Header")
    var
        ShortlistFailed: Record "Shortlist Failed Academic";
        LineNo: Integer;
        TXT001: label 'Details Updated Succesfully';
    begin
        ShortlistFailed.Init;
        ShortlistFailed."Document Type" := ShortlistFailed."document type"::"Candidate Shortlisting";
        ShortlistFailed."Document No." := SelectionHeader."Document No.";
        ShortlistFailed."Application No." := JobApplication."Application No.";
        ShortlistFailed.Validate("Application No.");
        ShortlistFailed.Validate("Highest Academic Qualification");
        //ShortlistFailed .Insert(true);
    end;

    local procedure CreateFailedApplicantGen(JobApplication: Record "Job Applications"; SelectionHeader: Record "Candidate Selection Header")
    var
        ShortlistFailed: Record "Shortlist Failed General";
        LineNo: Integer;
        TXT001: label 'Details Updated Succesfully';
    begin
        ShortlistFailed.Init;
        ShortlistFailed."Document Type" := ShortlistFailed."document type"::"Candidate Shortlisting";
        ShortlistFailed."Document No." := SelectionHeader."Document No.";
        ShortlistFailed."Application No." := JobApplication."Application No.";
        ShortlistFailed.Validate("Application No.");
        ShortlistFailed.Validate("Highest Academic Qualification");
        // ShortlistFailed .Insert(true);
    end;

    local procedure CreateFailedApplicantMgmnt(JobApplication: Record "Job Applications"; SelectionHeader: Record "Candidate Selection Header")
    var
        ShortlistFailed: Record "Shortlist Failed Management";
        TXT001: label 'Details Updated Succesfully';
    begin
        ShortlistFailed.Init;
        ShortlistFailed."Document Type" := ShortlistFailed."document type"::"Candidate Shortlisting";
        ShortlistFailed."Document No." := SelectionHeader."Document No.";
        ShortlistFailed."Application No." := JobApplication."Application No.";
        ShortlistFailed.Validate("Application No.");
        ShortlistFailed.Validate("Highest Academic Qualification");
        // ShortlistFailed .Insert(true);
    end;

    procedure NotifyAtendees(VacancyAnnouncement: Record "Vacancy Announcement")
    var
        FairAttendance: Record "Career Fair Attendance";
        Body: Text;
        SMTP: Codeunit Mail;
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        AnnouncementLine: Record "Vacancy Announcement Line";
        Counter: Integer;
    begin
        FairAttendance.Reset;
        FairAttendance.SetRange("Career Fair ID", VacancyAnnouncement."Announcement No.");
        if FairAttendance.FindSet then begin
            repeat
                //notify attendees
                SMTPMailSetup.Get;
                Body := 'Invitation for response of job Applications will commence from' + Format(Today) + ' ' + 'to' + ' ' + Format(VacancyAnnouncement."Application Closing Date");
                // Email := SMTPMailSetup."Email Address";
                Email2 := FairAttendance."Representative Email";
                // SMTP.CreateMessage('INVITATION FOR JOB APPLICATIONS', Email2,
                //       Email, 'Applications ' + 'No: ' + VacancyAnnouncement."Announcement No.", '<u>RE:INFORMATION ON OPEN POSITIONS</u><BR><BR>' +
                //       'Dear candidate-' + FairAttendance."Representative Name" + ',<BR><BR>' +
                //        ' Kindly login to the portal and start the job application process if interested:<br>Use the following link to acess the system.' + ' ' + '<b><a href="https://KeRRA.co.ke">' + VacancyAnnouncement."Agency Name" + '</a></b><BR>', true);
                // SMTP.AddBodyline('The open positions are:<BR>');

                AnnouncementLine.Reset;
                AnnouncementLine.SetRange("Announcement No.", VacancyAnnouncement."Announcement No.");
                if AnnouncementLine.FindSet then begin
                    repeat
                        Counter := Counter + 1;
                    //   SMTP.AddBodyline(Format(Counter) + '.' + AnnouncementLine."Job Title/Designation" + '<BR>');
                    until AnnouncementLine.Next = 0;
                end;

            //  SMTP.AddBodyline('Thank you for the continued support.<BR>');
            //  SMTP.AddCC(Email2);
            //  SMTP.AddBodyline('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
            //  SMTP.Send();

            until FairAttendance.Next = 0;
            FairAttendance."Notified on Email" := true;
            FairAttendance.Modify(true);
        end
    end;

    procedure NotifyPhoneInterviewApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        FairAttendance: Record "PreScreening Line";
        Body: Text;
        SMTP: Codeunit Mail;
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
    begin
        FairAttendance.Reset;
        FairAttendance.SetRange("Document No.", PreScreenHeader."Document No.");
        if FairAttendance.FindSet then begin
            repeat
                //notify attendees
                SMTPMailSetup.Get;
                //Email := SMTPMailSetup."Email Address";
                Email2 := FairAttendance.Email;
            //SMTP.CreateMessage(Email2, Email2,
            //        Email, 'Application' + 'No: ' + FairAttendance."Application No.", '<u>RE:INVITATION FOR A PHONE INTERVIEW</u><BR><BR>' +
            //        'Dear' + FairAttendance."First Name" + ',<BR><BR>' +
            //         ' You are hereby notified that a phone interview has been scheduled in line with the application for the vacancy:' +
            //         ' ' + PreScreenHeader."Job Title/Designation" + '<br>The following are the details for the interview:<BR>' +
            //         ' ' + 'Date:' + ' ' + Format(FairAttendance."Test Start Time") + '<BR>+Duration:' + ' ' + Format(FairAttendance."Test Start Time") + ' ' + 'to' + ' ' + Format(FairAttendance."Test End Time"), true);
            // SMTP.AddBodyline('Thank you for the continued support.<BR>');
            // SMTP.AddCC(Email2);
            // SMTP.AddBodyline('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
            // SMTP.Send();

            until FairAttendance.Next = 0;
            FairAttendance.Notified := true;
            FairAttendance."DateTime Notified" := CurrentDatetime;
            FairAttendance.Modify(true);
        end
    end;

    procedure SuggestPhoneInterviewApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        PreScreeningLine: Record "PreScreening Line";
        JobApplications: Record "Job Applications";
        PreScreeningLine1: Record "PreScreening Line";
        LineNo: Integer;
        TXT001: label 'Job Applicants succesfully suggested for the Vacancy %1';
        TXT002: label 'There are no job applicants found for the Vacancy %1';
    begin
        PreScreeningLine1.Reset;
        PreScreeningLine1.SetRange("Document No.", PreScreenHeader."Document No.");
        if PreScreeningLine1.FindSet then
            PreScreeningLine1.DeleteAll;
        JobApplications.Reset;
        JobApplications.SetRange("Vacancy Id", PreScreenHeader."Vacancy ID");
        if JobApplications.FindSet then begin

            repeat
                //INSEERT
                PreScreeningLine.Init;
                PreScreeningLine."Document No." := PreScreenHeader."Document No.";
                PreScreeningLine."Document Type" := PreScreenHeader."Document Type";
                PreScreeningLine."Vacancy ID" := PreScreenHeader."Vacancy ID";
                PreScreeningLine."Application No." := JobApplications."Application No.";
                PreScreeningLine.Validate("Application No.");
                PreScreeningLine.Insert;
            until JobApplications.Next = 0;
            Message(TXT001, PreScreenHeader."Vacancy ID");
        end else begin
            Message(TXT002, PreScreenHeader."Vacancy ID");
        end
    end;

    procedure PostPhoneApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        PreScreeningLine: Record "PreScreening Line";
        RecruitmentLedger: Record "Recruitment Selection Ledger";
        LineNo: Integer;
        RecruitmentLedger1: Record "Recruitment Selection Ledger";
        TXT001: label 'The phone Interview report %1  has been posted succesfully';
    begin
        RecruitmentLedger1.Reset;
        if RecruitmentLedger1.FindLast then
            LineNo := RecruitmentLedger1."Entry No.";

        //INSERT TO LEDGER
        PreScreeningLine.Reset;
        PreScreeningLine.SetRange("Document No.", PreScreenHeader."Document No.");
        if PreScreeningLine.FindSet then begin
            repeat
                RecruitmentLedger."Entry No." := LineNo + 1;
                RecruitmentLedger."Application No." := PreScreeningLine."Application No.";
                RecruitmentLedger.Validate("Application No.");
                RecruitmentLedger.Insert;
                LineNo += 1;
            until PreScreeningLine.Next = 0;
            Message(TXT001, PreScreenHeader."Document No.")
        end
    end;

    procedure NotifyAbilityTestApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        FairAttendance: Record "PreScreening Line";
        Body: Text;
        SMTP: Codeunit Mail;
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
    begin
        FairAttendance.Reset;
        FairAttendance.SetRange("Document No.", PreScreenHeader."Document No.");
        if FairAttendance.FindSet then begin
            repeat
            //notify attendees
            // SMTPMailSetup.Get;
            // Email := SMTPMailSetup."Email Address";
            // Email2 := FairAttendance.Email;
            // SMTP.CreateMessage(Email2, Email2,
            //        Email, 'Application' + 'No: ' + FairAttendance."Application No.", '<u>RE:INVITATION FOR A PHONE INTERVIEW</u><BR><BR>' +
            //        'Dear' + FairAttendance."First Name" + ',<BR><BR>' +
            //         ' You are hereby notified that a phone interview has been scheduled in line with the application for the vacancy:' +
            //         ' ' + PreScreenHeader."Job Title/Designation" + '<br>The following are the details for the interview:<BR>' +
            //         ' ' + 'Date:' + ' ' + Format(FairAttendance."Test Start Time") + '<BR>+Duration:' + ' ' + Format(FairAttendance."Test Start Time") + ' ' + 'to' + ' ' + Format(FairAttendance."Test End Time"), true);
            // SMTP.AddBodyline('Thank you for the continued support.<BR>');
            // SMTP.AddCC(Email2);
            // SMTP.AddBodyline('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
            // SMTP.Send();

            until FairAttendance.Next = 0;
            FairAttendance.Notified := true;
            FairAttendance."DateTime Notified" := CurrentDatetime;
            FairAttendance.Modify(true);
        end
    end;

    procedure SuggestAbilityTestApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        PreScreeningLine: Record "PreScreening Line";
        JobApplications: Record "Job Applications";
        PreScreeningLine1: Record "PreScreening Line";
        LineNo: Integer;
        TXT001: label 'Job Applicants succesfully suggested for the Vacancy %1';
        TXT002: label 'There are no job applicants found for the Vacancy %1';
    begin
        PreScreeningLine1.Reset;
        PreScreeningLine1.SetRange("Document No.", PreScreenHeader."Document No.");
        if PreScreeningLine1.FindSet then
            PreScreeningLine1.DeleteAll;
        JobApplications.Reset;
        JobApplications.SetRange("Vacancy Id", PreScreenHeader."Vacancy ID");
        if JobApplications.FindSet then begin

            repeat
                //INSEERT
                PreScreeningLine.Init;
                PreScreeningLine."Document No." := PreScreenHeader."Document No.";
                PreScreeningLine."Document Type" := PreScreeningLine."document type"::"Ability Test Invitation";
                PreScreeningLine."Vacancy ID" := PreScreenHeader."Vacancy ID";
                PreScreeningLine."Application No." := JobApplications."Application No.";
                PreScreeningLine.Validate("Application No.");
                PreScreeningLine.Insert;
            until JobApplications.Next = 0;
            Message(TXT001, PreScreenHeader."Vacancy ID");
        end else begin
            Message(TXT002, PreScreenHeader."Vacancy ID");
        end
    end;

    procedure PostAbilityTestApplicants(PreScreenHeader: Record "PreScreen Header")
    var
        PreScreeningLine: Record "PreScreening Line";
        RecruitmentLedger: Record "Recruitment Selection Ledger";
        LineNo: Integer;
        RecruitmentLedger1: Record "Recruitment Selection Ledger";
        TXT001: label 'The phone Interview report %1  has been posted succesfully';
    begin
        RecruitmentLedger1.Reset;
        if RecruitmentLedger1.FindLast then
            LineNo := RecruitmentLedger1."Entry No.";

        //INSERT TO LEDGER
        PreScreeningLine.Reset;
        PreScreeningLine.SetRange("Document No.", PreScreenHeader."Document No.");
        if PreScreeningLine.FindSet then begin
            repeat
                RecruitmentLedger."Entry No." := LineNo + 1;
                RecruitmentLedger."Application No." := PreScreeningLine."Application No.";
                RecruitmentLedger.Validate("Application No.");
                RecruitmentLedger.Insert;
                LineNo += 1;
            until PreScreeningLine.Next = 0;
            Message(TXT001, PreScreenHeader."Document No.")
        end
    end;

    procedure SuggestShortlistCriteria(CandidateSelectionHeader: Record "Candidate Selection Header")
    var
        ShortlistScoring: Record "Candidate Shortlist Scoring";
        ShortlistScoreGuide: Record "Candidate Shortlist Score Guid";
        LineNo: Integer;
        RecruitmentRequisition: Record "Recruitment Req Requirement";
        CandidateShortlistCriteria: Record "Candidate Shortlist Criteria";
        ShortlistingScoreCode: Record "Shortlisting Score Code";
    begin
        RecruitmentRequisition.Reset;
        RecruitmentRequisition.SetRange("Document Type", RecruitmentRequisition."document type"::"Job Vacancy");
        RecruitmentRequisition.SetRange("Document No.", CandidateSelectionHeader."Vacancy ID");
        if RecruitmentRequisition.FindSet then begin
            repeat
                //insert
                ShortlistScoreGuide.Reset;
                ShortlistScoreGuide.SetRange("Document No.", CandidateSelectionHeader."Document No.");
                if ShortlistScoreGuide.FindSet then
                    ShortlistScoreGuide.DeleteAll;

                //insert
                CandidateShortlistCriteria.Reset;
                CandidateShortlistCriteria.SetRange("Document No.", CandidateSelectionHeader."Document No.");
                if CandidateShortlistCriteria.FindSet then
                    CandidateShortlistCriteria.DeleteAll;

                CandidateShortlistCriteria."Document Type" := CandidateShortlistCriteria."document type"::"Candidate Shortlisting";
                CandidateShortlistCriteria."Document No." := CandidateSelectionHeader."Document No.";
                CandidateShortlistCriteria."Requirement Type" := RecruitmentRequisition."Requirement Type";
                CandidateShortlistCriteria."Requiement ID." := RecruitmentRequisition."Requirement ID";
                CandidateShortlistCriteria."Qualification Code" := RecruitmentRequisition."Qualification Code";
                CandidateShortlistCriteria."Qualification Category" := RecruitmentRequisition."Qualification Category";
                CandidateShortlistCriteria.Description := RecruitmentRequisition.Description;
                CandidateShortlistCriteria.Insert;

                //update weights
                ShortlistingScoreCode.Reset;
                if ShortlistingScoreCode.FindSet then begin
                    repeat
                        ShortlistScoreGuide.Init;
                        ShortlistScoreGuide."Document Type" := ShortlistScoreGuide."document type"::"Candidate Shortlisting";
                        ShortlistScoreGuide."Document No." := CandidateSelectionHeader."Document No.";
                        ShortlistScoreGuide."Requirement ID" := RecruitmentRequisition."Requirement ID";
                        ShortlistScoreGuide."Score Code" := ShortlistingScoreCode.Code;
                        ShortlistScoreGuide."Requirement Name" := RecruitmentRequisition.Description;
                        ShortlistScoreGuide.Validate("Score Code");
                        ShortlistScoreGuide.Insert;
                    until ShortlistingScoreCode.Next = 0
                end;
            until RecruitmentRequisition.Next = 0;
        end
    end;

    procedure CreateInterviewInvitation(SelectionHeader: Record "Candidate Selection Header")
    var
        CandidateSelection: Record "Candidate Selection Header";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
        ShortlistMatrix: Record "Candidate Interview Line";
        DocumentNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        CandidateSelectionCommittee: Record "Candidate Selection Committee";
        CandidateSelectionCommittee2: Record "Candidate Selection Committee";
    begin
        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document No.", SelectionHeader."Document No.");
        if SelectionHeader.FindSet then
            CandidateSelection.Init;
        CandidateSelection."Document Type" := CandidateSelection."document type"::"Interview Invitation";
        HRSetup.Get;
        HRSetup.TestField("Interview Invitation Nos.");
        NoSeriesMgt.InitSeries(HRSetup."Interview Invitation Nos.", HRSetup."Interview Invitation Nos.", 0D, DocumentNo, HRSetup."Interview Invitation Nos.");
        CandidateSelection."Document No." := DocumentNo;
        CandidateSelection."Document Type" := CandidateSelection."document type"::"Interview Invitation";
        CandidateSelection.Description := 'Interview invitation for Vacancy No:' + SelectionHeader."Vacancy ID";
        CandidateSelection."Vacancy ID" := SelectionHeader."Vacancy ID";
        //CandidateSelection.
        CandidateSelection."Created By" := UserId;
        CandidateSelection."Document Date" := Today;
        CandidateSelection."Source Type" := CandidateSelection."document type"::"Interview Invitation";
        CandidateSelection."Source Document No." := SelectionHeader."Document No.";
        CandidateSelection."Appointed Selection Comm ID" := SelectionHeader."Appointed Selection Comm ID";
        CandidateSelection."Selection Committee Chair" := SelectionHeader."Selection Committee Chair";
        CandidateSelection."Position ID" := SelectionHeader."Position ID";
        CandidateSelection."Job Title" := SelectionHeader."Job Title";
        CandidateSelection."No. of openings" := SelectionHeader."No. of openings";
        CandidateSelection.Directorate := SelectionHeader.Directorate;
        CandidateSelection.Department := SelectionHeader.Department;
        CandidateSelection.Region := SelectionHeader.Region;
        CandidateSelection."Seniority Level" := SelectionHeader."Seniority Level";
        CandidateSelection."Default Terms of Service Code" := SelectionHeader."Default Terms of Service Code";
        CandidateSelection."Employment Type" := SelectionHeader."Employment Type";
        CandidateSelection."Application Closing Date" := SelectionHeader."Application Closing Date";
        CandidateSelection."Application Closing Time" := SelectionHeader."Application Closing Time";
        CandidateSelection."Created On" := CurrentDatetime;
        if CandidateSelection.Insert = true then begin
            CandidateShortlistMatrix.Reset;
            CandidateShortlistMatrix.SetRange("Document No", SelectionHeader."Document No.");
            CandidateShortlistMatrix.SetRange("Shortlisting Outcome", CandidateShortlistMatrix."shortlisting outcome"::"Invite for First Interview");
            if CandidateShortlistMatrix.FindSet then begin
                repeat

                    ShortlistMatrix.Init;
                    //ShortlistMatrix.TRANSFERFIELDS(CandidateShortlistMatrix);
                    ShortlistMatrix."Document Type" := ShortlistMatrix."document type"::"Interview Invitation";
                    ShortlistMatrix."Document No." := CandidateSelection."Document No.";
                    ShortlistMatrix."Vacancy ID" := CandidateShortlistMatrix."Vacancy ID";
                    ShortlistMatrix."Application No." := CandidateShortlistMatrix."Application No.";
                    ShortlistMatrix."Candidate No." := CandidateShortlistMatrix."Candidate No";
                    ShortlistMatrix."First Name" := CandidateShortlistMatrix."First Name";
                    ShortlistMatrix."Middle Name" := CandidateShortlistMatrix."Middle Name";
                    ShortlistMatrix."Last Name" := CandidateShortlistMatrix."Last Name";
                    ShortlistMatrix."Phone No." := CandidateShortlistMatrix."Phone No.";
                    ShortlistMatrix."Mobile Phone No." := CandidateShortlistMatrix."Mobile Phone No.";
                    ShortlistMatrix.Email := CandidateShortlistMatrix.Email;
                    ShortlistMatrix."Birth Date" := CandidateShortlistMatrix."Birth Date";
                    ShortlistMatrix."Management Experience Yrs" := CandidateShortlistMatrix."Management Experience (Years)";
                    ShortlistMatrix."General Work Experience Yrs" := CandidateShortlistMatrix."Work Experience (Years)";
                    ShortlistMatrix.Gender := CandidateShortlistMatrix.Gender;
                    ShortlistMatrix."Passport No." := CandidateShortlistMatrix."Passport No.";
                    ShortlistMatrix."Tax Registration(PIN)" := CandidateShortlistMatrix."Tax Registration No.";
                    ShortlistMatrix."ID Number" := CandidateShortlistMatrix."ID Number";
                    ShortlistMatrix."Marital Status" := CandidateShortlistMatrix."Marital Status";
                    ShortlistMatrix."Ethnic Group" := CandidateShortlistMatrix."Ethnic Group";
                    ShortlistMatrix.Religion := CandidateShortlistMatrix.Religion;
                    ShortlistMatrix.Disabled := CandidateShortlistMatrix.Disabled;
                    ShortlistMatrix."Disability Code" := CandidateShortlistMatrix."Disability Code";
                    ShortlistMatrix."Disability Description" := CandidateShortlistMatrix."Disability Description";
                    ShortlistMatrix."Disability Cert No." := CandidateShortlistMatrix."Disability Certificate No";
                    ShortlistMatrix."Specialization Area" := CandidateShortlistMatrix."Specialization Area";
                    ShortlistMatrix."Candidate Shortlist Voucher" := SelectionHeader."Document No.";
                    ShortlistMatrix.Nationality := CandidateShortlistMatrix.Nationality;
                    ShortlistMatrix."Academic Qualification Name" := CandidateShortlistMatrix."Qualification Name";
                    ShortlistMatrix."Highest Academic Qualification" := CandidateShortlistMatrix."Highest Academic Qualification";
                //ShortlistMatrix."Document No.":=DocumentNo;
                //ShortlistMatrix."Document Type":=ShortlistMatrix."Document Type"::"Candidate Shortlisting";
                //  ShortlistMatrix .Insert(true);
                until CandidateShortlistMatrix.Next = 0;
            end;
            CandidateSelectionCommittee.Reset;
            CandidateSelectionCommittee.SetRange("Document No.", SelectionHeader."Document No.");
            if CandidateSelectionCommittee.FindSet then begin
                repeat
                    CandidateSelectionCommittee2.Init;
                    CandidateSelectionCommittee2."Document No." := CandidateSelection."Document No.";
                    CandidateSelectionCommittee2."Document Type" := CandidateSelectionCommittee2."document type"::"Formal Interview Invitation";
                    CandidateSelectionCommittee2."Appointed Committee ID" := CandidateSelectionCommittee."Appointed Committee ID";
                    CandidateSelectionCommittee2."Member No." := CandidateSelectionCommittee."Member No.";
                    CandidateSelectionCommittee2.Role := CandidateSelectionCommittee.Role;
                    CandidateSelectionCommittee2.Name := CandidateSelectionCommittee.Name;
                    CandidateSelectionCommittee2.Email := CandidateSelectionCommittee.Email;
                    CandidateSelectionCommittee2."Phone No." := CandidateSelectionCommittee."Phone No.";
                    CandidateSelectionCommittee2.Designation := CandidateSelectionCommittee.Designation;
                    CandidateSelectionCommittee2."Staff No." := CandidateSelectionCommittee."Staff No.";
                // CandidateSelectionCommittee2 .Insert(true);
                until CandidateSelectionCommittee.Next = 0;
            end;
            SelectionHeader.Posted := true;
            SelectionHeader.Modify(true);
            Page.Run(69722, CandidateSelection);
        end;
    end;

    procedure SuggestInterviewCandidates(SelectionHeader: Record "Candidate Selection Header")
    var
        InterviewLine: Record "Candidate Shortlist Matrix";
        JobApplications: Record "Job Applications";
        InterviewLine1: Record "Candidate Interview Line";
        LineNo: Integer;
        TXT001: label 'Job Applicants succesfully suggested for the Vacancy %1';
        TXT002: label 'There are no job applicants found for the Vacancy %1';
        InterviewLine2: Record "Candidate Interview Line";
        TXT003: label 'There are no succesfull candidates found for the Vacancy %1';
    begin
        if SelectionHeader."Source Type" = SelectionHeader."source type"::"Final Shortlisting" then begin
            InterviewLine1.Reset;
            InterviewLine1.SetRange("Document No.", SelectionHeader."Document No.");
            if InterviewLine1.FindSet then
                InterviewLine1.DeleteAll;

            InterviewLine.Reset;
            InterviewLine.SetRange("Document No", SelectionHeader."Source Document No.");
            InterviewLine.SetRange("Vacancy ID", SelectionHeader."Vacancy ID");
            if InterviewLine.FindSet then begin
                repeat
                    //INSERT
                    InterviewLine2.Init;
                    InterviewLine2."Document No." := SelectionHeader."Document No.";
                    InterviewLine2."Document Type" := InterviewLine2."document type"::"Candidate Shortlisting";
                    InterviewLine2."Vacancy ID" := SelectionHeader."Vacancy ID";
                    InterviewLine2."Application No." := InterviewLine."Application No.";
                    InterviewLine2.Validate("Application No.");
                    InterviewLine2.Insert;
                until InterviewLine.Next = 0;
                Message(TXT001, SelectionHeader."Vacancy ID");
            end else begin
                Message(TXT002, SelectionHeader."Vacancy ID");
            end

        end else begin
            //get from previous interview
            InterviewLine1.Reset;
            InterviewLine1.SetRange("Document No.", SelectionHeader."Source Document No.");
            InterviewLine1.SetRange("Interview Panel Outcome", InterviewLine1."interview panel outcome"::Succesful);
            InterviewLine1.SetRange("Vacancy ID", SelectionHeader."Vacancy ID");
            if InterviewLine1.FindSet then begin
                repeat
                    //INSERT
                    InterviewLine2.Init;
                    InterviewLine2."Document No." := SelectionHeader."Document No.";
                    InterviewLine2."Document Type" := InterviewLine2."document type"::"Candidate Shortlisting";
                    InterviewLine2."Vacancy ID" := SelectionHeader."Vacancy ID";
                    InterviewLine2."Application No." := InterviewLine1."Application No.";
                    InterviewLine2.Validate("Application No.");
                    InterviewLine2.Insert;
                until InterviewLine.Next = 0;
                Message(TXT001, SelectionHeader."Vacancy ID");
            end else
                Message(TXT003, SelectionHeader."Vacancy ID");
        end
    end;

    procedure NotifyInterviewCandidates(SelectionHeader: Record "Candidate Selection Header")
    var
        InterviewLine: Record "Candidate Interview Line";
        Body: Text;
        SMTP: Codeunit Mail;
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
    begin
        InterviewLine.Reset;
        InterviewLine.SetRange("Document No.", SelectionHeader."Document No.");
        if InterviewLine.FindSet then begin
            InterviewLine.TestField(Email);
            repeat
            //notify attendees
            // SMTPMailSetup.Get;
            // Email := SMTPMailSetup."Email Address";
            // Email2 := InterviewLine.Email;
            // SMTP.CreateMessage(Email2, Email2,
            //        Email, 'Application' + 'No: ' + InterviewLine."Application No.", '<u>RE:INVITATION FOR AN INTERVIEW</u><BR><BR>' +
            //        'Dear' + ' ' + InterviewLine."First Name" + ',<BR><BR>' +
            //         ' In response to your application for the position of:' + ' <b>' + SelectionHeader."Job Title" + '</b>' + 'you are invited for an interview on ' + Format(InterviewLine."Interview Date") + ' at' + Format(InterviewLine."Interview Start Time") +
            //          '<br>' + 'The interview will be held at ' + ' <b>' + InterviewLine."Interview Venue" + '</b><BR><BR>' +
            //          'You are required to bring a copy and original of all your certificates and testimonials for verification but ensure the originals are returned to you before you leave the venue.<BR><BR>', true);
            // SMTP.AddBodyline('We wish you all the best in you interview.<BR>');
            // SMTP.AddCC(Email2);
            // SMTP.AddBodyline('<BR><BR><b>Kind Regards,' + '<BR><BR>THE HR. Department<BR>');
            // SMTP.Send();

            until InterviewLine.Next = 0;
            InterviewLine.Notified := true;
            InterviewLine."Notified On" := CurrentDatetime;
            InterviewLine.Modify(true);
        end
    end;

    procedure NotifyInterviewPanelist(SelectionHeader: Record "Candidate Selection Header")
    var
        SelectionCommittee: Record "Candidate Selection Panel";
        Body: Text;
        SMTP: Codeunit Mail;
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        SelectionCommittee1: Record "Candidate Selection Panelist";
        FileName: Text;
        FileDirectory: Text;
        InterviewLine: Record "Candidate Interview Line";
    begin
        SelectionCommittee.Reset;
        SelectionCommittee.SetRange("Document No", SelectionHeader."Document No.");
        if SelectionCommittee.FindSet then begin
            repeat
                SelectionCommittee1.Reset;
                SelectionCommittee1.SetRange("Panel ID", SelectionCommittee."Panel ID");
                if SelectionCommittee1.FindSet then begin
                    repeat
                        //LOOP PANELIST
                        SelectionCommittee1.TestField(Email);

                        //notify attendees
                        // SMTPMailSetup.Get;
                        // Email := SMTPMailSetup."Email Address";
                        // Email2 := SelectionCommittee1.Email;
                        // SMTP.CreateMessage(Email2, Email2,
                        //        Email, '<u>RE:INVITATION FOR A SELECTION  PANEL</u>', 'Dear' + SelectionCommittee1.Name + ',<BR><BR>' +
                        //         ' You are hereby notified that  interviews have been scheduled in line with the applications for the vacancy:' +
                        //         ' ' + SelectionHeader."Job Title" + '<br>The following are the details for the interviews:<BR>' +
                        //         'Contact Person Name:' + ' ' + SelectionHeader."Primary Contact Person" + '<BR>' + 'Contact Person Email' + ' ' + SelectionHeader."Primary Contact Email" + '<BR>' +
                        //         ' ' + 'Contact Person Phone:' + ' ' + SelectionHeader."Primary Contact Phone" + '<BR>+Duration:' + ' ' + Format(SelectionHeader."Planned Start Date") + ' ' + 'to' + ' ' + Format(SelectionHeader."Planned end Date"), true);
                        // SMTP.AddBodyline('Thank you for the continued support.<BR>');
                        FileDirectory := 'C:\Files\' + Format(SelectionHeader."Document No.") + '.pdf';
                        FileName := 'Interviewees_' + Format(SelectionHeader."Document No.") + '.pdf';
                        InterviewLine.Reset;
                        InterviewLine.SetRange("Document No.", SelectionHeader."Document No.");
                    // if InterviewLine.FindSet then begin
                    //     Report.SaveAsPdf(69624, FileDirectory, InterviewLine);
                    //     Send interviewwers
                    //  SMTP.AddAttachment(FileDirectory, FileName);
                    // end;
                    // //Add copy of evaluation tool
                    // SMTP.AddCC(Email2);
                    // SMTP.AddBodyline('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');

                    // SMTP.Send();
                    until SelectionCommittee1.Next = 0;
                    SelectionCommittee1.Notified := true;
                    SelectionCommittee1."Notified On" := CurrentDatetime;
                    SelectionCommittee1.Modify(true);
                end
            until SelectionCommittee.Next = 0;
        end
    end;

    procedure NotifyBackgroundCheckResult(BackgroundChecksHeader: Record "Background Checks Header")
    var
        ChecksDocument: Record "Background Checks Document";
        Body: Text;
        SMTP: Codeunit Mail;
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
    begin
        BackgroundChecksHeader.TestField(Email);
        CI.Get;
        //notify attendees
        SMTPMailSetup.Get;
        // Email := SMTPMailSetup."Email Address";
        // Email2 := BackgroundChecksHeader.Email;
        // SMTP.CreateMessage(CI.Name, Email, Email2, 'Application' + 'No: ' + BackgroundChecksHeader."Application No.", '<u>RE:BACKGROUND CHECKS REPORT</u><BR><BR>' +
        //        'Dear' + BackgroundChecksHeader."First Name" + ',<BR><BR>' +
        //         ' You are hereby notified that your background checks has completed in line with the application for the vacancy:' +
        //         ' ' + BackgroundChecksHeader."Vacancy ID" + '<br>The following are the details for the report:<BR>', true);

        // ChecksDocument.Reset;
        // ChecksDocument.SetRange("Document No.", BackgroundChecksHeader."Document No.");
        // if ChecksDocument.FindSet then begin
        //     repeat
        //         SMTP.AddBodyline(ChecksDocument.Description + ' ' + 'Status' + ' ' + Format(ChecksDocument."Clearing Status") + ' ' + 'Reason:' + ChecksDocument."Additional Comments" + '<BR>');

        //     until ChecksDocument.Next = 0;
        // end;
        // SMTP.AddBodyline('Thank you .<BR>');
        // SMTP.AddCC(Email2);
        // SMTP.AddBodyline('<BR><BR><b>Kind Regards,' + '<BR><BR>THE HR. Department<BR>');
        // SMTP.Send();
    end;


    procedure SuggestRefRequirements(RefereeRecommendation: Record "Referee Recommendation")
    var
        LineNo: Integer;
        RefereeRating: Record "Referee Recomm Rating";
        Customer: Record Customer;
        Requirements: Record "Recruitment Req Requirement";
        TXT001: label 'No requirements found for skill and competencies';
    begin
        RefereeRating.Reset;
        RefereeRating.SetRange("Document No.", RefereeRecommendation."Document No.");
        if RefereeRating.FindSet then begin
            RefereeRating.DeleteAll;
        end;
        Requirements.Reset;
        Requirements.SetRange("Document No.", RefereeRecommendation."Vacancy ID");
        Requirements.SetRange("Qualification Category", Requirements."qualification category"::"Skills & Competencies");
        if Requirements.FindSet then begin
            repeat
                RefereeRating."Document No." := RefereeRecommendation."Document No.";
                RefereeRating."Vacancy ID" := RefereeRecommendation."Vacancy ID";
                RefereeRating."Skills and Competency ID" := Requirements."Line No.";
                RefereeRating."Qualification Code" := Requirements."Qualification Code";
                RefereeRating.Description := Requirements.Description;
                RefereeRating.Insert(true);
            until Requirements.Next = 0;
        end else
            Error(TXT001);
    end;

    procedure NotifyReferee(BackgroundChecksHeader: Record "Background Checks Reference")
    var
        ChecksReference: Record "Background Checks Reference";
        Body: Text;
        SMTP: Codeunit Mail;
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
    begin
        BackgroundChecksHeader.TestField(Email);
        CI.Get;

        //notify attendees
        // SMTPMailSetup.Get;
        // Email := SMTPMailSetup."Email Address";
        // Email2 := BackgroundChecksHeader.Email;
        // SMTP.CreateMessage(CI.Name, Email, BackgroundChecksHeader.Email, 'Application' + 'No: ' + BackgroundChecksHeader."Application No.", '<u>RE:BACKGROUND CHECKS REPORT</u><BR><BR>' +
        // 'Dear' + BackgroundChecksHeader.Name + ',<BR><BR>' +
        // ' Kindly provide your background check on the copied herein candidate for the vacancy:' +
        // ' ' + BackgroundChecksHeader."Vacancy Id" + '<br>The following are the details for the report:<BR>', true);
        // //send pdf report
        // SMTP.AddBodyline('Thank you for your support.<BR>');
        // SMTP.AddCC(BackgroundChecksHeader.Email);
        // SMTP.AddBodyline('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
        // // SMTP.Send();

        BackgroundChecksHeader."Invited for Detailed Recommend" := true;
        BackgroundChecksHeader."Invited On" := CurrentDatetime;

        BackgroundChecksHeader.Modify(true);
    end;


    procedure CreateEmploymentOffer(BackgroundChecksHeader: Record "Background Checks Header")
    var
        EmploymentOffer: Record "Employment Offer";
        HumanResourcesSetup: Record "Human Resources Setup";
        OfferNo: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Employment Offer Nos.");
        NoSeriesMgt.InitSeries(HumanResourcesSetup."Employment Offer Nos.", HumanResourcesSetup."Employment Offer Nos.", 0D, OfferNo, HumanResourcesSetup."Employment Offer Nos.");
        EmploymentOffer."Offer ID" := OfferNo;
        EmploymentOffer."Document Date" := Today;
        EmploymentOffer."Panel Interview Report ID" := BackgroundChecksHeader."Panel Interview Report ID";
        EmploymentOffer."Application No." := BackgroundChecksHeader."Application No.";
        EmploymentOffer.Validate("Application No.");
        EmploymentOffer."Created By" := UserId;
        EmploymentOffer."Lead HR Officer" := BackgroundChecksHeader."Lead HR Officer";
        EmploymentOffer."Employment Start Date" := Today;
        EmploymentOffer."Payroll Start Period" := Today;
        EmploymentOffer."Created On" := CurrentDatetime;
        EmploymentOffer.Insert(true);
        Message('Offer No %1 created successfully', EmploymentOffer."Offer ID");
        Page.Run(69764, EmploymentOffer);
    end;


    procedure SuggestMedicalQuestions(PreHireMedicalReport: Record "PreHire Medical Report")
    var
        LineNo: Integer;
        ReportLines: Record "Prehire Medical Report Lines";
        ReportLines1: Record "Prehire Medical Report Lines";
        MedicalChecksTemplate: Record "Medical Checks Template";
        TemplateLine: Record "Medical Checks Template Line";
        TXT001: label 'No Questions found on the template selected--%1';
    begin
        PreHireMedicalReport.TestField("Medical Checks Template");
        ReportLines1.Reset;
        ReportLines1.SetRange("Document No.", PreHireMedicalReport."Document No.");
        if ReportLines1.FindSet then begin
            ReportLines1.DeleteAll;
        end;
        MedicalChecksTemplate.Reset;
        MedicalChecksTemplate.SetRange("Template ID", PreHireMedicalReport."Medical Checks Template");
        if MedicalChecksTemplate.FindFirst then begin
            TemplateLine.Reset;
            TemplateLine.SetRange("Template Id", MedicalChecksTemplate."Template ID");
            if TemplateLine.FindSet then begin
                repeat
                    ReportLines."Line No." := TemplateLine."Line No.";
                    ReportLines."Medical History Type" := TemplateLine."Medical History Type";
                    ReportLines.Code := TemplateLine.Code;
                    ReportLines."Document No." := PreHireMedicalReport."Document No.";
                    ReportLines.Description := TemplateLine.Description;
                    ReportLines.Insert;
                until TemplateLine.Next = 0;
            end else
                Error(TXT001, PreHireMedicalReport."Medical Checks Template");
        end
    end;

    procedure SendOfferLetter(EmploymentOffer: Record "Employment Offer")
    var
        Compensation: Record "Employment Offer Compensation";
        Body: Text;
        SMTP: Codeunit Mail;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        TXT001: label 'The notification has been succesfully sent to %1';
        FileDirectory: Text;
        FileName: Text;
        HumanResourcesSetup: Record "Human Resources Setup";
    begin
        EmploymentOffer.TestField(Email);
        CI.Get;
        SMTPMailSetup.Get;
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Recruitment File Path");
        // SMTP.CreateMessage(CI.Name, SMTPMailSetup."Email Address", EmploymentOffer.Email, 'Application' + 'No: ' + EmploymentOffer."Application No.", '<u>RE:OFFER OF APPOINTMENT</u><BR><BR>' +
        // 'Dear' + EmploymentOffer."First Name" + ',<BR><BR>' +
        // 'Following the recent interviews, in which you were interviewed for the position of ' + '<b>' + EmploymentOffer."Job Title/Designation" + '.</b><br> We are glad to inform you thaT you were successful.<BR>' +
        // 'You are required to liase with Head of HR, KeRRA for engagement/offer details.<BR>' +
        // 'We take this opportunity to congratulate you on this appointment and wish you well on your new assignment.<BR>', true);
        // //SMTP.AddBodyline('We Look foward to earing from you.<BR>');
        // //attach offer letter
        // //69628
        // FileDirectory := HumanResourcesSetup."Recruitment File Path";
        // FileName := 'Employment_Offer.pdf';
        // Report.SaveAsPdf(69628, FileDirectory + FileName, EmploymentOffer);
        // SMTP.AddAttachment(FileDirectory + FileName, FileName);
        // SMTP.AddCC(SMTPMailSetup."Email Address");
        // SMTP.AddBodyline('<BR><BR><b>Kind Regards,' + '<BR><BR>THE HR. Department<BR>');
        // SMTP.Send();
        Message(TXT001, EmploymentOffer."Application No." + ' ' + EmploymentOffer."First Name");

    end;

    procedure GenerateContractForApplicant(EmploymentOffer: Record "Employment Offer")
    var
        TXT001: label 'The notification has been succesfully sent to %1';
        Employee: Record Employee;
        EmployeeQualification: Record "Employee Qualification";
        HumanResourcesSetup: Record "Human Resources Setup";
        EmployeeNo: Code[30];
        Applicant: Record Applicant;
        ApplicantQualificationHistor: Record "Job Applicants Qualification";
        TXT002: label 'Employee assigned number is %1,and qualifications updated sucesfully';
        TXT003: label 'Qualifications for the existing employee %1 updated succesfully';
        ApplicantQualification1: Record "Employee Qualification";
    begin
        //generate contract if its contract based
        //generate employee
        Employee.Reset;
        Employee.SetRange("ID Number", Format(EmploymentOffer."ID Number"));
        if not Employee.FindFirst then begin
            Applicant.Reset;
            Applicant.SetRange("Candidate No.", EmploymentOffer."Candidate No.");
            if Applicant.FindFirst then begin
                Employee."No." := '';
                Employee."First Name" := Applicant."First Name";
                Employee."Middle Name" := Applicant."Middle Name";
                Employee."Last Name" := Applicant."Last Name";
                Employee."E-Mail" := Applicant."E-Mail";
                Employee."Company E-Mail" := Applicant."E-Mail";
                Employee."Birth Date" := Applicant."Birth Date";
                Employee."Phone No." := Applicant."Phone No.";
                Employee."Directorate Code" := EmploymentOffer.Directorate;
                Employee.Department := EmploymentOffer.Department;
                Employee."Department Code" := EmploymentOffer.Department;
                Employee."Mobile Phone No." := Applicant."Mobile Phone No.";
                Employee."Post Code" := Applicant."Post Code";
                Employee.Validate("Post Code");
                Employee."ID Number" := Format(EmploymentOffer."ID Number");
                Employee."Current Position ID" := EmploymentOffer."Position ID";
                Employee."Current Job Grade" := EmploymentOffer."Job Grade ID";
                Employee."Current Duty Station" := EmploymentOffer."Duty Station ID";
                Employee.Gender := EmploymentOffer.Gender;
                Employee."Date Of Birth" := EmploymentOffer."Birth Date";
                Employee."PIN Number" := EmploymentOffer."Tax Regitration(PIN)";
                Employee.Address := EmploymentOffer.Address;
                Employee."Address 2" := EmploymentOffer."Address 2";
                Employee.Position := EmploymentOffer."Position ID";
                Employee."Current Terms of Service" := EmploymentOffer."Terms of Service";
                Employee.Insert(true);

                //employee qualifications
                ApplicantQualificationHistor.Reset;
                ApplicantQualificationHistor.SetRange("Candidate No.", EmploymentOffer."Candidate No.");
                if ApplicantQualificationHistor.FindSet then begin
                    repeat
                        EmployeeQualification."Employee No." := Employee."No.";
                        EmployeeQualification."Line No." := ApplicantQualificationHistor."Line No.";
                        EmployeeQualification."Qualification Code" := ApplicantQualificationHistor."Qualification Code";
                        EmployeeQualification."From Date" := ApplicantQualificationHistor."From Date";
                        EmployeeQualification."To Date" := ApplicantQualificationHistor."To Date";
                        EmployeeQualification.Type := ApplicantQualificationHistor.Type;
                        EmployeeQualification.Description := ApplicantQualificationHistor.Description;
                        EmployeeQualification."Institution/Company" := ApplicantQualificationHistor."Institution/Company";
                        EmployeeQualification.Insert(true);
                    until ApplicantQualificationHistor.Next = 0;
                end;

            end;
            Message(TXT002, Employee."No.");
        end else begin
            ApplicantQualification1.Reset;
            ApplicantQualification1.SetRange("Employee No.", Employee."No.");
            if ApplicantQualification1.FindSet then begin
                ApplicantQualification1.DeleteAll
            end;
            //employee qualifications
            ApplicantQualificationHistor.Reset;
            ApplicantQualificationHistor.SetRange("Candidate No.", EmploymentOffer."Candidate No.");
            if ApplicantQualificationHistor.FindSet then begin
                repeat
                    EmployeeQualification."Employee No." := Employee."No.";
                    EmployeeQualification."Line No." := ApplicantQualificationHistor."Line No.";
                    EmployeeQualification."Qualification Code" := ApplicantQualificationHistor."Qualification Code";
                    EmployeeQualification."From Date" := ApplicantQualificationHistor."From Date";
                    EmployeeQualification."To Date" := ApplicantQualificationHistor."To Date";
                    EmployeeQualification.Type := ApplicantQualificationHistor.Type;
                    EmployeeQualification.Description := ApplicantQualificationHistor.Description;
                    EmployeeQualification."Institution/Company" := ApplicantQualificationHistor."Institution/Company";
                    EmployeeQualification.Insert(true);
                until ApplicantQualificationHistor.Next = 0;
            end;
            Message(TXT003, Employee."No.");
        end;
        EmploymentOffer."Employee No." := Employee."No.";
        EmploymentOffer."Employee Contract No." := Employee."No.";
        EmploymentOffer."Document Status" := EmploymentOffer."document status"::Closed;
        EmploymentOffer.Modify(true);
    end;

    procedure FnSuggestapplicants(CandidateSelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
    begin
        JobApplications.Reset;
        JobApplications.SetRange("Vacancy Id", CandidateSelectionHeader."Vacancy ID");
        if JobApplications.FindSet then begin
            repeat
                CandidateShortlistMatrix.Init;
                CandidateShortlistMatrix."Document Type" := CandidateSelectionHeader."Document Type";
                CandidateShortlistMatrix."Document No" := CandidateSelectionHeader."Document No.";
                CandidateShortlistMatrix."Vacancy ID" := CandidateSelectionHeader."Vacancy ID";
                CandidateShortlistMatrix."Application No." := JobApplications."Application No.";
                CandidateShortlistMatrix."Candidate No" := JobApplications."Candidate No.";
                CandidateShortlistMatrix."First Name" := JobApplications."First Name";
                CandidateShortlistMatrix."Middle Name" := JobApplications."Middle Name";
                CandidateShortlistMatrix."Last Name" := JobApplications."Last Name";
                CandidateShortlistMatrix."Phone No." := JobApplications."Phone No.";
                CandidateShortlistMatrix."Mobile Phone No." := JobApplications."Mobile Phone No.";
                CandidateShortlistMatrix.Email := JobApplications."E-Mail";
                CandidateShortlistMatrix."Birth Date" := JobApplications."Birth Date";
                CandidateShortlistMatrix."Management Experience (Years)" := JobApplications."Management Experience (Years)";
                CandidateShortlistMatrix."Work Experience (Years)" := JobApplications."Work Experience (Years)";
                CandidateShortlistMatrix.Gender := JobApplications.Gender;
                CandidateShortlistMatrix."Passport No." := JobApplications."Passport No.";
                CandidateShortlistMatrix."Tax Registration No." := JobApplications."PIN Registration";
                CandidateShortlistMatrix."ID Number" := JobApplications."ID Number";
                CandidateShortlistMatrix."Marital Status" := JobApplications."Marital Status";
                CandidateShortlistMatrix."Ethnic Group" := JobApplications."Ethnic Group";
                CandidateShortlistMatrix.Religion := JobApplications.Religion;
                CandidateShortlistMatrix.Disabled := JobApplications.Disabled;
                CandidateShortlistMatrix."Disability Code" := JobApplications."Disability Code";
                CandidateShortlistMatrix."Disability Description" := JobApplications."Disability Description";
                CandidateShortlistMatrix."Disability Certificate No" := JobApplications."Disability Certificate No";
                CandidateShortlistMatrix."Specialization Area" := JobApplications."Specialization Area";
                CandidateShortlistMatrix.Nationality := JobApplications.Nationality;
                CandidateShortlistMatrix."Qualification Name" := JobApplications."Qualification Name";
                CandidateShortlistMatrix."Highest Academic Qualification" := JobApplications."Highest Academic Qualification";
            //CandidateShortlistMatrix .Insert(true);
            until JobApplications.Next = 0;
            Message('Successful');
        end;
    end;


    procedure SuggestTemplateScoreGuide(HRScreeningTemplate: Record "HR Screening Template")
    var
        DefaultScoreGuide: Record "Closed Qn Response Option";
        TemplateScoreGuide: Record "Screening Template Score Guide";
        LineNo: Integer;
        TemplateLine: Record "Hr Screening Template Line";
        TXT001: label 'The score guide  for the template %1 has been updated succesfully';
    begin
        TemplateScoreGuide.Reset;
        TemplateScoreGuide.SetRange("Template ID", HRScreeningTemplate.Code);
        if TemplateScoreGuide.FindSet then begin
            TemplateScoreGuide.DeleteAll;
        end;
        TemplateLine.Reset;
        TemplateLine.SetRange("Template ID", HRScreeningTemplate.Code);
        if TemplateLine.FindSet then begin
            repeat
                //check score guide
                DefaultScoreGuide.Reset;
                DefaultScoreGuide.SetRange("Type ID", TemplateLine."Default Rating Scale");
                if DefaultScoreGuide.FindSet then begin
                    repeat
                        //initialize
                        TemplateScoreGuide."Template Type" := HRScreeningTemplate."Template Type";
                        TemplateScoreGuide."Template ID" := HRScreeningTemplate.Code;
                        TemplateScoreGuide."Question Category" := TemplateLine."Question Category";
                        TemplateScoreGuide."Question ID" := TemplateLine."Question Id";
                        TemplateScoreGuide."Default Rating Scale" := TemplateLine."Default Rating Scale";
                        TemplateScoreGuide."Option Code" := DefaultScoreGuide."Option Code";
                        TemplateScoreGuide.Description := DefaultScoreGuide.Description;
                        TemplateScoreGuide."Default Points" := DefaultScoreGuide."Default Points";
                        TemplateScoreGuide.Insert(true);

                    until DefaultScoreGuide.Next = 0;
                end
            until TemplateLine.Next = 0;
            Message(TXT001, TemplateLine."Template ID");
        end
    end;

    procedure FnShortlistBasedOnDefinedParameters2(SelectionHeader: Record "Candidate Selection Header")
    var
        JobApplications: Record "Job Applications";
        EntryNo: Integer;
        Passed: Boolean;
        SelectionLine: Record "Candidate Shortlist Matrix";
        Qualification: Record Qualification;
        Qualification1: Record Qualification;
        HierarchyCode: Integer;
    begin
        JobApplications.Reset;
        //JobApplications.SETRANGE("Application Status",JobApplications."Application Status"::"System Shortlisting");
        JobApplications.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
        if JobApplications.FindSet then begin
            repeat
                if SelectionHeader."Minimum Academic Qualification" <> '' then begin
                    Qualification.Reset;
                    Qualification.SetRange(Code, JobApplications."Highest Academic Qualification");
                    if Qualification.FindSet then begin
                        repeat
                            if Qualification."Academic Hierachy Code" >= SelectionHeader."Min Academic Hierarchy Pointer" then begin
                                JobApplications.Reset;
                                JobApplications.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
                                JobApplications.SetFilter("Work Experience (Years)", '>=%1', SelectionHeader."Minimum Work Experience");
                                if JobApplications.FindSet then begin
                                    JobApplications.Reset;
                                    JobApplications.SetRange("Vacancy Id", SelectionHeader."Vacancy ID");
                                    JobApplications.SetFilter("Management Experience (Years)", '>=%1', SelectionHeader."Minimum Mngmnt Experience");
                                    if JobApplications.FindSet then begin
                                        repeat
                                            SelectionLine.Init;
                                            SelectionLine."Document Type" := SelectionLine."document type"::"Candidate Shortlisting";
                                            SelectionLine."Document No" := SelectionHeader."Document No.";
                                            SelectionLine."Application No." := JobApplications."Application No.";
                                            SelectionLine.Validate("Application No.");
                                        //  SelectionLine .Insert(true);
                                        until JobApplications.Next = 0;
                                        Message('Successfully');
                                    end else begin
                                        CreateFailedApplicantMgmnt(JobApplications, SelectionHeader);
                                    end
                                end else begin
                                    CreateFailedApplicantGen(JobApplications, SelectionHeader);
                                end;
                            end else begin
                                CreateFailedApplicantAcc(JobApplications, SelectionHeader);
                            end;
                        until Qualification.Next = 0;
                    end;
                end;
            until JobApplications.Next = 0;
        end;
    end;

    procedure AppointCommiteeeMembers(AppointmentVoucher: Record "Commitee Appointment Voucher")
    var
        CommiteeAppointedMember: Record "Commitee Appointed Member";
        Body: Text;
        SMTP: Codeunit Mail;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        TXT001: label 'The notification has been succesfully sent to %1';
        HRSetup: Record "Human Resources Setup";
    begin
        CI.Get;
        HRSetup.Get;
        HRSetup.TestField("HR E-mail Address");
        SMTPMailSetup.Get;
        CommiteeAppointedMember.Reset;
        CommiteeAppointedMember.SetRange("Document No.", AppointmentVoucher."Document No.");
        if CommiteeAppointedMember.FindSet then begin
            repeat
                // CommiteeAppointedMember.TestField("Member Email");
                // SMTP.CreateMessage(CI.Name, SMTPMailSetup."Email Address", CommiteeAppointedMember."Member Email", 'COMMITEE APPOINTMENT', '<u>RE:COMMITEE APPOINTMENT</u><BR><BR>' +
                // 'Dear' + ' ' + CommiteeAppointedMember."Member Name" + ',<BR><BR>' +
                // 'The Authority is in the process of recruiting person(s) to fill the position of' + ' <b>' + AppointmentVoucher."Vacancy Name" + '</b>, <BR><BR>' +
                // 'In this regard, you are hereby apointed as a member of the interview panel. In the committee, you will be required to access candidates for sustainability and submit a report within 7 days of conclusion of the exercise.' + ' <BR><BR> ' +
                // ' ' + 'The Appointment is effective from' + ' <b>' + Format(AppointmentVoucher."Appointment Effective Date") + '</b> ' + 'to' + ' <b>' + Format(AppointmentVoucher."Tenure End Date") + '</b>.<br>', true);
                // SMTP.AddCC(SMTPMailSetup."Email Address");
                // SMTP.AddCC(HRSetup."HR E-mail Address");
                // SMTP.AddBodyline('<BR><BR><b>Signed,' + '<BR><BR>DG<BR>');
                // SMTP.Send();
                CommiteeAppointedMember."Notified on Email" := true;
                CommiteeAppointedMember."Date/Time Notified" := CurrentDatetime;
                CommiteeAppointedMember.Modify(true);
            until CommiteeAppointedMember.Next = 0;
            Message(TXT001, AppointmentVoucher."Document No.");
        end
    end;

    procedure PostInterviewRecord(CandidateInterviewRecord: Record "Candidate Interview Record")
    var
        ChecksDocument: Record "Candidate Interview Qn Group";
        Body: Text;
        SMTP: Codeunit Mail;
        Email: Text;
        Email2: Text;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        CandidateInterviewLine: Record "Candidate Interview Line";
        TXT001: label 'Interview results updated succesfully';
    begin
        CI.Get;
        CandidateInterviewLine.Reset;
        CandidateInterviewLine.SetRange("Document No.", CandidateInterviewRecord."Interview Invitation No.");
        CandidateInterviewLine.SetRange("Application No.", CandidateInterviewRecord."Application No.");
        if CandidateInterviewLine.FindFirst then begin
            CandidateInterviewLine."Interview Panel Outcome" := CandidateInterviewRecord."Panel Interview Outcome";
            CandidateInterviewLine."Interview Panel Remarks" := CandidateInterviewRecord."Panelist Interview Remarks";
            CandidateInterviewRecord.CalcFields("Panel Interview Score %");
            CandidateInterviewLine."Interview Panel Score %" := CandidateInterviewRecord."Panel Interview Score %";
            CandidateInterviewLine."Unsuccesful Application Reason" := CandidateInterviewRecord."Unsuccesful App Reason Code";
            CandidateInterviewLine.Modify(true);

            Message(TXT001);
        end

    end;

    procedure SendRegretLetter(CandidateSelectionHeader: Record "Candidate Selection Header")
    var
        Body: Text;
        SMTP: Codeunit Mail;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        TXT001: label 'The notification has been succesfully sent to %1';
        FileDirectory: Text;
        FileName: Text;
        HumanResourcesSetup: Record "Human Resources Setup";
        JobApplications: Record "Job Applications";
        CandidateShortlistMatrix: Record "Candidate Shortlist Matrix";
        TXT002: label 'Notifications sent succesfully';
    begin
        CI.Get;
        SMTPMailSetup.Get;
        HumanResourcesSetup.Get;
        HumanResourcesSetup.TestField("Recruitment File Path");
        JobApplications.Reset;
        JobApplications.SetRange("Vacancy Id", CandidateSelectionHeader."Vacancy ID");
        if JobApplications.FindSet then begin
            repeat
                CandidateShortlistMatrix.Reset;
                CandidateShortlistMatrix.SetRange("Document No", CandidateSelectionHeader."Document No.");
                CandidateShortlistMatrix.SetRange("Application No.", JobApplications."Application No.");
                if not CandidateShortlistMatrix.FindSet then begin
                    //send regret email
                    // SMTP.CreateMessage(CI.Name, SMTPMailSetup."Email Address", JobApplications."E-Mail", 'Application' + 'No: ' + JobApplications."Application No.", '<u>RE:REGRET LETTER</u><BR><BR>' +
                    // 'Dear' + ' ' + JobApplications."First Name" + ',<BR><BR>' +
                    // 'We regret to notify you that you have not qualified for the vacancy:' + ' ' + JobApplications."Job Title/Designation", true);
                    // SMTP.AddBodyline('<BR><BR>Thank you for the interest in working with us.<BR>');
                    // //attach regret letter
                    // FileDirectory := HumanResourcesSetup."Recruitment File Path";
                    // FileName := 'Employment_Regret.pdf';
                    // Report.SaveAsPdf(69611, FileDirectory + FileName, JobApplications);
                    // SMTP.AddAttachment(FileDirectory + FileName, FileName);
                    // SMTP.AddCC(SMTPMailSetup."Email Address");
                    // SMTP.AddBodyline('<BR><BR><b>Kind Regards,' + '<BR><BR>THE Hr. Department<BR>');
                    // SMTP.Send();
                end;
            until JobApplications.Next = 0;
            Message(TXT002);

        end;


    end;

    procedure SuggestOfferEarningsDeductions(EmploymentOffer: Record "Employment Offer")
    var
        Compensation: Record "Employment Offer Compensation";
        Body: Text;
        SMTP: Codeunit Mail;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        TXT001: label 'The notification has been succesfully sent to %1';
        FileDirectory: Text;
        FileName: Text;
        HumanResourcesSetup: Record "Human Resources Setup";
        ScaleBenefits: Record "Scale Benefits";
        Compensation1: Record "Employment Offer Compensation";
    begin
        ScaleBenefits.Reset;
        ScaleBenefits.SetRange("Salary Scale", EmploymentOffer."Job Grade ID");
        ScaleBenefits.SetAscending("Salary Pointer", true);
        if ScaleBenefits.FindSet then begin
            repeat
                //insert
                Compensation.Reset;
                Compensation.SetRange("Offer ID", EmploymentOffer."Offer ID");
                Compensation.SetRange("Earnings Code", ScaleBenefits."ED Code");
                if not Compensation.FindFirst then begin
                    Compensation1."Offer ID" := EmploymentOffer."Offer ID";
                    Compensation1."Earnings Code" := ScaleBenefits."ED Code";
                    Compensation1.Description := ScaleBenefits."ED Description";
                    Compensation.Validate("Earnings Code");
                    Compensation1."Line Amount" := ScaleBenefits.Amount;
                    Compensation1."Line Amount(LCY)" := ScaleBenefits.Amount;
                    Compensation1.Insert(true);
                end;
            until ScaleBenefits.Next = 0;
        end


    end;

    procedure FnAppointHRCommiteeeMembers(AppointmentVoucher: Record "Commitee Appointment Voucher")
    var
        CommiteeAppointedMember: Record "Commitee Appointed Member";
        Body: Text;
        SMTP: Codeunit Mail;
        SMTPMailSetup: Record "Email Account";
        Counter: Integer;
        CI: Record "Company Information";
        TXT001: label 'The notification has been succesfully sent to %1';
        HRSetup: Record "Human Resources Setup";
    begin
        CI.Get;
        HRSetup.Get;
        HRSetup.TestField("HR E-mail Address");
        SMTPMailSetup.Get;
        CommiteeAppointedMember.Reset;
        CommiteeAppointedMember.SetRange("Document No.", AppointmentVoucher."Document No.");
        if CommiteeAppointedMember.FindSet then begin
            repeat
                // CommiteeAppointedMember.TestField("Member Email");
                // SMTP.CreateMessage(CI.Name, SMTPMailSetup."Email Address", CommiteeAppointedMember."Member Email", 'COMMITEE APPOINTMENT', '<u>RE:COMMITEE APPOINTMENT</u><BR><BR>' +
                // 'Dear' + ' ' + CommiteeAppointedMember."Member Name" + ',<BR><BR>' +
                // 'You have been Appointed into the .' + AppointmentVoucher.Description + ' <BR><BR> ' +
                // ' ' + 'The Appointment is effective from' + ' <b>' + Format(CommiteeAppointedMember."Effective Date") + '</b> ' + 'to' + ' <b>' + Format(AppointmentVoucher."Tenure End Date") + '</b>.<br>', true);
                // SMTP.AddCC(SMTPMailSetup."Email Address");
                // SMTP.AddCC(HRSetup."HR E-mail Address");
                // SMTP.AddBodyline('<BR><BR><b>Signed,' + '<BR><BR>DG<BR>');
                // SMTP.Send();
                // CommiteeAppointedMember."Notified on Email" := true;
                CommiteeAppointedMember."Date/Time Notified" := CurrentDatetime;
                CommiteeAppointedMember.Modify(true);
            until CommiteeAppointedMember.Next = 0;
            Message(TXT001, AppointmentVoucher."Document No.");
        end
    end;
}

