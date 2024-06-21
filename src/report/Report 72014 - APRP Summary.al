report 72014 "APRP Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/APRP Summary.rdl';

    dataset
    {
        dataitem("RAM Workplan Header";"RAM Workplan Header")
        {
            RequestFilterFields = "Document No";
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
            column(CIName;CompanyInformation.Name)
            {
            }
            column(CIAddress;CompanyInformation.Address)
            {
            }
            column(CIAddress2;CompanyInformation."Address 2")
            {
            }
            column(CICity;CompanyInformation.City)
            {
            }
            column(CIPic;CompanyInformation.Picture)
            {
            }
            column(CIMotto;CompanyInformation.Motto)
            {
            }
            column(DocumentNo_RAMWorkplanHeader;"RAM Workplan Header"."Document No")
            {
            }
            column(DocumentDate_RAMWorkplanHeader;"RAM Workplan Header"."Document Date")
            {
            }
            column(Description_RAMWorkplanHeader;"RAM Workplan Header".Description)
            {
            }
            column(FinancialYearCode_RAMWorkplanHeader;"RAM Workplan Header"."Financial Year Code")
            {
            }
            column(WorkplanType_RAMWorkplanHeader;"RAM Workplan Header"."Workplan Type")
            {
            }
            column(WorkplanRefNo_RAMWorkplanHeader;"RAM Workplan Header"."Workplan Ref No")
            {
            }
            dataitem("RAM Workplan Line";"RAM Workplan Line")
            {
                DataItemLink = "Document No"=FIELD("Document No");
                RequestFilterFields = Revised;
                column(DocumentNo_RAMWorkplanLine;"RAM Workplan Line"."Document No")
                {
                }
                column(GlobalDimension2Code_RAMWorkplanLine;"RAM Workplan Line"."Global Dimension 2 Code")
                {
                }
                column(FundingSourceName;FundingSourceName)
                {
                }
                column(RegionCode_RAMWorkplanLine;"RAM Workplan Line"."Region Code")
                {
                }
                column(RegionName_RAMWorkplanLine;UPPERCASE("RAM Workplan Line"."Region Name"))
                {
                }
                column(WorkplanType_RAMWorkplanLine;"RAM Workplan Line"."Workplan Type")
                {
                }
                column(ConstituencyCode_RAMWorkplanLine;"RAM Workplan Line"."Constituency Code")
                {
                }
                column(ConstituencyName_RAMWorkplanLine;"RAM Workplan Line"."Constituency Name")
                {
                }
                column(WorkplannedLengthKM_RAMWorkplanLine;"RAM Workplan Line"."Workplanned Length(KM)")
                {
                }
                column(TotalInclVAT_RAMWorkplanLine;"RAM Workplan Line"."Total Incl VAT")
                {
                }
                column(EstimatedProjectCost_RAMWorkplanLine;"RAM Workplan Line"."Estimated Project Cost")
                {
                }
                column(FundingSourceType_RAMWorkplanLine;"RAM Workplan Line"."Funding Source Type")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    FundingSource.RESET;
                    FundingSource.SETRANGE(FundingSource.Code,"RAM Workplan Line"."Global Dimension 2 Code");
                    IF FundingSource.FINDSET THEN BEGIN
                      FundingSourceName:=FundingSource.Description;
                      END;

                    CompanyInfo.Get();
                    CompanyInfo.CalcFields(Picture);
                    FormatAddr.GetCompanyAddr("Region Code", ResponsibilityCenter, CompanyInfo, CompanyAddr);
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

    trigger OnInitReport()
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        CompanyInformation: Record "Company Information";
        FundingSource: Record "Funding Source";
        FundingSourceName: Text[100];
        CompanyInfo: Record "Company Information";
        CompanyAddr: array[8] of Text[100];
        FormatAddr: Codeunit "Format Address";
        ApprovalEntries: Record "Approval Entry";
        Approver: array[10] of Code[50];
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
}

