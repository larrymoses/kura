#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 69007 "Shortlisting Criteria"
{

    trigger OnRun()
    begin
    end;

    //     var
    //         NoOfYears: Decimal;
    //         Age: Integer;
    //         ApplicantNoOfYears: Decimal;
    //         ApplicantBackground1: Record "Applicant Background";
    //         Tenure: Integer;
    //         TableId: Integer;
    //         ApplicationTable: Record "Job Application Table";
    //         EvaluateValue: Boolean;
    //         NoSeriesMgt: Codeunit NoSeriesManagement;
    //         "VacancyNo.": Code[30];

    //     procedure BasedOnCriteria(VacancyRequisitionLines: Record "Vacancy Requisition Lines")
    //     var
    //         Application: Record "Job Application Table";
    //         ShortlistCriteria: Record "Shortlist Criteria";
    //         CriteriaSetup: Record "Criteria Setup";
    //         ApplicantBackground: Record "Applicant Background";
    //     begin
    //         Application.Reset;
    //         Application.SetRange("Vacancy Requisition No.",VacancyRequisitionLines."Requisition No.");
    //         if Application.FindSet then begin
    //           repeat
    //             Application.Shortlisted:=ShortList(Application);
    //             Application.Modify(true);

    //             until Application.Next=0;

    //           end
    //     end;

    //     local procedure ShortList(JobApplicationTable: Record "Job Application Table") Shortlisted: Boolean
    //     var
    //         ShortlistCriteria: Record "Shortlist Criteria";
    //         CriteriaSetup: Record "Criteria Setup";
    //         ApplicantBackground: Record "Applicant Background";
    //         Passed: Boolean;
    //     begin
    //         Shortlisted:=false;
    //         ShortlistCriteria.Reset;
    //         ShortlistCriteria.SetRange("Requisition No.",JobApplicationTable."Vacancy Requisition No.");
    //         Passed:=true;
    //         if ShortlistCriteria.FindSet then begin
    //           repeat

    //                    if (ShortlistCriteria.Type=ShortlistCriteria.Type::Education) and (Passed=true)then begin
    //                   //check
    //                   ApplicantBackground.Reset;
    //                   ApplicantBackground.SetRange("Application No",JobApplicationTable."Application No");
    //                   ApplicantBackground.SetRange(Attainment,ShortlistCriteria.Requirement);
    //                   if  ApplicantBackground.FindSet then begin
    //                    Passed:=true;
    //                    Shortlisted:=true;
    //                   end
    //                   else begin
    //                           Passed:=false;
    //                    end;
    //                    end else  if (ShortlistCriteria.Type=ShortlistCriteria.Type::"Professional Qualification") and (Passed=true)then begin
    //                       ApplicantBackground.Reset;
    //                       ApplicantBackground.SetRange("Application No",JobApplicationTable."Application No");
    //                       ApplicantBackground.SetRange(Attainment,ShortlistCriteria.Requirement);
    //                       if ApplicantBackground.FindSet then begin

    //                           Passed:=true;
    //                           Shortlisted:=true;

    //                       end
    //                       else begin
    //                           Passed:=false;
    //                         Shortlisted:=false;
    //                       end;
    //                     end//
    //                     else  if (ShortlistCriteria.Type=ShortlistCriteria.Type::"Professional Body") and (Passed=true)then begin
    //                       ApplicantBackground.Reset;
    //                       ApplicantBackground.SetRange("Application No",JobApplicationTable."Application No");
    //                       ApplicantBackground.SetRange(Institution,ShortlistCriteria.Requirement);
    //                       if ApplicantBackground.FindSet then begin

    //                           Passed:=true;
    //                           Shortlisted:=true;

    //                       end
    //                       else begin
    //                           Passed:=false;
    //                         Shortlisted:=false;
    //                       end
    //                     end
    //                     else  if (ShortlistCriteria.Type=ShortlistCriteria.Type::Employment) and (Passed=true)then begin
    //                       ApplicantBackground.Reset;
    //                       ApplicantBackground.SetRange("Application No",JobApplicationTable."Application No");
    //                       ApplicantBackground.SetRange(Type,ShortlistCriteria.Type::Employment);
    //                       if ApplicantBackground.FindSet then begin
    //                          //calculate the total no of years
    //                       NoOfYears:=TotalYears(ApplicantBackground);
    //                           if Format(NoOfYears)>ShortlistCriteria.Requirement then begin
    //                             Passed:=true;
    //                             Shortlisted:=true;
    //                           end;
    //                         end
    //                       else begin
    //                           Passed:=false;
    //                         Shortlisted:=false;
    //                       end
    //                     end
    //                     else  if (ShortlistCriteria.Type=ShortlistCriteria.Type::General) and (Passed=true) and (ShortlistCriteria."General Category"=Format(CriteriaSetup."general categories"::Convicted))then begin
    //                      ApplicationTable.Reset;
    //                      ApplicationTable.SetRange("Application No",JobApplicationTable."Application No");
    //                      Evaluate(EvaluateValue,ShortlistCriteria.Requirement);
    //                      ApplicationTable.SetRange(Convicted,EvaluateValue);
    //                      if ApplicationTable.FindSet then begin
    //                          Passed:=true;
    //                          Shortlisted:=true;
    //                         end
    //                       else begin
    //                           Passed:=false;
    //                         Shortlisted:=false;
    //                       end
    //                     end
    //                      else
    //                     Shortlisted:=false;
    //                  until ShortlistCriteria.Next = 0;
    //           end else begin
    //            Message('There is no criteria found');
    //             end;
    //         exit(Shortlisted);
    //     end;

    //     local procedure TotalYears(Employment: Record "Applicant Background") NumberOfYears: Decimal
    //     var
    //         EmploymentHistory: Record "Applicant Background";
    //         NoOfDays: Decimal;
    //         YearsCalculated: Decimal;
    //     begin
    //         EmploymentHistory.Reset;
    //         EmploymentHistory.SetRange("Application No",Employment."Application No");
    //         NumberOfYears:=0.0;
    //         if EmploymentHistory.FindSet then begin
    //           repeat
    //            NoOfDays:=EmploymentHistory."To Date" - EmploymentHistory."From Date";
    //            NumberOfYears:=NumberOfYears+NoOfDays/365;
    //            until EmploymentHistory.Next=0;
    //         end;
    //         exit(NumberOfYears);
    //     end;


    //     procedure FnSendEmaiNotificationOnApplicantRegRequest(SupplierRequest: Record Contact)
    //     var
    //         SupplierReq: Record Contact;
    //         LastFieldNo: Integer;
    //         FooterPrinted: Boolean;
    //         FileDirectory: Text[100];
    //         FileName: Text[100];
    //         ReportID: Integer;
    //         "Object": Record "Object";
    //         Window: Dialog;
    //         RunOnceFile: Text[1000];
    //         TimeOut: Integer;
    //         Customer2: Record Customer;
    //         Cust: Record Customer;
    //         cr: Integer;
    //         lf: Integer;
    //         EmailBody: array [2] of Text[30];
    //         BodyText: Text[250];
    //         mymail: Codeunit Mail;
    //         DefaultPrinter: Text[200];
    //         WindowisOpen: Boolean;
    //        // FileDialog: Codeunit Mail;
    //         SendingDate: Date;
    //         SendingTime: Time;
    //         Counter: Integer;
    //         //cu400: Codeunit Mail;
    //         DocLog: Record "Document E-mail Log";
    //         BranchName: Code[80];
    //         DimValue: Record "Dimension Value";
    //         SenderAddress: Text[100];
    //         CustEmail: Text[100];
    //         UserSetup: Record "User Setup";
    //         HRSetup: Record "Company Information";
    //         Emp: Record Vendor;
    //         PayrollMonth: Date;
    //         PayrollMonthText: Text[30];
    //         PayPeriodtext: Text;
    //         PayPeriod: Record "Payroll PeriodX";
    //         CompInfo: Record "Company Information";
    //         DateFilter: Text;
    //         FromDate: Date;
    //         ToDate: Date;
    //         FromDateS: Text;
    //         ToDateS: Text;
    //         vend: Record Vendor;
    //         StartDate: Date;
    //         EndDAte: Date;
    //         EmailVerifier: Codeunit Payroll3;
    //         IsEmailValid: Boolean;
    //         PPayableSetup: Record "Procurement Setup";
    //         RequesterName: Text[100];
    //         RequesterEmail: Text[100];
    //         emailhdr: Text[100];
    //         CompanyDetails: Text[250];
    //         SupplierDetails: Text[250];
    //         SenderMessage: Text[250];
    //         HRSetupNew: Record "Human Resources Setup";
    //     begin
    //         ///Notifying Procurement Team on supplier Request


    //            CompInfo.Get;
    //            HRSetup.Get;
    //            HRSetupNew.Get;

    //         RequesterEmail:=SupplierRequest."E-Mail";
    //         RequesterName:=SupplierRequest.Name;

    //         Window.Open('Notifying the HR Department...');

    //         WindowisOpen := true;


    //         Counter:=Counter+1;

    //         //Create message
    //         if HRSetup."E-Mail"='' then
    //           Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
    //         SenderAddress:=HRSetup."E-Mail";

    //         if HRSetupNew."HR E-mail Address" = ''  then
    //           Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
    //           CustEmail:=HRSetupNew."HR E-mail Address";

    //         CompanyDetails:='HR Officer,'+'<BR></BR>'+CompInfo.Name+'<BR></BR>'+CompInfo.Address+'<BR></BR>'+CompInfo."Address 2"+'<BR></BR>'+CompInfo.City;
    //         SenderMessage:='<BR>This is to notify you that there has been a request for Registration via e-Recruitment for your action</BR>';
    //         SupplierDetails:='Registration Request Reference No:'+SupplierRequest."No."+'<BR></BR>'+'Company Name:'+SupplierRequest.Name+'<BR></BR>'+
    //         'Tax Registration (PIN) No:'+SupplierRequest."VAT Registration No."+'<BR></BR>'+'Primary Email:'+SupplierRequest."E-Mail"+'<BR></BR>'+
    //         'Mobile Phone No:'+SupplierRequest."Phone No."+'<BR></BR>';
    //         if CustEmail='' then
    //          exit;

    //         //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
    //         emailhdr:='Applicant e-Registration Request Reference No:'+SupplierRequest."No.";

    //       //  cu400.CreateMessage(CompInfo.Name,SenderAddress,CustEmail,emailhdr,
    //         //'HR Officer,'+'<BR></BR>'+SenderMessage+SupplierDetails, true);

    //       //  cu400.AddCC(RequesterEmail);

    //       //  cu400.AddBodyline(CompanyDetails);


    //        // cu400.Send;
    //         SendingDate:=Today;
    //         SendingTime:=Time;

    //          Sleep(1000);
    //          Window.Close;
    //     end;


    //     procedure FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(SupplierRequest: Record Contact)
    //     var
    //         SupplierReq: Record Contact;
    //         LastFieldNo: Integer;
    //         FooterPrinted: Boolean;
    //         FileDirectory: Text[100];
    //         FileName: Text[100];
    //         ReportID: Integer;
    //         "Object": Record "Object";
    //         Window: Dialog;
    //         RunOnceFile: Text[1000];
    //         TimeOut: Integer;
    //         Customer2: Record Customer;
    //         Cust: Record Customer;
    //         cr: Integer;
    //         lf: Integer;
    //         EmailBody: array [2] of Text[30];
    //         BodyText: Text[250];
    //         mymail: Codeunit Mail;
    //         DefaultPrinter: Text[200];
    //         WindowisOpen: Boolean;
    //       //  FileDialog: Codeunit Mail;
    //         SendingDate: Date;
    //         SendingTime: Time;
    //         Counter: Integer;
    //         //cu400: Codeunit Mail;
    //         DocLog: Record "Document E-mail Log";
    //         BranchName: Code[80];
    //         DimValue: Record "Dimension Value";
    //         SenderAddress: Text[100];
    //         CustEmail: Text[100];
    //         UserSetup: Record "User Setup";
    //         HRSetup: Record "Company Information";
    //         Emp: Record Vendor;
    //         PayrollMonth: Date;
    //         PayrollMonthText: Text[30];
    //         PayPeriodtext: Text;
    //         PayPeriod: Record "Payroll PeriodX";
    //         CompInfo: Record "Company Information";
    //         DateFilter: Text;
    //         FromDate: Date;
    //         ToDate: Date;
    //         FromDateS: Text;
    //         ToDateS: Text;
    //         vend: Record Vendor;
    //         StartDate: Date;
    //         EndDAte: Date;
    //         EmailVerifier: Codeunit Payroll3;
    //         IsEmailValid: Boolean;
    //         PPayableSetup: Record "Procurement Setup";
    //         RequesterName: Text[100];
    //         RequesterEmail: Text[100];
    //         emailhdr: Text[100];
    //         CompanyDetails: Text[250];
    //         SupplierDetails: Text[250];
    //         SenderMessage: Text[1000];
    //         ProcNote: Text[1000];
    //         LoginDetails: Text[250];
    //         PortalUser: Record "Dynasoft Portal User";
    //         Password: Text[50];
    //         ActivationDetails: Text[1000];
    //         HRSetupNew: Record "Human Resources Setup";
    //     begin
    //         ///Notifying Procurement Team on supplier Request


    //            CompInfo.Get;
    //            HRSetup.Get;
    //            HRSetupNew.Get;



    //         RequesterEmail:=SupplierRequest."E-Mail";
    //         RequesterName:=SupplierRequest.Name;

    //         Window.Open('Notifying the Sender...');

    //         WindowisOpen := true;


    //         Counter:=Counter+1;


    //         //Create message
    //         if HRSetup."E-Mail"='' then
    //           Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
    //         SenderAddress:=HRSetup."E-Mail";

    //         if HRSetupNew."HR E-mail Address" = '' then
    //           Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
    //           CustEmail:=HRSetupNew."HR E-mail Address";

    //         CompanyDetails:='HR Officer,'+'<BR></BR>'+CompInfo.Name+'<BR></BR>'+CompInfo.Address+'<BR></BR>'+CompInfo."Address 2"+'<BR></BR>'+CompInfo.City;
    //         SenderMessage:='<BR>Thank you for using our e-Recruitment Portal which has been established to provide you with easy access to our online HR services such as E-Recruitment.'+
    //         'This email is to acknowledge that your Request for registration as a Applicant, done on: '+Format(SupplierRequest."Last Date Modified")+
    //         'has been received, summarized as follows:'+'<BR></BR>';

    //         SupplierDetails:='Registration Request Reference No:'+SupplierRequest."No."+'<BR></BR>'+'Company Name:'+SupplierRequest.Name+'<BR></BR>'+
    //         'Tax Registration (PIN) No:'+SupplierRequest."VAT Registration No."+'<BR></BR>'+'Primary Email:'+SupplierRequest."E-Mail"+'<BR></BR>'+
    //         'Mobile Phone No:'+SupplierRequest."Phone No."+'<BR></BR>';


    //         ProcNote:='Please note that the HR Office shall review your request and once approved, you shall receive an account activation email and a link to the Confidential Business Questionnaire for you to complete your registration.'+
    //         '<BR></BR>'+'If you require any assistance, please contact our HR Team team by Phone'+ HRSetup."Phone No."+'or HR support team via Email:'+HRSetupNew."HR E-mail Address";

    //         if CustEmail='' then
    //          exit;

    //         //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
    //         emailhdr:='Applicant e-Recruitment acknowledgment (Reference No:'+SupplierRequest."No."+')';

    //        // cu400.CreateMessage(CompInfo.Name,SenderAddress,CustEmail,emailhdr,
    //         //CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);

    //        // cu400.AddCC(RequesterEmail);

    //        // cu400.AddBodyline(ProcNote);


    //        // cu400.Send;
    //         SendingDate:=Today;
    //         SendingTime:=Time;

    //          Sleep(1000);
    //          Window.Close;
    //     end;


    //     procedure FnSendEmaiNotificationOnApplicantAccountActivation(Vendor: Record Contact)
    //     var
    //         SupplierReq: Record Contact;
    //         LastFieldNo: Integer;
    //         FooterPrinted: Boolean;
    //         FileDirectory: Text[100];
    //         FileName: Text[100];
    //         ReportID: Integer;
    //         "Object": Record "Object";
    //         Window: Dialog;
    //         RunOnceFile: Text[1000];
    //         TimeOut: Integer;
    //         Customer2: Record Customer;
    //         Cust: Record Customer;
    //         cr: Integer;
    //         lf: Integer;
    //         EmailBody: array [2] of Text[30];
    //         BodyText: Text[250];
    //         mymail: Codeunit Mail;
    //         DefaultPrinter: Text[200];
    //         WindowisOpen: Boolean;
    //        // FileDialog: Codeunit Mail;
    //         SendingDate: Date;
    //         SendingTime: Time;
    //         Counter: Integer;
    //         //cu400: Codeunit Mail;
    //         DocLog: Record "Document E-mail Log";
    //         BranchName: Code[80];
    //         DimValue: Record "Dimension Value";
    //         SenderAddress: Text[100];
    //         CustEmail: Text[100];
    //         UserSetup: Record "User Setup";
    //         HRSetupNew: Record "Human Resources Setup";
    //         HRSetup: Record "Company Information";
    //         Emp: Record Vendor;
    //         PayrollMonth: Date;
    //         PayrollMonthText: Text[30];
    //         PayPeriodtext: Text;
    //         PayPeriod: Record "Payroll PeriodX";
    //         CompInfo: Record "Company Information";
    //         DateFilter: Text;
    //         FromDate: Date;
    //         ToDate: Date;
    //         FromDateS: Text;
    //         ToDateS: Text;
    //         vend: Record Vendor;
    //         StartDate: Date;
    //         EndDAte: Date;
    //         EmailVerifier: Codeunit Payroll3;
    //         IsEmailValid: Boolean;
    //         PPayableSetup: Record "Procurement Setup";
    //         RequesterName: Text[100];
    //         RequesterEmail: Text[100];
    //         emailhdr: Text[100];
    //         CompanyDetails: Text[250];
    //         SupplierDetails: Text[1000];
    //         SenderMessage: Text[1000];
    //         ProcNote: Text[1000];
    //         LoginDetails: Text[1000];
    //         PortalUser: Record "Dynasoft Portal User";
    //         Password: Text[50];
    //         ActivationDetails: Text[1000];
    //     begin

    //         ///Notifying Procurement Team on supplier Request
    //            CompInfo.Get;
    //            HRSetup.Get;
    //            HRSetupNew.Get;

    //         RequesterEmail:=Vendor."E-Mail";
    //         RequesterName:=Vendor.Name;

    //         Window.Open('Notifying the Sender...');

    //         WindowisOpen := true;


    //         Counter:=Counter+1;
    //         PortalUser.Reset;
    //         PortalUser.SetRange("User Name",Vendor."E-Mail");
    //         if PortalUser.FindSet then
    //           Password:=PortalUser."Password Value";

    //         //Create message
    //         if HRSetup."E-Mail"='' then
    //           Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
    //         SenderAddress:=HRSetup."E-Mail";

    //         if HRSetupNew."HR E-mail Address" = '' then
    //           Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
    //           CustEmail:=HRSetupNew."HR E-mail Address";

    //         CompanyDetails:='HR Officer,'+'<BR></BR>'+CompInfo.Name+'<BR></BR>'+CompInfo.Address+'<BR></BR>'+CompInfo."Address 2"+'<BR></BR>'+CompInfo.City;
    //         SenderMessage:='<BR>Please note that your Applicant account has been created on our System, with the following key registration details:</BR>'+'<BR></BR>';
    //         SupplierDetails:='<BR>Registration Request Reference No:'+Vendor."No."+'</BR>'+'<BR> Name:'+Vendor.Name+'</BR>'+
    //         '<BR>Mobile Phone No:'+Vendor."Phone No."+'</BR>';
    //         LoginDetails:='We have also created your portal access account with the following login credentials:'+'<BR></BR>'+
    //         'User Name:'+Vendor."E-Mail"+'<BR></BR>'+'Password:'+Password+'<BR>To access our portal and complete your registration click on the link below, using your email address: </BR>'+Vendor."E-Mail";
    //         ActivationDetails:='<BR>Once you access our portal, you shall be able to complete the Confidential Applicant section of the registration that shall require you to provide the following information:</BR>'+
    //         '<BR> • Personal Information</BR>'+
    //         '<BR> •Communication/contact details</BR>'+
    //         '<BR> •Academic Qualifications</BR>'+
    //         '<BR> •Proffesional Qualifications'+
    //         '<BR> •Hobbies'+
    //         '<BR> •Employment History'+
    //         '<BR> •Refferees'+
    //         '<BR> •And Attachments</BR>';

    //         ProcNote:='Please note that the HR Office shall review your request and once approved, you shall receive an account activation email and a link to the Confidential Application Section for you to complete your registration.'+
    //         '<BR></BR>'+'If you require any assistance, please contact our HR team by Phone'+ HRSetup."Phone No.";

    //         if CustEmail='' then
    //          exit;

    //         //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
    //         emailhdr:='e-Recruitment Account Activation (Applicant Account No:'+vend."No."+')';

    //        // cu400.CreateMessage(CompInfo.Name,SenderAddress,CustEmail,emailhdr,
    //         CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, true);

    //        // cu400.AddCC(RequesterEmail);

    //      //   cu400.AddBodyline(ProcNote);


    //       //  cu400.Send;
    //         SendingDate:=Today;
    //         SendingTime:=Time;

    //          Sleep(1000);
    //          Window.Close;
    //     end;

    //    // procedure GetOpenVacancies(VacancyHeader: Record "Vacancy  Requisitions Table")
    //     var
    //         Vacancy: Record Vacancyx;
    //         RequisitionLines: Record "Vacancy Requisition Lines";
    //         VacancyLines: Record "Vacancy Requisition Lines";
    //        "LineNo.": Integer;
    // }
    // begin
    //           //inseert in the vacancy lines
    //           "LineNo.":=0;
    //           Vacancy.Reset;
    //           Vacancy.SetRange(Status,Vacancy.Status::Open);
    //           if Vacancy.FindSet then  begin
    //             repeat
    //                 VacancyLines.Reset;
    //                 if VacancyLines.FindLast then begin
    //                 "LineNo.":=VacancyLines."Line No.";
    //                 end;
    //                 VacancyLines.Init;
    //                VacancyLines."Line No.":="LineNo."+1;
    //                 VacancyLines."Vacancy No":=Vacancy."Requisition No.";
    //                 VacancyLines.Validate("Vacancy No");
    //                 VacancyLines."Requisition No.":=VacancyHeader."No.";
    //                  VacancyLines.Insert;
    //          until Vacancy.Next=0;
    //          Message('Open Vacancies Added succesfully');
    //          end;
    //     end;

    //     procedure AdvertiseVacancies(VacancyHeader: Record "Vacancy  Requisitions Table")
    //     var
    //         Vacancy: Record Vacancyx;
    //         RequisitionLines: Record "Vacancy Requisition Lines";
    //         VacancyLines: Record "Vacancy Requisition Lines";
    //         "LineNo.": Integer;
    //     begin
    //           //inseert in the vacancy lines
    //           VacancyLines.Reset;
    //           VacancyLines.SetRange("Requisition No.",VacancyHeader."No.");
    //           if VacancyLines.FindSet then  begin
    //             repeat
    //               //move to the vacancies table and modify
    //               Vacancy.Reset;
    //               Vacancy.SetRange("Job Id",VacancyLines."Job Id");
    //               Vacancy.SetRange(Status,VacancyLines.Status::Open);
    //               if Vacancy.FindSet then begin
    //                 Vacancy.Status:=Vacancy.Status::Advertised;
    //                 Vacancy.Advertise:=true;
    //                 Vacancy."Advertised By":=UserId;
    //                 Vacancy."Advertised Date":=Today;
    //                 Vacancy.Modify;
    //               end;
    //               VacancyLines.Status:=VacancyLines.Status::Advertised;
    //                VacancyLines.Advertise:=true;
    //               VacancyLines."Advertised By":=UserId;
    //               VacancyLines."Advertised Date":=Today;
    //              VacancyLines.Modify;

    //          until VacancyLines.Next=0;
    //          end;
    //         VacancyHeader.Status:=VacancyHeader.Status::Advertised;
    //         VacancyHeader.Advertised:=true;
    //         VacancyHeader."Advertised By":=UserId;
    //         VacancyHeader."Advertised On":=CurrentDatetime;
    //         VacancyHeader.Modify;
    //     end;

    //     procedure CreateVacancies(RequisitionHeader: Record "Vacancy  Requisitions Table")
    //     var
    //         VacancyRequisitionLines: Record "Vacancy Requisition Lines";
    //         HRSetup: Record "Human Resources Setup";
    //         Vacancies: Record Vacancyx;
    //     begin
    //         VacancyRequisitionLines.Reset;
    //         "VacancyNo.":='';
    //         VacancyRequisitionLines.SetRange("Requisition No.",RequisitionHeader."No.");
    //         if VacancyRequisitionLines.FindSet then begin
    //               repeat
    //                 "VacancyNo.":='';
    //                            HRSetup.Get;
    //                             HRSetup.TestField(HRSetup."Vacancy Nos.");
    //                             NoSeriesMgt.InitSeries(HRSetup."Vacancy Nos.",HRSetup."Vacancy Nos.",0D,"VacancyNo.",HRSetup."Vacancy Nos.");

    //                         Vacancies.Init;
    //                         Vacancies.Salary:=VacancyRequisitionLines.Salary;
    //                         Vacancies."Job Function":=VacancyRequisitionLines."Job Function";
    //                         Vacancies."Applications Start Date":=VacancyRequisitionLines."Applications Start Date";
    //                         Vacancies."Applications End Date":=VacancyRequisitionLines."Applications End Date";
    //                         Vacancies."Applications End Time":=VacancyRequisitionLines."Applications End Time";
    //                         Vacancies."Requisition No.":="VacancyNo.";
    //                         Vacancies."Seniority Level":=VacancyRequisitionLines."Seniority Level";
    //                         Vacancies."Requisition Type":=VacancyRequisitionLines."Requisition Type";
    //                         Vacancies."Type of Contract":=VacancyRequisitionLines."Type of Contract";
    //                         Vacancies."Job Id":=VacancyRequisitionLines."Job Id";
    //                         Vacancies."Job Description":=VacancyRequisitionLines."Job Description";
    //                         Vacancies."Planned Start Date":=VacancyRequisitionLines."Planned Start Date";
    //                         Vacancies."Planned End Date":=VacancyRequisitionLines."Planned End Date";
    //                         Vacancies."Planned Qty":=VacancyRequisitionLines."Planned Qty";
    //                         Vacancies."Requested Qty":=VacancyRequisitionLines."Requested Qty";
    //                         Vacancies."Job Location":=VacancyRequisitionLines."Location Code";
    //                         Vacancies.Validate("Job Location");
    //                        Vacancies.Insert;
    //                        until VacancyRequisitionLines.Next=0;
    //               end
    //     end;
}

