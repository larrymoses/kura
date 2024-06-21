#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56074 "ICT Helpdesk Status List"
{
    ApplicationArea = Basic;
    Caption = 'ICT Helpdesk Status';
    CardPageID = "ICT Helpdesk Historyyy";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "ICT Helpdesk";
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
            systempart(Control15;Links)
            {
            }
            systempart(Control14;MyNotes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetFilter(Status,'<>%1',Status::" ");
    end;

    trigger OnAfterGetRecord()
    begin
        SetFilter(Status,'<>%1',Status::" ");
    end;

    trigger OnOpenPage()
    begin
        //SETFILTER("Requesting Officer",UPPERCASE(USERID));
        SetFilter(Status,'<>%1',Status::" ");
    end;
}

