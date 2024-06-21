#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56079 "ICT Helpdesk History"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status=filter(Resolved));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Assigned To";"Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Date";"Assigned Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                }
                field("Assigned Time";"Assigned Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time';
                }
            }
            group("Part 1: User Information")
            {
                field("Job No.";"Job No.")
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field("Department Name";"Department Name")
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
                field(EXT;EXT)
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
                field(Phone;Phone)
                {
                    ApplicationArea = Basic;
                }
                field(Email;Email)
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
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Part 2.1: Hardware Issues")
            {
                field("Computer not Starting up";"Computer not Starting up")
                {
                    ApplicationArea = Basic;
                }
                field("Keyboard, Mouse Failure";"Keyboard, Mouse Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Printer Failure";"Printer Failure")
                {
                    ApplicationArea = Basic;
                }
                field("UPS Failure";"UPS Failure")
                {
                    ApplicationArea = Basic;
                }
                field("LCD /Monitor Failure";"LCD /Monitor Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Storage Device Failure";"Storage Device Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Hardware Installation";"Hardware Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Others, specify HW";"Others, specify HW")
                {
                    ApplicationArea = Basic;
                    RowSpan = 3;
                }
            }
            group("Part 2.2: Software Issues")
            {
                field("Computer Running /Loading Slow";"Computer Running /Loading Slow")
                {
                    ApplicationArea = Basic;
                }
                field("Network Access Problems";"Network Access Problems")
                {
                    ApplicationArea = Basic;
                }
                field("Antivirus Inefficiency";"Antivirus Inefficiency")
                {
                    ApplicationArea = Basic;
                }
                field(Applications;Applications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Applications Software (MS Word, MS Excel, MS Access, MS PowerPoint etc)';
                }
                field("Software Installation";"Software Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Others, specify SW";"Others, specify SW")
                {
                    ApplicationArea = Basic;
                    RowSpan = 3;
                }
            }
            group(Control6)
            {
                field(Diagnosis;Diagnosis)
                {
                    ApplicationArea = Basic;
                }
                field("Action Taken";"Action Taken")
                {
                    ApplicationArea = Basic;
                }
                field("Attended By";"Attended By")
                {
                    ApplicationArea = Basic;
                }
                field("Attended Date";"Attended Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                }
                field("Attended Time";"Attended Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time';
                }
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
        }
    }
}

