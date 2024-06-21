#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95104 "Risk Incident Logs"
{
    ApplicationArea = Basic;
    CardPageID = "Risk Incident Log";
    PageType = List;
    SourceTable = "Risk Incident Log";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Incident ID";"Incident ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Risk Register Type";"Risk Register Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID";"Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID";"Risk ID")
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
                    Editable = false;
                }
                field("Severity Level";"Severity Level")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Occurrence Type";"Occurrence Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Incident Date";"Incident Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Editable = false;
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
                    Editable = false;
                }
                field("Incident Class";"Incident Class")
                {
                    ApplicationArea = Basic;
                }
                field("HSE Management Plan ID";"HSE Management Plan ID")
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
                field("No. of Parties Involved";"No. of Parties Involved")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Corrective Actions";"No. of Corrective Actions")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Preventive Actions";"No. of Preventive Actions")
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
                    Editable = false;
                }
                field("Project ID";"Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan ID";"Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID";"Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Year Code";"Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID";"Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID";"Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID";"Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time";"Created Date Time")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Posting Date";"Posting Date")
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

