
Page 80084 "Standard Perfomance Appraisal"
{
    ApplicationArea = Basic;
    CardPageID = "Standard Perform Appraisal";
    Editable = false;
    PageType = List;
    SourceTable = "Perfomance Evaluation";
    SourceTableView = where("Document Type"=const("Performance Appraisal"),
                            "Document Status"=const(Draft),
                            "Evaluation Type"=const("Standard Appraisal/Supervisor Score Only"));
    UsageCategory = Lists;

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
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Task ID"; Rec."Performance Task ID")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Current Designation"; Rec."Current Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Current Grade"; Rec."Current Grade")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Staff No."; Rec."Supervisor Staff No.")
                {
                    ApplicationArea = Basic;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Start Date"; Rec."Evaluation Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation End Date"; Rec."Evaluation End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Appraisal Template ID"; Rec."Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("General Assessment Template ID"; Rec."General Assessment Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("360-Degree Assessment Temp ID"; Rec."360-Degree Assessment Temp ID")
                {
                    ApplicationArea = Basic;
                }
                field("Objective & Outcome Weight %"; Rec."Objective & Outcome Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Weight %"; Rec."Competency Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Rating Scale"; Rec."Performance Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Proficiency Rating Scale"; Rec."Proficiency Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Appealed Performance Eval id"; Rec."Appealed Performance Eval id")
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


