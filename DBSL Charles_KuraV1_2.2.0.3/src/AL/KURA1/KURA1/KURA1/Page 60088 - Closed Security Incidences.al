/// <summary>
/// Page Closed Security Incidences (ID 60088).
/// </summary>
page 60088 "Closed Security Incidences"
{
    CardPageID = "Security Incidence Card";
    PageType = List;
    SourceTable = "Security Incidences";
    SourceTableView = WHERE("Incidence Stage" = CONST(Closed));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Severity Level"; "Severity Level")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Type"; "Incident Type")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Type Details"; "Incident Type Details")
                {
                    ApplicationArea = Basic;
                }
                field("Time Reported"; "Time Reported")
                {
                    ApplicationArea = Basic;
                }
                field("Reported By Type"; "Reported By Type")
                {
                    ApplicationArea = Basic;
                }
                field(Stakeholder; Stakeholder)
                {
                    ApplicationArea = Basic;
                }
                field("Reporter Number"; "Reporter Number")
                {
                    ApplicationArea = Basic;
                }
                field("Reporter Name"; "Reporter Name")
                {
                    ApplicationArea = Basic;
                }
                field("Reporter Phone Number"; "Reporter Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Incidence Stage"; "Incidence Stage")
                {
                    ApplicationArea = Basic;
                }
                field("Reporter Email Address"; "Reporter Email Address")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Details"; "Incident Details")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }

            systempart(Links; Links)
            {
            }
        }
    }

    actions
    {
    }
}

