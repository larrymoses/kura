#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69146 "Employee Card-HR1"
{
    Caption = 'Employee Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        /*IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                          */

                    end;
                }
                field("First Name"; "First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; "Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; "Middle Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Middle Name/Initials';
                }
                field(Initials; Initials)
                {
                    ApplicationArea = Basic;
                }
                field(Position; Position)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Job ID"; "Job ID")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Job Title"; "Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; "Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Search Name"; "Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Marital Status"; "Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(Religion; Religion)
                {
                    ApplicationArea = Basic;
                }
                field("Ethnic Origin"; "Ethnic Origin")
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region ';
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 3"; "Shortcut Dimension 3")
                {
                    ApplicationArea = Basic;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
                }
                field(Picture; Image)
                {
                    ApplicationArea = Basic;
                }
                field(HOD; HOD)
                {
                    ApplicationArea = Basic;
                }
                field("Regional Manager"; "Regional Manager")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                }
                field("ICT Help Desk Admin"; "ICT Help Desk Admin")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Head"; "Directorate Head")
                {
                    ApplicationArea = Basic;
                }
                field("Region Name"; "Region Name")
                {
                    ApplicationArea = Basic;
                }
                field(Workstation; Workstation)
                {
                    ApplicationArea = Basic;
                }
                field("Alternative Station"; "Alternative Station")
                {
                    ApplicationArea = Basic;
                }
                field("Driver?"; "Driver?")
                {
                    ApplicationArea = Basic;
                }
                field("Fleet Admin"; "Fleet Admin")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Organization Units")
            {
                field("Directorate Code"; "Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; "Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Division; Division)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field(Extension; Extension)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Mobile Phone No."; "Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Pager; Pager)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Phone No.2"; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Company E-Mail"; "Company E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address Code"; "Alt. Address Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Alt. Address Start Date"; "Alt. Address Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Alt. Address End Date"; "Alt. Address End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Work Phone Number"; "Work Phone Number")
                {
                    ApplicationArea = Basic;
                }
                field("Ext."; "Ext.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field("Date Of Birth"; "Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Age; Age)
                {
                    ApplicationArea = Basic;
                }
                field("Current Year"; CurrentYear)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employment Date"; "Employment Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Of Probation Date"; "End Of Probation Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Last Promotion Date';
                }
                field("Pension Scheme Join"; "Pension Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension Scheme Join Date';
                }
                field("Medical Scheme Join"; "Medical Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Medical Scheme Join Date';
                }
                field("Retirement Date"; "Retirement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date"; "Contract End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Notice Period"; "Notice Period")
                {
                    ApplicationArea = Basic;
                }
                field("Send Alert to"; "Send Alert to")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Inactive Date"; "Inactive Date")
                {
                    ApplicationArea = Basic;
                }
                field("Cause of Inactivity Code"; "Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Emplymt. Contract Code"; "Emplymt. Contract Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment Type';
                }
                field("Statistics Group Code"; "Statistics Group Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Resource No."; "Resource No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Union Code"; "Union Code")
                {
                    ApplicationArea = Basic;
                }
                field("Union Membership No."; "Union Membership No.")
                {
                    ApplicationArea = Basic;
                }
                field("Disciplinary status"; "Disciplinary status")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Category"; "Employee Category")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Disability Details")
            {
                Caption = 'Disability Details';
                field(Disabled; Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("Disability No."; "Disability No.")
                {
                    ApplicationArea = Basic;
                }
                field("Disability Description"; "Disability Description")
                {
                    ApplicationArea = Basic;
                }
                field("Renewal date/Expiry date"; "Renewal date/Expiry date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Separation Details")
            {

                field("Reason for termination"; "Reason for termination")
                {
                    ApplicationArea = Basic;
                }
                field("Termination Date"; "Termination Date")
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Leaving"; "Date Of Leaving")
                {
                    ApplicationArea = Basic;
                }
                field("Exit Interview Conducted"; "Exit Interview Conducted")
                {
                    ApplicationArea = Basic;
                }
                field("Exit Interview Date"; "Exit Interview Date")
                {
                    ApplicationArea = Basic;
                    Editable = ExitDateEditable;
                }
                field("Exit Interview Done by"; "Exit Interview Done by")
                {
                    ApplicationArea = Basic;
                    Editable = ExitByEditable;
                }
                field("Allow Re-Employment In Future"; "Allow Re-Employment In Future")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Payroll Details")
            {
                Caption = 'Payroll Details';
                field("Pays tax?"; "Pays tax?")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Wages"; "Pay Wages")
                {
                    ApplicationArea = Basic;
                }
                field("Pay Mode"; "Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("HELB No"; "HELB No")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; "P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("N.H.I.F No"; "N.H.I.F No")
                {
                    ApplicationArea = Basic;
                }
                field("Social Security No."; "Social Security No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'N.S.S.F No.';
                }
                field("ID Number"; "ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Posting Group"; "Employee Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group"; "Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic;
                }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
                    field("Bank Account Number"; "Bank Account Number")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee's Bank"; "Employee's Bank")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Name"; "Bank Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch"; "Bank Branch")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch Name"; "Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                    }
                }
                group("Bank 2")
                {
                    Caption = 'Bank 2';
                    field("Employee's Bank 2"; "Employee's Bank 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Name 2"; "Bank Name 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch 2"; "Bank Branch 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch Name 2"; "Bank Branch Name 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Account No. 2"; "Bank Account No. 2")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';
                field("Salary Scale"; "Salary Scale")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                field("Leave Days B/F"; "Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days B/F';
                    Importance = Promoted;
                }
                field("Allocated Leave Days"; "Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Total (Leave Days)"; "Total (Leave Days)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total (Leave Days)';
                    Importance = Promoted;
                }
                field("Total Leave Taken"; "Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Recalled Leave"; "Recalled Leave")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Outstanding Bal"; "Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Balance"; "Leave Balance")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Acrued Leave Days"; "Acrued Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Status"; "Leave Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Type Filter"; "Leave Type Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                }
                field("Leave Period Filter"; "Leave Period Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    Visible = false;
                }
                field("On Leave"; "On Leave")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control35; "HR Employees Factbox")
            {
                Caption = '<Employees Factbox>';
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5200),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    Visible = false;
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                }
                action("&Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("&Relatives")
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    Image = Relatives;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("Staff Exit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Exit';
                    Image = Absence;
                    RunObject = Page "Staff Exit Card";
                    RunPageLink = "No." = field("No.");
                }
                // action("&Next Of Kin")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Next Of Kin';
                //     Image = Relatives;
                //     RunObject = Page "Employment History";
                //     RunPageLink = "Application No" = field("No.");
                //     Visible = false;
                // }
                // action("&Dependants")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Dependants';
                //     Image = Relatives;
                //     RunObject = Page "Professional Qualifications";
                //     RunPageLink = "Application No" = field("No.");
                //     Visible = false;
                // }
                // action("&Emergency Contacts")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Emergency Contacts';
                //     Image = ContactPerson;
                //     RunObject = Page "Apptitude Interview Lines";
                //     RunPageLink = "Line No" = field("No.");
                //     Visible = false;
                // }
                // action("Mi&sc. Article Information")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Mi&sc. Article Information';
                //     Image = Filed;
                //     RunObject = Page "Misc. Article Information";
                //     RunPageLink = "Employee No." = field("No.");
                //     Visible = false;
                // }
                // action("&Confidential Information")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Confidential Information';
                //     Image = Lock;
                //     RunObject = Page "Confidential Information";
                //     RunPageLink = "Employee No." = field("No.");
                //     Visible = false;
                // }
                // action("&Medical Info")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Medical Info';
                //     Image = Lock;
                //     RunObject = Page "Vacancy Media Advertisements";
                //     RunPageLink = "Entry No." = field("No.");
                //     Visible = false;
                // }
                // action("R&esponsibilities")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'R&esponsibilities';
                //     Image = Position;
                //     RunObject = Page "Manpower Planning Lines";
                //     RunPageLink = "Entry No" = field(Position);
                //     Visible = false;
                // }
                // action("Q&ualifications")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Q&ualifications';
                //     Image = Certificate;
                //     RunObject = Page "Employee Qualifications";
                //     RunPageLink = "Employee No." = field("No.");
                // }
                // action("Employment H&istory")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employment H&istory';
                //     Image = History;
                //     RunObject = Page "Oral Interview  List";
                //     RunPageLink = "Line No." = field("No.");
                //     Visible = false;
                // }
                // action("Employee Referees")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employee Referees';
                //     Image = History;
                //     RunObject = Page "Employee Referees";
                //     RunPageLink = Field8 = field("No.");
                //     Visible = false;
                // }
                // action("I&tems Assigned")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'I&tems Assigned';
                //     Image = CheckList;
                //     RunObject = Page "Oral Interview Card";
                //     RunPageLink = "Line No." = field("No.");
                //     Visible = false;
                // }
                // action("C&onfidential Info")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'C&onfidential Info';
                //     Image = ConfidentialOverview;
                //     RunObject = Page "Job Advertisement Templates";
                //     RunPageLink = Code = field("No.");
                //     Visible = false;
                // }
                // action("A&bsences")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'A&bsences';
                //     Image = Absence;
                //     RunObject = Page "Employee Absences";
                //     RunPageLink = "Employee No." = field("No.");
                //     Visible = false;
                // }
                // separator(Action23)
                // {
                // }
                // action("Absences by Ca&tegories")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Absences by Ca&tegories';
                //     Image = AbsenceCategory;
                //     RunObject = Page "Empl. Absences by Categories";
                //     RunPageLink = "No." = field("No."),
                //                   "Employee No. Filter" = field("No.");
                //     Visible = false;
                // }
                // action("Misc. Articles &Overview")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Misc. Articles &Overview';
                //     Image = FiledOverview;
                //     RunObject = Page "Misc. Articles Overview";
                //     Visible = false;
                // }
                // action("Co&nfidential Info. Overview")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Co&nfidential Info. Overview';
                //     Image = ConfidentialOverview;
                //     RunObject = Page "Confidential Info. Overview";
                //     Visible = false;
                // }
                // separator(Action61)
                // {
                // }
                // action("Online Map")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Online Map';
                //     Image = Map;
                //     Visible = false;

                //     trigger OnAction()
                //     begin
                //         DisplayMap;
                //     end;
                // }
                // action("Create Customer Imprest A/C")
                // {
                //     ApplicationArea = Basic;
                //     Enabled = ShowCust;
                //     Image = Customer;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     Visible = false;

                //     trigger OnAction()
                //     var
                //         Cust: Record Customer;
                //     begin
                //         if CreateCustomer then
                //             Message(Text000, 'Imprest A/C')
                //         else
                //             Message(Text001, 'Imprest A/C');
                //     end;
                // }
                // action("Create Resource A/C")
                // {
                //     ApplicationArea = Basic;
                //     Enabled = ShowResource;
                //     Image = Resource;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     Visible = false;

                //     trigger OnAction()
                //     begin
                //         if CreateResource then
                //             Message(Text000, 'Resource')
                //         else
                //             Message(Text001, 'Resource');
                //     end;
                // }
                // action(Attachments)
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Attachments';
                //     Image = Attachments;
                //     Promoted = true;
                //     PromotedCategory = Category6;
                //     RunObject = Page "Applicant Referees";
                //     RunPageLink = "Job Application No" = field("No.");
                // }
                // action("Transfer Employee")
                // {
                //     ApplicationArea = Basic;
                //     Image = HRSetup;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;

                //     trigger OnAction()
                //     begin
                //         if Dialog.Confirm('Are you sure you want to stransfer %1 ?', true, "First Name" + ' ' + "Last Name") then begin
                //             Emp.Reset;
                //             Emp.SetRange("No.", "No.");
                //             Report.Run(69120, true, true, Emp);
                //             CurrPage.Close;
                //             EmpTrans.Reset;
                //             EmpTrans.SetRange("Employee No", "No.");
                //             Page.Run(69057, EmpTrans);
                //         end;
                //     end;
                // }
                // action("Transfer History")
                // {
                //     ApplicationArea = Basic;
                //     Image = History;
                //     Promoted = true;
                //     PromotedCategory = Process;

                //     trigger OnAction()
                //     begin
                //         EmpTrans.Reset;
                //         EmpTrans.SetRange("Employee No", "No.");
                //         Page.Run(69057, EmpTrans);
                //     end;
                // }
                action("Notify of Contract Expiry")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    // trigger OnAction()
                    // begin
                    //     TestField("Contract End Date");
                    //     if "Contract End Date" <> 0D then begin
                    //         if (Today - "Contract End Date") <= 180 then begin
                    //             if Emp.Get("No.") then begin
                    //                 Header := 'END OF CONTRACT NOTIFICATION ON ' + Format("Contract End Date");
                    //                 if SMTPSetup.Get() then begin
                    //                     SenderEmail := SMTPSetup."Email Sender Address";
                    //                     SenderName := SMTPSetup."Email Sender Name";
                    //                 end;
                    //                 if Emp."E-Mail" <> '' then begin
                    //                     //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('This is to notify you that your contract will be coming to an end on');// for the month of January 2014');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('Contract End Date: ' + Format("Contract End Date"));
                    //                     //SMTPMail.AddBodyline('<br>');
                    //                     //SMTPMail.AddBodyline('Kindly prepare adequately');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('Thanks & Regards');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline(SenderName);
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('<HR>');
                    //                     //SMTPMail.AddBodyline('This is a system generated mail.');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kerra.go.ke');
                    //                     //SMTPMail.AddBodyline('<br><br>');
                    //                     //SMTPMail.Send;
                    //                 end;
                    //                 //End email
                    //             end;
                    //         end;
                    //     end;
                    // end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowCust := CreateCustomer;
        ShowResource := CreateResource;
    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
        ExitDateEditable := true;
        ExitByEditable := true;
        CalculateDates;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if UserSetup.Get(UserId) then begin
            if not UserSetup."Principal Accountant" = true then
                Error('You do not have permissions to create a new employee.Please contact ICT department');
        end;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        ShowCust := CreateCustomer;
        ShowResource := CreateResource;
        CalculateDates;
    end;

    var
        [InDataSet]
        MapPointVisible: Boolean;
        [InDataSet]
        ShowCust: Boolean;
        [InDataSet]
        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';
        [InDataSet]
        ExitDateEditable: Boolean;
        [InDataSet]
        ExitByEditable: Boolean;
        Emp: Record Employee;
        EmpTrans: Record "Employee Transfers";
        CurrentYear: Integer;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        UserSetup: Record "User Setup";


    procedure Updatecontrols()
    begin

        if "Exit Interview Conducted" = "exit interview conducted"::Yes then begin
            ExitByEditable := true;
            ExitDateEditable := true;
        end else begin
            ExitByEditable := false;
            ExitDateEditable := false;
        end;
    end;

    local procedure CalculateDates()
    begin
        if "Date Of Birth" <> 0D then
            Age := Format(Date2dmy(Today, 3) - Date2dmy("Date Of Birth", 3)) + ' Years';
        CurrentYear := Date2dmy(Today, 3);
    end;
}

