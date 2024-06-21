#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69340 "Advertisement Voucher"
{
    PageType = Card;
    SourceTable = "Vacancy  Requisitions Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Manpower Plan ID"; "Manpower Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Manpower Plan Name"; "Manpower Plan Name")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1"; "Global Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Name"; "Global Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2"; "Global Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Name"; "Global Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control17; "Advertisement Lines")
            {
                SubPageLink = "Requisition No." = field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Get Open Vacancies")
            {
                ApplicationArea = Basic;
                Image = GetLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // ShortlistingCriteria.GetOpenVacancies(Rec);
                end;
            }
            action(Advertise)
            {
                ApplicationArea = Basic;
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm(TXT003) = true then begin
                        // ShortlistingCriteria.AdvertiseVacancies(Rec);

                    end;
                    Message(TXT002);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::Advert;
    end;

    var
        ShortlistingCriteria: Codeunit "Shortlisting Criteria";
        TXT001: label 'Vacancies succesfully Added';
        TXT002: label 'All Vacancies published succesfully';
        TXT003: label 'Are you sure you want to advertise all the vacancies';
}

