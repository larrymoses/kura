#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56080 "ICT Helpdesk Historyyy"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Closed));

    layout
    {
        area(content)
        {
            group("Part 1: User Information.")
            {
                Editable = true;
                field("Job No."; "Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    Editable = false;
                }
                field("Region Name"; "Region Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Name';
                    Editable = false;
                }
                field("Constituency Name"; "Constituency Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
                    Editable = false;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Requesting Officer"; "Requesting Officer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requesting Officer Name"; "Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Phone; Phone)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EXT; EXT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Extension No';
                    Editable = false;
                }
                field("Request Date"; "Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Request Time"; "Request Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ICT Issue Category"; "ICT Issue Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requester Feedback"; "Requester Feedback")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = false;
                    Visible = false;
                }
            }
            group("Part 2:1 Hardware Issues")
            {
                Visible = false;
                field("Computer not Starting up"; "Computer not Starting up")
                {
                    ApplicationArea = Basic;
                }
                field("Keyboard, Mouse Failure"; "Keyboard, Mouse Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Printer Failure"; "Printer Failure")
                {
                    ApplicationArea = Basic;
                }
                field("UPS Failure"; "UPS Failure")
                {
                    ApplicationArea = Basic;
                }
                field("LCD /Monitor Failure"; "LCD /Monitor Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Storage Device Failure"; "Storage Device Failure")
                {
                    ApplicationArea = Basic;
                }
                field("Hardware Installation"; "Hardware Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Others, specify HW"; "Others, specify HW")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Part 2:2 Software Issues")
            {
                Visible = false;
                field("Computer Running /Loading Slow"; "Computer Running /Loading Slow")
                {
                    ApplicationArea = Basic;
                }
                field("Network Access Problems"; "Network Access Problems")
                {
                    ApplicationArea = Basic;
                }
                field("Antivirus Inefficiency"; "Antivirus Inefficiency")
                {
                    ApplicationArea = Basic;
                }
                field(Applications; Applications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Applications Software (MS Word, MS Excel, MS Access, MS PowerPoint etc)';
                }
                field("Software Installation"; "Software Installation")
                {
                    ApplicationArea = Basic;
                }
                field("Others, specify SW"; "Others, specify SW")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Please describe the issue here:")
            {
                Editable = false;
                field("Description of the issue"; "Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                }
            }
            group(Assigned)
            {
                Caption = 'Assigned';
                Editable = false;
                field("Assigned To"; "Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Date"; "Assigned Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            group("Escalation Details")
            {
                Caption = 'Escalation Details';
                Editable = false;
                field("Escalated To"; "Escalated To")
                {
                    ApplicationArea = Basic;
                }
                field("Escalated By"; "Escalated By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Escalated Date"; "Escalated Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Escalated Time"; "Escalated Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Validate("Job No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Status := Status::Open;
    end;

    var
        Employee: Record Employee;
        Body: Text[250];
        //SMTP: Codeunit Mail;
        Email2: Text[250];
        CInfo: Record "Company Information";
        Category: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
}

