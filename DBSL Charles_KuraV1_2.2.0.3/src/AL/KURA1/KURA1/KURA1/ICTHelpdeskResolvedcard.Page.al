#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56221 "ICT Helpdesk Resolved card"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Resolved));

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
                field("Attended Time"; "Attended Time")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
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
                    ShowMandatory = true;
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
        area(factboxes)
        {
            systempart(Control2; Links)
            {
            }
            systempart(Control1; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Close Request")
            {

                //     ApplicationArea = Basic;
                //     Image = SendApprovalRequest;
                //     Promoted = true;
                //     PromotedCategory = Process;

                //     trigger OnAction()
                //     begin
                //         TestField("ICT Issue Category");
                //         TestField("Description of the issue");
                // //         if Confirm('Are you sure you want to send ICT helpdesk issue?' true then begin
                //             "Request Date" := Today;
                //             "Request Time" := Time;
                //             Status := s:=Status::Assigned;
                // //          Modify;

                //         Category.Reset;
                //             Category.SetRange(Category.Co de,"ICT Issue Category");
                //             if Category.FindSet then begin
                //                 Mapping.Reset;
                //                 Mapping.SetRange(Mapping."Help Desk Categor y","ICT Issue Category");
                //                 if Mapping.FindSet then begin
                //                  "Assigned To" := ":=Mapping.UserName;
                //                  "Assigned Date" := Today;
                //         "Assigned Time" := Time;
                //         Modify;
                //     end;
                // end;

                /*
                  Employee.RESET;
                  Employee.SETRANGE(Employee.Position,'JOB002');
                  IF Employee.FIND('-')THEN
                  BEGIN
                    Email2:=Employee."Company E-Mail";
                  END;
    //               */
                //   //           CInfo.Get;
                // //             Employee.Reset;
                // //             Employee.SetRange(Employee."User I D","Assigned To");
                // //             if Employee.Find(' then begin
                //                 //MESSAGE("Assigned To");
                //                 Email := mail:=Employee."E-Mail";
                // //         /    "Requesting Officer Name" := ame":=Employee."First + ' ' + "+' '+Employee."Middle + ' ' + "+' '+Employee."Last Name";
                // //          end;


                //             Email2 := CInfo."Administrator Email";
                //             Body := '<br>Kindly login to the ERP System and attend to the ICT Issue No. ' + "Job No." + ' from ' + "Requesting Officer Name" + '.' + '</br>';
                //             Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                //             Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                //             SMTP.CreateMessage(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
                //             SMTP.Send();
                //             Message('ICT Issue notification sent successfully.');
                //         end;

                ApplicationArea = Basic;
                Image = PostApplication;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you ascertaining that your request' + ' ' + "Job No." + ' ' + 'has been resolved?') then
                        exit;
                    TestField("Requester Feedback");
                    Status := Status::Closed;
                    Modify(true);

                    //Release the Officer + ' ' + "Job No." + ' ' + 
                    Mapping.Reset;
                    Mapping.SetRange(Mapping.UserName, "Assigned To");
                    Mapping.SetRange(Mapping."Help Desk Category", "ICT Issue Category");
                    if Mapping.FindSet then begin
                        Mapping.Assigned := false;
                        Mapping.Modify;
                    end;
                End; //Release the Officer 
                //end; 
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to reopen this ICT Helpdesk issue?' + ' ' + "Job No.") then
                        exit;
                    TestField("Requester Feedback");
                    Status := Status::Open;
                    Reopened := true;
                    "Reopened By" := UpperCase(UserId);
                    "Assigned To" := ''; //?/+ ' ' + 
                    "Attended By" := '';
                    // "Assigned Date":=0D;
                    // "Assig := d Time":=0T;
                    // "Attende := by Name":='';
                    // "Attended Dat := :=0D;
                    // "Attended Tim := :=0T;
                    Modify; //:= 
                end; //:= 
            }
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
        // SMTP: Codeunit Mail;
        Email2: Text[250];
        CInfo: Record "Company Information";
        Category: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
}

