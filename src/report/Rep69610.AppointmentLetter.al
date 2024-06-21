#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69610 "Appointment Letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Appointment Letter.rdlc';

    dataset
    {
        dataitem("Job Applications";"Job Applications")
        {
            RequestFilterFields = "Application No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(FirstName_JobApplications;"Job Applications"."First Name")
            {
            }
            column(MiddleName_JobApplications;"Job Applications"."Middle Name")
            {
            }
            column(LastName_JobApplications;"Job Applications"."Last Name")
            {
            }
            column(FullNames_JobApplications;"Job Applications"."Full Names")
            {
            }
            column(EMail_JobApplications;"Job Applications"."E-Mail")
            {
            }
            column(JobTitleDesignation_JobApplications;"Job Applications"."Job Title/Designation")
            {
            }
            column(DutyStationID_JobApplications;"Job Applications"."Duty Station ID")
            {
            }
            column(WorkLocationDetails_JobApplications;"Job Applications"."Work Location Details")
            {
            }
            column(TermsofServiceCode_JobApplications;"Job Applications"."Terms of Service Code")
            {
            }
            column(EmploymentType_JobApplications;"Job Applications"."Employment Type")
            {
            }
            column(Logo;CI.Picture)
            {
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

