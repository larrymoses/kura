#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80378 "Approved Department PC List"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Department PC Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type"=const("Individual Scorecard"),
                            "Approval Status"=filter(Released),
                            "Score Card Type"=const(Departmental));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Objective Setting Due Date";"Objective Setting Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID";"Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Reporting Code";"Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date";"End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee No.";"Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field(Grade;Grade)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Name";"Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type";"Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status";"Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Blocked?";"Blocked?")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On";"Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Last Evaluation Date";"Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series";"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Goal Template ID";"Goal Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Workplan";"Annual Workplan")
                {
                    ApplicationArea = Basic;
                }
                field("CEO WorkPlan";"CEO WorkPlan")
                {
                    ApplicationArea = Basic;
                }
                field("Functional WorkPlan";"Functional WorkPlan")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field("Change Status";"Change Status")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Name";"Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
                field("Total Assigned Weight(%)";"Total Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                }
                field("Secondary Assigned Weight(%)";"Secondary Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                }
                field("JD Assigned Weight(%)";"JD Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Framework";"Strategy Framework")
                {
                    ApplicationArea = Basic;
                }
                field("Vision Statement";"Vision Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Mission Statement";"Mission Statement")
                {
                    ApplicationArea = Basic;
                }
                field("Score Card Type";"Score Card Type")
                {
                    ApplicationArea = Basic;
                }
                field("Directors PC ID";"Directors PC ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department/Center PC ID";"Department/Center PC ID")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Type";"Activity Type")
                {
                    ApplicationArea = Basic;
                }
                field(HOD;HOD)
                {
                    ApplicationArea = Basic;
                }
                field("Acting Job ID";"Acting Job ID")
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

