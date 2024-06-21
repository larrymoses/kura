#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 59024 "Closed Daily Work Ticket Card"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Dialy Work Ticket Header";
    SourceTableView = where(Status=const(Closed));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Daily Work Ticket";"Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle Allocated";"Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Allocated";"Driver Allocated")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Drivers List";
                }
                field("Date of Request";"Date of Request")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field("Driver Name";"Driver Name")
                {
                    ApplicationArea = Basic;
                }
                field("Closed by";"Closed by")
                {
                    ApplicationArea = Basic;
                }
                field("Date Closed";"Date Closed")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Odometer";"Opening Odometer")
                {
                    ApplicationArea = Basic;
                }
                field("Closing Odometer";"Closing Odometer")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created";"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Total Km's Covered";"Total Km's Covered")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Daily Work Ticket Lines";"Daily Work Ticket Lines")
            {
                SubPageLink = "Daily Work Ticket"=field("Daily Work Ticket");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Print Work Ticket")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Reset;
                    SetRange("Daily Work Ticket","Daily Work Ticket");
                    Report.Run(65016,true,true);
                    Reset;
                end;
            }
        }
    }
}

