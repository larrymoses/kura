#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95067 "Risk Status Rpt Incidents"
{
    CardPageID = "Risk Status Rpt Incident";
    PageType = List;
    SourceTable = "Risk Status Rpt Incident";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No";"Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID";"Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Line No.";"Incident Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Incident Category";"Risk Incident Category")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Description";"Incident Description")
                {
                    ApplicationArea = Basic;
                }
                field("Severity Level";"Severity Level")
                {
                    ApplicationArea = Basic;
                }
                field("Occurrence Type";"Occurrence Type")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Date";"Incident Date")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Start Time";"Incident Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Incident End Time";"Incident End Time")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Location Details";"Incident Location Details")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Trigger ID";"Primary Trigger ID")
                {
                    ApplicationArea = Basic;
                }
                field("Root Cause Summary";"Root Cause Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Category of Person Reporting";"Category of Person Reporting")
                {
                    ApplicationArea = Basic;
                }
                field("Reported By (Name)";"Reported By (Name)")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID";"Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("HSE Plan ID";"HSE Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Hazard ID";"Hazard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Financial Impact (LCY)";"Actual Financial Impact (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Schedule Delay(Days)";"Actual Schedule Delay(Days)")
                {
                    ApplicationArea = Basic;
                }
                field("Actual No. Injured Persons";"Actual No. Injured Persons")
                {
                    ApplicationArea = Basic;
                }
                field("Actual No. of Fatalities";"Actual No. of Fatalities")
                {
                    ApplicationArea = Basic;
                }
                field("Police Report Reference No.";"Police Report Reference No.")
                {
                    ApplicationArea = Basic;
                }
                field("Police Report Date";"Police Report Date")
                {
                    ApplicationArea = Basic;
                }
                field("Police Station";"Police Station")
                {
                    ApplicationArea = Basic;
                }
                field("Reporting Officer";"Reporting Officer")
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

