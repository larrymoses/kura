#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 67777 "HRPortal2"
{

    // trigger OnRun()
    // begin
    //     //generatePayslip('NCIA00001',20180106D);
    //     //MESSAGE(generateP9('004',20200101D,20201015D));
    //     //MESSAGE( imprestGeneralDetails('004' ,'','subject' ,'objective','estinationNarration',TODAY,10,'','',''));
    //      //MESSAGE(leaveApplication('','21859','ANNUAL',0, : Integer;daysApplied : Integer;lStartDate : DateTime;phoneNumber : Code[20];emailAddress : Text;examdetails : Text;dateOfExam : DateTime;pre)
    //      //MESSAGE(updateIctRequest('ICTHELP056','HARDWARE','tested test test'));
    //      //MESSAGE(getItemsByLocation('NAIROBI','STATIONERY'));
    //      //MESSAGE(createIctRequest('004','tested test test'));
    //     // MESSAGE(createPurchaseStoreRequisition('004','S-REQ005','NAIROBI','Request for Stationery',1,'WESTLANDS','',''));
    //     //test@gmail.com
    //     //KERRA_1
    //     //MESSAGE(createPettyCash('','004','','','Testing The Portal','',''));
    //     //MESSAGE(sendImprestMemoApproval('004','IM143'));
    //     //MESSAGE(adStoreRequsitionSharepointLinks('S-REQ079','test','htAddFuelRequisitionDetailstps://links/'));
    //     //MESSAGE(generateEmployeeStatement('004',20200101D,20201231D));
    //     //MESSAGE(cancelPettyCashSurrenderApproval('004','PCV076'));
    //     //MESSAGE(addTeamMember('004','IM248','1/4 HQ','AUDIT FEE','005',2,'AINABKOI','C0046','TEST001','BARINGO'));
    //     //MESSAGE(addStoreRequsitionSharepointLinks( 'S-REQ149','test','https://links/'));
    //     //MESSAGE(addPurchaseRequisitionSharepointLinks( 'P-REQ0027','test','https://links/'));57001
    //      //MESSAGE(generateIssueVoucher('004','SREQ0023'));
    //      //MESSAGE(FnCreateStaffClaimApprovalRequests('005','S-CLAIM102'));
    //     // MESSAGE(CreateWorksPurchaseRequisition('004','','NAIROBI','test',0,2,'DAGORETTI NORTH','PP00001',4002,'BOQ00001'));
    //      //CreateWorksPurchaseRequisition(Convert.ToString(Session["employeeNo"]), requisitionNo, tLocation, tDescription, Convert.ToInt32(priority), Convert.ToInt32(rProductGroup), tFundCode, plan, Convert.ToInt32(planentry), tId);
    //      //MESSAGE(SuggestPersonnelEquipmentSpecification('P-REQ0270','PST00001','PEV000003'));
    //      //MESSAGE(createIctRequest('004','test'));
    //      //MESSAGE(generateStaffClaim('716','SCLAIM_0012'));
    //      Message(generateP9('004',20200101D,20201231D));
    // end;

    // var
    //     Employee: Record Employee;
    //     objMail: Codeunit Mail;
    //     HRPortalUsers: Record HRPortalUsers;
    //     leaveApplications: Record "HR Leave Applications";
    //     HrJobsApplicants: Record "Hr Jobs Applicants";
    //     JobApplicantHobbies: Record "Job Applicant Hobbies";
    //     JobApplicantReferees: Record "HR Applications Accomplishment";
    //     JobApplicantsQualifications: Record "Applications Accomplishments";
    //     CompanyJobs: Record "ManPower Planning Lines";
    //     JobPositionApplications: Record "HR Professional Qualifications";
    //     FILESPATH: label '//192.168.1.181\KerraUpdated\downloads\';
    //     FILESPATH5: label '//192.168.1.181\EssPortal\downloads\PurchaseRequisition\';
    //     ImprestMemo: Record "Imprest Memo";
    //     LegInstr: InStream;
    //     LegOutStr: OutStream;
    //     LegText: Text;
    //     Leg: BigText;
    //     obj: BigText;
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     Payments: Record payments;
    //     Payments1: Record payments;
    //     Payments2: Record payments;
    //     PurchaseHeader: Record "Purchase Header";
    //     annual: Option " ","Annual Leave","Emergency Leave";
    //     FILESPATH1: label '//192.168.1.181\EssPortal\downloads\Payslip\';
    //     FILESPATH2: label '//192.168.1.181\EssPortal\downloads\P9\';
    //     ApplicantEmploymentHistory: Record "Employee History Table";
    //     jpa: Record "HR Job Applications";
    //     gender: Option ,Female,Male,Both;
    //     disabled: Option No,Yes;
    //     MaritalStatus: Option Single,Married,Separated,Divorced,"Widow(er)",Other;
    //     applicantQualifications: Record "HR Applicant Qualifications";
    //     JobApplicants: Record "HR Job Applications";
    //     professionalQualifications: Record "HR Professional Qualifications";
    //     attendedTraining: Record "Hr Trainings Attended";
    //     membershipbody: Record "Hr Proffessional Body";
    //     applicantAccomplishment: Record "HR Applications Accomplishment";
    //     referee: Record "HR Applicant Referees";
    //     externalApplicants: Record "HR Applicant Accounts";
    //     helpdesk: Record "ICT Helpdesk";
    //     Mapping: Record "ICT Officers Category Mapping";
    //     hdesk: Record "ICT Helpdesk";
    //     item: Record Item;
    //     applicantBackground: Record "Applicant Background";
    //     applicantReferee: Record "Applicant Referees";
    //     jobApplication: Record "Job Application Table";
    //     jobApp: Record "Job Application Table";
    //     favouriteJob: Record FavouriteJobsTable;
    //     FILESPATH3: label '//192.168.1.181\EssPortal\downloads\EmployeeStatement\';
    //     employeeLedgerEntry: Record "Employee Ledger Entry";
    //     EmpFilter: Text[250];
    //     EmpDateFilter: Text[30];
    //     TrainingRequisition: Record "Training Requests";
    //     TrainingReq: Record "Training Requests";
    //     TrainingParticipants: Record "Training Participants";
    //     PVLines: Record "PV Lines";
    //     PettyCashLines: Record "Petty Cash Lines";
    //     FILESPATH4: label '//192.168.1.181\EssPortal\downloads\ImprestMemoPreview\';
    //     RecID: RecordID;
    //     RecRef: RecordRef;
    //     varTableNumber: Integer;
    //     ProcurementSetup: Record "Procurement Setup";
    //     FILESPATH6: label '//192.168.1.181\EssPortal\downloads\StoreRequisition\';
    //     FILESPATH7: label '//192.168.1.181\EssPortal\downloads\IssueVoucher\';
    //     FileName: Text[250];
    //     EmployeeStatement: Report "Employee Statement";
    //     FILESPATH8: label '//192.168.1.181\EssPortal\downloads\PettyCashVoucher\';
    //     FILESPATH9: label '//192.168.1.181\EssPortal\downloads\StaffClaim\';

    // procedure resetPassword("employeeNumber-idNumber": Code[20]) status: Text
    // begin
    //     status:='danger*Account not found';
    //     Employee.Reset;
    //     Employee.SetRange(Employee."No.", "employeeNumber-idNumber");
    //     if Employee.FindSet then begin
    //      status:= myResetPass(Employee);
    //       end else begin
    //         Employee.Reset;
    //     Employee.SetRange(Employee."ID Number", "employeeNumber-idNumber");
    //     if Employee.FindSet then begin
    //       status:=myResetPass(Employee);
    //       end else begin
    //         if HrJobsApplicants.Get("employeeNumber-idNumber") then begin
    //           status:= myResetPassExternal(HrJobsApplicants);
    //           end else begin
    //         status:='danger*Account with the given credentials does not exist';
    //             end;
    //         end;
    //         end;
    //     /*objMail.CreateMessage('CIC Pension','life.pensionws@cic.co.ke', recipient, subject, content, TRUE);
    //     objMail.Send();*/

    // end;

    // local procedure myResetPass(Employee: Record Employee) status: Text
    // var
    //     employeeEmail: Text;
    //     password: Integer;
    //     passwordOk: Boolean;
    //     SMTPMailSetup: Record "Email Account";
    // begin
    //     employeeEmail:=Employee."Company E-Mail";
    //     if employeeEmail='' then begin
    //       status:='danger*You have not added company email to the selected employee. Kindly update and try again';
    //       end else begin
    //         passwordOk:= false;
    //         repeat
    //         password:= Random(9999);
    //           if password >1000 then
    //             passwordOk:=true;
    //           until passwordOk=true;
    //           HRPortalUsers.Reset;
    //           HRPortalUsers.SetRange(HRPortalUsers.employeeNo, Employee."No.");
    //           if HRPortalUsers.FindSet then begin
    //             HRPortalUsers.password:= Format(password);
    //             HRPortalUsers.changedPassword:= false;
    //             HRPortalUsers.Modify(true);
    //             end else begin
    //               HRPortalUsers.Init;
    //               HRPortalUsers.employeeNo:= Employee."No.";
    //               HRPortalUsers.IdNo:= Employee."ID Number";
    //               HRPortalUsers.password:=Format(password);
    //               HRPortalUsers.changedPassword:= false;
    //               HRPortalUsers.Insert(true);
    //               end;
    //               SMTPMailSetup.Get();
    //         objMail.CreateMessage(SMTPMailSetup."Email Sender Name",SMTPMailSetup."Email Address", employeeEmail, 'Password Reset', 'Your one time password is <strong>'+Format(password)+'</strong>', true);
    //         objMail.Send();
    //         status:='success*We have sent a one time password to your email ('+employeeEmail+'). Use it to log in to your account';
    //         end;
    // end;

    // local procedure myResetPassExternal(HrJobsApplicants: Record "Hr Jobs Applicants") status: Text
    // var
    //     employeeEmail: Text;
    //     password: Integer;
    //     passwordOk: Boolean;
    // begin
    //     employeeEmail:=HrJobsApplicants."E-Mail";
    //     if employeeEmail='' then begin
    //       status:='danger*You have not added an email to you account. ';
    //       end else begin
    //         passwordOk:= false;
    //         repeat
    //         password:= Random(9999);
    //           if password >1000 then
    //             passwordOk:=true;
    //           until passwordOk=true;
    //           HRPortalUsers.Reset;
    //           HRPortalUsers.SetRange(HRPortalUsers.IdNo, HrJobsApplicants."ID Number");
    //           if HRPortalUsers.FindSet then begin
    //             HRPortalUsers.password:= Format(password);
    //             HRPortalUsers.changedPassword:= false;
    //             HRPortalUsers.Modify(true);
    //             end else begin
    //               HRPortalUsers.Init;
    //               HRPortalUsers.employeeNo:= Employee."No.";
    //               HRPortalUsers.IdNo:= Employee."ID Number";
    //               HRPortalUsers.password:=Format(password);
    //               HRPortalUsers.changedPassword:= false;
    //               HRPortalUsers.Insert(true);
    //               end;
    //         objMail.CreateMessage('KEMRI','arndegwa@kemri.org', employeeEmail, 'Password Reset', 'Your one time password is <strong>'+Format(password)+'</strong>', true);
    //         objMail.Send();
    //         status:='success*We have sent a on time password to your email ('+employeeEmail+'). Use it to log in to your account';
    //         end;
    // end;

    // procedure createPettyCash(docNo: Text[50];empNo: Text;job: Text[100];jobTaskno: Text[100];pNarration: Text[100];region: Text[100];constituency: Text[100]) status: Text
    // begin
    //          Payments.Reset;
    //          Payments.SetRange("No.", docNo);
    //          Payments.SetRange("Account No.", empNo);
    //          Payments.SetRange(Status, Payments.Status::Open);
    //          if Payments.FindSet then begin
    //           Payments."Payment Narration":= pNarration;
    //           Payments.Validate("Payment Narration");
    //           Payments.Job:= job;
    //           Payments.Validate(Job);
    //           Payments."Job Task No":= jobTaskno;
    //           Payments."Job Task No.":=jobTaskno;
    //           Payments.Validate("Job Task No.");
    //           Payments.Validate("Job Task No");
    //           Payments."Responsibility Center":=region;//Added By Fred
    //           if Payments.Modify(true) then begin
    //           Payments."Responsibility Center":=region;
    //           Payments.Modify(true);
    //          status:='success*'+Payments."No."+' *Your Petty cash was successfully updated';
    //         end else begin
    //          status:='danger*Your Petty cash could not be updated';
    //         end;
    //       end else begin
    //       Payments.Init;
    //       Payments."No.":='';
    //       Payments."Document Type":= Payments."document type"::"Petty Cash";
    //       Payments.Validate("Document Type");
    //       Payments."Payment Type":=Payments."payment type"::"Petty Cash";
    //       Payments.Validate("Payment Type");
    //       Payments."Account Type":= Payments."account type"::Employee;
    //       Payments.Validate("Account Type");
    //       Payments."Account No.":=empNo;
    //       Payments.Validate("Account No.");
    //       Payments."Payment Narration":= pNarration;
    //       Payments.Validate("Payment Narration");
    //       Payments."Responsibility Center":=region;//Added By Fred
    //       Payments.Job:= job;
    //       Payments.Validate(Job);
    //       Payments."Job Task No":= jobTaskno;
    //       Payments."Job Task No.":=jobTaskno;
    //       Payments.Validate("Job Task No.");
    //       Payments.Validate("Job Task No");
    //       Payments.Date:= Today();
    //       if Payments.Insert(true) then begin
    //        Payments."Responsibility Center":=region;
    //        Payments.Modify(true);
    //         status:='success*'+Payments."No.";
    //         end else begin
    //           status:='danger*Your Petty cash could not be captured';
    //           end;
    //     end;

    // end;

    // procedure createPettyCashLines(docNo: Text[50];type: Text[100];Amount: Decimal) status: Text
    // begin
    //     PVLines.Reset;
    //     PVLines.SetRange(No,docNo);
    //     PVLines.SetRange(Type,type);
    //     if PVLines.FindSet then begin
    //       status:='error* Type with  description '+type+' already exists';
    //       end else begin
    //         PVLines.Init;
    //         PVLines.No := docNo;
    //         PVLines.Type:= type;
    //         PVLines.Validate(Type);
    //         PVLines.Validate("Account No");
    //         PVLines.Amount:= Amount;
    //         PVLines.Insert(true);
    //         status:='success*Line successfully added';
    //         end
    // end;

    // procedure PopulatePettyCash(docNo: Text[50];empNo: Text) status: Text
    // begin
    //         Payments.Reset;
    //         Payments.SetRange("No.", docNo);
    //         Payments.SetRange("Account No.", empNo);
    //         Payments.SetRange(Status, Payments.Status::Released);
    //         if Payments.FindSet then begin
    //           Payments."Imprest Issue Doc. No":=docNo;
    //         if Payments.Modify(true) then begin
    //           Payments.Validate("Imprest Issue Doc. No");
    //          status:='success*'+Payments."No."+' *Your Petty cash was successfully updated';
    //         end else begin
    //          status:='danger*Your Petty cash could not be updated';
    //         end;
    //       end;
    // end;

    // procedure editPettyCashLines(type: Text[100];amount: Decimal;reqNo: Text[100];id: Integer) status: Text
    // begin
    //     PVLines.Reset;
    //     PVLines.SetRange(No,reqNo);
    //     PVLines.SetRange("Line No",id);
    //     if PVLines.FindSet then begin

    //         PVLines.Type:=type;
    //         PVLines.Amount:= amount;
    //         PVLines.Validate(Amount);
    //         PVLines.Validate("Account No");
    //         PVLines.Modify(true);
    //         status:='success*Petty cash line successfully updated';


    //       end
    //       else begin

    //       status:='error*The Petty cash line could not be updated.'

    //         end
    // end;

    // procedure deletePettyCashLines(id: Integer;reqNo: Text[100]) status: Text
    // begin
    //     PVLines.Reset;
    //     PVLines.SetRange(No,reqNo);
    //     PVLines.SetRange("Line No",id);
    //     if PVLines.FindSet then begin
    //       PVLines.Delete;
    //       status:='success* Petty cash line deleted successfully added';

    //       end
    //       else begin

    //       status:='error*The Petty cash line could not be deleted.Please try again';

    //         end
    // end;

    // procedure sendPettyCashRequestApproval(employeeNo: Code[50];reqNo: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    // begin
    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",reqNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     if Payments.FindSet then begin
    //       //MESSAGE(FORMAT(Payments."Total Amount"));
    //       Payments.TestField("Payment Narration");
    //       Payments.CalcFields("Total Amount");
    //       Payments.TestField(Payments."Total Amount");
    //      if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
    //       ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
    //           if Payments1.Get(reqNo) then begin
    //           if Payments1.Status=Payments.Status::"Pending Approval" then begin
    //             status:='success*The petty cash request was successfully sent for approval';
    //             end else begin
    //             status:='danger*The petty cash request was not successfully sent for approval';
    //               end;
    //           end else begin
    //               status:='danger*A petty cash request with the given number was not sent for Approval.Ensure the Amounts and Payment Narration is filled in';
    //            end;
    //       end else begin
    //         status:='danger*A petty cash request with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure cancelPettyCashRequestApproval(employeeNo: Code[50];recordNo: Code[50]) status: Text
    // var
    //     HRLeaveApplication1: Record "HR Leave Applications";
    //     ImprestMemo1: Record "Imprest Memo";
    //     Payments2: Record payments;
    //     ImprestHeader: Record payments;
    //     PurchaseHeader1: Record "Purchase Header";
    //     TransportRequisition: Record "Transport Requisition";
    //     TransportRequisition1: Record "Transport Requisition";
    // begin

    //     Payments.Reset;
    //     Payments.SetRange("No.", recordNo);
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange(Status,Payments.Status::"Pending Approval");
    //     if Payments.FindSet then begin

    //       ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
    //           if Payments1.Get(Payments."No.") then begin
    //               if Payments1.Status = Payments.Status then begin
    //                 status:= 'warning*Your petty cash requisition  approval could not be cancelled';
    //                 end else begin
    //                   status:= 'success*Your petty cash requisition approval was successfully cancelled';
    //                   end;
    //             end;
    //       end else begin
    //         status:='danger*The petty cash requisition does not exist or you are not the requester or status is not pending';



    //         end;
    //     exit(status);
    // end;

    // procedure updatePettyCashSurrenderLine(employeeNo: Code[50];pettyCashNo: Code[50];lineNo: Integer;amountSpent: Decimal;receipt: Text) status: Text
    // var
    //     ImprestLines: Record "Imprest Lines";
    // begin
    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",pettyCashNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
    //     if Payments.FindSet then begin
    //           PettyCashLines.Reset;
    //           PettyCashLines.SetRange(No, pettyCashNo);
    //           PettyCashLines.SetRange("Line No", lineNo);
    //           if PettyCashLines.FindSet then begin

    //              PettyCashLines.Validate("Actual Spent",amountSpent);
    //             PettyCashLines.Validate("Receipt No.", receipt);
    //             if PettyCashLines.Modify(true) then begin
    //               status:='success*The petty cash line was successfully updated';//+FORMAT(lineNo);
    //               end else begin
    //                 status:='danger*The petty cash line could not be updated';
    //                 end;
    //             end else begin
    //               status:='danger*The petty cash line does not exist'+Format(lineNo);
    //               end;
    //       end else begin
    //         status:='danger*An petty cash surrender with the given number does not exist, you are not the requestor or is no longer released';
    //         end;
    //     exit(status);
    // end;

    // procedure sendPettyCashSurrenderApproval(employeeNo: Code[50];imprestSurrenderNo: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    // begin

    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",imprestSurrenderNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
    //     if Payments.FindSet then begin
    //      //Payments.TESTFIELD(Job);
    //       //Payments.TESTFIELD("Job Task No");
    //      //Payments.TESTFIELD("Actual Amount Spent");
    //     if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
    //       ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
    //         if Payments1.Get(Payments."No.") then begin
    //         Payments1.Selected:=true;
    //         Payments1.Modify;
    //         end;
    //         if Payments2.Get(imprestSurrenderNo) then begin
    //           if Payments2.Status=Payments2.Status::"Pending Approval" then begin
    //             status:='success*The Petty Cash Surrender was successfully sent for approval';
    //             end;
    //           end;
    //       end else begin
    //         status:='danger*An Petty Cash surrender with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure cancelPettyCashSurrenderApproval(employeeNo: Code[50];recordNo: Code[50]) status: Text
    // var
    //     HRLeaveApplication1: Record "HR Leave Applications";
    //     ImprestMemo1: Record "Imprest Memo";
    //     Payments2: Record payments;
    //     ImprestHeader: Record payments;
    //     PurchaseHeader1: Record "Purchase Header";
    //     TransportRequisition: Record "Transport Requisition";
    //     TransportRequisition1: Record "Transport Requisition";
    // begin

    //     Payments.Reset;
    //     Payments.SetRange("No.", recordNo);
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange(Status,Payments.Status::"Pending Approval");
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
    //     if Payments.FindSet then begin
    //       ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
    //       Payments1.Reset;
    //       Payments1.SetRange("No.",recordNo);
    //       if Payments1.FindSet then begin

    //               if Payments1.Status = Payments.Status then begin
    //                 Message(Format(Payments1.Status));
    //                 status:= 'warning*Your petty cash surrender  approval could not be cancelled';
    //                 end else begin
    //                   status:= 'success*Your petty cash surrender approval was successfully cancelled';
    //                   end;
    //             end;
    //       end else begin
    //         status:='danger*The petty cash surrender does not exist or you are not the requester or status is not pending';



    //         end;
    //     exit(status);
    // end;

    // procedure createTrainingRequisition(reqNo: Text[100];trainingPlan: Text[100];courseTitle: Text[100];startdate: Date;enddate: Date;trainingVenue: Text[100];location: Text[100];provider: Text[100];empNo: Text[100];Duration: Decimal;resCode: Text[100]) status: Text
    // begin
    //     TrainingRequisition.Reset;
    //     TrainingRequisition.SetRange(Code,reqNo);
    //     TrainingRequisition.SetRange("Employee No.",empNo);
    //     if TrainingRequisition.FindSet then begin
    //       TrainingRequisition."Training Plan No.":=trainingPlan;
    //       TrainingRequisition."Course Title":=courseTitle;
    //       TrainingRequisition.Duration:=Duration;

    //       TrainingRequisition."Start DateTime":= startdate;
    //       TrainingRequisition."End DateTime":= enddate;
    //       TrainingRequisition."Training Venue Region Code":=trainingVenue;
    //       TrainingRequisition.Validate("Training Venue Region Code");
    //       TrainingRequisition.Location := location;
    //       TrainingRequisition.Provider:= provider;
    //       TrainingRequisition.Validate(Provider);
    //       TrainingRequisition."Training Responsibility Code":=resCode;
    //       //TrainingRequisition."Employee No.":= empNo;

    //         if TrainingRequisition.Modify(true) then begin
    //           TrainingRequisition.Validate("Course Title");
    //           status:='success*'+reqNo;
    //           end

    //       end
    //       else begin
    //         TrainingRequisition.Init;
    //         TrainingRequisition."Training Plan No.":=trainingPlan;
    //         TrainingRequisition."Course Title":=courseTitle;
    //         TrainingRequisition."Employee No.":=empNo;
    //         TrainingRequisition."Start DateTime":= startdate;
    //         TrainingRequisition."End DateTime":= enddate;
    //         TrainingRequisition."Training Venue Region Code":=trainingVenue;
    //         TrainingRequisition.Validate("Training Venue Region Code");
    //         TrainingRequisition.Location := location;
    //         TrainingRequisition.Provider:= provider;
    //         TrainingRequisition.Validate(Provider);
    //         TrainingRequisition."Application Date":=Today();
    //         TrainingRequisition.Duration:=Duration;
    //         TrainingRequisition."Employee No.":= empNo;
    //         if TrainingRequisition.Insert(true) then begin
    //         TrainingRequisition.Validate("Course Title");
    //           TrainingReq.Reset;
    //           TrainingReq.SetRange("Employee No.",empNo);
    //           if TrainingReq.FindLast then begin

    //             status:= 'success*'+TrainingReq.Code;

    //             end else begin
    //               status:= '';
    //               end
    //           end
    //           else begin
    //             status:='error* An error occured during the process of inserting.Please try again';
    //           end


    //         end
    // end;

    // procedure addTrainingParticipants(type: Text[100];participantEmpno: Text[100];empNo: Text[100];Destination: Text[100];noOfDays: Decimal;regionCode: Text[100];reqNo: Text[100]) status: Text
    // begin
    //     TrainingParticipants.Reset;
    //     TrainingParticipants.SetRange("Training Code",reqNo);
    //     TrainingParticipants.SetRange("Employee Code",participantEmpno);
    //     if TrainingParticipants.FindSet then begin
    //       status:='error*The participants already exists.'

    //       end
    //       else begin
    //         TrainingParticipants.Init;
    //         TrainingParticipants.Type:=type;

    //         TrainingParticipants."Employee Code":=participantEmpno;
    //         TrainingParticipants.Validate("Employee Code");
    //         TrainingParticipants.Destination:=Destination;
    //         TrainingParticipants."Training Code":= reqNo;
    //         TrainingParticipants."No. of Days":= noOfDays;
    //         TrainingParticipants.Validate("No. of Days");
    //         TrainingParticipants."Training Responsibility Code":=regionCode;
    //         TrainingParticipants.Requestor:=empNo;
    //         TrainingParticipants.Insert(true);
    //         TrainingParticipants.Validate(Destination);

    //         //TrainingParticipants.VALIDATE(Type);
    //         status:='success*Participant successfully added';


    //         end
    // end;

    // procedure editTrainingParticipants(type: Text[100];participantEmpno: Text[100];empNo: Text[100];Destination: Text[100];noOfDays: Decimal;regionCode: Text[100];reqNo: Text[100];id: Integer) status: Text
    // begin
    //     TrainingParticipants.Reset;
    //     TrainingParticipants.SetRange("Training Code",reqNo);
    //     TrainingParticipants.SetRange("Line No",id);
    //     if TrainingParticipants.FindSet then begin

    //          TrainingParticipants.Type:=type;

    //         TrainingParticipants."Employee Code":=participantEmpno;
    //         TrainingParticipants.Validate("Employee Code");
    //         TrainingParticipants.Destination:=Destination;
    //         TrainingParticipants.Validate(Destination);
    //         TrainingParticipants."No. of Days":= noOfDays;
    //         TrainingParticipants."Training Responsibility Code":=regionCode;
    //         TrainingParticipants.Modify(true);
    //         //TrainingParticipants.VALIDATE(Type);
    //         status:='success*Participant successfully updated';


    //       end
    //       else begin

    //       status:='error*The participants could not be updated.'

    //         end
    // end;

    // procedure deleteTrainingParticipants(id: Integer;reqNo: Text[100]) status: Text
    // begin
    //     TrainingParticipants.Reset;
    //     TrainingParticipants.SetRange("Training Code",reqNo);
    //     TrainingParticipants.SetRange("Line No",id);
    //     if TrainingParticipants.FindSet then begin
    //       TrainingParticipants.Delete;
    //       status:='success*Participant successfully added';

    //       end
    //       else begin
    //         /*TrainingParticipants.Type:=type;
    //         TrainingParticipants.VALIDATE(Type);
    //         TrainingParticipants."Employee Code":=participantEmpno;
    //         TrainingParticipants.VALIDATE("Employee Code");
    //         TrainingParticipants.Destination:=Destination;
    //         TrainingParticipants.VALIDATE(Destination);
    //         TrainingParticipants."No. of Days":= noOfDays;
    //         TrainingParticipants."Training Responsibility Code":=regionCode;
    //         TrainingParticipants.INSERT(TRUE);*/

    //       status:='error*The participants could not be deleted.Please try again';

    //         end

    // end;

    // procedure sendTrainingRequestApproval(employeeNo: Code[50];reqNo: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    // begin
    //     status:='danger*The training request could not be sent for approval';

    //     TrainingRequisition.Reset;
    //     TrainingRequisition.SetRange("Employee No.", employeeNo);
    //     TrainingRequisition.SetRange(Code,reqNo);
    //     TrainingRequisition.SetRange(Status, TrainingRequisition.Status::Open);
    //     if TrainingRequisition.FindSet then begin
    //       TrainingRequisition.TestField(Duration);
    //     if ApprovalsMgmt.CheckTApplicationApprovalsWorkflowEnabled(TrainingRequisition) then
    //       ApprovalsMgmt.OnSendTApplicationForApproval(TrainingRequisition);
    //           if TrainingReq.Get(reqNo) then begin
    //           if TrainingReq.Status=TrainingReq.Status::Pending then begin
    //             status:='success*The training request was successfully sent for approval';
    //             end;
    //           end;
    //       end else begin
    //         status:='danger*A training request with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure cancelTrainingRequestApproval(employeeNo: Code[50];recordNo: Code[50]) status: Text
    // var
    //     HRLeaveApplication1: Record "HR Leave Applications";
    //     ImprestMemo1: Record "Imprest Memo";
    //     Payments2: Record payments;
    //     ImprestHeader: Record payments;
    //     PurchaseHeader1: Record "Purchase Header";
    //     TransportRequisition: Record "Transport Requisition";
    //     TransportRequisition1: Record "Transport Requisition";
    // begin
    //     status:='danger*The record approval could not be cancelled';

    //     TrainingRequisition.Reset;
    //     TrainingRequisition.SetRange(Code, recordNo);
    //     TrainingRequisition.SetRange("Employee No.", employeeNo);
    //     TrainingRequisition.SetRange(Status,TrainingRequisition.Status::Pending);
    //     if TrainingRequisition.FindSet then begin

    //       ApprovalsMgmt.OnCancelTApplicationApprovalRequest(TrainingRequisition);
    //           if TrainingReq.Get(TrainingRequisition.Code) then begin
    //               if TrainingReq.Status = TrainingRequisition.Status then begin
    //                 status:= 'warning*Your training requisition  approval could not be cancelled';
    //                 end else begin
    //                   status:= 'success*Your training requisition approval was successfully cancelled';
    //                   end;
    //             end;
    //       end else begin
    //         status:='danger*The training requisition does not exist or you are not the requester or status is not pending';



    //         end;
    //     exit(status);
    // end;

    // procedure leaveApplication(leaveNo: Code[50];employeeNumber: Code[20];leaveType: Code[20];annualLeaveType: Option " ","Annual Leave","Emergency Leave";daysApplied: Integer;lStartDate: DateTime;phoneNumber: Code[20];emailAddress: Text;examdetails: Text;dateOfExam: DateTime;previousAttempts: Integer;reliever: Text[50]) status: Text
    // var
    //     HRLeaveApplication1: Record "HR Leave Applications";
    // begin
    //     status:='danger*Your leave application failed';
    //     annualLeaveType:= annualLeaveType;
    //     case annualLeaveType of
    //       0:
    //       annualLeaveType:=Annual::"Annual Leave";
    //       1:
    //         annualLeaveType:=Annual::"Emergency Leave";

    //       else
    //         end;
    //     Employee.Reset;
    //     Employee.SetRange("No.", employeeNumber);
    //     if Employee.FindSet then begin
    //       if leaveNo='' then begin //a new leave
    //       leaveApplications.Init;
    //       leaveApplications."Employee No":= employeeNumber;
    //       leaveApplications.Validate("Employee No");
    //       leaveApplications."Leave Type":= leaveType;
    //       leaveApplications.Validate("Leave Type");
    //       leaveApplications."Annual Leave Type":=annualLeaveType;
    //       leaveApplications."Days Applied":= daysApplied;
    //       leaveApplications."Start Date":= Dt2Date(lStartDate);
    //       leaveApplications."Cell Phone Number":= phoneNumber;
    //       leaveApplications."E-mail Address":= emailAddress;
    //       leaveApplications."Details of Examination":= examdetails;
    //       leaveApplications."Date of Exam":= Dt2Date(dateOfExam);
    //       leaveApplications."Number of Previous Attempts":= Format(previousAttempts);
    //        leaveApplications.Validate("Days Applied");
    //         leaveApplications.Validate("Date of Exam");
    //         leaveApplications.Reliever:= reliever;
    //         leaveApplications.Validate(Reliever);
    //       if leaveApplications.Insert(true) then begin
    //         leaveApplications."Employee No":=employeeNumber;
    //         leaveApplications.Validate("Employee No");
    //         leaveApplications.Validate("Start Date");
    //         leaveApplications.Modify(true);
    //         status:= 'success*Your leave application was successfully placed *'+leaveApplications."Application Code";
    //         end;
    //         end else begin //existing leave application
    //             leaveApplications.Reset;
    //             leaveApplications.SetRange("Employee No", employeeNumber);
    //             leaveApplications.SetRange("Application Code", leaveNo);
    //             leaveApplications.SetRange(Status, leaveApplications.Status::Open);
    //             if leaveApplications.FindSet then begin
    //                   leaveApplications."Employee No":= employeeNumber;
    //                   leaveApplications.Validate("Employee No");
    //                   leaveApplications."Leave Type":= leaveType;
    //                   leaveApplications.Validate("Leave Type");
    //                   leaveApplications."Annual Leave Type":=annualLeaveType;
    //                   leaveApplications."Days Applied":= daysApplied;
    //                   leaveApplications."Start Date":= Dt2Date(lStartDate);
    //                   leaveApplications."Cell Phone Number":= phoneNumber;
    //                   leaveApplications."E-mail Address":= emailAddress;
    //                   leaveApplications."Details of Examination":= examdetails;
    //                   leaveApplications."Date of Exam":= Dt2Date(dateOfExam);
    //                   leaveApplications."Number of Previous Attempts":= Format(previousAttempts);
    //                   leaveApplications.Validate("Days Applied");
    //                   leaveApplications.Validate("Date of Exam");
    //                    leaveApplications.Reliever:= reliever;
    //                    leaveApplications.Validate(Reliever);
    //                 if leaveApplications.Modify(true) then begin
    //                   leaveApplications."Employee No":=employeeNumber;
    //                   leaveApplications.Validate("Employee No");
    //                   leaveApplications.Validate("Start Date");
    //                   leaveApplications.Modify(true);
    //                   status:= 'success*Your leave application was successfully updated *'+leaveApplications."Application Code";
    //                   end;
    //               end else begin
    //                 status:='danger*A leave application with the given code does not exist, you are not the owner or is no longer open';
    //                 end;
    //           end;
    //     end else begin
    //       status:='danger*The selected employee does not exist';
    //       end;
    // end;

    // procedure generatePayslip(employeeNumber: Code[20];payPeriod: DateTime) status: Text
    // begin
    //     status:='danger*could not generate your statement';
    //     Employee.Reset;
    //     Employee.SetRange(Employee."No.", employeeNumber);
    //     if Employee.FindSet then begin
    //       Employee.Reset;
    //       Employee.SetRange(Employee."No.", employeeNumber);
    //       Employee.SetRange("Pay Period Filter", Dt2Date(payPeriod));
    //       if Employee.FindSet then begin

    //         if FILE.Exists(FILESPATH1+employeeNumber+'.pdf') then
    //           begin
    //             FILE.Erase(FILESPATH1+employeeNumber+'.pdf');
    //             Report.SaveAsPdf(89028, FILESPATH1+employeeNumber+'.pdf',Employee);
    //           status:='success*Generated*Downloads\Payslip\'+employeeNumber+'.pdf';
    //             end
    //               else
    //                   begin
    //                     Report.SaveAsPdf(89028, FILESPATH1+employeeNumber+'.pdf',Employee);
    //                 status:='success*Generated*Downloads\Payslip\'+employeeNumber+'.pdf';
    //                     end

    //         end;
    //       end
    //       else
    //       begin
    //         status:='danger*Employee not found';
    //         end;
    // end;

    // procedure generateImprestMemo(employeeNumber: Code[20];docNo: Text) status: Text
    // begin

    //     /*Employee.RESET;
    //     Employee.SETRANGE(Employee."No.", employeeNumber);
    //     IF Employee.FINDSET THEN BEGIN*/
    //       ImprestMemo.Reset;
    //       //ImprestMemo.SETRANGE(Requestor,employeeNumber);
    //       ImprestMemo.SetRange("No.",docNo);
    //       if ImprestMemo.FindSet then begin
    //       if FILE.Exists(FILESPATH4+employeeNumber+'.pdf') then begin
    //              FILE.Erase(FILESPATH4+employeeNumber+'.pdf');
    //           Report.SaveAsPdf(57001, FILESPATH4+employeeNumber+'.pdf',ImprestMemo);
    //           status:='success*Generated*Downloads\ImprestMemoPreview\'+employeeNumber+'.pdf';
    //         end else begin
    //          Report.SaveAsPdf(57001, FILESPATH4+employeeNumber+'.pdf',ImprestMemo);
    //          status:='success*Generated*Downloads\ImprestMemoPreview\'+employeeNumber+'.pdf';
    //         end;
    //         end else begin;
    //          status:='danger*The Imprest number with the given number does not exist or your are not the requestor';
    //       end;
    //       /*END ELSE BEGIN
    //         status:='danger*The Employee with the give number does not exist';
    //         END;*/

    // end;

    // procedure generateEmployeeStatement(employeeNumber: Code[20];startDate: Date;endDate: Date) status: Text
    // begin
    //     Employee.Reset;
    //     Employee.SetRange(Employee."No.", employeeNumber);
    //     Employee.SetFilter("Date Filter", Format(startDate)  +'..'+ Format(endDate));
    //     if Employee.FindSet then
    //       begin
    //       if FILE.Exists(FILESPATH3+employeeNumber+'.pdf') then
    //              FILE.Erase(FILESPATH3+employeeNumber+'.pdf');
    //           Report.SaveAsPdf(57016, FILESPATH3+employeeNumber+'.pdf',Employee);
    //           status:='success*Generated*Downloads\EmployeeStatement\'+employeeNumber+'.pdf';

    //         end
    //         else
    //         begin
    //          Report.SaveAsPdf(57016, FILESPATH3+employeeNumber+'.pdf',Employee);

    //          status:='success*Generated*Downloads\EmployeeStatement\'+employeeNumber+'.pdf';
    //           end


    // end;

    // procedure generateP9(employeeNumber: Code[20];startDate: Date;endDate: Date) status: Text
    // begin
    //       Employee.Reset;
    //       Employee.SetRange(Employee."No.", employeeNumber);
    //       Employee.SetFilter(Employee."Date Filter",'%1..%2',startDate,endDate);
    //       if Employee.FindSet then begin
    //        if FILE.Exists(FILESPATH2+employeeNumber+'.pdf') then begin
    //            FILE.Erase(FILESPATH2+employeeNumber+'.pdf');
    //           Report.SaveAsPdf(69019, FILESPATH2+employeeNumber+'.pdf',Employee);
    //           status:='success*Generated*Downloads\P9\'+employeeNumber+'.pdf';
    //           end else begin
    //             Report.SaveAsPdf(69019, FILESPATH2+employeeNumber+'.pdf',Employee);
    //           status:='success*Generated*Downloads\P9\'+employeeNumber+'.pdf';
    //           end
    //         end else begin
    //         status:='danger*The P9 Report could not be generated';
    //         end;
    // end;

    // procedure generatePurchaseRequisition(employeeNumber: Code[20];docNo: Text) status: Text
    // begin


    //       PurchaseHeader.Reset;
    //       //ImprestMemo.SETRANGE(Requestor,employeeNumber);
    //       PurchaseHeader.SetRange("No.",docNo);
    //       if PurchaseHeader.FindSet then begin
    //       if FILE.Exists(FILESPATH5+employeeNumber+'.pdf') then begin
    //              FILE.Erase(FILESPATH5+employeeNumber+'.pdf');
    //           Report.SaveAsPdf(50097, FILESPATH5+employeeNumber+'.pdf',PurchaseHeader);
    //           status:='success*Generated*Downloads\PurchaseRequisition\'+employeeNumber+'.pdf';
    //         end else begin
    //          Report.SaveAsPdf(50097, FILESPATH5+employeeNumber+'.pdf',PurchaseHeader);
    //          status:='success*Generated*Downloads\PurchaseRequisition\'+employeeNumber+'.pdf';
    //         end;
    //         end else begin;
    //          status:='danger*The Requisition  with the given number does not exist or your are not the requestor';
    //       end;

    // end;

    // procedure generateStoreRequisition(employeeNumber: Code[20];docNo: Text) status: Text
    // begin


    //       PurchaseHeader.Reset;
    //       PurchaseHeader.SetRange("No.",docNo);

    //       if PurchaseHeader.FindSet then begin
    //       if FILE.Exists(FILESPATH6+employeeNumber+'.pdf') then begin
    //              FILE.Erase(FILESPATH6+employeeNumber+'.pdf');
    //           Report.SaveAsPdf(70061, FILESPATH6+employeeNumber+'.pdf',PurchaseHeader);
    //           status:='success*Generated*Downloads\StoreRequisition\'+employeeNumber+'.pdf';
    //         end else begin
    //          Report.SaveAsPdf(70061, FILESPATH6+employeeNumber+'.pdf',PurchaseHeader);
    //          status:='success*Generated*Downloads\StoreRequisition\'+employeeNumber+'.pdf';
    //         end;
    //         end else begin;
    //          status:='danger*The Requisition number with the given number does not exist or your are not the requestor';
    //       end;

    // end;

    // procedure generateIssueVoucher(employeeNumber: Code[20];docNo: Text) status: Text
    // begin

    //       PurchaseHeader.Reset;
    //       PurchaseHeader.SetRange("No.",docNo);
    //       if PurchaseHeader.FindSet then begin
    //       if FILE.Exists(FILESPATH7+employeeNumber+'.pdf') then begin
    //              FILE.Erase(FILESPATH7+employeeNumber+'.pdf');
    //           Report.SaveAsPdf(70009, FILESPATH7+employeeNumber+'.pdf',PurchaseHeader);
    //           status:='success*Generated*Downloads\IssueVoucher\'+employeeNumber+'.pdf';
    //         end else begin
    //          Report.SaveAsPdf(70009, FILESPATH7+employeeNumber+'.pdf',PurchaseHeader);
    //          status:='success*Generated*Downloads\IssueVoucher\'+employeeNumber+'.pdf';
    //         end;
    //         end else begin;
    //          status:='danger*The Store number with the given number does not exist or your are not the requestor';
    //       end;

    // end;

    // procedure generatePettyCashVoucher(employeeNumber: Code[20];docNo: Text) status: Text
    // begin

    //       Payments.Reset;
    //       Payments.SetRange("No.",docNo);
    //       if Payments.FindSet then begin
    //       if FILE.Exists(FILESPATH8+employeeNumber+'.pdf') then begin
    //              FILE.Erase(FILESPATH8+employeeNumber+'.pdf');
    //           Report.SaveAsPdf(57003, FILESPATH8+employeeNumber+'.pdf',Payments);
    //           status:='success*Generated*Downloads\PettyCashVoucher\'+employeeNumber+'.pdf';
    //         end else begin
    //          Report.SaveAsPdf(57003, FILESPATH8+employeeNumber+'.pdf',Payments);
    //          status:='success*Generated*Downloads\PettyCashVoucher\'+employeeNumber+'.pdf';
    //         end;
    //         end else begin;
    //          status:='danger*The petty cash with the given number does not exist or your are not the requestor';
    //       end;

    // end;

    // procedure generateStaffClaim(employeeNumber: Code[20];docNo: Text) status: Text
    // begin

    //       Payments.Reset;
    //       Payments.SetRange("No.",docNo);
    //       if Payments.FindSet then begin
    //       if FILE.Exists(FILESPATH9+employeeNumber+'.pdf') then begin
    //              FILE.Erase(FILESPATH9+employeeNumber+'.pdf');
    //           Report.SaveAsPdf(57011, FILESPATH9+employeeNumber+'.pdf',Payments);
    //           status:='success*Generated*Downloads\StaffClaim\'+employeeNumber+'.pdf';
    //         end else begin
    //          Report.SaveAsPdf(57011, FILESPATH9+employeeNumber+'.pdf',Payments);
    //          status:='success*Generated*Downloads\StaffClaim\'+employeeNumber+'.pdf';
    //         end;
    //         end else begin;
    //          status:='danger*The staff claim with the given number does not exist or your are not the requestor';
    //       end;

    // end;

    // procedure register("First Name": Text;"Middle Name": Text;"Last name": Text;"Email Address": Text;"Phone Number": Code[20];"idNumber/Passport": Code[20];citizenship: Code[20];gender: Text) status: Text
    // var
    //     password: Integer;
    //     passwordOk: Boolean;
    // begin
    //     //check that the user does not exist by id
    //     //check that the user does not exist by email
    //     status:='danger*Your account could not be created';
    //     HrJobsApplicants.Reset;
    //     HrJobsApplicants.SetRange("ID Number", "idNumber/Passport");
    //     if HrJobsApplicants.FindSet then begin
    //       status:= 'danger*Another user with the given id number already exists. ';
    //       end else begin
    //       HrJobsApplicants.Reset;
    //       HrJobsApplicants.SetRange("E-Mail", "Email Address");
    //       if HrJobsApplicants.FindSet then begin
    //           status:= 'danger*Another user with the given email address already exists. ';
    //       end else begin
    //         //check employee
    //         Employee.Reset;
    //         Employee.SetRange(Employee."ID Number", "idNumber/Passport");
    //         if Employee.FindSet then begin
    //             status:= 'danger*Your account could not be created since you have been registered as an employee. ';
    //           end else begin
    //     //create account
    //             HrJobsApplicants.Init;
    //             HrJobsApplicants."ID Number":= "idNumber/Passport";
    //             HrJobsApplicants."First Name":= "First Name";
    //             HrJobsApplicants."Middle Name":="Middle Name";
    //             HrJobsApplicants."Last Name":="Last name";
    //             HrJobsApplicants."E-Mail":="Email Address" ;
    //             HrJobsApplicants."Cell Phone Number":="Phone Number";
    //             HrJobsApplicants.Citizenship:=citizenship;
    //                 HrJobsApplicants.Gender:=HrJobsApplicants.Gender::Female;
    //             if gender= 'male' then
    //             HrJobsApplicants.Gender:=HrJobsApplicants.Gender::Male;
    //             if HrJobsApplicants.Insert(true) then begin
    //               passwordOk:= false;
    //                 repeat
    //                 password:= Random(9999);
    //                   if password >1000 then
    //                     passwordOk:=true;
    //             until passwordOk=true;
    //             //create account
    //             HRPortalUsers.Init;
    //             HRPortalUsers.IdNo:= "idNumber/Passport";
    //             HRPortalUsers.password:= Format(password);
    //             if HRPortalUsers.Insert(true) then begin
    //             objMail.CreateMessage('KEMRI','arndegwa@kemri.org', "Email Address", 'One Time Password', 'Your one time password is <strong>'+Format(password)+'</strong>', true);
    //         objMail.Send();
    //                 status:= 'success*Your account was successfully created. Please refer to the next instructions sent via email ';
    //               end else begin
    //                 HrJobsApplicants.Delete;
    //                   status:= 'danger*Your account could not be created. Please try again later ';
    //                 end;
    //               end else begin
    //                   status:= 'danger*Your account could not be created. Please try again later ';
    //                 end;
    //             end;
    //         end;
    //         end;
    // end;

    // procedure addHobby(idNumber: Code[20];hobby: Text) status: Text
    // begin
    //     status:='danger*The hobby could not be added';
    //     if HrJobsApplicants.Get(idNumber) then begin
    //       JobApplicantHobbies.Init;
    //       JobApplicantHobbies."Id No":= idNumber;
    //       JobApplicantHobbies.Hobby:= hobby;
    //       if JobApplicantHobbies.Insert(true) then begin
    //         status:='success*The hobby was successfully added';
    //         end else begin
    //           status:='danger*The hobby could not be added';
    //           end;
    //       end else begin
    //         status:='danger*The selected employee does not exist';
    //     end;
    //     exit(status);
    // end;

    // procedure updateGeneralDetails(idNumber: Code[20];firstName: Text;middleName: Text;lastName: Text;initials: Text;firstLanguage: Code[20];firstLanguageRead: Boolean;firstLanguageWrite: Boolean;firstLanguageSpeak: Boolean;secondLanguage: Code[20];secondLanguageRead: Boolean;secondLanguageWrite: Boolean;secondLanguageSpeak: Boolean;additionalLanguage: Code[20];gender: Text;citizenship: Code[20]) status: Text
    // begin
    //     if HrJobsApplicants.Get(idNumber) then begin
    //       HrJobsApplicants."First Name":=firstName;
    //       HrJobsApplicants."Middle Name":=middleName;
    //       HrJobsApplicants."Last Name":=lastName;
    //       HrJobsApplicants.Initials:= initials;
    //       HrJobsApplicants."First Language (R/W/S)":=firstLanguage;
    //       HrJobsApplicants."First Language Read":=firstLanguageRead;
    //       HrJobsApplicants."First Language Write":=firstLanguageWrite;
    //       HrJobsApplicants."First Language Speak":=firstLanguageSpeak;
    //       HrJobsApplicants."Second Language (R/W/S)":=secondLanguage;
    //       HrJobsApplicants."Second Language Read":=secondLanguageRead;
    //       HrJobsApplicants."Second Language Write":=secondLanguageWrite;
    //       HrJobsApplicants."Second Language Speak":=secondLanguageSpeak;
    //        HrJobsApplicants."Additional Language":=additionalLanguage;
    //        if gender='Female' then
    //        HrJobsApplicants.Gender:=HrJobsApplicants.Gender::Female;
    //        if gender='Male' then
    //        HrJobsApplicants.Gender:=HrJobsApplicants.Gender::Male;
    //        HrJobsApplicants.Citizenship:=citizenship;
    //        if HrJobsApplicants.Modify(true) then begin
    //          status:='success*Your profile was successfully updated';
    //          end else begin
    //            status:='danger*Your profile could not be updated. Please try again later';
    //            end;

    //       end else begin
    //         status:='danger*A user with the given ID Number does not exist';
    //         end;
    // end;

    // procedure updatePersonalDetails(idNumber: Code[20];maritalStatus: Text;ethnicOrigin: Text;disabled: Text;healthAssessment: Boolean;healthAssessmentDate: Date;dateOfBirth: Date) status: Text
    // begin
    //     if HrJobsApplicants.Get(idNumber) then begin
    //       if maritalStatus='' then
    //     HrJobsApplicants."Marital Status":= HrJobsApplicants."marital status"::" ";
    //         if maritalStatus='Single' then
    //     HrJobsApplicants."Marital Status":= HrJobsApplicants."marital status"::Single;
    //           if maritalStatus='Married' then
    //     HrJobsApplicants."Marital Status":= HrJobsApplicants."marital status"::Married;
    //             if maritalStatus='Separated' then
    //     HrJobsApplicants."Marital Status":= HrJobsApplicants."marital status"::Separated;
    //               if maritalStatus='Divorced' then
    //     HrJobsApplicants."Marital Status":= HrJobsApplicants."marital status"::Divorced;
    //                 if maritalStatus='Widow(er)' then
    //     HrJobsApplicants."Marital Status":= HrJobsApplicants."marital status"::"Widow(er)";
    //                   if maritalStatus='Other' then
    //     HrJobsApplicants."Marital Status":= HrJobsApplicants."marital status"::Other;
    //         if ethnicOrigin='African' then
    //     HrJobsApplicants."Ethnic Origin":= HrJobsApplicants."ethnic origin"::African;
    //             if ethnicOrigin='Indian' then
    //     HrJobsApplicants."Ethnic Origin":= HrJobsApplicants."ethnic origin"::Indian;
    //                 if ethnicOrigin='White' then
    //     HrJobsApplicants."Ethnic Origin":= HrJobsApplicants."ethnic origin"::White;
    //                     if ethnicOrigin='Coloured' then
    //     HrJobsApplicants."Ethnic Origin":= HrJobsApplicants."ethnic origin"::Coloured;
    //                     if disabled='' then
    //     HrJobsApplicants.Disabled:= HrJobsApplicants.Disabled::" ";
    //                     if disabled='No' then
    //     HrJobsApplicants.Disabled:= HrJobsApplicants.Disabled::No;
    //                     if disabled='Yes' then
    //     HrJobsApplicants.Disabled:= HrJobsApplicants.Disabled::Yes;
    //       HrJobsApplicants."Health Assesment?":= healthAssessment;
    //       HrJobsApplicants."Health Assesment Date":=healthAssessmentDate;
    //       HrJobsApplicants."Date Of Birth":= dateOfBirth;
    //        if HrJobsApplicants.Modify(true) then begin
    //          status:='success*Your profile was successfully updated'+Format(healthAssessmentDate);
    //          end else begin
    //            status:='danger*Your profile could not be updated. Please try again later';
    //            end;
    //       end else begin
    //         status:='danger*A user with the given ID Number does not exist';
    //         end;
    // end;

    // procedure updateCommunicationDetails(idNumber: Code[20];homePhoneNumber: Text;postalAddress: Text;postalAddress2: Text;postalAddress3: Text;residentialAddress: Text;residentialAddress2: Text;residentialAddress3: Text;cellPhoneNumber: Text;workPhoneNumber: Text;extension: Text;fax: Text;postCode: Code[20];postCode2: Code[20]) status: Text
    // begin
    //     if HrJobsApplicants.Get(idNumber) then begin
    //       HrJobsApplicants."Home Phone Number":= homePhoneNumber;
    //       HrJobsApplicants."Postal Address":= postalAddress;
    //       HrJobsApplicants."Postal Address2":= postalAddress2;
    //       HrJobsApplicants."Postal Address3":= postalAddress3;
    //       HrJobsApplicants."Residential Address":= residentialAddress;
    //       HrJobsApplicants."Residential Address2":=residentialAddress2;
    //       HrJobsApplicants."Residential Address3":= residentialAddress3;
    //       HrJobsApplicants."Cell Phone Number":=cellPhoneNumber;
    //       HrJobsApplicants."Work Phone Number":=workPhoneNumber;
    //       HrJobsApplicants."Ext.":=extension;
    //       HrJobsApplicants."Fax Number":=fax;
    //       HrJobsApplicants."Post Code":=postCode;
    //       HrJobsApplicants."Post Code2":=postCode2;
    //     if HrJobsApplicants.Modify(true) then begin
    //          status:='success*Your profile was successfully updated';
    //          end else begin
    //            status:='danger*Your profile could not be updated. Please try again later';
    //            end;
    //       end else begin
    //         status:='danger*A user with the given ID Number does not exist';
    //         end;
    // end;

    // procedure addReferee(idNumber: Code[20];refName: Text;refDesignation: Text;refInstitution: Text;refAddress: Text;refTelephone: Text;refEmail: Text) status: Text
    // begin
    //     //JobApplicantReferees
    //     /*IF HrJobsApplicants.GET(idNumber) THEN BEGIN
    //       JobApplicantReferees.INIT;
    //       JobApplicantReferees.Code:=idNumber;
    //       JobApplicantReferees."Job Application No":= refName;
    //       JobApplicantReferees."Job Indicator Code":=refDesignation;
    //       JobApplicantReferees."Indicator Description":=refInstitution;
    //       JobApplicantReferees.Number:=refAddress;
    //       JobApplicantReferees."Additional Comments":=refTelephone;
    //       JobApplicantReferees."Job ID":=refEmail;
    //       IF JobApplicantReferees.INSERT(TRUE) THEN BEGIN
    //         status:='success*The referee was successfully added';
    //         END ELSE BEGIN
    //           status:='danger*The referee could not be added';
    //           END;
    //       END ELSE BEGIN
    //         status:='danger*A user with the given ID Number does not exist';
    //         END;*/

    // end;

    // procedure addQualification(idNumber: Code[20];qualificationType: Text;qualificationCode: Code[20];qualificationFrom: Date;qualificationTo: Date;institution: Text) status: Text
    // begin
    //     /*
    //     IF HrJobsApplicants.GET(idNumber) THEN BEGIN
    //       JobApplicantsQualifications.INIT;
    //       JobApplicantsQualifications.Code:= idNumber;
    //      JobApplicantsQualifications."Qualification Type":=qualificationType ;
    //       JobApplicantsQualifications."Qualification Code":= qualificationCode;
    //       JobApplicantsQualifications.VALIDATE("Qualification Code");
    //       JobApplicantsQualifications."Indicator Description":=qualificationFrom;
    //       JobApplicantsQualifications.Number:=qualificationTo;
    //       JobApplicantsQualifications."Institution/Company":=institution;
    //       IF JobApplicantsQualifications.INSERT(TRUE) THEN BEGIN
    //         status:='success*The qualification was successfully added';
    //         END ELSE BEGIN
    //           status:='danger*The qualification could not be added';
    //           END;
    //       END ELSE BEGIN
    //         status:='danger*A user with the given ID Number does not exist';
    //         END;
    //         */

    // end;

    // procedure apply(idNumber: Code[20];jobId: Code[20]) status: Text
    // begin
    //     /*
    //     IF HrJobsApplicants.GET(idNumber) THEN BEGIN
    //       CompanyJobs.RESET;
    //       CompanyJobs.SETRANGE("Job ID", jobId);
    //       CompanyJobs.SETRANGE(Advertised, TRUE);
    //       IF CompanyJobs.FINDSET THEN BEGIN
    //         IF CompanyJobs."Vacant Positions">0 THEN BEGIN
    //           //apply for job
    //           //check if user has already applied for the job
    //           JobPositionApplications.RESET;
    //           JobPositionApplications.SETRANGE(JobPositionApplications."Job Applied For", jobId);
    //           JobPositionApplications.SETRANGE(JobPositionApplications."ID Number", idNumber);
    //           IF JobPositionApplications.FINDSET THEN BEGIN
    //             status:='danger*It seems you have already applied for this position. Please try another position';
    //             END ELSE BEGIN
    //               JobPositionApplications.INIT;
    //               JobPositionApplications."Job ID":= HrJobsApplicants."First Name";
    //               JobPositionApplications."From Date":= HrJobsApplicants."Middle Name";
    //               JobPositionApplications."To Date":= HrJobsApplicants."Last Name";
    //               JobPositionApplications.Institution:= HrJobsApplicants.Initials;
    //               JobPositionApplications."First Language (R/W/S)":= HrJobsApplicants."First Language (R/W/S)";
    //               JobPositionApplications."First Language (R/W/S)":= HrJobsApplicants."First Language (R/W/S)";
    //               JobPositionApplications."ID Number":= HrJobsApplicants."ID Number";
    //               JobPositionApplications."Job Applied For":= jobId;
    //               JobPositionApplications."Second Language (R/W/S)":= HrJobsApplicants."Second Language (R/W/S)";
    //               JobPositionApplications."Second Language Read":= HrJobsApplicants."Second Language Read";
    //               JobPositionApplications."Second Language Speak":= HrJobsApplicants."Second Language Speak";
    //               JobPositionApplications."Second Language Write":= HrJobsApplicants."Second Language Write";
    //               JobPositionApplications."Additional Language":= HrJobsApplicants."Additional Language";
    //               JobPositionApplications."Applicant Type":= JobPositionApplications."Applicant Type"::"0";
    //               JobPositionApplications.Gender:= HrJobsApplicants.Gender;
    //               JobPositionApplications.Citizenship:= HrJobsApplicants.Citizenship;
    //               JobPositionApplications.VALIDATE(Citizenship);
    //               JobPositionApplications."Marital Status":= HrJobsApplicants."Marital Status";
    //               JobPositionApplications."Ethnic Origin":= HrJobsApplicants."Ethnic Origin";
    //               JobPositionApplications.Disabled:= HrJobsApplicants.Disabled;
    //               JobPositionApplications."Health Assesment?":= HrJobsApplicants."Health Assesment?";
    //               JobPositionApplications."Health Assesment Date":= HrJobsApplicants."Health Assesment Date";
    //               JobPositionApplications."Date Of Birth":= HrJobsApplicants."Date Of Birth";
    //               JobPositionApplications.Age:= HrJobsApplicants.Age;
    //               JobPositionApplications."Home Phone Number":= HrJobsApplicants."Home Phone Number";
    //               JobPositionApplications.Grade:= HrJobsApplicants."Postal Address";
    //               JobPositionApplications."Postal Address2":= HrJobsApplicants."Postal Address2";
    //               JobPositionApplications."Postal Address3":= HrJobsApplicants."Postal Address3";
    //               JobPositionApplications.Code:= HrJobsApplicants."Post Code";
    //               JobPositionApplications."Post Code2":= HrJobsApplicants."Post Code2";
    //               JobPositionApplications."Cell Phone Number":= HrJobsApplicants."Cell Phone Number";
    //               JobPositionApplications."Work Phone Number":= HrJobsApplicants."Work Phone Number";
    //               JobPositionApplications."Ext.":= HrJobsApplicants."Ext.";
    //               JobPositionApplications."E-Mail":= HrJobsApplicants."E-Mail";
    //               JobPositionApplications."Fax Number":= HrJobsApplicants."Fax Number";
    //                   IF JobPositionApplications.INSERT(TRUE) THEN BEGIN
    //                     status:='success*You job application was successfully captured. Thank you';
    //                     END ELSE BEGIN
    //                       status:='danger*You application could not be captured. Please try again later';
    //                       END;
    //               END;
    //           END ELSE BEGIN
    //             status:='danger*The selected job does not have any open position';
    //             END;
    //         END ELSE BEGIN
    //              status:='danger*The selected job is no longer available';
    //           END;
    //        END ELSE BEGIN
    //         status:='danger*A user with the given ID Number does not exist';
    //         END;
    //         */

    // end;

    // procedure imprestGeneralDetails(employeeNo: Code[50];imprestNo: Code[20];subject: Text;objective: Text;destinationNarration: Text;travelDate: Date;numberOfDays: Decimal;job: Code[50];jobTaskNo: Code[50];fundCode: Code[100];referenceNo: Code[100]) status: Text
    // var
    //     ObjNoSeriesMgt: Codeunit NoSeriesManagement;
    //     ObjCashMgtSetup: Record "Cash Management Setup";
    // begin
    //     status:='danger*Your imprest requisition could not be captured';
    //     if imprestNo='' then begin
    //     ImprestMemo.Init;
    //     ImprestMemo."Document Type":= ImprestMemo."document type"::"Imprest Memo";
    //     ImprestMemo.Subject:= subject;
    //     ImprestMemo.Validate(Subject);
    //     ImprestMemo."Imprest Naration":= destinationNarration;
    //     ImprestMemo.Validate("Imprest Naration");
    //     ImprestMemo."Start Date":=travelDate;
    //     ImprestMemo.Validate("Start Date");
    //     ImprestMemo."No. of days":= numberOfDays;
    //     ImprestMemo.Validate("No. of days");
    //     ImprestMemo.Requestor:=employeeNo;
    //     ImprestMemo."Refernce No":= referenceNo;
    //     if ImprestMemo.Insert(true) then begin
    //       ImprestMemo.Validate("Refernce No");
    //       ImprestMemo.Validate("No. of days");
    //       ImprestMemo.Validate(Requestor);
    //       ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
    //       ImprestMemo."Responsibility Center":=job;
    //       ImprestMemo.Modify(true);
    //       //try updating the blob field
    //        ImprestMemo.CalcFields(Objective);
    //             ImprestMemo.Objective.CreateInstream(LegInstr);
    //             Leg.Read(LegInstr);
    //              LegText:= objective;
    //             if LegText<>Format(Leg) then
    //             begin
    //                    Clear(ImprestMemo.Objective);
    //                    Clear(Leg);
    //                    Leg.AddText(LegText);
    //                   ImprestMemo.Objective.CreateOutstream(LegOutStr);
    //                    Leg.Write(LegOutStr);
    //                    ImprestMemo.Modify;
    //             end;

    //       status:='success*Your imprest requisition was successfully created*'+ImprestMemo."No.";
    //       end else begin
    //         status:='danger*Your imprest requisition could not be created';
    //         end;
    //     end else begin
    //       ImprestMemo.Reset;
    //       ImprestMemo.SetRange(Requestor, employeeNo);
    //       ImprestMemo.SetRange("No.", imprestNo);
    //       ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
    //       ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //       if ImprestMemo.FindSet then begin
    //             ImprestMemo."Document Type":= ImprestMemo."document type"::"Imprest Memo";
    //             ImprestMemo.Subject:= subject;
    //             ImprestMemo.Validate(Subject);
    //             ImprestMemo."Imprest Naration":= destinationNarration;
    //             ImprestMemo.Validate("Imprest Naration");
    //             ImprestMemo."Start Date":=travelDate;
    //             ImprestMemo.Validate("Start Date");
    //             ImprestMemo."No. of days":= numberOfDays;
    //             ImprestMemo.Requestor:=employeeNo;
    //             ImprestMemo."Responsibility Center":=job;
    //             ImprestMemo."Refernce No":= referenceNo;
    //             ImprestMemo.Validate(Requestor);
    //             if ImprestMemo.Modify(true) then begin
    //               ImprestMemo.Validate("No. of days");
    //               ImprestMemo.Requestor:= employeeNo;
    //               ImprestMemo.Validate(Requestor);
    //               ImprestMemo.Validate("Refernce No");
    //               ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
    //               ImprestMemo.Modify(true);
    //                ImprestMemo.CalcFields(Objective);
    //                     ImprestMemo.Objective.CreateInstream(LegInstr);
    //                     Leg.Read(LegInstr);
    //                      LegText:= objective;
    //                     if LegText<>Format(Leg) then
    //                     begin
    //                            Clear(ImprestMemo.Objective);
    //                            Clear(Leg);
    //                            Leg.AddText(LegText);
    //                           ImprestMemo.Objective.CreateOutstream(LegOutStr);
    //                            Leg.Write(LegOutStr);
    //                            ImprestMemo.Modify;
    //                     end;

    //               status:='success*Your imprest requisition was successfully created*'+ImprestMemo."No.";
    //               end else begin
    //                 status:='danger*Your imprest requisition could not be created';
    //                 end;

    //       end else begin

    //       ImprestMemo.Reset;
    //       ImprestMemo.SetRange(Requestor, employeeNo);
    //       ImprestMemo.SetRange("No.", imprestNo);
    //       ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
    //       ImprestMemo.SetRange(Status, ImprestMemo.Status::Released);
    //       if ImprestMemo.FindSet then begin
    //             ImprestMemo."Document Type":= ImprestMemo."document type"::"Imprest Memo";
    //             ImprestMemo.Subject:= subject;
    //             ImprestMemo.Validate(Subject);
    //             //ImprestMemo.Objective:= objective;
    //             ImprestMemo."Imprest Naration":= destinationNarration;
    //             ImprestMemo.Validate("Imprest Naration");
    //             ImprestMemo."Start Date":=travelDate;
    //             ImprestMemo.Validate("Start Date");
    //             ImprestMemo."No. of days":= numberOfDays;
    //             //ImprestMemo.VALIDATE("No. of days");
    //             ImprestMemo.Job:= job;
    //             ImprestMemo.Validate(Job);
    //             ImprestMemo."Job  Task":= jobTaskNo;
    //             ImprestMemo.Validate("Job  Task");
    //             ImprestMemo.Requestor:=employeeNo;
    //             ImprestMemo.Validate(Requestor);
    //             if ImprestMemo.Modify(true) then begin
    //               ImprestMemo.Validate("No. of days");
    //               ImprestMemo.Requestor:= employeeNo;
    //                  //Added By Fred
    //                 Employee.Reset;
    //                 Employee.SetRange("No.",employeeNo);
    //                 if Employee.FindSet then
    //                 ImprestMemo."Responsibility Center":=Employee."Global Dimension 1 Code";
    //                 //Added By Fred
    //               ImprestMemo.Validate(Requestor);
    //               ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
    //               ImprestMemo.Modify(true);
    //               //try updating the blob field
    //                ImprestMemo.CalcFields(Objective);
    //                     ImprestMemo.Objective.CreateInstream(LegInstr);
    //                     Leg.Read(LegInstr);
    //                      LegText:= objective;
    //                     if LegText<>Format(Leg) then
    //                     begin
    //                            Clear(ImprestMemo.Objective);
    //                            Clear(Leg);
    //                            Leg.AddText(LegText);
    //                           ImprestMemo.Objective.CreateOutstream(LegOutStr);
    //                            Leg.Write(LegOutStr);
    //                            ImprestMemo.Modify;
    //                     end;

    //               status:='success*Your imprest requisition was successfully created*'+ImprestMemo."No.";
    //               end else begin
    //                 status:='danger*Your imprest requisition could not be created';
    //                 end;

    //       end else begin
    //         status:='danger*You are not the requester of the specified imprest memo. Please create a new imprest memo';
    //         end


    //     end;


    //       end;


    //     exit(status);
    // end;

    // procedure imprestGeneralDetails1(employeeNo: Code[50];imprestNo: Code[20];subject: Text;objective: Text;destinationNarration: Text;travelDate: Date;numberOfDays: Decimal;job: Code[50];jobTaskNo: Code[50];fundCode: Code[100];referenceNo: Code[100]) status: Text
    // var
    //     ObjNoSeriesMgt: Codeunit NoSeriesManagement;
    //     ObjCashMgtSetup: Record "Cash Management Setup";
    // begin
    //     status:='danger*Your imprest requisition could not be captured';
    //     if imprestNo='' then begin
    //       //ObjCashMgtSetup.GET;
    //     ImprestMemo.Init;
    //     ImprestMemo."Document Type":= ImprestMemo."document type"::"Imprest Memo";
    //     //ImprestMemo."No.":=ObjNoSeriesMgt.GetNextNo(ObjCashMgtSetup."Imprest Memo Nos",TODAY,TRUE);
    //     ImprestMemo.Subject:= subject;
    //     ImprestMemo.Validate(Subject);
    //     //ImprestMemo.Objective:= objective;
    //     ImprestMemo."Imprest Naration":= destinationNarration;
    //     ImprestMemo.Validate("Imprest Naration");
    //     ImprestMemo."Start Date":=travelDate;
    //     //ImprestMemo."Number of Drivers":=noofdrivers;
    //     ImprestMemo.Validate("Start Date");
    //     ImprestMemo."No. of days":= numberOfDays;
    //     ImprestMemo.Validate("No. of days");
    //     ImprestMemo.Job:= job;
    //     ImprestMemo.Validate(Job);
    //     ImprestMemo."Job  Task":= jobTaskNo;
    //     ImprestMemo.Validate("Job  Task");
    //     ImprestMemo.Requestor:=employeeNo;
    //     //ImprestMemo."Mode of Transport":=modeoftransport;
    //     //Added By Fred
    //     Employee.Reset;
    //     Employee.SetRange("No.",employeeNo);
    //     if Employee.FindSet then
    //     ImprestMemo."Responsibility Center":=Employee."Global Dimension 1 Code";
    //     //Added By Fred

    //     ImprestMemo."Refernce No":= referenceNo;
    //     if ImprestMemo.Insert(true) then begin
    //       ImprestMemo.Validate("Refernce No");
    //       ImprestMemo.Validate("No. of days");
    //       //ImprestMemo.Requestor:= employeeNo;
    //       ImprestMemo.Validate(Requestor);
    //       ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
    //       ImprestMemo.Modify(true);
    //       //try updating the blob field
    //        ImprestMemo.CalcFields(Objective);
    //             ImprestMemo.Objective.CreateInstream(LegInstr);
    //             Leg.Read(LegInstr);
    //              LegText:= objective;
    //             if LegText<>Format(Leg) then
    //             begin
    //                    Clear(ImprestMemo.Objective);
    //                    Clear(Leg);
    //                    Leg.AddText(LegText);
    //                   ImprestMemo.Objective.CreateOutstream(LegOutStr);
    //                    Leg.Write(LegOutStr);
    //                    ImprestMemo.Modify;
    //             end;

    //       status:='success*Your imprest requisition was successfully created*'+ImprestMemo."No.";
    //       end else begin
    //         status:='danger*Your imprest requisition could not be created';
    //         end;
    //     end else begin
    //       ImprestMemo.Reset;
    //       ImprestMemo.SetRange(Requestor, employeeNo);
    //       ImprestMemo.SetRange("No.", imprestNo);
    //       ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
    //       ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //       if ImprestMemo.FindSet then begin
    //             ImprestMemo."Document Type":= ImprestMemo."document type"::"Imprest Memo";
    //             ImprestMemo.Subject:= subject;
    //             ImprestMemo.Validate(Subject);
    //             //ImprestMemo.Objective:= objective;
    //             ImprestMemo."Imprest Naration":= destinationNarration;
    //             ImprestMemo.Validate("Imprest Naration");
    //             ImprestMemo."Start Date":=travelDate;
    //             ImprestMemo.Validate("Start Date");
    //             ImprestMemo."No. of days":= numberOfDays;
    //             //ImprestMemo.VALIDATE("No. of days");
    //             ImprestMemo.Job:= job;
    //             ImprestMemo.Validate(Job);
    //             ImprestMemo."Job  Task":= jobTaskNo;
    //             ImprestMemo.Validate("Job  Task");
    //             ImprestMemo.Requestor:=employeeNo;
    //             //Added By Fred
    //             Employee.Reset;
    //             Employee.SetRange("No.",employeeNo);
    //             if Employee.FindSet then
    //             ImprestMemo."Responsibility Center":=Employee."Global Dimension 1 Code";
    //             //Added By Fred
    //             ImprestMemo."Refernce No":= referenceNo;
    //             ImprestMemo.Validate(Requestor);
    //             if ImprestMemo.Modify(true) then begin
    //               ImprestMemo.Validate("No. of days");
    //               ImprestMemo.Requestor:= employeeNo;
    //               ImprestMemo.Validate(Requestor);
    //               ImprestMemo.Validate("Refernce No");
    //               ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
    //               ImprestMemo.Modify(true);
    //               //try updating the blob field
    //                ImprestMemo.CalcFields(Objective);
    //                     ImprestMemo.Objective.CreateInstream(LegInstr);
    //                     Leg.Read(LegInstr);
    //                      LegText:= objective;
    //                     if LegText<>Format(Leg) then
    //                     begin
    //                            Clear(ImprestMemo.Objective);
    //                            Clear(Leg);
    //                            Leg.AddText(LegText);
    //                           ImprestMemo.Objective.CreateOutstream(LegOutStr);
    //                            Leg.Write(LegOutStr);
    //                            ImprestMemo.Modify;
    //                     end;

    //               status:='success*Your imprest requisition was successfully created*'+ImprestMemo."No.";
    //               end else begin
    //                 status:='danger*Your imprest requisition could not be created';
    //                 end;

    //       end else begin

    //       ImprestMemo.Reset;
    //       ImprestMemo.SetRange(Requestor, employeeNo);
    //       ImprestMemo.SetRange("No.", imprestNo);
    //       ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
    //       ImprestMemo.SetRange(Status, ImprestMemo.Status::Released);
    //       if ImprestMemo.FindSet then begin
    //             ImprestMemo."Document Type":= ImprestMemo."document type"::"Imprest Memo";
    //             ImprestMemo.Subject:= subject;
    //             ImprestMemo.Validate(Subject);
    //             //ImprestMemo.Objective:= objective;
    //             ImprestMemo."Imprest Naration":= destinationNarration;
    //             ImprestMemo.Validate("Imprest Naration");
    //             ImprestMemo."Start Date":=travelDate;
    //             ImprestMemo.Validate("Start Date");
    //             ImprestMemo."No. of days":= numberOfDays;
    //             //ImprestMemo.VALIDATE("No. of days");
    //             ImprestMemo.Job:= job;
    //             ImprestMemo.Validate(Job);
    //             ImprestMemo."Job  Task":= jobTaskNo;
    //             ImprestMemo.Validate("Job  Task");
    //             ImprestMemo.Requestor:=employeeNo;
    //             ImprestMemo.Validate(Requestor);
    //             if ImprestMemo.Modify(true) then begin
    //               ImprestMemo.Validate("No. of days");
    //               ImprestMemo.Requestor:= employeeNo;
    //                  //Added By Fred
    //                 Employee.Reset;
    //                 Employee.SetRange("No.",employeeNo);
    //                 if Employee.FindSet then
    //                 ImprestMemo."Responsibility Center":=Employee."Global Dimension 1 Code";
    //                 //Added By Fred
    //               ImprestMemo.Validate(Requestor);
    //               ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
    //               ImprestMemo.Modify(true);
    //               //try updating the blob field
    //                ImprestMemo.CalcFields(Objective);
    //                     ImprestMemo.Objective.CreateInstream(LegInstr);
    //                     Leg.Read(LegInstr);
    //                      LegText:= objective;
    //                     if LegText<>Format(Leg) then
    //                     begin
    //                            Clear(ImprestMemo.Objective);
    //                            Clear(Leg);
    //                            Leg.AddText(LegText);
    //                           ImprestMemo.Objective.CreateOutstream(LegOutStr);
    //                            Leg.Write(LegOutStr);
    //                            ImprestMemo.Modify;
    //                     end;

    //               status:='success*Your imprest requisition was successfully created*'+ImprestMemo."No.";
    //               end else begin
    //                 status:='danger*Your imprest requisition could not be created';
    //                 end;

    //       end else begin
    //         status:='danger*You are not the requester of the specified imprest memo. Please create a new imprest memo';
    //         end


    //     end;


    //       end;


    //     exit(status);
    // end;

    // procedure getImprestObjective(imprestNo: Code[50];employeeNo: Code[50]) objective: Text
    // begin
    //     objective:='';
    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange("No.", imprestNo);
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     if ImprestMemo.FindSet then begin
    //     ImprestMemo.CalcFields(Objective);
    //     ImprestMemo.Objective.CreateInstream(LegInstr);
    //     Leg.Read(LegInstr);
    //     LegText:=Format(Leg);

    //     //Convert Project Legectives from BLOB to TXT
    //     ImprestMemo.CalcFields(Objective);
    //     ImprestMemo.Objective.CreateInstream(LegInstr);
    //     Leg.Read(LegInstr);

    //     if LegText<>Format(obj) then
    //     begin
    //      Clear(ImprestMemo.Objective);
    //      Clear(Leg);
    //      Leg.AddText(LegText);
    //      ImprestMemo.Objective.CreateOutstream(LegOutStr);
    //      Leg.Write(LegOutStr);
    //     end;
    //     objective:= Format(Leg);
    //     end;
    //     exit(objective);
    // end;

    // procedure addTeamMember(employeeNo: Code[50];imprestNo: Code[50];destinationTown: Text;voteItem: Text;teamMember: Text;noOfDays: Decimal;constituency: Text[100];job: Code[50];jobTaskNo: Code[50];region: Text[50];lead: Boolean) status: Text
    // var
    //     ProjectMembers: Record "Project Members";
    //     ReturnDate: Date;
    //     Days: Text;
    // begin
    //     //status:='danger*The team member could not be added';

    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       ReturnDate:=CalcDate(StrSubstNo('<%1D>',noOfDays),ImprestMemo."Start Date");
    //       ProjectMembers.Reset;
    //       ProjectMembers.SetRange("No.", teamMember);
    //       ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
    //       ProjectMembers.SetRange("Work Type", destinationTown);
    //       ProjectMembers.SetRange(Project,job);
    //       if ProjectMembers.FindSet then begin
    //         //status:='danger*The given team member with Project %1'+job+ ' has already been added to the selected imprest';
    //         end else begin
    //       //ProjectMembers.RESET;
    //       //ProjectMembers.SETRANGE("No.",teamMember);
    //       //ProjectMembers.SETRANGE("Return Date",ImprestMemo."Start Date",ReturnDate);
    //       //IF ProjectMembers.FINDSET THEN BEGIN
    //           //ERROR('This employee %1 is tied in another imprest memo %2',ProjectMembers."No.",ProjectMembers."Imprest Memo No.");
    //         end;
    //           ProjectMembers.Init;
    //           ProjectMembers.Type:= ProjectMembers.Type::Person;
    //           ProjectMembers."Imprest Memo No.":=imprestNo;
    //           ProjectMembers.Validate("Imprest Memo No.");
    //           ProjectMembers."Work Type":= destinationTown;
    //           ProjectMembers.Validate("Work Type");
    //           ProjectMembers."Type of Expense":= voteItem;
    //           ProjectMembers.Validate("Type of Expense");
    //           ProjectMembers."No.":= teamMember;
    //           ProjectMembers.Validate("No.") ;
    //           ProjectMembers."Line No":=ProjectMembers.Count+1;
    //           ProjectMembers.Validate("No.");
    //           ProjectMembers."Time Period":= noOfDays;
    //           ProjectMembers.Validate("Time Period");
    //           ProjectMembers."Constituency Code":= constituency;
    //           ProjectMembers.Job:=job;
    //           ProjectMembers.Validate(Job);
    //           ProjectMembers."Job  Task":=jobTaskNo;
    //           ProjectMembers.Validate("Job  Task");
    //           ProjectMembers.Region:=region;
    //           ProjectMembers."Project Lead":=lead;
    //           if ProjectMembers.Insert(true) then begin
    //              ProjectMembers.Validate("Time Period");
    //             //ProjectMembers.VALIDATE("Job  Task");
    //             status:='success*The team member was successfully added';
    //             end else begin
    //               status:='danger*The team member could not be added';
    //               end;
    //           end else begin
    //          status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //        end;
    //     exit(status);
    // end;

    // procedure addTeamMember1(employeeNo: Code[50];imprestNo: Code[50];destinationTown: Text;voteItem: Text;teamMember: Text;noOfDays: Decimal;constituency: Text[100];job: Code[50];jobTaskNo: Code[50];region: Text[50];lead: Boolean;modeoftransport: Integer;noofdrivers: Integer) status: Text
    // var
    //     ProjectMembers: Record "Project Members";
    //     ReturnDate: Date;
    //     Days: Text;
    // begin
    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       ImprestMemo."Mode of Transport":=modeoftransport;
    //       ImprestMemo."Number of Drivers":=noofdrivers;
    //       if ImprestMemo.Modify(true) then
    //       ReturnDate:=CalcDate(StrSubstNo('<%1D>',noOfDays),ImprestMemo."Start Date");
    //       ProjectMembers.Reset;
    //       ProjectMembers.SetRange("No.", teamMember);
    //       ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
    //       ProjectMembers.SetRange("Work Type", destinationTown);
    //       ProjectMembers.SetRange(Project,job);
    //       if ProjectMembers.FindSet then begin
    //         status:='danger*The given team member with Project %1'+job+ ' has already been added to the selected imprest';
    //         end else begin
    //       //ProjectMembers.RESET;
    //       //ProjectMembers.SETRANGE("No.",teamMember);
    //       //ProjectMembers.SETRANGE("Return Date",ImprestMemo."Start Date",ReturnDate);
    //       //IF ProjectMembers.FINDSET THEN BEGIN
    //       //ERROR('This employee %1 is tied in another imprest memo %2',ProjectMembers."No.",ProjectMembers."Imprest Memo No.");
    //         end;
    //           ProjectMembers.Init;
    //           ProjectMembers.Type:= ProjectMembers.Type::Person;
    //           ProjectMembers."Imprest Memo No.":=imprestNo;
    //           ProjectMembers.Validate("Imprest Memo No.");
    //           ProjectMembers."Work Type":= destinationTown;
    //           ProjectMembers.Validate("Work Type");
    //           ProjectMembers."Type of Expense":= voteItem;
    //           ProjectMembers.Validate("Type of Expense");
    //           ProjectMembers."No.":= teamMember;
    //           ProjectMembers.Validate("No.") ;
    //           ProjectMembers."Line No":=ProjectMembers.Count+1;
    //           ProjectMembers.Validate("No.");
    //           ProjectMembers."Time Period":= noOfDays;
    //           ProjectMembers.Validate("Time Period");
    //           ProjectMembers."Constituency Code":= constituency;
    //           ProjectMembers.Job:=job;
    //           ProjectMembers.Validate(Job);
    //           ProjectMembers."Job  Task":=jobTaskNo;
    //           ProjectMembers.Validate("Job  Task");
    //           ProjectMembers.Region:=region;
    //           ProjectMembers."Project Lead":=lead;
    //           if ProjectMembers.Insert(true) then begin
    //             //ProjectMembers.VALIDATE("Job  Task");
    //             ImprestMemo.Validate("Number of Drivers");
    //             ImprestMemo.Validate("Mode of Transport");
    //             ProjectMembers.Validate("Time Period");
    //             status:='success*The team member was successfully added';
    //             end else begin
    //               status:='danger*The team member could not be added';
    //               end;
    //           end else begin
    //          status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //        end;
    //     exit(status);
    // end;

    // procedure addFuel(employeeNo: Code[50];imprestNo: Code[50];workType: Text;resource: Text;mileage: Decimal) status: Text
    // var
    //     ProjectMembers: Record "Project Members";
    // begin
    //     status:='danger*The fuel could not be added';
    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       ProjectMembers.Reset;
    //       ProjectMembers.SetRange("No.", resource);
    //       ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
    //       ProjectMembers.SetRange("Work Type", workType);
    //       if ProjectMembers.FindSet then begin
    //         status:='danger*The given fuel has already been added to the selected imprest';
    //         end else begin
    //           ProjectMembers.Init;
    //           ProjectMembers.Type:= ProjectMembers.Type::Machine;
    //           ProjectMembers."Imprest Memo No.":=imprestNo;
    //           ProjectMembers."Work Type":= workType;
    //           ProjectMembers.Validate("Work Type");
    //           ProjectMembers.Validate("Type of Expense");
    //           ProjectMembers."No.":= resource;
    //           ProjectMembers.Validate("No.");
    //           ProjectMembers."Time Period":= mileage;
    //           //ProjectMembers.VALIDATE("Time Period");
    //           if ProjectMembers.Insert(true) then begin
    //             status:='success*The fuel was successfully added';
    //             end else begin
    //               status:='danger*The fuel could not be added';
    //               end;
    //           end;
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure addCasuals(employeeNo: Code[50];imprestNo: Code[50];type: Integer;resource: Text;workType: Text;noRequired: Decimal;noOfDays: Decimal;employeeToSurrender: Text[50];job: Text[50];jobTask: Text[50]) status: Text
    // var
    //     Casuals: Record Casuals;
    // begin
    //     //Casuals
    //     status:='danger*The casual could not be added';

    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       Casuals.Reset;
    //       Casuals.SetRange("Imprest Memo No.", imprestNo);
    //       Casuals.SetRange(Type, type);
    //       Casuals.SetRange("Resource No.", resource);
    //       if Casuals.FindSet then begin
    //         status:='danger*The casual has already been added to the selected imprest';
    //         end else begin
    //           //imprestNo : Code[50];type : Integer;resource : Text;workType : Text;noRequired : Decimal;noOfDays : Decimal
    //           Casuals.Init;
    //           Casuals.Type:= type;
    //           Casuals."Imprest Memo No.":=imprestNo;
    //           Casuals."Resource No.":= resource;
    //           Casuals.Validate("Resource No.");
    //           Casuals.Validate("Imprest Memo No.");
    //           Casuals.Validate(Type);

    //           Casuals."Work Type":= workType;
    //           Casuals.Validate("Work Type");
    //           Casuals."No. Required":= noRequired;
    //           Casuals.Validate("No. Required");
    //           Casuals."No. of Days":=noOfDays;
    //           Casuals.Validate("No. of Days");
    //           Casuals."Employee No To Surrender":=employeeToSurrender;
    //           Casuals.Validate("Employee No To Surrender");
    //           Casuals.Job:=job;
    //           Casuals."Job  Task":=jobTask;
    //           Casuals.Validate("Job  Task");

    //           if Casuals.Insert(true) then begin
    //             status:='success*The casual was successfully added';
    //             end else begin
    //               status:='danger*The casual could not be added';
    //               end;
    //           end;
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure addOtherCosts(employeeNo: Code[50];imprestNo: Code[50];voteItem: Text;requiredFor: Text;quantityRequired: Decimal;noOfDays: Decimal;unitCost: Decimal;employeeToSurrender: Text[20];job: Text[50];jobTask: Text[50]) status: Text
    // var
    //     OtherCosts: Record "Other Costs";
    // begin
    //     //Casuals
    //     status:='danger*The cost could not be added';

    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin

    //           // voteItem : Text;requiredFor : Text;quantityRequired : Decimal;noOfDays : Decimal;unitCost : Decimal
    //           OtherCosts.Init;
    //           OtherCosts."Line No.":=getLineNo(imprestNo);;
    //           OtherCosts."Imprest Memo No.":= imprestNo;
    //           OtherCosts.Validate("Imprest Memo No.");
    //           OtherCosts."Type of Expense":= voteItem;
    //           OtherCosts.Validate("Type of Expense");
    //           OtherCosts."Required For":=requiredFor;
    //           OtherCosts.Validate("Required For");
    //           OtherCosts."Quantity Required":=quantityRequired;
    //           OtherCosts.Validate("Quantity Required");
    //           OtherCosts."No. of Days":=noOfDays;
    //           OtherCosts.Validate("No. of Days");
    //           OtherCosts."Unit Cost":=unitCost;
    //           OtherCosts.Validate("Unit Cost");
    //           OtherCosts."Employee No To Surrender":=employeeToSurrender;
    //           OtherCosts.Validate("Employee No To Surrender");
    //           OtherCosts.Job:= job;
    //           OtherCosts."Job  Task":= jobTask;
    //           OtherCosts.Validate("Job  Task");
    //           if OtherCosts.Insert(true) then begin
    //             status:='success*The cost was successfully added';
    //             end else begin
    //               status:='danger*The cost could not be added';
    //               end;

    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // local procedure getLineNo(imprestNo: Code[50]): Integer
    // var
    //     OtherCosts: Record "Other Costs";
    //     lineNo: Integer;
    // begin
    //     lineNo:=0;
    //     OtherCosts.Reset;
    //     OtherCosts.SetRange("Imprest Memo No.", imprestNo);
    //     if OtherCosts.FindSet then begin
    //       repeat
    //       if OtherCosts."Line No.">lineNo then begin
    //         lineNo:=OtherCosts."Line No.";
    //         end;
    //        until OtherCosts.Next=0;
    //       end;
    //     exit(lineNo+1000);
    // end;

    // procedure sendImprestMemoApproval(employeeNo: Code[50];imprestNo: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    //     TotalImprestAmount: Decimal;
    // begin
    //     status:='danger*The imprest memo could not be sent for approval';

    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin

    //     ImprestMemo.TestField(Status,ImprestMemo.Status::Open);//status must be open.
    //     //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
    //     ImprestMemo.TestField(Objective);
    //     ImprestMemo.TestField(Subject);
    //     ImprestMemo.TestField(Date);
    //     ImprestMemo.TestField("Imprest Naration");
    //     ImprestMemo.CalcFields(ImprestMemo."Total Subsistence Allowance",ImprestMemo."Total Fuel Costs",ImprestMemo."Total Maintenance Costs",ImprestMemo."Total Casuals Cost",ImprestMemo."Total Other Costs");
    //     TotalImprestAmount:=ImprestMemo."Total Subsistence Allowance"+ImprestMemo."Total Fuel Costs"+ImprestMemo."Total Maintenance Costs"+ImprestMemo."Total Casuals Cost"+ImprestMemo."Total Other Costs";
    //     /*IF (TotalImprestAmount>"Job Task Remaining Amount") THEN
    //          ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,"Job Task Remaining Amount");*/
    //     if TotalImprestAmount > ImprestMemo."Job Task Remaining Amount" then begin
    //       //status:='danger*Applied imprest Memo Amount is greater than the Available Amount';

    //       /*ProjectTeam.RESET;
    //     ProjectTeam.SETRANGE(ProjectTeam."No.",ImprestMemo.Requestor);
    //     IF ProjectTeam.FINDFIRST= FALSE THEN
    //       ERROR(TEXT012);*/

    //      if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(ImprestMemo) then
    //       ApprovalsMgmt.OnSendImpMemoForApproval(ImprestMemo);

    //       ImprestMemo1.Reset;
    //       ImprestMemo1.SetRange(Requestor, employeeNo);
    //       ImprestMemo1.SetRange("No.",imprestNo);
    //       if ImprestMemo1.FindSet then begin
    //         if ImprestMemo1.Status= ImprestMemo1.Status::"Pending Approval" then begin
    //           status:='success*The imprest memo was successfully sent for approval.Applied imprest Memo of Amount is more than Available Amount';
    //            //ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,ImprestMemo."Job Task Remaining Amount");

    //           end
    //         end
    //     //END
    //      // END








    //       end
    //       else
    //       begin
    //     //IF "Vote Amount"<"Total Subsistence Allowance" THEN
    //       //ERROR('Budgeted Amount is less than the Amount requested');

    //     //check if the requester is part of the team
    //     ProjectTeam.Reset;
    //     ProjectTeam.SetRange(ProjectTeam."No.",ImprestMemo.Requestor);
    //     if ProjectTeam.FindFirst= false then
    //       Error(TEXT012);

    //      if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(ImprestMemo) then
    //       ApprovalsMgmt.OnSendImpMemoForApproval(ImprestMemo);

    //       ImprestMemo1.Reset;
    //       ImprestMemo1.SetRange(Requestor, employeeNo);
    //       ImprestMemo1.SetRange("No.",imprestNo);
    //       if ImprestMemo1.FindSet then begin
    //         if ImprestMemo1.Status= ImprestMemo1.Status::"Pending Approval" then begin
    //           status:='success*The imprest memo was successfully sent for approval';
    //           end;
    //         end;
    //     end
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);

    // end;

    // procedure createImprestSurrender(employeeNo: Code[50];imprestNo: Code[50];SurrenderNo: Code[50];region: Code[50]) status: Text
    // begin
    //     status:='danger*Your imprest surrender could not be captured';
    //     if SurrenderNo='' then begin //new imprest surrender
    //       Payments.Init;
    //       Payments."Document Type":= Payments."document type"::Surrender;
    //       Payments.Validate("Document Type");
    //       Payments."Payment Type":=Payments."payment type"::Surrender;
    //       Payments.Validate("Payment Type");
    //       Payments."Account Type":= Payments."account type"::Employee;
    //       Payments.Validate("Account Type");
    //       Payments."Account No.":=employeeNo;
    //       Payments.Validate("Account No.");
    //       Payments."Imprest Issue Doc. No":= imprestNo;
    //       Payments.Validate("Imprest Issue Doc. No");
    //       Payments."Responsibility Center":=region;
    //       if Payments.Insert(true) then begin
    //         Payments.Validate("Imprest Issue Doc. No");
    //         Payments."Responsibility Center":=region;
    //         Payments.Modify(true);
    //         status:='success*Your imprest surrender was successfully captured*'+Payments."No.";
    //         end else begin
    //           status:='danger*Your imprest surrender could not be captured';
    //           end;

    //       end else begin //existing
    //         Payments.Reset;
    //         Payments.SetRange("No.", SurrenderNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //           if not (Payments."Imprest Issue Doc. No"= imprestNo) then begin
    //             Payments."Imprest Issue Doc. No":=imprestNo;
    //             Payments.Validate("Imprest Issue Doc. No");
    //             if Payments.Modify(true) then begin
    //                status:='success*Your imprest surrender was successfully updated';
    //               end else begin
    //                  status:='danger*Your imprest surrender could not be updated';
    //                 end;
    //             end else begin
    //                status:='success*No changes to be done';
    //               end;
    //           end else begin
    //             status:='danger*An imprest surrender with the given number does not exist, you are not the owner or is no longer open';
    //             end;

    //         end;
    //     exit(status);
    // end;

    // procedure createImprestSurrender1(employeeNo: Code[50];imprestNo: Code[50];SurrenderNo: Code[50];region: Code[50]) status: Text
    // begin
    //     status:='danger*Your imprest surrender could not be captured';
    //     if SurrenderNo='' then begin //new imprest surrender
    //       Payments.Init;
    //       Payments."Document Type":= Payments."document type"::Surrender;
    //       Payments.Validate("Document Type");
    //       Payments."Payment Type":=Payments."payment type"::Surrender;
    //       Payments.Validate("Payment Type");
    //       Payments."Account Type":= Payments."account type"::Employee;
    //       Payments.Validate("Account Type");
    //       Payments."Account No.":=employeeNo;
    //       Payments.Validate("Account No.");
    //       Payments."Imprest Issue Doc. No":= imprestNo;
    //       Payments.Validate("Imprest Issue Doc. No");
    //       Payments."Responsibility Center":=region;
    //       if Payments.Insert(true) then begin
    //         Payments.Validate("Imprest Issue Doc. No");
    //         Payments."Responsibility Center":=region;
    //         Payments.Modify(true);
    //         status:='success*Your imprest surrender was successfully captured*'+Payments."No.";
    //         end else begin
    //           status:='danger*Your imprest surrender could not be captured';
    //           end;

    //       end else begin //existing
    //         Payments.Reset;
    //         Payments.SetRange("No.", SurrenderNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //           if not (Payments."Imprest Issue Doc. No"= imprestNo) then begin
    //             Payments."Imprest Issue Doc. No":=imprestNo;
    //             Payments.Validate("Imprest Issue Doc. No");
    //             Payments."Responsibility Center":=region;
    //             if Payments.Modify(true) then begin
    //                status:='success*Your imprest surrender was successfully updated';
    //               end else begin
    //                  status:='danger*Your imprest surrender could not be updated';
    //                 end;
    //             end else begin
    //                status:='success*No changes to be done';
    //               end;
    //           end else begin
    //             status:='danger*An imprest surrender with the given number does not exist, you are not the owner or is no longer open';
    //             end;

    //         end;
    //     exit(status);
    // end;

    // procedure PopulatePettyCashSurrender(employeeNo: Code[50];imprestNo: Code[50];SurrenderNo: Code[50]) status: Text
    // begin
    //     if SurrenderNo='' then begin //new petty surrender
    //       Payments.Init;
    //       Payments."Document Type":= Payments."document type"::"Petty Cash";
    //       Payments.Validate("Document Type");
    //       Payments."Payment Type":=Payments."payment type"::"Petty Cash Surrender";
    //       Payments.Validate("Payment Type");
    //       Payments."Account Type":= Payments."account type"::Employee;
    //       Payments.Validate("Account Type");
    //       Payments."Account No.":=employeeNo;
    //       //Added By Fred
    //       Employee.Reset;
    //       Employee.SetRange("No.",employeeNo);
    //       if Employee.FindSet then
    //       ImprestMemo."Responsibility Center":=Employee."Global Dimension 1 Code";
    //       //Added By Fred
    //       Payments.Validate("Account No.");
    //       Payments."Imprest Issue Doc. No":= imprestNo;
    //       Payments.Validate("Imprest Issue Doc. No");
    //       if Payments.Insert(true) then begin
    //         Payments.Validate("Imprest Issue Doc. No");
    //         Payments.Modify(true);
    //         status:='success*Your petty cash surrender was successfully captured*'+Payments."No.";
    //         end else begin
    //           status:='danger*Your petty cash  surrender could not be captured';
    //           end;

    //       end else begin //existing
    //         Payments.Reset;
    //         Payments.SetRange("No.", SurrenderNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //           if not (Payments."Imprest Issue Doc. No"= imprestNo) then begin
    //             Payments."Imprest Issue Doc. No":=imprestNo;
    //             Payments.Validate("Imprest Issue Doc. No");
    //             if Payments.Modify(true) then begin
    //                status:='success*Your petty cash surrender was successfully updated'+Payments."No.";
    //               end else begin
    //                  status:='danger*Your petty cash could not be updated';
    //                 end;
    //             end else begin
    //                status:='success*No changes to be done';
    //               end;
    //           end else begin
    //             status:='danger*An petty cash with the given number does not exist, you are not the owner or is no longer open';
    //             end;

    //         end;
    //     exit(status);
    // end;

    // procedure sendImprestSurrenderApproval(employeeNo: Code[50];imprestSurrenderNo: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    // begin
    //     status:='danger*The imprest surrender could not be sent for approval';

    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",imprestSurrenderNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
    //     Payments.SetRange("Document Type", Payments."document type"::Surrender);
    //     if Payments.FindSet then begin
    //       Payments.TestField("Shortcut Dimension 1 Code");
    //      // Payments.TESTFIELD("Shortcut Dimension 3 Code");
    //      //TESTFIELD("Shortcut Dimension 3 Code");
    //       Payments.TestField("Imprest Issue Doc. No");
    //     if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
    //       ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
    //         if Payments1.Get(Payments."Imprest Issue Doc. No") then begin
    //         Payments1.Selected:=true;
    //         Payments1.Modify;
    //         end;
    //         if Payments2.Get(imprestSurrenderNo) then begin
    //           if Payments2.Status=Payments2.Status::"Pending Approval" then begin
    //             status:='success*The imprest Surrender was successfully sent for approval';
    //             end;
    //           end;
    //       end else begin
    //         status:='danger*An imprest surrender with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure updateSurrenderLine(employeeNo: Code[50];imprestSurrenderNo: Code[50];lineNo: Integer;amountSpent: Decimal;receipt: Text) status: Text
    // var
    //     ImprestLines: Record "Imprest Lines";
    // begin
    //     status:='danger*The imprest line could not be updated';
    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",imprestSurrenderNo);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
    //     Payments.SetRange("Document Type", Payments."document type"::Surrender);
    //     if Payments.FindSet then begin
    //           ImprestLines.Reset;
    //           ImprestLines.SetRange(No, imprestSurrenderNo);
    //           ImprestLines.SetRange("Line No", lineNo);
    //           if ImprestLines.FindSet then begin

    //              ImprestLines.Validate("Actual Spent",amountSpent);
    //             ImprestLines.Validate("Receipt No.", receipt);
    //             if ImprestLines.Modify(true) then begin
    //               status:='success*The imprest line was successfully updated';//+FORMAT(lineNo);
    //               end else begin
    //                 status:='danger*The imprest line could not be updated';
    //                 end;
    //             end else begin
    //               status:='danger*The imprest line does not exist'+Format(lineNo);
    //               end;
    //       end else begin
    //         status:='danger*An imprest surrender with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure CreateWorksPurchaseRequisition(employeeNo: Code[50];requisitionNo: Code[50];location: Code[50];description: Text;priorityLevel: Option ,Low,Normal,High,Critical;requisitionProductGroup: Option Goods,Services,Works,Assets;constituency: Text[100];planId: Text[100];PlanEntryNo: Integer;TemplateId: Text[50];projectStaffingTemplateId: Text[100];worksTemplateId: Text[100]) status: Text
    // var
    //     myType: Text;
    // begin

    //      case priorityLevel of
    //        0:
    //          priorityLevel:=PurchaseHeader."priority level"::Low;
    //        1:
    //          priorityLevel:=PurchaseHeader."priority level"::Normal;
    //        2:
    //          priorityLevel:=PurchaseHeader."priority level"::High;
    //        3:
    //          priorityLevel:=PurchaseHeader."priority level"::Critical;
    //        else
    //          end;

    //     case requisitionProductGroup of
    //       0:
    //         requisitionProductGroup:= PurchaseHeader."requisition product group"::Goods;
    //       1:
    //         requisitionProductGroup:= PurchaseHeader."requisition product group"::Services;
    //       2:
    //         requisitionProductGroup:= PurchaseHeader."requisition product group"::Works;
    //       3:
    //         requisitionProductGroup:= PurchaseHeader."requisition product group"::Assets;
    //       else
    //         end;


    //       myType:='Purchase Requisition';
    //     if requisitionNo='' then begin //new  requisition
    //       PurchaseHeader.Init;

    //       PurchaseHeader."Document Type":= PurchaseHeader."document type"::"Purchase Requisition";
    //        PurchaseHeader.Validate("Document Type");
    //        PurchaseHeader."PRN Type":=PurchaseHeader."prn type"::"Project Works";

    //          PurchaseHeader."Requisition Type":= PurchaseHeader."requisition type"::Project;
    //        PurchaseHeader.Validate("Requisition Type");

    //       PurchaseHeader."Requester ID":=UserId;
    //      PurchaseHeader."Request-By No.":=employeeNo;
    //      PurchaseHeader.Validate("Request-By No.");
    //      PurchaseHeader."Location Code":=location;
    //      PurchaseHeader.Validate("Location Code");
    //      PurchaseHeader.Description:= description;
    //      PurchaseHeader.Validate(Description);
    //      PurchaseHeader.Validate("Order Date", Today);
    //      PurchaseHeader."Responsibility Center":=location;

    //      PurchaseHeader."Priority Level":= priorityLevel;
    //      PurchaseHeader."Requisition Product Group":=requisitionProductGroup;
    //      //PurchaseHeader."PRN Type":=PurchaseHeader."PRN Type"::Standard;
    //      PurchaseHeader."Procurement Plan ID":= planId;
    //      //PurchaseHeader."Shortcut Dimension 2 Code":=
    //      PurchaseHeader."Procurement Plan Entry No":=PlanEntryNo;
    //      //PurchaseHeader.VALIDATE("Procurement Plan Entry No");
    //      PurchaseHeader."Requisition Template ID":= TemplateId;


    //            PurchaseHeader."Project Staffing Template ID":=projectStaffingTemplateId;
    //            PurchaseHeader."Works Equipment Template ID":=worksTemplateId;


    //       if PurchaseHeader.Insert(true) then begin

    //      //PurchaseHeader.VALIDATE("Request-By No.");
    //       // PurchaseHeader.VALIDATE("Location Code",location);
    //      PurchaseHeader.Validate("Procurement Plan Entry No");
    //      SuggestPRNPersonnel_equipmentSpecification(PurchaseHeader);
    //       PurchaseHeader.Modify(true);
    //         status:='success*Your '+myType+' was successfully created*'+PurchaseHeader."No.";
    //         end else begin
    //           status:='danger*Your '+myType+' could not be captured';
    //           end;

    //       end else begin //existing
    //         PurchaseHeader.Reset;

    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
    //         PurchaseHeader.SetRange("No.", requisitionNo);
    //         if PurchaseHeader.FindSet then begin
    //         PurchaseHeader."Responsibility Center":=location;
    //           PurchaseHeader.Validate("Request-By No.");
    //              PurchaseHeader.Validate(Description,description);
    //               PurchaseHeader.Validate("Location Code",location);

    //            PurchaseHeader."Priority Level":= priorityLevel;
    //            PurchaseHeader."Requisition Product Group":=requisitionProductGroup;
    //            PurchaseHeader."PRN Type":=PurchaseHeader."prn type"::"Project Works";
    //            PurchaseHeader."Procurement Plan ID":= planId;
    //            PurchaseHeader."Procurement Plan Entry No":=PlanEntryNo;

    //            PurchaseHeader."Requisition Template ID":= TemplateId;
    //            PurchaseHeader."Project Staffing Template ID":=projectStaffingTemplateId;
    //            PurchaseHeader."Works Equipment Template ID":=worksTemplateId;

    //             if PurchaseHeader.Modify(true) then begin
    //               PurchaseHeader.Validate("Procurement Plan Entry No");
    //              SuggestPRNPersonnel_equipmentSpecification(PurchaseHeader);
    //                status:='success*Your '+myType+' was successfully updated';
    //               end else begin
    //                  status:='danger*Your '+myType+' could not be updated';
    //                 end;

    //           end else begin
    //             status:='danger*A '+myType+' with the given number does not exist, you are not the owner or is no longer open'+requisitionNo;
    //             end;

    //         end;
    //     exit(status);
    // end;

    // procedure createPurchaseRequisition(employeeNo: Code[50];requisitionNo: Code[50];location: Code[50];description: Text;priorityLevel: Option ,Low,Normal,High,Critical;requisitionProductGroup: Option Goods,Services,Works,Assets;constituency: Text[100];planId: Text[100];PlanEntryNo: Integer;TemplateId: Text[50];tfundingsource: Code[100];tconstituency: Code[100]) status: Text
    // var
    //     myType: Text;
    // begin

    //      case priorityLevel of
    //        0:
    //          priorityLevel:=PurchaseHeader."priority level"::Low;
    //        1:
    //          priorityLevel:=PurchaseHeader."priority level"::Normal;
    //        2:
    //          priorityLevel:=PurchaseHeader."priority level"::High;
    //        3:
    //          priorityLevel:=PurchaseHeader."priority level"::Critical;
    //        else
    //          end;

    //     case requisitionProductGroup of
    //       0:
    //         requisitionProductGroup:= PurchaseHeader."requisition product group"::Goods;
    //       1:
    //         requisitionProductGroup:= PurchaseHeader."requisition product group"::Services;
    //       2:
    //         requisitionProductGroup:= PurchaseHeader."requisition product group"::Works;
    //       3:
    //         requisitionProductGroup:= PurchaseHeader."requisition product group"::Assets;
    //       else
    //         end;


    //       myType:='Purchase Requisition';
    //     if requisitionNo='' then begin //new  requisition
    //       PurchaseHeader.Init;
    //      PurchaseHeader."Document Type":= PurchaseHeader."document type"::"Purchase Requisition";
    //      PurchaseHeader.Validate("Document Type");
    //      PurchaseHeader."Requisition Type":= PurchaseHeader."requisition type"::Project;
    //      PurchaseHeader.Validate("Requisition Type");
    //      PurchaseHeader."Requester ID":=UserId;
    //      PurchaseHeader."Request-By No.":=employeeNo;
    //      PurchaseHeader.Validate("Request-By No.");
    //      PurchaseHeader."Location Code":=location;
    //      //PurchaseHeader.VALIDATE("Location Code");
    //      PurchaseHeader.Description:= description;
    //      PurchaseHeader.Validate(Description);
    //      PurchaseHeader."Order Date":= Today;
    //      PurchaseHeader."Responsibility Center":=location;
    //      PurchaseHeader."Priority Level":= priorityLevel;
    //      PurchaseHeader."Requisition Product Group":=requisitionProductGroup;
    //      PurchaseHeader."PRN Type":=PurchaseHeader."prn type"::Standard;
    //      PurchaseHeader."Procurement Plan ID":= planId;
    //      PurchaseHeader."Procurement Plan Entry No":=PlanEntryNo;
    //      PurchaseHeader."Requisition Template ID":= TemplateId;
    //      PurchaseHeader."Shortcut Dimension 2 Code":=tfundingsource;
    //      PurchaseHeader."Shortcut Dimension 3 Code":=tconstituency;
    //       if PurchaseHeader.Insert(true) then begin
    //        PurchaseHeader.Validate("Request-By No.");
    //        PurchaseHeader.Validate("Location Code",location);
    //       PurchaseHeader.Validate("Procurement Plan Entry No");
    //       PurchaseHeader.Modify(true);
    //         status:='success*Your '+myType+' was successfully created*'+PurchaseHeader."No.";
    //         end else begin
    //           status:='danger*Your '+myType+' could not be captured';
    //           end;

    //       end else begin //existing
    //           PurchaseHeader.Reset;
    //           PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //           PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
    //           PurchaseHeader.SetRange("No.", requisitionNo);
    //           if PurchaseHeader.FindSet then begin
    //            PurchaseHeader."Responsibility Center":=location;
    //            PurchaseHeader.Validate("Request-By No.");
    //            PurchaseHeader.Validate(Description,description);
    //            PurchaseHeader.Validate("Location Code",location);
    //            PurchaseHeader."Priority Level":= priorityLevel;
    //            PurchaseHeader."Requisition Product Group":=requisitionProductGroup;
    //            PurchaseHeader."PRN Type":=PurchaseHeader."prn type"::Standard;
    //            PurchaseHeader."Procurement Plan ID":= planId;
    //            PurchaseHeader."Procurement Plan Entry No":=PlanEntryNo;
    //            PurchaseHeader."Requisition Template ID":= TemplateId;
    //             if PurchaseHeader.Modify(true) then begin
    //               PurchaseHeader.Validate("Procurement Plan Entry No");
    //                status:='success*Your '+myType+' was successfully updated';
    //               end else begin
    //                  status:='danger*Your '+myType+' could not be updated';
    //                 end;

    //           end else begin
    //             status:='danger*A '+myType+' with the given number does not exist, you are not the owner or is no longer open'+requisitionNo;
    //             end;

    //         end;
    //     exit(status);
    // end;

    // procedure createPurchaseStoreRequisition(employeeNo: Code[50];requisitionNo: Code[50];location: Code[50];description: Text;type: Integer;fundCode: Code[100];jobNo: Text;jobTask: Text) status: Text
    // var
    //     myType: Text;
    // begin
    //      myType:='Store Requisition';
    //     if type=0 then
    //       myType:='Purchase Requisition';
    //     status:='danger*Your '+myType+' could not be captured';
    //     if requisitionNo='' then begin //new  requisition
    //       PurchaseHeader.Init;
    //       PurchaseHeader."Document Type":= PurchaseHeader."document type"::"Store Requisition";
    //       if type= 0 then
    //       PurchaseHeader."Document Type":= PurchaseHeader."document type"::"Purchase Requisition";
    //        PurchaseHeader.Validate("Document Type");
    //         if type= 0 then begin
    //          PurchaseHeader."Requisition Type":= PurchaseHeader."requisition type"::Project;
    //        PurchaseHeader.Validate("Requisition Type");
    //       end else
    //       PurchaseHeader."Requisition Type":= PurchaseHeader."requisition type"::"Internal Use";
    //       PurchaseHeader."Requester ID":=UserId;
    //      PurchaseHeader."Request-By No.":=employeeNo;
    //      PurchaseHeader.Validate("Request-By No.");
    //      PurchaseHeader."Location Code":=location;
    //      PurchaseHeader.Validate("Location Code");
    //      PurchaseHeader.Description:= description;
    //      PurchaseHeader.Validate(Description);
    //      PurchaseHeader.Validate("Order Date", Today);
    //      PurchaseHeader."Responsibility Center":=location;
    //      PurchaseHeader."Shortcut Dimension 3 Code":=fundCode;
    //       if PurchaseHeader.Insert(true) then begin
    //      PurchaseHeader.Validate("Request-By No.");
    //      //PurchaseHeader.VALIDATE("Location Code",location);
    //      // PurchaseHeader.VALIDATE("Shortcut Dimension 2 Code", fundCode);
    //        PurchaseHeader.Validate(Job, jobNo);
    //        // PurchaseHeader.VALIDATE("Job Task No.", jobTask);
    //       PurchaseHeader.Modify(true);
    //         status:='success*Your '+myType+' was successfully created*'+PurchaseHeader."No.";
    //         end else begin
    //           status:='danger*Your '+myType+' could not be captured';
    //           end;

    //       end else begin //existing
    //         PurchaseHeader.Reset;
    //         if type=0 then begin
    //         PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
    //         end else begin
    //          PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
    //         end;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
    //         PurchaseHeader.SetRange("No.", requisitionNo);
    //         if PurchaseHeader.FindSet then begin
    //         PurchaseHeader."Responsibility Center":=location;
    //           PurchaseHeader.Validate("Request-By No.");
    //              PurchaseHeader.Validate(Description,description);
    //               PurchaseHeader.Validate("Location Code",location);
    //               PurchaseHeader.Validate(Job, jobNo);
    //        // PurchaseHeader.VALIDATE("Job Task No.", jobTask);
    //          PurchaseHeader.Validate("Shortcut Dimension 3 Code", fundCode);
    //             if PurchaseHeader.Modify(true) then begin
    //                status:='success*Your '+myType+' was successfully updated';
    //               end else begin
    //                  status:='danger*Your '+myType+' could not be updated';
    //                 end;

    //           end else begin
    //             status:='danger*A '+myType+' with the given number does not exist, you are not the owner or is no longer open'+requisitionNo;
    //             end;

    //         end;
    //     exit(status);
    // end;

    // procedure createRequisitionLine(employeeNo: Code[250];requisitionNo: Code[250];budget: Code[250];procurementPlan: Code[250];itemCategory: Code[250];item: Code[250];quantity: Decimal;directUnitCost: Decimal;uom: Text[100]) status: Text
    // var
    //     PurchaseLine: Record "Purchase Line";
    // begin
    //     status:='danger*Your Requisition Line could not be added';
    //         PurchaseHeader.Reset;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
    //         PurchaseHeader.SetRange("No.", requisitionNo);
    //         if PurchaseHeader.FindSet then begin
    //           if (PurchaseHeader."Document Type"=PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type"=PurchaseHeader."document type"::"Purchase Requisition") then begin
    //             //add line
    //             PurchaseLine.Init;
    //             //Document Type,Document No.,Line No.
    //             if PurchaseHeader."Document Type"= PurchaseHeader."document type"::"Store Requisition" then begin
    //             PurchaseLine."Document Type":= PurchaseLine."document type"::"Store Requisition";
    //             end;
    //              if PurchaseHeader."Document Type"= PurchaseHeader."document type"::"Purchase Requisition" then begin
    //             PurchaseLine."Document Type":= PurchaseLine."document type"::"Purchase Requisition";
    //             end;
    //             PurchaseLine."Document No.":=requisitionNo;
    //             PurchaseLine.Validate("Document No.");
    //             PurchaseLine."Line No.":= getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
    //             PurchaseLine.Validate("Line No.");
    //             PurchaseLine."Procurement Plan":= budget;
    //             PurchaseLine.Validate("Procurement Plan");
    //             PurchaseLine."Procurement Plan Item":=procurementPlan;
    //             PurchaseLine.Validate("Procurement Plan Item");
    //             PurchaseLine."Item Category":=itemCategory;
    //             PurchaseLine.Validate("Item Category");
    //             PurchaseLine."Service/Item Code":=item;
    //             PurchaseLine.Validate("Service/Item Code");
    //             PurchaseLine."Qty. Requested":= quantity;
    //             PurchaseLine.Validate("Qty. Requested");
    //             PurchaseLine.Validate("Direct Unit Cost",directUnitCost);
    //             PurchaseLine."Unit of Measure":= uom;

    //             if PurchaseLine.Insert(true) then begin
    //                PurchaseLine.Validate("Qty. Requested", quantity);
    //              PurchaseLine.Validate("Direct Unit Cost",directUnitCost);
    //              PurchaseLine.Validate("Unit Cost",directUnitCost);

    //             PurchaseLine.Modify(true);
    //               status:='success*The Requisition Line was successfully added';//+FORMAT(directUnitCost);
    //               end else begin
    //                 status:='danger*Your Requisition Line could not be added';
    //                 end;
    //             end;
    //           end else begin
    //             status:='danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
    //             end;
    //     exit(status);
    // end;

    // local procedure getPurchaseLineNo(requisitionNo: Code[50];requisitionType: Option): Integer
    // var
    //     purchaseLine: Record "Purchase Line";
    //     lineNo: Integer;
    // begin
    //     lineNo:=0;
    //     purchaseLine.Reset;
    //     purchaseLine.SetRange("Document No.", requisitionNo);
    //     purchaseLine.SetRange("Document Type", requisitionType);
    //     if purchaseLine.FindSet then begin
    //       repeat
    //       if purchaseLine."Line No.">lineNo then begin
    //         lineNo:=purchaseLine."Line No.";
    //         end;
    //        until purchaseLine.Next=0;
    //       end;
    //     exit(lineNo+1000);
    // end;

    // procedure sendPurchaseRequisitionApproval(employeeNo: Code[50];requisitionNo: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     PurchaseHeader1: Record "Purchase Header";
    // begin
    //     status:='danger*The Purchase Requisition could not be sent for approval';
    //      PurchaseHeader.Reset;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
    //         PurchaseHeader.SetRange("No.", requisitionNo);
    //         PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
    //         if PurchaseHeader.FindSet then begin
    //           PurchaseHeader.TestField("Shortcut Dimension 1 Code");
    //           //PurchaseHeader.TESTFIELD("Shortcut Dimension 2 Code");
    //           PurchaseHeader.TestField(Description);
    //          //TESTFIELD("Requester ID",USERID);
    //           PurchaseHeader.CalcFields("Requisition Amount");
    //           PurchaseHeader.TestField("Requisition Amount");

    //          if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then
    //        ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);

    //          PurchaseHeader1.Reset;
    //         PurchaseHeader1.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader1.SetRange("No.", requisitionNo);
    //         PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
    //         if PurchaseHeader1.FindSet then begin
    //           if PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval" then begin
    //             status:='success*The Purchase Requisition was successfully sent for approval';
    //             end;
    //           end;
    //        end else begin
    //         status:='danger*A Purchase Requisition with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure createFleetRequisition(employeeNo: Code[50];requisitionNo: Code[50];from: Text;destination: Text;dateOfTrip: Date;timeOut: DateTime;journeyRoute: Text;noOfDaysRequested: Decimal;purposeOfTrip: Text;comments: Text;imprest: Text[30];hourstrip: Decimal;requisitiontype: Integer) status: Text
    // var
    //     TransportRequisition: Record "Transport Requisition";
    // begin
    //      TransportRequisition.Reset;
    //       TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
    //       TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
    //       TransportRequisition.SetRange("Employee No", employeeNo);
    //       if TransportRequisition.FindSet then begin
    //             TransportRequisition.Commencement:= from;
    //             TransportRequisition.Validate(Commencement);
    //             TransportRequisition.Destination:=destination;
    //             TransportRequisition."Date of Trip":= dateOfTrip;
    //            TransportRequisition."Time out":= Dt2Time(timeOut);
    //             TransportRequisition."Journey Route":= journeyRoute;
    //             TransportRequisition."No of Days Requested":=noOfDaysRequested;
    //             TransportRequisition."Purpose of Trip":=purposeOfTrip;
    //             TransportRequisition.Subject:=purposeOfTrip;
    //             TransportRequisition.Comments:= comments;
    //             TransportRequisition."Number of Hours Requested":=hourstrip;
    //             TransportRequisition.Validate("Number of Hours Requested");
    //             TransportRequisition."Requested By":=employeeNo;
    //             TransportRequisition.Validate("Employee No");
    //             TransportRequisition."Approved Imprest Memo":=imprest;
    //             if TransportRequisition.Modify(true) then begin
    //               status:='success*Your Fleet Requisition was successfully updated';
    //               if requisitiontype=1 then
    //               TransportRequisition.Validate("Approved Imprest Memo");
    //               end else begin
    //                 status:='danger*Your Fleet Requisition could not be updated';
    //                 end;
    //      end else begin
    //     if requisitionNo='' then begin //a new record
    //       TransportRequisition.Init;
    //       TransportRequisition.Commencement:= from;
    //       TransportRequisition.Validate(Commencement);
    //       TransportRequisition.Destination:=destination;
    //       TransportRequisition."Date of Trip":= dateOfTrip;
    //       TransportRequisition.Validate("Date of Trip");
    //       TransportRequisition."Time out":= Dt2Time(timeOut);
    //      // TransportRequisition.VALIDATE("Time out");
    //       TransportRequisition."Journey Route":= journeyRoute;
    //       TransportRequisition."No of Days Requested":=noOfDaysRequested;
    //       TransportRequisition."Purpose of Trip":=purposeOfTrip;
    //       TransportRequisition.Subject:=purposeOfTrip;
    //       TransportRequisition.Comments:= comments;
    //       TransportRequisition."Employee No":= employeeNo;
    //       TransportRequisition.Validate("Employee No");
    //       TransportRequisition."Date of Request":= Today;
    //       TransportRequisition."Requested By":=employeeNo;
    //       TransportRequisition."Approved Imprest Memo":=imprest;
    //       TransportRequisition."Number of Hours Requested":=hourstrip;
    //       //TransportRequisition.VALIDATE("Number of Hours Requested");
    //       if TransportRequisition.Insert(true) then begin
    //         status:='success*Your Fleet Requisition was successfully created*'+TransportRequisition."Transport Requisition No";
    //         if requisitiontype=1 then
    //               TransportRequisition.Validate("Approved Imprest Memo");
    //         end else begin
    //        status:='danger*A Fleet Requisition was not successfully submitted';
    //           end;
    //       end;
    //      end;
    //     exit(status);
    // end;

    // procedure addFleetRequisitionStaff(employeeNo: Code[50];requisitionNo: Code[50];staffNo: Code[50]) status: Text
    // var
    //     TransportRequisition: Record "Transport Requisition";
    //     TravelRequisitionStaff: Record "Travel Requisition Staff";
    // begin
    //      TransportRequisition.Reset;
    //       TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
    //       TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
    //       if TransportRequisition.FindSet then begin
    //         if TransportRequisition."Approved Imprest Memo"='' then begin
    //         TravelRequisitionStaff.Init;
    //         TravelRequisitionStaff."Req No":= requisitionNo;
    //         TravelRequisitionStaff.Validate("Req No");
    //         TravelRequisitionStaff."Employee No":=staffNo;
    //         TravelRequisitionStaff.Validate("Employee No");
    //         if TravelRequisitionStaff.Insert(true) then begin
    //            status:='success*The Staff member was successfully added to your Fleet Requisition';
    //           end else begin
    //              status:='danger*The Staff member could not be added to your Fleet Requisition';
    //             end;
    //          end else begin
    //           status:='danger*The Staff member scould not be added to your Fleet Requisition. Only the Members on the Imprest Memo are Allowed';
    //            end;
    //           end else begin
    //            status:='danger*A Fleet Requisition with the given number does not exist or is no longer open';
    //           end;
    //           exit(status);
    // end;

    // procedure addFleetRequisitionNonStaff(employeeNo: Code[50];requisitionNo: Code[50];IdNumber: Code[10];PhoneNumber: Code[100];OrganizationName: Code[100];Name: Code[100];purposeoftrip: Text;designations: Text) status: Text
    // var
    //     TransportRequisition: Record "Transport Requisition";
    //     TravelRequisitionStaff: Record "Travel Requisition Staff";
    //     TravelRequisitionNonStaff: Record "Travel Requisition Non Staff";
    // begin
    //        TransportRequisition.Reset;
    //       TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
    //       TransportRequisition.SetRange(Status,TransportRequisition.Status::Open);
    //       if TransportRequisition.FindSet then begin
    //         TravelRequisitionNonStaff.Init;
    //         TravelRequisitionNonStaff."Req No":=requisitionNo;
    //         TravelRequisitionNonStaff."ID No":= IdNumber;
    //         TravelRequisitionNonStaff.Purpose:=OrganizationName;
    //         TravelRequisitionNonStaff.Name:=Name;
    //         TravelRequisitionNonStaff."Phone Number":=PhoneNumber;
    //         TravelRequisitionNonStaff.Designation:=designations;
    //         TravelRequisitionNonStaff.Purpose:=purposeoftrip;
    //         if TravelRequisitionNonStaff.Insert(true) then begin
    //            status:='success*The Staff member was successfully added to your Fleet Requisition';
    //           end else begin
    //              status:='danger*The Staff member could not be added to your Fleet Requisition';
    //             end;

    //         end else begin
    //            status:='danger*A Fleet Requisition with the given number does not exist or is no longer open';
    //           end;
    //           exit(status);
    // end;

    // procedure sendFleetRequisitionApproval(employeeNo: Code[50];requisitionNo: Code[50]) status: Text
    // var
    //     TransportRequisition: Record "Transport Requisition";
    // begin
    //     status:='danger*The fleet requisition could not be sent for approval';
    //     TransportRequisition.Reset;
    //     TransportRequisition.SetRange("Employee No", employeeNo);
    //     TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
    //     if TransportRequisition.FindSet then begin
    //       TransportRequisition.TestField(Status,TransportRequisition.Status::Open);
    //       //TransportRequisition.TESTFIELD( Commencement);
    //       TransportRequisition.TestField(Destination );
    //       TransportRequisition.TestField("Date of Trip");
    //       TransportRequisition.TestField("Purpose of Trip");


    //     if ApprovalsMgmt.CheckFleetApprovalsWorkflowEnabled(TransportRequisition) then
    //        ApprovalsMgmt.OnSendFleetForApproval(TransportRequisition);

    //       end else begin
    //       status:='danger*A fleet requisition with the given number does not exist, is no longer open or you are not the owner';
    //     end;
    //     exit(status);
    // end;

    // procedure removeStaffFromTravelRequisition(employeeNo: Code[50];requisitionNo: Code[50];entryNo: Integer) status: Text
    // var
    //     TransportRequisition: Record "Transport Requisition";
    //     TravelRequisitionStaff: Record "Travel Requisition Staff";
    // begin
    //      //status:='danger*The Staff member could not be removed from your Fleet Requisition';
    //      TransportRequisition.Reset;
    //       TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
    //       TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
    //       if TransportRequisition.FindSet then begin
    //         TravelRequisitionStaff.Reset;
    //         TravelRequisitionStaff.SetRange(EntryNo, entryNo);
    //         TravelRequisitionStaff.SetRange("Req No", requisitionNo);
    //         if TravelRequisitionStaff.FindSet then begin
    //           if TravelRequisitionStaff.Delete(true) then begin
    //              status:='success*The Staff member was successfully removed from your Fleet Requisition';
    //             end;

    //         end;


    //         end else begin
    //           // status:='danger*A Fleet Requisition with the given number does not exist or is no longer open';
    //           end;
    //           exit(status);
    // end;

    // procedure removeMemberFromImprestMemo(number: Code[50];workType: Code[50];mEmployeeNo: Code[50];imprestNo: Code[50]) status: Text
    // var
    //     ProjectMembers: Record "Project Members";
    // begin
    //     status:='danger*The team member could not be removed';
    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, mEmployeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       ProjectMembers.Reset;
    //       //Imprest Memo No.,No.,Work Type
    //       ProjectMembers.SetRange("No.", number);
    //       ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
    //       ProjectMembers.SetRange("Work Type", workType);
    //       if ProjectMembers.FindSet then begin
    //         if ProjectMembers.Delete(true) then begin
    //         status:='success*The team member was successfully removed from the imprest memo';
    //           end else begin
    //             status:='danger*The team member could not be removed';
    //             end;
    //         end else begin
    //           status:='danger*The given team member has not been added to the selected imprest';
    //           end;
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure editTeamMember(employeeNo: Code[50];imprestNo: Code[50];destinationTown: Text;voteItem: Text;teamMember: Text;noOfDays: Decimal;originalNumber: Code[50];originalWorkType: Code[50];constituency: Text[100];projectLead: Boolean) status: Text
    // var
    //     ProjectMembers: Record "Project Members";
    // begin
    //     status:='danger*The team member could not be edited';
    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       //Imprest Memo No.,No.,Work Type
    //       ProjectMembers.Reset;
    //       ProjectMembers.SetRange("No.", originalNumber);
    //       ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
    //       ProjectMembers.SetRange("Work Type", originalWorkType);
    //       if ProjectMembers.FindSet then begin
    //           ProjectMembers.Type:= ProjectMembers.Type::Person;
    //           ProjectMembers."Imprest Memo No.":=imprestNo;
    //           ProjectMembers."Work Type":= destinationTown;
    //           ProjectMembers.Validate("Work Type");
    //           ProjectMembers."Type of Expense":= voteItem;
    //           ProjectMembers.Validate("Type of Expense");
    //           ProjectMembers."No.":= teamMember;
    //           ProjectMembers.Validate("No.");
    //           ProjectMembers."Time Period":= noOfDays;
    //           ProjectMembers.Validate("Time Period");
    //           ProjectMembers."Constituency Code":= constituency;
    //           ProjectMembers."Project Lead":= projectLead;
    //           if ProjectMembers.Modify(true) then begin
    //             status:='success*The team member was successfully edited';
    //             end else begin
    //               status:='danger*The team member could not be edited';
    //               end;

    //         end else begin
    //           status:='danger*The given team member has not been added to the selected imprest'+originalWorkType;
    //           end;
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure removeFuelFromImprestMemo(number: Code[50];workType: Code[50];mEmployeeNo: Code[50];imprestNo: Code[50]) status: Text
    // var
    //     ProjectMembers: Record "Project Members";
    // begin
    //     status:='danger*The fuel could not be removed';
    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, mEmployeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin

    //       ProjectMembers.Reset;
    //       ProjectMembers.SetRange("No.", number);
    //       ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
    //       ProjectMembers.SetRange("Work Type", workType);
    //       if ProjectMembers.FindSet then begin
    //         if ProjectMembers.Delete(true) then begin
    //         status:='success*The fuel was successfully removed from the imprest memo';
    //           end else begin
    //             status:='danger*The fuel could not be removed';
    //             end;
    //         end else begin
    //           status:='danger*The given fuel has not been added to the selected imprest';
    //           end;
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure editFuel(employeeNo: Code[50];imprestNo: Code[50];workType: Text;resource: Text;mileage: Decimal;originalNo: Code[50];originalWorkType: Code[50]) status: Text
    // var
    //     ProjectMembers: Record "Project Members";
    // begin
    //     status:='danger*The fuel could not be added';
    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       ProjectMembers.Reset;
    //       ProjectMembers.SetRange("No.", originalNo);
    //       ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
    //       ProjectMembers.SetRange("Work Type", originalWorkType);
    //       if ProjectMembers.FindSet then begin
    //           ProjectMembers.Type:= ProjectMembers.Type::Machine;
    //           ProjectMembers."Imprest Memo No.":=imprestNo;
    //           ProjectMembers."Work Type":= workType;
    //           ProjectMembers.Validate("Work Type");
    //           ProjectMembers.Validate("Type of Expense");
    //           ProjectMembers."No.":= resource;
    //           ProjectMembers.Validate("No.");
    //           ProjectMembers."Time Period":= mileage;
    //           if ProjectMembers.Modify(true) then begin
    //             status:='success*The fuel was successfully updated';
    //             end else begin
    //               status:='danger*The fuel could not be added';
    //               end;

    //         end else begin
    //          status:='danger*The given fuel has not been added to the selected imprest';
    //           end;
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure removeCasuals(employeeNo: Code[50];imprestNo: Code[50];resourceType: Text;resourceNo: Code[50]) status: Text
    // var
    //     Casuals: Record Casuals;
    // begin
    //     //Casuals
    //     status:='danger*The casual could not be removed';

    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       Casuals.Reset;
    //       Casuals.SetRange("Imprest Memo No.", imprestNo);
    //       if Lowercase(resourceType)='skilled' then begin
    //          Casuals.SetRange(Type, Casuals.Type::Skilled);
    //         end else begin
    //            Casuals.SetRange(Type, Casuals.Type::Unskilled);
    //           end;

    //       Casuals.SetRange("Resource No.", resourceNo);
    //       if Casuals.FindSet then begin

    //           if Casuals.Delete(true) then begin
    //             status:='success*The casual was successfully removed from the imprest';
    //             end else begin
    //               status:='danger*The casual could not be removed from the imprest';
    //               end;

    //         end else begin
    //           //imprestNo : Code[50];type : Integer;resource : Text;workType : Text;noRequired : Decimal;noOfDays : Decimal
    //              status:='danger*The casual has not been added to the selected imprest'+resourceNo;
    //           end;
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure editCasuals(employeeNo: Code[50];imprestNo: Code[50];type: Integer;resource: Text;workType: Text;noRequired: Decimal;noOfDays: Decimal;originalResourceType: Code[50];originalResourceNo: Code[50];employeeToSurrender: Text[50]) status: Text
    // var
    //     Casuals: Record Casuals;
    // begin
    //     //Casuals
    //     status:='danger*The casual could not be edited';

    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       Casuals.Reset;
    //       Casuals.SetRange("Imprest Memo No.", imprestNo);
    //       if Lowercase(originalResourceType)='skilled' then begin
    //       Casuals.SetRange(Type, Casuals.Type::Skilled);
    //         end else begin
    //       Casuals.SetRange(Type, Casuals.Type::Unskilled);
    //           end;
    //       Casuals.SetRange("Resource No.", originalResourceNo);
    //       if Casuals.FindSet then begin
    //         Casuals.Type:= type;
    //           Casuals."Imprest Memo No.":=imprestNo;
    //           Casuals."Resource No.":= resource;
    //           Casuals.Validate("Resource No.");
    //           Casuals.Validate("Imprest Memo No.");
    //           Casuals.Validate(Type);

    //           Casuals."Work Type":= workType;
    //           Casuals.Validate("Work Type");
    //           Casuals."No. Required":= noRequired;
    //           Casuals.Validate("No. Required");
    //           Casuals."No. of Days":=noOfDays;
    //           Casuals.Validate("No. of Days");
    //           Casuals."Employee No To Surrender":=employeeToSurrender;
    //           Casuals.Validate("Employee No To Surrender");
    //           if Casuals.Modify(true) then begin
    //             status:='success*The casual was successfully updated';
    //             end else begin
    //               status:='danger*The casual could not be updated';
    //               end;
    //         end else begin
    //               status:='danger*The casual has not been added to the selected imprest';

    //           end;
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure removeOtherCosts(imprestNo: Code[50];employeeNo: Code[50];lineNo: Integer) status: Text
    // var
    //     OtherCosts: Record "Other Costs";
    // begin
    //     status:='danger*The cost could not be removed';

    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //           OtherCosts.Reset;
    //           OtherCosts.SetRange("Line No.", lineNo);
    //           OtherCosts.SetRange("Imprest Memo No.", imprestNo);
    //           if OtherCosts.FindSet then begin
    //             if OtherCosts.Delete(true) then begin
    //               status:='success*The cost was successfully removed';
    //               end else begin
    //                 status:='danger*The cost could not be removed';
    //                 end;
    //             end else begin
    //               status:='danger*The cost does not exists in the selected imprest memo';
    //               end;

    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;

    //     exit(status);
    // end;

    // procedure editOtherCosts(employeeNo: Code[50];imprestNo: Code[50];voteItem: Text;requiredFor: Text;quantityRequired: Decimal;noOfDays: Decimal;unitCost: Decimal;originalLineNo: Integer;employeeToSurrender: Text[50]) status: Text
    // var
    //     OtherCosts: Record "Other Costs";
    // begin
    //     //Casuals
    //     status:='danger*The cost could not be updated';

    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",imprestNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
    //     if ImprestMemo.FindSet then begin
    //       OtherCosts.Reset;
    //       OtherCosts.SetRange("Imprest Memo No.", imprestNo);
    //       OtherCosts.SetRange("Line No.", originalLineNo);
    //       if OtherCosts.FindSet then begin
    //           OtherCosts."Imprest Memo No.":= imprestNo;
    //           OtherCosts.Validate("Imprest Memo No.");
    //           OtherCosts."Type of Expense":= voteItem;
    //           OtherCosts.Validate("Type of Expense");
    //           OtherCosts."Required For":=requiredFor;
    //           OtherCosts.Validate("Required For");
    //           OtherCosts."Quantity Required":=quantityRequired;
    //           OtherCosts.Validate("Quantity Required");
    //           OtherCosts."No. of Days":=noOfDays;
    //           OtherCosts.Validate("No. of Days");
    //           OtherCosts."Unit Cost":=unitCost;
    //           OtherCosts.Validate("Unit Cost");
    //           OtherCosts."Employee No To Surrender":=employeeToSurrender;
    //           OtherCosts.Validate("Employee No To Surrender");
    //           if OtherCosts.Modify(true) then begin
    //             status:='success*The cost was successfully updated';
    //             end else begin
    //               status:='danger*The cost could not be updated';
    //               end;
    //          end else begin
    //             status:='danger*The cost has not been added to the selected imprest memo';
    //            end;
    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure generateLeaveForm(employeeNo: Code[50];leaveNo: Code[50]) status: Text
    // var
    //     leaveFileName: Text;
    // begin
    //     status:='danger*The leave form could not be generated';
    //     leaveApplications.Reset;
    //     leaveApplications.SetRange("Application Code", leaveNo);
    //     leaveApplications.SetRange("Employee No", employeeNo);
    //     if leaveApplications.FindSet then begin
    //       leaveFileName:=FILESPATH+'leave'+leaveNo+'.pdf';
    //       if FILE.Exists(leaveFileName) then begin
    //         FILE.Erase(leaveFileName);
    //         end;
    //       Report.SaveAsPdf(69005,leaveFileName,leaveApplications);
    //       if FILE.Exists(leaveFileName) then begin
    //         status:='success*'+'Downloads\leave'+leaveNo+'.pdf';
    //         end;
    //       end else begin
    //         status:='danger*The leave does not exist or you are not the requester';
    //         end;
    //     exit(status);
    // end;

    // procedure sendRecordForApproval(employeeNo: Code[50];recordNo: Code[50];recordType: Text) status: Text
    // var
    //     HRLeaveApplication1: Record "HR Leave Applications";
    // begin
    //     status:='danger*The record could not be sent for approval';
    //     recordType:=Lowercase(recordType);
    //     if recordType ='leave' then begin
    //     status:='danger*The leave could not be sent for approval';
    //     leaveApplications.Reset;
    //     leaveApplications.SetRange("Application Code", recordNo);
    //     leaveApplications.SetRange("Employee No", employeeNo);
    //     if leaveApplications.FindSet then begin
    //        if ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(leaveApplications) then
    //        ApprovalsMgmt.OnSendLeaveAppForApproval(leaveApplications);
    //           if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
    //               if HRLeaveApplication1.Status = HRLeaveApplication1.Status::Open then begin
    //                 status:= 'warning*Your leave application  could not be sent for approval';
    //                 end else begin
    //                   status:= 'success*Your leave application was successfully  sent for approval';
    //                   end;
    //             end;
    //       end else begin
    //         status:='danger*The leave does not exist or you are not the requester';
    //         end;
    //         end;
    //     exit(status);
    // end;

    // procedure cancelRecordApproval(employeeNo: Code[50];recordNo: Code[50];recordType: Text) status: Text
    // var
    //     HRLeaveApplication1: Record "HR Leave Applications";
    //     ImprestMemo1: Record "Imprest Memo";
    //     Payments2: Record payments;
    //     ImprestHeader: Record payments;
    //     PurchaseHeader1: Record "Purchase Header";
    //     TransportRequisition: Record "Transport Requisition";
    //     TransportRequisition1: Record "Transport Requisition";
    // begin
    //     status:='danger*The record approval could not be cancelled';
    //     recordType:= Lowercase(recordType);
    //     if recordType='leave' then begin
    //     status:='danger*The leave approval could not be cancelled';
    //     leaveApplications.Reset;
    //     leaveApplications.SetRange("Application Code", recordNo);
    //     leaveApplications.SetRange("Employee No", employeeNo);
    //     if leaveApplications.FindSet then begin
    //        //IF ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(leaveApplications) THEN
    //        ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(leaveApplications);
    //           if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
    //               if HRLeaveApplication1.Status = leaveApplications.Status then begin
    //                 status:= 'warning*Your leave application  approval could not be cancelled';
    //                 end else begin
    //                   status:= 'success*Your leave application approval was successfully cancelled';
    //                   end;
    //             end;
    //       end else begin
    //         status:='danger*The leave does not exist or you are not the requester';

    //         end;
    //         end else if recordType='imprest memo' then begin
    //     status:='danger*The imprest memo approval could not be cancelled';

    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",recordNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::"Pending Approval");
    //     if ImprestMemo.FindSet then begin

    //       ApprovalsMgmt.OnCancelImpMemoApprovalRequest(ImprestMemo);

    //       ImprestMemo1.Reset;
    //       ImprestMemo1.SetRange(Requestor, employeeNo);
    //       ImprestMemo1.SetRange("No.",recordNo);
    //       if ImprestMemo1.FindSet then begin
    //         if not (ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval") then begin
    //           status:='success*The imprest memo approval was successfully cancelled';
    //           end;
    //         end;

    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or has not been sent for approval';
    //         end;
    //     exit(status);
    //         end else if recordType='imprest surrender' then begin
    //           status:='danger*The imprest surrender could not be sent for approval';

    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",recordNo);
    //     Payments.SetRange(Status, Payments.Status::"Pending Approval");
    //     Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
    //     Payments.SetRange("Document Type", Payments."document type"::Surrender);
    //     if Payments.FindSet then begin
    //       ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

    //         if Payments2.Get(recordNo) then begin
    //           if not (Payments2.Status=Payments2.Status::"Pending Approval") then begin
    //             status:='success*The imprest Surrender approval was successfully cancelled';
    //              if ImprestHeader.Get(Payments2."Imprest Issue Doc. No") then begin
    //               ImprestHeader.Selected:=false;
    //               ImprestHeader.Modify;
    //               end;
    //             end;
    //           end;
    //       end else begin
    //         status:='danger*An imprest surrender with the given number does not exist, you are not the requestor or has not been sent for approval';
    //         end;
    //     exit(status);
    //           end else if recordType='purchase requisition' then begin
    //             status:='danger*The Purchase Requisition approval could not be cancelled';
    //      PurchaseHeader.Reset;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
    //         PurchaseHeader.SetRange("No.", recordNo);
    //         PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
    //         if PurchaseHeader.FindSet then begin

    //          ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);

    //          PurchaseHeader1.Reset;
    //         PurchaseHeader1.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader1.SetRange("No.", recordNo);
    //         PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
    //         if PurchaseHeader1.FindSet then begin
    //           if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
    //             status:='success*The Purchase Requisition approval was successfully cancelled';
    //             end;
    //           end;
    //        end else begin
    //         status:='danger*A Purchase Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
    //         end;
    //          end else if recordType='store requisition' then begin
    //             status:='danger*The Store Requisition approval could not be cancelled';
    //      PurchaseHeader.Reset;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
    //         PurchaseHeader.SetRange("No.", recordNo);
    //         PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
    //         if PurchaseHeader.FindSet then begin

    //          ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);

    //          PurchaseHeader1.Reset;
    //         PurchaseHeader1.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader1.SetRange("No.", recordNo);
    //         PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
    //         if PurchaseHeader1.FindSet then begin
    //           if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
    //             status:='success*The Store Requisition approval was successfully cancelled';
    //             end;
    //           end;
    //        end else begin
    //         status:='danger*A Store Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
    //         end;
    //             end else if recordType='transport requisition' then begin
    //               status:='danger*The fleet requisition approval could not be cancelled';
    //                 TransportRequisition.Reset;
    //                 TransportRequisition.SetRange("Employee No", employeeNo);
    //                 TransportRequisition.SetRange("Transport Requisition No", recordNo);
    //                 if TransportRequisition.FindSet then begin
    //                   TransportRequisition.TestField(Status,TransportRequisition.Status::"Pending Approval");
    //                    ApprovalsMgmt.OnCancelFleetApprovalRequest(TransportRequisition);
    //                     if TransportRequisition1.Get(recordNo) then begin
    //                         if not (TransportRequisition1.Status= TransportRequisition1.Status::"Pending Approval") then begin
    //                           status:='success*The fleet requisition approval was successfully cancelled';
    //                           end;
    //                       end;
    //                   end else begin
    //                   status:='danger*A fleet requisition with the given number does not exist, has not been sent for approval or you are not the owner';
    //                 end;
    //               end else if recordType='staff claim' then begin
    //           status:='danger*The Staff claim approval could not be cancelled';

    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",recordNo);
    //     Payments.SetRange(Status, Payments.Status::"Pending Approval");
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
    //     Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
    //     if Payments.FindSet then begin
    //       ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

    //         if Payments2.Get(recordNo) then begin
    //           if not (Payments2.Status=Payments2.Status::"Pending Approval") then begin
    //             status:='success*The staff claim approval was successfully cancelled';
    //               end;
    //           end;
    //       end else begin
    //         status:='danger*A Staff Claim with the given number does not exist, you are not the requestor or has not been sent for approval';
    //         end;
    //         end;
    //     exit(status);
    // end;

    // procedure changePassword(employeeNo: Code[50];currentPassword: Text;newPassword: Text;confirmPassword: Text) status: Text
    // var
    //     HRPortalUsers: Record HRPortalUsers;
    // begin
    //      status:='danger*Your password could not be changed. Please try again';
    //      HRPortalUsers.Reset;
    //      HRPortalUsers.SetRange(employeeNo, employeeNo);
    //      HRPortalUsers.SetRange(password, currentPassword);
    //      if HRPortalUsers.FindSet then begin
    //         if StrLen(newPassword)>3 then begin
    //             if newPassword=confirmPassword then begin
    //                   HRPortalUsers.password:= newPassword;
    //                   HRPortalUsers.changedPassword:= true;
    //                   if HRPortalUsers.Modify(true) then begin
    //                        status:='success*Your password was successfully updated';
    //                     end else begin
    //                        status:='danger*Your password could not be changed. Please try again';
    //                       end;
    //               end else begin
    //                 status:='danger*New Password and confirm new password do not match!!!';
    //                 end;
    //           end else begin
    //             status:='danger*The password you entered as your new password is too short. It should be atleast 4 characters';
    //             end;
    //        end else begin
    //          status:='danger*The password you entered as your current password is wrong. Please try again';
    //          end;
    //      exit(status);
    // end;

    // procedure deleteRequisitionLine(employeeNo: Code[250];requisitionNo: Code[250];lineNo: Integer;documentType: Integer) status: Text
    // var
    //     PurchaseLine: Record "Purchase Line";
    // begin
    //     status:='danger*Your Requisition Line could not be deleted';
    //         PurchaseHeader.Reset;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
    //         PurchaseHeader.SetRange("No.", requisitionNo);
    //         if PurchaseHeader.FindSet then begin
    //            PurchaseLine.Reset;
    //             PurchaseLine.SetRange("Document Type", documentType);
    //             PurchaseLine.SetRange("Document No.", requisitionNo);
    //             PurchaseLine.SetRange("Line No.", lineNo);
    //             if PurchaseLine.FindSet then begin
    //             if PurchaseLine.Delete(true) then begin
    //               status:='success*The Requisition Line was successfully deleted';//+FORMAT(directUnitCost);
    //               end else begin
    //                 status:='danger*Your Requisition Line could not be deleted';
    //                 end;
    //               end else begin
    //                  status:='danger*The Requisition Line does not exist'+Format(lineNo);
    //                 end;
    //           end else begin
    //             status:='danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
    //             end;
    //     exit(status);
    // end;

    // procedure sendStaffClaimApproval(employeeNo: Code[50];staffClaim: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    // begin
    //     status:='danger*The staff claim could not be sent for approval';

    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",staffClaim);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
    //     Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
    //     if Payments.FindSet then begin
    //       Payments.TestField("Account No.");
    //       Payments.TestField("Account Name");
    //       Payments.TestField("Shortcut Dimension 1 Code");
    //       Payments.TestField(Job);
    //       Payments.TestField("Job Task No");
    //     if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
    //       ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
    //           if Payments2.Get(staffClaim) then begin
    //           if Payments2.Status=Payments2.Status::"Pending Approval" then begin
    //             status:='success*The staff claim was successfully sent for approval';
    //             end;
    //           end;
    //       end else begin
    //         status:='danger*A staff claim with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure ApproveStaffClaim(employeeNo: Code[50];staffClaim: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     ProjectTeam: Record "Project Members";
    //     ImprestMemo1: Record "Imprest Memo";
    //     PortalApprovalEntry: Record "PortalApproval Entry";
    //     Employee: Record Employee;
    // begin
    //     PortalApprovalEntry.Reset;
    //     PortalApprovalEntry.SetRange("Approver ID",employeeNo);
    //     PortalApprovalEntry.SetRange("Document No.",staffClaim);
    //     if PortalApprovalEntry.FindSet then begin
    //     Payments.Reset;
    //     Payments.SetRange("No.",staffClaim);
    //     Payments.SetRange(Status, Payments.Status::Open);
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
    //     Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
    //     if Payments.FindSet then begin
    //       Payments.TestField("Account No.");
    //       Payments.TestField("Account Name");
    //       Payments.TestField("Shortcut Dimension 1 Code");
    //       Payments.TestField(Job);
    //       Payments.TestField("Job Task No");
    //     if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
    //       ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
    //           if Payments2.Get(staffClaim) then begin
    //           if Payments2.Status=Payments2.Status::"Pending Approval" then begin
    //             PortalApprovalEntry.Status:=PortalApprovalEntry.Status::Approved;
    //             if PortalApprovalEntry.Modify(true) then
    //             status:='success*The staff claim was successfully Approved';
    //             end;
    //           end;
    //        end else begin
    //         status:='danger*A staff claim with the given number does not exist';
    //       end;
    //       end else begin
    //         status:='danger*A staff claim with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);
    // end;

    // procedure CancelStaffClaimRecordApproval(employeeNo: Code[50];recordNo: Code[50];recordType: Text) status: Text
    // var
    //     HRLeaveApplication1: Record "HR Leave Applications";
    //     ImprestMemo1: Record "Imprest Memo";
    //     Payments2: Record payments;
    //     ImprestHeader: Record payments;
    //     PurchaseHeader1: Record "Purchase Header";
    //     TransportRequisition: Record "Transport Requisition";
    //     TransportRequisition1: Record "Transport Requisition";
    //     Employee: Record Employee;
    //     PortalApprovalEntry: Record "PortalApproval Entry";
    // begin
    //     status:='danger*The record approval could not be cancelled';
    //     Employee.Reset;
    //     Employee.SetRange("No.",employeeNo);
    //     if Employee.FindSet then begin
    //     PortalApprovalEntry.Reset;
    //     PortalApprovalEntry.SetRange("Document No.",recordNo);
    //     PortalApprovalEntry.SetRange("Approver ID",employeeNo);
    //     if PortalApprovalEntry.FindSet then begin
    //     recordType:= Lowercase(recordType);
    //     if recordType='leave' then begin
    //     status:='danger*The Staff Claim approval could not be cancelled';
    //     leaveApplications.Reset;
    //     leaveApplications.SetRange("Application Code", recordNo);
    //     leaveApplications.SetRange("Employee No", employeeNo);
    //     if leaveApplications.FindSet then begin
    //        ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(leaveApplications);
    //           if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
    //               if HRLeaveApplication1.Status = leaveApplications.Status then begin
    //                 status:= 'warning*Your leave application  approval could not be cancelled';
    //                 end else begin
    //                   status:= 'success*Your leave application approval was successfully cancelled';
    //                   end;
    //             end;
    //       end else begin
    //         status:='danger*The leave does not exist or you are not the requester';
    //         end;
    //         end else if recordType='imprest memo' then begin
    //     status:='danger*The imprest memo approval could not be cancelled';
    //     ImprestMemo.Reset;
    //     ImprestMemo.SetRange(Requestor, employeeNo);
    //     ImprestMemo.SetRange("No.",recordNo);
    //     ImprestMemo.SetRange(Status, ImprestMemo.Status::"Pending Approval");
    //     if ImprestMemo.FindSet then begin

    //       ApprovalsMgmt.OnCancelImpMemoApprovalRequest(ImprestMemo);

    //       ImprestMemo1.Reset;
    //       ImprestMemo1.SetRange(Requestor, employeeNo);
    //       ImprestMemo1.SetRange("No.",recordNo);
    //       if ImprestMemo1.FindSet then begin
    //         if not (ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval") then begin
    //           status:='success*The imprest memo approval was successfully cancelled';
    //           end;
    //         end;

    //       end else begin
    //         status:='danger*An imprest with the given number does not exist, you are not the requestor or has not been sent for approval';
    //         end;
    //     exit(status);
    //         end else if recordType='imprest surrender' then begin
    //           status:='danger*The imprest surrender could not be sent for approval';

    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",recordNo);
    //     Payments.SetRange(Status, Payments.Status::"Pending Approval");
    //     Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
    //     Payments.SetRange("Document Type", Payments."document type"::Surrender);
    //     if Payments.FindSet then begin
    //       ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

    //         if Payments2.Get(recordNo) then begin
    //           if not (Payments2.Status=Payments2.Status::"Pending Approval") then begin
    //             status:='success*The imprest Surrender approval was successfully cancelled';
    //              if ImprestHeader.Get(Payments2."Imprest Issue Doc. No") then begin
    //               ImprestHeader.Selected:=false;
    //               ImprestHeader.Modify;
    //               end;
    //             end;
    //           end;
    //       end else begin
    //         status:='danger*An imprest surrender with the given number does not exist, you are not the requestor or has not been sent for approval';
    //         end;
    //     exit(status);
    //           end else if recordType='purchase requisition' then begin
    //             status:='danger*The Purchase Requisition approval could not be cancelled';
    //      PurchaseHeader.Reset;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
    //         PurchaseHeader.SetRange("No.", recordNo);
    //         PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
    //         if PurchaseHeader.FindSet then begin
    //          ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);
    //          PurchaseHeader1.Reset;
    //         PurchaseHeader1.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader1.SetRange("No.", recordNo);
    //         PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
    //         if PurchaseHeader1.FindSet then begin
    //           if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
    //             status:='success*The Purchase Requisition approval was successfully cancelled';
    //             end;
    //           end;
    //        end else begin
    //         status:='danger*A Purchase Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
    //         end;
    //          end else if recordType='store requisition' then begin
    //             status:='danger*The Store Requisition approval could not be cancelled';
    //      PurchaseHeader.Reset;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
    //         PurchaseHeader.SetRange("No.", recordNo);
    //         PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
    //         if PurchaseHeader.FindSet then begin

    //          ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);

    //          PurchaseHeader1.Reset;
    //         PurchaseHeader1.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader1.SetRange("No.", recordNo);
    //         PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
    //         if PurchaseHeader1.FindSet then begin
    //           if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
    //             status:='success*The Store Requisition approval was successfully cancelled';
    //             end;
    //           end;
    //        end else begin
    //         status:='danger*A Store Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
    //         end;
    //             end else if recordType='transport requisition' then begin
    //               status:='danger*The fleet requisition approval could not be cancelled';
    //                 TransportRequisition.Reset;
    //                 TransportRequisition.SetRange("Employee No", employeeNo);
    //                 TransportRequisition.SetRange("Transport Requisition No", recordNo);
    //                 if TransportRequisition.FindSet then begin
    //                   TransportRequisition.TestField(Status,TransportRequisition.Status::"Pending Approval");
    //                    ApprovalsMgmt.OnCancelFleetApprovalRequest(TransportRequisition);
    //                     if TransportRequisition1.Get(recordNo) then begin
    //                         if not (TransportRequisition1.Status= TransportRequisition1.Status::"Pending Approval") then begin
    //                           status:='success*The fleet requisition approval was successfully cancelled';
    //                           end;
    //                       end;
    //                   end else begin
    //                   status:='danger*A fleet requisition with the given number does not exist, has not been sent for approval or you are not the owner';
    //                 end;
    //               end else if recordType='staff claim' then begin
    //           status:='danger*The Staff claim approval could not be cancelled';

    //     Payments.Reset;
    //     Payments.SetRange("Account No.", employeeNo);
    //     Payments.SetRange("No.",recordNo);
    //     Payments.SetRange(Status, Payments.Status::"Pending Approval");
    //     Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
    //     Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
    //     if Payments.FindSet then begin
    //       ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
    //         if Payments2.Get(recordNo) then begin
    //           if not (Payments2.Status=Payments2.Status::"Pending Approval") then begin
    //             PortalApprovalEntry.Status:=PortalApprovalEntry.Status::Canceled;
    //             if PortalApprovalEntry.Modify(true) then
    //             status:='success*The staff claim approval was successfully cancelled';
    //               end;
    //           end;
    //       end else begin
    //         status:='danger*A Staff Claim with the given number does not exist, you are not the requestor or has not been sent for approval';
    //        end;
    //       end;
    //      end;
    //      end;
    //     exit(status);
    // end;

    // procedure createStaffClaim(employeeNo: Code[50];claimNo: Code[50];paymentNarration: Text;fundCode: Code[100];job: Code[100];jobTask: Code[100]) status: Text
    // begin
    //     status:='danger*Your staff claim could not be captured';
    //     if claimNo='' then begin //new imprest surrender
    //       Payments.Init;
    //       Payments."Document Type":= Payments."document type"::"Staff Claims";
    //       Payments.Validate("Document Type");
    //       Payments."Payment Type":=Payments."payment type"::"Staff Claim";
    //       Payments.Validate("Payment Type");
    //       Payments."Account Type":= Payments."account type"::Employee;
    //       Payments.Validate("Account Type");
    //       //Added By Fred To Cater for The HOD Workflows
    //       Payments."Account No.":=employeeNo;
    //       if Employee.Get(Payments."Account No.") then
    //         Payments.HOD:=Employee.HOD;
    //       //Added By Fred To Cater for The HOD Workflows
    //       Payments.Validate("Account No.");
    //       Payments."Payment Narration":= paymentNarration;
    //       Payments.Validate("Payment Narration");
    //       Payments."Shortcut Dimension 3 Code":= fundCode;
    //       Payments.Validate("Shortcut Dimension 3 Code");
    //       Payments.Job:= job;
    //       Payments.Validate(Job);
    //       Payments."Job Task No":= jobTask;
    //       Payments.Validate("Job Task No");
    //       Payments."Job Task No.":=jobTask;
    //       Payments.Validate("Job Task No.");
    //       if Payments.Insert(true) then begin
    //         status:='success*Your staff claim was successfully captured*'+Payments."No.";
    //         end else begin
    //           status:='danger*Your staff claim could not be captured';
    //           end;
    //       end else begin //existing
    //         Payments.Reset;
    //         Payments.SetRange("No.", claimNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //           Payments."Payment Narration":= paymentNarration;
    //           Payments.Validate("Payment Narration");
    //           Payments."Shortcut Dimension 3 Code":= fundCode;
    //           Payments.Validate("Shortcut Dimension 3 Code");
    //           Payments.Job:= job;
    //           Payments.Validate(Job);
    //           Payments."Job Task No":= jobTask;
    //           Payments.Validate("Job Task No");
    //           Payments."Job Task No.":=jobTask;
    //           Payments.Validate("Job Task No.");
    //             if Payments.Modify(true) then begin
    //                status:='success*Your staff claim was successfully updated';
    //               end else begin
    //                  status:='danger*Your staff claim could not be updated';
    //                 end;

    //           end else begin
    //             status:='danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //             end;

    //         end;
    //     exit(status);
    // end;

    // procedure createStaffClaim1(employeeNo: Code[50];claimNo: Code[50];paymentNarration: Text;fundCode: Code[100];job: Code[100];jobTask: Code[100];region: Code[100]) status: Text
    // begin
    //     status:='danger*Your staff claim could not be captured';
    //     if claimNo='' then begin //new imprest surrender
    //       Payments.Init;
    //       Payments."Document Type":= Payments."document type"::"Staff Claims";
    //       Payments.Validate("Document Type");
    //       Payments."Payment Type":=Payments."payment type"::"Staff Claim";
    //       Payments.Validate("Payment Type");
    //       Payments."Account Type":= Payments."account type"::Employee;
    //       Payments.Validate("Account Type");
    //       //Added By Fred To Cater for The HOD Workflows
    //       Payments."Account No.":=employeeNo;
    //       if Employee.Get(Payments."Account No.") then
    //         Payments.HOD:=Employee.HOD;
    //       //Added By Fred To Cater for The HOD Workflows
    //       Payments.Validate("Account No.");
    //       Payments."Payment Narration":= paymentNarration;
    //       Payments.Validate("Payment Narration");
    //       Payments."Shortcut Dimension 3 Code":= fundCode;
    //       Payments.Validate("Shortcut Dimension 3 Code");
    //       Payments.Job:= job;
    //       Payments.Validate(Job);
    //       Payments."Job Task No":= jobTask;
    //       Payments.Validate("Job Task No");
    //       Payments."Job Task No.":=jobTask;
    //       Payments.Validate("Job Task No.");
    //       if Payments.Insert(true) then begin
    //         Payments."Responsibility Center":=region;
    //         Payments.Modify(true);
    //         status:='success*Your staff claim was successfully captured*'+Payments."No.";
    //         end else begin
    //           status:='danger*Your staff claim could not be captured';
    //           end;
    //       end else begin //existing
    //         Payments.Reset;
    //         Payments.SetRange("No.", claimNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //           Payments."Payment Narration":= paymentNarration;
    //           Payments.Validate("Payment Narration");
    //           Payments."Shortcut Dimension 3 Code":= fundCode;
    //           Payments.Validate("Shortcut Dimension 3 Code");
    //           Payments.Job:= job;
    //           Payments.Validate(Job);
    //           Payments."Job Task No":= jobTask;
    //           Payments.Validate("Job Task No");
    //           Payments."Job Task No.":=jobTask;
    //           Payments.Validate("Job Task No.");
    //             if Payments.Modify(true) then begin
    //                status:='success*Your staff claim was successfully updated';
    //               end else begin
    //                  status:='danger*Your staff claim could not be updated';
    //                 end;

    //           end else begin
    //             status:='danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //             end;

    //         end;
    //     exit(status);
    // end;

    // procedure deleteStaffClaimLine(employeeNo: Code[100];claimNo: Code[100];lineNo: Integer) status: Text
    // var
    //     PVLines: Record "PV Lines";
    // begin
    //         status:='danger*The staff claim line could not be deleted';
    //         Payments.Reset;
    //         Payments.SetRange("No.", claimNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //               PVLines.Reset;
    //               PVLines.SetRange(No, claimNo);
    //               PVLines.SetRange("Line No", lineNo);
    //               if PVLines.FindSet then begin
    //                  if PVLines.Delete(true) then begin
    //                  status:='success*The staff claim line was successfully deleted';
    //                 end else begin
    //                   status:='danger*The staff claim line could not be deleted'
    //                   end;
    //               end else begin
    //                 status:='danger*The staff claim line could not be deleted';
    //                 end;
    //           end else begin
    //             status:='danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //             end;
    // end;

    // procedure createStaffClaimLine(employeeNo: Code[100];claimNo: Code[100];voteItem: Code[100];description: Text;amount: Decimal) status: Text
    // var
    //     PVLines: Record "PV Lines";
    // begin
    //      status:='danger*The staff claim line could not be deleted';
    //         Payments.Reset;
    //         Payments.SetRange("No.", claimNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //               PVLines.Init;
    //               PVLines.No:=claimNo;
    //               PVLines.Validate(No);
    //               PVLines."Type of Expense":= voteItem;
    //               PVLines.Validate("Type of Expense");
    //               PVLines.Description:= description;
    //               PVLines.Validate(Description);
    //               PVLines.Amount:= amount;
    //               PVLines.Validate(Amount);
    //                  if PVLines.Insert(true) then begin
    //                  status:='success*The staff claim line was successfully added';
    //                 end else begin
    //                   status:='danger*The staff claim line could not be added'
    //                   end;

    //           end else begin
    //             status:='danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //             end;
    // end;

    // procedure editStaffClaimLine(lineNo: Integer;employeeNo: Code[100];claimNo: Code[100];voteItem: Code[100];description: Text;amount: Decimal) status: Text
    // var
    //     PVLines: Record "PV Lines";
    // begin
    //      status:='danger*The staff claim line could not be deleted';
    //         Payments.Reset;
    //         Payments.SetRange("No.", claimNo);
    //         Payments.SetRange("Account No.", employeeNo);
    //         Payments.SetRange(Status, Payments.Status::Open);
    //         if Payments.FindSet then begin
    //               PVLines.Reset;
    //               PVLines.SetRange("Line No", lineNo);
    //               PVLines.SetRange(No, claimNo);
    //               if PVLines.FindSet then begin
    //                   PVLines.Validate(No);
    //                   PVLines."Type of Expense":= voteItem;
    //                   PVLines.Validate("Type of Expense");
    //                   PVLines.Description:= description;
    //                   PVLines.Validate(Description);
    //                   PVLines.Amount:= amount;
    //                   PVLines.Validate(Amount);
    //                      if PVLines.Modify(true) then begin
    //                      status:='success*The staff claim line was successfully updated';
    //                     end else begin
    //                       status:='danger*The staff claim line could not be updated'
    //                       end;
    //               end else begin
    //                 status:='danger*The staff claim line does not exist';
    //                 end;
    //           end else begin
    //             status:='danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
    //             end;
    // end;

    // procedure sendStoreRequisitionApproval(employeeNo: Code[50];requisitionNo: Code[50]) status: Text
    // var
    //     TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
    //     PurchaseHeader1: Record "Purchase Header";
    // begin
    //     status:='danger*The Store Requisition could not be sent for approval';
    //      PurchaseHeader.Reset;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
    //         PurchaseHeader.SetRange("No.", requisitionNo);
    //         PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
    //         if PurchaseHeader.FindSet then begin
    //           PurchaseHeader.TestField("Shortcut Dimension 1 Code");
    //          // PurchaseHeader.TESTFIELD("Shortcut Dimension 3 Code");
    //           PurchaseHeader.TestField(Description);
    //     //TESTFIELD("Requester ID",USERID);
    //          /*
    //          TESTFIELD(Description);
    //     TESTFIELD("Shortcut Dimension 1 Code");
    //     TESTFIELD("Shortcut Dimension 2 Code");
    //     //TESTFIELD("Shortcut Dimension 3 Code");
    //     IF ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
    //       ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);*/
    //         if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then
    //       ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);

    //          PurchaseHeader1.Reset;
    //         PurchaseHeader1.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader1.SetRange("No.", requisitionNo);
    //         PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
    //         if PurchaseHeader1.FindSet then begin
    //           if PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval" then begin
    //             status:='success*The Store Requisition was successfully sent for approval';
    //             end;
    //           end;
    //        end else begin
    //         status:='danger*A Store Requisition with the given number does not exist, you are not the requestor or is no longer open';
    //         end;
    //     exit(status);

    // end;

    // procedure createStoreRequisitionLine(employeeNo: Code[250];requisitionNo: Code[250];itemCategory: Code[250];item: Code[250];quantity: Decimal;uom: Text[100]) status: Text
    // var
    //     PurchaseLine: Record "Purchase Line";
    // begin

    //         PurchaseHeader.Reset;
    //         PurchaseHeader.SetRange("Request-By No.", employeeNo);
    //         PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
    //         PurchaseHeader.SetRange("No.", requisitionNo);
    //         if PurchaseHeader.FindSet then begin
    //           if (PurchaseHeader."Document Type"=PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type"=PurchaseHeader."document type"::"Purchase Requisition") then begin
    //             //add line
    //             PurchaseLine.Init;
    //             //Document Type,Document No.,Line No.
    //             if PurchaseHeader."Document Type"= PurchaseHeader."document type"::"Store Requisition" then begin
    //             PurchaseLine."Document Type":= PurchaseLine."document type"::"Store Requisition";
    //             end;
    //              if PurchaseHeader."Document Type"= PurchaseHeader."document type"::"Purchase Requisition" then begin
    //             PurchaseLine."Document Type":= PurchaseLine."document type"::"Purchase Requisition";
    //             end;
    //             PurchaseLine."Document No.":=requisitionNo;
    //             PurchaseLine.Validate("Document No.");
    //             PurchaseLine."Line No.":= getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
    //             PurchaseLine.Validate("Line No.");
    //             PurchaseLine."Item Category":=itemCategory;
    //             PurchaseLine.Validate("Item Category");
    //             PurchaseLine."Service/Item Code":=item;
    //             PurchaseLine.Validate("Service/Item Code");
    //             PurchaseLine."Qty. Requested":= quantity;
    //             PurchaseLine.Validate("Qty. Requested");
    //             PurchaseLine."Unit of Measure":= uom;

    //             if PurchaseLine.Insert(true) then begin
    //                PurchaseLine.Validate("Qty. Requested", quantity);

    //             PurchaseLine.Modify(true);
    //               status:='success*The Requisition Line was successfully added';//+FORMAT(directUnitCost);
    //               end else begin
    //                 status:='danger*Your Requisition Line could not be added';
    //                 end;
    //            end;
    //           end else begin
    //             status:='danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
    //             end;
    //     exit(status);
    // end;

    // procedure applyexternalHrJobs(jobId: Text[20];surname: Text[100];firstname: Text[100];lastname: Text[100];title: Text[100];DOB: Date;gender: Option " ",Female,Male,Both;disabled: Option No,Yes;disabilityDetails: Text[250];county: Text[100];nationality: Text[100];maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other;religion: Text[50];idNumber: Text[50];phoneNo: Text[30];email: Text[50];ethinc: Text[30];postalAddress: Text[50];postalAddressCode: Text[50];city: Text[50];"expected salary": Decimal;registrationDetails: Text[250]) status: Text
    // begin
    //      JobApplicants.Reset;
    //      JobApplicants.SetRange("Job Applied For",jobId);
    //      JobApplicants.SetRange("ID Number",idNumber);

    //      if JobApplicants.FindSet then begin
    //        status:='error';
    //      /*CASE gender OF
    //            0:
    //              gender:=gender::Male;
    //            1:
    //              gender:=gender::Female;
    //            2:gender:=gender::Both;

    //            ELSE
    //              END;

    //        CASE disabled OF
    //          0:
    //            disabled:=disabled::Yes;
    //          1:
    //            disabled:=disabled::No;
    //            ELSE
    //            END;

    //     CASE maritalStatus OF
    //       0:
    //         maritalStatus:=maritalStatus::Married;

    //       1:
    //         maritalStatus:=maritalStatus::Single;
    //       2:
    //         maritalStatus:=maritalStatus::Divorced;

    //       3:
    //        maritalStatus:=maritalStatus::Separated;
    //       4:
    //          maritalStatus:=maritalStatus::"Widow(er)";
    //       5:
    //         maritalStatus:=maritalStatus::Other;

    //         ELSE
    //         END;
    //         JobApplicants."Application No":='';
    //          JobApplicants."Job Applied For":=jobId;
    //          JobApplicants."First Name":=firstname;
    //          JobApplicants."Middle Name":=lastname;
    //          JobApplicants."Last Name":=surname;
    //          JobApplicants.Initials:=title;
    //          JobApplicants."Date Applied":=TODAY();
    //          JobApplicants."Date Of Birth":=DOB;
    //          JobApplicants.Gender:=gender;
    //          JobApplicants.Disabled:=disabled;
    //          JobApplicants."Disability Details":= disabilityDetails;
    //          JobApplicants.County:=county;
    //          JobApplicants.Citizenship:=nationality;
    //          JobApplicants."Marital Status":=maritalStatus;
    //          JobApplicants.Religion:=religion;
    //          JobApplicants."ID Number":=idNumber;
    //          JobApplicants."Ethnic Origin":=ethinc;
    //          JobApplicants."E-Mail":=email;
    //          JobApplicants."Cell Phone Number":=phoneNo;
    //          JobApplicants."Postal Address":= postalAddress;
    //          JobApplicants."Post Code":= postalAddressCode;
    //          JobApplicants.City:=city;
    //          JobApplicants."Expected Salary":="expected salary";


    //         IF  JobApplicants.MODIFY(TRUE) THEN BEGIN

    //              jpa.RESET;
    //            jpa.SETRANGE("ID Number",idNumber);
    //            jpa.SETRANGE("Job Applied For",jobId);
    //            IF jpa.FINDSET THEN BEGIN
    //              status:=jpa."Application No";
    //              END
    //             END
    //             ELSE
    //             BEGIN
    //                status:='error*It seems you have not applied for this position. Please try another position';
    //               END
    //         */
    //        end
    //        else begin

    //          case gender of
    //            0:
    //              gender:=Gender::Male;
    //            1:
    //              gender:=Gender::Female;
    //            2:gender:=Gender::Both;

    //            else
    //              end;

    //        case disabled of
    //          0:
    //            disabled:=Disabled::Yes;
    //          1:
    //            disabled:=Disabled::No;
    //            else
    //            end;

    //     case maritalStatus of
    //       0:
    //         maritalStatus:=Maritalstatus::Married;

    //       1:
    //         maritalStatus:=Maritalstatus::Single;
    //       2:
    //         maritalStatus:=Maritalstatus::Divorced;

    //       3:
    //        maritalStatus:=Maritalstatus::Separated;
    //       4:
    //          maritalStatus:=Maritalstatus::"Widow(er)";
    //       5:
    //         maritalStatus:=Maritalstatus::Other;

    //         else
    //         end;
    //          JobApplicants.Init;
    //          JobApplicants."Application No":= '';
    //          JobApplicants."Job Applied For":=jobId;

    //          JobApplicants."First Name":=firstname;
    //          JobApplicants."Middle Name":=lastname;
    //          JobApplicants."Last Name":=surname;
    //          JobApplicants.Initials:=title;
    //          JobApplicants."Date Applied":=Today();
    //          JobApplicants."Date Of Birth":=DOB;
    //          JobApplicants.Gender:=gender;
    //          JobApplicants.Disabled:=disabled;
    //          JobApplicants."Disability Details":=disabilityDetails;
    //          JobApplicants.County:=county;
    //          JobApplicants.Citizenship:=nationality;
    //          JobApplicants."Marital Status":=maritalStatus;
    //          JobApplicants.Religion:=religion;
    //          JobApplicants."ID Number":=idNumber;
    //          JobApplicants."Ethnic Origin":=ethinc;
    //          JobApplicants."E-Mail":=email;
    //          JobApplicants."Cell Phone Number":=phoneNo;
    //          JobApplicants."Details of Disability regist":=registrationDetails;

    //          JobApplicants."Postal Address":= postalAddress;
    //          JobApplicants."Post Code":= postalAddressCode;
    //          JobApplicants.City:=city;
    //          JobApplicants."Expected Salary":="expected salary";

    //          if JobApplicants.Insert(true) then begin
    //            jpa.Reset;
    //            jpa.SetRange("ID Number",idNumber);
    //            jpa.SetRange("Job Applied For",jobId);
    //            if jpa.FindLast then begin
    //              status:=jpa."Application No";
    //              end

    //            end
    //            else begin
    //              status:='error*an error occured during the process of insertion';
    //              end;

    //          end;



    // end;

    // procedure applyinternalHrJobs(docNo: Text[30];jobId: Text[20];surname: Text[100];firstname: Text[100];lastname: Text[100];title: Text[100];DOB: Date;gender: Option " ",Female,Male,Both;disabled: Option No,Yes;disabilityDetails: Text[250];county: Text[100];nationality: Text[100];maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other;religion: Text[50];idNumber: Text[50];NhifNo: Text[30];NssfNo: Text[30];pinNo: Text[30];phoneNo: Text[30];altPhoneNo: Text[30];email: Text[50];altEmail: Text[50];empNo: Text[20];dpt: Text[100];currentPosition: Text[150];jobGroup: Text[50];dateOfFirstAppointment: Date;lastPromotionDate: Date;ethinc: Text[30]) status: Text
    // begin
    //      JobApplicants.Reset;
    //      JobApplicants.SetRange("Job Applied For",jobId);
    //      JobApplicants.SetRange("ID Number",idNumber);

    //      if JobApplicants.FindSet then begin
    //      case gender of
    //            0:
    //              gender:=Gender::Male;
    //            1:
    //              gender:=Gender::Female;
    //            2:gender:=Gender::Both;

    //            else
    //              end;

    //        case disabled of
    //          0:
    //            disabled:=Disabled::Yes;
    //          1:
    //            disabled:=Disabled::No;
    //            else
    //            end;

    //     case maritalStatus of
    //       0:
    //         maritalStatus:=Maritalstatus::Married;

    //       1:
    //         maritalStatus:=Maritalstatus::Single;
    //       2:
    //         maritalStatus:=Maritalstatus::Divorced;

    //       3:
    //        maritalStatus:=Maritalstatus::Separated;
    //       4:
    //          maritalStatus:=Maritalstatus::"Widow(er)";
    //       5:
    //         maritalStatus:=Maritalstatus::Other;

    //         else
    //         end;
    //         JobApplicants."Application No":= docNo;
    //          JobApplicants."Job Applied For":=jobId;
    //          JobApplicants."Employee No":=empNo;
    //          JobApplicants."First Name":=firstname;
    //          JobApplicants."Middle Name":=lastname;
    //          JobApplicants."Last Name":=surname;
    //          JobApplicants.Initials:=title;
    //          JobApplicants."Date Applied":=Today();
    //          JobApplicants."Date Of Birth":=DOB;
    //          JobApplicants.Gender:=gender;
    //          JobApplicants.Disabled:=disabled;
    //          JobApplicants."Disability Details":= disabilityDetails;
    //          JobApplicants.County:=county;
    //          JobApplicants.Citizenship:=nationality;
    //          JobApplicants."Marital Status":=maritalStatus;
    //          JobApplicants.Religion:=religion;
    //          JobApplicants."ID Number":=idNumber;
    //          JobApplicants.NHIF:= NhifNo;
    //          JobApplicants.NSSF:=NssfNo;
    //         JobApplicants."Ethnic Origin":=ethinc;
    //         JobApplicants."Position held" := currentPosition;
    //         JobApplicants."Job Group":=jobGroup;
    //         JobApplicants."First Appointment Date":= dateOfFirstAppointment;
    //         JobApplicants."Last Appointment Date":=lastPromotionDate;
    //         JobApplicants."Department Code":=dpt;
    //         JobApplicants."PIN Number":=pinNo;
    //          JobApplicants."E-Mail":=email;
    //          JobApplicants."Alternative Email":=altEmail;
    //          JobApplicants."Cell Phone Number":=phoneNo;
    //          JobApplicants."Altenative Phone Number":=altPhoneNo;
    //         if  JobApplicants.Modify(true) then begin

    //              status:='success';
    //             end
    //             else
    //             begin
    //                status:='danger*It seems you have not applied for this position. Please try another position';
    //               end

    //        end
    //        else begin

    //          case gender of
    //            0:
    //              gender:=Gender::Male;
    //            1:
    //              gender:=Gender::Female;
    //            2:gender:=Gender::Both;

    //            else
    //              end;

    //        case disabled of
    //          0:
    //            disabled:=Disabled::Yes;
    //          1:
    //            disabled:=Disabled::No;
    //            else
    //            end;

    //     case maritalStatus of
    //       0:
    //         maritalStatus:=Maritalstatus::Married;

    //       1:
    //         maritalStatus:=Maritalstatus::Single;
    //       2:
    //         maritalStatus:=Maritalstatus::Divorced;

    //       3:
    //        maritalStatus:=Maritalstatus::Separated;
    //       4:
    //          maritalStatus:=Maritalstatus::"Widow(er)";
    //       5:
    //         maritalStatus:=Maritalstatus::Other;

    //         else
    //         end;
    //        //Single,Married,Separated,Divorced,Widow(er),Other

    //          JobApplicants.Init;
    //          JobApplicants."Application No":= docNo;
    //          JobApplicants."Job Applied For":=jobId;
    //          JobApplicants."Employee No":=empNo;

    //          JobApplicants."First Name":=firstname;
    //          JobApplicants."Middle Name":=lastname;
    //          JobApplicants."Last Name":=surname;
    //          JobApplicants.Initials:=title;
    //          JobApplicants."Date Applied":=Today();
    //          JobApplicants."Date Of Birth":=DOB;
    //          JobApplicants.Gender:=gender;
    //          JobApplicants.Disabled:=disabled;
    //          JobApplicants."Disability Details":=disabilityDetails;
    //          JobApplicants.County:=county;
    //          JobApplicants.Citizenship:=nationality;
    //          JobApplicants."Marital Status":=maritalStatus;
    //          JobApplicants.Religion:=religion;
    //          JobApplicants."ID Number":=idNumber;
    //          JobApplicants.NHIF:= NhifNo;
    //          JobApplicants.NSSF:=NssfNo;
    //         JobApplicants."Ethnic Origin":=ethinc;
    //        JobApplicants."Position held" := currentPosition;
    //         JobApplicants."Job Group":=jobGroup;
    //         JobApplicants."First Appointment Date":= dateOfFirstAppointment;
    //         JobApplicants."Last Appointment Date":=lastPromotionDate;
    //         JobApplicants."Department Code":=dpt;




    //         JobApplicants."PIN Number":=pinNo;
    //          JobApplicants."E-Mail":=email;
    //          JobApplicants."Alternative Email":=altEmail;
    //          JobApplicants."Cell Phone Number":=phoneNo;
    //          JobApplicants."Altenative Phone Number":=altPhoneNo;
    //          if JobApplicants.Insert(true) then begin
    //            jpa.Reset;
    //            jpa.SetRange("ID Number",idNumber);
    //            jpa.SetRange("Job Applied For",jobId);
    //            if jpa.FindLast then begin
    //              status:=jpa."Application No";
    //              end

    //            end
    //            else begin
    //              status:='error*an error occured during the process of insertion';
    //              end;

    //          end;


    // end;

    // procedure updateEmploymentHistory(id: Integer;startDate: Date;endDate: Date;company: Text[150];designation: Text[150];JobGrade: Text[100];appNo: Text[30];empNo: Text[30];JobId: Text[30]) status: Text
    // begin
    //      if JobApplicants.Get(id)then
    //       begin
    //          /* ApplicantEmploymentHistory.INIT;
    //           //ApplicantEmploymentHistory."Entry No.":= appNo;
    //          // ApplicantEmploymentHistory."Document Type":=company;
    //           ApplicantEmploymentHistory."Employee No.":=startDate;
    //           ApplicantEmploymentHistory."Posting Date":=endDate;
    //           ApplicantEmploymentHistory."User ID":= designation;
    //           ApplicantEmploymentHistory."Job Grade":=JobGrade;
    //           ApplicantEmploymentHistory."Entry No.":=appNo;
    //           ApplicantEmploymentHistory."Employee No":=empNo;
    //           ApplicantEmploymentHistory."Job Id" := JobId;
    //           ApplicantEmploymentHistory.MODIFY(TRUE);*/

    //           status:='success';

    //          end
    //         else
    //          status:='error*You seem to have not applied for this position';
    //         begin
    //            end

    // end;

    // procedure addEmploymentHistory(idNumber: Text[30];startDate: Date;endDate: Date;company: Text[150];designation: Text[150];JobGrade: Text[100];appNo: Text[30];empNo: Text[30];JobId: Text[30]) status: Text
    // begin
    //      if JobApplicants.Get(appNo)then
    //       begin
    //          /* ApplicantEmploymentHistory.INIT;
    //           ApplicantEmploymentHistory."Entry No.":= appNo;
    //           ApplicantEmploymentHistory."Document Type":=company;
    //           ApplicantEmploymentHistory."Employee No.":=startDate;
    //           ApplicantEmploymentHistory."Posting Date":=endDate;
    //           ApplicantEmploymentHistory."User ID":= designation;
    //           ApplicantEmploymentHistory."Job Grade":=JobGrade;
    //           ApplicantEmploymentHistory."Id Number":=idNumber;
    //           ApplicantEmploymentHistory."Entry No.":=appNo;
    //           ApplicantEmploymentHistory."Employee No":=empNo;
    //           ApplicantEmploymentHistory."Job Id" := JobId;
    //           ApplicantEmploymentHistory.INSERT(TRUE);

    //           status:='success';*/

    //          end
    //         else
    //          status:='error*You seem to have not applied for this position';
    //         begin
    //            end

    // end;

    // procedure addAcademicQualifications(appNo: Code[20];institution: Text[200];awardAttainment: Text[150];specialization: Text[150];gradeAttained: Text[150];empNo: Text[30];jobId: Text[30];FromDate: Date;ToDate: Date) status: Text
    // begin

    //        if JobApplicants.Get(appNo) then begin
    //         applicantQualifications.Init;

    //         applicantQualifications."Employee No.":=empNo;
    //         applicantQualifications."Job ID":=jobId;
    //         applicantQualifications."Institution/Company":=institution;
    //         applicantQualifications."From Date":=FromDate;
    //         applicantQualifications."To Date":=ToDate;
    //         applicantQualifications."Qualification Description":=awardAttainment;
    //         applicantQualifications.Specialization:=specialization;
    //         applicantQualifications."Course Grade":=gradeAttained;
    //         applicantQualifications."Application No":=appNo;
    //         applicantQualifications.Insert(true);

    //         status:='success';


    //       end
    //       else
    //       begin
    //       status:='error*That application does not exist';

    //         end
    // end;

    // procedure addProffessionalQualifications(appNo: Code[20];institution: Text[150];awardAttainment: Text[100];specialization: Text[100];gradeAttained: Text[100];empNo: Text[20];jobId: Text[20];FromDate: Date;ToDate: Date) status: Text
    // begin

    //     if JobApplicants.Get(appNo) then begin
    //         professionalQualifications.Init;
    //         professionalQualifications."Employee No":=empNo;
    //         professionalQualifications."Job ID":=jobId;
    //         professionalQualifications.Institution:=institution;
    //         professionalQualifications."From Date":=FromDate;
    //         professionalQualifications."To Date":=ToDate;
    //         professionalQualifications.Attainment:=awardAttainment;
    //         professionalQualifications.Specialization:=specialization;
    //         professionalQualifications."Application No":=appNo;
    //         professionalQualifications.Grade:= gradeAttained;
    //         professionalQualifications.Insert(true);
    //         status:='success';
    //       end
    //       else
    //       begin
    //          status:='You seem to have applied for this position';

    //         end
    // end;

    // procedure addTrainingAttended(fromDate: Date;ToDate: Date;JobId: Text[30];EmployeeNo: Text[30];Institution: Text[150];courseName: Text[150];appNo: Text[30];attained: Text[100]) status: Text
    // begin

    //     if JobApplicants.Get(appNo) then begin
    //         attendedTraining.Init;
    //         attendedTraining."Employee No":=EmployeeNo;
    //         attendedTraining."Application No":=appNo;
    //         attendedTraining."From Date":=fromDate;
    //         attendedTraining."To Date":=ToDate;
    //         attendedTraining."Job ID":=JobId;
    //         attendedTraining.Institution:=Institution;
    //         attendedTraining."Course Name":=courseName;
    //         attendedTraining.Attained:=attained;
    //         attendedTraining.Insert(true);
    //         status:='success';

    //     end
    //     else
    //     begin
    //      status:='error*That application does not exist';

    //       end
    // end;

    // procedure addProfessionalBody(appNo: Text[30];jobId: Text[30];empNo: Text[30];pBody: Text[100];mNo: Text[100];mType: Text[50];rDate: Date) status: Text
    // begin

    //     if JobApplicants.Get(appNo) then begin
    //       membershipbody.Init;
    //         membershipbody."Application No":=appNo;
    //         membershipbody."Employee No":=empNo;
    //         membershipbody."Job ID":=jobId;
    //         membershipbody.Institution:=pBody;
    //         membershipbody."Membership Type":=mType;
    //         membershipbody."Membership No":=mNo;
    //         membershipbody."Renewal Date":=rDate;

    //         membershipbody.Insert(true);

    //         status:='success';
    //       end
    //       else
    //       begin
    //         status:='error*That application does not exist';

    //         end
    // end;

    // procedure addApplicantAccomplishment(appNo: Text[30];empNo: Text[30];description: Text[500];number: Integer;jobId: Text[30];amt: Text[50]) status: Text
    // begin
    //     if JobApplicants.Get(appNo) then begin
    //       applicantAccomplishment.Reset;
    //       applicantAccomplishment.SetRange("Job Application No",appNo);
    //       applicantAccomplishment.SetRange("Indicator Description",description);
    //       if applicantAccomplishment.FindSet then begin
    //         applicantAccomplishment.Number:= number;
    //         applicantAccomplishment.Amount:=amt;
    //         applicantAccomplishment.Modify(true) ;
    //         status:='success*Accomplishment updated successfully';

    //           end
    //         else
    //                 begin

    //                 applicantAccomplishment.Init;
    //                 applicantAccomplishment."Job Application No":=appNo;
    //                 applicantAccomplishment."Employee No":=empNo;
    //                 applicantAccomplishment."Job ID":=jobId;
    //                 applicantAccomplishment.Number:=number;
    //                 applicantAccomplishment."Id Number":=JobApplicants."ID Number";
    //                 applicantAccomplishment."Indicator Description":=description;
    //                 applicantAccomplishment.Amount :=amt;

    //                 applicantAccomplishment.Insert(true);
    //                 status:='success';
    //                 end
    //       end
    //       else
    //       begin
    //         status:='error*That application does not exist';

    //         end
    // end;

    // procedure addAbilityDetails(description: Text[300];appNo: Text[30]) status: Text
    // begin
    //     if JobApplicants.Get(appNo) then begin

    //      JobApplicants."Abilites,Skills":=description;
    //      JobApplicants.Modify(true);
    //      status:='success';
    //       end
    //       else
    //       begin
    //         status:='error*That application does not exist';

    //         end
    // end;

    // procedure createReferee(appNo: Text[30];empNo: Text[30];name: Text[100];occupation: Text[50];address: Text[50];postCode: Text[50];phone: Text[30];email: Text[40];knownPeriod: Text[50];jobId: Text[30]) status: Text
    // begin
    //     if JobApplicants.Get(appNo) then begin
    //      referee.Init;
    //      referee."Job Application No":= appNo;
    //      referee."Employee No":=empNo;
    //      referee.Names:=name;
    //      referee.Occupation:=occupation;
    //      referee.Address:=address;
    //      referee."Post Code":=postCode;
    //      referee."Telephone No":=phone;
    //      referee."E-Mail":=email;
    //      referee."Period Known":=knownPeriod;
    //      referee."Job ID":=jobId;
    //      referee.Insert(true);
    //      status:='success';

    //       end
    //       else
    //       begin
    //         status:='error*That application does not exist';

    //         end
    // end;

    // procedure addCurrentDutiesSkills(abilities: Text[250];currentDuties: Text[300];appNo: Text[30]) status: Text
    // begin
    //     if JobApplicants.Get(appNo) then begin

    //      JobApplicants."Current Duties":=currentDuties;
    //      JobApplicants."Abilites,Skills":=abilities;

    //      JobApplicants.Modify(true);
    //      status:='success';
    //       end
    //       else
    //       begin
    //         status:='error*That application does not exist';

    //         end
    // end;

    // procedure addOtherPersonalDetails(appNo: Text[30];convicted: Boolean;convictionDesc: Text[30];dismissal: Boolean;dismissalDesc: Text[100];highestLevel: Text[100]) status: Text
    // begin
    //     if JobApplicants.Get(appNo) then begin

    //       JobApplicants.Convicted:=convicted;
    //       JobApplicants."Conviction Description":=convictionDesc;
    //       JobApplicants.Dismissal:=dismissal;
    //       JobApplicants."Dismissal Description":=dismissalDesc;
    //       JobApplicants."Highest Education Level":=highestLevel;
    //       JobApplicants.Modify(true);
    //       status:='success';
    //       end
    //       else
    //        begin
    //         status:='error*That application does not exist';
    //         end
    // end;

    // procedure addDutiesDetails(description: Text[300];appNo: Text[30]) status: Text
    // begin
    //     if JobApplicants.Get(appNo) then begin

    //      JobApplicants."Current Duties":=description;
    //      JobApplicants.Modify(true);
    //      status:='success';
    //       end
    //       else
    //       begin
    //         status:='error*That application does not exist';

    //         end
    // end;

    // procedure deleteAcademicLine(id: Integer;appNo: Text[30]) status: Text
    // begin
    //     applicantQualifications.Reset;
    //     applicantQualifications.SetRange(Code,id);
    //     applicantQualifications.SetRange("Application No",appNo);
    //     if(applicantQualifications.FindSet) then begin
    //       applicantQualifications.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure deleteProfessionalLine(id: Integer;appNo: Text[30]) status: Text
    // begin
    //     professionalQualifications.Reset;
    //     professionalQualifications.SetRange(Code,id);
    //     professionalQualifications.SetRange("Application No",appNo);
    //     if(professionalQualifications.FindSet) then begin
    //       professionalQualifications.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure deleteTrainingLine(id: Integer;appNo: Text[30]) status: Text
    // begin
    //     attendedTraining.Reset;
    //     attendedTraining.SetRange(Code,id);
    //     attendedTraining.SetRange("Application No",appNo);
    //     if(attendedTraining.FindSet) then begin
    //       attendedTraining.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure deleteProffessionalBodyLine(id: Integer;appNo: Text[30]) status: Text
    // begin
    //     membershipbody.Reset;
    //     membershipbody.SetRange(Code,id);
    //     membershipbody.SetRange("Application No",appNo);
    //     if(membershipbody.FindSet) then begin
    //       membershipbody.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure deleteEmploymentHistoryLine(id: Integer;appNo: Text[30]) status: Text
    // begin
    //     /*ApplicantEmploymentHistory.RESET;
    //     ApplicantEmploymentHistory.SETRANGE(Code,id);
    //     ApplicantEmploymentHistory.SETRANGE("Entry No.",appNo);
    //     IF(ApplicantEmploymentHistory.FINDSET) THEN BEGIN
    //       ApplicantEmploymentHistory.DELETE(TRUE);
    //       status:='success*Record Successfully deleted';

    //       END
    //       ELSE BEGIN
    //         status:='error*The record does not exist';
    //         END
    //         */

    // end;

    // procedure deleteRefereeLine(id: Integer;appNo: Text[30]) status: Text
    // begin

    //     referee.Reset;
    //     referee.SetRange(Code,id);
    //     referee.SetRange("Job Application No",appNo);
    //     if(referee.FindSet) then begin
    //       referee.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure addDeclaration(declaration: Boolean;appNo: Text[30]) status: Text
    // begin
    //     if JobApplicants.Get(appNo) then begin

    //      JobApplicants.Declaralation:=declaration;
    //      JobApplicants.Modify(true);
    //      status:='success';
    //       end
    //       else
    //       begin
    //         status:='error*That application does not exist';

    //         end
    // end;

    // procedure createProfileForExternalApplicants(surname: Text[100];firstname: Text[100];lastname: Text[100];title: Text[100];DOB: Date;gender: Option " ",Female,Male,Both;disabled: Option No,Yes;disabilityDetails: Text[250];county: Text[100];nationality: Text[100];maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other;email: Text[100];religion: Text[50];idNumber: Text[100];phoneNo: Text[30];ethinc: Text[30];postalAddress: Text[50];postalAddressCode: Text[50];city: Text[50];"expected salary": Decimal;registrationDetails: Text[250];NhifNo: Text[30];NssfNo: Text[30];pinNo: Text[30];altPhoneNo: Text[30];altEmail: Text[50];positionHeld: Text[50];currentEmployer: Text[100];GrossSalary: Decimal;effectiveDate: Date) status: Text
    // begin
    //      externalApplicants.Reset;
    //      externalApplicants.SetRange(Email,email);

    //      if externalApplicants.FindSet then begin
    //      case gender of
    //            0:
    //              gender:=Gender::Male;
    //            1:
    //              gender:=Gender::Female;
    //            2:gender:=Gender::Both;

    //            else
    //              end;

    //        case disabled of
    //          0:
    //            disabled:=Disabled::Yes;
    //          1:
    //            disabled:=Disabled::No;
    //            else
    //            end;

    //     case maritalStatus of
    //       0:
    //         maritalStatus:=Maritalstatus::Married;

    //       1:
    //         maritalStatus:=Maritalstatus::Single;
    //       2:
    //         maritalStatus:=Maritalstatus::Divorced;

    //       3:
    //        maritalStatus:=Maritalstatus::Separated;
    //       4:
    //          maritalStatus:=Maritalstatus::"Widow(er)";
    //       5:
    //         maritalStatus:=Maritalstatus::Other;

    //         else
    //         end;

    //          externalApplicants.FirstName:=firstname;
    //          externalApplicants."Middle Name":=lastname;
    //          externalApplicants.LastName:=surname;
    //          externalApplicants.Initials:=title;
    //          externalApplicants."Date Applied":=Today();
    //          externalApplicants."Date Of Birth":=DOB;
    //          externalApplicants.Gender:=gender;
    //          externalApplicants.Disabled:=disabled;
    //          externalApplicants."Disability Details":=disabilityDetails;
    //          externalApplicants.County:=county;
    //          externalApplicants.Citizenship:=nationality;
    //          externalApplicants."Marital Status":=maritalStatus;
    //          externalApplicants.Religion:=religion;
    //          externalApplicants."ID Number":=idNumber;
    //          externalApplicants."Ethnic Origin":=ethinc;
    //          externalApplicants."Cell Phone Number":=phoneNo;
    //          externalApplicants."Details of Disability regist":=registrationDetails;
    //          externalApplicants."Postal Address":= postalAddress;
    //          externalApplicants."Post Code":= postalAddressCode;
    //          externalApplicants.City:=city;
    //          externalApplicants."Expected Salary":="expected salary";
    //          externalApplicants.NHIF:= NhifNo;
    //          externalApplicants.NSSF :=NssfNo;
    //          externalApplicants."PIN Number":=pinNo;
    //          externalApplicants."Altenative Phone Number":=altPhoneNo;
    //          externalApplicants."Alternative Email":=altEmail;
    //          externalApplicants."Current Employer":=currentEmployer;
    //          externalApplicants."Gross Salary":=GrossSalary;
    //          externalApplicants."Position held":=positionHeld;
    //          externalApplicants."Effective Date":=effectiveDate;

    //         if  externalApplicants.Modify(true) then begin
    //            status:= 'success';
    //             end
    //             else
    //             begin
    //                status:='error*It seems you have not applied for this position. Please try another position';
    //               end

    //        end


    // end;

    // procedure CreateAccountForExtenalApplicants(fname: Text[100];lname: Text[100];email: Text[100];password: Text[100];salt: Text[100]) status: Text
    // begin
    //     externalApplicants.Init;
    //     externalApplicants.FirstName:=fname;
    //     externalApplicants.LastName:=lname;
    //     externalApplicants.Email:=email;
    //     externalApplicants.Password:=password;
    //     externalApplicants.Salt:=salt;
    //     externalApplicants.Insert(true);
    //     status:='success';
    // end;

    // procedure forgotPasswordtForExtenalApplicants(email: Text[100];password: Text[100];salt: Text[100]) status: Text
    // begin
    //     externalApplicants.Reset;
    //     externalApplicants.SetRange(Email,email);
    //     if externalApplicants.FindSet then begin
    //       externalApplicants.Password:=password;
    //       externalApplicants.Salt:=salt;
    //       externalApplicants.Modify(true);
    //       status:='success';
    //       end
    //       else
    //       begin
    //         status:='error';

    //         end
    // end;

    // procedure createIctRequest(empNo: Text;description: Text[2048]) status: Text
    // var
    //     Body: Text[250];
    //     SMTP: Codeunit Mail;
    //     Email2: Text[250];
    //     CInfo: Record "Company Information";
    //     Category1: Record "ICT Helpdesk Category";
    //     Mapping: Record "ICT Officers Category Mapping";
    //     UserSetup: Record "User Setup";
    //     SetUp: Record "ICT Helpdesk Global Parameters";
    //     Email: Text[250];
    //     empName: Text[250];
    // begin
    //     Employee.Reset;
    //     Employee.SetRange("No.",empNo);
    //     if Employee.FindSet then begin
    //         helpdesk.Init;
    //         helpdesk."Job No.":='';
    //         helpdesk."Description of the issue":=description;
    //         helpdesk."Request Date":=Today();
    //         helpdesk."Request Time":=Time;
    //         helpdesk."Employee No":= empNo;
    //         helpdesk."Requesting Officer":=empNo;
    //         helpdesk."Requesting Officer Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
    //         helpdesk.Phone:=Employee."Phone No.";
    //         helpdesk.Email:=Employee."E-Mail";
    //         helpdesk.Department:=Employee."Department Code";
    //         helpdesk."Department Name":=Employee."Department Name";
    //         helpdesk."Region Name":=Employee.Workstation;
    //         helpdesk."Global Dimension 1 Code":=Employee."Global Dimension 1 Code";
    //         helpdesk."Constituency Name":=Employee."Shortcut Dimension 3";
    //         helpdesk.Status:=helpdesk.Status::Pending;
    //        if helpdesk.Insert(true) then begin
    //         helpdesk.Validate("Employee No");
    //         hdesk.SetRange("Employee No",empNo);
    //         if hdesk.FindLast then begin
    //           CInfo.Get;


    //       SetUp.Get();
    //       Email2:=CInfo."Administrator Email";
    //       Email:=SetUp."ICT Email";
    //       Body:='<br>Kindly login to the ERP System and attend to the ICT Issue No. '+hdesk."Job No."+' from '+Employee."First Name"+' '+Employee."Last Name"+'.'+'</br>';
    //       Body:='<br>'+Body+' '+ 'Best Regards,'+'</br>';
    //       Body:= Body+' '+'ERP AUTOMATIC MAILS';
    //       SMTP.CreateMessage(COMPANYNAME,Email2,Email,'ICT Heldesk Notification',Body,true);
    //      // MESSAGE(Email);
    //       SMTP.Send();
    //       Message('ICT Issue notification sent successfully.');
    //       Employee.Reset;
    //       Employee.SetRange("No.",empNo);
    //       if Employee.Find('-')then     begin
    //         Email:=Employee."E-Mail";
    //         empName:=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";

    //       Email2:=CInfo."Administrator Email";
    //       Body:='<br>Your issue has been received by ICT department Issue No. '+hdesk."Job No."+' from '+empName+'.'+'</br>';
    //       Body:='<br>'+Body+' '+ 'Best Regards,'+'</br>';
    //       Body:= Body+' '+'ERP AUTOMATIC MAILS';
    //       SMTP.CreateMessage(COMPANYNAME,Email2,Email,'ICT Heldesk Notification',Body,true);
    //       Message(Email);
    //       SMTP.Send();
    //       Message('ICT Issue notification sent successfully.');

    //     status:='success*Your request sent successfully';
    //         end


    //           end


    //       end


    //        end

    //         else
    //         begin
    //           status:= 'error*Employee does not exist';
    //           end
    // end;

    // procedure ProvideIctfeedback(appNo: Text;description: Text[250]) status: Text
    // begin
    //     helpdesk.Reset;
    //     helpdesk.SetRange("Job No.",appNo);
    //     if helpdesk.FindSet then begin
    //         helpdesk."Requester Feedback":=description;
    //       helpdesk.Status:=helpdesk.Status::Closed;
    //       if  helpdesk.Modify(true) then  begin
    //         status:='success*Request successfully updated';
    //       end


    //        end

    //         else
    //         begin
    //           status:= 'error*Job No does not exist';
    //           end
    // end;

    // procedure updateIctRequest(appNo: Text;description: Text[2048]) status: Text
    // begin
    //     helpdesk.Reset;
    //     helpdesk.SetRange("Job No.",appNo);
    //     if helpdesk.FindSet then begin
    //         helpdesk."Description of the issue":=description;
    //         helpdesk."Request Date":=Today();
    //         helpdesk."Request Time":=Time;
    //       if  helpdesk.Modify(true) then  begin
    //         status:='success*Request successfully updated';
    //       end


    //        end

    //         else
    //         begin
    //           status:= 'error*Job No does not exist';
    //           end
    // end;

    // procedure applyexternalJob(jobId: Text[20];surname: Text[100];firstname: Text[100];lastname: Text[100];title: Text[100];DOB: Date;gender: Option " ",Female,Male,Both;disabled: Option No,Yes;disabilityDetails: Text[250];county: Text[100];nationality: Text[100];maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other;religion: Text[50];idNumber: Text[50];phoneNo: Text[30];email: Text[50];ethinc: Text[30];postalAddress: Text[50];postalAddressCode: Text[50];city: Text[50];"expected salary": Decimal;registrationDetails: Text[250]) status: Text
    // begin
    //      JobApplicants.Reset;
    //      JobApplicants.SetRange("Job Applied For",jobId);
    //      JobApplicants.SetRange("ID Number",idNumber);
    //      JobApplicants.SetRange("Application Status",JobApplicants."application status"::Submitted);

    //      if JobApplicants.FindSet then begin
    //        status:='error*You seem to have applied for this position.Please try again';

    //        end
    //        else begin
    //          externalApplicants.Reset;
    //          externalApplicants.SetRange(Email,email);
    //          if externalApplicants.FindSet then begin
    //            end else begin

    //         JobApplicants.Init;
    //          JobApplicants."Application No":= '';
    //          JobApplicants."Job Applied For":=jobId;

    //          JobApplicants."First Name":= externalApplicants.FirstName;
    //          JobApplicants."Middle Name":=lastname;
    //          JobApplicants."Last Name":=surname;
    //          JobApplicants.Initials:=title;
    //          JobApplicants."Date Applied":=Today();
    //          JobApplicants."Date Of Birth":=DOB;
    //          JobApplicants.Gender:=gender;
    //          JobApplicants.Disabled:=disabled;
    //          JobApplicants."Disability Details":=disabilityDetails;
    //          JobApplicants.County:=county;
    //          JobApplicants.Citizenship:=nationality;
    //          JobApplicants."Marital Status":=maritalStatus;
    //          JobApplicants.Religion:=religion;
    //          JobApplicants."ID Number":=idNumber;
    //          JobApplicants."Ethnic Origin":=ethinc;
    //          JobApplicants."E-Mail":=email;
    //          JobApplicants."Cell Phone Number":=phoneNo;
    //          JobApplicants."Details of Disability regist":=registrationDetails;

    //          JobApplicants."Postal Address":= postalAddress;
    //          JobApplicants."Post Code":= postalAddressCode;
    //          JobApplicants.City:=city;
    //          JobApplicants."Expected Salary":="expected salary";

    //          if JobApplicants.Insert(true) then begin
    //            jpa.Reset;
    //            jpa.SetRange("ID Number",idNumber);
    //            jpa.SetRange("Job Applied For",jobId);
    //            if jpa.FindLast then begin
    //              status:=jpa."Application No";
    //              end

    //            end
    //            else begin
    //              status:='error*an error occured during the process of insertion';
    //              end;



    //              end




    //          end;


    // end;

    // procedure getItemsByLocation(location: Text[100];category: Text[100]) status: Text
    // var
    //     Loc: Text[100];
    // begin
    //     status:='';
    //     item.Reset;
    //     item.SetFilter("Item Category Code",category);
    //     item.SetFilter("Location Filter",location);
    //     if item.FindSet then begin
    //       repeat
    //       item.CalcFields("Location Code",Inventory);
    //       status+=item."No."+'*';
    //       until item.Next=0;
    //      end



    // end;

    // procedure getItemDescByLocation(location: Text[100];category: Text[100]) status: Text
    // var
    //     Loc: Text[100];
    // begin
    //     status:='';
    //     item.Reset;
    //     item.SetFilter("Item Category Code",category);
    //     item.SetFilter("Location Filter",location);
    //     //item.SETFILTER(Inventory,'>%1',0);
    //     item.SetRange(Blocked,false);

    //     if item.FindSet then begin
    //       repeat
    //       item.CalcFields("Location Code",Inventory);
    //       status +=item."No."+'_'+item.Description+'*';
    //       until item.Next=0;
    //      end



    // end;

    // procedure AssignHelpdeskRequest(jobNo: Text[100];assignee: Text[100]) status: Text
    // var
    //     ObjNotify: Codeunit "Insurance Notifications";
    //     SenderEmailAddress: Text[250];
    //     SenderName: Text[250];
    //     Recipient: Text[250];
    //     Subject: Text[250];
    //     Body: Text[250];
    //     ObjComInfo: Record "Company Information";
    //     UserSetup: Record "User Setup";
    //     ICTHelpdesk: Record "ICT Helpdesk";
    //     Mapping: Record "ICT Officers Category Mapping";
    // begin
    //     helpdesk.Reset;
    //     helpdesk.SetRange("Job No.",jobNo);
    //     if helpdesk.FindSet then begin
    //       UserSetup.Reset;
    //       UserSetup.SetRange("User ID",assignee);
    //       if UserSetup.FindSet then begin
    //          helpdesk."Assigned To":=assignee;
    //         helpdesk.Validate("Assigned To");
    //       helpdesk."Assigned Date":=Today();
    //       helpdesk."Assigned Time":=Time;
    //       helpdesk.Status:= helpdesk.Status::Assigned;
    //       helpdesk."Assigned To EmpNo":= UserSetup."Employee No.";


    //       if helpdesk.Modify(true) then begin
    //         //Notify the requester that the issue has been escalated
    //      ObjComInfo.Get;
    //      SenderEmailAddress:=ObjComInfo."Administrator Email";
    //      SenderName:=COMPANYNAME;
    //      if Employee.Get(helpdesk."Employee No") then
    //      Recipient:=Employee."E-Mail";
    //      Subject:='ISSUE ASSIGNED'+ ' '+jobNo;
    //      Body:='Please note that the issue on the subject above has been assigned to '+ '  '+assignee;
    //      ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);

    //      ObjComInfo.Get;
    //      SenderEmailAddress:=ObjComInfo."Administrator Email";
    //      SenderName:=COMPANYNAME;
    //      if UserSetup.Get(helpdesk."Assigned To") then
    //      Recipient:=UserSetup."E-Mail";
    //      Subject:='ICT ISSUE ASSIGNED'+ ' '+jobNo;
    //      Body:='Please note that the issue on the subject above has been assigned to you';
    //      ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);



    //     status:= 'success*Request assigned successfully';
    //         end


    //       end
    //       else
    //       begin
    //         status:='error*Job No is already assigned ';
    //         end
    //     end
    // end;

    // procedure EscalatedHelpdeskRequest(jobNo: Text[100];assignee: Text[100];description: Text[300]) status: Text
    // var
    //     ObjNotify: Codeunit "Insurance Notifications";
    //     SenderEmailAddress: Text[250];
    //     SenderName: Text[250];
    //     Recipient: Text[250];
    //     Subject: Text[250];
    //     Body: Text[250];
    //     ObjComInfo: Record "Company Information";
    //     UserSetup: Record "User Setup";
    //     ICTHelpdesk: Record "ICT Helpdesk";
    //     Mapping: Record "ICT Officers Category Mapping";
    // begin
    //     helpdesk.Reset;
    //     helpdesk.SetRange("Job No.",jobNo);
    //     if helpdesk.FindSet then begin
    //     UserSetup.Reset;
    //     UserSetup.SetRange("User ID",assignee);

    //     if UserSetup.FindSet then begin
    //        helpdesk."Escalated To":=assignee;
    //       helpdesk."Escalated Date":=Today();
    //       helpdesk."Escalated Time":=Time;
    //       helpdesk.Status:= helpdesk.Status::Escalated;
    //       helpdesk."Escalated By":= helpdesk."Assigned To";
    //       helpdesk."Ascalation Details":= description;
    //       helpdesk."Escalated To EmpNo":= UserSetup."Employee No.";
    //       if helpdesk.Modify(true) then begin
    //         //Notify the requester that the issue has been escalated
    //      ObjComInfo.Get;
    //      SenderEmailAddress:=ObjComInfo."Administrator Email";
    //      SenderName:=COMPANYNAME;
    //      if Employee.Get(helpdesk."Employee No") then
    //      Recipient:=Employee."E-Mail";
    //      Subject:='ICT ISSUE ESCALATION'+ ' '+jobNo;
    //      Body:='Please note that the issue on the subject above has been escalatd to '+ '  '+helpdesk."Escalated To";
    //      ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);

    //     //Notify the Escalted To that the issue has been escalated
    //      ObjComInfo.Get;
    //      SenderEmailAddress:=ObjComInfo."Administrator Email";
    //      SenderName:=COMPANYNAME;
    //      if UserSetup.Get(helpdesk."Escalated To") then
    //      Recipient:=UserSetup."E-Mail";
    //      Subject:='ICT ISSUE ESCALATION'+ ' '+jobNo;
    //      Body:='Please note that the issue on the subject above has been escalatd to you by'+' '+helpdesk."Assigned To";
    //      ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
    //     status:= 'success*Request assigned successfully';


    //       end




    //       end
    //       else
    //       begin
    //         status:='error*Job No is already assigned ';
    //         end
    //     end
    // end;

    // procedure ResolveHelpdeskRequest(jobNo: Text[100];description: Text[300]) status: Text
    // var
    //     ObjNotify: Codeunit "Insurance Notifications";
    //     SenderEmailAddress: Text[250];
    //     SenderName: Text[250];
    //     Recipient: Text[250];
    //     Subject: Text[250];
    //     Body: Text[250];
    //     ObjComInfo: Record "Company Information";
    //     UserSetup: Record "User Setup";
    //     ICTHelpdesk: Record "ICT Helpdesk";
    //     Mapping: Record "ICT Officers Category Mapping";
    // begin
    //     helpdesk.Reset;
    //     helpdesk.SetRange("Job No.",jobNo);
    //     if helpdesk.FindSet then begin
    //       helpdesk."Action Taken":=description;
    //       helpdesk."Attended By":= helpdesk."Assigned To";
    //       helpdesk."Attended Date":=Today;
    //       helpdesk.Status:= helpdesk.Status::Resolved;
    //       if helpdesk.Modify(true) then begin
    //      ObjComInfo.Get;
    //      SenderEmailAddress:=ObjComInfo."Administrator Email";
    //      SenderName:=COMPANYNAME;
    //      if Employee.Get(helpdesk."Employee No") then
    //      Recipient:=Employee."E-Mail";
    //      Subject:='ISSUE CLOSURE'+ ' '+jobNo;
    //      Body:='Please note that the issue on the subject above has been resolved by'+ '  '+helpdesk."Attended By"
    //       +' '+'Kindly login to the system and confirm.Request will be closed after 24 hours.';
    //      ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
    //      status:='success*Request has been resolved successfully ';
    //       end
    //       else
    //       begin
    //         status:='error*Job No is already assigned ';
    //         end
    //     end
    // end;

    // procedure ReopenHelpdeskRequest(jobNo: Text[50];description: Text[250]) status: Text
    // begin
    //     helpdesk.Reset;
    //     helpdesk.SetRange("Job No.",jobNo);
    //     if helpdesk.FindSet then begin
    //     helpdesk.Status:= helpdesk.Status::Pending;
    //     helpdesk.Reopened:=true;
    //     //helpdesk."Reopened By":=helpdesk.;
    //     helpdesk."Assigned To":='';
    //     helpdesk."Attended By":='';
    //     helpdesk."Assigned Date":=0D;
    //     helpdesk."Assigned Time":=0T;
    //     helpdesk."Attended by Name":='';
    //     helpdesk."Attended Date":=0D;
    //     helpdesk."Attended Time":=0T;
    //     helpdesk.Modify;

    //     status:='success*Request successfully reopened';
    //       end
    //       else begin
    //         status:='error*job no does not exist';
    //         end
    // end;

    // procedure addEmploymentHistoryForExternalApplcants(startDate: Date;endDate: Date;company: Text[150];designation: Text[150];JobGrade: Text[100];email: Text[50]) status: Text
    // begin
    //             externalApplicants.Reset;
    //             externalApplicants.SetRange(Email,email);
    //         if externalApplicants.FindSet then begin
    //           applicantBackground.Init;
    //           applicantBackground.Institution:=company;
    //           applicantBackground."From Date":=startDate;
    //           applicantBackground."To Date":=endDate;
    //           applicantBackground."Job Title":= designation;
    //           applicantBackground.Grade:=JobGrade;
    //           applicantBackground.Email:=email;
    //           applicantBackground.Type:=applicantBackground.Type::Employment;

    //           applicantBackground.Insert(true);

    //           status:='success';

    //          end
    //         else
    //          status:='error*You seem to have not applied for this position';
    //         begin
    //            end
    // end;

    // procedure addAcademicQualificationsForExternalApplcants(email: Text;institution: Text[200];awardAttainment: Text[150];specialization: Text[150];gradeAttained: Text[150];FromDate: Date;ToDate: Date) status: Text
    // begin

    //             externalApplicants.Reset;
    //             externalApplicants.SetRange(Email,email);
    //         if externalApplicants.FindSet then begin
    //         applicantBackground.Init;
    //         applicantBackground.Institution:=institution;
    //         applicantBackground."From Date":=FromDate;
    //         applicantBackground."To Date":=ToDate;
    //         applicantBackground.Attainment:=awardAttainment;
    //         applicantBackground.Specialization:=specialization;
    //         applicantBackground.Grade:=gradeAttained;
    //         applicantBackground.Email:=email;
    //         applicantBackground.Type:= applicantBackground.Type::Education;
    //         applicantBackground.Insert(true);

    //         status:='success';


    //       end
    //       else
    //       begin
    //       status:='error*That email does not exist';

    //         end
    // end;

    // procedure addProffessionalQualificationsForExternalApplcants(email: Text[100];institution: Text[150];awardAttainment: Text[100];specialization: Text[100];gradeAttained: Text[100];FromDate: Date;ToDate: Date) status: Text
    // begin
    //              externalApplicants.Reset;
    //             externalApplicants.SetRange(Email,email);
    //         if externalApplicants.FindSet then begin
    //         applicantBackground.Init;
    //         applicantBackground.Institution:=institution;
    //         applicantBackground."From Date":=FromDate;
    //         applicantBackground."To Date":=ToDate;
    //         applicantBackground.Attainment:=awardAttainment;
    //         applicantBackground.Specialization:=specialization;
    //         applicantBackground.Grade:= gradeAttained;
    //         applicantBackground.Email:=email;
    //         applicantBackground.Type:= applicantBackground.Type::"Professional Qualification";
    //         applicantBackground.Insert(true);

    //         status:='success';
    //       end
    //       else
    //       begin
    //          status:='You seem to have applied for this position';

    //         end
    // end;

    // procedure addTrainingAttendedForExternalApplcants(fromDate: Date;ToDate: Date;Institution: Text[150];courseName: Text[150];email: Text[50];attained: Text[100]) status: Text
    // begin
    //      externalApplicants.Reset;
    //      externalApplicants.SetRange(Email,email);
    //         if externalApplicants.FindSet then begin
    //         applicantBackground.Init;
    //         applicantBackground."From Date":=fromDate;
    //         applicantBackground."To Date":=ToDate;
    //         applicantBackground.Institution:=Institution;
    //         applicantBackground."Course Name":=courseName;
    //         applicantBackground.Attainment:=attained;
    //         applicantBackground.Email:= email;
    //         applicantBackground.Type:= applicantBackground.Type::Training;
    //         applicantBackground.Insert(true);
    //         status:='success';


    //     end
    //     else
    //     begin
    //      status:='error*That application does not exist';

    //       end
    // end;

    // procedure addProfessionalBodyForExternalApplcants(email: Text[50];pBody: Text[100];mNo: Text[100];mType: Text[50];rDate: Date) status: Text
    // begin
    //             externalApplicants.Reset;
    //          externalApplicants.SetRange(Email,email);
    //         if externalApplicants.FindSet then begin
    //         applicantBackground.Init;
    //           applicantBackground."Application No":= '';
    //           applicantBackground."From Date":=0D;
    //         applicantBackground.Institution:=pBody;
    //         applicantBackground."Membership Type":=mType;
    //         applicantBackground."Membership No":=mNo;
    //         applicantBackground."Date of renewal":=rDate;
    //         applicantBackground.Email:=email;
    //         applicantBackground.Type:=applicantBackground.Type::"Professional Body";
    //         applicantBackground.Insert(true);

    //         status:='success';
    //       end
    //       else
    //       begin
    //         status:='error*That application does not exist';

    //         end
    // end;

    // procedure createRefereeForExternalApplcants(email: Text[50];name: Text[100];occupation: Text[50];address: Text[50];postCode: Text[50];phone: Text[30];applicantEmail: Text[100];knownPeriod: Text[50]) status: Text
    // begin
    //            externalApplicants.Reset;
    //            externalApplicants.SetRange(Email,applicantEmail);
    //          if externalApplicants.FindSet then begin
    //            applicantReferee.Init;
    //            applicantReferee.Names:=name;
    //            applicantReferee.Occupation:=occupation;
    //            applicantReferee.Address:=address;
    //            applicantReferee."Post Code":=postCode;
    //            applicantReferee."Telephone No":=phone;
    //            applicantReferee.RefereeEmail:=email;
    //            applicantReferee."Period Known":=knownPeriod;
    //            applicantReferee."E-Mail":=applicantEmail;
    //            applicantReferee.Insert(true);
    //            status:='success';

    //       end
    //       else
    //       begin
    //         status:='error*That application does not exist';

    //         end
    // end;

    // procedure deleteAcademicLineForExternalApplicants(id: Integer;email: Text[100]) status: Text
    // begin
    //     applicantBackground.Reset;
    //     applicantBackground.SetRange("No.",id);
    //     applicantBackground.SetRange(Email,email);
    //     if(applicantBackground.FindSet) then begin
    //       applicantBackground.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure deleteProfessionalLineForExternalApplicants(id: Integer;email: Text[100]) status: Text
    // begin
    //     applicantBackground.Reset;
    //     applicantBackground.SetRange("No.",id);
    //     applicantBackground.SetRange(Email,email);
    //     if(applicantBackground.FindSet) then begin
    //       applicantBackground.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure deleteTrainingLineForExternalApplicants(id: Integer;email: Text[100]) status: Text
    // begin
    //     applicantBackground.Reset;
    //     applicantBackground.SetRange("No.",id);
    //     applicantBackground.SetRange(Email,email);
    //     if(applicantBackground.FindSet) then begin
    //       applicantBackground.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure deleteProffessionalBodyLineForExternalApplicants(id: Integer;email: Text[100]) status: Text
    // begin
    //     applicantBackground.Reset;
    //     applicantBackground.SetRange("No.",id);
    //     applicantBackground.SetRange(Email,email);
    //     if(applicantBackground.FindSet) then begin
    //       applicantBackground.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure deleteEmploymentHistoryLineForExternalApplicants(id: Integer;email: Text[100]) status: Text
    // begin
    //     applicantBackground.Reset;
    //     applicantBackground.SetRange("No.",id);
    //     applicantBackground.SetRange(Email,email);
    //     if(applicantBackground.FindSet) then begin
    //       applicantBackground.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure deleteRefereeLineForExternalApplicants(id: Integer;email: Text[100]) status: Text
    // begin

    //     applicantReferee.Reset;
    //     applicantReferee.SetRange(Code,id);
    //     applicantReferee.SetRange("E-Mail",email);
    //     if(applicantReferee.FindSet) then begin
    //       applicantReferee.Delete(true);
    //       status:='success*Record Successfully deleted';

    //       end
    //       else begin
    //         status:='error*The record does not exist';
    //         end
    // end;

    // procedure applyOnline(email: Text[100];jobId: Text[30]) status: Text
    // begin
    //       jobApplication.Reset;
    //       jobApplication.SetRange(jobApplication.Email,email);
    //       jobApplication.SetRange(jobApplication."Job Id",jobId);
    //       jobApplication.SetRange(jobApplication."Application Status",jobApplication."application status"::Submitted);
    //       if jobApplication.FindSet then begin
    //         status:='error*You seem to have applied for this position.Please try another position.';
    //         end
    //         else begin
    //           externalApplicants.Reset;
    //           externalApplicants.SetRange(Email,email);
    //           if externalApplicants.FindSet then begin
    //             jobApplication.Init;
    //             jobApplication."Application No":='';
    //             jobApplication."First Name" := externalApplicants.FirstName;
    //             jobApplication."Middle Name":= externalApplicants."Middle Name";
    //             jobApplication.Surname:= externalApplicants.LastName;
    //             jobApplication.Gender:= externalApplicants.Gender;
    //             jobApplication."Marital Status":=externalApplicants."Marital Status";
    //             jobApplication."Date of Birth":= externalApplicants."Date Of Birth";
    //             jobApplication."Job Id":= jobId;
    //             jobApplication."Ethnic Origin":=externalApplicants."Ethnic Origin";
    //             jobApplication."ID/Passport":=externalApplicants."ID Number";
    //             jobApplication."Home Phone No.":= externalApplicants."Cell Phone Number";
    //             jobApplication."Postal Address":= externalApplicants."Postal Address";
    //             jobApplication."Postal Code.":= externalApplicants."Post Code";
    //             jobApplication.County:= externalApplicants.County;
    //             jobApplication."Application Date":=Today;
    //             jobApplication.Email:= email;

    //             if jobApplication.Insert(true)  then begin
    //               jobApp.Reset;
    //               jobApp.SetRange(Email,email);
    //               jobApp.SetRange("Job Id",jobId);
    //               jobApp.SetRange("Application Status",jobApp."application status"::Submitted);
    //               if jobApp.FindLast then
    //                 begin
    //                   status:=jobApp."Application No";

    //                   end




    //               end
    //               else begin
    //                 status:='error*An unknown errror occured';
    //                 end
    //             //jobApplication.Salutation:= externalApplicants.Initials;

    //             end



    //           end
    // end;

    // procedure addFavouriteJobs(email: Text[100];jobId: Text[30];jobDesc: Text[100]) Status: Text
    // begin
    //     favouriteJob.Reset;
    //     favouriteJob.SetRange(Email,email);
    //     favouriteJob.SetRange("Job Id",jobId);
    //     if favouriteJob.FindSet then begin
    //       Status:= 'error*This job seem to be in your favourite list.Please try another job.';
    //       end
    //       else
    //       begin
    //         favouriteJob.Init;
    //         favouriteJob.Email:=email;
    //         favouriteJob."Job Description":= jobDesc;
    //         favouriteJob."Job Id":=jobId;
    //         favouriteJob.Insert(true);
    //         Status:='success*Job successfully saved.';

    //         end
    // end;

    // procedure deleteFavouriteJobs(id: Integer;JobId: Text[100]) status: Text
    // begin
    //     favouriteJob.Reset;
    //     favouriteJob.SetRange(Id,id);
    //     favouriteJob.SetRange("Job Id",JobId);
    //     if favouriteJob.FindSet then
    //       begin
    //         favouriteJob.Delete(true);
    //         status:='success*Job successfully deleted.';
    //         end
    //         else
    //         begin
    //           status:='error';
    //           end
    // end;

    // procedure addImprestSharepointLinks(imprestno: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     imprest: Record "Imprest Memo";
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     ImprestMemo.Reset;
    //     ImprestMemo."No.":=imprestno;
    //     if ImprestMemo.Find('=') then
    //     RecordIDNumber:=ImprestMemo.RecordId;
    //     RecordLink."Record ID":=RecordIDNumber;
    //     if RecordLink.Insert(true) then begin
    //       status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end
    //     end;
    // end;

    // procedure addStoreRequsitionSharepointLinks(storerequsitionnumber: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     PurchaseHeader: Record "Purchase Header";
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     PurchaseHeader.Reset;
    //     //PurchaseHeader."No.":=storerequsitionnumber;
    //     PurchaseHeader.SetRange("No.",storerequsitionnumber);
    //     PurchaseHeader.SetRange("Document Type",PurchaseHeader."document type"::"Store Requisition");
    //     if PurchaseHeader.FindSet then
    //     RecordLink."Record ID":=PurchaseHeader.RecordId;
    //     if RecordLink.Insert(true) then begin
    //       status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end
    //     end;
    // end;

    // procedure addStaffClaimSharepointLinks(staffclaimnumber: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     staffclaim.Reset;
    //     staffclaim."No.":=staffclaimnumber;
    //     if staffclaim.Find('=') then
    //     RecordIDNumber:=staffclaim.RecordId;
    //     RecordLink."Record ID":=RecordIDNumber;
    //     if RecordLink.Insert(true) then begin
    //       status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end
    //     end;
    // end;

    // procedure addLeaveSharepointLinks(leaveno: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     leaveapplication: Record "HR Leave Applications";
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     leaveapplication.Reset;
    //     leaveapplication."Application Code":=leaveno;
    //     if leaveapplication.Find('=') then
    //     RecordIDNumber:=leaveapplication.RecordId;
    //     RecordLink."Record ID":=RecordIDNumber;
    //     if RecordLink.Insert(true) then begin
    //       status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end
    //     end;
    // end;

    // procedure addImprestSurrenderSharepointLinks(staffclaimnumber: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     Payments.Reset;
    //     Payments."No.":=staffclaimnumber;
    //     if Payments.Find('=') then
    //     RecordIDNumber:=Payments.RecordId;
    //     RecordLink."Record ID":=RecordIDNumber;
    //     if RecordLink.Insert(true) then begin
    //      status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;

    // procedure addPurchaseRequisitionSharepointLinks(staffclaimnumber: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     PurchaseHeader.Reset;
    //     //PurchaseHeader."No.":=staffclaimnumber;
    //     PurchaseHeader.SetRange("No." ,staffclaimnumber);
    //     PurchaseHeader.SetRange("Document Type",PurchaseHeader."document type"::"Purchase Requisition");
    //     if PurchaseHeader.FindSet then

    //     RecordIDNumber:=PurchaseHeader.RecordId;
    //     RecordLink."Record ID":=RecordIDNumber;
    //     if RecordLink.Insert(true) then begin
    //      status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;

    // procedure addFleetRequisitionSharepointLinks(staffclaimnumber: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    //     TransportRequisition: Record "Transport Requisition";
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     TransportRequisition.Reset;
    //     TransportRequisition."Transport Requisition No":=staffclaimnumber;
    //     if TransportRequisition.Find('=') then
    //     RecordIDNumber:=TransportRequisition.RecordId;
    //     RecordLink."Record ID":=RecordIDNumber;
    //     if RecordLink.Insert(true) then begin
    //      status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;

    // procedure addTrainingRequisitionSharepointLinks(staffclaimnumber: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    //     TransportRequisition: Record "Transport Requisition";
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     TrainingRequisition.Reset;
    //     TrainingRequisition.Code:=staffclaimnumber;
    //     if TrainingRequisition.Find('=') then
    //     RecordIDNumber:=TrainingRequisition.RecordId;
    //     RecordLink."Record ID":=RecordIDNumber;
    //     if RecordLink.Insert(true) then begin
    //      status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;

    // procedure addPettyCashSharepointLinks(staffclaimnumber: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     Payments.Reset;
    //     Payments."No.":=staffclaimnumber;
    //     if Payments.Find('=') then
    //     RecordIDNumber:=Payments.RecordId;
    //     RecordLink."Record ID":=RecordIDNumber;
    //     if RecordLink.Insert(true) then begin
    //      status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;

    // procedure addPettyCashSurrenderSharepointLinks(staffclaimnumber: Code[50];filename: Text;sharepointlink: Text) status: Text
    // var
    //     staffclaim: Record payments;
    //     RecordLink: Record "Record Link";
    //     RecordIDNumber: RecordID;
    // begin
    //     // Create Document Link to Sharepoint **********Obadiah Korir****************
    //     RecordLink.Reset;
    //     if RecordLink."Link ID"=0 then begin
    //     RecordLink.URL1:=sharepointlink;
    //     RecordLink.Description:=filename;
    //     RecordLink.Type:=RecordLink.Type::Link;
    //     RecordLink.Company:=COMPANYNAME;
    //     RecordLink."User ID":=UserId;
    //     RecordLink.Created:=CreateDatetime(Today,Time);
    //     Payments.Reset;
    //     Payments."No.":=staffclaimnumber;
    //     //Payments."Payment Type"::"Petty Cash Surrender";
    //     if Payments.Find('=') then
    //     RecordIDNumber:=Payments.RecordId;
    //     RecordLink."Record ID":=RecordIDNumber;
    //     if RecordLink.Insert(true) then begin
    //      status:='success*Link successfully created';
    //       end else begin
    //         status:='error*An error occured during the process of creating link';
    //         end;
    //     end;
    // end;

    // procedure FnCreateStaffClaimApprovalRequests(employeeno: Code[10];staffClaimNo: Code[10]) status: Text
    // var
    //     Employee: Record Employee;
    //     Payments: Record payments;
    //     PortalApprovalEntry: Record "PortalApproval Entry";
    // begin

    //     Employee.Reset;
    //     Employee.SetRange("No.",employeeno);
    //     if Employee.FindSet then begin
    //       varTableNumber:= 57000;
    //       if Employee."Direct Supervisor"='' then begin
    //         status:='danger*Direct Approver is Missing, Kindly Contact HR';
    //       end else begin
    //        PortalApprovalEntry.Reset;
    //        PortalApprovalEntry.SetRange("Document No.",staffClaimNo);
    //        if PortalApprovalEntry.FindSet then begin
    //        PortalApprovalEntry."Document No.":=staffClaimNo;
    //        PortalApprovalEntry."Document Type":=PortalApprovalEntry."document type"::"staff Claims";
    //        PortalApprovalEntry."Table ID":=varTableNumber;
    //        PortalApprovalEntry."Date-Time Sent for Approval":=CurrentDatetime;
    //        PortalApprovalEntry."Employee Number":=employeeno;
    //        PortalApprovalEntry.Validate("Employee Number");
    //        PortalApprovalEntry."Approver ID":=Employee."Direct Supervisor";
    //        PortalApprovalEntry."Sender ID":=employeeno;
    //        PortalApprovalEntry."Approval Code":=staffClaimNo;
    //        PortalApprovalEntry.Status:=PortalApprovalEntry.Status::Open;
    //        if PortalApprovalEntry.Modify(true) then begin
    //           status:='success*The Approval Request was successfully Modified';
    //         end;
    //         end else begin
    //        PortalApprovalEntry.Init;
    //        PortalApprovalEntry."Document No.":=staffClaimNo;
    //        PortalApprovalEntry."Document Type":=PortalApprovalEntry."document type"::"staff Claims";
    //        PortalApprovalEntry."Table ID":=varTableNumber;
    //        PortalApprovalEntry."Date-Time Sent for Approval":=CurrentDatetime;
    //        PortalApprovalEntry."Last Date-Time Modified":=CurrentDatetime;
    //        PortalApprovalEntry."Employee Number":=employeeno;
    //        PortalApprovalEntry.Validate("Employee Number");
    //        PortalApprovalEntry."Approver ID":=Employee."Direct Supervisor";
    //        PortalApprovalEntry."Sender ID":=employeeno;
    //        PortalApprovalEntry."Approval Code":=staffClaimNo;
    //        PortalApprovalEntry.Status:=PortalApprovalEntry.Status::Open;
    //        if PortalApprovalEntry.Insert(true) then begin
    //           status:='success*The Approval Request was successfully Created';
    //         end else begin
    //         status:='danger*The Staff Claim Number does not exist';
    //         end;
    //         end;
    //         end;
    //         end;
    // end;

    // procedure SuggestLinesFromWorksRequisitionTemplate(docNo: Text[30];templateId: Text[30]) status: Text
    // var
    //     PurchLines: Record "Purchase Line";
    //     RequisitionTempLine: Record "BoQ Template Line1";
    //     RequisitionTempheader: Record "Purchase Requisition Template";
    //     LineNo: Integer;
    // begin

    //     PurchaseHeader.Reset;
    //     PurchaseHeader.SetRange("No.",docNo);
    //     if PurchaseHeader.FindSet then begin
    //       if PurchaseHeader."PRN Type"<>PurchaseHeader."prn type"::"Project Works" then
    //       Error('Purchase Requisition Must be Project Works');

    //       PurchLines.Reset;
    //       PurchLines.SetRange("Document No.",docNo);
    //       PurchLines.SetRange("Document Type",PurchaseHeader."document type"::"Purchase Requisition");
    //     if PurchLines.FindSet then
    //       PurchLines.DeleteAll;

    //     //Transfer the Requisition Template Lines to PRN Lines
    //     RequisitionTempLine.Reset;
    //     RequisitionTempLine.SetRange("BoQ Template ID",templateId);
    //     if RequisitionTempLine.FindSet then begin
    //       repeat
    //         PurchLines.Init;
    //         PurchLines."Document Type":=PurchaseHeader."Document Type";
    //         PurchLines."Document No.":=PurchaseHeader."No.";
    //         PurchLines."Line No.":=PurchLines.Count+1;
    //         PurchLines.Type:=RequisitionTempLine.Type;
    //         PurchLines."No.":=RequisitionTempLine."No.";
    //         PurchLines.Description:=RequisitionTempLine.Description;
    //         PurchLines.Quantity:=RequisitionTempLine.Quantity;
    //         PurchLines."Unit of Measure Code":=RequisitionTempLine."Unit of Measure Code";
    //         //PurchLines.Amount:=RequisitionTempLine."Amount Excl. VAT";
    //         PurchLines."Direct Unit Cost":=RequisitionTempLine."Amount Excl. VAT";
    //         PurchLines."Shortcut Dimension 1 Code":=RequisitionTempLine."Shortcut Dimension 1 Code";
    //         PurchLines."Shortcut Dimension 2 Code":=RequisitionTempLine."Shortcut Dimension 2 Code";
    //         PurchLines."Variant Code":=RequisitionTempLine."Variant Code";
    //         PurchLines."Dimension Set ID":=RequisitionTempLine."Dimension Set ID";
    //         PurchLines."Item Category Code":=RequisitionTempLine."Item Category Code";
    //         PurchLines.Insert(true);
    //         LineNo:=LineNo+10000;
    //         until RequisitionTempLine.Next=0;
    //        status:='success*Lines successfully inserted';

    //     end


    //     end
    // end;

    // procedure SuggestPersonnelEquipmentSpecification(docNo: Text[30];ProjectTemplateId: Text[30];WorkTemplateId: Text[30]) status: Text
    // var
    //     PurchLines: Record "Purchase Line";
    //     RequisitionTempLine: Record "BoQ Template Line1";
    //     RequisitionTempheader: Record "Purchase Requisition Template";
    //     PRNPersonnelSpecification: Record "PRN Personnel Specification";
    //     PRNPersonnelqualification: Record "PRN Personnel Qualification";
    //     PRNPersonnelExperience: Record "PRN Personnel Experience";
    //     PRNEquipmentsSpecification: Record "PRN Equipment Specification";
    //     ProjStaffTemplate: Record "Project Staff Template Line";
    //     ProjStaffExperienceTemplate: Record "Project Staff Template Experie";
    //     ProjStaffQualificationTemplate: Record "Project Staff Template Qualifi";
    //     WorksEquipemntSpecification: Record "Works Equipment Template Line";
    //     Purch: Record "Purchase Header";
    // begin
    //     Purch.Reset;
    //     Purch.SetRange("No.",docNo);
    //     if Purch.FindSet then begin
    //       if Purch."PRN Type"<>Purch."prn type"::"Project Works" then
    //       Error('Purchase Requisition Must be Project Works');

    //     PRNPersonnelSpecification.Reset;
    //     PRNPersonnelSpecification.SetRange("Document No.",docNo);
    //     PRNPersonnelSpecification.SetRange("Document Type",PRNPersonnelSpecification."document type"::"Purchase Requisition");
    //     if PRNPersonnelSpecification.FindSet then
    //       PRNPersonnelSpecification.DeleteAll;

    //       //Transfer the Requisition Template Lines to PRN Lines
    //     ProjStaffTemplate.Reset;
    //     ProjStaffTemplate.SetRange("Key Staff Template ID",ProjectTemplateId);
    //     if ProjStaffTemplate.FindSet then begin
    //      // PRNPersonnelSpecification.
    //       repeat
    //         //Creation of PRN Personnel Specification details
    //         PRNPersonnelSpecification.Init;
    //         PRNPersonnelSpecification."Document Type":=Purch."Document Type";
    //         PRNPersonnelSpecification."Document No.":=Purch."No.";
    //         PRNPersonnelSpecification."Staff Role Code":=ProjStaffTemplate."Project Role Code";
    //         PRNPersonnelSpecification."Title/Designation Description":=ProjStaffTemplate.Description;
    //         PRNPersonnelSpecification."Staff Category":=ProjStaffTemplate."Staff Category";
    //         PRNPersonnelSpecification."Min No. of Recomm Staff":=ProjStaffTemplate."Min No. of Recomm Staff";
    //         PRNPersonnelSpecification.Insert(true);

    //        until ProjStaffTemplate.Next=0;

    //     end;
    //     PRNPersonnelExperience.SetRange("Document No.",docNo);
    //     PRNPersonnelExperience.SetRange("Document Type",PRNPersonnelExperience."document type"::"Purchase Requisition");
    //     if PRNPersonnelExperience.FindSet then
    //       PRNPersonnelExperience.DeleteAll;
    //     //Creation of PRN Personnel Experience details
    //     ProjStaffExperienceTemplate.Reset;
    //     ProjStaffExperienceTemplate.SetRange("Key Staff Template ID",ProjectTemplateId);
    //     if ProjStaffExperienceTemplate.FindSet then begin
    //       repeat
    //         PRNPersonnelExperience.Init;
    //         PRNPersonnelExperience."Document Type":=Purch."Document Type";
    //         PRNPersonnelExperience."Document No.":=Purch."No.";
    //         PRNPersonnelExperience."Staff Role Code":=ProjStaffExperienceTemplate."Project Role Code";
    //         PRNPersonnelExperience."Experience Category":=ProjStaffExperienceTemplate."Experience Category";
    //         PRNPersonnelExperience."Entry No":=ProjStaffExperienceTemplate."Entry No";
    //         PRNPersonnelExperience."Minimum Years of Experience":=ProjStaffExperienceTemplate."Minimum Years of Experience";
    //         PRNPersonnelExperience."Minimum Experience Req":=ProjStaffExperienceTemplate."Minimum Experience Req";
    //         PRNPersonnelExperience.Insert(true);

    //         until ProjStaffExperienceTemplate.Next=0;
    //       end;

    //     //Creation of PRN Personnel Qualification details

    //     PRNPersonnelqualification.SetRange("Document No.",docNo);
    //     PRNPersonnelqualification.SetRange("Document Type",PRNPersonnelqualification."document type"::"Purchase Requisition");
    //     if PRNPersonnelqualification.FindSet then
    //       PRNPersonnelqualification.DeleteAll;

    //     ProjStaffQualificationTemplate.Reset;
    //     ProjStaffQualificationTemplate.SetRange("Key Staff Template ID",ProjectTemplateId);
    //     if ProjStaffQualificationTemplate.FindSet then begin
    //       repeat
    //         PRNPersonnelqualification.Init;
    //         PRNPersonnelqualification."Document Type":=Purch."Document Type";
    //         PRNPersonnelqualification."Document No.":=Purch."No.";
    //         PRNPersonnelqualification."Staff Role Code":=ProjStaffQualificationTemplate."Project Role Code";
    //         PRNPersonnelqualification."Entry No":=ProjStaffQualificationTemplate."Entry No";
    //         PRNPersonnelqualification."Qualification Category":=ProjStaffQualificationTemplate."Qualification Category";
    //         PRNPersonnelqualification."Minimum Qualification Req":=ProjStaffQualificationTemplate."Minimum Qualification Req";
    //         PRNPersonnelqualification.Insert(true);

    //         until ProjStaffQualificationTemplate.Next=0;
    //       end;

    //     //Creation of PRN Equipment Specifications
    //     PRNEquipmentsSpecification.SetRange("Document No.",docNo);
    //     PRNEquipmentsSpecification.SetRange("Document Type",PRNEquipmentsSpecification."document type"::"Purchase Requisition");
    //     if PRNEquipmentsSpecification.FindSet then
    //       PRNEquipmentsSpecification.DeleteAll;
    //     WorksEquipemntSpecification.Reset;
    //     WorksEquipemntSpecification.SetRange("Equipment Template ID",WorkTemplateId);
    //     if WorksEquipemntSpecification.FindSet then begin
    //       repeat
    //         PRNEquipmentsSpecification.Init;
    //         PRNEquipmentsSpecification."Document Type":=Purch."Document Type";
    //         PRNEquipmentsSpecification."Document No.":=Purch."No.";
    //         PRNEquipmentsSpecification."Equipment Type":=WorksEquipemntSpecification."Equipment Type";
    //         PRNEquipmentsSpecification.Category:=WorksEquipemntSpecification.Category;
    //         PRNEquipmentsSpecification.Description:=WorksEquipemntSpecification.Description;
    //         PRNEquipmentsSpecification."Minimum Required Qty":=WorksEquipemntSpecification."Minimum Required Qty";
    //         PRNEquipmentsSpecification.Insert(true);
    //         until WorksEquipemntSpecification.Next=0;

    //       end;
    //     status:='success*Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly'+Purch."No.";

    //       end
    //     /*IF Purch."PRN Type"<>Purch."PRN Type"::"Project Works" THEN
    //       ERROR('Purchase Requisition Must be Project Works');

    //     //Transfer the Requisition Template Lines to PRN Lines
    //     ProjStaffTemplate.RESET;
    //     ProjStaffTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     IF ProjStaffTemplate.FINDSET THEN BEGIN
    //       REPEAT
    //         //Creation of PRN Personnel Specification details
    //         PRNPersonnelSpecification.INIT;
    //         PRNPersonnelSpecification."Document Type":=Purch."Document Type";
    //         PRNPersonnelSpecification."Document No.":=Purch."No.";
    //         PRNPersonnelSpecification."Staff Role Code":=ProjStaffTemplate."Project Role Code";
    //         PRNPersonnelSpecification."Title/Designation Description":=ProjStaffTemplate.Description;
    //         PRNPersonnelSpecification."Staff Category":=ProjStaffTemplate."Staff Category";
    //         PRNPersonnelSpecification."Min No. of Recomm Staff":=ProjStaffTemplate."Min No. of Recomm Staff";
    //         PRNPersonnelSpecification.INSERT(TRUE);

    //        UNTIL ProjStaffTemplate.NEXT=0;

    //     END;

    //     //Creation of PRN Personnel Experience details
    //     ProjStaffExperienceTemplate.RESET;
    //     ProjStaffExperienceTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     IF ProjStaffExperienceTemplate.FINDSET THEN BEGIN
    //       REPEAT
    //         PRNPersonnelExperience.INIT;
    //         PRNPersonnelExperience."Document Type":=Purch."Document Type";
    //         PRNPersonnelExperience."Document No.":=Purch."No.";
    //         PRNPersonnelExperience."Staff Role Code":=ProjStaffExperienceTemplate."Project Role Code";
    //         PRNPersonnelExperience."Experience Category":=ProjStaffExperienceTemplate."Experience Category";
    //         PRNPersonnelExperience."Entry No":=ProjStaffExperienceTemplate."Entry No";
    //         PRNPersonnelExperience."Minimum Years of Experience":=ProjStaffExperienceTemplate."Minimum Years of Experience";
    //         PRNPersonnelExperience."Minimum Experience Req":=ProjStaffExperienceTemplate."Minimum Experience Req";
    //         PRNPersonnelExperience.INSERT(TRUE);

    //         UNTIL ProjStaffExperienceTemplate.NEXT=0;
    //       END;

    //     //Creation of PRN Personnel Qualification details

    //     ProjStaffQualificationTemplate.RESET;
    //     ProjStaffQualificationTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     IF ProjStaffQualificationTemplate.FINDSET THEN BEGIN
    //       REPEAT
    //         PRNPersonnelqualification.INIT;
    //         PRNPersonnelqualification."Document Type":=Purch."Document Type";
    //         PRNPersonnelqualification."Document No.":=Purch."No.";
    //         PRNPersonnelqualification."Staff Role Code":=ProjStaffQualificationTemplate."Project Role Code";
    //         PRNPersonnelqualification."Entry No":=ProjStaffQualificationTemplate."Entry No";
    //         PRNPersonnelqualification."Qualification Category":=ProjStaffQualificationTemplate."Qualification Category";
    //         PRNPersonnelqualification."Minimum Qualification Req":=ProjStaffQualificationTemplate."Minimum Qualification Req";
    //         PRNPersonnelqualification.INSERT(TRUE);

    //         UNTIL ProjStaffQualificationTemplate.NEXT=0;
    //       END;

    //     //Creation of PRN Equipment Specifications
    //     WorksEquipemntSpecification.RESET;
    //     WorksEquipemntSpecification.SETRANGE("Equipment Template ID",Purch."Works Equipment Template ID");
    //     IF WorksEquipemntSpecification.FINDSET THEN BEGIN
    //       REPEAT
    //         PRNEquipmentsSpecification.INIT;
    //         PRNEquipmentsSpecification."Document Type":=Purch."Document Type";
    //         PRNEquipmentsSpecification."Document No.":=Purch."No.";
    //         PRNEquipmentsSpecification."Equipment Type":=WorksEquipemntSpecification."Equipment Type";
    //         PRNEquipmentsSpecification.Category:=WorksEquipemntSpecification.Category;
    //         PRNEquipmentsSpecification.Description:=WorksEquipemntSpecification.Description;
    //         PRNEquipmentsSpecification."Minimum Required Qty":=WorksEquipemntSpecification."Minimum Required Qty";
    //         PRNEquipmentsSpecification.INSERT(TRUE);
    //         UNTIL WorksEquipemntSpecification.NEXT=0;

    //       END;
    //     MESSAGE('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly',Purch."No.");
    //     */

    // end;

    // procedure suggestLinesFromRequisitionTemplate(docNo: Text[30];templateId: Text[30]) status: Text
    // var
    //     PurchLines: Record "Purchase Line";
    //     RequisitionTempLine: Record "BoQ Template Line1";
    //     RequisitionTempheader: Record "Purchase Requisition Template";
    //     LineNo: Integer;
    // begin

    //     PurchaseHeader.Reset;
    //     PurchaseHeader.SetRange("No.",docNo);
    //     if PurchaseHeader.FindSet then begin
    //       if PurchaseHeader."PRN Type"<>PurchaseHeader."prn type"::Standard then
    //       Error('Purchase Requisition Must be Standard');

    //       PurchLines.Reset;
    //       PurchLines.SetRange("Document Type",PurchaseHeader."document type"::"Purchase Requisition");
    //       PurchLines.SetRange("Document No.",docNo);

    //     if PurchLines.FindSet then
    //       PurchLines.DeleteAll;

    //     //Transfer the Requisition Template Lines to PRN Lines
    //     RequisitionTempLine.Reset;
    //     RequisitionTempLine.SetRange("BoQ Template ID",templateId);
    //     if RequisitionTempLine.FindSet then begin
    //       repeat
    //         PurchLines.Init;
    //         PurchLines."Document Type":=PurchaseHeader."Document Type";
    //         PurchLines."Document No.":=PurchaseHeader."No.";
    //         PurchLines."Line No.":=PurchLines.Count+1;
    //         PurchLines.Type:=RequisitionTempLine.Type;
    //         PurchLines."No.":=RequisitionTempLine."No.";
    //         PurchLines.Description:=RequisitionTempLine.Description;
    //         PurchLines.Quantity:=RequisitionTempLine.Quantity;
    //         PurchLines."Unit of Measure Code":=RequisitionTempLine."Unit of Measure Code";
    //         //PurchLines.Amount:=RequisitionTempLine."Amount Excl. VAT";
    //         PurchLines."Direct Unit Cost":=RequisitionTempLine."Amount Excl. VAT";
    //         PurchLines."Shortcut Dimension 1 Code":=RequisitionTempLine."Shortcut Dimension 1 Code";
    //         PurchLines."Shortcut Dimension 2 Code":=RequisitionTempLine."Shortcut Dimension 2 Code";
    //         PurchLines."Variant Code":=RequisitionTempLine."Variant Code";
    //         PurchLines."Dimension Set ID":=RequisitionTempLine."Dimension Set ID";
    //         PurchLines."Item Category Code":=RequisitionTempLine."Item Category Code";
    //         PurchLines.Insert(true);
    //         LineNo:=LineNo+10000;
    //         until RequisitionTempLine.Next=0;
    //        status:='success*Lines successfully inserted';

    //     end


    //     end
    // end;

    // procedure updateRequisitionLines(id: Integer;reqNo: Text[30];amount: Decimal;qty: Decimal) status: Text
    // var
    //     PurchaseLine: Record "Purchase Line";
    // begin
    //     PurchaseLine.Reset;
    //     PurchaseLine.SetRange("Line No.",id);
    //     PurchaseLine.SetRange("Document No.",reqNo);
    //     PurchaseLine.SetRange("Document Type",PurchaseLine."document type"::"Purchase Requisition");
    //     if PurchaseLine.FindSet then begin
    //       PurchaseLine.Amount:=amount;
    //       PurchaseLine."Qty. Requested":=qty;
    //       PurchaseLine.Modify;
    //       status:='success*Rows successfully updated';

    //       end
    //       else begin
    //         status:='error*an error occured';
    //         end
    // end;

    // procedure deletePurchaseRequisitionLines(id: Integer;reqNo: Text[30]) status: Text
    // var
    //     PurchaseLine: Record "Purchase Line";
    // begin
    //     PurchaseLine.Reset;
    //     PurchaseLine.SetRange("Line No.",id);
    //     PurchaseLine.SetRange("Document No.",reqNo);
    //     PurchaseLine.SetRange("Document Type",PurchaseLine."document type"::"Purchase Requisition");
    //     if PurchaseLine.FindSet then begin

    //       PurchaseLine.Delete;
    //       status:='success*Rows successfully deleted';

    //       end
    //       else begin
    //         status:='error*an error occured';
    //         end



    //     /*
    //     IF Purch."PRN Type"<>Purch."PRN Type"::"Project Works" THEN
    //       ERROR('Purchase Requisition Must be Project Works');

    //     //Transfer the Requisition Template Lines to PRN Lines
    //     ProjStaffTemplate.RESET;
    //     ProjStaffTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     IF ProjStaffTemplate.FINDSET THEN BEGIN
    //       REPEAT
    //         //Creation of PRN Personnel Specification details
    //         PRNPersonnelSpecification.INIT;
    //         PRNPersonnelSpecification."Document Type":=Purch."Document Type";
    //         PRNPersonnelSpecification."Document No.":=Purch."No.";
    //         PRNPersonnelSpecification."Staff Role Code":=ProjStaffTemplate."Project Role Code";
    //         PRNPersonnelSpecification."Title/Designation Description":=ProjStaffTemplate.Description;
    //         PRNPersonnelSpecification."Staff Category":=ProjStaffTemplate."Staff Category";
    //         PRNPersonnelSpecification."Min No. of Recomm Staff":=ProjStaffTemplate."Min No. of Recomm Staff";
    //         PRNPersonnelSpecification.INSERT(TRUE);

    //        UNTIL ProjStaffTemplate.NEXT=0;

    //     END;

    //     //Creation of PRN Personnel Experience details
    //     ProjStaffExperienceTemplate.RESET;
    //     ProjStaffExperienceTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     IF ProjStaffExperienceTemplate.FINDSET THEN BEGIN
    //       REPEAT
    //         PRNPersonnelExperience.INIT;
    //         PRNPersonnelExperience."Document Type":=Purch."Document Type";
    //         PRNPersonnelExperience."Document No.":=Purch."No.";
    //         PRNPersonnelExperience."Staff Role Code":=ProjStaffExperienceTemplate."Project Role Code";
    //         PRNPersonnelExperience."Experience Category":=ProjStaffExperienceTemplate."Experience Category";
    //         PRNPersonnelExperience."Entry No":=ProjStaffExperienceTemplate."Entry No";
    //         PRNPersonnelExperience."Minimum Years of Experience":=ProjStaffExperienceTemplate."Minimum Years of Experience";
    //         PRNPersonnelExperience."Minimum Experience Req":=ProjStaffExperienceTemplate."Minimum Experience Req";
    //         PRNPersonnelExperience.INSERT(TRUE);

    //         UNTIL ProjStaffExperienceTemplate.NEXT=0;
    //       END;

    //     //Creation of PRN Personnel Qualification details

    //     ProjStaffQualificationTemplate.RESET;
    //     ProjStaffQualificationTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     IF ProjStaffQualificationTemplate.FINDSET THEN BEGIN
    //       REPEAT
    //         PRNPersonnelqualification.INIT;
    //         PRNPersonnelqualification."Document Type":=Purch."Document Type";
    //         PRNPersonnelqualification."Document No.":=Purch."No.";
    //         PRNPersonnelqualification."Staff Role Code":=ProjStaffQualificationTemplate."Project Role Code";
    //         PRNPersonnelqualification."Entry No":=ProjStaffQualificationTemplate."Entry No";
    //         PRNPersonnelqualification."Qualification Category":=ProjStaffQualificationTemplate."Qualification Category";
    //         PRNPersonnelqualification."Minimum Qualification Req":=ProjStaffQualificationTemplate."Minimum Qualification Req";
    //         PRNPersonnelqualification.INSERT(TRUE);

    //         UNTIL ProjStaffQualificationTemplate.NEXT=0;
    //       END;

    //     //Creation of PRN Equipment Specifications
    //     WorksEquipemntSpecification.RESET;
    //     WorksEquipemntSpecification.SETRANGE("Equipment Template ID",Purch."Works Equipment Template ID");
    //     IF WorksEquipemntSpecification.FINDSET THEN BEGIN
    //       REPEAT
    //         PRNEquipmentsSpecification.INIT;
    //         PRNEquipmentsSpecification."Document Type":=Purch."Document Type";
    //         PRNEquipmentsSpecification."Document No.":=Purch."No.";
    //         PRNEquipmentsSpecification."Equipment Type":=WorksEquipemntSpecification."Equipment Type";
    //         PRNEquipmentsSpecification.Category:=WorksEquipemntSpecification.Category;
    //         PRNEquipmentsSpecification.Description:=WorksEquipemntSpecification.Description;
    //         PRNEquipmentsSpecification."Minimum Required Qty":=WorksEquipemntSpecification."Minimum Required Qty";
    //         PRNEquipmentsSpecification.INSERT(TRUE);
    //         UNTIL WorksEquipemntSpecification.NEXT=0;

    //       END;
    //     MESSAGE('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly',Purch."No.");

    //     */

    // end;

    // procedure addProjectDetails(docNo: Text[100];ProjectTemplateId: Text[100];WorkTemplate: Text[100];RoadCode: Text[100];LinkName: Text[100];Constituency: Text[100];WorkLength: Decimal) status: Text
    // begin
    //     PurchaseHeader.Reset;
    //     PurchaseHeader.SetRange("No.",docNo);
    //     PurchaseHeader.SetRange("Document Type",PurchaseHeader."document type"::"Purchase Requisition");
    //     if PurchaseHeader.FindSet then begin
    //       PurchaseHeader."Project Staffing Template ID":=ProjectTemplateId;
    //       PurchaseHeader."Works Equipment Template ID":=WorkTemplate;
    //       PurchaseHeader."Road Code":= RoadCode;
    //       PurchaseHeader.Validate("Road Code");
    //       PurchaseHeader."Link Name":= LinkName;
    //       PurchaseHeader."Works Length (Km)":=WorkLength;
    //       PurchaseHeader.Consitituency:= Constituency;
    //       PurchaseHeader.Modify;
    //       status:='success*Project details successfully saved';
    //       end
    //       else begin
    //         status:='error*Document with No %1, does not exist'+docNo;
    //         end
    // end;


    // procedure SuggestPRNPersonnel_equipmentSpecification(Purch: Record "Purchase Header")
    // var
    //     PurchLines: Record "Purchase Line";
    //     RequisitionTempLine: Record "BoQ Template Line1";
    //     RequisitionTempheader: Record "Purchase Requisition Template";
    //     PRNPersonnelSpecification: Record "PRN Personnel Specification";
    //     PRNPersonnelqualification: Record "PRN Personnel Qualification";
    //     PRNPersonnelExperience: Record "PRN Personnel Experience";
    //     PRNEquipmentsSpecification: Record "PRN Equipment Specification";
    //     ProjStaffTemplate: Record "Project Staff Template Line";
    //     ProjStaffExperienceTemplate: Record "Project Staff Template Experie";
    //     ProjStaffQualificationTemplate: Record "Project Staff Template Qualifi";
    //     WorksEquipemntSpecification: Record "Works Equipment Template Line";
    // begin
    //     Purch.TestField("PRN Type");
    //     if Purch."PRN Type"<>Purch."prn type"::"Project Works" then
    //       Error('Purchase Requisition Must be Project Works');

    //     //Transfer the Requisition Template Lines to PRN Lines
    //     ProjStaffTemplate.Reset;
    //     ProjStaffTemplate.SetRange("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     if ProjStaffTemplate.FindSet then begin
    //       repeat
    //         //Creation of PRN Personnel Specification details
    //         PRNPersonnelSpecification.Init;
    //         PRNPersonnelSpecification."Document Type":=Purch."Document Type";
    //         PRNPersonnelSpecification."Document No.":=Purch."No.";
    //         PRNPersonnelSpecification."Staff Role Code":=ProjStaffTemplate."Project Role Code";
    //         PRNPersonnelSpecification."Title/Designation Description":=ProjStaffTemplate.Description;
    //         PRNPersonnelSpecification."Staff Category":=ProjStaffTemplate."Staff Category";
    //         PRNPersonnelSpecification."Min No. of Recomm Staff":=ProjStaffTemplate."Min No. of Recomm Staff";
    //         PRNPersonnelSpecification.Insert(true);

    //        until ProjStaffTemplate.Next=0;

    //     end;

    //     //Creation of PRN Personnel Experience details
    //     ProjStaffExperienceTemplate.Reset;
    //     ProjStaffExperienceTemplate.SetRange("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     if ProjStaffExperienceTemplate.FindSet then begin
    //       repeat
    //         PRNPersonnelExperience.Init;
    //         PRNPersonnelExperience."Document Type":=Purch."Document Type";
    //         PRNPersonnelExperience."Document No.":=Purch."No.";
    //         PRNPersonnelExperience."Staff Role Code":=ProjStaffExperienceTemplate."Project Role Code";
    //         PRNPersonnelExperience."Experience Category":=ProjStaffExperienceTemplate."Experience Category";
    //         PRNPersonnelExperience."Entry No":=ProjStaffExperienceTemplate."Entry No";
    //         PRNPersonnelExperience."Minimum Years of Experience":=ProjStaffExperienceTemplate."Minimum Years of Experience";
    //         PRNPersonnelExperience."Minimum Experience Req":=ProjStaffExperienceTemplate."Minimum Experience Req";
    //         PRNPersonnelExperience.Insert(true);

    //         until ProjStaffExperienceTemplate.Next=0;
    //       end;

    //     //Creation of PRN Personnel Qualification details

    //     ProjStaffQualificationTemplate.Reset;
    //     ProjStaffQualificationTemplate.SetRange("Key Staff Template ID",Purch."Project Staffing Template ID");
    //     if ProjStaffQualificationTemplate.FindSet then begin
    //       repeat
    //         PRNPersonnelqualification.Init;
    //         PRNPersonnelqualification."Document Type":=Purch."Document Type";
    //         PRNPersonnelqualification."Document No.":=Purch."No.";
    //         PRNPersonnelqualification."Staff Role Code":=ProjStaffQualificationTemplate."Project Role Code";
    //         PRNPersonnelqualification."Entry No":=ProjStaffQualificationTemplate."Entry No";
    //         PRNPersonnelqualification."Qualification Category":=ProjStaffQualificationTemplate."Qualification Category";
    //         PRNPersonnelqualification."Minimum Qualification Req":=ProjStaffQualificationTemplate."Minimum Qualification Req";
    //         PRNPersonnelqualification.Insert(true);

    //         until ProjStaffQualificationTemplate.Next=0;
    //       end;

    //     //Creation of PRN Equipment Specifications
    //     WorksEquipemntSpecification.Reset;
    //     WorksEquipemntSpecification.SetRange("Equipment Template ID",Purch."Works Equipment Template ID");
    //     if WorksEquipemntSpecification.FindSet then begin
    //       repeat
    //         PRNEquipmentsSpecification.Init;
    //         PRNEquipmentsSpecification."Document Type":=Purch."Document Type";
    //         PRNEquipmentsSpecification."Document No.":=Purch."No.";
    //         PRNEquipmentsSpecification."Equipment Type":=WorksEquipemntSpecification."Equipment Type";
    //         PRNEquipmentsSpecification.Category:=WorksEquipemntSpecification.Category;
    //         PRNEquipmentsSpecification.Description:=WorksEquipemntSpecification.Description;
    //         PRNEquipmentsSpecification."Minimum Required Qty":=WorksEquipemntSpecification."Minimum Required Qty";
    //         PRNEquipmentsSpecification.Insert(true);
    //         until WorksEquipemntSpecification.Next=0;

    //       end;
    //     Message('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly',Purch."No.");
    // end;

    // procedure updatePersonnelSpecifications(id: Integer;docNo: Text[50];noOfStafff: Integer;desc: Text[200]) status: Text
    // var
    //     PersonnelSpecification: Record "PRN Personnel Specification";
    // begin
    //     PersonnelSpecification.Reset;
    //     PersonnelSpecification.SetRange("Entry No",id);
    //     PersonnelSpecification.SetRange("Document No.",docNo);
    //     PersonnelSpecification.SetRange("Title/Designation Description",desc);
    //     if PersonnelSpecification.FindSet then begin
    //       PersonnelSpecification."Min No. of Recomm Staff":=noOfStafff;
    //       PersonnelSpecification.Modify;
    //       status:='success*Record successfully updated';
    //       end else begin
    //         status:='error*Record with document number'+docNo+ ' does not exist';
    //         end
    // end;

    // procedure deletePersonnelSpecifications(id: Integer;docNo: Text[50];desc: Text) status: Text
    // var
    //     PersonnelSpecification: Record "PRN Personnel Specification";
    // begin
    //     PersonnelSpecification.Reset;
    //     PersonnelSpecification.SetRange("Entry No",id);
    //     PersonnelSpecification.SetRange("Document No.",docNo);
    //     PersonnelSpecification.SetRange("Title/Designation Description",desc);
    //     if PersonnelSpecification.FindSet then begin
    //       PersonnelSpecification.Delete;
    //       status:='success*Record successfully deleted';
    //       end else begin
    //         status:='error*Record with document number'+docNo+ ' does not exist';
    //         end
    // end;

    // procedure updateEquipmentSpecifications(id: Integer;docNo: Text[50];qty: Decimal) status: Text
    // var
    //     EquipmentSpecification: Record "PRN Equipment Specification";
    // begin
    //     EquipmentSpecification.Reset;
    //     EquipmentSpecification.SetRange(Id,id);
    //     EquipmentSpecification.SetRange("Document No.",docNo);
    //     if EquipmentSpecification.FindSet then begin
    //       EquipmentSpecification."Minimum Required Qty":=qty;
    //       EquipmentSpecification.Modify;
    //       status:='success*Record successfully updated';
    //       end else begin
    //         status:='error*Record with document number'+docNo+ ' does not exist';
    //         end

    // end;

    // procedure deleteEquipmentSpecifications(id: Integer;docNo: Text[50]) status: Text
    // var
    //     EquipmentSpecification: Record "PRN Equipment Specification";
    // begin
    //     EquipmentSpecification.Reset;
    //     EquipmentSpecification.SetRange(Id,id);
    //     EquipmentSpecification.SetRange("Document No.",docNo);
    //     if EquipmentSpecification.FindSet then begin
    //       EquipmentSpecification.Delete;
    //       status:='success*Record successfully deleted';
    //       end else begin
    //         status:='error*Record with document number'+docNo+ ' does not exist';
    //         end
    // end;

    // procedure AddVehicleMaintenanceRequestDetails(employeeNo: Code[10];region: Code[10];registrationnumber: Code[10];odometerreading: Decimal;servicetype: Integer;description: Text;fundingcode: Code[10];projectnumber: Code[10];budgetline: Code[10];maintenancecost: Code[10];vendornumber: Code[10];tservicecode: Text) status: Text
    // var
    //     FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
    //     FleetManagementSetup: Record "Fleet Management Setup";
    //     NoSeriesManagement: Codeunit NoSeriesManagement;
    // begin
    //         FleetManagementSetup.Get;
    //         FuelMaintenanceRequisition.Init;
    //         FuelMaintenanceRequisition."Requisition No":=NoSeriesManagement.GetNextNo(FleetManagementSetup."Maintenance Request",Today,true);
    //         FuelMaintenanceRequisition."Vehicle Reg No":= registrationnumber;
    //         FuelMaintenanceRequisition."Shortcut Dimension 1 Code":=region;
    //         FuelMaintenanceRequisition.Validate("Vehicle Reg No");
    //         FuelMaintenanceRequisition."Odometer Reading":=odometerreading;
    //         FuelMaintenanceRequisition."Service Type":=servicetype;
    //         FuelMaintenanceRequisition."Shortcut Dimension 2 Code":=fundingcode;
    //         FuelMaintenanceRequisition."Service Code":=tservicecode;
    //         FuelMaintenanceRequisition.Validate("Service Code");
    //         FuelMaintenanceRequisition."Employee No":=employeeNo;
    //         FuelMaintenanceRequisition.Description:=description;
    //         FuelMaintenanceRequisition."Project Name":=projectnumber;
    //         //FuelMaintenanceRequisition."Task Number":=budgetline;
    //         //FuelMaintenanceRequisition.M:=maintenancecost;
    //         FuelMaintenanceRequisition."Vendor(Dealer)":=vendornumber;
    //         FuelMaintenanceRequisition.Validate("Vendor(Dealer)");
    //         FuelMaintenanceRequisition.Type:=FuelMaintenanceRequisition.Type::Maintenance;
    //         if FuelMaintenanceRequisition.Insert(true) then begin
    //            status:='success*The Vehicle Maintenance Request was successfully submitted*'+FuelMaintenanceRequisition."Requisition No";
    //           end else begin
    //              status:='danger*The Vehicle Maintenance Request could not be submitted';
    //             end;
    //           exit(status);
    // end;

    // procedure SendVehicleMaintenancetforApproval(docNo: Code[100]) status: Text
    // var
    //     FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     FuelMaintenanceRequisition1: Record "Fuel & Maintenance Requisition";
    // begin
    //     FuelMaintenanceRequisition.Reset;
    //     FuelMaintenanceRequisition.SetRange("Requisition No",docNo);
    //     FuelMaintenanceRequisition.SetRange(Status,FuelMaintenanceRequisition.Status::Open);
    //     if FuelMaintenanceRequisition.FindSet then begin
    //      //IF ApprovalsMgmt.CheckMaintenaceApprovalPossible(FuelMaintenanceRequisition) THEN
    //       //ApprovalsMgmt.OnSendMaintenaceForApproval(FuelMaintenanceRequisition);
    //         FuelMaintenanceRequisition1.Reset;
    //         FuelMaintenanceRequisition1.SetRange("Requisition No", docNo);
    //         if FuelMaintenanceRequisition1.FindSet then begin
    //           if FuelMaintenanceRequisition1.Status = FuelMaintenanceRequisition1.Status::"Pending Approval" then begin
    //             status:='success*The Vehicle Maintenance request was successfully sent for approval';
    //             end else begin
    //             status:='success*The Vehicle Maintenance request was already approved on is no longer Pending Approval';
    //               end;
    //           end else begin
    //         status:='danger* New Vehicle Maintenance request with the given number does not exist';
    //         end;
    //         end else begin
    //         status:='error* Either New File Movement Number does not exist or it is no longer open';
    //         end
    // end;

    // procedure AddFuelRequisitionDetails(employeeNo: Code[10];fueltype: Integer;vendornumber: Code[10];litersrequested: Decimal;vehicleregistration: Code[10];mileage: Decimal;pricerperLiter: Decimal;Driver: Code[50]) status: Text
    // var
    //     FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
    //     FleetManagementSetup: Record "Fleet Management Setup";
    //     NoSeriesManagement: Codeunit NoSeriesManagement;
    // begin
    //         FleetManagementSetup.Get;
    //         FuelMaintenanceRequisition.Init;
    //         FuelMaintenanceRequisition.Type:=FuelMaintenanceRequisition.Type::Fuel;
    //         FuelMaintenanceRequisition."Requisition No":=NoSeriesManagement.GetNextNo(FleetManagementSetup."Fuel Register",Today,true);
    //         FuelMaintenanceRequisition."Vehicle Reg No":= vehicleregistration;
    //         FuelMaintenanceRequisition.Validate("Vehicle Reg No");
    //         FuelMaintenanceRequisition."Vendor(Dealer)":=vendornumber;
    //         FuelMaintenanceRequisition.Validate("Vendor(Dealer)");
    //         FuelMaintenanceRequisition."Type of Fuel":=fueltype;
    //         FuelMaintenanceRequisition."Employee No":=employeeNo;
    //         FuelMaintenanceRequisition.Mileage:=mileage;
    //         FuelMaintenanceRequisition."Litres of Oil":=litersrequested;
    //         FuelMaintenanceRequisition."Price/Litre":=pricerperLiter;
    //         FuelMaintenanceRequisition.Validate("Price/Litre");
    //         FuelMaintenanceRequisition.Driver:=Driver;
    //         FuelMaintenanceRequisition.Validate(Driver);
    //         if FuelMaintenanceRequisition.Insert(true) then begin
    //            status:='success*The Vehicle Fuel  Request was successfully submitted*'+FuelMaintenanceRequisition."Requisition No";
    //           end else begin
    //              status:='danger*The Vehicle Fuel Request could not be submitted';
    //             end;
    //           exit(status);
    // end;

    // procedure SendVehicleRequisitionApproval(imprestNumber: Code[20]) status: Text
    // begin
    // end;

    // procedure CloseDriverOpenTrips(requisitionNumber: Code[50]) status: Text
    // var
    //     TransportRequisition: Record "Transport Requisition";
    // begin

    //     TransportRequisition.Reset;
    //     TransportRequisition.SetRange("Transport Requisition No",requisitionNumber);
    //     TransportRequisition.SetRange(TransportRequisition.Status,TransportRequisition.Status::Approved);
    //     if TransportRequisition.FindSet then begin
    //           TransportRequisition.Status := TransportRequisition.Status::Closed;
    //           TransportRequisition.Selected := false;
    //           if TransportRequisition.Modify(true) then begin
    //         status:='success*The Trip has been successully closed';
    //       end else begin
    //        status:='danger*The Trip was not successully closed';
    //     end;
    //     end;
    // end;

    // procedure AddDriverAllocations(requisitionNumber: Code[50];driverCode: Code[50];dateofTrip: Date;vehiclenumber: Code[50];noofdays: Integer) status: Text
    // var
    //     VehicleDriversAllocation: Record "Vehicle Driver Allocation";
    //     TransportRequisition: Record "Transport Requisition";
    //     NonKeRRADriverAllocation: Record "Non-KeRRA Driver Allocation";
    // begin

    //     TransportRequisition.Reset;
    //     TransportRequisition.SetRange("Transport Requisition No",requisitionNumber);
    //     if TransportRequisition.FindSet then begin
    //     VehicleDriversAllocation.Init;
    //     VehicleDriversAllocation."Requisition Number":=requisitionNumber;
    //     VehicleDriversAllocation."Driver Code":=driverCode;
    //     VehicleDriversAllocation.Validate("Driver Code");
    //     VehicleDriversAllocation."Registration Number":=vehiclenumber;
    //     VehicleDriversAllocation.Validate("Registration Number");
    //     if VehicleDriversAllocation.Insert(true) then begin
    //       status:='success*The Driver has been allocated Successfully';
    //       end else begin
    //         status:='danger*The Driver could not be allocated Successfully';
    //       end;
    //       end;
    // end;

    // procedure AddNonKeRRADriverAllocations(requisitionNumber: Code[50];driverIDNumber: Code[50];driverName: Code[50];phonenumber: Code[10];emailaddress: Code[50];drivinglicenseNumber: Code[50]) status: Text
    // var
    //     VehicleDriversAllocation: Record "Vehicle Driver Allocation";
    //     TransportRequisition: Record "Transport Requisition";
    //     NonKeRRADriverAllocation: Record "Non-KeRRA Driver Allocation";
    // begin
    //     TransportRequisition.Reset;
    //     TransportRequisition.SetRange("Transport Requisition No",requisitionNumber);
    //     if TransportRequisition.FindSet then begin
    //     NonKeRRADriverAllocation.Init;
    //     NonKeRRADriverAllocation."Req No":=requisitionNumber;
    //     NonKeRRADriverAllocation."ID No":=driverIDNumber;
    //     NonKeRRADriverAllocation."Driver Name":=driverName;
    //     NonKeRRADriverAllocation."Phone Number":=phonenumber;
    //     NonKeRRADriverAllocation."Email Address":=emailaddress;
    //     NonKeRRADriverAllocation."DL Number":=drivinglicenseNumber;
    //     if NonKeRRADriverAllocation.Insert(true) then begin
    //       status:='success*The Driver has been allocated Successfully';
    //       end else begin
    //         status:='danger*The Driver could not be allocated Successfully';
    //       end;
    //       end;
    // end;

    // procedure SendFuelRequisitionforApproval(docNo: Code[100]) status: Text
    // var
    //     FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     FuelMaintenanceRequisition1: Record "Fuel & Maintenance Requisition";
    // begin
    //     FuelMaintenanceRequisition.Reset;
    //     FuelMaintenanceRequisition.SetRange("Requisition No",docNo);
    //     FuelMaintenanceRequisition.SetRange(Status,FuelMaintenanceRequisition.Status::Open);
    //     if FuelMaintenanceRequisition.FindSet then begin
    //     if ApprovalsMgmt.CheckFuelReqApprovalsWorkflowEnabled(FuelMaintenanceRequisition) then
    //       ApprovalsMgmt.OnSendFuelReqForApproval(FuelMaintenanceRequisition);
    //         FuelMaintenanceRequisition1.Reset;
    //         FuelMaintenanceRequisition1.SetRange("Requisition No",docNo);
    //         if FuelMaintenanceRequisition1.FindSet then begin
    //           if FuelMaintenanceRequisition1.Status = FuelMaintenanceRequisition1.Status::"Pending Approval" then begin
    //             status:='success*The Vehicle Maintenance request was successfully sent for approval';
    //             end else begin
    //             status:='success*The Vehicle Maintenance request was already approved on is no longer Pending Approval';
    //               end;
    //           end else begin
    //         status:='danger* New Vehicle Maintenance request with the given number does not exist';
    //         end;
    //         end else begin
    //         status:='error* Either New File Movement Number does not exist or it is no longer open';
    //         end
    // end;

    // procedure ProcessDriverAllocations(docNumber: Code[50]) status: Text
    // var
    //     VehicleDrivers: Record "Vehicle Drivers";
    //     VehicleDriversAll: Record "Vehicle Driver Allocation";
    //     VehicleDrivers11: Record "Vehicle Drivers";
    //     TransportRequisition: Record "Transport Requisition";
    // begin
    //      TransportRequisition.Reset;
    //      TransportRequisition.SetRange("Transport Requisition No",docNumber);
    //      if TransportRequisition.FindSet then begin
    //      VehicleDriversAll.Reset;
    //       VehicleDriversAll.SetRange(VehicleDriversAll."Requisition Number",docNumber);
    //       VehicleDriversAll.SetRange(VehicleDriversAll."Reassigned?",false);
    //       if VehicleDriversAll.Find('-') then begin
    //         repeat
    //           if VehicleDriversAll."Registration Number" = '' then begin
    //              status:='danger*Please allocate vehicle to driver %1 before proceeding';
    //           end else begin
    //             if TransportRequisition."Approved Imprest Memo" <> '' then begin
    //               UpateDriverAllocationToImprestMemo(docNumber,TransportRequisition."Approved Imprest Memo");
    //             end;
    //           end;
    //         until VehicleDriversAll.Next=0;
    //            SendDriverEmailNotification(docNumber);
    //            status:='success*The Driver Allocation details has been completed Successfully'
    //       end else begin
    //         status:='danger*No Driver Available for this action'
    //       end;
    //     end;
    // end;

    // procedure UpateDriverAllocationToImprestMemo(docNumber: Code[50];ImprestNumber: Code[50]) status: Text
    // var
    //     FleetSetup: Record "Fleet Management Setup";
    //     ProjectMember1: Record "Project Members";
    //     ProjectMembers: Record "Project Members";
    //     ProjectMember2: Record "Project Members";
    //     DefaultDriver: Code[10];
    //     DriverAlloc: Record "Vehicle Driver Allocation";
    // begin

    //     if ImprestMemo.Get(docNumber) then begin
    //       FleetSetup.Get;
    //       FleetSetup.TestField("Default Fleet Driver");
    //       DefaultDriver := FleetSetup."Default Fleet Driver";
    //         DriverAlloc.Reset;
    //         DriverAlloc.SetRange("Requisition Number",docNumber);
    //         if DriverAlloc.FindSet then begin
    //            ProjectMember1.Reset;
    //            ProjectMember1.SetRange(ProjectMember1."Imprest Memo No.",docNumber);
    //            if ProjectMember1.FindFirst then begin
    //              ProjectMembers.Init;
    //              ProjectMembers."Imprest Memo No." := docNumber;
    //              ProjectMembers."Work Type" := ProjectMember1."Work Type";
    //              ProjectMembers.Validate("Work Type");
    //              ProjectMembers.Type := ProjectMembers.Type::Person;
    //              ProjectMembers."No." := DriverAlloc."Driver Code";
    //              ProjectMembers.Validate("No.");
    //              ProjectMembers."Time Period" :=DriverAlloc."Number of Days";
    //              ProjectMembers.Validate(ProjectMembers."Time Period");
    //              ProjectMembers."Vote Item" := ProjectMember1."Vote Item";
    //              ProjectMembers.Validate("Vote Item");
    //              ProjectMembers."Type of Expense" := ProjectMember1."Type of Expense";
    //              ProjectMembers.Validate("Type of Expense");
    //              ProjectMembers.Job := ProjectMember1.Job;
    //              ProjectMembers."Job  Task" := ProjectMember1."Job  Task";
    //              ProjectMembers.Validate(Job);
    //              if not ProjectMembers.Insert(true) then
    //                ProjectMembers.Modify(true);
    //            end;
    //           ProjectMember2.Reset;
    //           ProjectMember2.SetRange(ProjectMember2."Imprest Memo No.",docNumber);
    //           ProjectMember2.SetRange(ProjectMember2."No.",DefaultDriver);
    //           if ProjectMember2.FindSet then
    //             ProjectMember2.Delete;

    //        end;
    //     end;
    // end;

    // procedure SendDriverEmailNotification(docNumber: Code[50]) status: Text
    // var
    //     VehicleDriverAllocation: Record "Vehicle Driver Allocation";
    //     TransportRequisition: Record "Transport Requisition";
    //     Emp: Record Employee;
    //     Header: Code[100];
    //     SMTPSetup: Record "Email Account";
    //     SMTPMail: Codeunit Mail;
    //     ObjCompany: Record "Company Information";
    //     SenderEmail: Text;
    //     SenderName: Text;
    //     Approved: Boolean;
    //     VehicleDrivers: Record "Vehicle Drivers";
    //     ImprestMemo: Record "Imprest Memo";
    //     ImprestMemo1: Record "Imprest Memo";
    //     ProjectMembers: Record "Project Members";
    //     ProjectMember1: Record "Project Members";
    //     VehicleDriversAll: Record "Vehicle Driver Allocation";
    //     VehicleDrivers11: Record "Vehicle Drivers";
    // begin
    //     VehicleDriverAllocation.Reset;
    //     VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Requisition Number",docNumber);
    //     VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Reassigned?",false);
    //     if VehicleDriverAllocation.Find('-') then begin
    //       repeat
    //         TransportRequisition.Get(docNumber);
    //         if Emp.Get(VehicleDriverAllocation."Driver Code") then begin
    //             Header:='TRAVEL TRIP NOTIFICATION '+docNumber+' ON '+Format(VehicleDriverAllocation."Date of Trip")+' TO '+Format(VehicleDriverAllocation."Trip End Date");

    //             if SMTPSetup.Get() then begin
    //               SenderEmail:=SMTPSetup."Email Sender Address";
    //               SenderName:= SMTPSetup."Email Sender Name";
    //             end;
    //             if Emp."E-Mail" <> '' then begin
    //               //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',true);
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('Please note that you have been assigend as the driver to the above mentioned trip.');// for the month of January 2014');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
    //               //SMTPMail.AddBodyline('<br>');
    //               //SMTPMail.AddBodyline('Trip requested by : '+TransportRequisition."Employee Name");
    //               //SMTPMail.AddBodyline('<br>');
    //               //SMTPMail.AddBodyline('Trip From: '+TransportRequisition.Commencement+' To '+TransportRequisition.Destination+' on '+Format(TransportRequisition."Date of Trip")+' return date will be on '+Format(TransportRequisition."Trip End Date"));
    //               //SMTPMail.AddBodyline('<br>');
    //               //SMTPMail.AddBodyline('<br>');
    //               //SMTPMail.AddBodyline('Vehicle Reg Number: '+VehicleDriverAllocation."Requisition Number" +' '+VehicleDriverAllocation."Vehicle Description");
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
    //               //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.Send;
    //             end;
    //           end;
    //           if Emp.Get(TransportRequisition."Employee No") then begin
    //             Header:='TRAVEL TRIP NOTIFICATION '+VehicleDriverAllocation."Requisition Number"+' ON '+Format(VehicleDriverAllocation."Date of Trip")+' TO '+Format(VehicleDriverAllocation."Trip End Date");

    //             if SMTPSetup.Get() then begin
    //               SenderEmail:=SMTPSetup."Email Sender Address";
    //               SenderName:= SMTPSetup."Email Sender Name";
    //             end;
    //             if Emp."E-Mail" <> '' then begin
    //               //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',true);
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('Please note that you have been assigend driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
    //               //SMTPMail.AddBodyline('<br>');
    //               //SMTPMail.AddBodyline('Driver Name : '+VehicleDriverAllocation."Driver Name");
    //               //SMTPMail.AddBodyline('<br>');
    //               //SMTPMail.AddBodyline('Vehicle Reg Number: '+VehicleDriverAllocation."Registration Number" +' '+VehicleDriverAllocation."Vehicle Description");
    //               //SMTPMail.AddBodyline('<br>');
    //               VehicleDrivers11.Reset;
    //               VehicleDrivers11.SetRange(VehicleDrivers11.Driver,VehicleDriverAllocation."Driver Code");
    //               if VehicleDrivers11.FindSet then begin
    //                 //SMTPMail.AddBodyline('Driver Phone Number : '+VehicleDrivers11."Phone Number");
    //                 //SMTPMail.AddBodyline('<br>');
    //               end;
    //               //SMTPMail.AddBodyline('Trip From: '+TransportRequisition.Commencement+' To '+TransportRequisition.Destination+' on '+Format(TransportRequisition."Date of Trip"));
    //               //SMTPMail.AddBodyline('<br>');
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
    //               //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
    //               //SMTPMail.AddBodyline('<br><br>');
    //               //SMTPMail.Send;
    //               Message('Mail sent to %1',Emp."E-Mail");
    //             end;
    //             //End email
    //           end;
    //       until VehicleDriverAllocation.Next = 0;
    //     status:='success*Email notifications has been sent';
    //     end;
    // end;
}

