#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56077 "ICT Helpdesk Assign"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Assigned));

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
            group("Please describe the issue here")
            {
                Editable = false;
                field("Description of the issue"; "Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
            group(Assigned)
            {
                Caption = 'Assigned';
                Editable = false;
                Enabled = true;
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
            group(Diagnosis)
            {
                Caption = 'Diagnosis';
                field("Action Taken"; "Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Describe the action taken to resolve the issue here';
                    MultiLine = true;
                    ShowMandatory = true;
                }
            }
            group("Escalation Details")
            {
                Caption = 'Escalation Details';
                field("Ascalation Details"; "Ascalation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Escalation Details';
                }
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
        area(factboxes)
        {
            systempart(Control5; Links)
            {
            }
            systempart(Control6; Notes)
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
            action(Resolve)
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    TestField("Action Taken");
                    if Confirm('Are you sure you want to Close the ICT helpdesk issue?') = true then begin
                        "Attended Date" := Today;
                        "Attended By" := UpperCase(UserId);
                        "Attended Time" := Time;
                        Status := Status::Resolved;
                        Modify;
                    end;

                    //Release the  Officer
                    Mapping.Reset;
                    Mapping.SetRange(Mapping.UserName, "Attended By");
                    Mapping.SetRange(Mapping."Help Desk Category", "ICT Issue Category");
                    if Mapping.FindSet then begin
                        Mapping.Assigned := false;
                        Mapping.Modify;
                    end;
                    //Release the  Officer

                    //Notify the requester that the issue has been closed
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get("Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'Issue Resolved' + ' ' + "Job No.";
                    Body := 'Please note that the issue on the subject above has been resolved by' + '  ' + "Attended By" + 'and shall be closed after 24 hours. Kinldy login to the system and confirm.';
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
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
                        Status := Status::Escalated;
                        Modify(true);
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get("Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + "Job No.";
                    Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + "Escalated To";
                    //  ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get("Escalated To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + "Job No.";
                    Body := 'Please note that the issue on the subject above has been escalatd to you by' + ' ' + "Assigned To";
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                end;
            }
            action("Escalate To Dynasoft")
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
                        Status := Status::"Escalated To Vendor";
                        Modify(true);
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    ObjComInfo.TestField("Administrator Email");
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    //IF UserSetup.GET("Requesting Officer") THEN
                    //Dynasoft Email
                    ObjComInfo.TestField("Vendor  Email");
                    Recipient := ObjComInfo."Vendor  Email";
                    Subject := 'KeRRA ICT HELPDESK ISSUE ESCALATION TO DYNASOFT' + ' ' + "Job No.";
                    Body := 'Please note that the issue below has been escalated to dynasoft for further action' + '<br> ' + "Description of the issue";
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    //Notify the 'Escalted To' that the issue has been escalated to them
                    ObjComInfo.Get;
                    ObjComInfo.TestField("Administrator Email");
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    //IF UserSetup.GET("Escalated To") THEN
                    ObjComInfo.TestField("ICT Email");
                    Recipient := ObjComInfo."ICT Email";
                    Subject := 'ICT ISSUE ESCALATION TO DYNASOFT' + ' ' + "Job No.";
                    Body := 'Please note that the issue below has been escalated to Dynasoft Business Solutions Limited for further action' + '<br> ' + "Description of the issue";
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
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
                    //DMSManagement.UploadICTHelpDeskDocuments("Job No. 'ICT Helpdesk Issue', RecordId, d,"Global Dimension 1 Code");
                end;
            }
        }
    }

    var
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[2048];
        Body: Text[2048];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
        DMSManagement: Codeunit "DMS Management";
}

