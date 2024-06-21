#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80379 "Approved Directors PCs List"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Directors PC Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    ShowFilter = false;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type"=const("Individual Scorecard"),
                            "Score Card Type"=const(Directors),
                            "Approval Status"=const(Released));
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
                field("Annual Workplan";"Annual Workplan")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Directorate;Directorate)
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
