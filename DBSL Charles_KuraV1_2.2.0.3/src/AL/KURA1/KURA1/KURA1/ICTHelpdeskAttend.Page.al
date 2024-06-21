#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56078 "ICT Helpdesk Attend"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Pending));

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Assigned To"; "Assigned To")
                {
                    ApplicationArea = Basic;
                }
                field("Assigned Date"; "Assigned Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                }
                field("Assigned Time"; "Assigned Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time';
                }
            }
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
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                }
                field("Physical Station"; "Physical Station")
                {
                    ApplicationArea = Basic;
                }
                field("Nature of Service"; "Nature of Service")
                {
                    ApplicationArea = Basic;
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
            group(Control6)
            {
                field(Diagnosis; Diagnosis)
                {
                    ApplicationArea = Basic;
                }
                field("Action Taken"; "Action Taken")
                {
                    ApplicationArea = Basic;
                }
                field("Attended By"; "Attended By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Attended Date"; "Attended Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                    Visible = false;
                }
                field("Attended Time"; "Attended Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time';
                    Visible = false;
                }
            }
            systempart(Control48; Links)
            {
            }
            systempart(Control47; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Close)
            {
                ApplicationArea = Basic;
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
                        Modify;
                    end;

                    //Notify the requester that the issue has been closed
                    // ObjComInfo.GET;
                    // SenderEmailAddress:=ObjComInfo."Administrator Email";
                    // SenderName:=COMPANYNAME;
                    // MESSAGE(COMPANYNAME);
                    // IF UserSetup.GET("Requesting Officer") THEN
                    // Recipient:=UserSetup."E-Mail";
                    // Subject:='ISSUE CLOSURE'+ ' '+"Job No.";
                    // Body:='Please note that the issue on the subject above has been resoved by'+ '  '+"Attended By";
                    // ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
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
                        if UserSetup.Get("Escalated By") then
                            "Escalated To" := UserSetup."Approver ID";
                        Status := Status::Escalated;
                        Modify;
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    //MESSAGE(COMPANYNAME);
                    if UserSetup.Get("Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ISSUE ESCALATION' + ' ' + "Job No.";
                    Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + "Escalated To";
                    // ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //  DMSManagement.UploadICTHelpDeskDocuments("Job No.",'ICT Helpdesk Issue',RecordId,"Global Dimension 1 Code");
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
        DMSManagement: Codeunit "DMS Management";
}

