#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 69302 "Annual Training Needs"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Annual Training Needs.rdlc';

    dataset
    {
        dataitem("Training Courses Needs"; "Training Courses Needs")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(Code_TrainingNeedsHeader; "Training Courses Needs"."Entry No.")
            {
            }
            column(Description_TrainingNeedsHeader; "Training Courses Needs"."Course Code")
            {
            }
            column(StartDate_TrainingNeedsHeader; "Training Courses Needs"."Course Description")
            {
            }
            column(EndDate_TrainingNeedsHeader; "Training Courses Needs"."Training Need Code")
            {
            }
            column(YearCode_TrainingNeedsHeader; "Training Courses Needs"."Training Need Description")
            {
            }
            // column(Status_TrainingNeedsHeader;"Training Courses Needs".Status)
            // {
            // }
            // column(Blocked_TrainingNeedsHeader;"Training Courses Needs".Blocked)
            // {
            // }
            // column(CreatedBy_TrainingNeedsHeader;"Training Courses Needs"."Created By")
            // {
            // }
            // column(CreatedOn_TrainingNeedsHeader;"Training Courses Needs"."Created On")
            // {
            // }
            // column(NoofNeeds_TrainingNeedsHeader;"Training Courses Needs"."No. of Needs")
            // {
            // }
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode; CompanyInfo."Post Code")
            {
            }
            column(CompanyCity; CompanyInfo.City)
            {
            }
            column(CompanyPhone; CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax; CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite; CompanyInfo."Home Page")
            {
            }
            dataitem("Training Needs Lines"; "Training Needs Lines")
            {
                DataItemLink = "Training Header No." = field("Entry No.");
                column(ReportForNavId_12; 12)
                {
                }
                column(Description_TrainingNeedsLines; "Training Needs Lines".Description)
                {
                }
                column(Source_TrainingNeedsLines; "Training Needs Lines".Source)
                {
                }
                column(Comments_TrainingNeedsLines; "Training Needs Lines".Comments)
                {
                }
                column(NoofLinkedObjectives_TrainingNeedsLines; "Training Needs Lines"."No. of Linked Objectives")
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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

