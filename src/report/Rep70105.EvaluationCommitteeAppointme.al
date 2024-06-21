#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 70105 "Evaluation Committee Appointme"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Evaluation Committee Appointme.rdlc';

    dataset
    {
        dataitem("IFS Tender Committee";"IFS Tender Committee")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CompanyName;UpperCase(CompanyInformation.Name))
            {
            }
            column(CompanyAddress;CompanyInformation.Address)
            {
            }
            column(CompanyAddress2;CompanyInformation."Address 2")
            {
            }
            column(CompanyLogo;CompanyInformation.Picture)
            {
            }
            column(DocumentNo_IFSTenderCommittee;"IFS Tender Committee"."Document No.")
            {
            }
            column(CommitteeType_IFSTenderCommittee;"IFS Tender Committee"."Committee Type")
            {
            }
            column(Description_IFSTenderCommittee;"IFS Tender Committee".Description)
            {
            }
            column(AppointmentEffectiveDate_IFSTenderCommittee;"IFS Tender Committee"."Appointment Effective Date")
            {
            }
            column(AppointingAuthority_IFSTenderCommittee;"IFS Tender Committee"."Appointing Authority")
            {
            }
            column(TenderName_IFSTenderCommittee;"IFS Tender Committee"."Tender Name")
            {
            }
            column(ApprovalStatus_IFSTenderCommittee;"IFS Tender Committee"."Approval Status")
            {
            }
            column(PrimaryRegion_IFSTenderCommittee;"IFS Tender Committee"."Primary Region")
            {
            }
            column(PrimaryDirectorate_IFSTenderCommittee;"IFS Tender Committee"."Primary Directorate")
            {
            }
            column(PrimaryDepartment_IFSTenderCommittee;"IFS Tender Committee"."Primary Department")
            {
            }
            column(Blocked_IFSTenderCommittee;"IFS Tender Committee".Blocked)
            {
            }
            column(NoSeries_IFSTenderCommittee;"IFS Tender Committee"."No. Series")
            {
            }
            column(CreatedBy_IFSTenderCommittee;"IFS Tender Committee"."Created By")
            {
            }
            column(CreatedDate_IFSTenderCommittee;"IFS Tender Committee"."Created Date")
            {
            }
            column(CreatedTime_IFSTenderCommittee;"IFS Tender Committee"."Created Time")
            {
            }
            column(IFSCode_IFSTenderCommittee;"IFS Tender Committee"."IFS Code")
            {
            }
            column(DocumentDate_IFSTenderCommittee;"IFS Tender Committee"."Document Date")
            {
            }
            column(DocumentStatus_IFSTenderCommittee;"IFS Tender Committee"."Document Status")
            {
            }
            column(ContractNo_IFSTenderCommittee;"IFS Tender Committee"."Contract No.")
            {
            }
            column(ExternalDocumentNo_IFSTenderCommittee;"IFS Tender Committee"."External Document No")
            {
            }
            column(RaisedBy_IFSTenderCommittee;"IFS Tender Committee"."Raised By")
            {
            }
            column(Name_IFSTenderCommittee;"IFS Tender Committee".Name)
            {
            }
            column(StaffId_IFSTenderCommittee;"IFS Tender Committee"."Staff Id")
            {
            }
            column(Designation_IFSTenderCommittee;"IFS Tender Committee".Designation)
            {
            }
            column(MinRequiredNoofMembers_IFSTenderCommittee;"IFS Tender Committee"."Min Required No. of Members")
            {
            }
            column(ActualNoofCommitteeMemb_IFSTenderCommittee;"IFS Tender Committee"."Actual No. of Committee Memb")
            {
            }
            column(Duration_IFSTenderCommittee;"IFS Tender Committee".Duration)
            {
            }
            column(Location_IFSTenderCommittee;"IFS Tender Committee".Location)
            {
            }
            column(ImprestCreated_IFSTenderCommittee;"IFS Tender Committee"."Imprest Created")
            {
            }
            column(MemoNo_IFSTenderCommittee;"IFS Tender Committee"."Memo No.")
            {
            }
            column(RoadCode_IFSTenderCommittee;"IFS Tender Committee"."Road Code")
            {
            }
            column(RoadSectionNo_IFSTenderCommittee;"IFS Tender Committee"."Road Section No.")
            {
            }
            column(MeasurementSheets_IFSTenderCommittee;"IFS Tender Committee"."Measurement Sheets")
            {
            }
            column(Inspection_IFSTenderCommittee;"IFS Tender Committee".Inspection)
            {
            }
            column(Type_IFSTenderCommittee;"IFS Tender Committee".Type)
            {
            }
            column(PreviousAppointedCommittee_IFSTenderCommittee;"IFS Tender Committee"."Previous Appointed Committee")
            {
            }
            column(DocumentType_IFSTenderCommittee;"IFS Tender Committee"."Document Type")
            {
            }
            column(OpeningTime_IFSTenderCommittee;"IFS Tender Committee"."Opening Time")
            {
            }
            dataitem("IFS Tender Committee Member";"IFS Tender Committee Member")
            {
                DataItemLink = "Document No."=field("Document No.");
                column(ReportForNavId_40; 40)
                {
                }
                column(DocumentNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Document No.")
                {
                }
                column(CommitteeType_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Committee Type")
                {
                }
                column(LineNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Line No")
                {
                }
                column(Role_IFSTenderCommitteeMember;"IFS Tender Committee Member".Role)
                {
                }
                column(MemberNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Member No.")
                {
                }
                column(MemberName_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Member Name")
                {
                }
                column(Designation_IFSTenderCommitteeMember;"IFS Tender Committee Member".Designation)
                {
                }
                column(IDPassportNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Tax Registration (PIN) No.")
                {
                }
                column(MemberEmail_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Member Email")
                {
                }
                column(TelephoneNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Telephone No.")
                {
                }
                column(StaffNo_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Staff  No.")
                {
                }
                column(IFSCode_IFSTenderCommitteeMember;"IFS Tender Committee Member"."IFS Code")
                {
                }
                column(NotifiedonEmail_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Notified on Email")
                {
                }
                column(DateTimeNotified_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Date/Time Notified")
                {
                }
                column(Destination_IFSTenderCommitteeMember;"IFS Tender Committee Member".Destination)
                {
                }
                column(NoofDays_IFSTenderCommitteeMember;"IFS Tender Committee Member"."No. of Days")
                {
                }
                column(TotalAmount_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Total Amount")
                {
                }
                column(Type_IFSTenderCommitteeMember;"IFS Tender Committee Member".Type)
                {
                }
                column(Chairman;(Chairman))
                {
                }
                column(UnitAmount_IFSTenderCommitteeMember;"IFS Tender Committee Member"."Unit Amount")
                {
                }
            }
            dataitem("Bid Opening Register";"Bid Opening Register")
            {
                DataItemLink = Code=field("IFP Code");
                column(ReportForNavId_66; 66)
                {
                }
                column(IFSCode_BidOpeningRegister;"Bid Opening Register"."IFS Code")
                {
                }
                column(Description_BidOpeningRegister;"Bid Opening Register".Description)
                {
                }
                column(TenderName_BidOpeningRegister;"Bid Opening Register"."Tender Name")
                {
                }
                column(BidOpeningDate_BidOpeningRegister;"Bid Opening Register"."Bid Opening Date")
                {
                }
                column(BidOpeningEndDate_BidOpeningRegister;"Bid Opening Register"."Bid Opening End Date")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                CompanyInformation.Get;
                CompanyInformation.CalcFields(Picture);
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        Chairman: Text;
}

