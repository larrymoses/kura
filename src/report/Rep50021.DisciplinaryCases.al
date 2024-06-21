/// <summary>
/// Report Disciplinary Cases (ID 50021).
/// </summary>
report 50021 "Disciplinary Cases"
{
    ApplicationArea = All;
    Caption = 'Disciplinary Cases';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Disciplinary Cases.rdl';

    dataset
    {
        dataitem(HRDisciplinaryCases; "HR Disciplinary Cases")
        {
            DataItemTableView = sorting("Employee No", "Case Number")order(ascending);
            RequestFilterFields = "Employee No", "Type of Disciplinary Case", Accuser;
            column(CaseNumber;
            "Case Number")
            {
            }
            column(DateofComplaint; "Date of Complaint")
            {
            }
            column(TypeofDisciplinaryCase; "Type of Disciplinary Case")
            {
            }
            column(CaseDescription; "Case Description")
            {
            }
            column(ModeofLodgingtheComplaint; "Mode of Lodging the Complaint")
            {
            }
            column(AccuserIsStaff; "Accuser Is Staff")
            {
            }
            column(Accuser; Accuser)
            {
            }
            column(Witness; Witness)
            {
            }
            column(DisciplinaryCommitee; "Disciplinary Commitee")
            {
            }
            column(Status; Status)
            {
            }
            column(AppealDate; "Appeal Date")
            {
            }
            column(ActionTaken; "Action Taken")
            {
            }
            column(ActionTakenDate; "Action Taken Date")
            {
            }
            column(ResponsetoShowCause; "Response to Show Cause")
            {
            }
            column(DisciplinaryHearing; "Disciplinary Hearing")
            {
            }
            column(DisciplinaryHearingDate; "Disciplinary Hearing Date")
            {
            }
            column(Recomendations; Recomendations)
            {
            }
            column(RecommendedAction; "Recommended Action")
            {
            }
            column(RecommendationActionDate; "Recommendation Action Date")
            {
            }
            column(DisciplinaryRemarks; "Disciplinary Remarks")
            {
            }
            column(HandledBy; "Handled By")
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
            column(CompanyMotto; CompanyInformation.Motto)
            {

            }

            trigger OnAfterGetRecord()
            begin
                CompanyInformation.get();
                CompanyInformation.CalcFields(Picture);
                FormatAddr.GetCompanyAddr('', ResponsibilityCenter, CompanyInformation, CompanyAddr);
                ;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        CompanyInformation: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        CompanyAddr: array[8] of Text[100];
        ResponsibilityCenter: Record "Responsibility Center";
}
