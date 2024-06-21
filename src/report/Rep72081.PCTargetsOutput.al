#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 72081 "PC Targets&Output"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/PC Targets&Output.rdlc';

    dataset
    {
        dataitem("RMS PC Target Header";"RMS PC Target Header")
        {
            column(ReportForNavId_31; 31)
            {
            }
            column(CName;CompanyInformation.Name)
            {
            }
            column(CAddres;CompanyInformation.Address)
            {
            }
            column(CAddress2;CompanyInformation."Address 2")
            {
            }
            column(CCity;CompanyInformation.City)
            {
            }
            column(CPic;CompanyInformation.Picture)
            {
            }
            column(CPhoneNo;CompanyInformation."Phone No.")
            {
            }
            column(CEmail;CompanyInformation."E-Mail")
            {
            }
            column(CWebsite;CompanyInformation."Home Page")
            {
            }
            column(CurrentDate;Format(CurrentDate))
            {
            }
            column(DocumentNo_RMSPCTargetHeader;"RMS PC Target Header"."Document No")
            {
            }
            column(DocumentDate_RMSPCTargetHeader;"RMS PC Target Header"."Document Date")
            {
            }
            column(FinancialYearCode_RMSPCTargetHeader;"RMS PC Target Header"."Financial Year Code")
            {
            }
            column(ProjectType_RMSPCTargetHeader;"RMS PC Target Header"."Project Type")
            {
            }
            column(CreatedDateTime_RMSPCTargetHeader;"RMS PC Target Header"."Created Date/Time")
            {
            }
            column(CreatedBy_RMSPCTargetHeader;"RMS PC Target Header"."Created By")
            {
            }
            column(Blocked_RMSPCTargetHeader;"RMS PC Target Header".Blocked)
            {
            }
            column(NoSeries_RMSPCTargetHeader;"RMS PC Target Header"."No Series")
            {
            }
            dataitem("RMS PC Target Line";"RMS PC Target Line")
            {
                DataItemLink = "Document No"=field("Document No");
                column(ReportForNavId_14; 14)
                {
                }
                column(RegionName;RegionName)
                {
                }
                column(ConstituencyName;ConstituencyName)
                {
                }
                column(DocumentNo_RMSPCTargetLine;"RMS PC Target Line"."Document No")
                {
                }
                column(ProjectType_RMSPCTargetLine;"RMS PC Target Line"."Project Type")
                {
                }
                column(LineNo_RMSPCTargetLine;"RMS PC Target Line"."Line No")
                {
                }
                column(ProjectCode_RMSPCTargetLine;"RMS PC Target Line"."Project Code")
                {
                }
                column(ProjectName_RMSPCTargetLine;"RMS PC Target Line"."Project Name")
                {
                }
                column(WorkplannedLength_RMSPCTargetLine;"RMS PC Target Line"."Workplanned Length")
                {
                }
                column(Progress_RMSPCTargetLine;"RMS PC Target Line"."Progress %")
                {
                }
                column(FinancialYearTarget_RMSPCTargetLine;"RMS PC Target Line"."Financial Year Target")
                {
                }
                column(Q1Target_RMSPCTargetLine;"RMS PC Target Line"."Q1 Target")
                {
                }
                column(Q2Target_RMSPCTargetLine;"RMS PC Target Line"."Q2 Target")
                {
                }
                column(Q3Target_RMSPCTargetLine;"RMS PC Target Line"."Q3 Target")
                {
                }
                column(Q4Target_RMSPCTargetLine;"RMS PC Target Line"."Q4 Target")
                {
                }
                column(Q1Output_RMSPCTargetLine;"RMS PC Target Line"."Q1 Output")
                {
                }
                column(Q2Output_RMSPCTargetLine;"RMS PC Target Line"."Q2 Output")
                {
                }
                column(Q3Output_RMSPCTargetLine;"RMS PC Target Line"."Q3 Output")
                {
                }
                column(Q4Output_RMSPCTargetLine;"RMS PC Target Line"."Q4 Output")
                {
                }
                column(FinancialYearOutput_RMSPCTargetLine;"RMS PC Target Line"."Financial Year Output")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ResponsibilityCenter.Reset;
                    ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"RMS PC Target Line"."Region Code");
                    if ResponsibilityCenter.FindSet then begin
                      RegionName:=ResponsibilityCenter.Name;
                      end;

                    ResponsibilityCenter.Reset;
                    ResponsibilityCenter.SetRange(ResponsibilityCenter.Code,"RMS PC Target Line"."Constituency Code");
                    if ResponsibilityCenter.FindSet then begin
                      ConstituencyName:=ResponsibilityCenter.Name;
                      end;
                end;
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        CurrentDate: Date;
        HasPBRM: Option Yes,No;
        ResponsibilityCenter: Record "Responsibility Center";
        RegionName: Text[250];
        DirectorateName: Text[250];
        ConstituencyName: Text[250];
        FYTarget: Decimal;
        FYOutput: Decimal;
}

