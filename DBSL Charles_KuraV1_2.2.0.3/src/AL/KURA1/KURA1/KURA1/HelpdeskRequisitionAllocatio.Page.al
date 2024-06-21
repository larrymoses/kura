#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56217 "Helpdesk Requisition Allocatio"
{
    ApplicationArea = Basic;
    Caption = 'Helpdesk Requisition Allocation';
    CardPageID = "ICT HelpdeskAllocation";
    PageType = List;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status=filter(Pending));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer";"Requesting Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer Name";"Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Request Date";"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Request Time";"Request Time")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
                {
                    ApplicationArea = Basic;
                }
                field("Physical Station";"Physical Station")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Service";"Nature of Service")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned To";"Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Attended By";"Attended By")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20;Links)
            {
            }
            systempart(Control19;MyNotes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    SetFilter("Job No.","Job No.");
                    Report.Run(56238,true,true,Rec);
                end;
            }
            action(Resolve)
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    TestField("Action Taken");
                    if Confirm('Are you sure you want to Close the ICT helpdesk issue?') =true then
                    begin
                      "Attended Date":=Today;
                      "Attended By":=UpperCase(UserId);
                      "Attended Time":=Time;
                      Status:=Status::Resolved;
                      Modify;
                    end;
                end;
            }
            action(Escalate)
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;
            }
            action("Assign Task")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}

