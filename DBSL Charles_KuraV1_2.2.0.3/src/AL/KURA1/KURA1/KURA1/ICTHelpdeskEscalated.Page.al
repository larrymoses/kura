#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56117 "ICT Helpdesk Escalated"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Escalated | "Escalated To Vendor"));

    layout
    {
        area(content)
        {
            group("Part 1: User Information")
            {
                Editable = false;
                field("Job No."; "Job No.")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Physical Station"; "Physical Station")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Nature of Service"; "Nature of Service")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Constituency Name';
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
                }
                field(EXT; EXT)
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer"; "Requesting Officer")
                {
                    ApplicationArea = Basic;
                }
                field("Requesting Officer Name"; "Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field(Phone; Phone)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Email)
                {
                    ApplicationArea = Basic;
                }
                field("Request Date"; "Request Date")
                {
                    ApplicationArea = Basic;
                }
                field("Request Time"; "Request Time")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Part 2.1: Hardware Issues")
            {
                Editable = false;
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
            group("Part 2.2: Software Issues")
            {
                Editable = false;
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
            group("Please describe the issue here")
            {
                field("Description of the issue"; "Description of the issue")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    MultiLine = true;
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
                field("Escalated To"; "Escalated To")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Escalated By"; "Escalated By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                field("Ascalation Details"; "Ascalation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Escalation Details';
                    MultiLine = true;
                }
            }
            group("ICT Head Escalation")
            {
                // Caption = 'ICT Head Escalation';
                // field("Ict Head Escalation";"Ict Head Escalation")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'ICT Head Escalation';
                // }
                field("IT Escalation Details"; "IT Escalation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'ICT Head Escalation Details';
                    MultiLine = true;
                }
                field("IT Escalation Time"; "IT Escalation Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control57; Links)
            {
            }
            systempart(Control56; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Assign)
            {
                ApplicationArea = Basic;
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to assign the ICT helpdesk issue?' + ' ' + "Job No.") = true then begin
                        "Assigned Date" := Today;
                        "Assigned Time" := Time;
                        Status := Status::Assigned;
                        Modify;
                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    SetFilter("Job No.", "Job No.");
                    Report.Run(56238, true, true, Rec);
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Caption = 'Solved';
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Close the ICT helpdesk issue?') = true then begin
                        "Attended Date" := Today;
                        "Attended By" := UpperCase(UserId);
                        "Attended Time" := Time;
                        Status := Status::Closed;
                        Modify(true);
                    end;

                    //Notify the requester that the issue has been closed
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    //MESSAGE(COMPANYNAME);
                    if UserSetup.Get("Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ISSUE CLOSURE' + ' ' + "Job No.";
                    Body := 'Please note that the issue on the subject above has been resolved by' + '  ' + "Attended By" + 'and shall be closed after 24 hours. Kinldy login to the system and confirm.';
                    // ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
                end;
            }
            action(Escalate)
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to escalate the ICT helpdesk issue?' + ' ' + "Job No.") = true then begin
                        "Escalated By" := UpperCase(UserId);
                        "Escalated Date" := Today;
                        "Escalated Time" := Time;
                        "Assigned To" := "Escalated To";
                        Status := Status::Closed;
                        Modify;
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get("Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + "Job No.";
                    Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + "Escalated To";
                    //  ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get("Escalated To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + "Job No.";
                    Body := 'Please note that the issue on the subject above has been escalatd to you by' + ' ' + "Assigned To";
                    //  ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
                end;
            }
            action("Escalate To ICT Head")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    TestField("IT Escalation Details");
                    if Confirm('Are you sure you want to escalate to the  ICT head ?' + ' ' + "Job No.") = true then begin

                        "Escalated By" := UpperCase(UserId);
                        //  "Escalated Date":=TODAY;
                        //  "Escalated Time":=TIME;
                        "IT Escalation Time" := Time;
                        "Assigned To" := "Ict Head Escalation";
                        Status := Status::Escalated;
                        Modify;
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get("Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + "Job No.";
                    Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + "Ict Head Escalation";
                    //   ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get("Escalated To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + "Job No.";
                    Body := 'Please note that the issue on the subject above has been escalatd to you by' + ' ' + "Escalated To";
                    //ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
                end;
            }
        }
    }

    var
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
}

