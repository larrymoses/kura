#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80131 "Self-Supervisor Appraisals"
{
    ApplicationArea = Basic;
    CardPageID = "Self-Supervisor Appraisal";
    Editable = false;
    PageType = List;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type"=const("Performance Appraisal"),
                            "Document Status"=const(Draft),
                            "Evaluation Type"=const("Self-Appraisal with Supervisor Score"));
    UsageCategory = Lists;

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
                field("Performance Mgt Plan ID";"Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Task ID";"Performance Task ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No.";"Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Current Designation";"Current Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Current Grade";"Current Grade")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Staff No.";"Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name";"Supervisor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID";"Strategy Plan ID")
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
                field("Evaluation Start Date";"Evaluation Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation End Date";"Evaluation End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisal Template ID";"Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type";"Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Personal Scorecard ID";"Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Template ID";"Competency Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("General Assessment Template ID";"General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("360-Degree Assessment Temp ID";"360-Degree Assessment Temp ID")
                {
                    ApplicationArea = Basic;
                }
                field("Objective & Outcome Weight %";"Objective & Outcome Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Weight %";"Competency Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight %";"Total Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Rating Scale";"Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Proficiency Rating Scale";"Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field("Annual Reporting Code";"Annual Reporting Code")
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
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Appealed Performance Eval id";"Appealed Performance Eval id")
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

