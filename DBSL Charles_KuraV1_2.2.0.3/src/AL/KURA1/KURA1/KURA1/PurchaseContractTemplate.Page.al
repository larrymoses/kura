#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 75260 "Purchase Contract Template"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Purchase Contract Template";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type";"Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Doc Template ID";"Procurement Doc Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default Language Code";"Default Language Code")
                {
                    ApplicationArea = Basic;
                }
                field("Governing Laws";"Governing Laws")
                {
                    ApplicationArea = Basic;
                }
                field("Max Contract Variation %";"Max Contract Variation %")
                {
                    ApplicationArea = Basic;
                }
                field("Defects Liability Period";"Defects Liability Period")
                {
                    ApplicationArea = Basic;
                }
                field("Daily Liquidated Unit Cost";"Daily Liquidated Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Liquidated Damages Limit %";"Liquidated Damages Limit %")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Retention %";"Payment Retention %")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Amount Limit %";"Retention Amount Limit %")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Interim Certificate";"Minimum Interim Certificate")
                {
                    ApplicationArea = Basic;
                }
                field("Written Consent for 3rd Party";"Written Consent for 3rd Party")
                {
                    ApplicationArea = Basic;
                }
                field("Limitation of Liability Clause";"Limitation of Liability Clause")
                {
                    ApplicationArea = Basic;
                }
                field("Idemnification Clause";"Idemnification Clause")
                {
                    ApplicationArea = Basic;
                }
                field("Full Transfer of Ownership";"Full Transfer of Ownership")
                {
                    ApplicationArea = Basic;
                }
                field("Written Consent for Subcontr";"Written Consent for Subcontr")
                {
                    ApplicationArea = Basic;
                }
                field("Max Subcontractor Value %";"Max Subcontractor Value %")
                {
                    ApplicationArea = Basic;
                }
                field("Amicable Dispute Settlement";"Amicable Dispute Settlement")
                {
                    ApplicationArea = Basic;
                }
                field("Appointer of Arbitrator";"Appointer of Arbitrator")
                {
                    ApplicationArea = Basic;
                }
                field("Min Termination Notice Period";"Min Termination Notice Period")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

