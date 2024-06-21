#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69203 "HR Disciplinary Cases SF"
{
    PageType = ListPart;
    SourceTable = "HR Disciplinary Cases";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Employee No"; "Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Case Number"; "Case Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Case No.';
                    Editable = false;
                }
                field("Date of Complaint"; "Date of Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Reporting';
                    Editable = false;
                }
                field("Type of Disciplinary Case"; "Type of Disciplinary Case")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Case Description"; "Case Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Case Discussion"; "Case Discussion")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Mode of Lodging the Complaint"; "Mode of Lodging the Complaint")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mode of Reporting';
                    Editable = false;
                }
                field("Case Severity"; "Case Severity")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Accuser Is Staff"; "Accuser Is Staff")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reporter is Staff';
                    Editable = false;
                }
                field(Accuser; Accuser)
                {
                    Caption = 'Reporter';
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Witness; Witness)
                {
                    ApplicationArea = Basic;
                    Caption = 'Witness';
                    Editable = false;
                }
                field("Date to Respond"; Rec."Date to Respond")
                {
                    ApplicationArea = Basic;
                }
                field("Response to Show Cause"; "Response to Show Cause")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Hearing"; "Disciplinary Hearing")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Hearing Date"; "Disciplinary Hearing Date")
                {
                    ApplicationArea = Basic;
                }
                field("Hearing Venue";"Hearing Venue")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Commitee"; "Disciplinary Commitee")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary Remarks"; "Disciplinary Remarks")
                {
                    ApplicationArea = Basic;
                }
                field(Recomendations; Recomendations)
                {
                    ApplicationArea = Basic;
                }
                field("Recommendation Action Date"; "Recommendation Action Date")
                {
                    ApplicationArea = Basic;
                }
                field("Recommended Action"; "Recommended Action")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Appeal Date"; "Appeal Date")
                {
                    ApplicationArea = Basic;
                }
                field("Action Taken"; "Action Taken")
                {
                    ApplicationArea = Basic;
                }
                field("Action Taken Date"; "Action Taken Date")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Guidlines In Effect"; "Policy Guidlines In Effect")
                {
                    ApplicationArea = Basic;
                }
                field("Support Documents"; "Support Documents")
                {
                    ApplicationArea = Basic;
                }
                field("HR/Payroll Implications"; "HR/Payroll Implications")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Comments; Comments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Legal Case No."; "Legal Case No.")
                {
                    ApplicationArea = Basic;
                }
                field("Legal Case Recommendation"; "Legal Case Recommendation")
                {
                    ApplicationArea = Basic;
                }
                field(Selected; Selected)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Handled By"; "Handled By")
                {
                    ApplicationArea = Basic;
                }
                field("Case Created"; "Case Created")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup4)
            {
                Image = Alerts;
                action("Notify Commitee By Email")
                {
                    // ApplicationArea = Basic;
                    // Image = Email;
                    // Promoted = true;
                    // PromotedIsBig = true;
                    // PromotedOnly = true;
                    // ToolTip = 'Email all Board Members of this case';

                    // trigger OnAction()
                    // begin
                    //     Cases.SetRange("Case Number","Case Number");
                    //     if "Disciplinary Commitee" <> '' then begin
                    //       HRDiscipMemb.Reset;
                    //       HRDiscipMemb.SetRange(HRDiscipMemb.Committee,"Disciplinary Commitee");
                    //       if HRDiscipMemb.Find('-') then begin
                    //         repeat
                    //           if Employee.Get(HRDiscipMemb.Code) then begin
                    //             Filename:= ObjCompany."HR Document Link"+Employee."First Name"+'_'+Employee."Last Name"+' '+Cases."Case Number"+'.pdf';

                    //             HRCases.Reset;
                    //             HRCases.SetRange(HRCases."Employee No","Employee No");
                    //             HRCases.SetRange(HRCases."Case Number","Case Number");
                    //             Report.SaveAsPdf(69140,Filename,HRCases);
                    //             Header:='NOTICE OF HRMAC MEETING';

                    // if SMTPSetup.Get() then begin
                    //   SenderEmail:=SMTPSetup."Email Sender Address";
                    //   SenderName:= SMTPSetup."Email Sender Name";
                    // end;
                    // if Employee."E-Mail" <> '' then begin
                    //   //SMTPMail.CreateMessage(SenderName,SenderEmail,Employee."E-Mail",Header,'',true);
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('Dear '+Employee."First Name"+' '+Employee."Last Name"+',');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('This is to invite you for a commitee meeting');// for the month of January 2014');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('Attached is the complete memo on the above subject');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('Thanks & Regards');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline(SenderName);
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('<HR>');
                    //   //SMTPMail.AddBodyline('This is a system generated mail.');
                    //   //SMTPMail.AddBodyline('<br><br>');
                    //   //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kerra.go.ke');
                    //               //SMTPMail.AddBodyline('<br><br>');
                    //               SMTPMail.AddAttachment(Filename,'Memo '+Cases."Case Number"+'.pdf');
                    //               //SMTPMail.Send;
                    //                 //MESSAGE('The email %1 for %2 is invalid',Employee."E-Mail",Employee."No.");

                    //               //IF EXISTS(Filename) THEN
                    //               //ERASE(Filename);
                    //             end;
                    //             //End email
                    //           end;
                    //         until HRDiscipMemb.Next = 0;
                    //       end;
                    //     end;
                    //     Message('Notifications send');
                    // end;
                }
            }
            group("Case Management")
            {
                Caption = 'Case Management';
                Image = BankContact;
                action("Create Court Case")
                {
                    ApplicationArea = Basic;
                    Image = BankContact;

                    trigger OnAction()
                    begin
                        TestField("Handled By", "handled by"::Court);
                        if "Handled By" = "handled by"::Court then begin
                            TestField("Case Created", false);
                            if "Case Created" = false then begin
                                if Dialog.Confirm('Are you sure you want to send this case to Legal?', true) then begin
                                    CaseRegister.Reset;
                                    CaseRegister.Init;
                                    CaseRegister.Status := CaseRegister.Status::New;
                                    CaseRegister."Employee No" := "Employee No";
                                    Employee.Get("Employee No");
                                    CaseRegister."Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                                    CaseRegister."From Document Number" := "Case Number";

                                    if CaseRegister.Insert(true) then begin
                                        "Case Created" := true;
                                        "Legal Case No." := CaseRegister."No.";
                                        Modify;
                                    end;
                                end;
                                Message('%1 Legal case created', CaseRegister."No.");
                                CR.Reset;
                                CR.SetRange(CR."No.", CaseRegister."No.");
                                Page.Run(56098, CR);
                            end else begin
                                CR.Reset;
                                CR.SetRange(CR."No.", CaseRegister."No.");
                                Page.Run(56098, CR);
                            end;
                        end;
                    end;
                }
                action("Open Court Case")
                {
                    ApplicationArea = Basic;
                    Image = OpenWorksheet;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        CR.Reset;
                        CR.SetRange(CR."No.", Rec."Legal Case No.");
                        Page.Run(56098, CR);
                    end;
                }
                action("Close Case File")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure want to close this case?', true) then begin
                            EmployeeDisciplinaryStatus.Reset;
                            EmployeeDisciplinaryStatus.SetRange(EmployeeDisciplinaryStatus."Employee No", "Employee No");
                            EmployeeDisciplinaryStatus.SetRange(EmployeeDisciplinaryStatus."Case Number", "Case Number");
                            if EmployeeDisciplinaryStatus.FindSet then begin
                                repeat
                                    EmployeeDisciplinaryStatus.TestField(EmployeeDisciplinaryStatus."Disciplinary Status");
                                until EmployeeDisciplinaryStatus.Next = 0;
                            end;
                            Cases.Get(Rec."Employee No", Rec."Case Number");
                            Cases.Status := Status::Closed;
                            Cases."Closed By" := UserId;
                            if Cases.Modify() then
                                Message('Case Closed');
                        end;
                    end;
                }
                action("Reinstate Employee")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        if Confirm('Are you sure want to reinstate Employee?', true) then begin
                            DiscStatus.Reset;
                            DiscStatus.SetRange(DiscStatus."Case Number", "Case Number");
                            DiscStatus.SetRange(DiscStatus."Employee No", "Employee No");
                            if DiscStatus.FindLast then begin
                                if DisciplinaryStatus.Get(DiscStatus."Disciplinary Status") then begin
                                    AssignmentMatrixX.Reset;
                                    AssignmentMatrixX.SetRange(AssignmentMatrixX.Type, AssignmentMatrixX.Type::Deduction);
                                    AssignmentMatrixX.SetRange(AssignmentMatrixX.Code, DisciplinaryStatus."Deduction Code");
                                    AssignmentMatrixX.SetRange(AssignmentMatrixX."Employee No", "Employee No");
                                    AssignmentMatrixX.DeleteAll;
                                end;
                                DiscStatus."Effect on Payroll" := false;
                                DiscStatus.Modify;
                            end;
                            Cases.Get(Rec."Employee No", Rec."Case Number");
                            Cases.Status := Status::Reinstated;
                            Cases."Closed By" := UserId;
                            if Cases.Modify() then
                                Message('Employee Reinstated with full pay');
                        end;
                    end;
                }
                // action("Appeal Case File")
                // {
                //     ApplicationArea = Basic;
                //     Image = Close;
                //     Promoted = true;
                //     PromotedIsBig = true;

                //     trigger OnAction()
                //     var
                //         Err001: Label 'Appeal for Case No. %1 already exists.';
                //     begin
                //         if Confirm('Are you sure want to reopen this case?', true) then begin
                //             Cases.Get(Rec."Employee No", Rec."Case Number");

                //             Appeals.Reset();
                //             Appeals.SetRange("Case Number", Rec."Case Number");
                //             Appeals.SetRange("Employee No", Rec."Employee No");
                //             if Appeals.FindFirst then
                //                 Error(Err001, Appeals."Case Number");

                //             Appeals.Init();
                //             Appeals."Case Number" := Rec."Case Number";
                //             Appeals."Employee No" := Rec."Employee No";
                //             Appeals.Validate("Employee No");
                //             Appeals."Appeal Date" := Today;
                //             Appeals.Insert();

                //             Cases.Status := Status::Appeal;
                //             Cases."Appeal Date" := Today;
                //             Cases."Closed By" := UserId;
                //             if Cases.Modify() then
                //                 Message('Case Marked as Appeal');
                //         end;
                //     end;
                // }
                action("Notify Employee")
                {
                    ApplicationArea = Basic;
                    Image = Reminder;
                    Promoted = true;
                    PromotedIsBig = true;
                    Caption = 'Send Employee Case Letter';

                    trigger OnAction()
                    var
                        DocumentCount: integer;
                        Err002: Label 'Attachment is required.';
                        Txt003: Label 'Are you sure you want sent case letter to employee?';
                    begin
                        if confirm(Txt003, true) then begin
                            Rec.TestField("Date to Respond");

                            DocAttach.Reset();
                            DocAttach.SetRange("Table ID", Database::"HR Disciplinary Cases");
                            DocAttach.SetRange("No.", Rec."Case Number");
                            DocAttach.FindSet;
                            DocumentCount := DocAttach.Count;

                            if DocumentCount = 0 then
                                Error(Err002);

                            Rec.NotifyEmployeeToRespond(Rec);
                        end;
                    end;
                }
                action("Notify on Disciplinary Hearing")
                {
                    ApplicationArea = Basic;
                    Image = Reminder;
                    Promoted = true;
                    PromotedIsBig = true;
                    Caption = 'Notify on Disciplinary Hearing';

                    trigger OnAction()
                    var
                        DocumentCount: integer;
                        Err002: Label 'Attachment is required.';
                        Txt004: Label 'Are you sure you want to notify committee members and employee on disciplinary hearing?';
                    begin
                        if Confirm(Txt004, true) then begin
                            Rec.TestField("Disciplinary Hearing", true);
                            Rec.TestField("Disciplinary Commitee");
                            Rec.TestField("Disciplinary Hearing Date");
                            Rec.TestField("Hearing Venue");
                            
                            Rec.NotifyEmployeeAndCommitteeOnDispHearing(Rec);
                        end;
                    end;
                }
            }
            group("Related Information")
            {
                Caption = 'Related Information';
                Image = BankContact;
                action("Disciplinary Status")
                {
                    ApplicationArea = Basic;
                    Image = BankContact;

                    trigger OnAction()
                    begin
                        DiscStatus.Reset;
                        DiscStatus.SetRange(DiscStatus."Employee No", "Employee No");
                        DiscStatus.SetRange(DiscStatus."Case Number", "Case Number");
                        Page.Run(69288, DiscStatus);
                    end;
                }
                action("Appeals")
                {
                    ApplicationArea = Basic;
                    Image = ReOpen;

                    trigger OnAction()
                    begin
                        Appeals.Reset();
                        Appeals.SetRange("Case Number", Rec."Case Number");
                        Appeals.SetRange("Employee No", Rec."Employee No");
                        Page.Run(50044, Appeals);
                    end;
                }
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }
            }
            group(Attachments)
            {
                Caption = 'Attachments';
                Image = Administration;
                action(DocAttach0)
                {
                    // ApplicationArea = All;
                    // Caption = 'HR Documents';
                    // Image = Attach;
                    // Promoted = true;
                    // PromotedCategory = Category8;
                    // RunObject = Page "Document Attachment Details";
                    // RunPageLink = "No."=field("Case Number"),
                    //               "Document Type"=filter("HR Case");
                    // RunPageView = where("Document Type"=filter("HR Case"));
                    // ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    // trigger OnAction()
                    // var
                    //     DocumentAttachmentDetails: Page "Document Attachment Details";
                    //     RecRef: RecordRef;
                    // begin
                    //     // RecRef.GETTABLE(Rec);
                    //     // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    //     // DocumentAttachmentDetails.RUNMODAL;
                    // end;
                }
            }
        }
    }

    var
        Cases: Record "HR Disciplinary Cases";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Employee: Record Employee;
        HRDiscipMemb: Record "Disciplinary Committee Members";
        HRCases: Record "HR Disciplinary Cases";
        CaseRegister: Record "Case Register";
        AssignmentMatrixX: Record "Assignment Matrix-X";
        DisciplinaryStatus: Record "Disciplinary Status Table";
        PayPeriod: Record "Payroll PeriodX";
        CR: Record "Case Register";
        AmountDeducted: Decimal;
        Emp: Record Employee;
        AssMatx: Record "Assignment Matrix-X";
        DiscStatus: Record "Employee Disciplinary Status";
        EmployeeDisciplinaryStatus: Record "Employee Disciplinary Status";
        Appeals: Record "HR Appealed Disc. Cases";
        DocAttach: Record "Document Attachment";
}

