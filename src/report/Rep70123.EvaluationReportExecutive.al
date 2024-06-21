#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70123 "Evaluation Report Executive"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Evaluation Report Executive.rdlc';

    dataset
    {
        dataitem("Bid Tabulation Header"; "Bid Tabulation Header")
        {
            RequestFilterFields = Code;
            column(ReportForNavId_1; 1)
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
            column(CIPhoneNo; CompanyInformation."Phone No.")
            {
            }
            column(CIPic; CompanyInformation.Picture)
            {
            }
            column(CIEmail; CompanyInformation."E-Mail")
            {
            }
            column(CIWebsite; CompanyInformation."Home Page")
            {
            }
            column(CIMotto; CompanyInformation.Motto)
            {
            }
            column(MonthName; MonthName)
            {
            }
            column(Year; Year)
            {
            }
            column(CIContactPersom; UpperCase(CompanyInformation."Contact Person"))
            {
            }
            column(Code_BidTabulationHeader; "Bid Tabulation Header".Code)
            {
            }
            column(IFSCode_BidTabulationHeader; "Bid Tabulation Header"."IFS Code")
            {
            }
            column(DocumentDate_BidTabulationHeader; "Bid Tabulation Header"."Document Date")
            {
            }
            column(TenderName_BidTabulationHeader; "Bid Tabulation Header"."Tender Name")
            {
            }
            column(ProgramTitle_BidTabulationHeader; "Bid Tabulation Header"."Program Title")
            {
            }
            column(ExecutiveSummary_BidTabulationHeader; "Bid Tabulation Header"."Executive Summary")
            {
            }
            column(LocationofProject_BidTabulationHeader; "Bid Tabulation Header"."Location of Project")
            {
            }
            column(ExtentofContract_BidTabulationHeader; "Bid Tabulation Header"."Extent of Contract")
            {
            }
            column(InvitationtoTender_BidTabulationHeader; "Bid Tabulation Header"."Invitation to Tender")
            {
            }
            column(PrebidSiteVisitMeeting_BidTabulationHeader; "Bid Tabulation Header"."Prebid Site Visit & Meeting")
            {
            }
            column(BidNotices_BidTabulationHeader; "Bid Tabulation Header"."Bid Notices")
            {
            }
            column(LastEvaluationVersionNo_BidTabulationHeader; "Bid Tabulation Header"."Last Evaluation Version No.")
            {
            }
            column(EvaluationVersionNo; EvaluationVersionNo)
            {
            }
            dataitem("Standard Purchase Code"; "Standard Purchase Code")
            {
                DataItemLink = Code = field("IFS Code");
                column(ReportForNavId_25; 25)
                {
                }
                column(Code_StandardPurchaseCode; "Standard Purchase Code".Code)
                {
                }
                column(RequestingDirectorate_StandardPurchaseCode; "Standard Purchase Code"."Requesting Directorate")
                {
                }
                column(LastEvaluationVersionNo_StandardPurchaseCode; "Standard Purchase Code"."Last Evaluation Version No.")
                {
                }
                column(DirectorateName; UpperCase(DirectorateName))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ResponsibilityCenter.Reset;
                    ResponsibilityCenter.SetRange(ResponsibilityCenter.Code, "Standard Purchase Code"."Requesting Directorate");
                    if ResponsibilityCenter.FindSet then
                        DirectorateName := ResponsibilityCenter.Name;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //"Payment Month":=LOWERCASE(FORMAT("Document Date",0,'<Month Text>'));
                MonthName := Lowercase(Format("Bid Tabulation Header"."Document Date", 0, '<Month Text>'));
                Year := Date2dmy("Bid Tabulation Header"."Document Date", 3);
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        Vendors: Record Vendor;
        VendorName: Text[250];
        CompanyInformation: Record "Company Information";
        EvaluationVersionNo: Integer;
        StandardPurchaseCode: Record "Standard Purchase Code";
        MonthName: Code[40];
        Year: Integer;
        ResponsibilityCenter: Record "Responsibility Center";
        DirectorateName: Text[100];
}

