#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80409 "Principal Officers PCs"
{
    ApplicationArea = Basic;
    CardPageID = "Principal Officer PC";
    DeleteAllowed = false;
    Caption = 'Sections Annual Workplan';
    Editable = false;
    PageType = List;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type" = const("Individual Scorecard"),
                            "Score Card Type" = const(Principal),
                            "Approval Status" = filter(Open | "Pending Approval"));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Objective Setting Due Date"; "Objective Setting Due Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Strategy Plan ID"; "Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Annual Reporting Code"; "Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsible Employee No."; "Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Grade; Grade)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Name"; "Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type"; "Evaluation Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Blocked?"; "Blocked?")
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
                field("Last Evaluation Date"; "Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

