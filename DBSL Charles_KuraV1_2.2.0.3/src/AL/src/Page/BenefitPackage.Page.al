#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69784 "Benefit Package"
{
    PageType = Card;
    SourceTable = "Benefit Package";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Package ID";"Package ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Objective";"Primary Objective")
                {
                    ApplicationArea = Basic;
                }
                field("Benefit Program ID";"Benefit Program ID")
                {
                    ApplicationArea = Basic;
                }
                field("Benefit Category";"Benefit Category")
                {
                    ApplicationArea = Basic;
                }
                field("Beneficiary Type";"Beneficiary Type")
                {
                    ApplicationArea = Basic;
                }
                field("Statutory Requirement";"Statutory Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Applicable to all Staff";"Applicable to all Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Applicable to Retired Staff";"Applicable to Retired Staff")
                {
                    ApplicationArea = Basic;
                }
                field("Enrollment Type";"Enrollment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date";"Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Company Policy ID";"Company Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Frequency";"Renewal Frequency")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Renewals";"No. of Renewals")
                {
                    ApplicationArea = Basic;
                }
                field("Last Renewal Date";"Last Renewal Date")
                {
                    ApplicationArea = Basic;
                }
                field("Min Eligibe Age(Yrs)";"Min Eligibe Age(Yrs)")
                {
                    ApplicationArea = Basic;
                }
                field("Max Eligibe Age(Yrs)";"Max Eligibe Age(Yrs)")
                {
                    ApplicationArea = Basic;
                }
                field("Min Length of Service(Yrs)";"Min Length of Service(Yrs)")
                {
                    ApplicationArea = Basic;
                }
                field("Max Waiting Period for Enroll";"Max Waiting Period for Enroll")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control28;"Benefit Plan Line")
            {
                SubPageLink = "Package ID"=field("Package ID");
            }
        }
        area(factboxes)
        {
            systempart(Control24;Outlook)
            {
            }
            systempart(Control25;Notes)
            {
            }
            systempart(Control26;MyNotes)
            {
            }
            systempart(Control27;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Eligibility Criteria")
            {
                ApplicationArea = Basic;
                Image = EditForecast;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Eligibility Criteria";
                RunPageLink = "Benefit ID"=field("Benefit Program ID");
            }
        }
    }
}

