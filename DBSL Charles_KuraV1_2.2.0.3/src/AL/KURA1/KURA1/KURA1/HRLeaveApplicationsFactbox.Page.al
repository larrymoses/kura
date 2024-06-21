
Page 69209 "HR Leave Applications Factbox"
{
    PageType = CardPart;
    SourceTable = Employee;
    Editable =false;
    layout
    {
        area(content)
        {
            label(Control1102755011)
            {
                ApplicationArea = Basic;
                CaptionClass = Text1;
                Style = StrongAccent;
                StyleExpr = true;
            }
            field("No."; Rec."No.")
            {
                ApplicationArea = Basic;
            }
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = Basic;
            }
            field("Middle Name"; Rec."Middle Name")
            {
                ApplicationArea = Basic;
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = Basic;
            }
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = Basic;
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
            }
            label(Control1102755005)
            {
                ApplicationArea = Basic;
                Style = StrongAccent;
                StyleExpr = true;
            }
            label(Control1102755012)
            {
                ApplicationArea = Basic;
                CaptionClass = Text2;
                Style = StrongAccent;
                StyleExpr = true;
            }
            field("Total Leave Taken"; Rec."Total Leave Taken")
            {
                ApplicationArea = Basic;
            }
            field("Total (Leave Days)"; Rec."Total (Leave Days)")
            {
                ApplicationArea = Basic;
            }
            field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
            {
                ApplicationArea = Basic;
            }
            field("Allocated Leave Days"; Rec."Allocated Leave Days")
            {
                ApplicationArea = Basic;
            }
            field("Annual Leave Account"; Rec."Annual Leave Account")
            {
                ApplicationArea = Basic;
            }
            field("Compassionate Leave Acc."; Rec."Compassionate Leave Acc.")
            {
                ApplicationArea = Basic;
            }
            field("Maternity Leave Acc."; Rec."Maternity Leave Acc.")
            {
                ApplicationArea = Basic;
            }
            field("Paternity Leave Acc."; Rec."Paternity Leave Acc.")
            {
                ApplicationArea = Basic;
            }
            field("Sick Leave Acc."; Rec."Sick Leave Acc.")
            {
                ApplicationArea = Basic;
            }
            field("Study Leave Acc"; Rec."Study Leave Acc")
            {
                ApplicationArea = Basic;
            }
            field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    var
        Text1: label 'Employee Details';
        Text2: label 'Employeee Leave Details';
       // Text3: ;
}



