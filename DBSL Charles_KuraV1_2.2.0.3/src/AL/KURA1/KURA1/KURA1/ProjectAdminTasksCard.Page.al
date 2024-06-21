#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 65050 "Project Admin Tasks Card"
{
    PageType = Card;
    SourceTable = "Grant Admin Tasks";
    SourceTableView = where("Source Document Type"=const(" "));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Source Document Type";"Source Document Type")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("Sourec Document No.";"Sourec Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Grant Admin Team Code";"Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                }
                field("Team Name";"Team Name")
                {
                    ApplicationArea = Basic;
                }
                field("Researcher No";"Researcher No")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center";"Research Center")
                {
                    ApplicationArea = Basic;
                }
                field("Contact No.";"Contact No.")
                {
                    ApplicationArea = Basic;
                }
                field("Task Type";"Task Type")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Priority;Priority)
                {
                    ApplicationArea = Basic;
                }
                field("Research Program";"Research Program")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Name";"Contact Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Closed;Closed)
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed";"Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field(Comment;Comment)
                {
                    ApplicationArea = Basic;
                }
                field("Research Center Description";"Research Center Description")
                {
                    ApplicationArea = Basic;
                }
                field("Program Description";"Program Description")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Company No";"Contact Company No")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Company Name";"Contact Company Name")
                {
                    ApplicationArea = Basic;
                }
                field(Recurring;Recurring)
                {
                    ApplicationArea = Basic;
                }
                field("Recurring Date Interval";"Recurring Date Interval")
                {
                    ApplicationArea = Basic;
                }
                field("Calc. Due Date From";"Calc. Due Date From")
                {
                    ApplicationArea = Basic;
                }
                field("Application Title";"Application Title")
                {
                    ApplicationArea = Basic;
                }
                field("Start Time";"Start Time")
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field("Last Time Modified";"Last Time Modified")
                {
                    ApplicationArea = Basic;
                }
                field("All Day Event";"All Day Event")
                {
                    ApplicationArea = Basic;
                }
                field(Location;Location)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Completed By";"Completed By")
                {
                    ApplicationArea = Basic;
                }
                field("Ending Date";"Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reminder Due Date Formular";"Reminder Due Date Formular")
                {
                    ApplicationArea = Basic;
                }
                field("Reminder Due Date";"Reminder Due Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control42;Outlook)
            {
            }
            systempart(Control43;Notes)
            {
            }
            systempart(Control44;MyNotes)
            {
            }
            systempart(Control45;Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Source Document Type":="source document type"::"Grant Application";
    end;

    trigger OnOpenPage()
    begin
        "Source Document Type":="source document type"::"Grant Application";
    end;
}

