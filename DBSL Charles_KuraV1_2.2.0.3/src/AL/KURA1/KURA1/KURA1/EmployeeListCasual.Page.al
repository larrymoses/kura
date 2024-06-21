#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 69068 "Employee List-Casual"
{
    // ApplicationArea = Basic;
    // Caption = 'Employee List-Casual';
    // CardPageID = "Employee Card-Casual";
    // Editable = false;
    // PageType = List;
    // SourceTable = Employee;
    // SourceTableView = where("Employee Category"=filter(Casual));
    // UsageCategory = Lists;

    // layout
    // {
    //     area(content)
    //     {
    //         repeater(Control1)
    //         {
    //             field("No.";"No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(FullName;FullName)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Full Name';
    //             }
    //             field("First Name";"First Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Middle Name";"Middle Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Last Name";"Last Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Job Title";"Job Title")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Phone No.";"Phone No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Job ID";"Job ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("User ID";"User ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("E-Mail";"E-Mail")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Gender;Gender)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(HOD;HOD)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Directorate Head";"Directorate Head")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Workstation;Workstation)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Region;Region)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Directorate Code";"Directorate Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Department Name";"Department Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Date Of Birth";"Date Of Birth")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Age;Age)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Employment Date";"Employment Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("P.I.N";"P.I.N")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("NHIF No.";"NHIF No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("NSSF No.";"NSSF No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("HELB No";"HELB No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Bank Branch";"Bank Branch")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Bank Account Number";"Bank Account Number")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Bank Name";"Bank Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Bank Branch Name";"Bank Branch Name")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Salary Scale";"Salary Scale")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Pays tax?";"Pays tax?")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Status;Status)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Leave Outstanding Bal";"Leave Outstanding Bal")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Posting Group";"Posting Group")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Disability No.";"Disability No.")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Renewal date/Expiry date";"Renewal date/Expiry date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Reason for termination Code";"Reason for termination Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Reason for termination";"Reason for termination")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Termination Date";"Termination Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Date Of Leaving";"Date Of Leaving")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         part(Control3;"HR Employees Factbox")
    //         {
    //             SubPageLink = "No."=field("No.");
    //         }
    //         systempart(Control1900383207;Links)
    //         {
    //             Visible = false;
    //         }
    //         systempart(Control1905767507;Notes)
    //         {
    //             Visible = true;
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         group("E&mployee")
    //         {
    //             Caption = 'E&mployee';
    //             Image = Employee;
    //             action("Co&mments")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Co&mments';
    //                 Image = ViewComments;
    //                 RunObject = Page "Human Resource Comment Sheet";
    //                 RunPageLink = "Table Name"=const(Employee),
    //                               "No."=field("No.");
    //                 Visible = false;
    //             }
    //             group(Dimensions)
    //             {
    //                 Caption = 'Dimensions';
    //                 Image = Dimensions;
    //                 action("Dimensions-Single")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Dimensions-Single';
    //                     Image = Dimensions;
    //                     RunObject = Page "Default Dimensions";
    //                     RunPageLink = "Table ID"=const(5200),
    //                                   "No."=field("No.");
    //                     ShortCutKey = 'Shift+Ctrl+D';
    //                     Visible = false;
    //                 }
    //                 action("Dimensions-&Multiple")
    //                 {
    //                     ApplicationArea = Basic;
    //                     Caption = 'Dimensions-&Multiple';
    //                     Image = DimensionSets;

    //                     trigger OnAction()
    //                     var
    //                         Employee: Record Employee;
    //                         DefaultDimMultiple: Page "Default Dimensions-Multiple";
    //                     begin
    //                         CurrPage.SetSelectionFilter(Employee);
    //                         DefaultDimMultiple.SetMultiEmployee(Employee);
    //                         DefaultDimMultiple.RunModal;
    //                     end;
    //                 }
    //             }
    //             action("&Picture")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Picture';
    //                 Image = Picture;
    //                 RunObject = Page "Employee Picture";
    //                 RunPageLink = "No."=field("No.");
    //             }
    //             action("&Alternative Addresses")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Alternative Addresses';
    //                 Image = Addresses;
    //                 RunObject = Page "Alternative Address List";
    //                 RunPageLink = "Employee No."=field("No.");
    //             }
    //             action("&Relatives")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Relatives';
    //                 Image = Relatives;
    //                 RunObject = Page "Employee Relatives";
    //                 RunPageLink = "Employee No."=field("No.");
    //             }
    //             action("Mi&sc. Article Information")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Mi&sc. Article Information';
    //                 Image = Filed;
    //                 RunObject = Page "Misc. Article Information";
    //                 RunPageLink = "Employee No."=field("No.");
    //             }
    //             action("Co&nfidential Information")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Co&nfidential Information';
    //                 Image = Lock;
    //                 RunObject = Page "Confidential Information";
    //                 RunPageLink = "Employee No."=field("No.");
    //             }
    //             action("Q&ualifications")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Q&ualifications';
    //                 Image = Certificate;
    //                 RunObject = Page "Employee Qualifications";
    //                 RunPageLink = "Employee No."=field("No.");
    //             }
    //             action("A&bsences")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'A&bsences';
    //                 Image = Absence;
    //                 RunObject = Page "Employee Absences";
    //                 RunPageLink = "Employee No."=field("No.");
    //                 Visible = false;
    //             }
    //             separator(Action51)
    //             {
    //             }
    //             action("Absences by Ca&tegories")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Absences by Ca&tegories';
    //                 Image = AbsenceCategory;
    //                 RunObject = Page "Empl. Absences by Categories";
    //                 RunPageLink = "No."=field("No."),
    //                               "Employee No. Filter"=field("No.");
    //                 Visible = false;
    //             }
    //             action("Misc. Articles &Overview")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Misc. Articles &Overview';
    //                 Image = FiledOverview;
    //                 RunObject = Page "Misc. Articles Overview";
    //                 Visible = false;
    //             }
    //             action("Con&fidential Info. Overview")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Con&fidential Info. Overview';
    //                 Image = ConfidentialOverview;
    //                 RunObject = Page "Confidential Info. Overview";
    //                 Visible = false;
    //             }
    //         }
    //     }
    // }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     if UserSetup.Get(UserId) then begin
    //       if not UserSetup."Principal Accountant"=true then
    //         Error('You do not have permissions to create a new employee.Please contact ICT department');
    //       end;
    //     "Employee Category":="employee category"::Casual;
    // end;

    // trigger OnOpenPage()
    // begin
    //     //NotifyofContractExpiry
    // end;

    // var
    //     SMTPSetup: Record "Email Account";
    //     SMTPMail: Codeunit Mail;
    //     ObjCompany: Record "Company Information";
    //     Header: Text;
    //     SenderEmail: Text;
    //     SenderName: Text;
    //     UserSetup: Record "User Setup";

    // local procedure NotifyofContractExpiry()
    // var
    //     Emp: Record Employee;
    // begin
    //     if "Contract End Date" <> 0D then begin
    //       if (Today - "Contract End Date" ) <= 180 then begin
    //           if Emp.Get("No.") then begin
    //             Header:='END OF CONTRACT NOTIFICATION ON '+Format("Contract End Date");
    //             if SMTPSetup.Get() then begin
    //               SenderEmail:=SMTPSetup."Email Sender Address";
    //               SenderName:= SMTPSetup."Email Sender Name";
    //             end;
    //             if Emp."E-Mail" <> '' then begin
    //               //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',true);
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('This is to notify you that your contract will be coming to an end on');// for the month of January 2014');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('Contract End Date: '+Format("Contract End Date"));
    //               //SMTPMail.AddBodyline('<br>');
    //               //SMTPMail.AddBodyline('Kindly prepare adequately');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('Thanks & Regards');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline(SenderName);
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('<HR>');
    //               //SMTPMail.AddBodyline('This is a system generated mail.');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kerra.go.ke');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.Send;
    //             end;
    //             //End email
    //           end;
    //         end;
    //     end;
    // end;
}

