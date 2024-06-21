#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80129 "Review Period"
{
    PageType = Card;
    SourceTable = "Review Periods";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Annual Reporting Code";"Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Review Type";"Review Type")
                {
                    ApplicationArea = Basic;
                }
                field("No of Quarters";"No of Quarters")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Closed By";"Closed By")
                {
                    ApplicationArea = Basic;
                }
                field("Closed Date";"Closed Date")
                {
                    ApplicationArea = Basic;
                }
                field("Closed Time";"Closed Time")
                {
                    ApplicationArea = Basic;
                }
                field("Genererated Appraisal";"Genererated Appraisal")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Quartely Review Periods")
            {
                ApplicationArea = Basic;
                Image = PeriodEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Quartely Review Periods";
                RunPageLink = "Year Code"=field("Annual Reporting Code"),
                              "Review Period Code"=field(Code);
            }
        }
    }
}

