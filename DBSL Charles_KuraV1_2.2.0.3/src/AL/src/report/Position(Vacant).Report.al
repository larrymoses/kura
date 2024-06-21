#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69128 "Position (Vacant)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Position (Vacant).rdlc';
    Caption = 'HR Jobs (Vacant)';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("ManPower Planning Lines"; "ManPower Planning Lines")
        {
            DataItemTableView = order(ascending) where("Responsibility Center Code" = filter(> '0'));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Entry No";
            column(ReportForNavId_9002; 9002)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(HR_Jobs_UserID; UserId)
            {
            }
            column(CI_Picture; CI.Picture)
            {
            }
            column(CI_City; CI.City)
            {
            }
            column(CI__Address_2______CI__Post_Code_; CI."Address 2")
            {
            }
            column(CI_Address; CI.Address)
            {
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
            }
            column(HR_Jobs__Job_ID_; "Entry No")
            {
            }
            column(HR_Jobs__Job_Description_; "Task No")
            {
            }
            column(HR_Jobs__No_of_Posts_; "Manpower Plan Code")
            {
            }
            column(HR_Jobs__Position_Reporting_to_; "Job Id")
            {
            }
            column(HR_Jobs__Occupied_Positions_; "Job Title")
            {
            }
            column(HR_Jobs__Vacant_Positions_; "Responsibility Center Code")
            {
            }
            column(HR_JobsCaption; HR_JobsCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Jobs_with_Vacant_PositionsCaption; Jobs_with_Vacant_PositionsCaptionLbl)
            {
            }
            column(P_O__BoxCaption; P_O__BoxCaptionLbl)
            {
            }
            column(HR_Jobs__Job_ID_Caption; FieldCaption("Entry No"))
            {
            }
            column(HR_Jobs__Job_Description_Caption; FieldCaption("Task No"))
            {
            }
            column(HR_Jobs__No_of_Posts_Caption; FieldCaption("Manpower Plan Code"))
            {
            }
            column(HR_Jobs__Position_Reporting_to_Caption; FieldCaption("Job Id"))
            {
            }
            column(HR_Jobs__Occupied_Positions_Caption; FieldCaption("Job Title"))
            {
            }
            column(HR_Jobs__Vacant_Positions_Caption; FieldCaption("Responsibility Center Code"))
            {
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
        //ERROR('');

        CI.Reset;
        CI.Get();
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
        HR_JobsCaptionLbl: label 'HR Jobs';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Jobs_with_Vacant_PositionsCaptionLbl: label 'Jobs with Vacant Positions';
        P_O__BoxCaptionLbl: label 'P.O. Box';
        Userid: label 'USERID';
        HRJobs: Record "ManPower Planning Lines";
        JobIDDesc: Text;
}

