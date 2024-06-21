#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80104 "Performance Improvement Plan"
{
    PageType = Card;
    SourceTable = "Performance Improvement Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Evaluation ID";"Primary Evaluation ID")
                {
                    ApplicationArea = Basic;
                }
                field("Original PIP";"Original PIP")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field("PIP Template ID";"PIP Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("PIP Start Date";"PIP Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("PIP End Date";"PIP End Date")
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
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                }
                field(Grade;Grade)
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
                field("Personal Scorecard ID";"Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID";"Strategy Plan ID")
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
                field("Last Review Date";"Last Review Date")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Review Type";"Performance Review Type")
                {
                    ApplicationArea = Basic;
                }
                field("Final PIP Outcome";"Final PIP Outcome")
                {
                    ApplicationArea = Basic;
                }
                field("Final PIP Verdict Code";"Final PIP Verdict Code")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control31;"Improvement Plan Line")
            {
                SubPageLink = "PIP ID"=field(No);
            }
        }
    }

    actions
    {
    }
}

