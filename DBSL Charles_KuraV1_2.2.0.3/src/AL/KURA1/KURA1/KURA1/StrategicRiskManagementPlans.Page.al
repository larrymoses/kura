#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95036 "StrategicRiskManagement Plans."
{
    ApplicationArea = Basic;
    Caption = 'Project Risk Management Plans';
    CardPageID = "Risk Management Plan";
    Editable = false;
    PageType = List;
    SourceTable = "Risk Management Plan";
    SourceTableView = where("Document Type" = filter(Project));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; "Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Year Code"; "Year Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary MIssion"; "Primary MIssion")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No."; "Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Likelihood Rate Scale ID"; "Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Impact Rating Scale ID"; "Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Risk Rating Scale ID"; "Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Appetite Rating Scale ID"; "Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Start Date"; "Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date"; "Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Blocked)
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
                field("Created Date Time"; "Created Date Time")
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

