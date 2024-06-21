#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56076 "ICT Helpdesk Request"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(<> " "));

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
                field("Region Name"; "Region Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    Editable = false;
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
                field("Issue Category Department"; "Issue Category Department")
                {
                    ApplicationArea = Basic;
                }
                field("ICT Issue Category"; "ICT Issue Category")
                {
                    ApplicationArea = Basic;
                    Visible = true;
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
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Others, specify SW"; "Others, specify SW")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group("Please describe the issue here:")
            {
                field("Description of the issue"; "Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control3; Links)
            {
            }
            systempart(Control4; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //TESTFIELD("ICT Issue Category");
                    TestField("Description of the issue");
                    if Confirm('Are you sure you want to send ICT helpdesk issue?') = true then begin
                        "Request Date" := Today;
                        "Request Time" := Time;
                        Status := Status::Assigned;
                        Modify;

                        Category.RESET;
                        Category.SETRANGE(Category.Code, "ICT Issue Category");
                        IF Category.FINDSET THEN BEGIN
                            Mapping.RESET;
                            Mapping.SETRANGE(Mapping."Help Desk Category", "ICT Issue Category");
                            Mapping.SETRANGE(Mapping.Assigned, FALSE);
                            IF Mapping.FINDSET THEN BEGIN
                                "Assigned To" := Mapping.UserName;
                                "Assigned Date" := TODAY;
                                "Assigned Time" := TIME;
                                IF Rec.MODIFY(TRUE) THEN BEGIN
                                    Mapping.Assigned := TRUE;
                                    Mapping.MODIFY;
                                END;
                            END;
                        END;


                        /*
                          Employee.RESET;
                          Employee.SETRANGE(Employee.Position,'JOB002');
                          IF Employee.FIND('-')THEN
                          BEGIN
                            Email2:=Employee."Company E-Mail";
                          END;
                          */
                        // CInfo.Get;


                        // SetUp.Get();
                        // Email2 := CInfo."Administrator Email";
                        // Email := SetUp."ICT Email";
                        // Body := '<br>Kindly login to the ERP System and attend to the ICT Issue No. ' + "Job No." + ' from ' + "Requesting Officer Name" + '.' + '</br>';
                        // Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                        // Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                        // SMTP.CreateMessage(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
                        // Message(Email);
                        // SMTP.Send();
                        // Message('ICT Issue notification sent successfully.');

                        // Employee.Reset;
                        // Employee.SetRange(Employee."User ID", "Requesting Officer");
                        // if Employee.Find('-') then begin
                        //     //MESSAGE("Assigned To");
                        //     Email := Employee."E-Mail";
                        //     "Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        // end;
                        // Email2 := CInfo."Administrator Email";
                        // Body := '<br>Your issue has been received by ICT department Issue No. ' + "Job No." + ' from ' + "Requesting Officer Name" + '.' + '</br>';
                        // Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                        // Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                        // SMTP.CreateMessage(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
                        // Message(Email);
                        // SMTP.Send();
                        Message('ICT Issue notification sent successfully.');
                    end;

                    CurrPage.Close;

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
                    //   DMSManagement.UploadICTHelpDeskDocuments("Job No.", 'ICT Helpdesk Issue', RecordId, d,"Global Dimension 1 Code");
                end;
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
        //SMTP: Codeunit Mail;
        Email2: Text[250];
        CInfo: Record "Company Information";
        Category: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
        SetUp: Record "ICT Helpdesk Global Parameters";
        DMSManagement: Codeunit "DMS Management";
}

