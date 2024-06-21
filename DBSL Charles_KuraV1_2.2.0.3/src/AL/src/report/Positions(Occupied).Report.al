#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69127 "Positions (Occupied)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Positions (Occupied).rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    Caption = 'Positions (Occupied)';

    dataset
    {
        dataitem("ManPower Planning Lines"; "ManPower Planning Lines")
        {
            DataItemTableView = where("Job Title" = filter(> 0));
            RequestFilterFields = "Entry No";
            column(ReportForNavId_9002; 9002)
            {
            }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(NoofPosts_HRJobs; "Manpower Plan Code")
            {
                IncludeCaption = true;
            }
            column(OccupiedPositions_HRJobs; "Job Title")
            {
                IncludeCaption = true;
            }
            column(JobID_HRJobs; "Entry No")
            {
                IncludeCaption = true;
            }
            column(JobDescription_HRJobs; "Task No")
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            dataitem(Employee; Employee)
            {
                DataItemLink = Position = field("Entry No");
                column(ReportForNavId_1000000001; 1000000001)
                {
                }
                column(No_HREmployees; Employee."No.")
                {
                    IncludeCaption = true;
                }
                column(FirstName_HREmployees; Employee."First Name")
                {
                    IncludeCaption = true;
                }
                column(MiddleName_HREmployees; Employee."Middle Name")
                {
                    IncludeCaption = true;
                }
                column(LastName_HREmployees; Employee."Last Name")
                {
                    IncludeCaption = true;
                }
                column(JobTitle_HREmployees; Employee."Job Title")
                {
                    IncludeCaption = true;
                }
                column(UserID_HREmployees; Employee."User ID")
                {
                    IncludeCaption = true;
                }
            }

            trigger OnAfterGetRecord()
            begin
                Validate("Responsibility Center Code");
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

    trigger OnPreReport()
    begin
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HR_JobsCaptionLbl: label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Jobs_with_OccupantsCaptionLbl: label 'Jobs with Occupants';
        P_O__BoxCaptionLbl: label 'P.O. Box';
}

