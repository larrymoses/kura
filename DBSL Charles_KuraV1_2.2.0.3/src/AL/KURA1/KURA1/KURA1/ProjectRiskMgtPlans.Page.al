#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 95090 "Project Risk Mgt. Plans"
{
    ApplicationArea = Basic;
    CardPageID = "Project Risk Management Plan";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Risk Management Plan";
    SourceTableView = where("Document Type" = filter(Project),
                            Status = filter(Open | "Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No"; "Document No")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project ID"; "Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan ID"; "Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary MIssion"; "Primary MIssion")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsible Officer No."; "Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Likelihood Rate Scale ID"; "Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Impact Rating Scale ID"; "Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Overall Risk Rating Scale ID"; "Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Appetite Rating Scale ID"; "Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                    Visible = false;
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::Project;
    end;
}

