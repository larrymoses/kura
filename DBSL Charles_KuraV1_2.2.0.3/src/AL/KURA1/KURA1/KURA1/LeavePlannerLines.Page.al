
Page 69230 "Leave Planner Lines"
{
    PageType = ListPart;
    SourceTable = "HR Leave Planner Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = Basic;
                    Editable =false;
                }
                field("Employee No";Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name";Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Applicant Comments"; Rec."Applicant Comments")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Request Leave Allowance"; Rec."Request Leave Allowance")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field(Reliever; Rec.Reliever)
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Approved days"; Rec."Approved days")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Date of Exam"; Rec."Date of Exam")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Details of Examination"; Rec."Details of Examination")
                {
                    ApplicationArea = Basic;
                    Visible =false;
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = Basic;
                    
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Planning Lines")
            {
                action("Leave Plan")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave &Planning Lines';
                    Image = Planning;
                    Scope = Repeater;
                    trigger OnAction()
                    var
                        LeavePlanningLine: Record "Leave Plan Detailed Lines";
                        LeavePlanningLines: Page "Leave Plan Detailed Lines";
                    begin
                        Rec.TestField("Employee No");
                        Rec.TestField("Application Code");
                        LeavePlanningLine.FilterGroup(2);
                        LeavePlanningLine.SetRange("Document No.", Rec."Application Code");
                        LeavePlanningLine.SetRange("Employee No.", Rec."Employee No");
                        LeavePlanningLine.FilterGroup(0);
                        LeavePlanningLines.SetTableView(LeavePlanningLine);
                        LeavePlanningLines.Editable := true;
                        LeavePlanningLines.Run();
                    end;
                }
            }
        }
    }
}



