#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69607 "Position Factbox"
{
    PageType = CardPart;
    SourceTable = "Company Positions";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Work Experience"; Rec."Minimum Work Experience")
                {
                    ApplicationArea = Basic;
                    Caption = 'Active Contracts';
                }
                field("Minimum Mngmnt Experience"; Rec."Minimum Mngmnt Experience")
                {
                    ApplicationArea = Basic;
                    Caption = 'Terminated Contracts';
                }
                field("Approved Establishment"; Rec."Approved Establishment")
                {
                    ApplicationArea = Basic;
                }
                field("No of Active Contracts"; Rec."No of Active Contracts")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Terminated Contracts"; Rec."No. of Terminated Contracts")
                {
                    ApplicationArea = Basic;
                }
                field(NoOfApplicants; NoOfApplicants)
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Applicants';
                }
                field(NoOfVacancies; NoOfVacancies)
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Vacancies';
                }
                field(NoOfQualified; NoOfQualified)
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Qualified Employees';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        NoOfApplicants := 0;
        NoOfVacancies := 0;
    end;

    var
        NoOfApplicants: Integer;
        NoOfVacancies: Integer;
        NoOfQualified: Integer;
}

#pragma implicitwith restore

