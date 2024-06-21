#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80366 "Departments\Centers PCs"
{
    ApplicationArea = Basic;
    Caption = 'Department/Region Annual Workplan';
    CardPageID = "Departments\Centers PC";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type" = const("Individual Scorecard"),
                            "Score Card Type" = const(Departmental),
                            "Approval Status" = filter(Open | "Pending Approval"));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Objective Setting Due Date"; Rec."Objective Setting Due Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
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

#pragma implicitwith restore

