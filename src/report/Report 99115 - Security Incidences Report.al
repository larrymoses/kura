/// <summary>
/// Report Security Incidences Report (ID 99115).
/// </summary>
report 99115 "Security Incidences Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Security Incidences Report.rdlc';
    Caption = 'Security Incidences Report';

    dataset
    {
        dataitem("Security Incidences"; "Security Incidences")
        {
            DataItemTableView = SORTING("No.")
                                ORDER(Ascending);
            RequestFilterFields = "Severity Level", "Incident Type";
            column(No_SecurityIncidences; "Security Incidences"."No.")
            {
            }
            column(IncidentType_SecurityIncidences; "Security Incidences"."Incident Type")
            {
            }
            column(IncidentTypeDetails_SecurityIncidences; "Security Incidences"."Incident Type Details")
            {
            }
            column(IncidenceStage_SecurityIncidences; "Security Incidences"."Incidence Stage")
            {
            }
            column(IncidentDetails_SecurityIncidences; "Security Incidences"."Incident Details")
            {
            }
            column(SeverityLevel_SecurityIncidences; "Security Incidences"."Severity Level")
            {
            }
            column(ApprovalStatus_SecurityIncidences; "Security Incidences"."Approval Status")
            {
            }
            column(TimeReported_SecurityIncidences; "Security Incidences"."Time Reported")
            {
            }
            column(Status_SecurityIncidences; "Security Incidences"."Approval Status")
            {
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

    var
        CI: Record "Company Information";
}

