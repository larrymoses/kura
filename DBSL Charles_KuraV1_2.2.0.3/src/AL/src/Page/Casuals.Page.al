#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57036 "Casuals"
{
    PageType = ListPart;
    SourceTable = Casuals;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Resource No.";"Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Work Type";"Work Type")
                {
                    ApplicationArea = Basic;
                }
                field("Task No.";"Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Activity;Activity)
                {
                    ApplicationArea = Basic;
                }
                field(Rate;Rate)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("No. Required";"No. Required")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Days";"No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Employee No To Surrender";"Employee No To Surrender")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name To Surender";"Employee Name To Surender")
                {
                    ApplicationArea = Basic;
                }
                field(Job;Job)
                {
                    ApplicationArea = Basic;
                }
                field("Job  Task";"Job  Task")
                {
                    ApplicationArea = Basic;
                }
                field("Job Name";"Job Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Name";"Job Task Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Budget";"Job Task Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Remaining Amount";"Job Task Remaining Amount")
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

