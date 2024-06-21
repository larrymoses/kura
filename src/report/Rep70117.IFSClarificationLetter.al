#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70117 "IFS Clarification Letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/IFS Clarification Letter.rdlc';

    dataset
    {
        dataitem(Bid_Lines;"Tender Addendum Notice")
        {
            column(ReportForNavId_78; 78)
            {
            }
            column(CompanyName;Corec.Name)
            {
            }
            column(Logo;Corec.Picture)
            {
            }
            column(PhysicalAddress;Corec."Address 2")
            {
            }
            column(COAddress;Corec.Address)
            {
            }
            column(TelNo;Corec."Phone No.")
            {
            }
            column(MobileNo;Corec."Phone No. 2")
            {
            }
            column(Email;Corec."E-Mail")
            {
            }
            column(City;Corec.City)
            {
            }
            column(Website;Corec."Home Page")
            {
            }
            column(AddendumNoticeNo_BidLines;Bid_Lines."Addendum Notice No.")
            {
            }
            column(DocumentDate_BidLines;Bid_Lines."Document Date")
            {
            }
            column(TenderDescription_BidLines;Bid_Lines."Tender Description")
            {
            }
            column(InvitationNoticeNo_BidLines;Bid_Lines."Invitation Notice No.")
            {
            }
            column(Description_BidLines;Bid_Lines.Description)
            {
            }
            dataitem(Ammend;"Tender Addendum Amendment")
            {
                DataItemLink = "Addendum Notice No."=field("Addendum Notice No.");
                column(ReportForNavId_1; 1)
                {
                }
                column(AddendumNoticeNo_Ammend;Ammend."Addendum Notice No.")
                {
                }
                column(LineNo_Ammend;Ammend."Line No.")
                {
                }
                column(AmendedSectionofTenderDoc_Ammend;Ammend."Amended Section of Tender Doc")
                {
                }
                column(AmendmentType_Ammend;Ammend."Amendment Type")
                {
                }
                column(AmendmentDescription_Ammend;Ammend."Amendment Description")
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
        Corec.CalcFields(Corec.Picture);
    end;

    var
        Corec: Record "Company Information";
}

