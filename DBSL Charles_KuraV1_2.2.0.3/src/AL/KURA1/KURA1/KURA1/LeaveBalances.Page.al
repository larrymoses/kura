#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69161 "Leave Balances"
{
    PageType = List;
    SourceTable = Employee;
    SourceTableView = sorting("No.")
                      order(ascending)
                      where(Status=const(Active));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name";"First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name";"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name";"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Outstanding Bal";"Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Annual Leave Balance';
                }
                field("Compassionate Leave Days";"Compassionate Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("Maternity Leave Days";"Maternity Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("Paternity Leave Days";"Paternity Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("Study Leave Days";"Study Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field("Unpaid Leave";"Unpaid Leave")
                {
                    ApplicationArea = Basic;
                }
                field("Sick Leave";"Sick Leave")
                {
                    ApplicationArea = Basic;
                }
                field("Total Leave Days";"Total Leave Days")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Branch;Branch)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group";"Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(Rank;Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Job Title";"Job Title")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000022;Notes)
            {
            }
            systempart(Control1000000023;MyNotes)
            {
            }
            systempart(Control1000000024;Links)
            {
            }
        }
    }

    actions
    {
    }
}

