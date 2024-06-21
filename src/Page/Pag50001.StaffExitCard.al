/// <summary>
/// Page Staff Exit Card (ID 50001).
/// </summary>
page 50001 "Staff Exit Card"
{
    Caption = 'Staff Exit Card';
    PageType = Card;
    SourceTable = Employee;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Editable = false;

                    trigger OnValidate()
                    var
                        Employee: Record Employee;
                    begin
                        Employee.Reset();
                        Employee.SetRange("No.", Rec."No.");
                        if Employee.FindFirst then begin
                            "First Name" := Employee."First Name";
                            "Middle Name" := Employee."Middle Name";
                            "Last Name" := Employee."Last Name";
                            "Job Title" := Employee."Job Title";
                            Address := Employee.Address;
                            "Address 2" := Employee."Address 2";
                            "Phone No." := Employee."Phone No.";
                            "E-Mail" := Employee."E-Mail";
                            "Department Name" := Employee."Department Name";
                            "Region Name" := Employee."Region Name";
                            "Shortcut Dimension 3" := Employee."Shortcut Dimension 3";
                            "Global Dimension 1 Code" := Employee."Global Dimension 1 Code";
                            Workstation := Employee.Workstation;
                            Gender := Employee.Gender;
                            "Date Of Leaving" := Employee."Date Of Leaving";
                            "Date Of Birth" := Employee."Date Of Birth";
                            Age := Employee.Age;
                            "Employment Date" := Employee."Employment Date";
                            "Retirement Date" := Employee."Retirement Date";
                            "Employee Category" := Employee."Employee Category";
                            "Exit Interview Date" := Employee."Exit Interview Date";
                            "Exit Interview Conducted" := Employee."Exit Interview Conducted";
                            "ID Number" := Employee."ID Number";
                            "Social Security No." := Employee."Social Security No.";
                            "N.H.I.F No" := Employee."N.H.I.F No";
                            "Leave Balance" := Employee."Leave Balance";
                            Balance := Employee.Balance;
                            "Salary Scale" := Employee."Salary Scale";
                            "P.I.N" := Employee."P.I.N";
                        end;
                    end;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s first name.';
                    Editable = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s middle name.';
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s last name.';
                    Editable = false;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s job title.';
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s address.';
                    Editable = false;
                    Importance = Additional;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies additional address information.';
                    Editable = false;
                    Importance = Additional;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s telephone number.';
                    Editable = false;
                    Importance = Additional;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s private email address.';
                    Editable = false;
                    Importance = Additional;
                }
                field("Department Name"; CustomFunction.DimensionName(3,Rec."Shortcut Dimension 3 Code"))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                    Editable = false;
                }
                field("Region Name"; CustomFunction.DimensionName(1,rec."Global Dimension 1 Code"))
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Region Name field.';
                    Editable = false;
                }
                field(Workstation; Rec.Workstation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workstation field.';
                    Editable = false;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the employee''s gender.';
                    Editable = false;
                }
                field("Exit Date"; Rec."Date Of Leaving")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field("Staff Exit Code"; Rec."Staff Exit Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Exit Code field.';
                    trigger OnValidate()
                    begin
                        EnableControls();
                    end;
                }
                field("Staff Exit Description"; Rec."Staff Exit Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff Exit Description field.';
                }
                field("Allow Re-Employment In Future"; Rec."Allow Re-Employment In Future")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Allow Re-Employment In Future field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                    Importance = Additional;
                }
            }
            group("Administration Details")
            {
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the date of birth here to calculate retirement date';
                    Editable = false;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Age field.';
                    Editable = false;
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                    Editable = false;
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Retirement Date field.';
                    Editable = false;
                }
                field("Employee Category"; Rec."Employee Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Category field.';
                    Editable = false;
                }
            }
            part("Termination Grounds"; "Exit Termination Grounds CardP")
            {
                Visible = TerminationGrounds;
                Caption = 'Termination Details';
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
            group("Exit Interview")
            {
                Visible = ExitInterview;
                field("Exit Interview Conducted"; Rec."Exit Interview Conducted")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Interview Conducted field.';
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Interview Date field.';
                }
                field("Exit Interview Comments";Rec."Exit Interview Comments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Interview Comments field.';
                }
            }
            part("Staff Clearance"; "Staff Clearance Subform")
            {
                Visible = Clearance;
                Caption = 'Staff Clearance';
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No."),
                                "Employee No" = field( "No."),
                                "No." = field("No.");
            }
            group("Payroll Details")
            {
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID Number field.';
                    Editable = false;
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                    Editable = false;
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                    Editable = false;
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Social Security No. field.';
                    Editable = false;
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                    Importance = Additional;
                    Editable = false;
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                    Editable = false;
                    Importance = Additional;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balance field.';
                    Editable = false;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
            part("Attached Documents1"; "Document Attachment Factbox1")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = CONST(5200), "No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(Close)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Close - Staff Exit';
                Image = CloseDocument;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction()
                var
                    CloseDocument: Codeunit "HR Make Leave Ledg. Entry";
                begin
                    CloseDocument.CloseStaffExit(Rec);
                end;
            }
        }
        area(Processing)
        {
            action("Suggest Clearance Lines")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Suggest Clearance Lines';
                Image = Suggest;
                ToolTip = 'Suggest Clearance Lines.';
                Visible = Clearance;

                trigger OnAction()
                begin
                    Rec.FnSuggestClearanceLines();
                end;
            }
            group(Staff)
            {
                action("Send Exit Letter")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send Exit Letter';
                    Image = Email;
                    ToolTip = 'Send staff an exit letter.';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    trigger OnAction()
                    begin

                    end;
                }
                action("Send Certificate of Service")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send Certificate of Service';
                    Image = Email;
                    ToolTip = 'Send staff a certificate of service.';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Txt001: label 'Do you want to preview the certificate before sending?';
                    begin
                        if Confirm(Txt001, true) then begin
                            Rec.SetRange("No.", Rec."No.");
                            Report.Run(50019, true, true, Rec);
                        end;
                        SendCertOfService(Rec);
                    end;
                }
            }
            // group("F&unctions")
            // {
            //     Caption = 'F&unctions';
            //     Image = "Action";
            //     action(SendApprovalRequest)
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Send Approval Request';
            //         Image = SendApprovalRequest;
            //         Promoted = true;
            //         PromotedCategory = New;

            //         trigger OnAction()
            //         var
            //             Var_Varaint: Variant;
            //             CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
            //         begin
            //             Rec.TestField("Approval Status", Rec."Approval Status"::Open);//status must be open.
            //             Var_Varaint := Rec;
            //             if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(Var_Varaint) then
            //                 CustomApprovalMgt.OnSendDocForApproval(Var_Varaint);

            //         end;
            //     }
            //     action(CancelApprovalRequest)
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Cancel Approval Re&quest';
            //         Image = Cancel;
            //         Promoted = true;
            //         PromotedCategory = New;

            //         trigger OnAction()
            //         var
            //             VarVariant: Variant;
            //             CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
            //             CustomApprovalEntry: record "Approval Entry";
            //         begin
            //             CustomApprovalEntry.Reset;
            //             CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Rec."No.");
            //             CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Rec.RecordId);
            //             CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
            //             if CustomApprovalEntry.FindSet then
            //                 repeat
            //                     //   OldStatus :=ApprovalEntry.Status;
            //                     CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
            //                     CustomApprovalEntry.Modify(true);
            //                 until CustomApprovalEntry.Next = 0;

            //             Rec."Approval Status" := Rec."Approval Status"::Open;

            //             Rec.Modify(true);
            //             Message('An Approval Requested Has Been Cancelled.');
            //         end;
            //     }
            // }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        EnableControls();
    end;

    var
        CustomFunction: Codeunit "Custom Function";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

        ExitInterview: Boolean;
        Clearance: Boolean;
        Notice: Boolean;
        TerminalBenefits: Boolean;
        TerminationGrounds: Boolean;
        ModifyCard: Boolean;

    procedure EnableControls()
    begin
        ExitInterview := Rec.RequiresInterview();
        Clearance := Rec.RequiresClearance();
        Notice := Rec.RequiresNotice();
        TerminalBenefits := Rec.HasTerminalBenefits();
        TerminationGrounds := Rec.HasTerminationGrounds();
    end;

    local procedure SendCertOfService(Emp: Record Employee)
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
        OutStr: OutStream;
        CompanyInfo: Record "Company Information";
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Emp);

        TempBlob.CreateOutStream(OutStr);
        if Report.SaveAs(
            Report::"Certificate of Service",
            '',
            ReportFormat::Pdf,
            OutStr,
            RecRef
        ) then begin
            TempBlob.CreateInStream(InStr);
            //txtB64 := cnv64.ToBase64(InStr, true);
            EmailBody := 'Hello ' + Emp."First Name" + ',';
            EmailBody += '<br><br><p>PFA your certificate of service.</p>';
            EmailBody += '<br><br></p>Kind Regards,</p>';
            EmailBody += '<br><p>' + CompanyInfo.Name + '.</p>';
            EmailSubject := 'Certificate of Service';
            EmailMessage.Create(
                Emp."E-Mail",
                EmailSubject,
                EmailBody,
                true
            );

            EmailMessage.AddAttachment(
                'Certificate of Service.pdf',
                'PDF',
                InStr
            );

            Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        end;
    end;
}
