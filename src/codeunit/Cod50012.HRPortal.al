#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 50012 "HRPortal"
{

    trigger OnRun()
    begin

        //Message(resetPassword('EMP00001'));
        //  Message(fnCreateF());
        //FnSendStoreRequisitionForApproval1('20090024','SREQ00133');


    end;

    var
        Employee: Record Employee;
        objMail: Codeunit Mail;
        leaveApp: Variant;

        HRPortalUsers: Record HRPortalUsers;
        leaveApplications: Record "HR Leave Applications";
        HrJobsApplicants: Record "Hr Jobs Applicants";
        JobApplicantHobbies: Record "Job Applicant Hobbies";
        JobApplicantReferees: Record "HR Applications Accomplishment";
        JobApplicantsQualifications: Record "Applications Accomplishments";
        CompanyJobs: Record "ManPower Planning Lines";
        JobPositionApplications: Record "HR Professional Qualifications";
        FILESPATH: label '//192.168.1.34\ESSTEST\downloads\';
        FILESPATH5: label 'C:\inetpub\wwwroot\ESSTEST\Downloads\PurchaseRequisition';
        ImprestMemo: Record "Imprest Memo";
        LegInstr: InStream;
        LegOutStr: OutStream;
        LegText: Text;
        Leg: BigText;
        obj: BigText;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Payments: Record payments;
        pay: Record payments;
        Payments1: Record payments;
        Payments2: Record payments;
        PurchaseHeader: Record "Purchase Header";
        annual: Option " ","Annual Leave","Emergency Leave";
        FILESPATH1: label 'C:\inetpub\wwwroot\ESSLIVE\finance\payslip\';
        FILESPATH2: label 'E:\Portal Documents\p9\';
        NEWFILESPATH2: label 'C:\inetpub\wwwroot\ESSLIVE\finance\p9\';

        STOREREPORTFILEPATH: label 'C:\inetpub\wwwroot\ESSLIVE\Reports\';
        STOREREPORTFILEPATH1: label 'C:\inetpub\wwwroot\EssTestApprovals\Reports\';
        ApplicantEmploymentHistory: Record "Employee History Table";
        jpa: Record "HR Job Applications";
        gender: Option ,Female,Male,Both;
        disabled: Option No,Yes;
        MaritalStatus: Option Single,Married,Separated,Divorced,"Widow(er)",Other;
        applicantQualifications: Record "HR Applicant Qualifications";
        JobApplicants: Record "HR Job Applications";
        professionalQualifications: Record "HR Professional Qualifications";
        attendedTraining: Record "Hr Trainings Attended";
        membershipbody: Record "Hr Proffessional Body";
        applicantAccomplishment: Record "HR Applications Accomplishment";
        referee: Record "HR Applicant Referees";
        externalApplicants: Record "HR Applicant Accounts";
        helpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
        hdesk: Record "ICT Helpdesk";
        item: Record Item;
        applicantBackground: Record "Applicant Background";
        applicantReferee: Record "Applicant Referees";
        jobApplication: Record "Job Application Table";
        jobApp: Record "Job Application Table";
        favouriteJob: Record FavouriteJobsTable;
        // FILESPATH3: label '//192.168.1.34\ESSTEST\downloads\EmployeeStatement\';
        FILESPATH3: label 'C:\inetpub\wwwroot\ESSTEST\downloads\EmployeeStatement\';
        employeeLedgerEntry: Record "Employee Ledger Entry";
        EmpFilter: Text[250];
        EmpDateFilter: Text[30];
        TrainingRequisition: Record "Training Requests";
        TrainingReq: Record "Training Requests";
        TrainingParticipants: Record "Training Participants";
        PVLines: Record "PV Lines";
        PettyCashLines: Record "Petty Cash Lines";
        //FILESPATH4: label '//192.168.1.34\ESSTEST\downloads\ImprestMemoPreview\';

        FILESPATH4: label 'C:\inetpub\wwwroot\ESSLIVE\downloads\ImprestMemoPreview\';
        RecID: RecordID;
        RecRef: RecordRef;
        varTableNumber: Integer;
        ProcurementSetup: Record "Procurement Setup";
        FILESPATH6: label '//192.168.1.34\ESSTEST\downloads\StoreRequisition\';
        FILESPATH7: label '//192.168.1.34\ESSTEST\downloads\IssueVoucher\';
        FileName: Text[250];
        //  EmployeeStatement: Report "Employee Statement";
        FILESPATH8: label '//192.168.1.34\ESSTEST\downloads\PettyCashVoucher\';
        FILESPATH9: label '//192.168.1.34\ESSTEST\downloads\StaffClaim\';
        FILESPATH10: label '//192.168.1.34\ESSTEST\downloads\FleetRequisition\';
        TransportRequisition: Record "Transport Requisition";
        ICT: Integer;
        FILESPATH12: label '//192.168.1.34\ESSTEST\downloads\reopen\';
        FILESPATH11: label '//192.168.1.34\ESSTEST\downloads\allissues\';
        FILESPATH13: label 'C:\inetpub\wwwroot\ESSLIVE\downloads\RiskReport\';
        FILESPATH14: label 'C:\inetpub\wwwroot\ESSLIVE\downloads\StandardAppraisalReport\';
        FILESPATH15: label 'C:\inetpub\wwwroot\ESSLIVE\finance\PlogReport\';
        FILESPATH16: label 'C:\inetpub\wwwroot\ESSLIVE\finance\IndividualPCReport\';
        FILESPATH17: label 'C:\inetpub\wwwroot\ESSLIVE\finance\CSP\';
        FILESPATH18: label 'C:\inetpub\wwwroot\ESSLIVE\finance\AWP\';
        FILESPATH19: label 'C:\inetpub\wwwroot\ESSLIVE\finance\BoardPC\';
        FILESPATH20: label 'C:\inetpub\wwwroot\ESSLIVE\downloads\TrainingFeedback\';
        FILESPATH21: label 'C:\inetpub\wwwroot\ESSLIVE\downloads\TrainingEvaluation\';
        FILESPATH22: label 'C:\inetpub\wwwroot\ESSLIVE\downloads\TrainingApplication\';
        FILESPATH23: label 'C:\inetpub\wwwroot\ESSLIVE\downloads\TrainingPlan\';
        FILESPATH24: label 'C:\inetpub\wwwroot\ESSLIVE\downloads\IndividualSubIndicator\';
        FILESPATH25: label 'C:\inetpub\wwwroot\ESSLIVE\downloads\ScoreReport\';
        DOWNLOADFILEPATH: label 'C:\PortalDocs\ApprovalDownloads\';
        mergePdfsapiPath: label 'http://192.168.1.87:8095/api/values/MergePdf?tenderNo=';
        createFolderapiPath: label 'http://192.168.1.87:8095/api/values/CreateFolder?tenderNo=';
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        TrainingNeedsRequest: Record "Training Needs Header";
        TrainingNeedsLine: Record "Training Needs Requests";


    procedure resetPassword("employeeNumber-idNumber": Code[20]) status: Text
    begin
        status := 'danger*Account not found';
        Employee.Reset;
        Employee.SetRange(Employee."No.", "employeeNumber-idNumber");
        if Employee.FindSet then begin
            status := myResetPass(Employee);
        end else begin
            Employee.Reset;
            Employee.SetRange(Employee."ID Number", "employeeNumber-idNumber");
            if Employee.FindSet then begin
                status := myResetPass(Employee);
            end
            else begin
                if HrJobsApplicants.Get("employeeNumber-idNumber") then begin
                    status := myResetPassExternal(HrJobsApplicants);
                end
                else begin
                    status := 'danger*Account with the given credentials does not exist';
                end;
            end;
        end;

    end;

    local procedure myResetPass(Employee: Record Employee) status: Text
    var
        employeeEmail: Text;
        password: Integer;
        passwordOk: Boolean;
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        Smail: Codeunit EMail;
        HumanResourcesSetup: Record "Human Resources Setup";
        SenderName: Text[250];
        SenderEmailAddress: Text[250];
        Receipients: List of [Text];
        Subject: Text[250];
        Body: Text[250];
    begin
        employeeEmail := Employee."Company E-Mail";
        if employeeEmail = '' then begin
            status := 'danger*You have not added company email to the selected employee. Kindly update and try again';
        end else begin
            passwordOk := false;
            repeat
                password := Random(9999);
                if password > 1000 then
                    passwordOk := true;
            until passwordOk = true;
            HRPortalUsers.Reset;
            HRPortalUsers.SetRange(HRPortalUsers.employeeNo, Employee."No.");
            if HRPortalUsers.FindSet then begin
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Modify(true);
            end else begin
                HRPortalUsers.Init;
                HRPortalUsers.employeeNo := Employee."No.";
                HRPortalUsers.IdNo := Employee."ID Number";
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Insert(true);
            end;
            // prepare email
            // Receipients.Add(Employee."Company E-Mail");
            //HumanResourcesSetup.Get;
            // HumanResourcesSetup.TestField("HR E-mail Address");
            //  SenderEmailAddress := HumanResourcesSetup."HR E-mail Address";
            Subject := 'ONE TIME PASSWORD (OTP) - ESS';
            Body := 'Dear' + ' ' + Employee."First Name" + ' ' + Employee."Last Name" + ', Your One Time password is: ';
            Body := Body + '<strong>' + Format(HrPortalUsers.password) + '</strong>. Kindly use it to access the employee self service portal. <br>';
            Body := Body + ' ' + 'Kind Regards, Kenya Urban Roads Authority' + '<br><br>';
            Body := Body + '[This email is automated. Kindly do not reply to it]<br><br>';
            SMTPMail.Create(employeeEmail, Subject, Body, true);
            Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);
            status := 'success*We have sent a one time password to your email (' + employeeEmail + '). Use it to log in to your account';
        end;
    end;

    local procedure myResetPassExternal(HrJobsApplicants: Record "Hr Jobs Applicants") status: Text
    var
        employeeEmail: Text;
        password: Integer;
        passwordOk: Boolean;
    begin
        employeeEmail := HrJobsApplicants."E-Mail";
        if employeeEmail = '' then begin
            status := 'danger*You have not added an email to you account. ';
        end else begin
            passwordOk := false;
            repeat
                password := Random(9999);
                if password > 1000 then
                    passwordOk := true;
            until passwordOk = true;
            HRPortalUsers.Reset;
            HRPortalUsers.SetRange(HRPortalUsers.IdNo, HrJobsApplicants."ID Number");
            if HRPortalUsers.FindSet then begin
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Modify(true);
            end else begin
                HRPortalUsers.Init;
                HRPortalUsers.employeeNo := Employee."No.";
                HRPortalUsers.IdNo := Employee."ID Number";
                HRPortalUsers.password := Format(password);
                HRPortalUsers.changedPassword := false;
                HRPortalUsers.Insert(true);
            end;
            objMail.CreateMessage(employeeEmail, '', '', 'Employee Password Reset', 'Your one time password is <strong>' + Format(password) + '</strong>', true, true);

            // objMail.Send();
            status := 'success*We have sent a on time password to your email (' + employeeEmail + '). Use it to log in to your account';
        end;
    end;

    procedure createPettyCash(docNo: Text[50]; empNo: Text; job: Text[100]; jobTaskno: Text[100]; pNarration: Text[100]; region: Text[100]; constituency: Text[100]) status: Text
    begin
        Payments.Reset;
        Payments.SetRange("No.", docNo);
        Payments.SetRange("Account No.", empNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            Payments."Payment Narration" := pNarration;
            Payments.Validate("Payment Narration");
            Payments.Job := job;
            Payments.Validate(Job);
            Payments."Job Task No" := jobTaskno;
            Payments."Job Task No." := jobTaskno;
            Payments.Validate("Job Task No.");
            Payments.Validate("Job Task No");
            Payments."Responsibility Center" := region;//Added By Fred
            if Payments.Modify(true) then begin
                Payments."Responsibility Center" := region;
                Payments.Modify(true);
                status := 'success*' + Payments."No." + ' *Your Petty cash was successfully updated';
            end else begin
                status := 'danger*Your Petty cash could not be updated';
            end;
        end else begin
            Payments.Init;
            Payments."No." := '';
            Payments."Document Type" := Payments."document type"::"Petty Cash";
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::"Petty Cash";
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := empNo;
            Payments.Validate("Account No.");
            Payments."Payment Narration" := pNarration;
            Payments.Validate("Payment Narration");
            Payments."Responsibility Center" := region;//Added By Fred
            Payments.Job := job;
            Payments.Validate(Job);
            Payments."Job Task No" := jobTaskno;
            Payments."Job Task No." := jobTaskno;
            Payments.Validate("Job Task No.");
            Payments.Validate("Job Task No");
            Payments.Date := Today();
            if Payments.Insert(true) then begin
                Payments."Responsibility Center" := region;
                Payments.Modify(true);
                status := 'success*' + Payments."No.";
            end else begin
                status := 'danger*Your Petty cash could not be captured';
            end;
        end;
    end;

    procedure createPettyCashLines(docNo: Text[50]; type: Text[100]; Amount: Decimal) status: Text
    begin
        PVLines.Reset;
        PVLines.SetRange(No, docNo);
        PVLines.SetRange(Type, type);
        if PVLines.FindSet then begin
            status := 'error* Type with  description ' + type + ' already exists';
        end else begin
            PVLines.Init;
            PVLines.No := docNo;
            PVLines.Type := type;
            PVLines.Validate(Type);
            PVLines.Validate("Account No");
            PVLines.Amount := Amount;
            PVLines.Insert(true);
            status := 'success*Line successfully added';
        end
    end;

    procedure PopulatePettyCash(docNo: Text[50]; empNo: Text) status: Text
    begin
        Payments.Reset;
        Payments.SetRange("No.", docNo);
        Payments.SetRange("Account No.", empNo);
        Payments.SetRange(Status, Payments.Status::Released);
        if Payments.FindSet then begin
            Payments."Imprest Issue Doc. No" := docNo;
            if Payments.Modify(true) then begin
                Payments.Validate("Imprest Issue Doc. No");
                status := 'success*' + Payments."No." + ' *Your Petty cash was successfully updated';
            end else begin
                status := 'danger*Your Petty cash could not be updated';
            end;
        end;
    end;

    procedure editPettyCashLines(type: Text[100]; amount: Decimal; reqNo: Text[100]; id: Integer) status: Text
    begin
        PVLines.Reset;
        PVLines.SetRange(No, reqNo);
        PVLines.SetRange("Line No", id);
        if PVLines.FindSet then begin

            PVLines.Type := type;
            PVLines.Amount := amount;
            PVLines.Validate(Amount);
            PVLines.Validate("Account No");
            PVLines.Modify(true);
            status := 'success*Petty cash line successfully updated';


        end
        else begin

            status := 'error*The Petty cash line could not be updated.'

        end
    end;

    procedure deletePettyCashLines(id: Integer; reqNo: Text[100]) status: Text
    begin
        PVLines.Reset;
        PVLines.SetRange(No, reqNo);
        PVLines.SetRange("Line No", id);
        if PVLines.FindSet then begin
            PVLines.Delete;
            status := 'success* Petty cash line deleted successfully added';

        end
        else begin

            status := 'error*The Petty cash line could not be deleted.Please try again';

        end
    end;

    procedure sendPettyCashRequestApproval(employeeNo: Code[50]; reqNo: Code[50]) status: Text
    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
    begin
        Payments.Reset;
        Payments.SetRange("No.", reqNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.Findfirst then begin
            VarVariant := Payments;
            CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant);
            CustomApprovals.OnSendDocForApproval(VarVariant);
        end else begin
            status := 'danger*A petty cash request with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure cancelPettyCashRequestApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
        VarVariant: Variant;
        RecRef: RecordRef;
        CustomApprovalEntry: Record "Approval Entry";
        OldStatus: Option;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";

    begin

        Payments.Reset;
        Payments.SetRange("No.", recordNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::"Pending Approval");
        if Payments.FindSet then begin

            CustomApprovalEntry.Reset;
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", Payments."No.");
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", Payments.RecordId);
            CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
            if CustomApprovalEntry.FindSet then
                repeat
                    CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                    CustomApprovalEntry.Modify(true);
                until CustomApprovalEntry.Next = 0;
            Payments.Status := Payments.Status::Open;
            if Payments.Modify(true) then begin
                status := 'success*Your petty cash requisition approval was successfully cancelled';
            end else begin
                status := 'danger*Sorry, your request could not be completed. Kindly try again! Contact the system administrator if this error persists. ';
            end;


        end else begin


            status := 'danger*The petty cash requisition does not exist or you are not the requester or status is not pending';
        end;
        exit(status);

    end;

    procedure updatePettyCashSurrenderLine(employeeNo: Code[50]; pettyCashNo: Code[50]; lineNo: Integer; amountSpent: Decimal; receipt: Text) status: Text
    var
        ImprestLines: Record "Imprest Lines";
    begin
        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", pettyCashNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
        if Payments.FindSet then begin
            PettyCashLines.Reset;
            PettyCashLines.SetRange(No, pettyCashNo);
            PettyCashLines.SetRange("Line No", lineNo);
            if PettyCashLines.FindSet then begin

                PettyCashLines.Validate("Actual Spent", amountSpent);
                PettyCashLines.Validate("Receipt No.", receipt);
                if PettyCashLines.Modify(true) then begin
                    status := 'success*The petty cash line was successfully updated';//+FORMAT(lineNo);
                end else begin
                    status := 'danger*The petty cash line could not be updated';
                end;
            end else begin
                status := 'danger*The petty cash line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*An petty cash surrender with the given number does not exist, you are not the requestor or is no longer released';
        end;
        exit(status);
    end;

    procedure sendPettyCashSurrenderApproval(employeeNo: Code[50]; imprestSurrenderNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
    begin

        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", imprestSurrenderNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
        if Payments.FindSet then begin
            //Payments.TESTFIELD(Job);
            //Payments.TESTFIELD("Job Task No");
            //Payments.TESTFIELD("Actual Amount Spent");
            //if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
            // ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
            if Payments1.Get(Payments."No.") then begin
                Payments1.Selected := true;
                Payments1.Modify;
            end;
            if Payments2.Get(imprestSurrenderNo) then begin
                if Payments2.Status = Payments2.Status::"Pending Approval" then begin
                    status := 'success*The Petty Cash Surrender was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*An Petty Cash surrender with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure cancelPettyCashSurrenderApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Applications";
        ImprestMemo1: Record "Imprest Memo";
        Payments2: Record payments;
        ImprestHeader: Record payments;
        PurchaseHeader1: Record "Purchase Header";
        TransportRequisition: Record "Transport Requisition";
        TransportRequisition1: Record "Transport Requisition";
    begin

        Payments.Reset;
        Payments.SetRange("No.", recordNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::"Pending Approval");
        Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
        if Payments.FindSet then begin
            //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
            Payments1.Reset;
            Payments1.SetRange("No.", recordNo);
            if Payments1.FindSet then begin

                if Payments1.Status = Payments.Status then begin
                    Message(Format(Payments1.Status));
                    status := 'warning*Your petty cash surrender  approval could not be cancelled';
                end else begin
                    status := 'success*Your petty cash surrender approval was successfully cancelled';
                end;
            end;
        end else begin
            status := 'danger*The petty cash surrender does not exist or you are not the requester or status is not pending';



        end;
        exit(status);
    end;

    procedure createTrainingRequisition(docNo: Text[100]; trainingplan: Code[100]; courseTitle: Text[100]; trainingVenue: Text[100]; respCenter: Text; location: Text[100]; provider: Text[100]; empNo: Text[100]; desc: Text) status: Text
    begin
        TrainingRequisition.Reset;
        TrainingRequisition.SetRange(Code, docNo);
        TrainingRequisition.SetRange("Employee No.", empNo);
        if TrainingRequisition.FindSet then begin
            TrainingRequisition."Course Title" := courseTitle;
            TrainingRequisition.Validate("Course Title");
            TrainingRequisition."Training Venue Region Code" := trainingVenue;
            TrainingRequisition.Validate("Training Venue Region Code");
            TrainingRequisition.Location := location;
            TrainingRequisition.Provider := provider;
            TrainingRequisition.Validate(Provider);
            TrainingRequisition."Training Responsibility Code" := respCenter;
            TrainingRequisition.Description := desc;
            TrainingRequisition.Duration := TrainingRequisition."End DateTime" - TrainingRequisition."Start DateTime";
            if TrainingRequisition.Modify(true) then begin
                status := 'success*Training application created successfully*' + TrainingRequisition.Code + '*' + TrainingRequisition."Training Plan No.";
            end else begin
                status := 'danger*Training application was not created successfully*';
            end;
        end else begin
            TrainingRequisition.Init;
            TrainingRequisition."Course Title" := courseTitle;
            TrainingRequisition.Validate("Course Title");
            TrainingRequisition."Employee No." := empNo;
            TrainingRequisition."Training Venue Region Code" := trainingVenue;
            TrainingRequisition.Validate("Training Venue Region Code");
            TrainingRequisition.Location := location;
            TrainingRequisition.Provider := provider;
            TrainingRequisition.Validate(Provider);
            TrainingRequisition."Application Date" := Today();
            TrainingRequisition."Employee No." := empNo;
            TrainingRequisition.Description := desc;
            TrainingRequisition.Duration := TrainingRequisition."End DateTime" - TrainingRequisition."Start DateTime";
            if TrainingRequisition.Insert(true) then begin
                status := 'success*Training application created successfully*' + TrainingRequisition.Code + '*' + TrainingRequisition."Training Plan No.";
            end else begin
                status := 'danger*Training application was not created successfully*';
            end;
        end;
    end;

    procedure addTrainingParticipants2(type: Text[100]; participantEmpno: Text[100]; noOfDays: Decimal; reqNo: Text[100]) status: Text
    begin
        TrainingRequisition.Reset;
        TrainingRequisition.SetRange(Code, reqNo);
        if TrainingRequisition.FindSet then begin
            TrainingParticipants.Reset;
            TrainingParticipants.SetRange("Training Code", reqNo);
            TrainingParticipants.SetRange("Employee Code", participantEmpno);
            if TrainingParticipants.FindSet then begin
                status := 'error*The participants already exists.'
            end else begin
                TrainingParticipants.Init;
                TrainingParticipants.Type := type;
                TrainingParticipants."Employee Code" := participantEmpno;
                TrainingParticipants.Validate("Employee Code");
                TrainingParticipants."Training Code" := reqNo;
                TrainingParticipants.Destination := TrainingRequisition."Training Venue Region Code";
                TrainingParticipants."Training Responsibility Code" := TrainingRequisition."Training Responsibility Code";
                TrainingParticipants."Training Responsibility" := TrainingRequisition."Training Responsibility";
                TrainingParticipants."No. of Days" := noOfDays;
                TrainingParticipants.Validate("No. of Days");
                if TrainingParticipants.Insert(true) then begin
                    status := 'success*Training Participant successfully added';
                end else begin
                    status := 'danger*Training Participant was not added, please try again!';
                end
            end;
        end;
    end;

    procedure editTrainingParticipants2(docNo: Code[100]; lineno: Integer; type: Text[100]; empNo: Text[100]; noOfDays: Integer) status: Text
    begin
        TrainingParticipants.Reset;
        TrainingParticipants.SetRange("Training Code", docNo);
        TrainingParticipants.SetRange("Line No", lineno);
        if TrainingParticipants.FindSet then begin
            TrainingParticipants.Type := type;
            TrainingParticipants."Employee Code" := empNo;
            //TrainingParticipants.VALIDATE("Employee Code");
            TrainingParticipants."No. of Days" := noOfDays;
            if TrainingParticipants.Modify(true) then begin
                status := 'success*The training participant was successfully updated';
            end else begin
                status := 'danger*The training participant could not be updated.';
            end;
        end
    end;

    procedure deleteTrainingParticipants2(id: Integer; reqNo: Text[100]) status: Text
    begin
        TrainingParticipants.Reset;
        TrainingParticipants.SetRange("Training Code", reqNo);
        TrainingParticipants.SetRange("Line No", id);
        if TrainingParticipants.FindSet then begin
            if TrainingParticipants.Delete(true) then begin
                status := 'success*The training participant ' + TrainingParticipants."Employee Name" + ' was successfully removed';
            end else begin
                status := 'danger*The training participant ' + TrainingParticipants."Employee Name" + ' would not be removed, kindly try again!';
            end;
        end;
    end;

    procedure addTrainingCost2(docNo: Code[100]; costcategory: Integer; costitem: Code[100]; itemcategory: Code[100]; item: Code[100]; unitcost: Decimal; quantity: Integer) status: Text
    var
        TrainingCost: Record "Training Cost";
        TrainingRequests: Record "Training Requests";
    begin
        TrainingCost.Init;
        TrainingCost."Training ID" := docNo;
        TrainingCost."Cost Category" := costcategory;
        TrainingCost."Cost Item" := costitem;
        TrainingCost."Item Category" := itemcategory;
        TrainingCost."Service/Item Code" := item;
        TrainingCost.Validate("Service/Item Code");
        TrainingCost."Unit Cost (LCY)" := unitcost;
        TrainingCost.Quantity := quantity;
        TrainingCost.Validate(Quantity);
        if TrainingCost.Insert(true) then begin
            status := 'success*The training cost was successfully added*';
        end else begin
            status := 'danger*The training cost was not added, please try again';
        end;
    end;

    procedure deleteTrainingcost2(id: Integer; reqNo: Text[100]) status: Text
    var
        TrainingCost: Record "Training Cost";
    begin
        TrainingCost.Reset;
        TrainingCost.SetRange("Training ID", reqNo);
        //TrainingCost.SETRANGE("Line No",id);
        if TrainingCost.FindSet then begin
            if TrainingCost.Delete(true) then begin
                status := 'success*The training cost was successfully removed';
            end else begin
                status := 'danger*The training cost would not be removed, kindly try again!';
            end;
        end;
    end;

    procedure sendTrainingRequestApproval(employeeNo: Code[50]; reqNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
    begin
        TrainingRequisition.Reset;
        TrainingRequisition.SetRange("Employee No.", employeeNo);
        TrainingRequisition.SetRange(Code, reqNo);
        TrainingRequisition.SetRange(Status, TrainingRequisition.Status::Open);
        if TrainingRequisition.FindSet then begin
            TrainingRequisition.TestField(Duration);
            // if ApprovalsMgmt.CheckTApplicationApprovalsWorkflowEnabled(TrainingRequisition) then
            //  ApprovalsMgmt.OnSendTApplicationForApproval(TrainingRequisition);
            if TrainingReq.Get(reqNo) then begin
                if TrainingReq.Status = TrainingReq.Status::Pending then begin
                    status := 'success*The training request was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*A training request with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure cancelTrainingRequestApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Applications";
        ImprestMemo1: Record "Imprest Memo";
        Payments2: Record payments;
        ImprestHeader: Record payments;
        PurchaseHeader1: Record "Purchase Header";
        TransportRequisition: Record "Transport Requisition";
        TransportRequisition1: Record "Transport Requisition";
    begin
        TrainingRequisition.Reset;
        TrainingRequisition.SetRange(Code, recordNo);
        TrainingRequisition.SetRange("Employee No.", employeeNo);
        TrainingRequisition.SetRange(Status, TrainingRequisition.Status::Pending);
        if TrainingRequisition.FindSet then begin
            //ApprovalsMgmt.OnCancelTApplicationApprovalRequest(TrainingRequisition);
            if TrainingReq.Get(TrainingRequisition.Code) then begin
                TrainingReq.Status := TrainingReq.Status::Open;
                if TrainingReq.Modify(true) then begin
                    status := 'success*Your training requisition approval was successfully cancelled';
                end else begin
                    status := 'danger*Your training requisition approval could not be cancelled, please try again!';
                end;
            end;
        end;
    end;

    procedure fnGenerateTrainingApplicationReport(docNo: Code[100]) status: Text
    var
        TrainingRequests: Record "Training Requests";
    begin
        TrainingRequests.Reset;
        TrainingRequests.SetRange(Code, docNo);
        if TrainingRequests.FindSet then begin
            // if FILE.Exists(FILESPATH22 + docNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH22 + docNo + '.pdf');
            //     Report.SaveAsPdf(69122, FILESPATH22 + docNo + '.pdf', TrainingRequests);
            //     status := 'success*Generated*Downloads\TrainingApplication\' + docNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(69122, FILESPATH22 + docNo + '.pdf', TrainingRequests);
            //     status := 'success*Generated*Downloads\TrainingApplication\' + docNo + '.pdf';
            // end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateTrainingPlanReport(docNo: Code[100]) status: Text
    var
        TrainingPlanHeader: Record "Training Plan Header";
    begin
        TrainingPlanHeader.Reset;
        TrainingPlanHeader.SetRange(No, docNo);
        if TrainingPlanHeader.FindSet then begin
            // if FILE.Exists(FILESPATH23 + docNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH23 + docNo + '.pdf');
            //     Report.SaveAsPdf(69145, FILESPATH23 + docNo + '.pdf', TrainingPlanHeader);
            //     status := 'success*Generated*Downloads\TrainingPlan\' + docNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(69145, FILESPATH23 + docNo + '.pdf', TrainingPlanHeader);
            //     status := 'success*Generated*Downloads\TrainingPlan\' + docNo + '.pdf';
            // end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure createNewTrainingRequest(employeeNo: Code[30]; needsNo: Code[30]; description: Text) status: Text
    var
        Hremployee: Record Employee;
        UserSetup: Record "User Setup";
    begin
        /*UserSetup.RESET;
        UserSetup.SETRANGE("Employee No.",employeeNo);
        IF UserSetup.FINDSET THEN BEGIN
          Hremployee.RESET;
          Hremployee.SETRANGE("No.",employeeNo);
          IF Hremployee.FINDSET THEN BEGIN
            IF needsNo = '' THEN BEGIN
              trainingNeedsHeader.INIT;
              trainingNeedsHeader."Employee No":=UserSetup."Employee No.";
              trainingNeedsHeader."Employee Name":=UserSetup."Employee Name";
              trainingNeedsHeader.Department:=Hremployee.Department;
              trainingNeedsHeader."Job Title":=Hremployee."Job Title";
              trainingNeedsHeader."Date of First Appointment":=Hremployee."Employment Date";
              trainingNeedsHeader.Description:=description;
               IF trainingNeedsHeader.INSERT(TRUE) THEN BEGIN
                status:= 'success*your training needs request was successful*'+trainingNeedsHeader.Code;
                END ELSE BEGIN
                   status:= 'success*your training needs request was successful';
                END;
            END ELSE BEGIN
              trainingNeedsHeader.RESET;
              trainingNeedsHeader.SETRANGE(Code,needsNo);
              IF trainingNeedsHeader.FINDSET THEN BEGIN
               trainingNeedsHeader.Description:=description;
               IF trainingNeedsHeader.MODIFY(TRUE) THEN BEGIN
                status:= 'success*your training needs request was successful*'+trainingNeedsHeader.Code;
                END ELSE BEGIN
                   status:= 'success*your training needs request was successful';
                END;
              END;
            END;
          END;
        END;
        */

    end;

    procedure createNewTrainingNeedsLines(requestNo: Code[30]; description: Text; source: Integer; comments: Text) status: Text
    begin
        /*TrainingNeedsHeader.RESET;
        TrainingNeedsHeader.SETRANGE(Code,requestNo);
        IF TrainingNeedsHeader.FINDSET THEN BEGIN
          TrainingNeedsLines.INIT;
          TrainingNeedsHeader.Code:=TrainingNeedsLines."Training Header No.";
          TrainingNeedsLines."Training Header No.":=requestNo;
          TrainingNeedsLines.Description:= description;
          TrainingNeedsLines.Source:= source;
          TrainingNeedsLines.Comments:= comments;
          IF TrainingNeedsLines.INSERT(TRUE) THEN BEGIN
            status:='success*Training needs lines were added successfully';
            END ELSE BEGIN
              status:='danger*your request failed, kindly try again!';
          END;
        END;
        */

    end;

    procedure SendTrainingNeedsApproval(employeeno: Code[30]; needsno: Code[30]) status: Text
    begin
        /*NeedsHeader.RESET;
        NeedsHeader.SETRANGE("Employee No", employeeno);
        //NeedsHeader.SETRANGE(Status, NeedsHeader.Status::Open);
        NeedsHeader.SETRANGE(Code, needsno);
          IF NeedsHeader.FINDSET THEN BEGIN
        //  IF ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) THEN
        //    ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);
            NeedsHeader1.RESET;
            NeedsHeader1.SETRANGE("Employee No", employeeno);
            NeedsHeader1.SETRANGE(Code, needsno);
            IF NeedsHeader1.FINDSET THEN BEGIN
              //IF NeedsHeader1.Status = NeedsHeader1.Status::"Pending Approval" THEN BEGIN
                status:='success*The needs request was successfully sent for approval';
             // END;
            END;
           END ELSE BEGIN
            status:='danger*A needs request with the given number does not exist, you are not the requestor or is no longer open';
          END;
        EXIT(status);
        */

    end;

    procedure fnEditTrainingNeedsRequestLines(needsno: Code[30]; lineno: Integer; description: Text[100]; source: Integer; comments: Text[100]) status: Text
    begin
        /*NeedsLines.RESET;
        NeedsLines.SETRANGE("Training Header No.",needsno);
        NeedsLines.SETRANGE("Entry No.",lineno);
        IF NeedsLines.FINDSET THEN BEGIN
          NeedsLines.INIT;
          NeedsLines.Description:=description;
          NeedsLines.Source:=source;
          NeedsLines.Comments:=comments;
          IF NeedsLines.MODIFY(TRUE) THEN BEGIN
            status:='success*Your training needs request line has been updated successfully*';
            END ELSE BEGIN
              status:='danger*Your training needs request line could not be updated, please try again!*';
              END;
        END;
        */

    end;

    procedure fnDeleteTrainingNeedsLines(needsno: Code[30]; lineno: Integer) status: Text
    begin
        /*NeedsLines.RESET;
        NeedsLines.SETRANGE("Training Header No.",needsno);
        NeedsLines.SETRANGE("Entry No.",lineno);
        IF NeedsLines.FINDSET THEN BEGIN
          IF NeedsLines.DELETE(TRUE) THEN BEGIN
          status:='success*The needs request was deleted successfully';
          END ELSE BEGIN
            status:='danger*The request was not deleted, please try again!';
            END;
        END;
        */

    end;

    procedure createNewTrainingFeedback(employeeNo: Code[30]; feedbackNo: Code[30]; applicationCode: Code[30]) status: Text
    var
        TrainingApplicationFeedback: Record "Training Evaluation Header";
        EmployeeSchedule: Record "Employee Scedule";
        TrainingRequests: Record "Training Requests";
    begin
        /*TrainingRequests.RESET;
        TrainingRequests.SETRANGE(Code,applicationCode);
        IF TrainingRequests.FINDSET THEN BEGIN
          IF feedbackNo='' THEN BEGIN
              TrainingApplicationFeedback.INIT;
             // TrainingApplicationFeedback.Type:=TrainingApplicationFeedback.Type::Feedback;
            //  TrainingApplicationFeedback."Employee No.":= employeeNo;
            //  TrainingApplicationFeedback.VALIDATE("Employee No.");
              TrainingApplicationFeedback."Application Code":= applicationCode;
              TrainingApplicationFeedback.VALIDATE("Application Code");
               IF TrainingApplicationFeedback.INSERT(TRUE) THEN BEGIN
                  TrainingApplicationFeedback.VALIDATE("Application Code");
                status:= 'success*your training feedback request was successful*'+TrainingApplicationFeedback.No;
                END ELSE BEGIN
                   status:= 'danger*Your training feedback failed, kindly try again!';
                END;
          END ELSE BEGIN
            TrainingApplicationFeedback.RESET;
            TrainingApplicationFeedback.SETRANGE(No,feedbackNo);
            TrainingApplicationFeedback.SETRANGE("Employee No.",employeeNo);
            IF TrainingApplicationFeedback.FINDSET THEN BEGIN
              TrainingApplicationFeedback."Application Code":= applicationCode;
              TrainingApplicationFeedback.VALIDATE("Application Code");
               IF TrainingApplicationFeedback.MODIFY(TRUE) THEN BEGIN
                TrainingApplicationFeedback.VALIDATE("Application Code");
                status:= 'success*your training feedback request was successful*'+TrainingApplicationFeedback.No;
                END ELSE BEGIN
                   status:= 'danger*Your training feedback failed, kindly try again!';
                END;
            END;
          END;
        END ELSE BEGIN
        status:= 'danger*Your are not allowed to submit feeedback since you did not attend the training!';
        END;
        */

    end;

    procedure createTrainingFeedbackLines(feedbackNo: Code[30]; lineno: Integer; ratingcode: Code[50]; comments: Text; categorycode: Integer; categorydesc: Text; trainingcategory: Code[100]) status: Text
    var
        TrainingFeedbackLines: Record "Training Feedback Suggestions";
        TrainingApplicationFeedback: Record "Training Evaluation Header";
        CategoryRatingScale: Record "Category Rating Scale";
    begin
        /*TrainingFeedbackLines.RESET;
        TrainingFeedbackLines.SETRANGE("Training Application No",feedbackNo);
        TrainingFeedbackLines.SETRANGE("Entry No.",lineno);
        IF TrainingFeedbackLines.FINDSET THEN BEGIN
          CategoryRatingScale.RESET;
          CategoryRatingScale.SETRANGE("Rating Code",ratingcode);
          IF CategoryRatingScale.FINDSET THEN BEGIN
            TrainingFeedbackLines.Category:= categorycode;
            TrainingFeedbackLines."Training Category":=trainingcategory;
            TrainingFeedbackLines."Category Description":= categorydesc;
            TrainingFeedbackLines.Rating:= ratingcode;
            TrainingFeedbackLines."Rating Description":=CategoryRatingScale."Rating Description";
            TrainingFeedbackLines.Comments:= comments;
            IF TrainingFeedbackLines.MODIFY(TRUE) THEN BEGIN
                  status:= 'success*your training needs feedback was successful';
                END ELSE BEGIN
                    status:= 'danger*your training needs feedback was not successful';
                END;
          END;
        END;
        */

    end;

    procedure fnGenerateTrainingFeedbackReport(docNo: Code[100]) status: Text
    var
        TrainingEvaluationHeader: Record "Training Evaluation Header";
    begin
        TrainingEvaluationHeader.Reset;
        TrainingEvaluationHeader.SetRange(No, docNo);
        if TrainingEvaluationHeader.FindSet then begin
            // if FILE.Exists(FILESPATH20 + docNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH20 + docNo + '.pdf');
            //     Report.SaveAsPdf(69156, FILESPATH20 + docNo + '.pdf', TrainingEvaluationHeader);
            //     status := 'success*Generated*Downloads\TrainingFeedback\' + docNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(69156, FILESPATH20 + docNo + '.pdf', TrainingEvaluationHeader);
            //     status := 'success*Generated*Downloads\TrainingFeedback\' + docNo + '.pdf';
            // end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnEditTrainingFeedbackLines(lineno: Integer; feedbackno: Code[100]; rating: Code[100]; category: Code[100]; comments: Text) status: Text
    var
        TrainingFeedbackLines: Record "Training Feedback Suggestions";
    begin
        TrainingFeedbackLines.Reset;
        TrainingFeedbackLines.SetRange("Training Application No", feedbackno);
        TrainingFeedbackLines.SetRange("Entry No.", lineno);
        if TrainingFeedbackLines.FindSet then begin
            TrainingFeedbackLines.Init;
            TrainingFeedbackLines.Rating := rating;
            TrainingFeedbackLines."Training Category" := category;
            TrainingFeedbackLines.Comments := comments;
            if TrainingFeedbackLines.Modify(true) then begin
                status := 'success*your training feedback line was successful updated';
            end else begin
                status := 'danger*your training feedback lines would not be updated';
            end;
        end;
    end;

    procedure fnDeleteTrainingFeedbackLines(lineno: Integer; feedbackno: Code[100]) status: Text
    var
        TrainingFeedbackLines: Record "Training Feedback Suggestions";
    begin
        TrainingFeedbackLines.Reset;
        TrainingFeedbackLines.SetRange("Training Application No", feedbackno);
        TrainingFeedbackLines.SetRange("Entry No.", lineno);
        if TrainingFeedbackLines.FindSet then begin
            if TrainingFeedbackLines.Delete(true) then begin
                status := 'success*Training feedback line has been removed successfully*';
            end else begin
                status := 'danger*Training feedback line could not be removed, please try again*';
            end;
        end;
    end;

    procedure SubmitTrainingFeedback(feedbackNo: Code[30]) status: Text
    var
        TrainingApplicationFeedback: Record "Training Evaluation Header";
    begin
        TrainingApplicationFeedback.Reset;
        TrainingApplicationFeedback.SetRange(No, feedbackNo);
        if TrainingApplicationFeedback.FindSet then begin
            TrainingApplicationFeedback.Status := TrainingApplicationFeedback.Status::Submitted;
            if TrainingApplicationFeedback.Modify(true) then begin
                status := 'success*your training feedback was successful submitted';
            end else begin
                status := 'danger*your training feedback was not successful';
            end;
        end;
    end;

    procedure createNewTrainingEvaluation(employeeNo: Code[30]; feedbackNo: Code[30]; applicationCode: Code[30]) status: Text
    var
        TrainingApplicationFeedback: Record "Training Evaluation Header";
        EmployeeSchedule: Record "Employee Scedule";
        TrainingRequests: Record "Training Requests";
    begin
        /*TrainingRequests.RESET;
        TrainingRequests.SETRANGE(Code,applicationCode);
        IF TrainingRequests.FINDSET THEN BEGIN
          IF feedbackNo='' THEN BEGIN
              TrainingApplicationFeedback.INIT;
              TrainingApplicationFeedback.Type:=TrainingApplicationFeedback.Type::Evaluation;
              TrainingApplicationFeedback."Employee No.":= employeeNo;
              TrainingApplicationFeedback.VALIDATE("Employee No.");
              TrainingApplicationFeedback."Application Code":= applicationCode;
              TrainingApplicationFeedback.VALIDATE("Application Code");
               IF TrainingApplicationFeedback.INSERT(TRUE) THEN BEGIN
                  TrainingApplicationFeedback.VALIDATE("Application Code");
                status:= 'success*your training evaluation request was successful*'+TrainingApplicationFeedback.No;
                END ELSE BEGIN
                   status:= 'danger*Your training evaluation failed, kindly try again!';
                END;
          END ELSE BEGIN
            TrainingApplicationFeedback.RESET;
            TrainingApplicationFeedback.SETRANGE(No,feedbackNo);
            TrainingApplicationFeedback.SETRANGE("Employee No.",employeeNo);
            IF TrainingApplicationFeedback.FINDSET THEN BEGIN
              TrainingApplicationFeedback."Application Code":= applicationCode;
              TrainingApplicationFeedback.VALIDATE("Application Code");
               IF TrainingApplicationFeedback.MODIFY(TRUE) THEN BEGIN
                TrainingApplicationFeedback.VALIDATE("Application Code");
                status:= 'success*your training evaluation request was successful*'+TrainingApplicationFeedback.No;
                END ELSE BEGIN
                   status:= 'danger*Your training evaluation failed, kindly try again!';
                END;
            END;
          END;
        END ELSE BEGIN
        status:= 'danger*Your are not allowed to submit training evaluation since you did not attend the training!';
        END;
        */

    end;

    procedure SubmitTrainingEvaluation(feedbackNo: Code[30]) status: Text
    var
        TrainingApplicationFeedback: Record "Training Evaluation Header";
    begin
        TrainingApplicationFeedback.Reset;
        TrainingApplicationFeedback.SetRange(No, feedbackNo);
        if TrainingApplicationFeedback.FindSet then begin
            TrainingApplicationFeedback.Status := TrainingApplicationFeedback.Status::Submitted;
            if TrainingApplicationFeedback.Modify(true) then begin
                status := 'success*your training evaluation was successful submitted';
            end else begin
                status := 'danger*your training evaluation was not successful';
            end;
        end;
    end;

    procedure fnGenerateTrainingEvaluationReport(docNo: Code[100]) status: Text
    var
        TrainingEvaluationHeader: Record "Training Evaluation Header";
    begin
        TrainingEvaluationHeader.Reset;
        TrainingEvaluationHeader.SetRange(No, docNo);
        if TrainingEvaluationHeader.FindSet then begin
            // if FILE.Exists(FILESPATH21 + docNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH21 + docNo + '.pdf');
            //     Report.SaveAsPdf(69153, FILESPATH21 + docNo + '.pdf', TrainingEvaluationHeader);
            //     status := 'success*Generated*Downloads\TrainingEvaluation\' + docNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(69153, FILESPATH21 + docNo + '.pdf', TrainingEvaluationHeader);
            //     status := 'success*Generated*Downloads\TrainingEvaluation\' + docNo + '.pdf';
            // end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnInsertEvaluationLines(docNo: Code[100]; lineNo: Integer; rating: Code[100]; comment: Text) status: Text
    var
        CategoryRatingScale: Record "Category Rating Scale";
    begin
        /*TrainingEvaluations.RESET;
        TrainingEvaluations.SETRANGE("Training Evaluation No",docNo);
        TrainingEvaluations.SETRANGE("Entry No.",lineNo);
        IF TrainingEvaluations.FINDSET THEN BEGIN
          CategoryRatingScale.RESET;
          CategoryRatingScale.SETRANGE("Rating Code",rating);
          IF CategoryRatingScale.FINDSET THEN BEGIN
            TrainingEvaluations."Rating Code":=rating;
            TrainingEvaluations."Rating Description":=CategoryRatingScale."Rating Description";
            TrainingEvaluations.Comments:=comment;
            IF TrainingEvaluations.MODIFY(TRUE) THEN BEGIN
              status:='success*comments added successfully';
            END ELSE BEGIN
              status:='danger*comments were not added successfully';
            END;
          END;
        END;
        */

    end;

    procedure leaveApplication(leaveNo: Code[50]; employeeNumber: Code[20]; leaveType: Code[20]; annualLeaveType: Option " ","Annual Leave","Emergency Leave"; daysApplied: Integer; lStartDate: DateTime; phoneNumber: Code[20]; emailAddress: Text; examdetails: Text; dateOfExam: DateTime; previousAttempts: Integer; reliever: Text[50]) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Applications";
    begin
        status := 'danger*Your leave application failed';
        annualLeaveType := annualLeaveType;
        case annualLeaveType of
            0:
                annualLeaveType := Annual::"Annual Leave";
            1:
                annualLeaveType := Annual::"Emergency Leave";

            else
        end;
        Employee.Reset;
        Employee.SetRange("No.", employeeNumber);
        if Employee.FindSet then begin
            if leaveNo = '' then begin //a new leave
                leaveApplications.Init;
                leaveApplications."Employee No" := employeeNumber;
                leaveApplications.Validate("Employee No");
                leaveApplications."Leave Type" := leaveType;
                leaveApplications.Validate("Leave Type");
                leaveApplications."Annual Leave Type" := annualLeaveType;
                leaveApplications."Days Applied" := daysApplied;
                leaveApplications."Start Date" := Dt2Date(lStartDate);
                leaveApplications."Cell Phone Number" := phoneNumber;
                leaveApplications."E-mail Address" := emailAddress;
                leaveApplications."Details of Examination" := examdetails;
                leaveApplications."Date of Exam" := Dt2Date(dateOfExam);
                leaveApplications."Number of Previous Attempts" := Format(previousAttempts);
                leaveApplications.Validate("Days Applied");
                leaveApplications.Validate("Date of Exam");
                leaveApplications.Reliever := reliever;
                leaveApplications.Validate(Reliever);
                if leaveApplications.Insert(true) then begin
                    leaveApplications."Employee No" := employeeNumber;
                    leaveApplications.Validate("Employee No");
                    leaveApplications.Validate("Start Date");
                    leaveApplications.Modify(true);
                    status := 'success*Your leave application was successfully placed *' + leaveApplications."Application Code";
                end;
            end else begin //existing leave application
                leaveApplications.Reset;
                leaveApplications.SetRange("Employee No", employeeNumber);
                leaveApplications.SetRange("Application Code", leaveNo);
                leaveApplications.SetRange(Status, leaveApplications.Status::Open);
                if leaveApplications.FindSet then begin
                    leaveApplications."Employee No" := employeeNumber;
                    leaveApplications.Validate("Employee No");
                    leaveApplications."Leave Type" := leaveType;
                    leaveApplications.Validate("Leave Type");
                    leaveApplications."Annual Leave Type" := annualLeaveType;
                    leaveApplications."Days Applied" := daysApplied;
                    leaveApplications."Start Date" := Dt2Date(lStartDate);
                    leaveApplications."Cell Phone Number" := phoneNumber;
                    leaveApplications."E-mail Address" := emailAddress;
                    leaveApplications."Details of Examination" := examdetails;
                    leaveApplications."Date of Exam" := Dt2Date(dateOfExam);
                    leaveApplications."Number of Previous Attempts" := Format(previousAttempts);
                    leaveApplications.Validate("Days Applied");
                    leaveApplications.Validate("Date of Exam");
                    leaveApplications.Reliever := reliever;
                    leaveApplications.Validate(Reliever);
                    if leaveApplications.Modify(true) then begin
                        leaveApplications."Employee No" := employeeNumber;
                        leaveApplications.Validate("Employee No");
                        leaveApplications.Validate("Start Date");
                        leaveApplications.Modify(true);
                        status := 'success*Your leave application was successfully updated *' + leaveApplications."Application Code";
                    end;
                end else begin
                    status := 'danger*A leave application with the given code does not exist, you are not the owner or is no longer open';
                end;
            end;
        end else begin
            status := 'danger*The selected employee does not exist';
        end;
    end;

    procedure generatePayslip(employeeNumber: Code[20]; payPeriod: DateTime) status: Text
    begin
        status := 'danger*could not generate your statement';
        Employee.Reset;
        Employee.SetRange(Employee."No.", employeeNumber);
        if Employee.FindSet then begin
            Employee.Reset;
            Employee.SetRange(Employee."No.", employeeNumber);
            Employee.SetRange("Pay Period Filter", Dt2Date(payPeriod));
            if Employee.FindSet then begin

                if FILE.Exists(FILESPATH1 + employeeNumber + '.pdf') then begin
                    FILE.Erase(FILESPATH1 + employeeNumber + '.pdf');
                    Report.SaveAsPdf(89028, FILESPATH1 + employeeNumber + '.pdf', Employee);
                    status := 'success*Generated*finance\payslip\' + employeeNumber + '.pdf';
                end
                else begin
                    Report.SaveAsPdf(89028, FILESPATH1 + employeeNumber + '.pdf', Employee);
                    status := 'success*Generated*finance\payslip\' + employeeNumber + '.pdf';
                end

            end;
        end
        else begin
            status := 'danger*Employee not found';
        end;
    end;

    procedure generateImprestMemo(employeeNumber: Code[20]; docNo: Text) status: Text
    begin

        Employee.RESET;
        Employee.SETRANGE(Employee."No.", employeeNumber);
        IF Employee.FINDSET THEN BEGIN
            ImprestMemo.Reset;
            ImprestMemo.SETRANGE(Requestor, employeeNumber);
            ImprestMemo.SetRange("No.", docNo);
            if ImprestMemo.FindSet then begin
                if FILE.Exists(STOREREPORTFILEPATH + employeeNumber + '.pdf') then begin
                    FILE.Erase(STOREREPORTFILEPATH + employeeNumber + '.pdf');
                    Report.SaveAsPdf(57001, STOREREPORTFILEPATH + employeeNumber + '.pdf', ImprestMemo);
                    status := 'success*Generated*Reports\' + employeeNumber + '.pdf';
                end else begin
                    Report.SaveAsPdf(57001, STOREREPORTFILEPATH + employeeNumber + '.pdf', ImprestMemo);
                    status := 'success*Generated*Reports\' + employeeNumber + '.pdf';
                end;
            end else begin
                ;
                status := 'danger*The Imprest number with the given number does not exist or your are not the requestor';
            end;
        END ELSE BEGIN
            status := 'danger*The Employee with the given number does not exist';
        END;

    end;

    procedure generateImprestMemo2(employeeNumber: Code[20]; docNo: Text) status: Text
    begin
        ImprestMemo.Reset;
        //ImprestMemo.SETRANGE(Requestor, employeeNumber);
        ImprestMemo.SetRange("No.", docNo);
        if ImprestMemo.FindSet then begin
            if FILE.Exists(STOREREPORTFILEPATH1 + docNo + '_approvers' + '.pdf') then begin
                FILE.Erase(STOREREPORTFILEPATH1 + docNo + '_approvers' + '.pdf');
                Report.SaveAsPdf(57001, STOREREPORTFILEPATH1 + docNo + '_approvers' + '.pdf', ImprestMemo);
                status := 'success*Generated*Reports\' + docNo + '_approvers' + '.pdf';
            end else begin
                Report.SaveAsPdf(57001, STOREREPORTFILEPATH1 + docNo + '_approvers' + '.pdf', ImprestMemo);
                status := 'success*Generated*Reports\' + docNo + '_approvers' + '.pdf';
            end;
        end else begin
            ;
            status := 'danger*The Imprest number with the given number does not exist or your are not the requestor';
        end;


    end;


    procedure generateEmployeeStatement(employeeNumber: Code[20]; startDate: Date; endDate: Date) status: Text
    begin
        Employee.Reset;
        Employee.SetRange(Employee."No.", employeeNumber);
        Employee.SetFilter("Date Filter", Format(startDate) + '..' + Format(endDate));
        if Employee.FindSet then begin
            if FILE.Exists(FILESPATH1 + employeeNumber + '.pdf') then
                FILE.Erase(FILESPATH1 + employeeNumber + '.pdf');
            Report.SaveAsPdf(57016, FILESPATH1 + employeeNumber + '.pdf', Employee);
            status := 'success*Generated*finance\payslip\' + employeeNumber + '.pdf';

        end
        else begin
            Report.SaveAsPdf(57016, FILESPATH3 + employeeNumber + '.pdf', Employee);

            status := 'success*Generated*finance\payslip\' + employeeNumber + '.pdf';
        end
    end;

    procedure generateP9(employeeNumber: Code[20]; startDate: Date; endDate: Date) status: Text
    begin
        Employee.Reset;
        Employee.SetRange(Employee."No.", employeeNumber);
        Employee.SetFilter(Employee."Date Filter", Format(Format(startDate) + '..' + Format(endDate)));
        Employee.SetFilter("Pay Period Filter", Format(Format(startDate) + '..' + Format(endDate)));
        if Employee.FindSet then begin
            if FILE.Exists(NEWFILESPATH2 + employeeNumber + '.pdf') then begin
                FILE.Erase(NEWFILESPATH2 + employeeNumber + '.pdf');
                Report.SaveAsPdf(69019, NEWFILESPATH2 + employeeNumber + '.pdf', Employee);
                status := 'success*Generated*finance\p9\' + employeeNumber + '.pdf';
            end else begin
                Report.SaveAsPdf(69019, NEWFILESPATH2 + employeeNumber + '.pdf', Employee);
                status := 'success*Generated*finance\p9\' + employeeNumber + '.pdf';
            end
        end else begin
            status := 'danger*The P9 Report could not be generated';
        end;
    end;

    procedure generatePurchaseRequisition(employeeNumber: Code[20]; docNo: Text) status: Text
    begin


        PurchaseHeader.Reset;
        //ImprestMemo.SETRANGE(Requestor,employeeNumber);
        PurchaseHeader.SetRange("No.", docNo);
        if PurchaseHeader.FindSet then begin
            // if FILE.Exists(FILESPATH5 + employeeNumber + '.pdf') then begin
            //     FILE.Erase(FILESPATH5 + employeeNumber + '.pdf');
            //     Report.SaveAsPdf(50097, FILESPATH5 + employeeNumber + '.pdf', PurchaseHeader);
            //     status := 'success*Generated*Downloads\PurchaseRequisition\' + employeeNumber + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(50097, FILESPATH5 + employeeNumber + '.pdf', PurchaseHeader);
            //     status := 'success*Generated*Downloads\PurchaseRequisition\' + employeeNumber + '.pdf';
            // end;
        end else begin

            status := 'danger*The Requisition  with the given number does not exist or your are not the requestor';
        end;
    end;

    procedure generateStoreRequisition(employeeNumber: Code[20]; docNo: Text) status: Text
    begin


        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("No.", docNo);

        if PurchaseHeader.FindSet then begin
            // if FILE.Exists(FILESPATH6 + employeeNumber + '.pdf') then begin
            //     FILE.Erase(FILESPATH6 + employeeNumber + '.pdf');
            //     Report.SaveAsPdf(70061, FILESPATH6 + employeeNumber + '.pdf', PurchaseHeader);
            //     status := 'success*Generated*Downloads\StoreRequisition\' + employeeNumber + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(70061, FILESPATH6 + employeeNumber + '.pdf', PurchaseHeader);
            //     status := 'success*Generated*Downloads\StoreRequisition\' + employeeNumber + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The Requisition number with the given number does not exist or your are not the requestor';
        end;
    end;


    procedure generateFleetReqReport(docNo: Code[100]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", docNo);
        IF TransportRequisition.FINDSET THEN BEGIN
            IF FILE.EXISTS(STOREREPORTFILEPATH + docNo + '.pdf') THEN BEGIN
                FILE.ERASE(STOREREPORTFILEPATH + docNo + '.pdf');
                REPORT.SAVEASPDF(59018, STOREREPORTFILEPATH + docNo + '.pdf', TransportRequisition);
                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END ELSE BEGIN
                REPORT.SAVEASPDF(59018, STOREREPORTFILEPATH + docNo + '.pdf', TransportRequisition);
                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END
        END ELSE BEGIN
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure generateStoreReqReport(docNo: Code[100]) status: Text
    begin
        PurchaseHeader.RESET;
        PurchaseHeader.SETRANGE("Document Type", PurchaseHeader."Document Type"::"Store Requisition");
        PurchaseHeader.SETRANGE("No.", docNo);
        IF PurchaseHeader.FINDSET THEN BEGIN
            IF FILE.EXISTS(STOREREPORTFILEPATH + docNo + '.pdf') THEN BEGIN
                FILE.ERASE(STOREREPORTFILEPATH + docNo + '.pdf');
                REPORT.SAVEASPDF(70009, STOREREPORTFILEPATH + docNo + '.pdf', PurchaseHeader);
                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END ELSE BEGIN
                REPORT.SAVEASPDF(70009, STOREREPORTFILEPATH + docNo + '.pdf', PurchaseHeader);
                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END
        END ELSE BEGIN
            status := 'danger*The Report could not be generated';
        end;
    end;
    //  procedure generateEmployeeReport(empNo: Code[100]) status: Text
    //     begin
    //         PurchaseHeader.RESET;
    //         PurchaseHeader.SETRANGE("Document Type", PurchaseHeader."Document Type"::"Store Requisition");
    //         PurchaseHeader.SETRANGE("No.", empNo);
    //         IF PurchaseHeader.FINDSET THEN BEGIN
    //             IF FILE.EXISTS(STOREREPORTFILEPATH + empNo + '.pdf') THEN BEGIN
    //                 FILE.ERASE(STOREREPORTFILEPATH + empNo + '.pdf');
    //                 REPORT.SAVEASPDF(57016, STOREREPORTFILEPATH + empNo + '.pdf', PurchaseHeader);
    //                 status := 'success*Generated*Reports\' + empNo + '.pdf';
    //             END ELSE BEGIN
    //                 REPORT.SAVEASPDF(57016, STOREREPORTFILEPATH + empNo + '.pdf', PurchaseHeader);
    //                 status := 'success*Generated*Reports\' + empNo + '.pdf';
    //             END
    //         END ELSE BEGIN
    //             status := 'danger*The Report could not be generated';
    //         end;
    //     end;
    procedure generatePurchaseReq(docNo: Code[100]) status: Text
    begin
        PurchaseHeader.RESET;
        PurchaseHeader.SETRANGE("Document Type", PurchaseHeader."Document Type"::"Purchase Requisition");
        PurchaseHeader.SETRANGE("No.", docNo);
        IF PurchaseHeader.FINDSET THEN BEGIN
            IF FILE.EXISTS(STOREREPORTFILEPATH + docNo + '.pdf') THEN BEGIN
                FILE.ERASE(STOREREPORTFILEPATH + docNo + '.pdf');
                REPORT.SAVEASPDF(50097, STOREREPORTFILEPATH + docNo + '.pdf', PurchaseHeader);
                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END ELSE BEGIN
                REPORT.SAVEASPDF(50097, STOREREPORTFILEPATH + docNo + '.pdf', PurchaseHeader);
                status := 'success*Generated*Reports\' + docNo + '.pdf';
            END
        END ELSE BEGIN
            status := 'danger*The Report could not be generated';
        end;
    end;


    procedure generateIssueVoucher(employeeNumber: Code[20]; docNo: Text) status: Text
    begin

        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("No.", docNo);
        if PurchaseHeader.FindSet then begin
            // if FILE.Exists(FILESPATH7 + employeeNumber + '.pdf') then begin
            //     FILE.Erase(FILESPATH7 + employeeNumber + '.pdf');
            //     Report.SaveAsPdf(70009, FILESPATH7 + employeeNumber + '.pdf', PurchaseHeader);
            //     status := 'success*Generated*Downloads\IssueVoucher\' + employeeNumber + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(70009, FILESPATH7 + employeeNumber + '.pdf', PurchaseHeader);
            //     status := 'success*Generated*Downloads\IssueVoucher\' + employeeNumber + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The Store number with the given number does not exist or your are not the requestor';
        end;
    end;

    procedure generatePettyCashVoucher(employeeNumber: Code[20]; docNo: Text) status: Text
    begin

        Payments.Reset;
        Payments.SetRange("No.", docNo);
        if Payments.FindSet then begin
            // if FILE.Exists(FILESPATH8 + employeeNumber + '.pdf') then begin
            //     FILE.Erase(FILESPATH8 + employeeNumber + '.pdf');
            //     Report.SaveAsPdf(57003, FILESPATH8 + employeeNumber + '.pdf', Payments);
            //     status := 'success*Generated*Downloads\PettyCashVoucher\' + employeeNumber + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(57003, FILESPATH8 + employeeNumber + '.pdf', Payments);
            //     status := 'success*Generated*Downloads\PettyCashVoucher\' + employeeNumber + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The petty cash with the given number does not exist or your are not the requestor';
        end;
    end;

    procedure generateStaffClaim(employeeNumber: Code[20]; docNo: Text) status: Text
    begin

        Payments.Reset;
        Payments.SetRange("No.", docNo);
        if Payments.FindSet then begin
            // if FILE.Exists(FILESPATH9 + employeeNumber + '.pdf') then begin
            //     FILE.Erase(FILESPATH9 + employeeNumber + '.pdf');
            //     Report.SaveAsPdf(57011, FILESPATH9 + employeeNumber + '.pdf', Payments);
            //     status := 'success*Generated*Downloads\StaffClaim\' + employeeNumber + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(57011, FILESPATH9 + employeeNumber + '.pdf', Payments);
            //     status := 'success*Generated*Downloads\StaffClaim\' + employeeNumber + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The staff claim with the given number does not exist or your are not the requestor';
        end;
    end;

    procedure register("First Name": Text; "Middle Name": Text; "Last name": Text; "Email Address": Text; "Phone Number": Code[20]; "idNumber/Passport": Code[20]; citizenship: Code[20]; gender: Text) status: Text
    var
        password: Integer;
        passwordOk: Boolean;
    begin
        //check that the user does not exist by id
        //check that the user does not exist by email
        status := 'danger*Your account could not be created';
        HrJobsApplicants.Reset;
        HrJobsApplicants.SetRange("ID Number", "idNumber/Passport");
        if HrJobsApplicants.FindSet then begin
            status := 'danger*Another user with the given id number already exists. ';
        end else begin
            HrJobsApplicants.Reset;
            HrJobsApplicants.SetRange("E-Mail", "Email Address");
            if HrJobsApplicants.FindSet then begin
                status := 'danger*Another user with the given email address already exists. ';
            end else begin
                //check employee
                Employee.Reset;
                Employee.SetRange(Employee."ID Number", "idNumber/Passport");
                if Employee.FindSet then begin
                    status := 'danger*Your account could not be created since you have been registered as an employee. ';
                end else begin
                    //create account
                    HrJobsApplicants.Init;
                    HrJobsApplicants."ID Number" := "idNumber/Passport";
                    HrJobsApplicants."First Name" := "First Name";
                    HrJobsApplicants."Middle Name" := "Middle Name";
                    HrJobsApplicants."Last Name" := "Last name";
                    HrJobsApplicants."E-Mail" := "Email Address";
                    HrJobsApplicants."Cell Phone Number" := "Phone Number";
                    HrJobsApplicants.Citizenship := citizenship;
                    HrJobsApplicants.Gender := HrJobsApplicants.Gender::Female;
                    if gender = 'male' then
                        HrJobsApplicants.Gender := HrJobsApplicants.Gender::Male;
                    if HrJobsApplicants.Insert(true) then begin
                        passwordOk := false;
                        repeat
                            password := Random(9999);
                            if password > 1000 then
                                passwordOk := true;
                        until passwordOk = true;
                        //create account
                        HRPortalUsers.Init;
                        HRPortalUsers.IdNo := "idNumber/Passport";
                        HRPortalUsers.password := Format(password);
                        if HRPortalUsers.Insert(true) then begin
                            objMail.CreateMessage("Email Address", '', '', 'One Time Password', 'Your one time password is <strong>' + Format(password) + '</strong>', TRUE, true);
                            // objMail.Send();
                            status := 'success*Your account was successfully created. Please refer to the next instructions sent via email ';
                        end else begin
                            HrJobsApplicants.Delete;
                            status := 'danger*Your account could not be created. Please try again later ';
                        end;
                    end else begin
                        status := 'danger*Your account could not be created. Please try again later ';
                    end;
                end;
            end;
        end;
    end;

    procedure addHobby(idNumber: Code[20]; hobby: Text) status: Text
    begin
        status := 'danger*The hobby could not be added';
        if HrJobsApplicants.Get(idNumber) then begin
            JobApplicantHobbies.Init;
            JobApplicantHobbies."Id No" := idNumber;
            JobApplicantHobbies.Hobby := hobby;
            if JobApplicantHobbies.Insert(true) then begin
                status := 'success*The hobby was successfully added';
            end else begin
                status := 'danger*The hobby could not be added';
            end;
        end else begin
            status := 'danger*The selected employee does not exist';
        end;
        exit(status);
    end;

    procedure updateGeneralDetails(idNumber: Code[20]; firstName: Text; middleName: Text; lastName: Text; initials: Text; firstLanguage: Code[20]; firstLanguageRead: Boolean; firstLanguageWrite: Boolean; firstLanguageSpeak: Boolean; secondLanguage: Code[20]; secondLanguageRead: Boolean; secondLanguageWrite: Boolean; secondLanguageSpeak: Boolean; additionalLanguage: Code[20]; gender: Text; citizenship: Code[20]) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            HrJobsApplicants."First Name" := firstName;
            HrJobsApplicants."Middle Name" := middleName;
            HrJobsApplicants."Last Name" := lastName;
            HrJobsApplicants.Initials := initials;
            HrJobsApplicants."First Language (R/W/S)" := firstLanguage;
            HrJobsApplicants."First Language Read" := firstLanguageRead;
            HrJobsApplicants."First Language Write" := firstLanguageWrite;
            HrJobsApplicants."First Language Speak" := firstLanguageSpeak;
            HrJobsApplicants."Second Language (R/W/S)" := secondLanguage;
            HrJobsApplicants."Second Language Read" := secondLanguageRead;
            HrJobsApplicants."Second Language Write" := secondLanguageWrite;
            HrJobsApplicants."Second Language Speak" := secondLanguageSpeak;
            HrJobsApplicants."Additional Language" := additionalLanguage;
            if gender = 'Female' then
                HrJobsApplicants.Gender := HrJobsApplicants.Gender::Female;
            if gender = 'Male' then
                HrJobsApplicants.Gender := HrJobsApplicants.Gender::Male;
            HrJobsApplicants.Citizenship := citizenship;
            if HrJobsApplicants.Modify(true) then begin
                status := 'success*Your profile was successfully updated';
            end else begin
                status := 'danger*Your profile could not be updated. Please try again later';
            end;

        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure updatePersonalDetails(idNumber: Code[20]; maritalStatus: Text; ethnicOrigin: Text; disabled: Text; healthAssessment: Boolean; healthAssessmentDate: Date; dateOfBirth: Date) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            if maritalStatus = '' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::" ";
            if maritalStatus = 'Single' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Single;
            if maritalStatus = 'Married' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Married;
            if maritalStatus = 'Separated' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Separated;
            if maritalStatus = 'Divorced' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Divorced;
            if maritalStatus = 'Widow(er)' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::"Widow(er)";
            if maritalStatus = 'Other' then
                HrJobsApplicants."Marital Status" := HrJobsApplicants."marital status"::Other;
            if ethnicOrigin = 'African' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::African;
            if ethnicOrigin = 'Indian' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::Indian;
            if ethnicOrigin = 'White' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::White;
            if ethnicOrigin = 'Coloured' then
                HrJobsApplicants."Ethnic Origin" := HrJobsApplicants."ethnic origin"::Coloured;
            if disabled = '' then
                HrJobsApplicants.Disabled := HrJobsApplicants.Disabled::" ";
            if disabled = 'No' then
                HrJobsApplicants.Disabled := HrJobsApplicants.Disabled::No;
            if disabled = 'Yes' then
                HrJobsApplicants.Disabled := HrJobsApplicants.Disabled::Yes;
            HrJobsApplicants."Health Assesment?" := healthAssessment;
            HrJobsApplicants."Health Assesment Date" := healthAssessmentDate;
            HrJobsApplicants."Date Of Birth" := dateOfBirth;
            if HrJobsApplicants.Modify(true) then begin
                status := 'success*Your profile was successfully updated' + Format(healthAssessmentDate);
            end else begin
                status := 'danger*Your profile could not be updated. Please try again later';
            end;
        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure updateCommunicationDetails(idNumber: Code[20]; homePhoneNumber: Text; postalAddress: Text; postalAddress2: Text; postalAddress3: Text; residentialAddress: Text; residentialAddress2: Text; residentialAddress3: Text; cellPhoneNumber: Text; workPhoneNumber: Text; extension: Text; fax: Text; postCode: Code[20]; postCode2: Code[20]) status: Text
    begin
        if HrJobsApplicants.Get(idNumber) then begin
            HrJobsApplicants."Home Phone Number" := homePhoneNumber;
            HrJobsApplicants."Postal Address" := postalAddress;
            HrJobsApplicants."Postal Address2" := postalAddress2;
            HrJobsApplicants."Postal Address3" := postalAddress3;
            HrJobsApplicants."Residential Address" := residentialAddress;
            HrJobsApplicants."Residential Address2" := residentialAddress2;
            HrJobsApplicants."Residential Address3" := residentialAddress3;
            HrJobsApplicants."Cell Phone Number" := cellPhoneNumber;
            HrJobsApplicants."Work Phone Number" := workPhoneNumber;
            HrJobsApplicants."Ext." := extension;
            HrJobsApplicants."Fax Number" := fax;
            HrJobsApplicants."Post Code" := postCode;
            HrJobsApplicants."Post Code2" := postCode2;
            if HrJobsApplicants.Modify(true) then begin
                status := 'success*Your profile was successfully updated';
            end else begin
                status := 'danger*Your profile could not be updated. Please try again later';
            end;
        end else begin
            status := 'danger*A user with the given ID Number does not exist';
        end;
    end;

    procedure addReferee(idNumber: Code[20]; refName: Text; refDesignation: Text; refInstitution: Text; refAddress: Text; refTelephone: Text; refEmail: Text) status: Text
    begin
        //JobApplicantReferees
        /*IF HrJobsApplicants.GET(idNumber) THEN BEGIN
          JobApplicantReferees.INIT;
          JobApplicantReferees.Code:=idNumber;
          JobApplicantReferees."Job Application No":= refName;
          JobApplicantReferees."Job Indicator Code":=refDesignation;
          JobApplicantReferees."Indicator Description":=refInstitution;
          JobApplicantReferees.Number:=refAddress;
          JobApplicantReferees."Additional Comments":=refTelephone;
          JobApplicantReferees."Job ID":=refEmail;
          IF JobApplicantReferees.INSERT(TRUE) THEN BEGIN
            status:='success*The referee was successfully added';
            END ELSE BEGIN
              status:='danger*The referee could not be added';
              END;
          END ELSE BEGIN
            status:='danger*A user with the given ID Number does not exist';
            END;*/

    end;

    procedure addQualification(idNumber: Code[20]; qualificationType: Text; qualificationCode: Code[20]; qualificationFrom: Date; qualificationTo: Date; institution: Text) status: Text
    begin
        /*
        IF HrJobsApplicants.GET(idNumber) THEN BEGIN
          JobApplicantsQualifications.INIT;
          JobApplicantsQualifications.Code:= idNumber;
         JobApplicantsQualifications."Qualification Type":=qualificationType ;
          JobApplicantsQualifications."Qualification Code":= qualificationCode;
          JobApplicantsQualifications.VALIDATE("Qualification Code");
          JobApplicantsQualifications."Indicator Description":=qualificationFrom;
          JobApplicantsQualifications.Number:=qualificationTo;
          JobApplicantsQualifications."Institution/Company":=institution;
          IF JobApplicantsQualifications.INSERT(TRUE) THEN BEGIN
            status:='success*The qualification was successfully added';
            END ELSE BEGIN
              status:='danger*The qualification could not be added';
              END;
          END ELSE BEGIN
            status:='danger*A user with the given ID Number does not exist';
            END;
            */

    end;

    procedure apply(idNumber: Code[20]; jobId: Code[20]) status: Text
    begin
        /*
        IF HrJobsApplicants.GET(idNumber) THEN BEGIN
          CompanyJobs.RESET;
          CompanyJobs.SETRANGE("Job ID", jobId);
          CompanyJobs.SETRANGE(Advertised, TRUE);
          IF CompanyJobs.FINDSET THEN BEGIN
            IF CompanyJobs."Vacant Positions">0 THEN BEGIN
              //apply for job
              //check if user has already applied for the job
              JobPositionApplications.RESET;
              JobPositionApplications.SETRANGE(JobPositionApplications."Job Applied For", jobId);
              JobPositionApplications.SETRANGE(JobPositionApplications."ID Number", idNumber);
              IF JobPositionApplications.FINDSET THEN BEGIN
                status:='danger*It seems you have already applied for this position. Please try another position';
                END ELSE BEGIN
                  JobPositionApplications.INIT;
                  JobPositionApplications."Job ID":= HrJobsApplicants."First Name";
                  JobPositionApplications."From Date":= HrJobsApplicants."Middle Name";
                  JobPositionApplications."To Date":= HrJobsApplicants."Last Name";
                  JobPositionApplications.Institution:= HrJobsApplicants.Initials;
                  JobPositionApplications."First Language (R/W/S)":= HrJobsApplicants."First Language (R/W/S)";
                  JobPositionApplications."First Language (R/W/S)":= HrJobsApplicants."First Language (R/W/S)";
                  JobPositionApplications."ID Number":= HrJobsApplicants."ID Number";
                  JobPositionApplications."Job Applied For":= jobId;
                  JobPositionApplications."Second Language (R/W/S)":= HrJobsApplicants."Second Language (R/W/S)";
                  JobPositionApplications."Second Language Read":= HrJobsApplicants."Second Language Read";
                  JobPositionApplications."Second Language Speak":= HrJobsApplicants."Second Language Speak";
                  JobPositionApplications."Second Language Write":= HrJobsApplicants."Second Language Write";
                  JobPositionApplications."Additional Language":= HrJobsApplicants."Additional Language";
                  JobPositionApplications."Applicant Type":= JobPositionApplications."Applicant Type"::"0";
                  JobPositionApplications.Gender:= HrJobsApplicants.Gender;
                  JobPositionApplications.Citizenship:= HrJobsApplicants.Citizenship;
                  JobPositionApplications.VALIDATE(Citizenship);
                  JobPositionApplications."Marital Status":= HrJobsApplicants."Marital Status";
                  JobPositionApplications."Ethnic Origin":= HrJobsApplicants."Ethnic Origin";
                  JobPositionApplications.Disabled:= HrJobsApplicants.Disabled;
                  JobPositionApplications."Health Assesment?":= HrJobsApplicants."Health Assesment?";
                  JobPositionApplications."Health Assesment Date":= HrJobsApplicants."Health Assesment Date";
                  JobPositionApplications."Date Of Birth":= HrJobsApplicants."Date Of Birth";
                  JobPositionApplications.Age:= HrJobsApplicants.Age;
                  JobPositionApplications."Home Phone Number":= HrJobsApplicants."Home Phone Number";
                  JobPositionApplications.Grade:= HrJobsApplicants."Postal Address";
                  JobPositionApplications."Postal Address2":= HrJobsApplicants."Postal Address2";
                  JobPositionApplications."Postal Address3":= HrJobsApplicants."Postal Address3";
                  JobPositionApplications.Code:= HrJobsApplicants."Post Code";
                  JobPositionApplications."Post Code2":= HrJobsApplicants."Post Code2";
                  JobPositionApplications."Cell Phone Number":= HrJobsApplicants."Cell Phone Number";
                  JobPositionApplications."Work Phone Number":= HrJobsApplicants."Work Phone Number";
                  JobPositionApplications."Ext.":= HrJobsApplicants."Ext.";
                  JobPositionApplications."E-Mail":= HrJobsApplicants."E-Mail";
                  JobPositionApplications."Fax Number":= HrJobsApplicants."Fax Number";
                      IF JobPositionApplications.INSERT(TRUE) THEN BEGIN
                        status:='success*You job application was successfully captured. Thank you';
                        END ELSE BEGIN
                          status:='danger*You application could not be captured. Please try again later';
                          END;
                  END;
              END ELSE BEGIN
                status:='danger*The selected job does not have any open position';
                END;
            END ELSE BEGIN
                 status:='danger*The selected job is no longer available';
              END;
           END ELSE BEGIN
            status:='danger*A user with the given ID Number does not exist';
            END;
            */

    end;

    procedure imprestGeneralDetails(employeeNo: Code[50]; imprestNo: Code[20]; subject: Text; objective: Text; destinationNarration: Text; travelDate: Date; numberOfDays: Decimal; job: Code[50]; jobTaskNo: Code[50]; fundCode: Code[100]; username: Text) status: Text
    var
        ObjNoSeriesMgt: Codeunit NoSeriesManagement;
        ObjCashMgtSetup: Record "Cash Management Setup";
        tbl_employee: Record Employee;
        tbl_userSetup: Record "User Setup";
    begin
        status := 'danger*Your imprest requisition could not be captured';
        if imprestNo = '' then begin
            ImprestMemo.Init;
            ImprestMemo."User ID" := 'KURA\' + username.ToUpper();
            ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
            ImprestMemo.status := ImprestMemo.Status::Open;
            ImprestMemo.Subject := subject;
            ImprestMemo.Validate(Subject);
            ImprestMemo."Imprest Naration" := destinationNarration;
            ImprestMemo.Validate("Imprest Naration");
            ImprestMemo."Start Date" := travelDate;
            ImprestMemo.Validate("Start Date");
            ImprestMemo."No. of days" := numberOfDays;
            ImprestMemo.Validate("No. of days");
            ImprestMemo.Requestor := employeeNo;
            ImprestMemo.Validate(Requestor);
            ImprestMemo.Job := job;
            ImprestMemo."Job  Task" := jobTaskNo;
            ImprestMemo.Validate("Job  Task");
            tbl_employee.Reset;
            tbl_employee.SetRange("No.", employeeNo);
            if tbl_employee.FindSet then
                ImprestMemo."Responsibility Center" := tbl_employee."Global Dimension 1 Code";
            ImprestMemo."Shortcut Dimension 2 Code" := tbl_employee."Global Dimension 2 Code";
            ImprestMemo."Funding Source" := '15% OPS';
            ImprestMemo.Project := job;
            tbl_userSetup.Reset;
            tbl_userSetup.SetRange("Employee No.", employeeNo);
            if tbl_userSetup.FindFirst then
                if not tbl_userSetup."Allow Create Imprest" then
                    error('Only Administrators can create imprests.');

            if ImprestMemo.Insert(true) then begin
                //   ImprestMemo.Validate("Refernce No");

                ImprestMemo.Validate("No. of days");
                ImprestMemo.Validate(Requestor);
                ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
                ImprestMemo.Modify(true);
                //try updating the blob field
                ImprestMemo.CalcFields(Objective);
                ImprestMemo.Objective.CreateInstream(LegInstr);
                Leg.Read(LegInstr);
                LegText := objective;
                if LegText <> Format(Leg) then begin
                    Clear(ImprestMemo.Objective);
                    Clear(Leg);
                    Leg.AddText(LegText);
                    ImprestMemo.Objective.CreateOutstream(LegOutStr);
                    Leg.Write(LegOutStr);
                    ImprestMemo.Modify;
                end;

                status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
            end else begin
                status := 'danger*Your imprest requisition could not be created';
            end;
        end else begin
            ImprestMemo.Reset;
            ImprestMemo.SetRange(Requestor, employeeNo);
            ImprestMemo.SetRange("No.", imprestNo);
            ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
            ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
            if ImprestMemo.FindSet then begin
                ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
                ImprestMemo.Subject := subject;
                ImprestMemo.Validate(Subject);
                ImprestMemo."Imprest Naration" := destinationNarration;
                ImprestMemo.Validate("Imprest Naration");
                ImprestMemo."Start Date" := travelDate;
                ImprestMemo.Validate("Start Date");
                ImprestMemo."No. of days" := numberOfDays;
                ImprestMemo.Requestor := employeeNo;
                ImprestMemo.Job := job;
                ImprestMemo."Job  Task" := jobTaskNo;
                //   ImprestMemo."Refernce No" := referenceNo;
                ImprestMemo.Validate(Requestor);
                tbl_employee.Reset;
                tbl_employee.SetRange("No.", employeeNo);
                if tbl_employee.FindSet then
                    ImprestMemo."Responsibility Center" := tbl_employee."Global Dimension 1 Code";
                ImprestMemo."Shortcut Dimension 2 Code" := tbl_employee."Global Dimension 2 Code";
                ImprestMemo."Funding Source" := '15% OPS';
                ImprestMemo.Project := job;
                if ImprestMemo.Modify(true) then begin
                    ImprestMemo.Validate("No. of days");
                    ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
                    ImprestMemo.Modify(true);
                    ImprestMemo.CalcFields(Objective);
                    ImprestMemo.Objective.CreateInstream(LegInstr);
                    Leg.Read(LegInstr);
                    LegText := objective;
                    if LegText <> Format(Leg) then begin
                        Clear(ImprestMemo.Objective);
                        Clear(Leg);
                        Leg.AddText(LegText);
                        ImprestMemo.Objective.CreateOutstream(LegOutStr);
                        Leg.Write(LegOutStr);
                        ImprestMemo.Modify;
                    end;

                    status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
                end else begin
                    status := 'danger*Your imprest requisition could not be created';
                end;

            end else begin

                ImprestMemo.Reset;
                ImprestMemo.SetRange(Requestor, employeeNo);
                ImprestMemo.SetRange("No.", imprestNo);
                ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
                ImprestMemo.SetRange(Status, ImprestMemo.Status::Released);
                if ImprestMemo.FindSet then begin
                    ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
                    ImprestMemo.Subject := subject;
                    ImprestMemo.Validate(Subject);
                    //ImprestMemo.Objective:= objective;
                    ImprestMemo."Imprest Naration" := destinationNarration;
                    ImprestMemo.Validate("Imprest Naration");
                    ImprestMemo."Start Date" := travelDate;
                    ImprestMemo.Validate("Start Date");
                    ImprestMemo."No. of days" := numberOfDays;
                    //ImprestMemo.VALIDATE("No. of days");
                    ImprestMemo.Job := job;
                    ImprestMemo.Validate(Job);
                    ImprestMemo."Job  Task" := jobTaskNo;
                    ImprestMemo.Validate("Job  Task");
                    ImprestMemo.Requestor := employeeNo;
                    ImprestMemo.Job := job;
                    ImprestMemo."Job  Task" := jobTaskNo;
                    ImprestMemo.Validate(Requestor);
                    tbl_employee.Reset;
                    tbl_employee.SetRange("No.", employeeNo);
                    if tbl_employee.FindSet then
                        ImprestMemo."Responsibility Center" := tbl_employee."Global Dimension 1 Code";
                    ImprestMemo."Shortcut Dimension 2 Code" := tbl_employee."Global Dimension 2 Code";
                    ImprestMemo."Funding Source" := '15% OPS';
                    ImprestMemo.Project := job;
                    if ImprestMemo.Modify(true) then begin
                        ImprestMemo.Validate("No. of days");

                        ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
                        ImprestMemo.Modify(true);
                        //try updating the blob field
                        ImprestMemo.CalcFields(Objective);
                        ImprestMemo.Objective.CreateInstream(LegInstr);
                        Leg.Read(LegInstr);
                        LegText := objective;
                        if LegText <> Format(Leg) then begin
                            Clear(ImprestMemo.Objective);
                            Clear(Leg);
                            Leg.AddText(LegText);
                            ImprestMemo.Objective.CreateOutstream(LegOutStr);
                            Leg.Write(LegOutStr);
                            ImprestMemo.Modify;
                        end;

                        status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
                    end else begin
                        status := 'danger*Your imprest requisition could not be created';
                    end;

                end else begin
                    status := 'danger*You are not the requester of the specified imprest memo. Please create a new imprest memo';
                end
            end;

        end;
        exit(status);
    end;

    procedure imprestGeneralDetails1(employeeNo: Code[50]; imprestNo: Code[20]; subject: Text; objective: Text; destinationNarration: Text; travelDate: Date; numberOfDays: Decimal; job: Code[50]; jobTaskNo: Code[50]; fundCode: Code[100]; referenceNo: Code[100]) status: Text
    var
        ObjNoSeriesMgt: Codeunit NoSeriesManagement;
        ObjCashMgtSetup: Record "Cash Management Setup";
    begin
        status := 'danger*Your imprest requisition could not be captured';
        if imprestNo = '' then begin
            //ObjCashMgtSetup.GET;
            ImprestMemo.Init;
            ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
            //ImprestMemo."No.":=ObjNoSeriesMgt.GetNextNo(ObjCashMgtSetup."Imprest Memo Nos",TODAY,TRUE);
            ImprestMemo.Subject := subject;
            ImprestMemo.Validate(Subject);
            //ImprestMemo.Objective:= objective;
            ImprestMemo."Imprest Naration" := destinationNarration;
            ImprestMemo.Validate("Imprest Naration");
            ImprestMemo."Start Date" := travelDate;
            //ImprestMemo."Number of Drivers":=noofdrivers;
            ImprestMemo.Validate("Start Date");
            ImprestMemo."No. of days" := numberOfDays;
            ImprestMemo.Validate("No. of days");
            ImprestMemo.Job := job;
            ImprestMemo.Validate(Job);
            ImprestMemo."Job  Task" := jobTaskNo;
            ImprestMemo.Validate("Job  Task");
            ImprestMemo.Requestor := employeeNo;
            //ImprestMemo."Mode of Transport":=modeoftransport;
            //Added By Fred
            Employee.Reset;
            Employee.SetRange("No.", employeeNo);
            if Employee.FindSet then
                ImprestMemo."Responsibility Center" := Employee."Global Dimension 1 Code";
            //Added By Fred

            ImprestMemo."Refernce No" := referenceNo;
            if ImprestMemo.Insert(true) then begin
                ImprestMemo.Validate("Refernce No");
                ImprestMemo.Validate("No. of days");
                //ImprestMemo.Requestor:= employeeNo;
                ImprestMemo.Validate(Requestor);
                ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
                ImprestMemo.Modify(true);
                //try updating the blob field
                ImprestMemo.CalcFields(Objective);
                ImprestMemo.Objective.CreateInstream(LegInstr);
                Leg.Read(LegInstr);
                LegText := objective;
                if LegText <> Format(Leg) then begin
                    Clear(ImprestMemo.Objective);
                    Clear(Leg);
                    Leg.AddText(LegText);
                    ImprestMemo.Objective.CreateOutstream(LegOutStr);
                    Leg.Write(LegOutStr);
                    ImprestMemo.Modify;
                end;

                status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
            end else begin
                status := 'danger*Your imprest requisition could not be created';
            end;
        end else begin
            ImprestMemo.Reset;
            ImprestMemo.SetRange(Requestor, employeeNo);
            ImprestMemo.SetRange("No.", imprestNo);
            ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
            ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
            if ImprestMemo.FindSet then begin
                ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
                ImprestMemo.Subject := subject;
                ImprestMemo.Validate(Subject);
                //ImprestMemo.Objective:= objective;
                ImprestMemo."Imprest Naration" := destinationNarration;
                ImprestMemo.Validate("Imprest Naration");
                ImprestMemo."Start Date" := travelDate;
                ImprestMemo.Validate("Start Date");
                ImprestMemo."No. of days" := numberOfDays;
                //ImprestMemo.VALIDATE("No. of days");
                ImprestMemo.Job := job;
                ImprestMemo.Validate(Job);
                ImprestMemo."Job  Task" := jobTaskNo;
                ImprestMemo.Validate("Job  Task");
                ImprestMemo.Requestor := employeeNo;
                //Added By Fred
                Employee.Reset;
                Employee.SetRange("No.", employeeNo);
                if Employee.FindSet then
                    ImprestMemo."Responsibility Center" := Employee."Global Dimension 1 Code";
                //Added By Fred
                ImprestMemo."Refernce No" := referenceNo;
                ImprestMemo.Validate(Requestor);
                if ImprestMemo.Modify(true) then begin
                    ImprestMemo.Validate("No. of days");
                    ImprestMemo.Requestor := employeeNo;
                    ImprestMemo.Validate(Requestor);
                    ImprestMemo.Validate("Refernce No");
                    ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
                    ImprestMemo.Modify(true);
                    //try updating the blob field
                    ImprestMemo.CalcFields(Objective);
                    ImprestMemo.Objective.CreateInstream(LegInstr);
                    Leg.Read(LegInstr);
                    LegText := objective;
                    if LegText <> Format(Leg) then begin
                        Clear(ImprestMemo.Objective);
                        Clear(Leg);
                        Leg.AddText(LegText);
                        ImprestMemo.Objective.CreateOutstream(LegOutStr);
                        Leg.Write(LegOutStr);
                        ImprestMemo.Modify;
                    end;

                    status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
                end else begin
                    status := 'danger*Your imprest requisition could not be created';
                end;

            end else begin

                ImprestMemo.Reset;
                ImprestMemo.SetRange(Requestor, employeeNo);
                ImprestMemo.SetRange("No.", imprestNo);
                ImprestMemo.SetRange("Document Type", ImprestMemo."document type"::"Imprest Memo");
                ImprestMemo.SetRange(Status, ImprestMemo.Status::Released);
                if ImprestMemo.FindSet then begin
                    ImprestMemo."Document Type" := ImprestMemo."document type"::"Imprest Memo";
                    ImprestMemo.Subject := subject;
                    ImprestMemo.Validate(Subject);
                    //ImprestMemo.Objective:= objective;
                    ImprestMemo."Imprest Naration" := destinationNarration;
                    ImprestMemo.Validate("Imprest Naration");
                    ImprestMemo."Start Date" := travelDate;
                    ImprestMemo.Validate("Start Date");
                    ImprestMemo."No. of days" := numberOfDays;
                    //ImprestMemo.VALIDATE("No. of days");
                    ImprestMemo.Job := job;
                    ImprestMemo.Validate(Job);
                    ImprestMemo."Job  Task" := jobTaskNo;
                    ImprestMemo.Validate("Job  Task");
                    ImprestMemo.Requestor := employeeNo;
                    ImprestMemo.Validate(Requestor);
                    if ImprestMemo.Modify(true) then begin
                        ImprestMemo.Validate("No. of days");
                        ImprestMemo.Requestor := employeeNo;
                        //Added By Fred
                        Employee.Reset;
                        Employee.SetRange("No.", employeeNo);
                        if Employee.FindSet then
                            ImprestMemo."Responsibility Center" := Employee."Global Dimension 1 Code";
                        //Added By Fred
                        ImprestMemo.Validate(Requestor);
                        ImprestMemo.Validate("Shortcut Dimension 3 Code", fundCode);
                        ImprestMemo.Modify(true);
                        //try updating the blob field
                        ImprestMemo.CalcFields(Objective);
                        ImprestMemo.Objective.CreateInstream(LegInstr);
                        Leg.Read(LegInstr);
                        LegText := objective;
                        if LegText <> Format(Leg) then begin
                            Clear(ImprestMemo.Objective);
                            Clear(Leg);
                            Leg.AddText(LegText);
                            ImprestMemo.Objective.CreateOutstream(LegOutStr);
                            Leg.Write(LegOutStr);
                            ImprestMemo.Modify;
                        end;

                        status := 'success*Your imprest requisition was successfully created*' + ImprestMemo."No.";
                    end else begin
                        status := 'danger*Your imprest requisition could not be created';
                    end;

                end else begin
                    status := 'danger*You are not the requester of the specified imprest memo. Please create a new imprest memo';
                end


            end;


        end;


        exit(status);
    end;

    procedure getImprestObjective(imprestNo: Code[50]; employeeNo: Code[50]) objective: Text
    begin
        objective := '';
        ImprestMemo.Reset;
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Requestor, employeeNo);
        if ImprestMemo.FindSet then begin
            ImprestMemo.CalcFields(Objective);
            ImprestMemo.Objective.CreateInstream(LegInstr);
            Leg.Read(LegInstr);
            LegText := Format(Leg);

            //Convert Project Legectives from BLOB to TXT
            ImprestMemo.CalcFields(Objective);
            ImprestMemo.Objective.CreateInstream(LegInstr);
            Leg.Read(LegInstr);

            if LegText <> Format(obj) then begin
                Clear(ImprestMemo.Objective);
                Clear(Leg);
                Leg.AddText(LegText);
                ImprestMemo.Objective.CreateOutstream(LegOutStr);
                Leg.Write(LegOutStr);
            end;
            objective := Format(Leg);
        end;
        exit(objective);
    end;

    procedure addTeamMember(employeeNo: Code[50]; imprestNo: Code[50]; destinationTown: Text; traveltype: Option; voteItem: Text; teamMember: Text; noOfDays: Decimal; job: Code[30]; jobTask: Code[30]) status: Text
    var
        ProjectMembers: Record "Project Members";
        ReturnDate: Date;
        Days: Text;
    begin
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ReturnDate := CalcDate(StrSubstNo('<%1D>', noOfDays), ImprestMemo."Start Date");
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", teamMember);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", destinationTown);
            if ProjectMembers.FindSet then begin
                status := 'danger*The given team member with Project : ' + ProjectMembers."Imprest Memo No." + ' has already been added to the selected imprest';
            end else begin
                ProjectMembers.RESET;
                ProjectMembers.SETRANGE("No.", teamMember);
                ProjectMembers.SETRANGE("Return Date", ImprestMemo."Start Date", ReturnDate);
                IF ProjectMembers.FINDSET THEN BEGIN
                    status := 'danger*This employee is tied in another imprest memo : ' + ProjectMembers."Imprest Memo No.";

                end;
                ProjectMembers.Init;
                ProjectMembers.Type := ProjectMembers.Type::Person;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers.Validate("Imprest Memo No.");
                ProjectMembers."Work Type" := destinationTown;
                ProjectMembers.Validate("Work Type");
                ProjectMembers."Type of Expense" := voteItem;
                ProjectMembers."Advance Type" := voteItem;
                ProjectMembers.Validate("Advance Type");
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := teamMember;
                ProjectMembers.Validate("No.");
                ProjectMembers."Line No" := ProjectMembers.Count + 1;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := noOfDays;
                ProjectMembers.Validate("Time Period");
                ProjectMembers.Job := job;
                ProjectMembers."Job  Task" := jobTask;
                ProjectMembers.Validate(Job);
                ProjectMembers.Validate("Job  Task");

                if ProjectMembers.Insert(true) then begin
                    ProjectMembers.Validate("Time Period");
                    status := 'success*The team member was successfully added';
                end else begin
                    status := 'danger*The team member could not be added. Kindly try again later. Contact the system administrator if this error persists.';
                end
            end;

        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;


    procedure addTeamMember1(employeeNo: Code[50]; imprestNo: Code[50]; destinationTown: Text; voteItem: Text; teamMember: Text; noOfDays: Decimal; constituency: Text[100]; job: Code[50]; jobTaskNo: Code[50]; region: Text[50]; lead: Boolean; modeoftransport: Integer; noofdrivers: Integer) status: Text
    var
        ProjectMembers: Record "Project Members";
        ReturnDate: Date;
        Days: Text;
    begin
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ImprestMemo."Mode of Transport" := modeoftransport;
            ImprestMemo."Number of Drivers" := noofdrivers;
            if ImprestMemo.Modify(true) then
                ReturnDate := CalcDate(StrSubstNo('<%1D>', noOfDays), ImprestMemo."Start Date");
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", teamMember);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", destinationTown);
            ProjectMembers.SetRange(Project, job);
            if ProjectMembers.FindSet then begin
                status := 'danger*The given team member with Project %1' + job + ' has already been added to the selected imprest';
            end else begin
                //ProjectMembers.RESET;
                //ProjectMembers.SETRANGE("No.",teamMember);
                //ProjectMembers.SETRANGE("Return Date",ImprestMemo."Start Date",ReturnDate);
                //IF ProjectMembers.FINDSET THEN BEGIN
                //ERROR('This employee %1 is tied in another imprest memo %2',ProjectMembers."No.",ProjectMembers."Imprest Memo No.");
            end;
            ProjectMembers.Init;
            ProjectMembers.Type := ProjectMembers.Type::Person;
            ProjectMembers."Imprest Memo No." := imprestNo;
            ProjectMembers.Validate("Imprest Memo No.");
            ProjectMembers."Work Type" := destinationTown;
            ProjectMembers.Validate("Work Type");
            ProjectMembers."Type of Expense" := voteItem;
            ProjectMembers.Validate("Type of Expense");
            ProjectMembers."No." := teamMember;
            ProjectMembers.Validate("No.");
            ProjectMembers."Line No" := ProjectMembers.Count + 1;
            ProjectMembers.Validate("No.");
            ProjectMembers."Time Period" := noOfDays;
            ProjectMembers.Validate("Time Period");
            ProjectMembers."Constituency Code" := constituency;
            ProjectMembers.Job := job;
            ProjectMembers.Validate(Job);
            ProjectMembers."Job  Task" := jobTaskNo;
            ProjectMembers.Validate("Job  Task");
            ProjectMembers.Region := region;
            ProjectMembers."Project Lead" := lead;
            //ProjectMembers.Entitlement:=
            if ProjectMembers.Insert(true) then begin
                //ProjectMembers.VALIDATE("Job  Task");
                ImprestMemo.Validate("Number of Drivers");
                ImprestMemo.Validate("Mode of Transport");
                ProjectMembers.Validate("Job Task Remaining Amount");
                ProjectMembers.Validate("Time Period");
                status := 'success*The team member was successfully added';
            end else begin
                status := 'danger*The team member could not be added';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure addFuel(employeeNo: Code[50]; imprestNo: Code[50]; workType: Text; resource: Text; mileage: Decimal) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The fuel could not be added';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", resource);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", workType);
            if ProjectMembers.FindSet then begin
                status := 'danger*The given fuel has already been added to the selected imprest';
            end else begin
                ProjectMembers.Init;
                ProjectMembers.Type := ProjectMembers.Type::Machine;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := workType;
                ProjectMembers.Validate("Work Type");
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := resource;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := mileage;
                //ProjectMembers.VALIDATE("Time Period");
                if ProjectMembers.Insert(true) then begin
                    status := 'success*The fuel was successfully added';
                end else begin
                    status := 'danger*The fuel could not be added';
                end;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure SubmitVehicleFuelRequestDetails2(employeeNo: Code[50]; requisitionNumber: Code[100]; expensetype: Integer; jobnumber: Code[100]; tasknumber: Code[100]; amount: Decimal) status: Text
    var
        tbl_projectMembers: Record "Project Members";
    begin
        //Amos --> get employee name
        Employee.Reset();
        Employee.setrange("No.", employeeNo);
        Employee.findset();
        tbl_projectMembers.init;
        tbl_projectMembers.Type := tbl_projectMembers.Type::Machine;
        tbl_projectMembers."No." := employeeNo;
        tbl_projectMembers.Name := Employee."First Name" + ' ' + Employee."Last Name";
        //tbl_projectMembers.VALIDATE("No.");
        tbl_projectMembers."Imprest Memo No." := requisitionNumber;
        tbl_projectMembers."Expense Type" := expensetype;
        // tbl_projectMembers."Job No" := jobnumber;
        //FuelTravelRequisition.VALIDATE("Job No");
        // tbl_projectMembers."Job Task No" := tasknumber;
        // FuelTravelRequisition.VALIDATE("Job Task No");
        tbl_projectMembers."Transport Costs" := amount;
        IF tbl_projectMembers.INSERT(TRUE) THEN BEGIN
            status := 'success*The Vehicle Fuel Request was successfully Submitted';
        END ELSE BEGIN
            status := 'danger*The Vehicle Fuel request could not be Submitted';
        END;

    end;


    procedure addCasuals(employeeNo: Code[50]; imprestNo: Code[50]; type: Integer; resource: Text; workType: Text; noRequired: Decimal; noOfDays: Decimal; casualRate: Decimal; employeeToSurrender: Code[30]; job: Code[30]; jobTaskNo: Code[30]) status: Text
    var
        Casuals: Record Casuals;
    begin
        //Casuals
        status := 'danger*The casual could not be added';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", imprestNo);
            Casuals.SetRange(Type, type);
            Casuals.SetRange("Resource No.", resource);
            if Casuals.FindSet then begin
                status := 'danger*The casual has already been added to the selected imprest';
            end else begin
                Casuals.Init;
                Casuals.Type := type;
                Casuals."Imprest Memo No." := imprestNo;
                Casuals."Resource No." := resource;
                Casuals.Validate("Resource No.");
                Casuals.Validate("Imprest Memo No.");
                Casuals.Validate(Type);
                Casuals.Rate := casualRate;
                Casuals.Amount := casualRate * noOfDays * noRequired;
                Casuals."Work Type" := workType;
                Casuals.Validate("Work Type");
                Casuals."No. Required" := noRequired;
                Casuals.Validate("No. Required");
                Casuals."No. of Days" := noOfDays;
                Casuals.Validate("No. of Days");
                Casuals."Employee No To Surrender" := employeeToSurrender;
                Casuals.Validate("Employee No To Surrender");
                Casuals.Job := job;
                Casuals."Job  Task" := jobTaskNo;
                Casuals.Validate("Job  Task");

                if Casuals.Insert(true) then begin
                    status := 'success*The casual was successfully added';
                end else begin
                    status := 'danger*The casual could not be added';
                end;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure sendImprestRequisitionApproval(employeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        tbl_memo: Record "Imprest Memo";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VarVariant: Variant;
    begin
        tbl_memo.Reset();
        tbl_memo.SETRANGE(Requestor, employeeNo);
        tbl_memo.SETRANGE("No.", imprestNo);
        tbl_memo.SETRANGE(Status, Payments.Status::Open);
        tbl_memo.SETRANGE("Document Type", tbl_memo."Document Type"::"Imprest Memo");

        IF tbl_memo.Findset(true) then begin
            VarVariant := tbl_memo;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                CustomApprovals.OnSendDocForApproval(VarVariant);
            IF tbl_memo.GET(tbl_memo."No.") THEN BEGIN
                IF tbl_memo.Status = tbl_memo.Status::Open THEN BEGIN
                    status := 'warning*Your request could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your request was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

        end else begin
            status := 'danger*Sorry, your imprest has already been sent for approval or you are not the requestor.';

        end;

    END;

    procedure sendImprestApprovalRequest(employeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        tbl_payments: Record payments;
        CustomApprovalMgt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
    begin
        tbl_payments.Reset();
        tbl_payments.SETRANGE("No.", imprestNo);
        tbl_payments.SETRANGE("Account No.", employeeNo);
        tbl_payments.SETRANGE(Status, Payments.Status::Open);
        tbl_payments.SETRANGE("Document Type", tbl_payments."Document Type"::Imprest);

        IF tbl_payments.Findset(true) then begin
            VarVariant := tbl_payments;
            if CustomApprovalMgt.CheckApprovalsWorkflowEnabled(VarVariant) then
                CustomApprovalMgt.OnSendDocForApproval(VarVariant);
            IF tbl_payments.GET(tbl_payments."No.") THEN BEGIN
                IF tbl_payments.Status = tbl_payments.Status::Open THEN BEGIN
                    status := 'warning*Your request could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your request was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

        end else begin
            status := 'danger*Sorry, your imprest has already been sent for approval or you are not the requestor.';

        end;

    END;

    procedure cancelImprestApprovalRequest(employeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        tbl_payments: Record payments;
        CustomApprovalsMgt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
    begin
        tbl_payments.Reset();
        tbl_payments.SETRANGE("No.", imprestNo);
        tbl_payments.SETRANGE("Account No.", employeeNo);
        tbl_payments.SETRANGE(Status, Payments.Status::"Pending Approval");
        tbl_payments.SETRANGE("Document Type", tbl_payments."Document Type"::Imprest);

        IF tbl_payments.Findset(true) then begin
            VarVariant := tbl_payments;
            CustomApprovalsMgt.OnCancelDocApprovalRequest(VarVariant);
            IF tbl_payments.GET(tbl_payments."No.") THEN BEGIN
                IF tbl_payments.Status = tbl_payments.Status::"Pending Approval" THEN BEGIN
                    status := 'warning*Your approval request could not be cancelled. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your approval request was cancelled successfully';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

        end else begin
            status := 'danger*Sorry, your imprest has already been cancelled or you are not the requestor.';

        end;

    END;




    procedure addOtherCosts(employeeNo: Code[50]; imprestNo: Code[50]; voteItem: Text; requiredFor: Text; unitCost: Decimal; teamMember: Code[30]; quantityRequired: Decimal; noOfDays: Decimal; job: Code[30]; jobTask: Code[30]) status: Text
    var
        OtherCosts: Record "Other Costs";
    begin
        //Casuals
        status := 'danger*The cost could not be added';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin

            OtherCosts.Init;
            OtherCosts."Line No." := getLineNo(imprestNo);
            ;
            OtherCosts."Imprest Memo No." := imprestNo;
            OtherCosts.Validate("Imprest Memo No.");
            OtherCosts."Type of Expense" := voteItem;
            OtherCosts.Validate("Type of Expense");
            OtherCosts."Required For" := requiredFor;
            OtherCosts.Validate("Required For");
            OtherCosts."Quantity Required" := quantityRequired;
            OtherCosts.Validate("Quantity Required");
            OtherCosts."No. of Days" := noOfDays;
            OtherCosts.Validate("No. of Days");
            OtherCosts."Unit Cost" := unitCost;
            OtherCosts.Validate("Unit Cost");
            OtherCosts."Employee No To Surrender" := teamMember;
            OtherCosts.Validate("Employee No To Surrender");
            OtherCosts.Job := job;
            OtherCosts."Job  Task" := jobTask;
            OtherCosts.Validate("Job  Task");
            if OtherCosts.Insert(true) then begin
                status := 'success*The cost was successfully added';
            end else begin
                status := 'danger*The cost could not be added';
            end;

        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    local procedure getLineNo(imprestNo: Code[50]): Integer
    var
        OtherCosts: Record "Other Costs";
        lineNo: Integer;
    begin
        lineNo := 0;
        OtherCosts.Reset;
        OtherCosts.SetRange("Imprest Memo No.", imprestNo);
        if OtherCosts.FindSet then begin
            repeat
                if OtherCosts."Line No." > lineNo then begin
                    lineNo := OtherCosts."Line No.";
                end;
            until OtherCosts.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure sendImprestMemoApproval(employeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
        TotalImprestAmount: Decimal;
    begin
        status := 'danger*The imprest memo could not be sent for approval';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin

            ImprestMemo.TestField(Status, ImprestMemo.Status::Open);//status must be open.
                                                                    //TESTFIELD("User ID",USERID); //control so that only the initiator of the document can send for approval
            ImprestMemo.TestField(Objective);
            ImprestMemo.TestField(Subject);
            ImprestMemo.TestField(Date);
            ImprestMemo.TestField("Imprest Naration");
            ImprestMemo.CalcFields(ImprestMemo."Total Subsistence Allowance", ImprestMemo."Total Fuel Costs", ImprestMemo."Total Maintenance Costs", ImprestMemo."Total Casuals Cost", ImprestMemo."Total Other Costs");
            TotalImprestAmount := ImprestMemo."Total Subsistence Allowance" + ImprestMemo."Total Fuel Costs" + ImprestMemo."Total Maintenance Costs" + ImprestMemo."Total Casuals Cost" + ImprestMemo."Total Other Costs";
            /*IF (TotalImprestAmount>"Job Task Remaining Amount") THEN
                 ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,"Job Task Remaining Amount");*/
            if TotalImprestAmount > ImprestMemo."Job Task Remaining Amount" then begin
                //status:='danger*Applied imprest Memo Amount is greater than the Available Amount';

                /*ProjectTeam.RESET;
              ProjectTeam.SETRANGE(ProjectTeam."No.",ImprestMemo.Requestor);
              IF ProjectTeam.FINDFIRST= FALSE THEN
                ERROR(TEXT012);*/

                //if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(ImprestMemo) then
                // ApprovalsMgmt.OnSendImpMemoForApproval(ImprestMemo);

                ImprestMemo1.Reset;
                ImprestMemo1.SetRange(Requestor, employeeNo);
                ImprestMemo1.SetRange("No.", imprestNo);
                if ImprestMemo1.FindSet then begin
                    if ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval" then begin
                        status := 'success*The imprest memo was successfully sent for approval.Applied imprest Memo of Amount is more than Available Amount';
                        //ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,ImprestMemo."Job Task Remaining Amount");

                    end
                end
                //END
                // END








            end
            else begin
                //IF "Vote Amount"<"Total Subsistence Allowance" THEN
                //ERROR('Budgeted Amount is less than the Amount requested');

                //check if the requester is part of the team
                ProjectTeam.Reset;
                ProjectTeam.SetRange(ProjectTeam."No.", ImprestMemo.Requestor);
                if ProjectTeam.FindFirst = false then
                    Error(TEXT012);

                //if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(ImprestMemo) then
                //  ApprovalsMgmt.OnSendImpMemoForApproval(ImprestMemo);

                ImprestMemo1.Reset;
                ImprestMemo1.SetRange(Requestor, employeeNo);
                ImprestMemo1.SetRange("No.", imprestNo);
                if ImprestMemo1.FindSet then begin
                    if ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval" then begin
                        status := 'success*The imprest memo was successfully sent for approval';
                    end;
                end;
            end
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);

    end;

    procedure createImprestSurrender(employeeNo: Code[50]; imprestNo: Code[50]; SurrenderNo: Code[50]; region: Code[10]; username: Text) status: Text
    var
        pay: Record payments;
    begin
        status := 'danger*Your imprest surrender could not be captured';
        if SurrenderNo = '' then begin //new imprest surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::Surrender;
            Payments."Created By" := 'KURA\' + username.ToUpper();
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::Surrender;
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := employeeNo;
            if pay.Get(imprestNo) then
                Payments."Payment Narration" := pay."Payment Narration";
            //Payments."Payment Narration" :=narration;
            //Payments."Payment Narration" :=
            // Payments."Responsibility Center":=region;
            //Payments.VALIDATE("Responsibility Center");
            Payments.Validate("Account No.");
            Payments."Imprest Issue Doc. No" := imprestNo;
            Payments.Validate("Imprest Issue Doc. No");
            if Payments.Insert(true) then begin
                Payments.Validate("Imprest Issue Doc. No");
                if Employee.Get(employeeNo) then begin
                    Payments."Responsibility Center" := Employee."Global Dimension 1 Code";
                    Payments."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    Payments.Validate("Shortcut Dimension 1 Code");
                end;
                Payments.Modify(true);
                status := 'success*Your imprest surrender was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your imprest surrender could not be captured';
            end;

        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", SurrenderNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindFirst() then begin
                if not (Payments."Imprest Issue Doc. No" = imprestNo) then begin
                    Payments."Imprest Issue Doc. No" := imprestNo;
                    Payments.Validate("Imprest Issue Doc. No");
                    if pay.Get(imprestNo) then
                        Payments."Payment Narration" := pay."Payment Narration";
                    // Payments."Payment Narration" := narration;
                    Payments."Responsibility Center" := Employee."Global Dimension 1 Code";
                    if Payments.Modify(true) then begin
                        status := 'success*Your imprest surrender was successfully updated';
                    end else begin
                        status := 'danger*Your imprest surrender could not be updated';
                    end;
                end else begin
                    status := 'success*No changes to be done';
                end;
            end else begin
                status := 'danger*An imprest surrender with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure createImprestSurrender1(employeeNo: Code[50]; imprestNo: Code[50]; SurrenderNo: Code[50]; region: Code[50]) status: Text
    begin
        status := 'danger*Your imprest surrender could not be captured';
        if SurrenderNo = '' then begin //new imprest surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::Surrender;
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::Surrender;
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := employeeNo;
            Payments.Validate("Account No.");
            Payments."Imprest Issue Doc. No" := imprestNo;
            Payments.Validate("Imprest Issue Doc. No");
            if Payments.Insert(true) then begin
                Payments.Validate("Imprest Issue Doc. No");
                // ImprestMemo."Responsibility Center":=Employee."Global Dimension 1 Code";
                Payments."Responsibility Center" := Employee."Global Dimension 1 Code";

                Payments.Modify(true);
                status := 'success*Your imprest surrender was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your imprest surrender could not be captured';
            end;

        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", SurrenderNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                if not (Payments."Imprest Issue Doc. No" = imprestNo) then begin
                    Payments."Imprest Issue Doc. No" := imprestNo;
                    Payments.Validate("Imprest Issue Doc. No");
                    // Payments."Responsibility Center":=region;
                    Payments."Responsibility Center" := Employee."Global Dimension 1 Code";
                    if Payments.Modify(true) then begin
                        status := 'success*Your imprest surrender was successfully updated';
                    end else begin
                        status := 'danger*Your imprest surrender could not be updated';
                    end;
                end else begin
                    status := 'success*No changes to be done';
                end;
            end else begin
                status := 'danger*An imprest surrender with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure PopulatePettyCashSurrender(employeeNo: Code[50]; imprestNo: Code[50]; SurrenderNo: Code[50]; region: Code[10]) status: Text
    begin
        if SurrenderNo = '' then begin //new petty surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::"Petty Cash";
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::"Petty Cash Surrender";
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := employeeNo;
            Payments."Responsibility Center" := region;
            Payments.Validate("Responsibility Center");
            //Added By Fred
            Employee.Reset;
            Employee.SetRange("No.", employeeNo);
            if Employee.FindSet then
                ImprestMemo."Responsibility Center" := Employee."Global Dimension 1 Code";
            //Added By Fred
            Payments.Validate("Account No.");
            Payments."Imprest Issue Doc. No" := imprestNo;
            Payments.Validate("Imprest Issue Doc. No");
            if Payments.Insert(true) then begin
                Payments.Validate("Imprest Issue Doc. No");
                Payments.Modify(true);
                status := 'success*Your petty cash surrender was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your petty cash  surrender could not be captured';
            end;

        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", SurrenderNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                if not (Payments."Imprest Issue Doc. No" = imprestNo) then begin
                    Payments."Imprest Issue Doc. No" := imprestNo;
                    Payments.Validate("Imprest Issue Doc. No");
                    if Payments.Modify(true) then begin
                        status := 'success*Your petty cash surrender was successfully updated' + Payments."No.";
                    end else begin
                        status := 'danger*Your petty cash could not be updated';
                    end;
                end else begin
                    status := 'success*No changes to be done';
                end;
            end else begin
                status := 'danger*An petty cash with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure sendImprestSurrenderApproval(employeeNo: Code[50]; imprestSurrenderNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
    begin
        status := 'danger*The imprest surrender could not be sent for approval';

        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", imprestSurrenderNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
        Payments.SetRange("Document Type", Payments."document type"::Surrender);
        if Payments.FindSet then begin
            Payments.TestField("Shortcut Dimension 1 Code");
            // Payments.TESTFIELD("Shortcut Dimension 3 Code");
            //TESTFIELD("Shortcut Dimension 3 Code");
            Payments.TestField("Imprest Issue Doc. No");
            // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
            // ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
            if Payments1.Get(Payments."Imprest Issue Doc. No") then begin
                Payments1.Selected := true;
                Payments1.Modify;
            end;
            if Payments2.Get(imprestSurrenderNo) then begin
                if Payments2.Status = Payments2.Status::"Pending Approval" then begin
                    status := 'success*The imprest Surrender was successfully sent for approval';
                end;
            end;
        end else begin
            status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure updateSurrenderLine(employeeNo: Code[50]; imprestSurrenderNo: Code[50]; lineNo: Integer; amountSpent: Decimal; receipt: Text) status: Text
    var
        ImprestLines: Record "Imprest Lines";
    begin
        status := 'danger*The imprest line could not be updated';
        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", imprestSurrenderNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
        Payments.SetRange("Document Type", Payments."document type"::Surrender);
        if Payments.FindSet then begin
            ImprestLines.Reset;
            ImprestLines.SetRange(No, imprestSurrenderNo);
            ImprestLines.SetRange("Line No", lineNo);
            if ImprestLines.FindSet then begin

                ImprestLines.Validate("Actual Spent", amountSpent);
                // ImprestLines.Validate("Receipt No.", receipt);
                if ImprestLines.Modify(true) then begin
                    status := 'success*The imprest line was successfully updated';//+FORMAT(lineNo);
                end else begin
                    status := 'danger*The imprest line could not be updated';
                end;
            end else begin
                status := 'danger*The imprest line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure updateSurrenderLinePetty(employeeNo: Code[50]; imprestSurrenderNo: Code[50]; lineNo: Integer; amountSpent: Decimal; receipt: Text) status: Text
    var
        ImprestLines: Record "Petty Cash Lines";
    begin
        status := 'danger*The petty cash line could not be updated';
        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", imprestSurrenderNo);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::"Petty Cash Surrender");
        Payments.SetRange("Document Type", Payments."document type"::"Payment Voucher");
        if Payments.FindSet then begin
            ImprestLines.Reset;
            ImprestLines.SetRange(No, imprestSurrenderNo);
            ImprestLines.SetRange("Line No", lineNo);
            if ImprestLines.FindSet then begin

                ImprestLines.Validate("Actual Spent", amountSpent);
                // ImprestLines.Validate("Receipt No.", receipt);
                if ImprestLines.Modify(true) then begin
                    status := 'success*The Petty cash line was successfully updated';//+FORMAT(lineNo);
                end else begin
                    status := 'danger*The Petty Cash line could not be updated';
                end;
            end else begin
                status := 'danger*The Petty Cash line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*An Petty Cash surrender with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;


    procedure CreateWorksPurchaseRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; location: Code[50]; description: Text; priorityLevel: Option ,Low,Normal,High,Critical; requisitionProductGroup: Option Goods,Services,Works,Assets; constituency: Text[100]; planId: Text[100]; PlanEntryNo: Integer; TemplateId: Text[50]; projectStaffingTemplateId: Text[100]; worksTemplateId: Text[100]) status: Text
    var
        myType: Text;
    begin

        case priorityLevel of
            0:
                priorityLevel := PurchaseHeader."priority level"::Low;
            1:
                priorityLevel := PurchaseHeader."priority level"::Normal;
            2:
                priorityLevel := PurchaseHeader."priority level"::High;
            3:
                priorityLevel := PurchaseHeader."priority level"::Critical;
            else
        end;

        case requisitionProductGroup of
            0:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Goods;
            1:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Services;
            2:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Works;
            3:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Assets;
            else
        end;


        myType := 'Purchase Requisition';
        if requisitionNo = '' then begin //new  requisition
            PurchaseHeader.Init;

            PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
            PurchaseHeader.Validate("Document Type");
            PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::"Project Works";

            PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::Project;
            PurchaseHeader.Validate("Requisition Type");

            PurchaseHeader."Requester ID" := UserId;
            PurchaseHeader."Request-By No." := employeeNo;
            PurchaseHeader.Validate("Request-By No.");
            PurchaseHeader."Location Code" := location;
            PurchaseHeader.Validate("Location Code");
            PurchaseHeader.Description := description;
            PurchaseHeader.Validate(Description);
            PurchaseHeader.Validate("Order Date", Today);
            PurchaseHeader."Responsibility Center" := location;

            PurchaseHeader."Priority Level" := priorityLevel;
            PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
            //PurchaseHeader."PRN Type":=PurchaseHeader."PRN Type"::Standard;
            PurchaseHeader."Procurement Plan ID" := planId;
            //PurchaseHeader."Shortcut Dimension 2 Code":=
            PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;
            //PurchaseHeader.VALIDATE("Procurement Plan Entry No");
            PurchaseHeader."Requisition Template ID" := TemplateId;


            PurchaseHeader."Project Staffing Template ID" := projectStaffingTemplateId;
            PurchaseHeader."Works Equipment Template ID" := worksTemplateId;


            if PurchaseHeader.Insert(true) then begin

                //PurchaseHeader.VALIDATE("Request-By No.");
                // PurchaseHeader.VALIDATE("Location Code",location);
                PurchaseHeader.Validate("Procurement Plan Entry No");
                SuggestPRNPersonnel_equipmentSpecification(PurchaseHeader);
                PurchaseHeader.Modify(true);
                status := 'success*Your ' + myType + ' was successfully created*' + PurchaseHeader."No.";
            end else begin
                status := 'danger*Your ' + myType + ' could not be captured';
            end;

        end else begin //existing
            PurchaseHeader.Reset;

            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            PurchaseHeader.SetRange("No.", requisitionNo);
            if PurchaseHeader.FindSet then begin
                PurchaseHeader."Responsibility Center" := location;
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate(Description, description);
                PurchaseHeader.Validate("Location Code", location);

                PurchaseHeader."Priority Level" := priorityLevel;
                PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
                PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::"Project Works";
                PurchaseHeader."Procurement Plan ID" := planId;
                PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;

                PurchaseHeader."Requisition Template ID" := TemplateId;
                PurchaseHeader."Project Staffing Template ID" := projectStaffingTemplateId;
                PurchaseHeader."Works Equipment Template ID" := worksTemplateId;

                if PurchaseHeader.Modify(true) then begin
                    PurchaseHeader.Validate("Procurement Plan Entry No");
                    SuggestPRNPersonnel_equipmentSpecification(PurchaseHeader);
                    status := 'success*Your ' + myType + ' was successfully updated';
                end else begin
                    status := 'danger*Your ' + myType + ' could not be updated';
                end;

            end else begin
                status := 'danger*A ' + myType + ' with the given number does not exist, you are not the owner or is no longer open' + requisitionNo;
            end;

        end;
        exit(status);
    end;

    procedure createPurchaseRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; location: Code[50]; description: Text; priorityLevel: Option ,Low,Normal,High,Critical; requisitionProductGroup: Option Goods,Services,Works,Assets; constituency: Text[100]; planId: Text[100]; PlanEntryNo: Integer; TemplateId: Text[50]; tfundingsource: Code[100]; tconstituency: Code[100]) status: Text
    var
        myType: Text;
    begin

        case priorityLevel of
            0:
                priorityLevel := PurchaseHeader."priority level"::Low;
            1:
                priorityLevel := PurchaseHeader."priority level"::Normal;
            2:
                priorityLevel := PurchaseHeader."priority level"::High;
            3:
                priorityLevel := PurchaseHeader."priority level"::Critical;
            else
        end;

        case requisitionProductGroup of
            0:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Goods;
            1:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Services;
            2:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Works;
            3:
                requisitionProductGroup := PurchaseHeader."requisition product group"::Assets;
            else
        end;


        myType := 'Purchase Requisition';
        if requisitionNo = '' then begin //new  requisition
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
            PurchaseHeader.Validate("Document Type");
            PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::Project;
            PurchaseHeader.Validate("Requisition Type");
            PurchaseHeader."Requester ID" := UserId;
            PurchaseHeader."Request-By No." := employeeNo;
            PurchaseHeader.Validate("Request-By No.");
            PurchaseHeader."Location Code" := location;
            //PurchaseHeader.VALIDATE("Location Code");
            PurchaseHeader.Description := description;
            PurchaseHeader.Validate(Description);
            PurchaseHeader."Order Date" := Today;
            PurchaseHeader."Responsibility Center" := location;
            PurchaseHeader."Priority Level" := priorityLevel;
            PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
            PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::Standard;
            PurchaseHeader."Procurement Plan ID" := planId;
            PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;
            PurchaseHeader."Requisition Template ID" := TemplateId;
            PurchaseHeader."Shortcut Dimension 2 Code" := tfundingsource;
            PurchaseHeader."Shortcut Dimension 3 Code" := tconstituency;
            if PurchaseHeader.Insert(true) then begin
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader.Validate("Procurement Plan Entry No");
                PurchaseHeader.Modify(true);
                status := 'success*Your ' + myType + ' was successfully created*' + PurchaseHeader."No.";
            end else begin
                status := 'danger*Your ' + myType + ' could not be captured';
            end;

        end else begin //existing
            PurchaseHeader.Reset;
            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            PurchaseHeader.SetRange("No.", requisitionNo);
            if PurchaseHeader.FindSet then begin
                PurchaseHeader."Responsibility Center" := location;
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate(Description, description);
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader."Priority Level" := priorityLevel;
                PurchaseHeader."Requisition Product Group" := requisitionProductGroup;
                PurchaseHeader."PRN Type" := PurchaseHeader."prn type"::Standard;
                PurchaseHeader."Procurement Plan ID" := planId;
                PurchaseHeader."Procurement Plan Entry No" := PlanEntryNo;
                PurchaseHeader."Requisition Template ID" := TemplateId;
                if PurchaseHeader.Modify(true) then begin
                    PurchaseHeader.Validate("Procurement Plan Entry No");
                    status := 'success*Your ' + myType + ' was successfully updated';
                end else begin
                    status := 'danger*Your ' + myType + ' could not be updated';
                end;

            end else begin
                status := 'danger*A ' + myType + ' with the given number does not exist, you are not the owner or is no longer open' + requisitionNo;
            end;

        end;
        exit(status);
    end;

    procedure createPurchaseStoreRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; location: Code[50]; description: Text; type: Integer; fundCode: Code[100]; jobNo: Text; jobTask: Text; busPosting: Code[20]) status: Text
    var
        myType: Text;
    begin
        myType := 'Store Requisition';
        if type = 0 then
            myType := 'Purchase Requisition';
        status := 'danger*Your ' + myType + ' could not be captured';
        if requisitionNo = '' then begin //new  requisition
            PurchaseHeader.Init;
            PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Store Requisition";
            if type = 0 then
                PurchaseHeader."Document Type" := PurchaseHeader."document type"::"Purchase Requisition";
            PurchaseHeader.Validate("Document Type");
            if type = 0 then begin
                PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::Project;
                PurchaseHeader.Validate("Requisition Type");
            end else
                PurchaseHeader."Requisition Type" := PurchaseHeader."requisition type"::"Internal Use";
            PurchaseHeader."Requester ID" := UserId;
            PurchaseHeader."Request-By No." := employeeNo;
            PurchaseHeader.Validate("Request-By No.");
            PurchaseHeader."Location Code" := location;
            PurchaseHeader.Validate("Location Code");
            PurchaseHeader.Description := description;
            PurchaseHeader.Validate(Description);
            PurchaseHeader.Validate("Order Date", Today);
            PurchaseHeader."Responsibility Center" := location;
            PurchaseHeader."Shortcut Dimension 2 Code" := fundCode;
            PurchaseHeader."Shortcut Dimension 1 Code" := location;
            PurchaseHeader."Gen. Bus. Posting Group" := busPosting;
            if PurchaseHeader.Insert(true) then begin
                PurchaseHeader.Validate("Request-By No.");
                //PurchaseHeader.VALIDATE("Location Code",location);
                PurchaseHeader.VALIDATE("Shortcut Dimension 2 Code", fundCode);
                PurchaseHeader.Validate(Job, jobNo);
                // PurchaseHeader.VALIDATE("Job Task No.", jobTask);
                PurchaseHeader.Modify(true);
                status := 'success*Your ' + myType + ' was successfully created*' + PurchaseHeader."No.";
            end else begin
                status := 'danger*Your ' + myType + ' could not be captured';
            end;

        end else begin //existing
            PurchaseHeader.Reset;
            if type = 0 then begin
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            end else begin
                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            end;
            PurchaseHeader.SetRange("Request-By No.", employeeNo);
            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
            PurchaseHeader.SetRange("No.", requisitionNo);
            if PurchaseHeader.FindSet then begin
                PurchaseHeader."Responsibility Center" := location;
                PurchaseHeader.Validate("Request-By No.");
                PurchaseHeader.Validate(Description, description);
                PurchaseHeader.Validate("Location Code", location);
                PurchaseHeader.Validate(Job, jobNo);
                // PurchaseHeader.VALIDATE("Job Task No.", jobTask);
                PurchaseHeader.Validate("Shortcut Dimension 2 Code", fundCode);
                PurchaseHeader."Shortcut Dimension 1 Code" := location;
                PurchaseHeader."Gen. Bus. Posting Group" := busPosting;
                if PurchaseHeader.Modify(true) then begin
                    status := 'success*Your ' + myType + ' was successfully updated';
                end else begin
                    status := 'danger*Your ' + myType + ' could not be updated';
                end;

            end else begin
                status := 'danger*A ' + myType + ' with the given number does not exist, you are not the owner or is no longer open' + requisitionNo;
            end;

        end;
        exit(status);
    end;

    local procedure calculateTotalCommitments(requisitionNo: Code[20])
    var
        tbl_purchaseLine: Record "Purchase Line";
        tbl_purchaseHeader: Record "Purchase Header";
        myAmount: Decimal;
    begin
        // loop through all the added purchase lines within the requisition
        myAmount := 0;
        tbl_purchaseLine.Reset;
        tbl_purchaseLine.SetRange("Document No.", requisitionNo);
        if tbl_purchaseLine.Findset then begin
            repeat
                myAmount += tbl_purchaseLine.Amount;
            until tbl_purchaseLine.Next = 0;
        end;
        // update the record on Purchase header
        tbl_purchaseHeader.Reset;
        tbl_purchaseHeader.SetRange("No.", requisitionNo);
        if tbl_purchaseHeader.findset(true) then begin
            tbl_purchaseHeader."PP Total Commitments" := myAmount;
            tbl_purchaseHeader.Modify();
        end;

    end;

    procedure createRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; budget: Code[250]; procurementPlan: Code[250]; itemCategory: Code[250]; item: Code[250]; quantity: Decimal; directUnitCost: Decimal; uom: Text[100]; totalAmount: Decimal; procurementEntryNo: Integer) status: Text
    var
        PurchaseLine: Record "Purchase Line";
        tbl_item: Record Item;
        totalPrnCommitment: Decimal;
    begin
        status := 'danger*Your Requisition Line could not be added';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            if (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition") then begin
                //add line
                PurchaseLine.Init;
                //Document Type,Document No.,Line No.
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Store Requisition";
                end;
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Purchase Requisition";
                end;
                PurchaseLine."Document No." := requisitionNo;
                PurchaseLine.Validate("Document No.");
                PurchaseLine."Line No." := getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
                PurchaseLine.Validate("Line No.");
                PurchaseLine."Procurement Plan" := budget;
                PurchaseLine.Validate("Procurement Plan");
                PurchaseLine."Procurement Plan Item" := procurementPlan;
                PurchaseLine.Validate("Procurement Plan Item");
                PurchaseLine."Item Category" := itemCategory;
                PurchaseLine.Validate("Item Category");
                PurchaseLine."Service/Item Code" := item;
                PurchaseLine.Validate("Service/Item Code");
                PurchaseLine."Qty. Requested" := quantity;
                PurchaseLine.Quantity := quantity;
                PurchaseLine.Validate(Quantity);
                PurchaseLine.Validate("Qty. Requested");
                PurchaseLine."Direct Unit Cost" := directUnitCost;
                PurchaseLine.Validate("Direct Unit Cost");
                PurchaseLine."Unit of Measure" := uom;
                PurchaseLine.Type := PurchaseLine.Type::Item;
                PurchaseLine."No." := item;
                PurchaseLine.Amount := totalAmount;
                PurchaseLine.Validate(Amount);
                PurchaseLine."Amount Including VAT" := totalAmount;
                PurchaseLine.Validate("Amount Including VAT");
                PurchaseLine."Procurement Plan Entry No" := procurementEntryNo;
                // find item and populate PurchaseLine description
                tbl_item.reset;
                tbl_item.setrange(tbl_item."No.", item);
                if tbl_item.findfirst then begin
                    PurchaseLine.Description := tbl_item.Description;
                end;

                if PurchaseLine.Insert(true) then begin

                    status := 'success*The Requisition Line was successfully added';
                end else begin
                    status := 'danger*Your Requisition Line could not be added';
                end;
                calculateTotalCommitments(requisitionNo);
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    local procedure getPurchaseLineNo(requisitionNo: Code[50]; requisitionType: Option): Integer
    var
        purchaseLine: Record "Purchase Line";
        lineNo: Integer;
    begin
        lineNo := 0;
        purchaseLine.Reset;
        purchaseLine.SetRange("Document No.", requisitionNo);
        purchaseLine.SetRange("Document Type", requisitionType);
        if purchaseLine.FindSet then begin
            repeat
                if purchaseLine."Line No." > lineNo then begin
                    lineNo := purchaseLine."Line No.";
                end;
            until purchaseLine.Next = 0;
        end;
        exit(lineNo + 1000);
    end;

    procedure sendPurchaseRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project Team on The Memo';
        PurchaseHeader1: Record "Purchase Header";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
    begin
        status := 'danger*The Purchase Requisition could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
        if PurchaseHeader.FindSet then begin
            // set record cancelled status to false
            PurchaseHeader."Cancelled?" := false;
            PurchaseHeader.Modify(true);

            if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then
                ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);
            status := 'success*Your Purchase Requisition was successfully  sent for approval';

        end else begin
            status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure fnCancelPurchaseRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        CustomApprovalEntry: Record "Approval Entry";
        tbl_purchaseHeader: Record "Purchase Header";

    begin
        tbl_purchaseHeader.Reset;
        tbl_purchaseHeader.SetRange("Request-By No.", employeeNo);
        tbl_purchaseHeader.SetRange(Status, tbl_purchaseHeader.Status::"Pending Approval");
        tbl_purchaseHeader.SetRange("No.", requisitionNo);
        tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."document type"::"Purchase Requisition");
        if tbl_purchaseHeader.FindSet then begin
            CustomApprovalEntry.Reset;
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", tbl_purchaseHeader."No.");
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", tbl_purchaseHeader.RecordId);
            if CustomApprovalEntry.FindSet then
                repeat
                    CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                    CustomApprovalEntry.Modify(true);
                until CustomApprovalEntry.Next = 0;
            tbl_purchaseHeader.Status := tbl_purchaseHeader.Status::Open;
            if tbl_purchaseHeader.Modify(true) then
                status := 'success*Your approval request was successfully cancelled';

        end else begin
            status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or is no longer pending approval';
        end;
        exit(status);

    end;

    procedure createFleetRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; from: Code[20]; destination: Code[20]; dateOfTrip: Date; timeOut: DateTime; staff: Integer; noOfDaysRequested: Decimal; purposeOfTrip: Text; comments: Text; hourstrip: Decimal; typeOfVehicle: Code[20]; typeOfGoods: Text) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin
        status := 'danger*Your Fleet Requisition could not be updated';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        TransportRequisition.SetRange("Employee No", employeeNo);
        if TransportRequisition.FindSet then begin
            TransportRequisition."Commencement Code" := from;
            TransportRequisition.Validate("Commencement Code");
            TransportRequisition."Destination Code" := destination;
            TransportRequisition.Validate("Destination Code");
            TransportRequisition."Date of Trip" := dateOfTrip;
            TransportRequisition.Validate("Date of Trip");
            TransportRequisition."Time out" := Dt2Time(timeOut);
            TransportRequisition."No. of Staff" := staff;
            TransportRequisition."Type of Vehicle" := typeOfVehicle;
            TransportRequisition."Type of Goods" := typeOfGoods;
            TransportRequisition."No of Days Requested" := noOfDaysRequested;
            TransportRequisition.Validate("No of Days Requested");
            TransportRequisition."Purpose of Trip" := purposeOfTrip;
            TransportRequisition.Subject := purposeOfTrip;
            TransportRequisition.Comments := comments;
            TransportRequisition."Number of Hours Requested" := hourstrip;
            TransportRequisition.Validate("Number of Hours Requested");
            TransportRequisition."Requested By" := employeeNo;
            TransportRequisition.Validate("Employee No");
            if TransportRequisition.Modify(true) then begin
                status := 'success*Your Fleet Requisition was successfully updated*' + TransportRequisition."Transport Requisition No";

            end else begin
                status := 'danger*Your Fleet Requisition could not be updated';
            end;
        end else begin
            if requisitionNo = '' then begin //a new record
                TransportRequisition.Init;
                 TransportRequisition."Commencement Code" := from;
            TransportRequisition.Validate("Commencement Code");
            TransportRequisition."Destination Code" := destination;
            TransportRequisition.Validate("Destination Code");
                TransportRequisition."Date of Trip" := dateOfTrip;
                TransportRequisition.Validate("Date of Trip");
                TransportRequisition."Time out" := Dt2Time(timeOut);
                TransportRequisition.VALIDATE("Time out");
                TransportRequisition."No. of Staff" := staff;
                TransportRequisition."Type of Vehicle" := typeOfVehicle;
                TransportRequisition."Type of Goods" := typeOfGoods;
                //TransportRequisition."Journey Route" := journeyRoute;
                TransportRequisition."No of Days Requested" := noOfDaysRequested;
                TransportRequisition.Validate("No of Days Requested");
                TransportRequisition."Purpose of Trip" := purposeOfTrip;
                TransportRequisition.Subject := purposeOfTrip;
                TransportRequisition.Comments := comments;
                TransportRequisition."Employee No" := employeeNo;
                TransportRequisition.Validate("Employee No");
                TransportRequisition."Date of Request" := Today;
                TransportRequisition."Requested By" := employeeNo;
                TransportRequisition."Number of Hours Requested" := hourstrip;
                //TransportRequisition.VALIDATE("Number of Hours Requested");
                if TransportRequisition.Insert(true) then begin
                    status := 'success*Your Fleet Requisition was successfully created*' + TransportRequisition."Transport Requisition No";
                end else begin
                    status := 'danger*A Fleet Requisition was not successfully submitted';
                end;
            end;
        end;
        exit(status);
    end;

    procedure addFleetRequisitionStaff(employeeNo: Code[50]; requisitionNo: Code[50]; staffNo: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
    begin
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.Findfirst() then begin
            if TransportRequisition."Approved Imprest Memo" = '' then begin
                status := 'danger*A Fleet Requisition with the given number does not exist or is no longer open';
            end;
            TravelRequisitionStaff.Init;
            TravelRequisitionStaff."Req No" := requisitionNo;
            TravelRequisitionStaff.Validate("Req No");
            TravelRequisitionStaff."Employee No" := staffNo;
            TravelRequisitionStaff.Validate("Employee No");
            if TravelRequisitionStaff.Insert(true) then begin
                status := 'success*The Staff member was successfully added to your Fleet Requisition';
            end else begin
                status := 'danger*The Staff member could not be added to your Fleet Requisition';
            end;
        end;
        exit(status);
    end;

    procedure addFleetRequisitionNonStaff(employeeNo: Code[50]; requisitionNo: Code[50]; IdNumber: Code[10]; PhoneNumber: Code[100]; OrganizationName: Code[100]; Name: Code[100]; purposeoftrip: Text[100]; designations: Text[100]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
        TravelRequisitionNonStaff: Record "Travel Requisition Non Staff";
    begin
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionNonStaff.Init;
            TravelRequisitionNonStaff."Req No" := requisitionNo;
            TravelRequisitionNonStaff."ID No" := IdNumber;
            TravelRequisitionNonStaff.Purpose := OrganizationName;
            TravelRequisitionNonStaff.Name := Name;
            TravelRequisitionNonStaff."Phone Number" := PhoneNumber;
            TravelRequisitionNonStaff.Designation := designations;
            TravelRequisitionNonStaff.Purpose := purposeoftrip;
            if TravelRequisitionNonStaff.Insert(true) then begin
                status := 'success*The Staff member was successfully added to your Fleet Requisition';
            end else begin
                status := 'danger*The Staff member could not be added to your Fleet Requisition';
            end;

        end else begin
            status := 'danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure removeNonStaffFromTravelRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; entryNo: Integer) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionNonStaff: Record "Travel Requisition Non Staff";
    begin
        //status:='danger*The Staff member could not be removed from your Fleet Requisition';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionNonStaff.Reset;
            TravelRequisitionNonStaff.SetRange(EntryNo, entryNo);
            TravelRequisitionNonStaff.SetRange("Req No", requisitionNo);
            if TravelRequisitionNonStaff.FindSet then begin
                if TravelRequisitionNonStaff.Delete(true) then begin
                    status := 'success*The non-staff member was successfully removed from your Fleet Requisition';
                end;

            end;


        end else begin
            // status:='danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure addFleetRequisitionStaffSafari(imprestMemoCode: Code[50]; requisitionNO: Code[50])
    status: Text
    var
        ImprestMemo: Record "Imprest Memo";
        SafariTeam: Record "Project Members";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
        TransportRequisition: Record "Transport Requisition";
    begin
        SafariTeam.Reset();
        SafariTeam.SetRange("Imprest Memo No.", imprestMemoCode);
        if SafariTeam.FindSet() then begin
            TransportRequisition.Reset;
            TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
            TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
            if TransportRequisition.Find('-') then begin
                if TransportRequisition."Approved Imprest Memo" = '' then begin
                    REPEAT
                        TravelRequisitionStaff.Init;
                        TravelRequisitionStaff."Req No" := requisitionNo;
                        TravelRequisitionStaff."Employee No" := SafariTeam."No.";
                        TravelRequisitionStaff.Validate("Employee No");
                        TravelRequisitionStaff.Insert(true);
                    UNTIL SafariTeam.Next = 0;
                    status := 'success*The Staff members were successfully added to your Fleet Requisition';
                end else begin
                    status := 'danger*The Staff member scould not be added to your Fleet Requisition. Only the Members on the Imprest Memo are Allowed';
                end;
            end else begin
                status := 'danger*A Fleet Requisition with the given number does not exist or is no longer open';
            end;
            exit(status);
        end;

    end;


    procedure sendFleetRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin
        status := 'danger*The fleet requisition could not be sent for approval';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin

            leaveApp := TransportRequisition;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            IF TransportRequisition.GET(TransportRequisition."Transport Requisition No") THEN BEGIN
                IF TransportRequisition.Status = TransportRequisition.Status::Open THEN BEGIN
                    status := 'warning*Your fleet requisition  could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your fleet requisition was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

        end else begin
            status := 'danger*A fleet requisition with the given number does not exist, is no longer open or you are not the owner';
        end;
        exit(status);
    end;

    procedure removeStaffFromTravelRequisition(employeeNo: Code[50]; requisitionNo: Code[50]; entryNo: Integer) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
        TravelRequisitionStaff: Record "Travel Requisition Staff";
    begin
        //status:='danger*The Staff member could not be removed from your Fleet Requisition';
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNo);
        TransportRequisition.SetRange(Status, TransportRequisition.Status::Open);
        if TransportRequisition.FindSet then begin
            TravelRequisitionStaff.Reset;
            TravelRequisitionStaff.SetRange(EntryNo, entryNo);
            TravelRequisitionStaff.SetRange("Req No", requisitionNo);
            if TravelRequisitionStaff.FindSet then begin
                if TravelRequisitionStaff.Delete(true) then begin
                    status := 'success*The Staff member was successfully removed from your Fleet Requisition';
                end;

            end;


        end else begin
            // status:='danger*A Fleet Requisition with the given number does not exist or is no longer open';
        end;
        exit(status);
    end;

    procedure removeMemberFromImprestMemo(number: Code[50]; workType: Code[50]; mEmployeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The team member could not be removed';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, mEmployeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            //Imprest Memo No.,No.,Work Type
            ProjectMembers.SetRange("No.", number);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", workType);
            if ProjectMembers.FindSet then begin
                if ProjectMembers.Delete(true) then begin
                    status := 'success*The team member was successfully removed from the imprest memo';
                end else begin
                    status := 'danger*The team member could not be removed';
                end;
            end else begin
                status := 'danger*The given team member has not been added to the selected imprest';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure editTeamMember(employeeNo: Code[50]; imprestNo: Code[50]; destinationTown: Text; voteItem: Text; teamMember: Text; noOfDays: Decimal; originalNumber: Code[50]; originalWorkType: Code[50]; constituency: Text[100]; projectLead: Boolean) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The team member could not be edited';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            //Imprest Memo No.,No.,Work Type
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", originalNumber);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", originalWorkType);
            if ProjectMembers.FindSet then begin
                ProjectMembers.Type := ProjectMembers.Type::Person;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := destinationTown;
                ProjectMembers.Validate("Work Type");
                ProjectMembers."Type of Expense" := voteItem;
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := teamMember;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := noOfDays;
                ProjectMembers.Validate("Time Period");
                ProjectMembers."Constituency Code" := constituency;
                ProjectMembers."Project Lead" := projectLead;
                if ProjectMembers.Modify(true) then begin
                    status := 'success*The team member was successfully edited';
                end else begin
                    status := 'danger*The team member could not be edited';
                end;

            end else begin
                status := 'danger*The given team member has not been added to the selected imprest' + originalWorkType;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure removeFuelFromImprestMemo(number: Code[50]; workType: Code[50]; mEmployeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The expense could not be removed';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, mEmployeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin

            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", number);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", workType);
            if ProjectMembers.FindSet then begin
                if ProjectMembers.Delete(true) then begin
                    status := 'success*The expense was successfully removed from the imprest memo';
                end else begin
                    status := 'danger*The expense could not be removed';
                end;
            end else begin
                status := 'danger*The given expense has not been added to the selected imprest';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure editFuel(employeeNo: Code[50]; imprestNo: Code[50]; workType: Text; resource: Text; mileage: Decimal; originalNo: Code[50]; originalWorkType: Code[50]) status: Text
    var
        ProjectMembers: Record "Project Members";
    begin
        status := 'danger*The fuel could not be added';
        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            ProjectMembers.Reset;
            ProjectMembers.SetRange("No.", originalNo);
            ProjectMembers.SetRange("Imprest Memo No.", imprestNo);
            ProjectMembers.SetRange("Work Type", originalWorkType);
            if ProjectMembers.FindSet then begin
                ProjectMembers.Type := ProjectMembers.Type::Machine;
                ProjectMembers."Imprest Memo No." := imprestNo;
                ProjectMembers."Work Type" := workType;
                ProjectMembers.Validate("Work Type");
                ProjectMembers.Validate("Type of Expense");
                ProjectMembers."No." := resource;
                ProjectMembers.Validate("No.");
                ProjectMembers."Time Period" := mileage;
                if ProjectMembers.Modify(true) then begin
                    status := 'success*The fuel was successfully updated';
                end else begin
                    status := 'danger*The fuel could not be added';
                end;

            end else begin
                status := 'danger*The given fuel has not been added to the selected imprest';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure removeCasuals(employeeNo: Code[50]; imprestNo: Code[50]; resourceType: Text; resourceNo: Code[50]) status: Text
    var
        Casuals: Record Casuals;
    begin
        //Casuals
        status := 'danger*The casual could not be removed';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", imprestNo);
            if Lowercase(resourceType) = 'skilled' then begin
                Casuals.SetRange(Type, Casuals.Type::Skilled);
            end else begin
                Casuals.SetRange(Type, Casuals.Type::Unskilled);
            end;

            Casuals.SetRange("Resource No.", resourceNo);
            if Casuals.FindSet then begin

                if Casuals.Delete(true) then begin
                    status := 'success*The casual was successfully removed from the imprest';
                end else begin
                    status := 'danger*The casual could not be removed from the imprest';
                end;

            end else begin
                //imprestNo : Code[50];type : Integer;resource : Text;workType : Text;noRequired : Decimal;noOfDays : Decimal
                status := 'danger*The casual has not been added to the selected imprest' + resourceNo;
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure editCasuals(employeeNo: Code[50]; imprestNo: Code[50]; type: Integer; resource: Text; workType: Text; noRequired: Decimal; noOfDays: Decimal; originalResourceType: Code[50]; originalResourceNo: Code[50]; employeeToSurrender: Text[50]) status: Text
    var
        Casuals: Record Casuals;
    begin
        //Casuals
        status := 'danger*The casual could not be edited';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            Casuals.Reset;
            Casuals.SetRange("Imprest Memo No.", imprestNo);
            if Lowercase(originalResourceType) = 'skilled' then begin
                Casuals.SetRange(Type, Casuals.Type::Skilled);
            end else begin
                Casuals.SetRange(Type, Casuals.Type::Unskilled);
            end;
            Casuals.SetRange("Resource No.", originalResourceNo);
            if Casuals.FindSet then begin
                Casuals.Type := type;
                Casuals."Imprest Memo No." := imprestNo;
                Casuals."Resource No." := resource;
                Casuals.Validate("Resource No.");
                Casuals.Validate("Imprest Memo No.");
                Casuals.Validate(Type);

                Casuals."Work Type" := workType;
                Casuals.Validate("Work Type");
                Casuals."No. Required" := noRequired;
                Casuals.Validate("No. Required");
                Casuals."No. of Days" := noOfDays;
                Casuals.Validate("No. of Days");
                Casuals."Employee No To Surrender" := employeeToSurrender;
                Casuals.Validate("Employee No To Surrender");
                if Casuals.Modify(true) then begin
                    status := 'success*The casual was successfully updated';
                end else begin
                    status := 'danger*The casual could not be updated';
                end;
            end else begin
                status := 'danger*The casual has not been added to the selected imprest';

            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure removeOtherCosts(imprestNo: Code[50]; employeeNo: Code[50]; lineNo: Integer) status: Text
    var
        OtherCosts: Record "Other Costs";
    begin
        status := 'danger*The cost could not be removed';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            OtherCosts.Reset;
            OtherCosts.SetRange("Line No.", lineNo);
            OtherCosts.SetRange("Imprest Memo No.", imprestNo);
            if OtherCosts.FindSet then begin
                if OtherCosts.Delete(true) then begin
                    status := 'success*The cost was successfully removed';
                end else begin
                    status := 'danger*The cost could not be removed';
                end;
            end else begin
                status := 'danger*The cost does not exists in the selected imprest memo';
            end;

        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;

        exit(status);
    end;

    procedure editOtherCosts(employeeNo: Code[50]; imprestNo: Code[50]; voteItem: Text; requiredFor: Text; quantityRequired: Decimal; noOfDays: Decimal; unitCost: Decimal; originalLineNo: Integer; employeeToSurrender: Text[50]) status: Text
    var
        OtherCosts: Record "Other Costs";
    begin
        //Casuals
        status := 'danger*The cost could not be updated';

        ImprestMemo.Reset;
        ImprestMemo.SetRange(Requestor, employeeNo);
        ImprestMemo.SetRange("No.", imprestNo);
        ImprestMemo.SetRange(Status, ImprestMemo.Status::Open);
        if ImprestMemo.FindSet then begin
            OtherCosts.Reset;
            OtherCosts.SetRange("Imprest Memo No.", imprestNo);
            OtherCosts.SetRange("Line No.", originalLineNo);
            if OtherCosts.FindSet then begin
                OtherCosts."Imprest Memo No." := imprestNo;
                OtherCosts.Validate("Imprest Memo No.");
                OtherCosts."Type of Expense" := voteItem;
                OtherCosts.Validate("Type of Expense");
                OtherCosts."Required For" := requiredFor;
                OtherCosts.Validate("Required For");
                OtherCosts."Quantity Required" := quantityRequired;
                OtherCosts.Validate("Quantity Required");
                OtherCosts."No. of Days" := noOfDays;
                OtherCosts.Validate("No. of Days");
                OtherCosts."Unit Cost" := unitCost;
                OtherCosts.Validate("Unit Cost");
                OtherCosts."Employee No To Surrender" := employeeToSurrender;
                OtherCosts.Validate("Employee No To Surrender");
                if OtherCosts.Modify(true) then begin
                    status := 'success*The cost was successfully updated';
                end else begin
                    status := 'danger*The cost could not be updated';
                end;
            end else begin
                status := 'danger*The cost has not been added to the selected imprest memo';
            end;
        end else begin
            status := 'danger*An imprest with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure generateLeaveForm(employeeNo: Code[50]; leaveNo: Code[50]) status: Text
    var
        leaveFileName: Text;
    begin
        status := 'danger*The leave form could not be generated';
        leaveApplications.Reset;
        leaveApplications.SetRange("Application Code", leaveNo);
        leaveApplications.SetRange("Employee No", employeeNo);
        if leaveApplications.FindSet then begin
            leaveFileName := FILESPATH + 'leave' + leaveNo + '.pdf';
            // if FILE.Exists(leaveFileName) then begin
            //     FILE.Erase(leaveFileName);
            // end;
            // Report.SaveAsPdf(69005, leaveFileName, leaveApplications);
            // if FILE.Exists(leaveFileName) then begin
            //     status := 'success*' + 'Downloads\leave' + leaveNo + '.pdf';
            // end;
        end else begin
            status := 'danger*The leave does not exist or you are not the requester';
        end;
        exit(status);
    end;

    procedure sendRecordForApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Applications";
    begin
        status := 'danger*The record could not be sent for approval';
        recordType := Lowercase(recordType);
        if recordType = 'leave' then begin
            status := 'danger*The leave could not be sent for approval';
            leaveApplications.Reset;
            leaveApplications.SetRange("Application Code", recordNo);
            leaveApplications.SetRange("Employee No", employeeNo);
            if leaveApplications.FindSet then begin
                // if ApprovalsMgmt.CheckLeaveAppApprovalsWorkflowEnabled(leaveApplications) then
                //    ApprovalsMgmt.OnSendLeaveAppForApproval(leaveApplications);
                if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
                    if HRLeaveApplication1.Status = HRLeaveApplication1.Status::Open then begin
                        status := 'warning*Your leave application  could not be sent for approval';
                    end else begin
                        status := 'success*Your leave application was successfully  sent for approval';
                    end;
                end;
            end else begin
                status := 'danger*The leave does not exist or you are not the requester';
            end;
        end;
        exit(status);
    end;

    procedure cancelRecordApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Applications";
        ImprestMemo1: Record "Imprest Memo";
        Payments2: Record payments;
        ImprestHeader: Record payments;
        PurchaseHeader1: Record "Purchase Header";
        TransportRequisition: Record "Transport Requisition";
        TransportRequisition1: Record "Transport Requisition";
        CustomApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
    begin
        status := 'danger*The record approval could not be cancelled';
        recordType := Lowercase(recordType);
        if recordType = 'leave' then begin
            status := 'danger*The leave approval could not be cancelled';
            leaveApplications.Reset;
            leaveApplications.SetRange("Application Code", recordNo);
            leaveApplications.SetRange("Employee No", employeeNo);
            leaveApplications.SetRange(status, leaveApplications.Status::"Pending Approval");

            if leaveApplications.FindSet then begin
                leaveApp := leaveApplications;
                IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                    CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                IF leaveApplications.GET(leaveApplications."Application Code") THEN BEGIN
                    IF leaveApplications.Status = leaveApplications.Status::"Pending Approval" THEN BEGIN
                        status := 'warning*Your leave application  could not be cancelled. Kindly try again or contact the administrator if this error persists';
                    END ELSE BEGIN
                        status := 'success*Your leave application was successfully  cancelled';
                    END;
                end else begin
                    status := 'danger*Approval workflow is not enabled';
                end;

            end else begin
                status := 'danger*The leave does not exist as pending approval or you are not the requester';

            end;
        end else
            if recordType = 'staff claim' then begin
                Payments.Reset;
                Payments.SetRange("Account No.", employeeNo);
                Payments.SetRange("No.", recordNo);

                if Payments.FindFirst then begin
                    leaveApp := Payments;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                        CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                    IF Payments.GET(Payments."No.") THEN BEGIN
                        IF Payments.Status = Payments.Status::"Pending Approval" THEN BEGIN
                            status := 'warning*Your Staff Claim could not be cancelled. Kindly try again or contact the administrator if this error persists';
                        END ELSE BEGIN
                            status := 'success*Your Staff Claim was successfully cancelled';
                        END;
                    end else begin
                        status := 'danger*Approval workflow is not enabled';
                    end;


                end else begin
                    status := 'danger*The staff claim is not open or you are not the requestor. Kindly contact the administrator if this error persists. ';

                end;
            end else

                if recordType = 'imprest memo' then begin
                    status := 'danger*The imprest memo approval could not be cancelled';

                    ImprestMemo.Reset;
                    ImprestMemo.SetRange(Requestor, employeeNo);
                    ImprestMemo.SetRange("No.", recordNo);
                    ImprestMemo.SetRange(Status, ImprestMemo.Status::"Pending Approval");
                    if ImprestMemo.FindSet then begin
                        leaveApp := ImprestMemo;
                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                            CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                        IF ImprestMemo.GET(ImprestMemo."No.") THEN BEGIN
                            IF ImprestMemo.Status = ImprestMemo.Status::"Pending Approval" THEN BEGIN
                                status := 'warning*Your imprest could not be cancelled. Kindly try again or contact the administrator if this error persists';
                            END ELSE BEGIN
                                status := 'success*Your imprest was successfully cancelled';
                            END;
                        end else begin
                            status := 'danger*Approval workflow is not enabled';
                        end;


                    end else begin
                        status := 'danger*An imprest with the given number does not exist, you are not the requestor or has not been sent for approval';
                    end;
                    exit(status);
                end else
                    if recordType = 'imprest surrender' then begin
                        status := 'danger*The imprest surrender could not be sent for approval';

                        Payments.Reset;
                        Payments.SetRange("Account No.", employeeNo);
                        Payments.SetRange("No.", recordNo);
                        Payments.SetRange(Status, Payments.Status::"Pending Approval");
                        Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
                        Payments.SetRange("Document Type", Payments."document type"::Surrender);
                        if Payments.FindSet then begin

                            leaveApp := Payments;
                            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                                CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                            IF Payments.GET(Payments."No.") THEN BEGIN
                                IF Payments.Status = Payments.Status::"Pending Approval" THEN BEGIN
                                    status := 'warning*Your imprest surrender could not be cancelled. Kindly try again or contact the administrator if this error persists';
                                END ELSE BEGIN
                                    status := 'success*Your imprest surrender was successfully cancelled';
                                END;
                            end else begin
                                status := 'danger*Approval workflow is not enabled';
                            end;

                        end else begin
                            status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or has not been sent for approval';
                        end;
                        exit(status);
                    end else
                        if recordType = 'purchase requisition' then begin
                            status := 'danger*The Purchase Requisition approval could not be cancelled';
                            PurchaseHeader.Reset;
                            PurchaseHeader.SetRange("Request-By No.", employeeNo);
                            PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
                            PurchaseHeader.SetRange("No.", recordNo);
                            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
                            if PurchaseHeader.FindSet then begin

                                leaveApp := PurchaseHeader;
                                IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                                    CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                                IF PurchaseHeader.GET(PurchaseHeader."No.") THEN BEGIN
                                    IF PurchaseHeader.Status = PurchaseHeader.Status::"Pending Approval" THEN BEGIN
                                        status := 'warning*Your Purchase Requisition could not be cancelled. Kindly try again or contact the administrator if this error persists';
                                    END ELSE BEGIN
                                        status := 'success*Your Purchase Requisition was successfully cancelled';
                                    END;
                                end else begin
                                    status := 'danger*Approval workflow is not enabled';
                                end;

                            end else begin
                                status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
                            end;

                        end else
                            if recordType = 'store requisition' then begin
                                status := 'danger*The Store Requisition approval could not be cancelled';
                                PurchaseHeader.Reset;
                                PurchaseHeader.SetRange("Request-By No.", employeeNo);
                                PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
                                PurchaseHeader.SetRange("No.", recordNo);
                                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
                                if PurchaseHeader.FindSet then begin

                                    leaveApp := PurchaseHeader;
                                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                                        CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                                    IF PurchaseHeader.GET(PurchaseHeader."No.") THEN BEGIN
                                        IF PurchaseHeader.Status = PurchaseHeader.Status::"Pending Approval" THEN BEGIN
                                            status := 'warning*Your Store Requisition could not be cancelled. Kindly try again or contact the administrator if this error persists';
                                        END ELSE BEGIN
                                            status := 'success*Your Store Requisition was successfully cancelled';
                                        END;
                                    end else begin
                                        status := 'danger*Approval workflow is not enabled';
                                    end;

                                end else begin
                                    status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
                                end;
                            end else
                                if recordType = 'transport requisition' then begin
                                    status := 'danger*The fleet requisition approval could not be cancelled';
                                    TransportRequisition.Reset;
                                    TransportRequisition.SetRange("Employee No", employeeNo);
                                    TransportRequisition.SetRange("Transport Requisition No", recordNo);
                                    TransportRequisition.SetRange(Status, TransportRequisition.status::"Pending Approval");
                                    if TransportRequisition.FindSet then begin

                                        leaveApp := TransportRequisition;
                                        IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                                            CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                                        IF TransportRequisition.GET(TransportRequisition."Transport Requisition No") THEN BEGIN
                                            IF TransportRequisition.Status = TransportRequisition.Status::"Pending Approval" THEN BEGIN
                                                status := 'warning*Your Transport Requisition could not be cancelled. Kindly try again or contact the administrator if this error persists';
                                            END ELSE BEGIN
                                                status := 'success*Your Transport Requisition was successfully cancelled';
                                            END;
                                        end else begin
                                            status := 'danger*Approval workflow is not enabled';
                                        end;

                                    end else begin
                                        status := 'danger*A Transport requisition with the given number does not exist, has not been sent for approval or you are not the owner';
                                    end;
                                end else
                                    if recordType = 'staff claim' then begin
                                        status := 'danger*The Staff claim approval could not be cancelled';

                                        Payments.Reset;
                                        Payments.SetRange("Account No.", employeeNo);
                                        Payments.SetRange("No.", recordNo);
                                        Payments.SetRange(Status, Payments.Status::"Pending Approval");
                                        Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
                                        Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
                                        if Payments.FindSet then begin

                                            leaveApp := Payments;
                                            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                                                CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
                                            IF Payments.GET(Payments."No.") THEN BEGIN
                                                IF Payments.Status = Payments.Status::"Pending Approval" THEN BEGIN
                                                    status := 'warning*Your Staff Claim could not be cancelled. Kindly try again or contact the administrator if this error persists';
                                                END ELSE BEGIN
                                                    status := 'success*Your Staff Claim was successfully cancelled';
                                                END;
                                            end else begin
                                                status := 'danger*Approval workflow is not enabled';
                                            end;

                                        end else begin
                                            status := 'danger*A Staff Claim with the given number does not exist, you are not the requestor or has not been sent for approval';
                                        end;
                                    end;
        exit(status);
    end;

    procedure changePassword(employeeNo: Code[50]; currentPassword: Text; newPassword: Text; confirmPassword: Text) status: Text
    var
        HRPortalUsers: Record HRPortalUsers;
    begin
        status := 'danger*Your password could not be changed. Please try again';
        HRPortalUsers.Reset;
        HRPortalUsers.SetRange(employeeNo, employeeNo);
        HRPortalUsers.SetRange(password, currentPassword);
        if HRPortalUsers.FindSet then begin
            if StrLen(newPassword) > 3 then begin
                if newPassword = confirmPassword then begin
                    HRPortalUsers.password := newPassword;
                    HRPortalUsers.changedPassword := true;
                    if HRPortalUsers.Modify(true) then begin
                        status := 'success*Your password was successfully updated';
                    end else begin
                        status := 'danger*Your password could not be changed. Please try again';
                    end;
                end else begin
                    status := 'danger*New Password and confirm new password do not match!!!';
                end;
            end else begin
                status := 'danger*The password you entered as your new password is too short. It should be atleast 4 characters';
            end;
        end else begin
            status := 'danger*The password you entered as your current password is wrong. Please try again';
        end;
        exit(status);
    end;

    procedure deleteRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; lineNo: Integer; documentType: Integer) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        status := 'danger*Your Requisition Line could not be deleted';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            PurchaseLine.Reset;
            PurchaseLine.SetRange("Document Type", documentType);
            PurchaseLine.SetRange("Document No.", requisitionNo);
            PurchaseLine.SetRange("Line No.", lineNo);
            if PurchaseLine.FindSet then begin
                if PurchaseLine.Delete(true) then begin
                    status := 'success*The Requisition Line was successfully deleted';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be deleted';
                end;
            end else begin
                status := 'danger*The Requisition Line does not exist' + Format(lineNo);
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure deleteRequisitionLineTraining(step: integer; requisitionNo: Code[250]; lineNo: Integer) status: Text
    var
        courses: Record CoursesCurrentlyPursuing;
        Duty: Record DutyPerformanceChallenges;
        TrainingNeedsRequests: Record "Training Needs Requests";
        TrainingAttended: Record EmpTrainingAttended;
    begin
        status := 'danger*Your Requisition Line could not be deleted';
        if step = 2 then begin
            courses.Reset;
            courses.SetRange("Document No.", requisitionNo);
            courses.SetRange("Line No.", lineNo);
            if courses.FindFirst then begin
                if courses.Delete(true) then begin
                    status := 'success*The Request Line was successfully deleted';
                end else begin
                    status := 'danger*Your Request Line could not be deleted';
                end;
            end else begin
                status := 'danger*The Request Line does not exist' + Format(lineNo);
            end;
            exit(status);

        end else if step = 3
        then begin
            Duty.Reset;
            Duty.SetRange("Document No.", requisitionNo);
            Duty.SetRange("Line No.", lineNo);
            if Duty.FindFirst then begin
                if Duty.Delete(true) then begin
                    status := 'success*The Request Line was successfully deleted';
                end else begin
                    status := 'danger*Your Request Line could not be deleted';
                end;
            end else begin
                status := 'danger*The Request Line does not exist' + Format(lineNo);
            end;
            exit(status);
        end else if step = 4
         then begin
            TrainingNeedsRequests.Reset;
            TrainingNeedsRequests.SetRange("Training Header No.", requisitionNo);
            TrainingNeedsRequests.SetRange("Entry No.", lineNo);
            if TrainingNeedsRequests.FindFirst then begin
                if TrainingNeedsRequests.Delete(true) then begin
                    status := 'success*The Request Line was successfully deleted';
                end else begin
                    status := 'danger*Your Request Line could not be deleted';
                end;
            end else begin
                status := 'danger*The Request Line does not exist' + Format(lineNo);
            end;
            exit(status);
        end else begin
            TrainingAttended.Reset;
            TrainingAttended.SetRange("Document No.", requisitionNo);
            TrainingAttended.SetRange("Line No.", lineNo);
            if TrainingAttended.FindFirst then begin
                if TrainingAttended.Delete(true) then begin
                    status := 'success*The Request Line was successfully deleted';
                end else begin
                    status := 'danger*Your Request Line could not be deleted';
                end;
            end else begin
                status := 'danger*The Request Line does not exist' + Format(lineNo);
            end;
            exit(status);
        end;


    end;

    procedure sendStaffClaimApproval(employeeNo: Code[50]; staffClaim: Code[50]) status: Text
    var
        TXT0001: label 'This employee %1 has an outstanding balance of %2. Please Contact your immediate supervisor.';
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
        TotalImprestAmount: Decimal;
    begin
        Payments.Reset;
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange("No.", staffClaim);
        Payments.SetRange(Status, Payments.Status::Open);
        Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
        Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
        if Payments.FindSet then begin
            //
            Employee.Reset;
            Employee.SetRange(Employee."No.", employeeNo);
            if Employee.FindFirst then begin
                Employee.CalcFields(Employee.Balance);
                if Employee.Balance < 0 then
                    Error(TXT0001, Employee."No.", Abs(Employee.Balance));
            end;
            Payments.CalcFields("Total Amount");
            TotalImprestAmount := Payments."Total Amount";
            if (TotalImprestAmount > Payments."Job Task Remaining Amount") then
                Message('Applied Staff Claim of Amount (%1) is more than Available Amount (%2)', TotalImprestAmount, Payments."Job Task Remaining Amount");
            //
            leaveApp := Payments;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            IF Payments.GET(Payments."No.") THEN BEGIN
                IF Payments.Status = Payments.Status::Open THEN BEGIN
                    status := 'warning*Your staff claim  could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your staff claim was successfully sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

            //end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure ApproveStaffClaim(employeeNo: Code[50]; staffClaim: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        ProjectTeam: Record "Project Members";
        ImprestMemo1: Record "Imprest Memo";
        PortalApprovalEntry: Record "PortalApproval Entry";
        Employee: Record Employee;
    begin
        PortalApprovalEntry.Reset;
        PortalApprovalEntry.SetRange("Approver ID", employeeNo);
        PortalApprovalEntry.SetRange("Document No.", staffClaim);
        if PortalApprovalEntry.FindSet then begin
            Payments.Reset;
            Payments.SetRange("No.", staffClaim);
            Payments.SetRange(Status, Payments.Status::Open);
            Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
            Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
            if Payments.FindSet then begin
                Payments.TestField("Account No.");
                Payments.TestField("Account Name");
                Payments.TestField("Shortcut Dimension 1 Code");
                Payments.TestField(Job);
                Payments.TestField("Job Task No");
                // if ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Payments) then
                //    ApprovalsMgmt.OnSendPaymentsForApproval(Payments);
                if Payments2.Get(staffClaim) then begin
                    if Payments2.Status = Payments2.Status::"Pending Approval" then begin
                        PortalApprovalEntry.Status := PortalApprovalEntry.Status::Approved;
                        if PortalApprovalEntry.Modify(true) then
                            status := 'success*The staff claim was successfully Approved';
                    end;
                end;
            end else begin
                status := 'danger*A staff claim with the given number does not exist';
            end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);
    end;

    procedure CancelStaffClaimRecordApproval(employeeNo: Code[50]; recordNo: Code[50]; recordType: Text) status: Text
    var
        HRLeaveApplication1: Record "HR Leave Applications";
        ImprestMemo1: Record "Imprest Memo";
        Payments2: Record payments;
        ImprestHeader: Record payments;
        PurchaseHeader1: Record "Purchase Header";
        TransportRequisition: Record "Transport Requisition";
        TransportRequisition1: Record "Transport Requisition";
        Employee: Record Employee;
        PortalApprovalEntry: Record "PortalApproval Entry";
    begin
        status := 'danger*The record approval could not be cancelled';
        Employee.Reset;
        Employee.SetRange("No.", employeeNo);
        if Employee.FindSet then begin
            PortalApprovalEntry.Reset;
            PortalApprovalEntry.SetRange("Document No.", recordNo);
            PortalApprovalEntry.SetRange("Approver ID", employeeNo);
            if PortalApprovalEntry.FindSet then begin
                recordType := Lowercase(recordType);
                if recordType = 'leave' then begin
                    status := 'danger*The Staff Claim approval could not be cancelled';
                    leaveApplications.Reset;
                    leaveApplications.SetRange("Application Code", recordNo);
                    leaveApplications.SetRange("Employee No", employeeNo);
                    if leaveApplications.FindSet then begin
                        //  ApprovalsMgmt.OnCancelLeaveAppApprovalRequest(leaveApplications);
                        if HRLeaveApplication1.Get(leaveApplications."Application Code") then begin
                            if HRLeaveApplication1.Status = leaveApplications.Status then begin
                                status := 'warning*Your leave application  approval could not be cancelled';
                            end else begin
                                status := 'success*Your leave application approval was successfully cancelled';
                            end;
                        end;
                    end else begin
                        status := 'danger*The leave does not exist or you are not the requester';
                    end;
                end else
                    if recordType = 'imprest memo' then begin
                        status := 'danger*The imprest memo approval could not be cancelled';
                        ImprestMemo.Reset;
                        ImprestMemo.SetRange(Requestor, employeeNo);
                        ImprestMemo.SetRange("No.", recordNo);
                        ImprestMemo.SetRange(Status, ImprestMemo.Status::"Pending Approval");
                        if ImprestMemo.FindSet then begin

                            //  ApprovalsMgmt.OnCancelImpMemoApprovalRequest(ImprestMemo);

                            ImprestMemo1.Reset;
                            ImprestMemo1.SetRange(Requestor, employeeNo);
                            ImprestMemo1.SetRange("No.", recordNo);
                            if ImprestMemo1.FindSet then begin
                                if not (ImprestMemo1.Status = ImprestMemo1.Status::"Pending Approval") then begin
                                    status := 'success*The imprest memo approval was successfully cancelled';
                                end;
                            end;

                        end else begin
                            status := 'danger*An imprest with the given number does not exist, you are not the requestor or has not been sent for approval';
                        end;
                        exit(status);
                    end else
                        if recordType = 'imprest surrender' then begin
                            status := 'danger*The imprest surrender could not be sent for approval';

                            Payments.Reset;
                            Payments.SetRange("Account No.", employeeNo);
                            Payments.SetRange("No.", recordNo);
                            Payments.SetRange(Status, Payments.Status::"Pending Approval");
                            Payments.SetRange("Payment Type", Payments."payment type"::Surrender);
                            Payments.SetRange("Document Type", Payments."document type"::Surrender);
                            if Payments.FindSet then begin
                                //  ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);

                                if Payments2.Get(recordNo) then begin
                                    if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
                                        status := 'success*The imprest Surrender approval was successfully cancelled';
                                        if ImprestHeader.Get(Payments2."Imprest Issue Doc. No") then begin
                                            ImprestHeader.Selected := false;
                                            ImprestHeader.Modify;
                                        end;
                                    end;
                                end;
                            end else begin
                                status := 'danger*An imprest surrender with the given number does not exist, you are not the requestor or has not been sent for approval';
                            end;
                            exit(status);
                        end else
                            if recordType = 'purchase requisition' then begin
                                status := 'danger*The Purchase Requisition approval could not be cancelled';
                                PurchaseHeader.Reset;
                                PurchaseHeader.SetRange("Request-By No.", employeeNo);
                                PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
                                PurchaseHeader.SetRange("No.", recordNo);
                                PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
                                if PurchaseHeader.FindSet then begin
                                    ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);
                                    PurchaseHeader1.Reset;
                                    PurchaseHeader1.SetRange("Request-By No.", employeeNo);
                                    PurchaseHeader1.SetRange("No.", recordNo);
                                    PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
                                    if PurchaseHeader1.FindSet then begin
                                        if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
                                            status := 'success*The Purchase Requisition approval was successfully cancelled';
                                        end;
                                    end;
                                end else begin
                                    status := 'danger*A Purchase Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
                                end;
                            end else
                                if recordType = 'store requisition' then begin
                                    status := 'danger*The Store Requisition approval could not be cancelled';
                                    PurchaseHeader.Reset;
                                    PurchaseHeader.SetRange("Request-By No.", employeeNo);
                                    PurchaseHeader.SetRange(Status, PurchaseHeader.Status::"Pending Approval");
                                    PurchaseHeader.SetRange("No.", recordNo);
                                    PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
                                    if PurchaseHeader.FindSet then begin

                                        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(PurchaseHeader);

                                        PurchaseHeader1.Reset;
                                        PurchaseHeader1.SetRange("Request-By No.", employeeNo);
                                        PurchaseHeader1.SetRange("No.", recordNo);
                                        PurchaseHeader1.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
                                        if PurchaseHeader1.FindSet then begin
                                            if not (PurchaseHeader1.Status = PurchaseHeader1.Status::"Pending Approval") then begin
                                                status := 'success*The Store Requisition approval was successfully cancelled';
                                            end;
                                        end;
                                    end else begin
                                        status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or has not been sent for approval';
                                    end;
                                end else
                                    if recordType = 'transport requisition' then begin
                                        status := 'danger*The fleet requisition approval could not be cancelled';
                                        TransportRequisition.Reset;
                                        TransportRequisition.SetRange("Employee No", employeeNo);
                                        TransportRequisition.SetRange("Transport Requisition No", recordNo);
                                        if TransportRequisition.FindSet then begin
                                            TransportRequisition.TestField(Status, TransportRequisition.Status::"Pending Approval");
                                            //   ApprovalsMgmt.OnCancelFleetApprovalRequest(TransportRequisition);
                                            if TransportRequisition1.Get(recordNo) then begin
                                                if not (TransportRequisition1.Status = TransportRequisition1.Status::"Pending Approval") then begin
                                                    status := 'success*The fleet requisition approval was successfully cancelled';
                                                end;
                                            end;
                                        end else begin
                                            status := 'danger*A fleet requisition with the given number does not exist, has not been sent for approval or you are not the owner';
                                        end;
                                    end else
                                        if recordType = 'staff claim' then begin
                                            status := 'danger*The Staff claim approval could not be cancelled';

                                            Payments.Reset;
                                            Payments.SetRange("Account No.", employeeNo);
                                            Payments.SetRange("No.", recordNo);
                                            Payments.SetRange(Status, Payments.Status::"Pending Approval");
                                            Payments.SetRange("Payment Type", Payments."payment type"::"Staff Claim");
                                            Payments.SetRange("Document Type", Payments."document type"::"Staff Claims");
                                            if Payments.FindSet then begin
                                                //   ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Payments);
                                                if Payments2.Get(recordNo) then begin
                                                    if not (Payments2.Status = Payments2.Status::"Pending Approval") then begin
                                                        PortalApprovalEntry.Status := PortalApprovalEntry.Status::Canceled;
                                                        if PortalApprovalEntry.Modify(true) then
                                                            status := 'success*The staff claim approval was successfully cancelled';
                                                    end;
                                                end;
                                            end else begin
                                                status := 'danger*A Staff Claim with the given number does not exist, you are not the requestor or has not been sent for approval';
                                            end;
                                        end;
            end;
        end;
        exit(status);
    end;

    procedure createStaffClaim(employeeNo: Code[50]; claimNo: Code[50]; paymentNarration: Text; fundCode: Code[100]; job: Code[100]; jobTask: Code[100]; username: Text) status: Text
    begin
        status := 'danger*Your staff claim could not be captured';
        if claimNo = '' then begin //new imprest surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::"Staff Claims";
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::"Staff Claim";
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Created By" := 'KURA\' + username.ToUpper();
            //Added By Fred To Cater for The HOD Workflows
            Payments."Account No." := employeeNo;
            if Employee.Get(Payments."Account No.") then
                Payments.HOD := Employee.HOD;
            Payments."Responsibility Center" := Employee."Global Dimension 1 Code";
            //Added By Fred To Cater for The HOD Workflows
            Payments.Validate("Account No.");
            Payments."Payment Narration" := paymentNarration;
            Payments."Funding Source" := fundCode;
            Payments.Validate("Payment Narration");
            Payments."Shortcut Dimension 2 Code" := fundCode;
            Payments.Validate("Shortcut Dimension 2 Code");
            Payments.Job := job;
            Payments.Validate(Job);
            Payments."Job Task No" := jobTask;
            Payments.Validate("Job Task No");
            Payments."Job Task No." := jobTask;
            Payments.Validate("Job Task No.");
            if Payments.Insert(true) then begin
                status := 'success*Your staff claim was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your staff claim could not be captured';
            end;
        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", claimNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                Payments."Payment Narration" := paymentNarration;
                Payments.Validate("Payment Narration");
                Payments."Shortcut Dimension 2 Code" := fundCode;
                Payments.Validate("Shortcut Dimension 2 Code");
                Payments.Job := job;
                Payments.Validate(Job);
                Payments."Job Task No" := jobTask;
                Payments.Validate("Job Task No");
                Payments."Job Task No." := jobTask;
                Payments.Validate("Job Task No.");
                if Payments.Modify(true) then begin
                    status := 'success*Your staff claim was successfully updated';
                end else begin
                    status := 'danger*Your staff claim could not be updated';
                end;

            end else begin
                status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure createStaffClaim1(employeeNo: Code[50]; claimNo: Code[50]; paymentNarration: Text; fundCode: Code[100]; job: Code[100]; jobTask: Code[100]; region: Code[100]) status: Text
    begin
        status := 'danger*Your staff claim could not be captured';
        if claimNo = '' then begin //new imprest surrender
            Payments.Init;
            Payments."Document Type" := Payments."document type"::"Staff Claims";
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::"Staff Claim";
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            //Added By Fred To Cater for The HOD Workflows
            Payments."Account No." := employeeNo;
            if Employee.Get(Payments."Account No.") then
                Payments.HOD := Employee.HOD;
            //Added By Fred To Cater for The HOD Workflows
            Payments.Validate("Account No.");
            Payments."Payment Narration" := paymentNarration;
            Payments.Validate("Payment Narration");
            Payments."Shortcut Dimension 2 Code" := fundCode;
            Payments.Validate("Shortcut Dimension 2 Code");
            Payments.Job := job;
            Payments.Validate(Job);
            Payments."Job Task No" := jobTask;
            Payments.Validate("Job Task No");
            Payments."Job Task No." := jobTask;
            Payments.Validate("Job Task No.");
            if Payments.Insert(true) then begin
                Payments."Responsibility Center" := region;
                Payments.Modify(true);
                status := 'success*Your staff claim was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your staff claim could not be captured';
            end;
        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", claimNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                Payments."Payment Narration" := paymentNarration;
                Payments.Validate("Payment Narration");
                Payments."Shortcut Dimension 2 Code" := fundCode;
                Payments.Validate("Shortcut Dimension 2 Code");
                Payments.Job := job;
                Payments.Validate(Job);
                Payments."Job Task No" := jobTask;
                Payments.Validate("Job Task No");
                Payments."Job Task No." := jobTask;
                Payments.Validate("Job Task No.");
                if Payments.Modify(true) then begin
                    status := 'success*Your staff claim was successfully updated';
                end else begin
                    status := 'danger*Your staff claim could not be updated';
                end;

            end else begin
                status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;

    procedure deleteStaffClaimLine(employeeNo: Code[100]; claimNo: Code[100]; lineNo: Integer) status: Text
    var
        PVLines: Record "PV Lines";
    begin
        status := 'danger*The staff claim line could not be deleted';
        Payments.Reset;
        Payments.SetRange("No.", claimNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            PVLines.Reset;
            PVLines.SetRange(No, claimNo);
            PVLines.SetRange("Line No", lineNo);
            if PVLines.FindSet then begin
                if PVLines.Delete(true) then begin
                    status := 'success*The staff claim line was successfully deleted';
                end else begin
                    status := 'danger*The staff claim line could not be deleted'
                end;
            end else begin
                status := 'danger*The staff claim line could not be deleted';
            end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
        end;
    end;



    procedure createStaffClaimLine(employeeNo: Code[100]; claimNo: Code[100]; voteItem: Code[100]; description: Text; amount: Decimal) status: Text
    var
        PVLines: Record "PV Lines";
    begin
        status := 'danger*The staff claim line could not be deleted';
        Payments.Reset;
        Payments.SetRange("No.", claimNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            PVLines.INIT;
            PVLines.No := claimNo;
            PVLines.VALIDATE(No);
            PVLines."Account Type" := PVLines."Account Type"::"G/L Account";
            PVLines."Type of Expense" := voteItem;
            PVLines.VALIDATE("Type of Expense");
            PVLines.Description := description;
            PVLines.VALIDATE(Description);
            PVLines.Amount := amount;
            PVLines.VALIDATE(Amount);
            if PVLines.Insert(true) then begin
                status := 'success*The staff claim line was successfully added';
            end else begin
                status := 'danger*The staff claim line could not be added'
            end;

        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
        end;
    end;

    procedure editStaffClaimLine(lineNo: Integer; employeeNo: Code[100]; claimNo: Code[100]; voteItem: Code[100]; description: Text; amount: Decimal) status: Text
    var
        PVLines: Record "PV Lines";
    begin
        status := 'danger*The staff claim line could not be deleted';
        Payments.Reset;
        Payments.SetRange("No.", claimNo);
        Payments.SetRange("Account No.", employeeNo);
        Payments.SetRange(Status, Payments.Status::Open);
        if Payments.FindSet then begin
            PVLines.Reset;
            PVLines.SetRange("Line No", lineNo);
            PVLines.SetRange(No, claimNo);
            if PVLines.FindSet then begin
                PVLines.Validate(No);
                PVLines."Type of Expense" := voteItem;
                PVLines.Validate("Type of Expense");
                PVLines.Description := description;
                PVLines.Validate(Description);
                PVLines.Amount := amount;
                PVLines.Validate(Amount);
                if PVLines.Modify(true) then begin
                    status := 'success*The staff claim line was successfully updated';
                end else begin
                    status := 'danger*The staff claim line could not be updated'
                end;
            end else begin
                status := 'danger*The staff claim line does not exist';
            end;
        end else begin
            status := 'danger*A staff claim with the given number does not exist, you are not the owner or is no longer open';
        end;
    end;

    procedure sendStoreRequisitionApproval(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        TEXT012: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        PurchaseHeader1: Record "Purchase Header";
    begin
        status := 'danger*The Store Requisition could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
        if PurchaseHeader.FindSet then begin

            leaveApp := PurchaseHeader;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            IF PurchaseHeader.GET(PurchaseHeader."No.") THEN BEGIN
                IF PurchaseHeader.Status = PurchaseHeader.Status::Open THEN BEGIN
                    status := 'warning*Your Purchase Requisition could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your Purchase Requisition was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;



        end else begin
            status := 'danger*A Store Requisition with the given number does not exist, you are not the requestor or is no longer open';
        end;
        exit(status);

    end;

    procedure createStoreRequisitionLine1(employeeNo: Code[250]; requisitionNo: Code[250]; itemCategory: Code[250]; item: Code[250]; quantity: Decimal; uom: Text[100]) status: Text
    var
        PurchaseLine: Record "Purchase Line";

    begin
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            PurchaseLine.Init;
            PurchaseLine."Document Type" := PurchaseHeader."document type"::"Store Requisition";
            PurchaseLine.Validate("Document Type");
            PurchaseLine."Document No." := requisitionNo;
            PurchaseLine.Validate("Document No.");
            PurchaseLine."Line No." := getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
            PurchaseLine.Validate("Line No.");
            PurchaseLine."Type" := PurchaseLine.Type::Item;
            PurchaseLine.Validate("Type");
            PurchaseLine."Service/Item Code" := item;
            PurchaseLine.Validate("Service/Item Code");
            PurchaseLine."No." := item;
            PurchaseLine.Validate("No.");
            PurchaseLine."Qty. Requested" := quantity;
            PurchaseLine.Validate("Qty. Requested");
            PurchaseLine."Unit of Measure" := uom;
            if PurchaseLine.Insert(true) then begin
                PurchaseLine.Validate("Qty. Requested", quantity);
                // PurchaseLine.Modify(true);
                status := 'success*The Requisition Line was successfully added';//+FORMAT(directUnitCost);
            end else begin
                status := 'danger*Your Requisition Line could not be added';
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure createStoreRequisitionLine(employeeNo: Code[250]; requisitionNo: Code[250]; itemCategory: Code[250]; item: Code[250]; quantity: Decimal; uom: Text[100]; desc: Text[100]; region: Code[20]; genPost: Code[20]; vatPost: Code[20]; inventories: Decimal; busPost: Code[20]) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin

        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        if PurchaseHeader.FindSet then begin
            if (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition") or (PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition") then begin
                //add line
                PurchaseLine.Init;
                //Document Type,Document No.,Line No.
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Store Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Store Requisition";
                end;
                if PurchaseHeader."Document Type" = PurchaseHeader."document type"::"Purchase Requisition" then begin
                    PurchaseLine."Document Type" := PurchaseLine."document type"::"Purchase Requisition";
                end;
                PurchaseLine.Validate("Document Type");
                PurchaseLine."Document No." := requisitionNo;
                PurchaseLine.Validate("Document No.");
                PurchaseLine."Line No." := getPurchaseLineNo(requisitionNo, PurchaseLine."Document Type");
                PurchaseLine.Validate("Line No.");
                PurchaseLine."Item Category" := itemCategory;
                PurchaseLine.Validate("Item Category");
                PurchaseLine."Service/Item Code" := item;
                PurchaseLine.Validate("Service/Item Code");
                PurchaseLine."Qty. Requested" := quantity;
                PurchaseLine."Inventory" := inventories;
                PurchaseLine.Validate("Qty. Requested");
                PurchaseLine."Unit of Measure Code" := uom;
                PurchaseLine.Validate("Unit of Measure Code");
                PurchaseLine."Unit of Measure" := uom;
                PurchaseLine.Validate("Unit of Measure");
                PurchaseLine.Type := PurchaseLine.Type::Item;
                PurchaseLine."Location Code" := region;
                PurchaseLine."No." := item;
                PurchaseLine.Description := desc;
                PurchaseLine."Gen. Prod. Posting Group" := genPost;
                PurchaseLine."VAT Prod. Posting Group" := vatPost;
                PurchaseLine."Gen. Bus. Posting Group" := busPost;
                PurchaseLine.Validate("No.");
                if PurchaseLine.Insert(true) then begin
                    PurchaseLine.Validate("Qty. Requested", quantity);
                    PurchaseLine.Validate("No.", item);
                    PurchaseLine.Modify(true);
                    status := 'success*The Requisition Line was successfully added';//+FORMAT(directUnitCost);
                end else begin
                    status := 'danger*Your Requisition Line could not be added';
                end;
            end;
        end else begin
            status := 'danger*A Requisition with the given number does not exist, you are not the owner or is no longer open';
        end;
        exit(status);
    end;

    procedure applyexternalHrJobs(jobId: Text[20]; surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; religion: Text[50]; idNumber: Text[50]; phoneNo: Text[30]; email: Text[50]; ethinc: Text[30]; postalAddress: Text[50]; postalAddressCode: Text[50]; city: Text[50]; "expected salary": Decimal; registrationDetails: Text[250]) status: Text
    begin
        JobApplicants.Reset;
        JobApplicants.SetRange("Job Applied For", jobId);
        JobApplicants.SetRange("ID Number", idNumber);

        if JobApplicants.FindSet then begin
            status := 'error';
            /*CASE gender OF
                  0:
                    gender:=gender::Male;
                  1:
                    gender:=gender::Female;
                  2:gender:=gender::Both;

                  ELSE
                    END;

              CASE disabled OF
                0:
                  disabled:=disabled::Yes;
                1:
                  disabled:=disabled::No;
                  ELSE
                  END;

           CASE maritalStatus OF
             0:
               maritalStatus:=maritalStatus::Married;

             1:
               maritalStatus:=maritalStatus::Single;
             2:
               maritalStatus:=maritalStatus::Divorced;

             3:
              maritalStatus:=maritalStatus::Separated;
             4:
                maritalStatus:=maritalStatus::"Widow(er)";
             5:
               maritalStatus:=maritalStatus::Other;

               ELSE
               END;
               JobApplicants."Application No":='';
                JobApplicants."Job Applied For":=jobId;
                JobApplicants."First Name":=firstname;
                JobApplicants."Middle Name":=lastname;
                JobApplicants."Last Name":=surname;
                JobApplicants.Initials:=title;
                JobApplicants."Date Applied":=TODAY();
                JobApplicants."Date Of Birth":=DOB;
                JobApplicants.Gender:=gender;
                JobApplicants.Disabled:=disabled;
                JobApplicants."Disability Details":= disabilityDetails;
                JobApplicants.County:=county;
                JobApplicants.Citizenship:=nationality;
                JobApplicants."Marital Status":=maritalStatus;
                JobApplicants.Religion:=religion;
                JobApplicants."ID Number":=idNumber;
                JobApplicants."Ethnic Origin":=ethinc;
                JobApplicants."E-Mail":=email;
                JobApplicants."Cell Phone Number":=phoneNo;
                JobApplicants."Postal Address":= postalAddress;
                JobApplicants."Post Code":= postalAddressCode;
                JobApplicants.City:=city;
                JobApplicants."Expected Salary":="expected salary";


               IF  JobApplicants.MODIFY(TRUE) THEN BEGIN

                    jpa.RESET;
                  jpa.SETRANGE("ID Number",idNumber);
                  jpa.SETRANGE("Job Applied For",jobId);
                  IF jpa.FINDSET THEN BEGIN
                    status:=jpa."Application No";
                    END
                   END
                   ELSE
                   BEGIN
                      status:='error*It seems you have not applied for this position. Please try another position';
                     END
               */
        end
        else begin

            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;
            JobApplicants.Init;
            JobApplicants."Application No" := '';
            JobApplicants."Job Applied For" := jobId;

            JobApplicants."First Name" := firstname;
            JobApplicants."Middle Name" := lastname;
            JobApplicants."Last Name" := surname;
            JobApplicants.Initials := title;
            JobApplicants."Date Applied" := Today();
            JobApplicants."Date Of Birth" := DOB;
            JobApplicants.Gender := gender;
            JobApplicants.Disabled := disabled;
            JobApplicants."Disability Details" := disabilityDetails;
            JobApplicants.County := county;
            JobApplicants.Citizenship := nationality;
            JobApplicants."Marital Status" := maritalStatus;
            JobApplicants.Religion := religion;
            JobApplicants."ID Number" := idNumber;
            JobApplicants."Ethnic Origin" := ethinc;
            JobApplicants."E-Mail" := email;
            JobApplicants."Cell Phone Number" := phoneNo;
            JobApplicants."Details of Disability regist" := registrationDetails;

            JobApplicants."Postal Address" := postalAddress;
            JobApplicants."Post Code" := postalAddressCode;
            JobApplicants.City := city;
            JobApplicants."Expected Salary" := "expected salary";

            if JobApplicants.Insert(true) then begin
                jpa.Reset;
                jpa.SetRange("ID Number", idNumber);
                jpa.SetRange("Job Applied For", jobId);
                if jpa.FindLast then begin
                    status := jpa."Application No";
                end

            end
            else begin
                status := 'error*an error occured during the process of insertion';
            end;

        end;

    end;

    procedure applyinternalHrJobs(docNo: Text[30]; jobId: Text[20]; surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; religion: Text[50]; idNumber: Text[50]; NhifNo: Text[30]; NssfNo: Text[30]; pinNo: Text[30]; phoneNo: Text[30]; altPhoneNo: Text[30]; email: Text[50]; altEmail: Text[50]; empNo: Text[20]; dpt: Text[100]; currentPosition: Text[150]; jobGroup: Text[50]; dateOfFirstAppointment: Date; lastPromotionDate: Date; ethinc: Text[30]) status: Text
    begin
        JobApplicants.Reset;
        JobApplicants.SetRange("Job Applied For", jobId);
        JobApplicants.SetRange("ID Number", idNumber);

        if JobApplicants.FindSet then begin
            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;
            JobApplicants."Application No" := docNo;
            JobApplicants."Job Applied For" := jobId;
            JobApplicants."Employee No" := empNo;
            JobApplicants."First Name" := firstname;
            JobApplicants."Middle Name" := lastname;
            JobApplicants."Last Name" := surname;
            JobApplicants.Initials := title;
            JobApplicants."Date Applied" := Today();
            JobApplicants."Date Of Birth" := DOB;
            JobApplicants.Gender := gender;
            JobApplicants.Disabled := disabled;
            JobApplicants."Disability Details" := disabilityDetails;
            JobApplicants.County := county;
            JobApplicants.Citizenship := nationality;
            JobApplicants."Marital Status" := maritalStatus;
            JobApplicants.Religion := religion;
            JobApplicants."ID Number" := idNumber;
            JobApplicants.NHIF := NhifNo;
            JobApplicants.NSSF := NssfNo;
            JobApplicants."Ethnic Origin" := ethinc;
            JobApplicants."Position held" := currentPosition;
            JobApplicants."Job Group" := jobGroup;
            JobApplicants."First Appointment Date" := dateOfFirstAppointment;
            JobApplicants."Last Appointment Date" := lastPromotionDate;
            JobApplicants."Department Code" := dpt;
            JobApplicants."PIN Number" := pinNo;
            JobApplicants."E-Mail" := email;
            JobApplicants."Alternative Email" := altEmail;
            JobApplicants."Cell Phone Number" := phoneNo;
            JobApplicants."Altenative Phone Number" := altPhoneNo;
            if JobApplicants.Modify(true) then begin

                status := 'success';
            end
            else begin
                status := 'danger*It seems you have not applied for this position. Please try another position';
            end

        end
        else begin

            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;
            //Single,Married,Separated,Divorced,Widow(er),Other

            JobApplicants.Init;
            JobApplicants."Application No" := docNo;
            JobApplicants."Job Applied For" := jobId;
            JobApplicants."Employee No" := empNo;

            JobApplicants."First Name" := firstname;
            JobApplicants."Middle Name" := lastname;
            JobApplicants."Last Name" := surname;
            JobApplicants.Initials := title;
            JobApplicants."Date Applied" := Today();
            JobApplicants."Date Of Birth" := DOB;
            JobApplicants.Gender := gender;
            JobApplicants.Disabled := disabled;
            JobApplicants."Disability Details" := disabilityDetails;
            JobApplicants.County := county;
            JobApplicants.Citizenship := nationality;
            JobApplicants."Marital Status" := maritalStatus;
            JobApplicants.Religion := religion;
            JobApplicants."ID Number" := idNumber;
            JobApplicants.NHIF := NhifNo;
            JobApplicants.NSSF := NssfNo;
            JobApplicants."Ethnic Origin" := ethinc;
            JobApplicants."Position held" := currentPosition;
            JobApplicants."Job Group" := jobGroup;
            JobApplicants."First Appointment Date" := dateOfFirstAppointment;
            JobApplicants."Last Appointment Date" := lastPromotionDate;
            JobApplicants."Department Code" := dpt;




            JobApplicants."PIN Number" := pinNo;
            JobApplicants."E-Mail" := email;
            JobApplicants."Alternative Email" := altEmail;
            JobApplicants."Cell Phone Number" := phoneNo;
            JobApplicants."Altenative Phone Number" := altPhoneNo;
            if JobApplicants.Insert(true) then begin
                jpa.Reset;
                jpa.SetRange("ID Number", idNumber);
                jpa.SetRange("Job Applied For", jobId);
                if jpa.FindLast then begin
                    status := jpa."Application No";
                end

            end
            else begin
                status := 'error*an error occured during the process of insertion';
            end;

        end;
    end;

    procedure updateEmploymentHistory(id: Integer; startDate: Date; endDate: Date; company: Text[150]; designation: Text[150]; JobGrade: Text[100]; appNo: Text[30]; empNo: Text[30]; JobId: Text[30]) status: Text
    begin
        if JobApplicants.Get(id) then begin
            /* ApplicantEmploymentHistory.INIT;
             //ApplicantEmploymentHistory."Entry No.":= appNo;
            // ApplicantEmploymentHistory."Document Type":=company;
             ApplicantEmploymentHistory."Employee No.":=startDate;
             ApplicantEmploymentHistory."Posting Date":=endDate;
             ApplicantEmploymentHistory."User ID":= designation;
             ApplicantEmploymentHistory."Job Grade":=JobGrade;
             ApplicantEmploymentHistory."Entry No.":=appNo;
             ApplicantEmploymentHistory."Employee No":=empNo;
             ApplicantEmploymentHistory."Job Id" := JobId;
             ApplicantEmploymentHistory.MODIFY(TRUE);*/

            status := 'success';

        end
        else
            status := 'error*You seem to have not applied for this position';
        begin
        end

    end;

    procedure addEmploymentHistory(idNumber: Text[30]; startDate: Date; endDate: Date; company: Text[150]; designation: Text[150]; JobGrade: Text[100]; appNo: Text[30]; empNo: Text[30]; JobId: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin
            /* ApplicantEmploymentHistory.INIT;
             ApplicantEmploymentHistory."Entry No.":= appNo;
             ApplicantEmploymentHistory."Document Type":=company;
             ApplicantEmploymentHistory."Employee No.":=startDate;
             ApplicantEmploymentHistory."Posting Date":=endDate;
             ApplicantEmploymentHistory."User ID":= designation;
             ApplicantEmploymentHistory."Job Grade":=JobGrade;
             ApplicantEmploymentHistory."Id Number":=idNumber;
             ApplicantEmploymentHistory."Entry No.":=appNo;
             ApplicantEmploymentHistory."Employee No":=empNo;
             ApplicantEmploymentHistory."Job Id" := JobId;
             ApplicantEmploymentHistory.INSERT(TRUE);

             status:='success';*/

        end
        else
            status := 'error*You seem to have not applied for this position';
        begin
        end

    end;

    procedure addAcademicQualifications(appNo: Code[20]; institution: Text[200]; awardAttainment: Text[150]; specialization: Text[150]; gradeAttained: Text[150]; empNo: Text[30]; jobId: Text[30]; FromDate: Date; ToDate: Date) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            applicantQualifications.Init;

            applicantQualifications."Employee No." := empNo;
            applicantQualifications."Job ID" := jobId;
            applicantQualifications."Institution/Company" := institution;
            applicantQualifications."From Date" := FromDate;
            applicantQualifications."To Date" := ToDate;
            applicantQualifications."Qualification Description" := awardAttainment;
            applicantQualifications.Specialization := specialization;
            applicantQualifications."Course Grade" := gradeAttained;
            applicantQualifications."Application No" := appNo;
            applicantQualifications.Insert(true);

            status := 'success';


        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addProffessionalQualifications(appNo: Code[20]; institution: Text[150]; awardAttainment: Text[100]; specialization: Text[100]; gradeAttained: Text[100]; empNo: Text[20]; jobId: Text[20]; FromDate: Date; ToDate: Date) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            professionalQualifications.Init;
            professionalQualifications."Employee No" := empNo;
            professionalQualifications."Job ID" := jobId;
            professionalQualifications.Institution := institution;
            professionalQualifications."From Date" := FromDate;
            professionalQualifications."To Date" := ToDate;
            professionalQualifications.Attainment := awardAttainment;
            professionalQualifications.Specialization := specialization;
            professionalQualifications."Application No" := appNo;
            professionalQualifications.Grade := gradeAttained;
            professionalQualifications.Insert(true);
            status := 'success';
        end
        else begin
            status := 'You seem to have applied for this position';

        end
    end;

    procedure addTrainingAttended(fromDate: Date; ToDate: Date; JobId: Text[30]; EmployeeNo: Text[30]; Institution: Text[150]; courseName: Text[150]; appNo: Text[30]; attained: Text[100]) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            attendedTraining.Init;
            attendedTraining."Employee No" := EmployeeNo;
            attendedTraining."Application No" := appNo;
            attendedTraining."From Date" := fromDate;
            attendedTraining."To Date" := ToDate;
            attendedTraining."Job ID" := JobId;
            attendedTraining.Institution := Institution;
            attendedTraining."Course Name" := courseName;
            attendedTraining.Attained := attained;
            attendedTraining.Insert(true);
            status := 'success';

        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addProfessionalBody(appNo: Text[30]; jobId: Text[30]; empNo: Text[30]; pBody: Text[100]; mNo: Text[100]; mType: Text[50]; rDate: Date) status: Text
    begin

        if JobApplicants.Get(appNo) then begin
            membershipbody.Init;
            membershipbody."Application No" := appNo;
            membershipbody."Employee No" := empNo;
            membershipbody."Job ID" := jobId;
            membershipbody.Institution := pBody;
            membershipbody."Membership Type" := mType;
            membershipbody."Membership No" := mNo;
            membershipbody."Renewal Date" := rDate;

            membershipbody.Insert(true);

            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addApplicantAccomplishment(appNo: Text[30]; empNo: Text[30]; description: Text[500]; number: Integer; jobId: Text[30]; amt: Text[50]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin
            applicantAccomplishment.Reset;
            applicantAccomplishment.SetRange("Job Application No", appNo);
            applicantAccomplishment.SetRange("Indicator Description", description);
            if applicantAccomplishment.FindSet then begin
                applicantAccomplishment.Number := number;
                applicantAccomplishment.Amount := amt;
                applicantAccomplishment.Modify(true);
                status := 'success*Accomplishment updated successfully';

            end
            else begin

                applicantAccomplishment.Init;
                applicantAccomplishment."Job Application No" := appNo;
                applicantAccomplishment."Employee No" := empNo;
                applicantAccomplishment."Job ID" := jobId;
                applicantAccomplishment.Number := number;
                applicantAccomplishment."Id Number" := JobApplicants."ID Number";
                applicantAccomplishment."Indicator Description" := description;
                applicantAccomplishment.Amount := amt;

                applicantAccomplishment.Insert(true);
                status := 'success';
            end
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addAbilityDetails(description: Text[300]; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants."Abilites,Skills" := description;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure createReferee(appNo: Text[30]; empNo: Text[30]; name: Text[100]; occupation: Text[50]; address: Text[50]; postCode: Text[50]; phone: Text[30]; email: Text[40]; knownPeriod: Text[50]; jobId: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin
            referee.Init;
            referee."Job Application No" := appNo;
            referee."Employee No" := empNo;
            referee.Names := name;
            referee.Occupation := occupation;
            referee.Address := address;
            referee."Post Code" := postCode;
            referee."Telephone No" := phone;
            referee."E-Mail" := email;
            referee."Period Known" := knownPeriod;
            referee."Job ID" := jobId;
            referee.Insert(true);
            status := 'success';

        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addCurrentDutiesSkills(abilities: Text[250]; currentDuties: Text[300]; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants."Current Duties" := currentDuties;
            JobApplicants."Abilites,Skills" := abilities;

            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addOtherPersonalDetails(appNo: Text[30]; convicted: Boolean; convictionDesc: Text[30]; dismissal: Boolean; dismissalDesc: Text[100]; highestLevel: Text[100]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants.Convicted := convicted;
            JobApplicants."Conviction Description" := convictionDesc;
            JobApplicants.Dismissal := dismissal;
            JobApplicants."Dismissal Description" := dismissalDesc;
            JobApplicants."Highest Education Level" := highestLevel;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';
        end
    end;

    procedure addDutiesDetails(description: Text[300]; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants."Current Duties" := description;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure deleteAcademicLine(id: Integer; appNo: Text[30]) status: Text
    begin
        applicantQualifications.Reset;
        applicantQualifications.SetRange(Code, id);
        applicantQualifications.SetRange("Application No", appNo);
        if (applicantQualifications.FindSet) then begin
            applicantQualifications.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProfessionalLine(id: Integer; appNo: Text[30]) status: Text
    begin
        professionalQualifications.Reset;
        professionalQualifications.SetRange(Code, id);
        professionalQualifications.SetRange("Application No", appNo);
        if (professionalQualifications.FindSet) then begin
            professionalQualifications.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteTrainingLine(id: Integer; appNo: Text[30]) status: Text
    begin
        attendedTraining.Reset;
        attendedTraining.SetRange(Code, id);
        attendedTraining.SetRange("Application No", appNo);
        if (attendedTraining.FindSet) then begin
            attendedTraining.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProffessionalBodyLine(id: Integer; appNo: Text[30]) status: Text
    begin
        membershipbody.Reset;
        membershipbody.SetRange(Code, id);
        membershipbody.SetRange("Application No", appNo);
        if (membershipbody.FindSet) then begin
            membershipbody.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteEmploymentHistoryLine(id: Integer; appNo: Text[30]) status: Text
    begin
        /*ApplicantEmploymentHistory.RESET;
        ApplicantEmploymentHistory.SETRANGE(Code,id);
        ApplicantEmploymentHistory.SETRANGE("Entry No.",appNo);
        IF(ApplicantEmploymentHistory.FINDSET) THEN BEGIN
          ApplicantEmploymentHistory.DELETE(TRUE);
          status:='success*Record Successfully deleted';

          END
          ELSE BEGIN
            status:='error*The record does not exist';
            END
            */

    end;

    procedure deleteRefereeLine(id: Integer; appNo: Text[30]) status: Text
    begin

        referee.Reset;
        referee.SetRange(Code, id);
        referee.SetRange("Job Application No", appNo);
        if (referee.FindSet) then begin
            referee.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure addDeclaration(declaration: Boolean; appNo: Text[30]) status: Text
    begin
        if JobApplicants.Get(appNo) then begin

            JobApplicants.Declaralation := declaration;
            JobApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure createProfileForExternalApplicants(surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; email: Text[100]; religion: Text[50]; idNumber: Text[100]; phoneNo: Text[30]; ethinc: Text[30]; postalAddress: Text[50]; postalAddressCode: Text[50]; city: Text[50]; "expected salary": Decimal; registrationDetails: Text[250]; NhifNo: Text[30]; NssfNo: Text[30]; pinNo: Text[30]; altPhoneNo: Text[30]; altEmail: Text[50]; positionHeld: Text[50]; currentEmployer: Text[100]; GrossSalary: Decimal; effectiveDate: Date) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);

        if externalApplicants.FindSet then begin
            case gender of
                0:
                    gender := Gender::Male;
                1:
                    gender := Gender::Female;
                2:
                    gender := Gender::Both;

                else
            end;

            case disabled of
                0:
                    disabled := Disabled::Yes;
                1:
                    disabled := Disabled::No;
                else
            end;

            case maritalStatus of
                0:
                    maritalStatus := Maritalstatus::Married;

                1:
                    maritalStatus := Maritalstatus::Single;
                2:
                    maritalStatus := Maritalstatus::Divorced;

                3:
                    maritalStatus := Maritalstatus::Separated;
                4:
                    maritalStatus := Maritalstatus::"Widow(er)";
                5:
                    maritalStatus := Maritalstatus::Other;

                else
            end;

            externalApplicants.FirstName := firstname;
            externalApplicants."Middle Name" := lastname;
            externalApplicants.LastName := surname;
            externalApplicants.Initials := title;
            externalApplicants."Date Applied" := Today();
            externalApplicants."Date Of Birth" := DOB;
            externalApplicants.Gender := gender;
            externalApplicants.Disabled := disabled;
            externalApplicants."Disability Details" := disabilityDetails;
            externalApplicants.County := county;
            externalApplicants.Citizenship := nationality;
            externalApplicants."Marital Status" := maritalStatus;
            externalApplicants.Religion := religion;
            externalApplicants."ID Number" := idNumber;
            externalApplicants."Ethnic Origin" := ethinc;
            externalApplicants."Cell Phone Number" := phoneNo;
            externalApplicants."Details of Disability regist" := registrationDetails;
            externalApplicants."Postal Address" := postalAddress;
            externalApplicants."Post Code" := postalAddressCode;
            externalApplicants.City := city;
            externalApplicants."Expected Salary" := "expected salary";
            externalApplicants.NHIF := NhifNo;
            externalApplicants.NSSF := NssfNo;
            externalApplicants."PIN Number" := pinNo;
            externalApplicants."Altenative Phone Number" := altPhoneNo;
            externalApplicants."Alternative Email" := altEmail;
            externalApplicants."Current Employer" := currentEmployer;
            externalApplicants."Gross Salary" := GrossSalary;
            externalApplicants."Position held" := positionHeld;
            externalApplicants."Effective Date" := effectiveDate;

            if externalApplicants.Modify(true) then begin
                status := 'success';
            end
            else begin
                status := 'error*It seems you have not applied for this position. Please try another position';
            end

        end
    end;

    procedure CreateAccountForExtenalApplicants(fname: Text[100]; lname: Text[100]; email: Text[100]; password: Text[100]; salt: Text[100]) status: Text
    begin
        externalApplicants.Init;
        externalApplicants.FirstName := fname;
        externalApplicants.LastName := lname;
        externalApplicants.Email := email;
        externalApplicants.Password := password;
        externalApplicants.Salt := salt;
        externalApplicants.Insert(true);
        status := 'success';
    end;

    procedure forgotPasswordtForExtenalApplicants(email: Text[100]; password: Text[100]; salt: Text[100]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            externalApplicants.Password := password;
            externalApplicants.Salt := salt;
            externalApplicants.Modify(true);
            status := 'success';
        end
        else begin
            status := 'error';

        end
    end;

    procedure createIctRequest(empNo: Text; description: Text[2048]; region: Code[50]; tdepatrment: Code[100]; tcategory: Code[100]) status: Text
    var
        Body: Text[250];
        SMTP: Codeunit Mail;
        Email2: Text[250];
        CInfo: Record "Company Information";
        Category1: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
        SetUp: Record "ICT Helpdesk Global Parameters";
        Email: Text[250];
        empName: Text[250];
        ictMapping: Record "ICT Officers Category Mapping";
    begin
        Employee.Reset;
        Employee.SetRange("No.", empNo);
        if Employee.FindSet then begin

            helpdesk.Init;
            helpdesk."Job No." := '';
            helpdesk."Employee No" := empNo;
            helpdesk.Validate("Employee No");
            helpdesk."Requesting Officer" := UserId;
            helpdesk."Description of the issue" := description;
            helpdesk."Issue Category Department" := tdepatrment;
            UserSetup."Portal User" := true;
            // helpdesk.Validate("Issue Category Department");
            helpdesk."ICT Issue Category" := tcategory;

            helpdesk."Request Date" := Today();

            helpdesk."Request Time" := Time;

            helpdesk."Global Dimension 1 Code" := region;
            // helpdesk.Validate("Global Dimension 1 Code");
            helpdesk.Status := helpdesk.Status::Assigned;
            // Ass
            ictMapping.Reset();
            ictMapping.SetRange("Help Desk Category", tcategory);
            if ictMapping.Findset(true) then begin
                helpdesk."Assigned to" := ictMapping.UserName;
            end;
            if helpdesk.Insert(true) then begin
                // helpdesk.Validate("Employee No");
                // helpdesk.Validate("Global Dimension 1 Code");
                // MESSAGE(FORMAT( helpdesk));
                // hdesk.SetRange("Employee No", empNo);
                // if hdesk.FindLast then begin
                //     CInfo.Get;


                //     SetUp.Get();
                //     Email2 := CInfo."Administrator Email";
                //     Email := SetUp."ICT Email";
                //     Body := '<br>Kindly login to the ERP System and attend to the ICT Issue No. ' + hdesk."Job No." + ' from ' + Employee."First Name" + ' ' + Employee."Last Name" + '.' + '</br>';
                //     Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                //     Body := Body + ' ' + 'ERP AUTOMATIC MAILS';

                //     SMTP.CreateMessage(Email, '', '', 'ICT Heldesk Notification', Body, true, true);

                //     //  SMTP.Send();
                //     Message('ICT Issue notification sent successfully.');
                //     Employee.Reset;
                //     Employee.SetRange("No.", empNo);
                //     if Employee.Find('-') then begin
                //         Email := Employee."E-Mail";
                //         empName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";

                //         Email2 := CInfo."Administrator Email";
                //         Body := '<br>Your issue has been received by ICT department Issue No. ' + hdesk."Job No." + ' from ' + empName + '.' + '</br>';
                //         Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                //         Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                //         SMTP.CreateMessage(Email, '', '', 'ICT Heldesk Notification', Body, true, true);
                //         Message(Email);
                //         //SMTP.Send();
                //         Message('ICT Issue notification sent successfully.');

                //         status := 'success*Your request sent successfully*' + helpdesk."Job No.";
                //     end


                // end
                status := 'success*Your request sent successfully*' + helpdesk."Job No.";

            end
        end

        else begin
            status := 'error*Employee does not exist';
        end
    end;

    procedure ProvideIctfeedback(appNo: Text; description: Text[250]) status: Text
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", appNo);
        if helpdesk.FindSet then begin
            helpdesk."Requester Feedback" := description;
            helpdesk.Status := helpdesk.Status::Closed;
            if helpdesk.Modify(true) then begin
                status := 'success*Request successfully updated';
            end


        end

        else begin
            status := 'error*Job No does not exist';
        end
    end;

    procedure updateIctRequest(appNo: Text; description: Text[2048]) status: Text
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", appNo);
        if helpdesk.FindSet then begin
            helpdesk."Description of the issue" := description;
            helpdesk."Request Date" := Today();
            helpdesk."Request Time" := Time;
            if helpdesk.Modify(true) then begin
                status := 'success*Request successfully updated';
            end


        end

        else begin
            status := 'error*Job No does not exist';
        end
    end;

    procedure applyexternalJob(jobId: Text[20]; surname: Text[100]; firstname: Text[100]; lastname: Text[100]; title: Text[100]; DOB: Date; gender: Option " ",Female,Male,Both; disabled: Option No,Yes; disabilityDetails: Text[250]; county: Text[100]; nationality: Text[100]; maritalStatus: Option ,Single,Married,Separated,Divorced,"Widow(er)",Other; religion: Text[50]; idNumber: Text[50]; phoneNo: Text[30]; email: Text[50]; ethinc: Text[30]; postalAddress: Text[50]; postalAddressCode: Text[50]; city: Text[50]; "expected salary": Decimal; registrationDetails: Text[250]) status: Text
    begin
        JobApplicants.Reset;
        JobApplicants.SetRange("Job Applied For", jobId);
        JobApplicants.SetRange("ID Number", idNumber);
        JobApplicants.SetRange("Application Status", JobApplicants."application status"::Submitted);

        if JobApplicants.FindSet then begin
            status := 'error*You seem to have applied for this position.Please try again';

        end
        else begin
            externalApplicants.Reset;
            externalApplicants.SetRange(Email, email);
            if externalApplicants.FindSet then begin
            end else begin

                JobApplicants.Init;
                JobApplicants."Application No" := '';
                JobApplicants."Job Applied For" := jobId;

                JobApplicants."First Name" := externalApplicants.FirstName;
                JobApplicants."Middle Name" := lastname;
                JobApplicants."Last Name" := surname;
                JobApplicants.Initials := title;
                JobApplicants."Date Applied" := Today();
                JobApplicants."Date Of Birth" := DOB;
                JobApplicants.Gender := gender;
                JobApplicants.Disabled := disabled;
                JobApplicants."Disability Details" := disabilityDetails;
                JobApplicants.County := county;
                JobApplicants.Citizenship := nationality;
                JobApplicants."Marital Status" := maritalStatus;
                JobApplicants.Religion := religion;
                JobApplicants."ID Number" := idNumber;
                JobApplicants."Ethnic Origin" := ethinc;
                JobApplicants."E-Mail" := email;
                JobApplicants."Cell Phone Number" := phoneNo;
                JobApplicants."Details of Disability regist" := registrationDetails;

                JobApplicants."Postal Address" := postalAddress;
                JobApplicants."Post Code" := postalAddressCode;
                JobApplicants.City := city;
                JobApplicants."Expected Salary" := "expected salary";

                if JobApplicants.Insert(true) then begin
                    jpa.Reset;
                    jpa.SetRange("ID Number", idNumber);
                    jpa.SetRange("Job Applied For", jobId);
                    if jpa.FindLast then begin
                        status := jpa."Application No";
                    end

                end
                else begin
                    status := 'error*an error occured during the process of insertion';
                end;



            end




        end;
    end;

    procedure getItemsByLocation(location: Text[100]; category: Text[100]) status: Text
    var
        Loc: Text[100];
    begin
        status := '';
        item.Reset;
        item.SetFilter("Item Category Code", category);
        item.SetFilter("Location Filter", location);
        if item.FindSet then begin
            repeat
                item.CalcFields("Location Code", Inventory);
                status += item."No." + '*';
            until item.Next = 0;
        end
    end;

    procedure getItemDescByLocation(location: Text[100]; category: Text[100]) status: Text
    var
        Loc: Text[100];
    begin
        status := '';
        item.Reset;
        item.SetFilter("Item Category Code", category);
        item.SetFilter("Location Filter", location);
        //item.SETFILTER(Inventory,'>%1',0);
        item.SetRange(Blocked, false);

        if item.FindSet then begin
            repeat
                item.CalcFields("Location Code", Inventory);
                status += item."No." + '_' + item.Description + '*';
            until item.Next = 0;
        end
    end;

    procedure AssignHelpdeskRequest(jobNo: Text[100]; assignee: Text[100]) status: Text
    var
        ObjNotify: Codeunit "Insurance Notifications";
        SMTP: Codeunit Mail;
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            UserSetup.Reset;
            UserSetup.SetRange("User ID", assignee);
            if UserSetup.FindSet then begin
                helpdesk."Assigned To" := assignee;
                helpdesk.Validate("Assigned To");
                helpdesk."Assigned Date" := Today();
                helpdesk."Assigned Time" := Time;
                helpdesk.Status := helpdesk.Status::Assigned;
                helpdesk."Assigned To EmpNo" := UserSetup."Employee No.";


                if helpdesk.Modify(true) then begin
                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if Employee.Get(helpdesk."Employee No") then
                        Recipient := Employee."E-Mail";
                    Subject := 'ISSUE ASSIGNED' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been assigned to ' + '  ' + assignee;
                    SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                    //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(helpdesk."Assigned To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ASSIGNED' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been assigned to you';
                    SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);
                    //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);



                    status := 'success*Request assigned successfully';
                end


            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end
    end;

    procedure EscalatedHelpdeskRequest(jobNo: Text[100]; assignee: Text[100]; description: Text[300]) status: Text
    var
        ObjNotify: Codeunit "Insurance Notifications";
        SMTP: Codeunit Mail;
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            UserSetup.Reset;
            UserSetup.SetRange("User ID", assignee);

            if UserSetup.FindSet then begin
                helpdesk."Escalated To" := assignee;
                helpdesk."Escalated Date" := Today();
                helpdesk."Escalated Time" := Time;
                helpdesk.Status := helpdesk.Status::Escalated;
                helpdesk."Escalated By" := helpdesk."Assigned To";
                helpdesk."Ascalation Details" := description;
                helpdesk."Escalated To EmpNo" := UserSetup."Employee No.";
                if helpdesk.Modify(true) then begin
                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if Employee.Get(helpdesk."Employee No") then
                        Recipient := Employee."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + helpdesk."Escalated To";
                    SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                    //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(helpdesk."Escalated To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo;
                    Body := 'Please note that the issue on the subject above has been escalatd to you by' + ' ' + helpdesk."Assigned To";
                    SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                    //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                    status := 'success*Request assigned successfully';


                end




            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end
    end;

    procedure ResolveHelpdeskRequest(jobNo: Text[100]; description: Text[300]) status: Text
    var
        ObjNotify: Codeunit "Insurance Notifications";
        SMTP: Codeunit Mail;
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            helpdesk."Action Taken" := description;
            helpdesk."Attended By" := helpdesk."Assigned To";
            helpdesk."Attended Date" := Today;
            helpdesk.Status := helpdesk.Status::Resolved;
            if helpdesk.Modify(true) then begin
                ObjComInfo.Get;
                SenderEmailAddress := ObjComInfo."Administrator Email";
                SenderName := COMPANYNAME;
                if Employee.Get(helpdesk."Employee No") then
                    Recipient := Employee."E-Mail";
                Subject := 'ISSUE CLOSURE' + ' ' + jobNo;
                Body := 'Please note that the issue on the subject above has been resolved by' + '  ' + helpdesk."Attended By"
                 + ' ' + 'Kindly login to the system and confirm.Request will be closed after 24 hours.';
                SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                //  ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                status := 'success*Request has been resolved successfully ';
            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end
    end;

    procedure ReopenHelpdeskRequest(jobNo: Text[50]; description: Text[250]) status: Text
    begin
        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            helpdesk.Status := helpdesk.Status::Pending;
            helpdesk.Reopened := true;
            //helpdesk."Reopened By":=helpdesk.;
            helpdesk."Assigned To" := '';
            helpdesk."Attended By" := '';
            helpdesk."Assigned Date" := 0D;
            helpdesk."Assigned Time" := 0T;
            helpdesk."Attended by Name" := '';
            helpdesk."Attended Date" := 0D;
            helpdesk."Attended Time" := 0T;
            helpdesk.Modify;

            status := 'success*Request successfully reopened';
        end
        else begin
            status := 'error*job no does not exist';
        end
    end;

    procedure addEmploymentHistoryForExternalApplcants(startDate: Date; endDate: Date; company: Text[150]; designation: Text[150]; JobGrade: Text[100]; email: Text[50]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground.Institution := company;
            applicantBackground."From Date" := startDate;
            applicantBackground."To Date" := endDate;
            applicantBackground."Job Title" := designation;
            applicantBackground.Grade := JobGrade;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::Employment;

            applicantBackground.Insert(true);

            status := 'success';

        end
        else
            status := 'error*You seem to have not applied for this position';
        begin
        end
    end;

    procedure addAcademicQualificationsForExternalApplcants(email: Text; institution: Text[200]; awardAttainment: Text[150]; specialization: Text[150]; gradeAttained: Text[150]; FromDate: Date; ToDate: Date) status: Text
    begin

        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground.Institution := institution;
            applicantBackground."From Date" := FromDate;
            applicantBackground."To Date" := ToDate;
            applicantBackground.Attainment := awardAttainment;
            applicantBackground.Specialization := specialization;
            applicantBackground.Grade := gradeAttained;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::Education;
            applicantBackground.Insert(true);

            status := 'success';


        end
        else begin
            status := 'error*That email does not exist';

        end
    end;

    procedure addProffessionalQualificationsForExternalApplcants(email: Text[100]; institution: Text[150]; awardAttainment: Text[100]; specialization: Text[100]; gradeAttained: Text[100]; FromDate: Date; ToDate: Date) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground.Institution := institution;
            applicantBackground."From Date" := FromDate;
            applicantBackground."To Date" := ToDate;
            applicantBackground.Attainment := awardAttainment;
            applicantBackground.Specialization := specialization;
            applicantBackground.Grade := gradeAttained;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::"Professional Qualification";
            applicantBackground.Insert(true);

            status := 'success';
        end
        else begin
            status := 'You seem to have applied for this position';

        end
    end;

    procedure addTrainingAttendedForExternalApplcants(fromDate: Date; ToDate: Date; Institution: Text[150]; courseName: Text[150]; email: Text[50]; attained: Text[100]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground."From Date" := fromDate;
            applicantBackground."To Date" := ToDate;
            applicantBackground.Institution := Institution;
            applicantBackground."Course Name" := courseName;
            applicantBackground.Attainment := attained;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::Training;
            applicantBackground.Insert(true);
            status := 'success';


        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure addProfessionalBodyForExternalApplcants(email: Text[50]; pBody: Text[100]; mNo: Text[100]; mType: Text[50]; rDate: Date) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, email);
        if externalApplicants.FindSet then begin
            applicantBackground.Init;
            applicantBackground."Application No" := '';
            applicantBackground."From Date" := 0D;
            applicantBackground.Institution := pBody;
            applicantBackground."Membership Type" := mType;
            applicantBackground."Membership No" := mNo;
            applicantBackground."Date of renewal" := rDate;
            applicantBackground.Email := email;
            applicantBackground.Type := applicantBackground.Type::"Professional Body";
            applicantBackground.Insert(true);

            status := 'success';
        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure createRefereeForExternalApplcants(email: Text[50]; name: Text[100]; occupation: Text[50]; address: Text[50]; postCode: Text[50]; phone: Text[30]; applicantEmail: Text[100]; knownPeriod: Text[50]) status: Text
    begin
        externalApplicants.Reset;
        externalApplicants.SetRange(Email, applicantEmail);
        if externalApplicants.FindSet then begin
            applicantReferee.Init;
            applicantReferee.Names := name;
            applicantReferee.Occupation := occupation;
            applicantReferee.Address := address;
            applicantReferee."Post Code" := postCode;
            applicantReferee."Telephone No" := phone;
            applicantReferee.RefereeEmail := email;
            applicantReferee."Period Known" := knownPeriod;
            applicantReferee."E-Mail" := applicantEmail;
            applicantReferee.Insert(true);
            status := 'success';

        end
        else begin
            status := 'error*That application does not exist';

        end
    end;

    procedure deleteAcademicLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProfessionalLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteTrainingLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteProffessionalBodyLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteEmploymentHistoryLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin
        applicantBackground.Reset;
        applicantBackground.SetRange("No.", id);
        applicantBackground.SetRange(Email, email);
        if (applicantBackground.FindSet) then begin
            applicantBackground.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure deleteRefereeLineForExternalApplicants(id: Integer; email: Text[100]) status: Text
    begin

        applicantReferee.Reset;
        applicantReferee.SetRange(Code, id);
        applicantReferee.SetRange("E-Mail", email);
        if (applicantReferee.FindSet) then begin
            applicantReferee.Delete(true);
            status := 'success*Record Successfully deleted';

        end
        else begin
            status := 'error*The record does not exist';
        end
    end;

    procedure applyOnline(email: Text[100]; jobId: Text[30]) status: Text
    begin
        jobApplication.Reset;
        jobApplication.SetRange(jobApplication.Email, email);
        jobApplication.SetRange(jobApplication."Job Id", jobId);
        jobApplication.SetRange(jobApplication."Application Status", jobApplication."application status"::Submitted);
        if jobApplication.FindSet then begin
            status := 'error*You seem to have applied for this position.Please try another position.';
        end
        else begin
            externalApplicants.Reset;
            externalApplicants.SetRange(Email, email);
            if externalApplicants.FindSet then begin
                jobApplication.Init;
                jobApplication."Application No" := '';
                jobApplication."First Name" := externalApplicants.FirstName;
                jobApplication."Middle Name" := externalApplicants."Middle Name";
                jobApplication.Surname := externalApplicants.LastName;
                jobApplication.Gender := externalApplicants.Gender;
                jobApplication."Marital Status" := externalApplicants."Marital Status";
                jobApplication."Date of Birth" := externalApplicants."Date Of Birth";
                jobApplication."Job Id" := jobId;
                jobApplication."Ethnic Origin" := externalApplicants."Ethnic Origin";
                jobApplication."ID/Passport" := externalApplicants."ID Number";
                jobApplication."Home Phone No." := externalApplicants."Cell Phone Number";
                jobApplication."Postal Address" := externalApplicants."Postal Address";
                jobApplication."Postal Code." := externalApplicants."Post Code";
                jobApplication.County := externalApplicants.County;
                jobApplication."Application Date" := Today;
                jobApplication.Email := email;

                if jobApplication.Insert(true) then begin
                    jobApp.Reset;
                    jobApp.SetRange(Email, email);
                    jobApp.SetRange("Job Id", jobId);
                    jobApp.SetRange("Application Status", jobApp."application status"::Submitted);
                    if jobApp.FindLast then begin
                        status := jobApp."Application No";

                    end




                end
                else begin
                    status := 'error*An unknown errror occured';
                end
                //jobApplication.Salutation:= externalApplicants.Initials;

            end



        end
    end;

    procedure addFavouriteJobs(email: Text[100]; jobId: Text[30]; jobDesc: Text[100]) Status: Text
    begin
        favouriteJob.Reset;
        favouriteJob.SetRange(Email, email);
        favouriteJob.SetRange("Job Id", jobId);
        if favouriteJob.FindSet then begin
            Status := 'error*This job seem to be in your favourite list.Please try another job.';
        end
        else begin
            favouriteJob.Init;
            favouriteJob.Email := email;
            favouriteJob."Job Description" := jobDesc;
            favouriteJob."Job Id" := jobId;
            favouriteJob.Insert(true);
            Status := 'success*Job successfully saved.';

        end
    end;

    procedure deleteFavouriteJobs(id: Integer; JobId: Text[100]) status: Text
    begin
        favouriteJob.Reset;
        favouriteJob.SetRange(Id, id);
        favouriteJob.SetRange("Job Id", JobId);
        if favouriteJob.FindSet then begin
            favouriteJob.Delete(true);
            status := 'success*Job successfully deleted.';
        end
        else begin
            status := 'error';
        end
    end;

    procedure addImprestSharepointLinks(imprestno: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        imprest: Record "Imprest Memo";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            ImprestMemo.Reset;
            ImprestMemo."No." := imprestno;
            if ImprestMemo.Find('=') then
                RecordIDNumber := ImprestMemo.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure addStoreRequsitionSharepointLinks(storerequsitionnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        PurchaseHeader: Record "Purchase Header";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            PurchaseHeader.Reset;
            //PurchaseHeader."No.":=storerequsitionnumber;
            PurchaseHeader.SetRange("No.", storerequsitionnumber);
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
            if PurchaseHeader.FindSet then
                RecordLink."Record ID" := PurchaseHeader.RecordId;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure addStaffClaimSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            staffclaim.Reset;
            staffclaim."No." := staffclaimnumber;
            if staffclaim.Find('=') then
                RecordIDNumber := staffclaim.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure addLeaveSharepointLinks(leaveno: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        leaveapplication: Record "HR Leave Applications";
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            leaveapplication.Reset;
            leaveapplication."Application Code" := leaveno;
            if leaveapplication.Find('=') then
                RecordIDNumber := leaveapplication.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end
        end;
    end;

    procedure addImprestSurrenderSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            Payments.Reset;
            Payments."No." := staffclaimnumber;
            if Payments.Find('=') then
                RecordIDNumber := Payments.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure addPurchaseRequisitionSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            PurchaseHeader.Reset;
            //PurchaseHeader."No.":=staffclaimnumber;
            PurchaseHeader.SetRange("No.", staffclaimnumber);
            PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            if PurchaseHeader.FindSet then
                RecordIDNumber := PurchaseHeader.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure addFleetRequisitionSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
        TransportRequisition: Record "Transport Requisition";
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            TransportRequisition.Reset;
            TransportRequisition."Transport Requisition No" := staffclaimnumber;
            if TransportRequisition.Find('=') then
                RecordIDNumber := TransportRequisition.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure addTrainingRequisitionSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
        TransportRequisition: Record "Transport Requisition";
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            TrainingRequisition.Reset;
            TrainingRequisition.Code := staffclaimnumber;
            if TrainingRequisition.Find('=') then
                RecordIDNumber := TrainingRequisition.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure addPettyCashSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            Payments.Reset;
            Payments."No." := staffclaimnumber;
            if Payments.Find('=') then
                RecordIDNumber := Payments.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure addPettyCashSurrenderSharepointLinks(staffclaimnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
    var
        staffclaim: Record payments;
        RecordLink: Record "Record Link";
        RecordIDNumber: RecordID;
    begin
        // Create Document Link to Sharepoint **********Obadiah Korir****************
        RecordLink.Reset;
        if RecordLink."Link ID" = 0 then begin
            RecordLink.URL1 := sharepointlink;
            RecordLink.Description := filename;
            RecordLink.Type := RecordLink.Type::Link;
            RecordLink.Company := COMPANYNAME;
            RecordLink."User ID" := UserId;
            RecordLink.Created := CreateDatetime(Today, Time);
            Payments.Reset;
            Payments."No." := staffclaimnumber;
            //Payments."Payment Type"::"Petty Cash Surrender";
            if Payments.Find('=') then
                RecordIDNumber := Payments.RecordId;
            RecordLink."Record ID" := RecordIDNumber;
            if RecordLink.Insert(true) then begin
                status := 'success*Link successfully created';
            end else begin
                status := 'error*An error occured during the process of creating link';
            end;
        end;
    end;

    procedure FnCreateStaffClaimApprovalRequests(employeeno: Code[10]; staffClaimNo: Code[10]) status: Text
    var
        Employee: Record Employee;
        Payments: Record payments;
        PortalApprovalEntry: Record "PortalApproval Entry";
    begin

        Employee.Reset;
        Employee.SetRange("No.", employeeno);
        if Employee.FindSet then begin
            varTableNumber := 57000;
            if Employee."Direct Supervisor" = '' then begin
                status := 'danger*Direct Approver is Missing, Kindly Contact HR';
            end else begin
                PortalApprovalEntry.Reset;
                PortalApprovalEntry.SetRange("Document No.", staffClaimNo);
                if PortalApprovalEntry.FindSet then begin
                    PortalApprovalEntry."Document No." := staffClaimNo;
                    PortalApprovalEntry."Document Type" := PortalApprovalEntry."document type"::"staff Claims";
                    PortalApprovalEntry."Table ID" := varTableNumber;
                    PortalApprovalEntry."Date-Time Sent for Approval" := CurrentDatetime;
                    PortalApprovalEntry."Employee Number" := employeeno;
                    PortalApprovalEntry.Validate("Employee Number");
                    PortalApprovalEntry."Approver ID" := Employee."Direct Supervisor";
                    PortalApprovalEntry."Sender ID" := employeeno;
                    PortalApprovalEntry."Approval Code" := staffClaimNo;
                    PortalApprovalEntry.Status := PortalApprovalEntry.Status::Open;
                    if PortalApprovalEntry.Modify(true) then begin
                        status := 'success*The Approval Request was successfully Modified';
                    end;
                end else begin
                    PortalApprovalEntry.Init;
                    PortalApprovalEntry."Document No." := staffClaimNo;
                    PortalApprovalEntry."Document Type" := PortalApprovalEntry."document type"::"staff Claims";
                    PortalApprovalEntry."Table ID" := varTableNumber;
                    PortalApprovalEntry."Date-Time Sent for Approval" := CurrentDatetime;
                    PortalApprovalEntry."Last Date-Time Modified" := CurrentDatetime;
                    PortalApprovalEntry."Employee Number" := employeeno;
                    PortalApprovalEntry.Validate("Employee Number");
                    PortalApprovalEntry."Approver ID" := Employee."Direct Supervisor";
                    PortalApprovalEntry."Sender ID" := employeeno;
                    PortalApprovalEntry."Approval Code" := staffClaimNo;
                    PortalApprovalEntry.Status := PortalApprovalEntry.Status::Open;
                    if PortalApprovalEntry.Insert(true) then begin
                        status := 'success*The Approval Request was successfully Created';
                    end else begin
                        status := 'danger*The Staff Claim Number does not exist';
                    end;
                end;
            end;
        end;
    end;

    procedure SuggestLinesFromWorksRequisitionTemplate(docNo: Text[30]; templateId: Text[30]) status: Text
    var
        PurchLines: Record "Purchase Line";
        RequisitionTempLine: Record "BoQ Template Line1";
        RequisitionTempheader: Record "Purchase Requisition Template";
        LineNo: Integer;
    begin

        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("No.", docNo);
        if PurchaseHeader.FindSet then begin
            if PurchaseHeader."PRN Type" <> PurchaseHeader."prn type"::"Project Works" then
                Error('Purchase Requisition Must be Project Works');

            PurchLines.Reset;
            PurchLines.SetRange("Document No.", docNo);
            PurchLines.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            if PurchLines.FindSet then
                PurchLines.DeleteAll;

            //Transfer the Requisition Template Lines to PRN Lines
            RequisitionTempLine.Reset;
            RequisitionTempLine.SetRange("BoQ Template ID", templateId);
            if RequisitionTempLine.FindSet then begin
                repeat
                    PurchLines.Init;
                    PurchLines."Document Type" := PurchaseHeader."Document Type";
                    PurchLines."Document No." := PurchaseHeader."No.";
                    PurchLines."Line No." := PurchLines.Count + 1;
                    PurchLines.Type := RequisitionTempLine.Type;
                    PurchLines."No." := RequisitionTempLine."No.";
                    PurchLines.Description := RequisitionTempLine.Description;
                    PurchLines.Quantity := RequisitionTempLine.Quantity;
                    PurchLines."Unit of Measure Code" := RequisitionTempLine."Unit of Measure Code";
                    //PurchLines.Amount:=RequisitionTempLine."Amount Excl. VAT";
                    PurchLines."Direct Unit Cost" := RequisitionTempLine."Amount Excl. VAT";
                    PurchLines."Shortcut Dimension 1 Code" := RequisitionTempLine."Shortcut Dimension 1 Code";
                    PurchLines."Shortcut Dimension 2 Code" := RequisitionTempLine."Shortcut Dimension 2 Code";
                    PurchLines."Variant Code" := RequisitionTempLine."Variant Code";
                    PurchLines."Dimension Set ID" := RequisitionTempLine."Dimension Set ID";
                    PurchLines."Item Category Code" := RequisitionTempLine."Item Category Code";
                    PurchLines.Insert(true);
                    LineNo := LineNo + 10000;
                until RequisitionTempLine.Next = 0;
                status := 'success*Lines successfully inserted';

            end


        end
    end;

    procedure SuggestPersonnelEquipmentSpecification(docNo: Text[30]; ProjectTemplateId: Text[30]; WorkTemplateId: Text[30]) status: Text
    var
        PurchLines: Record "Purchase Line";
        RequisitionTempLine: Record "BoQ Template Line1";
        RequisitionTempheader: Record "Purchase Requisition Template";
        PRNPersonnelSpecification: Record "PRN Personnel Specification";
        PRNPersonnelqualification: Record "PRN Personnel Qualification";
        PRNPersonnelExperience: Record "PRN Personnel Experience";
        PRNEquipmentsSpecification: Record "PRN Equipment Specification";
        ProjStaffTemplate: Record "Project Staff Template Line";
        ProjStaffExperienceTemplate: Record "Project Staff Template Experie";
        ProjStaffQualificationTemplate: Record "Project Staff Template Qualifi";
        WorksEquipemntSpecification: Record "Works Equipment Template Line";
        Purch: Record "Purchase Header";
    begin
        Purch.Reset;
        Purch.SetRange("No.", docNo);
        if Purch.FindSet then begin
            if Purch."PRN Type" <> Purch."prn type"::"Project Works" then
                Error('Purchase Requisition Must be Project Works');

            PRNPersonnelSpecification.Reset;
            PRNPersonnelSpecification.SetRange("Document No.", docNo);
            PRNPersonnelSpecification.SetRange("Document Type", PRNPersonnelSpecification."document type"::"Purchase Requisition");
            if PRNPersonnelSpecification.FindSet then
                PRNPersonnelSpecification.DeleteAll;

            //Transfer the Requisition Template Lines to PRN Lines
            ProjStaffTemplate.Reset;
            ProjStaffTemplate.SetRange("Key Staff Template ID", ProjectTemplateId);
            if ProjStaffTemplate.FindSet then begin
                // PRNPersonnelSpecification.
                repeat
                    //Creation of PRN Personnel Specification details
                    PRNPersonnelSpecification.Init;
                    PRNPersonnelSpecification."Document Type" := Purch."Document Type";
                    PRNPersonnelSpecification."Document No." := Purch."No.";
                    PRNPersonnelSpecification."Staff Role Code" := ProjStaffTemplate."Project Role Code";
                    PRNPersonnelSpecification."Title/Designation Description" := ProjStaffTemplate.Description;
                    PRNPersonnelSpecification."Staff Category" := ProjStaffTemplate."Staff Category";
                    PRNPersonnelSpecification."Min No. of Recomm Staff" := ProjStaffTemplate."Min No. of Recomm Staff";
                    PRNPersonnelSpecification.Insert(true);

                until ProjStaffTemplate.Next = 0;

            end;
            PRNPersonnelExperience.SetRange("Document No.", docNo);
            PRNPersonnelExperience.SetRange("Document Type", PRNPersonnelExperience."document type"::"Purchase Requisition");
            if PRNPersonnelExperience.FindSet then
                PRNPersonnelExperience.DeleteAll;
            //Creation of PRN Personnel Experience details
            ProjStaffExperienceTemplate.Reset;
            ProjStaffExperienceTemplate.SetRange("Key Staff Template ID", ProjectTemplateId);
            if ProjStaffExperienceTemplate.FindSet then begin
                repeat
                    PRNPersonnelExperience.Init;
                    PRNPersonnelExperience."Document Type" := Purch."Document Type";
                    PRNPersonnelExperience."Document No." := Purch."No.";
                    PRNPersonnelExperience."Staff Role Code" := ProjStaffExperienceTemplate."Project Role Code";
                    PRNPersonnelExperience."Experience Category" := ProjStaffExperienceTemplate."Experience Category";
                    PRNPersonnelExperience."Entry No" := ProjStaffExperienceTemplate."Entry No";
                    PRNPersonnelExperience."Minimum Years of Experience" := ProjStaffExperienceTemplate."Minimum Years of Experience";
                    PRNPersonnelExperience."Minimum Experience Req" := ProjStaffExperienceTemplate."Minimum Experience Req";
                    PRNPersonnelExperience.Insert(true);

                until ProjStaffExperienceTemplate.Next = 0;
            end;

            //Creation of PRN Personnel Qualification details

            PRNPersonnelqualification.SetRange("Document No.", docNo);
            PRNPersonnelqualification.SetRange("Document Type", PRNPersonnelqualification."document type"::"Purchase Requisition");
            if PRNPersonnelqualification.FindSet then
                PRNPersonnelqualification.DeleteAll;

            ProjStaffQualificationTemplate.Reset;
            ProjStaffQualificationTemplate.SetRange("Key Staff Template ID", ProjectTemplateId);
            if ProjStaffQualificationTemplate.FindSet then begin
                repeat
                    PRNPersonnelqualification.Init;
                    PRNPersonnelqualification."Document Type" := Purch."Document Type";
                    PRNPersonnelqualification."Document No." := Purch."No.";
                    PRNPersonnelqualification."Staff Role Code" := ProjStaffQualificationTemplate."Project Role Code";
                    PRNPersonnelqualification."Entry No" := ProjStaffQualificationTemplate."Entry No";
                    PRNPersonnelqualification."Qualification Category" := ProjStaffQualificationTemplate."Qualification Category";
                    PRNPersonnelqualification."Minimum Qualification Req" := ProjStaffQualificationTemplate."Minimum Qualification Req";
                    PRNPersonnelqualification.Insert(true);

                until ProjStaffQualificationTemplate.Next = 0;
            end;

            //Creation of PRN Equipment Specifications
            PRNEquipmentsSpecification.SetRange("Document No.", docNo);
            PRNEquipmentsSpecification.SetRange("Document Type", PRNEquipmentsSpecification."document type"::"Purchase Requisition");
            if PRNEquipmentsSpecification.FindSet then
                PRNEquipmentsSpecification.DeleteAll;
            WorksEquipemntSpecification.Reset;
            WorksEquipemntSpecification.SetRange("Equipment Template ID", WorkTemplateId);
            if WorksEquipemntSpecification.FindSet then begin
                repeat
                    PRNEquipmentsSpecification.Init;
                    PRNEquipmentsSpecification."Document Type" := Purch."Document Type";
                    PRNEquipmentsSpecification."Document No." := Purch."No.";
                    PRNEquipmentsSpecification."Equipment Type" := WorksEquipemntSpecification."Equipment Type";
                    PRNEquipmentsSpecification.Category := WorksEquipemntSpecification.Category;
                    PRNEquipmentsSpecification.Description := WorksEquipemntSpecification.Description;
                    PRNEquipmentsSpecification."Minimum Required Qty" := WorksEquipemntSpecification."Minimum Required Qty";
                    PRNEquipmentsSpecification.Insert(true);
                until WorksEquipemntSpecification.Next = 0;

            end;
            status := 'success*Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly' + Purch."No.";

        end
        /*IF Purch."PRN Type"<>Purch."PRN Type"::"Project Works" THEN
          ERROR('Purchase Requisition Must be Project Works');

        //Transfer the Requisition Template Lines to PRN Lines
        ProjStaffTemplate.RESET;
        ProjStaffTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
        IF ProjStaffTemplate.FINDSET THEN BEGIN
          REPEAT
            //Creation of PRN Personnel Specification details
            PRNPersonnelSpecification.INIT;
            PRNPersonnelSpecification."Document Type":=Purch."Document Type";
            PRNPersonnelSpecification."Document No.":=Purch."No.";
            PRNPersonnelSpecification."Staff Role Code":=ProjStaffTemplate."Project Role Code";
            PRNPersonnelSpecification."Title/Designation Description":=ProjStaffTemplate.Description;
            PRNPersonnelSpecification."Staff Category":=ProjStaffTemplate."Staff Category";
            PRNPersonnelSpecification."Min No. of Recomm Staff":=ProjStaffTemplate."Min No. of Recomm Staff";
            PRNPersonnelSpecification.INSERT(TRUE);

           UNTIL ProjStaffTemplate.NEXT=0;

        END;

        //Creation of PRN Personnel Experience details
        ProjStaffExperienceTemplate.RESET;
        ProjStaffExperienceTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
        IF ProjStaffExperienceTemplate.FINDSET THEN BEGIN
          REPEAT
            PRNPersonnelExperience.INIT;
            PRNPersonnelExperience."Document Type":=Purch."Document Type";
            PRNPersonnelExperience."Document No.":=Purch."No.";
            PRNPersonnelExperience."Staff Role Code":=ProjStaffExperienceTemplate."Project Role Code";
            PRNPersonnelExperience."Experience Category":=ProjStaffExperienceTemplate."Experience Category";
            PRNPersonnelExperience."Entry No":=ProjStaffExperienceTemplate."Entry No";
            PRNPersonnelExperience."Minimum Years of Experience":=ProjStaffExperienceTemplate."Minimum Years of Experience";
            PRNPersonnelExperience."Minimum Experience Req":=ProjStaffExperienceTemplate."Minimum Experience Req";
            PRNPersonnelExperience.INSERT(TRUE);

            UNTIL ProjStaffExperienceTemplate.NEXT=0;
          END;

        //Creation of PRN Personnel Qualification details

        ProjStaffQualificationTemplate.RESET;
        ProjStaffQualificationTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
        IF ProjStaffQualificationTemplate.FINDSET THEN BEGIN
          REPEAT
            PRNPersonnelqualification.INIT;
            PRNPersonnelqualification."Document Type":=Purch."Document Type";
            PRNPersonnelqualification."Document No.":=Purch."No.";
            PRNPersonnelqualification."Staff Role Code":=ProjStaffQualificationTemplate."Project Role Code";
            PRNPersonnelqualification."Entry No":=ProjStaffQualificationTemplate."Entry No";
            PRNPersonnelqualification."Qualification Category":=ProjStaffQualificationTemplate."Qualification Category";
            PRNPersonnelqualification."Minimum Qualification Req":=ProjStaffQualificationTemplate."Minimum Qualification Req";
            PRNPersonnelqualification.INSERT(TRUE);

            UNTIL ProjStaffQualificationTemplate.NEXT=0;
          END;

        //Creation of PRN Equipment Specifications
        WorksEquipemntSpecification.RESET;
        WorksEquipemntSpecification.SETRANGE("Equipment Template ID",Purch."Works Equipment Template ID");
        IF WorksEquipemntSpecification.FINDSET THEN BEGIN
          REPEAT
            PRNEquipmentsSpecification.INIT;
            PRNEquipmentsSpecification."Document Type":=Purch."Document Type";
            PRNEquipmentsSpecification."Document No.":=Purch."No.";
            PRNEquipmentsSpecification."Equipment Type":=WorksEquipemntSpecification."Equipment Type";
            PRNEquipmentsSpecification.Category:=WorksEquipemntSpecification.Category;
            PRNEquipmentsSpecification.Description:=WorksEquipemntSpecification.Description;
            PRNEquipmentsSpecification."Minimum Required Qty":=WorksEquipemntSpecification."Minimum Required Qty";
            PRNEquipmentsSpecification.INSERT(TRUE);
            UNTIL WorksEquipemntSpecification.NEXT=0;

          END;
        MESSAGE('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly',Purch."No.");
        */

    end;

    procedure suggestLinesFromRequisitionTemplate(docNo: Text[30]; templateId: Text[30]) status: Text
    var
        PurchLines: Record "Purchase Line";
        RequisitionTempLine: Record "BoQ Template Line1";
        RequisitionTempheader: Record "Purchase Requisition Template";
        LineNo: Integer;
    begin

        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("No.", docNo);
        if PurchaseHeader.FindSet then begin
            if PurchaseHeader."PRN Type" <> PurchaseHeader."prn type"::Standard then
                Error('Purchase Requisition Must be Standard');

            PurchLines.Reset;
            PurchLines.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
            PurchLines.SetRange("Document No.", docNo);

            if PurchLines.FindSet then
                PurchLines.DeleteAll;

            //Transfer the Requisition Template Lines to PRN Lines
            RequisitionTempLine.Reset;
            RequisitionTempLine.SetRange("BoQ Template ID", templateId);
            if RequisitionTempLine.FindSet then begin
                repeat
                    PurchLines.Init;
                    PurchLines."Document Type" := PurchaseHeader."Document Type";
                    PurchLines."Document No." := PurchaseHeader."No.";
                    PurchLines."Line No." := PurchLines.Count + 1;
                    PurchLines.Type := RequisitionTempLine.Type;
                    PurchLines."No." := RequisitionTempLine."No.";
                    PurchLines.Description := RequisitionTempLine.Description;
                    PurchLines.Quantity := RequisitionTempLine.Quantity;
                    PurchLines."Unit of Measure Code" := RequisitionTempLine."Unit of Measure Code";
                    //PurchLines.Amount:=RequisitionTempLine."Amount Excl. VAT";
                    PurchLines."Direct Unit Cost" := RequisitionTempLine."Amount Excl. VAT";
                    PurchLines."Shortcut Dimension 1 Code" := RequisitionTempLine."Shortcut Dimension 1 Code";
                    PurchLines."Shortcut Dimension 2 Code" := RequisitionTempLine."Shortcut Dimension 2 Code";
                    PurchLines."Variant Code" := RequisitionTempLine."Variant Code";
                    PurchLines."Dimension Set ID" := RequisitionTempLine."Dimension Set ID";
                    PurchLines."Item Category Code" := RequisitionTempLine."Item Category Code";
                    PurchLines.Insert(true);
                    LineNo := LineNo + 10000;
                until RequisitionTempLine.Next = 0;
                status := 'success*Lines successfully inserted';

            end


        end
    end;

    procedure updateRequisitionLines(id: Integer; reqNo: Text[30]; amount: Decimal; qty: Decimal) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.Reset;
        PurchaseLine.SetRange("Line No.", id);
        PurchaseLine.SetRange("Document No.", reqNo);
        PurchaseLine.SetRange("Document Type", PurchaseLine."document type"::"Purchase Requisition");
        if PurchaseLine.FindSet then begin
            PurchaseLine.Amount := amount;
            PurchaseLine."Qty. Requested" := qty;
            PurchaseLine.Modify;
            status := 'success*Rows successfully updated';

        end
        else begin
            status := 'error*an error occured';
        end
    end;

    procedure deletePurchaseRequisitionLines(id: Integer; reqNo: Text[30]) status: Text
    var
        PurchaseLine: Record "Purchase Line";
    begin
        PurchaseLine.Reset;
        PurchaseLine.SetRange("Line No.", id);
        PurchaseLine.SetRange("Document No.", reqNo);
        PurchaseLine.SetRange("Document Type", PurchaseLine."document type"::"Purchase Requisition");
        if PurchaseLine.FindSet then begin

            PurchaseLine.Delete;
            status := 'success*Rows successfully deleted';

        end
        else begin
            status := 'error*an error occured';
        end



        /*
        IF Purch."PRN Type"<>Purch."PRN Type"::"Project Works" THEN
          ERROR('Purchase Requisition Must be Project Works');

        //Transfer the Requisition Template Lines to PRN Lines
        ProjStaffTemplate.RESET;
        ProjStaffTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
        IF ProjStaffTemplate.FINDSET THEN BEGIN
          REPEAT
            //Creation of PRN Personnel Specification details
            PRNPersonnelSpecification.INIT;
            PRNPersonnelSpecification."Document Type":=Purch."Document Type";
            PRNPersonnelSpecification."Document No.":=Purch."No.";
            PRNPersonnelSpecification."Staff Role Code":=ProjStaffTemplate."Project Role Code";
            PRNPersonnelSpecification."Title/Designation Description":=ProjStaffTemplate.Description;
            PRNPersonnelSpecification."Staff Category":=ProjStaffTemplate."Staff Category";
            PRNPersonnelSpecification."Min No. of Recomm Staff":=ProjStaffTemplate."Min No. of Recomm Staff";
            PRNPersonnelSpecification.INSERT(TRUE);

           UNTIL ProjStaffTemplate.NEXT=0;

        END;

        //Creation of PRN Personnel Experience details
        ProjStaffExperienceTemplate.RESET;
        ProjStaffExperienceTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
        IF ProjStaffExperienceTemplate.FINDSET THEN BEGIN
          REPEAT
            PRNPersonnelExperience.INIT;
            PRNPersonnelExperience."Document Type":=Purch."Document Type";
            PRNPersonnelExperience."Document No.":=Purch."No.";
            PRNPersonnelExperience."Staff Role Code":=ProjStaffExperienceTemplate."Project Role Code";
            PRNPersonnelExperience."Experience Category":=ProjStaffExperienceTemplate."Experience Category";
            PRNPersonnelExperience."Entry No":=ProjStaffExperienceTemplate."Entry No";
            PRNPersonnelExperience."Minimum Years of Experience":=ProjStaffExperienceTemplate."Minimum Years of Experience";
            PRNPersonnelExperience."Minimum Experience Req":=ProjStaffExperienceTemplate."Minimum Experience Req";
            PRNPersonnelExperience.INSERT(TRUE);

            UNTIL ProjStaffExperienceTemplate.NEXT=0;
          END;

        //Creation of PRN Personnel Qualification details

        ProjStaffQualificationTemplate.RESET;
        ProjStaffQualificationTemplate.SETRANGE("Key Staff Template ID",Purch."Project Staffing Template ID");
        IF ProjStaffQualificationTemplate.FINDSET THEN BEGIN
          REPEAT
            PRNPersonnelqualification.INIT;
            PRNPersonnelqualification."Document Type":=Purch."Document Type";
            PRNPersonnelqualification."Document No.":=Purch."No.";
            PRNPersonnelqualification."Staff Role Code":=ProjStaffQualificationTemplate."Project Role Code";
            PRNPersonnelqualification."Entry No":=ProjStaffQualificationTemplate."Entry No";
            PRNPersonnelqualification."Qualification Category":=ProjStaffQualificationTemplate."Qualification Category";
            PRNPersonnelqualification."Minimum Qualification Req":=ProjStaffQualificationTemplate."Minimum Qualification Req";
            PRNPersonnelqualification.INSERT(TRUE);

            UNTIL ProjStaffQualificationTemplate.NEXT=0;
          END;

        //Creation of PRN Equipment Specifications
        WorksEquipemntSpecification.RESET;
        WorksEquipemntSpecification.SETRANGE("Equipment Template ID",Purch."Works Equipment Template ID");
        IF WorksEquipemntSpecification.FINDSET THEN BEGIN
          REPEAT
            PRNEquipmentsSpecification.INIT;
            PRNEquipmentsSpecification."Document Type":=Purch."Document Type";
            PRNEquipmentsSpecification."Document No.":=Purch."No.";
            PRNEquipmentsSpecification."Equipment Type":=WorksEquipemntSpecification."Equipment Type";
            PRNEquipmentsSpecification.Category:=WorksEquipemntSpecification.Category;
            PRNEquipmentsSpecification.Description:=WorksEquipemntSpecification.Description;
            PRNEquipmentsSpecification."Minimum Required Qty":=WorksEquipemntSpecification."Minimum Required Qty";
            PRNEquipmentsSpecification.INSERT(TRUE);
            UNTIL WorksEquipemntSpecification.NEXT=0;

          END;
        MESSAGE('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly',Purch."No.");

        */

    end;

    procedure addProjectDetails(docNo: Text[100]; ProjectTemplateId: Text[100]; WorkTemplate: Text[100]; RoadCode: Text[100]; LinkName: Text[100]; Constituency: Text[100]; WorkLength: Decimal) status: Text
    begin
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("No.", docNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Purchase Requisition");
        if PurchaseHeader.FindSet then begin
            PurchaseHeader."Project Staffing Template ID" := ProjectTemplateId;
            PurchaseHeader."Works Equipment Template ID" := WorkTemplate;
            PurchaseHeader."Road Code" := RoadCode;
            PurchaseHeader.Validate("Road Code");
            PurchaseHeader."Link Name" := LinkName;
            PurchaseHeader."Works Length (Km)" := WorkLength;
            PurchaseHeader.Consitituency := Constituency;
            PurchaseHeader.Modify;
            status := 'success*Project details successfully saved';
        end
        else begin
            status := 'error*Document with No %1, does not exist' + docNo;
        end
    end;


    procedure SuggestPRNPersonnel_equipmentSpecification(Purch: Record "Purchase Header")
    var
        PurchLines: Record "Purchase Line";
        RequisitionTempLine: Record "BoQ Template Line1";
        RequisitionTempheader: Record "Purchase Requisition Template";
        PRNPersonnelSpecification: Record "PRN Personnel Specification";
        PRNPersonnelqualification: Record "PRN Personnel Qualification";
        PRNPersonnelExperience: Record "PRN Personnel Experience";
        PRNEquipmentsSpecification: Record "PRN Equipment Specification";
        ProjStaffTemplate: Record "Project Staff Template Line";
        ProjStaffExperienceTemplate: Record "Project Staff Template Experie";
        ProjStaffQualificationTemplate: Record "Project Staff Template Qualifi";
        WorksEquipemntSpecification: Record "Works Equipment Template Line";
    begin
        Purch.TestField("PRN Type");
        if Purch."PRN Type" <> Purch."prn type"::"Project Works" then
            Error('Purchase Requisition Must be Project Works');

        //Transfer the Requisition Template Lines to PRN Lines
        ProjStaffTemplate.Reset;
        ProjStaffTemplate.SetRange("Key Staff Template ID", Purch."Project Staffing Template ID");
        if ProjStaffTemplate.FindSet then begin
            repeat
                //Creation of PRN Personnel Specification details
                PRNPersonnelSpecification.Init;
                PRNPersonnelSpecification."Document Type" := Purch."Document Type";
                PRNPersonnelSpecification."Document No." := Purch."No.";
                PRNPersonnelSpecification."Staff Role Code" := ProjStaffTemplate."Project Role Code";
                PRNPersonnelSpecification."Title/Designation Description" := ProjStaffTemplate.Description;
                PRNPersonnelSpecification."Staff Category" := ProjStaffTemplate."Staff Category";
                PRNPersonnelSpecification."Min No. of Recomm Staff" := ProjStaffTemplate."Min No. of Recomm Staff";
                PRNPersonnelSpecification.Insert(true);

            until ProjStaffTemplate.Next = 0;

        end;

        //Creation of PRN Personnel Experience details
        ProjStaffExperienceTemplate.Reset;
        ProjStaffExperienceTemplate.SetRange("Key Staff Template ID", Purch."Project Staffing Template ID");
        if ProjStaffExperienceTemplate.FindSet then begin
            repeat
                PRNPersonnelExperience.Init;
                PRNPersonnelExperience."Document Type" := Purch."Document Type";
                PRNPersonnelExperience."Document No." := Purch."No.";
                PRNPersonnelExperience."Staff Role Code" := ProjStaffExperienceTemplate."Project Role Code";
                PRNPersonnelExperience."Experience Category" := ProjStaffExperienceTemplate."Experience Category";
                PRNPersonnelExperience."Entry No" := ProjStaffExperienceTemplate."Entry No";
                PRNPersonnelExperience."Minimum Years of Experience" := ProjStaffExperienceTemplate."Minimum Years of Experience";
                PRNPersonnelExperience."Minimum Experience Req" := ProjStaffExperienceTemplate."Minimum Experience Req";
                PRNPersonnelExperience.Insert(true);

            until ProjStaffExperienceTemplate.Next = 0;
        end;

        //Creation of PRN Personnel Qualification details

        ProjStaffQualificationTemplate.Reset;
        ProjStaffQualificationTemplate.SetRange("Key Staff Template ID", Purch."Project Staffing Template ID");
        if ProjStaffQualificationTemplate.FindSet then begin
            repeat
                PRNPersonnelqualification.Init;
                PRNPersonnelqualification."Document Type" := Purch."Document Type";
                PRNPersonnelqualification."Document No." := Purch."No.";
                PRNPersonnelqualification."Staff Role Code" := ProjStaffQualificationTemplate."Project Role Code";
                PRNPersonnelqualification."Entry No" := ProjStaffQualificationTemplate."Entry No";
                PRNPersonnelqualification."Qualification Category" := ProjStaffQualificationTemplate."Qualification Category";
                PRNPersonnelqualification."Minimum Qualification Req" := ProjStaffQualificationTemplate."Minimum Qualification Req";
                PRNPersonnelqualification.Insert(true);

            until ProjStaffQualificationTemplate.Next = 0;
        end;

        //Creation of PRN Equipment Specifications
        WorksEquipemntSpecification.Reset;
        WorksEquipemntSpecification.SetRange("Equipment Template ID", Purch."Works Equipment Template ID");
        if WorksEquipemntSpecification.FindSet then begin
            repeat
                PRNEquipmentsSpecification.Init;
                PRNEquipmentsSpecification."Document Type" := Purch."Document Type";
                PRNEquipmentsSpecification."Document No." := Purch."No.";
                PRNEquipmentsSpecification."Equipment Type" := WorksEquipemntSpecification."Equipment Type";
                PRNEquipmentsSpecification.Category := WorksEquipemntSpecification.Category;
                PRNEquipmentsSpecification.Description := WorksEquipemntSpecification.Description;
                PRNEquipmentsSpecification."Minimum Required Qty" := WorksEquipemntSpecification."Minimum Required Qty";
                PRNEquipmentsSpecification.Insert(true);
            until WorksEquipemntSpecification.Next = 0;

        end;
        Message('Personnel & Equipment Specification for PRN: %1 has been suggested succesfuly', Purch."No.");
    end;

    procedure updatePersonnelSpecifications(id: Integer; docNo: Text[50]; noOfStafff: Integer; desc: Text[200]) status: Text
    var
        PersonnelSpecification: Record "PRN Personnel Specification";
    begin
        PersonnelSpecification.Reset;
        PersonnelSpecification.SetRange("Entry No", id);
        PersonnelSpecification.SetRange("Document No.", docNo);
        PersonnelSpecification.SetRange("Title/Designation Description", desc);
        if PersonnelSpecification.FindSet then begin
            PersonnelSpecification."Min No. of Recomm Staff" := noOfStafff;
            PersonnelSpecification.Modify;
            status := 'success*Record successfully updated';
        end else begin
            status := 'error*Record with document number' + docNo + ' does not exist';
        end
    end;

    procedure deletePersonnelSpecifications(id: Integer; docNo: Text[50]; desc: Text) status: Text
    var
        PersonnelSpecification: Record "PRN Personnel Specification";
    begin
        PersonnelSpecification.Reset;
        PersonnelSpecification.SetRange("Entry No", id);
        PersonnelSpecification.SetRange("Document No.", docNo);
        PersonnelSpecification.SetRange("Title/Designation Description", desc);
        if PersonnelSpecification.FindSet then begin
            PersonnelSpecification.Delete;
            status := 'success*Record successfully deleted';
        end else begin
            status := 'error*Record with document number' + docNo + ' does not exist';
        end
    end;

    procedure updateEquipmentSpecifications(id: Integer; docNo: Text[50]; qty: Decimal) status: Text
    var
        EquipmentSpecification: Record "PRN Equipment Specification";
    begin
        EquipmentSpecification.Reset;
        EquipmentSpecification.SetRange(Id, id);
        EquipmentSpecification.SetRange("Document No.", docNo);
        if EquipmentSpecification.FindSet then begin
            EquipmentSpecification."Minimum Required Qty" := qty;
            EquipmentSpecification.Modify;
            status := 'success*Record successfully updated';
        end else begin
            status := 'error*Record with document number' + docNo + ' does not exist';
        end
    end;

    procedure deleteEquipmentSpecifications(id: Integer; docNo: Text[50]) status: Text
    var
        EquipmentSpecification: Record "PRN Equipment Specification";
    begin
        EquipmentSpecification.Reset;
        EquipmentSpecification.SetRange(Id, id);
        EquipmentSpecification.SetRange("Document No.", docNo);
        if EquipmentSpecification.FindSet then begin
            EquipmentSpecification.Delete;
            status := 'success*Record successfully deleted';
        end else begin
            status := 'error*Record with document number' + docNo + ' does not exist';
        end
    end;

    procedure AddVehicleMaintenanceRequestDetails(employeeNo: Code[10]; region: Code[10]; registrationnumber: Code[10]; odometerreading: Decimal; servicetype: Integer; description: Text; fundingcode: Code[10]; projectnumber: Code[10]; budgetline: Code[10]; maintenancecost: Code[10]; vendornumber: Code[10]; tservicecode: Text) status: Text
    var
        FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
        FleetManagementSetup: Record "Fleet Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        FleetManagementSetup.Get;
        FuelMaintenanceRequisition.Init;
        FuelMaintenanceRequisition."Requisition No" := NoSeriesManagement.GetNextNo(FleetManagementSetup."Maintenance Request", Today, true);
        FuelMaintenanceRequisition."Vehicle Reg No" := registrationnumber;
        FuelMaintenanceRequisition."Shortcut Dimension 1 Code" := region;
        FuelMaintenanceRequisition.Validate("Vehicle Reg No");
        FuelMaintenanceRequisition."Odometer Reading" := odometerreading;
        FuelMaintenanceRequisition."Service Type" := servicetype;
        FuelMaintenanceRequisition."Shortcut Dimension 2 Code" := fundingcode;
        FuelMaintenanceRequisition."Service Code" := tservicecode;
        FuelMaintenanceRequisition.Validate("Service Code");
        FuelMaintenanceRequisition."Employee No" := employeeNo;
        FuelMaintenanceRequisition.Description := description;
        FuelMaintenanceRequisition."Project Name" := projectnumber;
        //FuelMaintenanceRequisition."Task Number":=budgetline;
        //FuelMaintenanceRequisition.M:=maintenancecost;
        FuelMaintenanceRequisition."Vendor(Dealer)" := vendornumber;
        FuelMaintenanceRequisition.Validate("Vendor(Dealer)");
        FuelMaintenanceRequisition.Type := FuelMaintenanceRequisition.Type::Maintenance;
        if FuelMaintenanceRequisition.Insert(true) then begin
            status := 'success*The Vehicle Maintenance Request was successfully submitted*' + FuelMaintenanceRequisition."Requisition No";
        end else begin
            status := 'danger*The Vehicle Maintenance Request could not be submitted';
        end;
        exit(status);
    end;

    procedure SendVehicleMaintenancetforApproval(docNo: Code[100]) status: Text
    var
        FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        FuelMaintenanceRequisition1: Record "Fuel & Maintenance Requisition";
    begin
        FuelMaintenanceRequisition.Reset;
        FuelMaintenanceRequisition.SetRange("Requisition No", docNo);
        FuelMaintenanceRequisition.SetRange(Status, FuelMaintenanceRequisition.Status::Open);
        if FuelMaintenanceRequisition.FindSet then begin

            leaveApp := FuelMaintenanceRequisition;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            IF FuelMaintenanceRequisition.GET(FuelMaintenanceRequisition."Requisition No") THEN BEGIN
                IF FuelMaintenanceRequisition.Status = FuelMaintenanceRequisition.Status::Open THEN BEGIN
                    status := 'warning*Your Vehicle Maintenance Request could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your Vehicle Maintenance Request was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

        end else begin
            status := 'error* Either New File Movement Number does not exist or it is no longer open';
        end
    end;

    procedure AddFuelRequisitionDetails(employeeNo: Code[10]; fueltype: Integer; vendornumber: Code[10]; litersrequested: Decimal; vehicleregistration: Code[10]; mileage: Decimal; pricerperLiter: Decimal; driverCode: Code[50]) status: Text
    var
        FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
        FleetManagementSetup: Record "Fleet Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        FleetManagementSetup.Get;
        FuelMaintenanceRequisition.Init;
        FuelMaintenanceRequisition.Type := FuelMaintenanceRequisition.Type::Fuel;
        FuelMaintenanceRequisition."Requisition No" := NoSeriesManagement.GetNextNo(FleetManagementSetup."Fuel Register", Today, true);
        FuelMaintenanceRequisition."Vehicle Reg No" := vehicleregistration;
        FuelMaintenanceRequisition.Validate("Vehicle Reg No");
        FuelMaintenanceRequisition."Vendor(Dealer)" := vendornumber;
        FuelMaintenanceRequisition.Validate("Vendor(Dealer)");
        FuelMaintenanceRequisition."Type of Fuel" := fueltype;
        FuelMaintenanceRequisition."Employee No" := employeeNo;
        FuelMaintenanceRequisition.Mileage := mileage;
        FuelMaintenanceRequisition."Litres of Oil" := litersrequested;
        FuelMaintenanceRequisition."Price/Litre" := pricerperLiter;
        FuelMaintenanceRequisition.Driver := driverCode;
        FuelMaintenanceRequisition.Validate(Driver);
        if FuelMaintenanceRequisition.Insert(true) then begin
            status := 'success*The Vehicle Fuel  Request was successfully submitted*' + FuelMaintenanceRequisition."Requisition No";
        end else begin
            status := 'danger*The Vehicle Fuel Request could not be submitted*' + FuelMaintenanceRequisition."Requisition No";
        end;
    end;

    procedure SendVehicleRequisitionApproval(imprestNumber: Code[20]) status: Text
    begin
    end;

    procedure CloseDriverOpenTrips(requisitionNumber: Code[50]) status: Text
    var
        TransportRequisition: Record "Transport Requisition";
    begin

        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNumber);
        TransportRequisition.SetRange(TransportRequisition.Status, TransportRequisition.Status::Approved);
        if TransportRequisition.FindSet then begin
            TransportRequisition.Status := TransportRequisition.Status::Closed;
            TransportRequisition.Selected := false;
            if TransportRequisition.Modify(true) then begin
                status := 'success*The Trip has been successully closed';
            end else begin
                status := 'danger*The Trip was not successully closed';
            end;
        end;
    end;

    procedure AddDriverAllocations(requisitionNumber: Code[50]; driverCode: Code[50]; dateofTrip: Date; vehiclenumber: Code[50]; noofdays: Integer) status: Text
    var
        VehicleDriversAllocation: Record "Vehicle Driver Allocation";
        TransportRequisition: Record "Transport Requisition";
        NonKeRRADriverAllocation: Record "Non-KeRRA Driver Allocation";
    begin

        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNumber);
        if TransportRequisition.FindSet then begin
            VehicleDriversAllocation.Init;
            VehicleDriversAllocation."Requisition Number" := requisitionNumber;
            VehicleDriversAllocation."Driver Code" := driverCode;
            VehicleDriversAllocation.Validate("Driver Code");
            VehicleDriversAllocation."Registration Number" := vehiclenumber;
            VehicleDriversAllocation.Validate("Registration Number");
            if VehicleDriversAllocation.Insert(true) then begin
                status := 'success*The Driver has been allocated Successfully';
            end else begin
                status := 'danger*The Driver could not be allocated Successfully';
            end;
        end;
    end;

    procedure AddNonKeRRADriverAllocations(requisitionNumber: Code[50]; driverIDNumber: Code[50]; driverName: Code[50]; phonenumber: Code[10]; emailaddress: Code[50]; drivinglicenseNumber: Code[50]) status: Text
    var
        VehicleDriversAllocation: Record "Vehicle Driver Allocation";
        TransportRequisition: Record "Transport Requisition";
        NonKeRRADriverAllocation: Record "Non-KeRRA Driver Allocation";
    begin
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", requisitionNumber);
        if TransportRequisition.FindSet then begin
            NonKeRRADriverAllocation.Init;
            NonKeRRADriverAllocation."Req No" := requisitionNumber;
            NonKeRRADriverAllocation."ID No" := driverIDNumber;
            NonKeRRADriverAllocation."Driver Name" := driverName;
            NonKeRRADriverAllocation."Phone Number" := phonenumber;
            NonKeRRADriverAllocation."Email Address" := emailaddress;
            NonKeRRADriverAllocation."DL Number" := drivinglicenseNumber;
            if NonKeRRADriverAllocation.Insert(true) then begin
                status := 'success*The Driver has been allocated Successfully';
            end else begin
                status := 'danger*The Driver could not be allocated Successfully';
            end;
        end;
    end;

    procedure SendFuelRequisitionforApproval(docNo: Code[100]) status: Text
    var
        FuelMaintenanceRequisition: Record "Fuel & Maintenance Requisition";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        FuelMaintenanceRequisition1: Record "Fuel & Maintenance Requisition";
    begin
        FuelMaintenanceRequisition.Reset;
        FuelMaintenanceRequisition.SetRange("Requisition No", docNo);
        FuelMaintenanceRequisition.SetRange(Status, FuelMaintenanceRequisition.Status::Open);
        if FuelMaintenanceRequisition.FindSet then begin
            //if ApprovalsMgmt.CheckFuelReqApprovalsWorkflowEnabled(FuelMaintenanceRequisition) then
            //   ApprovalsMgmt.OnSendFuelReqForApproval(FuelMaintenanceRequisition);
            FuelMaintenanceRequisition1.Reset;
            FuelMaintenanceRequisition1.SetRange("Requisition No", docNo);
            if FuelMaintenanceRequisition1.FindSet then begin
                if FuelMaintenanceRequisition1.Status = FuelMaintenanceRequisition1.Status::"Pending Approval" then begin
                    status := 'success*The Vehicle Maintenance request was successfully sent for approval';
                end else begin
                    status := 'success*The Vehicle Maintenance request was already approved on is no longer Pending Approval';
                end;
            end else begin
                status := 'danger* New Vehicle Maintenance request with the given number does not exist';
            end;
        end else begin
            status := 'error* Either New File Movement Number does not exist or it is no longer open';
        end
    end;

    procedure ProcessDriverAllocations(docNumber: Code[50]) status: Text
    var
        VehicleDrivers: Record "Vehicle Drivers";
        VehicleDriversAll: Record "Vehicle Driver Allocation";
        VehicleDrivers11: Record "Vehicle Drivers";
        TransportRequisition: Record "Transport Requisition";
    begin
        TransportRequisition.Reset;
        TransportRequisition.SetRange("Transport Requisition No", docNumber);
        if TransportRequisition.FindSet then begin
            VehicleDriversAll.Reset;
            VehicleDriversAll.SetRange(VehicleDriversAll."Requisition Number", docNumber);
            VehicleDriversAll.SetRange(VehicleDriversAll."Reassigned?", false);
            if VehicleDriversAll.Find('-') then begin
                repeat
                    if VehicleDriversAll."Registration Number" = '' then begin
                        status := 'danger*Please allocate vehicle to driver %1 before proceeding';
                    end else begin
                        if TransportRequisition."Approved Imprest Memo" <> '' then begin
                            UpateDriverAllocationToImprestMemo(docNumber, TransportRequisition."Approved Imprest Memo");
                        end;
                    end;
                until VehicleDriversAll.Next = 0;
                SendDriverEmailNotification(docNumber);
                status := 'success*The Driver Allocation details has been completed Successfully'
            end else begin
                status := 'danger*No Driver Available for this action'
            end;
        end;
    end;

    procedure UpateDriverAllocationToImprestMemo(docNumber: Code[50]; ImprestNumber: Code[50]) status: Text
    var
        FleetSetup: Record "Fleet Management Setup";
        ProjectMember1: Record "Project Members";
        ProjectMembers: Record "Project Members";
        ProjectMember2: Record "Project Members";
        DefaultDriver: Code[10];
        DriverAlloc: Record "Vehicle Driver Allocation";
    begin

        if ImprestMemo.Get(docNumber) then begin
            FleetSetup.Get;
            FleetSetup.TestField("Default Fleet Driver");
            DefaultDriver := FleetSetup."Default Fleet Driver";
            DriverAlloc.Reset;
            DriverAlloc.SetRange("Requisition Number", docNumber);
            if DriverAlloc.FindSet then begin
                ProjectMember1.Reset;
                ProjectMember1.SetRange(ProjectMember1."Imprest Memo No.", docNumber);
                if ProjectMember1.FindFirst then begin
                    ProjectMembers.Init;
                    ProjectMembers."Imprest Memo No." := docNumber;
                    ProjectMembers."Work Type" := ProjectMember1."Work Type";
                    ProjectMembers.Validate("Work Type");
                    ProjectMembers.Type := ProjectMembers.Type::Person;
                    ProjectMembers."No." := DriverAlloc."Driver Code";
                    ProjectMembers.Validate("No.");
                    ProjectMembers."Time Period" := DriverAlloc."Number of Days";
                    ProjectMembers.Validate(ProjectMembers."Time Period");
                    ProjectMembers."Vote Item" := ProjectMember1."Vote Item";
                    ProjectMembers.Validate("Vote Item");
                    ProjectMembers."Type of Expense" := ProjectMember1."Type of Expense";
                    ProjectMembers.Validate("Type of Expense");
                    ProjectMembers.Job := ProjectMember1.Job;
                    ProjectMembers."Job  Task" := ProjectMember1."Job  Task";
                    ProjectMembers.Validate(Job);
                    if not ProjectMembers.Insert(true) then
                        ProjectMembers.Modify(true);
                end;
                ProjectMember2.Reset;
                ProjectMember2.SetRange(ProjectMember2."Imprest Memo No.", docNumber);
                ProjectMember2.SetRange(ProjectMember2."No.", DefaultDriver);
                if ProjectMember2.FindSet then
                    ProjectMember2.Delete;

            end;
        end;
    end;

    procedure SendDriverEmailNotification(docNumber: Code[50]) status: Text
    var
        VehicleDriverAllocation: Record "Vehicle Driver Allocation";
        TransportRequisition: Record "Transport Requisition";
        Emp: Record Employee;
        Header: Code[100];
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        SenderEmail: Text;
        SenderName: Text;
        Approved: Boolean;
        VehicleDrivers: Record "Vehicle Drivers";
        ImprestMemo: Record "Imprest Memo";
        ImprestMemo1: Record "Imprest Memo";
        ProjectMembers: Record "Project Members";
        ProjectMember1: Record "Project Members";
        VehicleDriversAll: Record "Vehicle Driver Allocation";
        VehicleDrivers11: Record "Vehicle Drivers";
    begin
        VehicleDriverAllocation.Reset;
        VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Requisition Number", docNumber);
        VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Reassigned?", false);
        if VehicleDriverAllocation.Find('-') then begin
            repeat
                TransportRequisition.Get(docNumber);
                if Emp.Get(VehicleDriverAllocation."Driver Code") then begin
                    Header := 'TRAVEL TRIP NOTIFICATION ' + docNumber + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

                    if SMTPSetup.Get() then begin
                        // SenderEmail := SMTPSetup."Email Sender Address";
                        // SenderName := SMTPSetup."Email Sender Name";
                    end;
                    if Emp."E-Mail" <> '' then begin
                        //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',true);
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Please note that you have been assigend as the driver to the above mentioned trip.');// for the month of January 2014');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Trip requested by : '+TransportRequisition."Employee Name");
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Trip From: '+TransportRequisition.Commencement+' To '+TransportRequisition.Destination+' on '+Format(TransportRequisition."Date of Trip")+' return date will be on '+Format(TransportRequisition."Trip End Date"));
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Vehicle Reg Number: '+VehicleDriverAllocation."Requisition Number" +' '+VehicleDriverAllocation."Vehicle Description");
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Kindly prepare adequately');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Thanks & Regards');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline(SenderName);
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('<HR>');
                        //SMTPMail.AddBodyline('This is a system generated mail.');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.Send;
                    end;
                end;
                if Emp.Get(TransportRequisition."Employee No") then begin
                    Header := 'TRAVEL TRIP NOTIFICATION ' + VehicleDriverAllocation."Requisition Number" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

                    if SMTPSetup.Get() then begin
                        // SenderEmail := SMTPSetup."Email Sender Address";
                        // SenderName := SMTPSetup."Email Sender Name";
                    end;
                    if Emp."E-Mail" <> '' then begin
                        //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',true);
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Please note that you have been assigend driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Driver Name : '+VehicleDriverAllocation."Driver Name");
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Vehicle Reg Number: '+VehicleDriverAllocation."Registration Number" +' '+VehicleDriverAllocation."Vehicle Description");
                        //SMTPMail.AddBodyline('<br>');
                        VehicleDrivers11.Reset;
                        VehicleDrivers11.SetRange(VehicleDrivers11.Driver, VehicleDriverAllocation."Driver Code");
                        if VehicleDrivers11.FindSet then begin
                            //SMTPMail.AddBodyline('Driver Phone Number : '+VehicleDrivers11."Phone Number");
                            //SMTPMail.AddBodyline('<br>');
                        end;
                        //SMTPMail.AddBodyline('Trip From: '+TransportRequisition.Commencement+' To '+TransportRequisition.Destination+' on '+Format(TransportRequisition."Date of Trip"));
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Kindly prepare adequately');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Thanks & Regards');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline(SenderName);
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('<HR>');
                        //SMTPMail.AddBodyline('This is a system generated mail.');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.Send;
                        Message('Mail sent to %1', Emp."E-Mail");
                    end;
                    //End email
                end;
            until VehicleDriverAllocation.Next = 0;
            status := 'success*Email notifications has been sent';
        end;
    end;

    procedure generateFleetRequisition(transportRequisitionNo: Code[20]) status: Text
    begin

        /*Employee.RESET;
        Employee.SETRANGE(Employee."No.", employeeNumber);
        IF Employee.FINDSET THEN BEGIN*/
        TransportRequisition.Reset;
        //ImprestMemo.SETRANGE(Requestor,employeeNumber);
        TransportRequisition.SetRange("Transport Requisition No", transportRequisitionNo);
        if TransportRequisition.FindSet then begin
            // if FILE.Exists(FILESPATH4 + transportRequisitionNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH4 + transportRequisitionNo + '.pdf');
            //     Report.SaveAsPdf(59018, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(59018, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The Fleet Requisition with the given number does not exist or your are not the requestor';
        end;
        /*END ELSE BEGIN
          status:='danger*The Employee with the give number does not exist';
          END;*/

    end;

    procedure reassignDriver(TransportNo: Code[10]; DriverCode: Code[10]; newTrip: Code[10]; date: Date) status: Text
    var
        TransportReq: Record "Transport Requisition";
    begin

        status := 'danger*The Customer could not be edited';
        TransportReq.Reset;
        TransportReq.SetRange("Transport Requisition No", TransportNo);
        if TransportReq.FindSet then begin
            TransportReq."Driver Allocated" := DriverCode;
            TransportReq.Validate("Driver Allocated");
            TransportReq."Transport Requisition No" := newTrip;
            TransportReq.Validate("Transport Requisition No");
            TransportReq."Date of Trip" := date;
            TransportReq.Validate("Date of Trip");

            if TransportReq.Modify(true) then begin
                status := 'success*The Customer was successfully edited';
            end else begin
                status := 'danger*The Customer could not be edited';
            end;
        end;
    end;

    procedure GenerateFuelRequisition(transportRequisitionNo: Code[20]) status: Text
    begin

        /*Employee.RESET;
        Employee.SETRANGE(Employee."No.", employeeNumber);
        IF Employee.FINDSET THEN BEGIN*/
        TransportRequisition.Reset;
        //ImprestMemo.SETRANGE(Requestor,employeeNumber);
        TransportRequisition.SetRange("Transport Requisition No", transportRequisitionNo);
        if TransportRequisition.FindSet then begin
            // if FILE.Exists(FILESPATH4 + transportRequisitionNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH4 + transportRequisitionNo + '.pdf');
            //     Report.SaveAsPdf(59019, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(59019, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The Fleet Requisition with the given number does not exist or your are not the requestor';
        end;
        /*END ELSE BEGIN
          status:='danger*The Employee with the give number does not exist';
          END;*/

    end;

    procedure GenerateMaintenanceRequisition(transportRequisitionNo: Code[20]) status: Text
    begin

        /*Employee.RESET;
        Employee.SETRANGE(Employee."No.", employeeNumber);
        IF Employee.FINDSET THEN BEGIN*/
        TransportRequisition.Reset;
        //ImprestMemo.SETRANGE(Requestor,employeeNumber);
        TransportRequisition.SetRange("Transport Requisition No", transportRequisitionNo);
        if TransportRequisition.FindSet then begin
            // if FILE.Exists(FILESPATH4 + transportRequisitionNo + '.pdf') then begin
            //     FILE.Erase(FILESPATH4 + transportRequisitionNo + '.pdf');
            //     Report.SaveAsPdf(59020, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end else begin
            //     Report.SaveAsPdf(59020, FILESPATH4 + transportRequisitionNo + '.pdf', TransportRequisition);
            //     status := 'success*Generated*Downloads\ImprestMemoPreview\' + transportRequisitionNo + '.pdf';
            // end;
        end else begin
            ;
            status := 'danger*The Fleet Requisition with the given number does not exist or your are not the requestor';
        end;
        /*END ELSE BEGIN
          status:='danger*The Employee with the give number does not exist';
          END;*/

    end;

    procedure EscalatedHelpdeskRequestDynasoft(jobNo: Text[100]; assignee: Text[100]; description: Text[300]) status: Text
    var
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SMTP: Codeunit Mail;
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        CompInfo: Record "Company Information";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
    begin
        /*IF CONFIRM('Are you sure you want to escalate the ICT helpdesk issue?'+' '+"Job No.") =TRUE THEN
         BEGIN
          "Escalated By":=UPPERCASE(USERID);
          "Escalated Date":=TODAY;
          "Escalated Time":=TIME;
           "Assigned To":="Escalated To";
           Status:=Status::"Escalated To Vendor";
          MODIFY(TRUE);
         END;

        //Notify the requester that the issue has been escalated
         ObjComInfo.GET;
         SenderEmailAddress:=ObjComInfo."Administrator Email";
         SenderName:=COMPANYNAME;
         //IF UserSetup.GET("Requesting Officer") THEN
         //Dynasoft Email
         ObjComInfo.TESTFIELD("Vendor  Email");
         Recipient:=ObjComInfo."Vendor  Email";
         Subject:='ICT ISSUE ESCALATION'+ ' '+"Job No."+' '+"Description of the issue";
         Body:='Please note that the issue on the subject above has been escalatd to dynasoft for further action.';
         ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);

        //Notify the 'Escalted To' that the issue has been escalated to them
         ObjComInfo.GET;
         SenderEmailAddress:=ObjComInfo."Administrator Email";
         SenderName:=COMPANYNAME;
         //IF UserSetup.GET("Escalated To") THEN
         ObjComInfo.TESTFIELD("ICT Email");
         Recipient:=ObjComInfo."ICT Email";
         Subject:='ICT ISSUE ESCALATION'+ ' '+"Job No."+' '+"Description of the issue";
         Body:='Please note that the issue on the subject above has been escalatd to Dyansoft Business Solutions Limited for further action';
         ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);*/

        helpdesk.Reset;
        helpdesk.SetRange("Job No.", jobNo);
        if helpdesk.FindSet then begin
            CompInfo.Reset;
            CompInfo.SetRange("ICT Email", assignee);


            helpdesk."Escalated To" := assignee;
            helpdesk."Escalated Date" := Today();
            helpdesk."Escalated Time" := Time;
            helpdesk.Status := helpdesk.Status::"Escalated To Vendor";
            helpdesk."Escalated By" := helpdesk."Assigned To";
            helpdesk."Ascalation Details" := description;
            //helpdesk.Escalated T:= UserSetup."Employee No.";
            if helpdesk.Modify(true) then begin
                //Notify the requester that the issue has been escalated

                ObjComInfo.Get;
                SenderEmailAddress := ObjComInfo."Administrator Email";
                SenderName := COMPANYNAME;
                //IF UserSetup.GET("Requesting Officer") THEN
                //Dynasoft Email
                ObjComInfo.TestField("Vendor  Email");
                Recipient := ObjComInfo."Vendor  Email";
                Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo + '' + description;
                Body := 'Please note that the issue on the subject above has been escalatd to dynasoft for further action.';
                SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                //Notify the Escalted To that the issue has been escalated
                ObjComInfo.Get;
                SenderEmailAddress := ObjComInfo."Administrator Email";
                SenderName := COMPANYNAME;
                //IF UserSetup.GET("Escalated To") THEN
                ObjComInfo.TestField("ICT Email");
                Recipient := ObjComInfo."ICT Email";
                Subject := 'ICT ISSUE ESCALATION' + ' ' + jobNo + '' + description;
                Body := 'Please note that the issue on the subject above has been escalatd to Dyansoft Business Solutions Limited for further action';
                SMTP.CreateMessage(Recipient, '', '', Subject, Body, true, true);

                //ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                status := 'success*Request assigned successfully';

            end
            else begin
                status := 'error*Job No is already assigned ';
            end
        end

    end;

    procedure Generateictreport(requestdate: Date) status: Text
    var
        icthelpdesk: Record "ICT Helpdesk";
    begin
        icthelpdesk.Reset;
        icthelpdesk.SetFilter("Request Date", '%1..%2', 0D, requestdate);

        // if FILE.Exists(FILESPATH11 + '.pdf') then begin
        //     FILE.Erase(FILESPATH11 + '.pdf');
        //     Report.SaveAsPdf(56241, FILESPATH11 + '.pdf');
        //     status := 'success*Generated*Downloads\allissues\' + '.pdf';
        // end else begin
        //     Report.SaveAsPdf(56241, FILESPATH11 + '.pdf');
        //     status := 'success*Generated*Downloads\allissues\' + '.pdf';

        // end;
    end;

    procedure GenerateReopenreport() status: Text
    begin

        // if FILE.Exists(FILESPATH12 + '.pdf') then begin
        //     FILE.Erase(FILESPATH12 + '.pdf');
        //     Report.SaveAsPdf(56239, FILESPATH12 + '.pdf');
        //     status := 'success*Generated*Downloads\reopen\' + '.pdf';
        // end else begin
        //     Report.SaveAsPdf(56239, FILESPATH12 + '.pdf');
        //     status := 'success*Generated*Downloads\reopen\' + '.pdf';
        // end;
    end;

    procedure GenerateRMReport() status: Text
    begin

        // if FILE.Exists(FILESPATH13 + '.pdf') then begin
        //     FILE.Erase(FILESPATH13 + '.pdf');
        //     Report.SaveAsPdf(95000, FILESPATH13 + '.pdf');
        //     status := 'success*Generated*Downloads\RiskReport\' + '.pdf';
        // end else begin
        //     Report.SaveAsPdf(95000, FILESPATH13 + '.pdf');
        //     status := 'success*Generated*Downloads\RiskReport\' + '.pdf';
        // end;
    end;

    procedure GetAllItems(itemcategory: Code[100]; location: Code[100]) AllData: Text
    var
        Items: Record Item;
    begin
        Items.Reset;
        Items.SetRange("Item Category Code", itemcategory);
        Items.SetRange("Global Dimension 1 Code", location);
        if Items.FindSet then begin
            repeat
                AllData := AllData + Format(Items."No.") + '*' + Format(Items.Description) + ':';
            until Items.Next = 0;
        end;
        exit(AllData);
    end;

    procedure fnNewStaffPerformanceContract(contractNo: Code[100]; employeeNo: Code[100]; description: Text; seniorOfficerPC: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerfomanceContractHeader1: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange("Responsible Employee No.", employeeNo);
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Open);
        PerfomanceContractHeader.SetRange("Score Card Type", PerfomanceContractHeader."score card type"::Staff);
        PerfomanceContractHeader.SetRange("Document Type", PerfomanceContractHeader."document type"::"Individual Scorecard");
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader.Description := description;
            // if type = 'HQ' then begin
            //     PerfomanceContractHeader."Senior Officer PC ID" := seniorOfficerPC;
            // end else begin
            //     PerfomanceContractHeader."Regional PC ID" := seniorOfficerPC;
            // end;
            PerfomanceContractHeader1.Reset;
            PerfomanceContractHeader1.SetRange(No, seniorOfficerPC);
            if PerfomanceContractHeader1.FindSet then begin
                PerfomanceContractHeader."Strategy Plan ID" := PerfomanceContractHeader1."Strategy Plan ID";
                PerfomanceContractHeader."Annual Workplan" := PerfomanceContractHeader1."Annual Workplan";
                PerfomanceContractHeader."Start Date" := PerfomanceContractHeader1."Start Date";
                PerfomanceContractHeader."End Date" := PerfomanceContractHeader1."End Date";
                PerfomanceContractHeader."Annual Reporting Code" := PerfomanceContractHeader1."Annual Reporting Code";
                PerfomanceContractHeader."Functional WorkPlan" := PerfomanceContractHeader1."Functional WorkPlan";
                PerfomanceContractHeader."Directors PC ID" := PerfomanceContractHeader1."Directors PC ID";
                PerfomanceContractHeader."CEO WorkPlan" := PerfomanceContractHeader1."CEO WorkPlan";
            end;
            if PerfomanceContractHeader.Modify(true) then begin
                //FnSuggestJD(PerfomanceContractHeader.No);
                status := 'success*Your staff perfomance contract was successfully created*' + PerfomanceContractHeader.No + '*' + PerfomanceContractHeader."Strategy Plan ID" + '*' + seniorOfficerPC + '*' + PerfomanceContractHeader."Annual Reporting Code";
            end else begin
                status := 'danger*Your staff perfomance contract was not created, kindly try again!';
            end;
        end else begin
            //  PerfomanceContractHeader.RESET;
            //  PerfomanceContractHeader.SETRANGE("Responsible Employee No.",employeeNo);
            //  PerfomanceContractHeader.SETRANGE("Approval Status",PerfomanceContractHeader."Approval Status"::Open);
            //  IF PerfomanceContractHeader.FINDSET THEN BEGIN
            //    ERROR:='You have an open individual performance contract, kindly re-use it!';
            //  END;
            PerfomanceContractHeader.Init;
            PerfomanceContractHeader."Document Type" := PerfomanceContractHeader."document type"::"Individual Scorecard";
            PerfomanceContractHeader."Evaluation Type" := PerfomanceContractHeader."evaluation type"::"Standard Appraisal/Supervisor Score Only";
            PerfomanceContractHeader."Score Card Type" := PerfomanceContractHeader."score card type"::Staff;
            PerfomanceContractHeader."Responsible Employee No." := employeeNo;
            PerfomanceContractHeader.Validate("Responsible Employee No.");
            PerfomanceContractHeader.Description := description;
            // if type = 'HQ' then begin
            //     PerfomanceContractHeader."Senior Officer PC ID" := seniorOfficerPC;
            // end else begin
            //     PerfomanceContractHeader."Regional PC ID" := seniorOfficerPC;
            // end;
            PerfomanceContractHeader1.Reset;
            PerfomanceContractHeader1.SetRange(No, seniorOfficerPC);
            if PerfomanceContractHeader1.FindSet then begin
                PerfomanceContractHeader."Strategy Plan ID" := PerfomanceContractHeader1."Strategy Plan ID";
                PerfomanceContractHeader."Annual Workplan" := PerfomanceContractHeader1."Annual Workplan";
                PerfomanceContractHeader."Start Date" := PerfomanceContractHeader1."Start Date";
                PerfomanceContractHeader."End Date" := PerfomanceContractHeader1."End Date";
                PerfomanceContractHeader."Annual Reporting Code" := PerfomanceContractHeader1."Annual Reporting Code";
                PerfomanceContractHeader."Functional WorkPlan" := PerfomanceContractHeader1."Functional WorkPlan";
                PerfomanceContractHeader."Directors PC ID" := PerfomanceContractHeader1."Directors PC ID";
                PerfomanceContractHeader."CEO WorkPlan" := PerfomanceContractHeader1."CEO WorkPlan";
            end;
            if PerfomanceContractHeader.Insert(true) then begin
                FnSuggestJD(PerfomanceContractHeader.No);
                status := 'success*Your staff perfomance contract was successfully created*' + PerfomanceContractHeader.No + '*' + PerfomanceContractHeader."Strategy Plan ID" + '*' + seniorOfficerPC + '*' + PerfomanceContractHeader."Annual Reporting Code";
            end else begin
                status := 'danger*Your staff perfomance contract was not created, kindly try again!';
            end;
        end;
    end;

    procedure FnSubmitSelectedCoreInitiatives(strategyid: Code[100]; personalscorecardid: Code[100]; workplanNumber: Code[50]; initiativeNumber: Code[50]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PerformanceContract: Record "Perfomance Contract Header";
        PcObjective1: Record "PC Objective";
        OriginalSubActivities: Record "Sub PC Objective";
        PCSubActivities: Record "Sub PC Objective";
    begin
        PerformanceContract.Reset;
        PerformanceContract.SetRange(No, personalscorecardid);
        if PerformanceContract.FindSet then begin
            PcObjective1.Reset;
            PcObjective1.SetRange("Strategy Plan ID", strategyid);
            PcObjective1.SetRange("Workplan No.", workplanNumber);
            PcObjective1.SetRange("Initiative No.", initiativeNumber);
            if PcObjective1.FindSet then begin
                PCObjective.Reset;
                PCObjective.SetRange("Strategy Plan ID", strategyid);
                PCObjective.SetRange("Workplan No.", personalscorecardid);
                PCObjective.SetRange("Initiative No.", initiativeNumber);
                if PCObjective.FindSet then begin
                    status := 'The selected activity already exists, kindly select another activity!';
                end;
                repeat
                    PCObjective.Init;
                    PCObjective."Workplan No." := personalscorecardid;
                    PCObjective."Strategy Plan ID" := PcObjective1."Strategy Plan ID";
                    PCObjective."Initiative Type" := PcObjective1."Initiative Type";
                    PCObjective."Initiative No." := initiativeNumber;
                    PCObjective.Validate("Initiative No.");
                    PCObjective."Goal Template ID" := PcObjective1."Goal Template ID";
                    PCObjective."Objective/Initiative" := PcObjective1."Objective/Initiative";
                    PCObjective."Year Reporting Code" := PcObjective1."Year Reporting Code";
                    PCObjective."Primary Directorate" := PcObjective1."Primary Directorate";
                    PCObjective."Primary Department" := PcObjective1."Primary Department";
                    PCObjective."Outcome Perfomance Indicator" := PcObjective1."Outcome Perfomance Indicator";
                    PCObjective."Unit of Measure" := PcObjective1."Unit of Measure";
                    PCObjective."Imported Annual Target Qty" := PcObjective1."Imported Annual Target Qty";
                    PCObjective."Q1 Target Qty" := PcObjective1."Q1 Target Qty";
                    PCObjective."Q2 Target Qty" := PcObjective1."Q2 Target Qty";
                    PCObjective."Q3 Target Qty" := PcObjective1."Q3 Target Qty";
                    PCObjective."Q4 Target Qty" := PcObjective1."Q4 Target Qty";
                    PCObjective."Start Date" := PerformanceContract."Start Date";
                    PCObjective."Due Date" := PerformanceContract."End Date";
                    if PCObjective.Insert(true) then begin
                        Fnsuggestsubindicators(PcObjective1."Strategy Plan ID", PcObjective1."Workplan No.", PcObjective1."Initiative No.", personalscorecardid);
                        status := 'success*success';
                    end else begin
                        status := 'danger*failed';
                    end;
                until PcObjective1.Next = 0;
            end;
        end;
    end;

    procedure Fnsuggestsubindicators(strategyid: Code[100]; docNo: Code[100]; initiativeNumber: Code[50]; No: Code[100]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PerformanceContract: Record "Perfomance Contract Header";
        PcObjective1: Record "PC Objective";
        OriginalSubActivities: Record "Sub PC Objective";
        PCSubActivities: Record "Sub PC Objective";
    begin
        OriginalSubActivities.Reset;
        OriginalSubActivities.SetRange("Workplan No.", docNo);
        OriginalSubActivities.SetRange("Initiative No.", initiativeNumber);
        OriginalSubActivities.SetRange("Strategy Plan ID", strategyid);
        if OriginalSubActivities.FindSet then begin
            Message(strategyid, docNo, initiativeNumber);
            repeat
                PCSubActivities.Init;
                PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                PCSubActivities."Workplan No." := No;
                PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                PCSubActivities.TransferFields(OriginalSubActivities, false);
                if PCSubActivities.Insert(true) then begin
                    status := 'success*success';
                end else begin
                    status := 'danger*failed';
                end;
            until OriginalSubActivities.Next = 0;
        end;
    end;

    procedure FnSaveCoreInitiatives(entryNumber: Integer; startdate: Date; enddate: Date; agreedTarget: Decimal; assignedweight: Decimal; comments: Text) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
    begin
        PCObjective.Reset;
        PCObjective.SetRange(EntryNo, entryNumber);
        if PCObjective.FindSet then begin
            repeat
                PCObjective."Start Date" := startdate;
                PCObjective."Due Date" := enddate;
                PCObjective."Imported Annual Target Qty" := agreedTarget;
                PCObjective."Assigned Weight (%)" := assignedweight;
                PCObjective."Additional Comments" := comments;
                if PCObjective.Modify(true) then begin
                    status := 'success*Core Initiatives Details was successfully saved';
                end else begin
                    status := 'danger*Core Initiatives Details Was not successfully saved';
                end;
            until PCObjective.Next = 0;
        end;
    end;

    procedure FnRemoveCoreInitiatives(docNo: Code[100]; entryNumber: Integer) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
    begin
        PCObjective.Reset;
        PCObjective.SetRange("Workplan No.", docNo);
        PCObjective.SetRange(EntryNo, entryNumber);
        if PCObjective.FindSet then begin
            if PCObjective.Delete(true) then begin
                status := 'success*Core Initiative was successfully removed';
            end else begin
                status := 'danger*Core Initiative could not be removed, kindly try again!';
            end;
        end;
    end;

    procedure fnSaveAditionalInitiatives(entryno: Integer; agreedtarget: Decimal; annualtarget: Decimal; startdate: Date; enddate: Date; comments: Text) status: Text
    var
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        SecondaryPCObjective.Reset;
        SecondaryPCObjective.SetRange(EntryNo, entryno);
        if SecondaryPCObjective.FindSet then begin
            repeat
                SecondaryPCObjective."Imported Annual Target Qty" := agreedtarget;
                SecondaryPCObjective."Assigned Weight (%)" := annualtarget;
                SecondaryPCObjective."Start Date" := startdate;
                SecondaryPCObjective."Due Date" := enddate;
                SecondaryPCObjective.Comments := comments;
                if SecondaryPCObjective.Modify(true) then begin
                    status := 'success*Additional Initiatives were successfully  submitted';
                end else begin
                    status := 'danger*Additional Initiatives were not successfully  submitted';
                end;
            until SecondaryPCObjective.Next = 0;
        end;
    end;

    procedure fnRemoveAditionalInitiative(docNo: Code[100]; entryno: Integer) status: Text
    var
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        SecondaryPCObjective.Reset;
        SecondaryPCObjective.SetRange("Workplan No.", docNo);
        SecondaryPCObjective.SetRange(EntryNo, entryno);
        if SecondaryPCObjective.FindSet then begin
            if SecondaryPCObjective.Delete(true) then begin
                status := 'success*Additional Initiative was successfully removed';
            end else begin
                status := 'danger*Additional Initiative could not be removed, kindly try again!';
            end;
        end;
    end;

    procedure FnDeleteIndividualCardSubActivities(empNo: Text[30]; scorecardNumber: Code[100]; ActivityNo: Text; EntryNumber: Integer) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SubPCObjective: Record "Sub PC Objective";
    begin
        SubPCObjective.Reset;
        SubPCObjective.SetRange("Workplan No.", scorecardNumber);
        SubPCObjective.SetRange("Initiative No.", ActivityNo);
        SubPCObjective.SetRange("Entry Number", EntryNumber);
        if SubPCObjective.FindSet then begin
            if SubPCObjective.Delete(true) then begin
                status := 'success* Individual Score Card Sub Activities was successfully Removed';
            end else begin
                status := 'danger* Individual Score Card Sub Activities was not  Removed';
            end;
        end;
    end;

    procedure FnNewIndividualCardSubActivities(scorecardNumber: Code[100]; ActivityNo: Text; subinitiative: Text; subindicator: Text; uom: Text; targets: Integer; completiondate: Date; assweight: Decimal) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SubPCObjective: Record "Sub PC Objective";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, scorecardNumber);
        if PerfomanceContractHeader.FindSet then begin
            SubPCObjective.Init;
            SubPCObjective."Workplan No." := scorecardNumber;
            SubPCObjective."Initiative No." := ActivityNo;
            SubPCObjective."Objective/Initiative" := subinitiative;
            SubPCObjective."Outcome Perfomance Indicator" := subindicator;
            SubPCObjective."Unit of Measure" := uom;
            SubPCObjective."Imported Annual Target Qty" := targets;
            SubPCObjective."Due Date" := completiondate;
            SubPCObjective."Assigned Weight (%)" := assweight;
            SubPCObjective."Strategy Plan ID" := PerfomanceContractHeader."Strategy Plan ID";
            SubPCObjective."Year Reporting Code" := PerfomanceContractHeader."Annual Reporting Code";
            if SubPCObjective.Insert(true) then begin
                status := 'success* Individual Score Card Sub Activities was successfully  submitted';
            end else begin
                status := 'danger* Individual Score Card Sub Activities was not  submitted';
            end;
        end;
    end;

    procedure FnEditIndividualCardSubActivities(scorecardNumber: Code[100]; ActivityNo: Text; lineno: Integer; subinitiative: Text; subindicator: Text; uom: Text; targets: Integer; completiondate: Date; agreedweight: Decimal) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
        SubPCObjective: Record "Sub PC Objective";
    begin
        SubPCObjective.Reset;
        SubPCObjective.SetRange("Workplan No.", scorecardNumber);
        SubPCObjective.SetRange("Initiative No.", ActivityNo);
        SubPCObjective.SetRange("Entry Number", lineno);
        if SubPCObjective.FindSet then begin
            SubPCObjective."Objective/Initiative" := subinitiative;
            SubPCObjective."Outcome Perfomance Indicator" := subindicator;
            SubPCObjective."Unit of Measure" := uom;
            SubPCObjective."Imported Annual Target Qty" := targets;
            SubPCObjective."Due Date" := completiondate;
            SubPCObjective."Assigned Weight (%)" := agreedweight;
            if SubPCObjective.Modify(true) then begin
                status := 'success* Individual Score Card Sub Activities was successfully updated';
            end else begin
                status := 'danger* Individual Score Card Sub Activities was not updated';
            end;
        end;
    end;

    procedure fnSendStaffPerformanceContractApproval(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Open);
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader."Approval Status" := PerfomanceContractHeader."approval status"::"Pending Approval";
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*Your staff perfomance contract was successfully send for approval*';
            end else begin
                status := 'danger*Your staff perfomance contract was not send for approval, kindly try again!';
            end;
        end;
    end;

    procedure fnCancelStaffPerformanceContract(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::"Pending Approval");
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader."Approval Status" := PerfomanceContractHeader."approval status"::Open;
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*Approval for staff perfomance contract was successfully cancelled*';
            end else begin
                status := 'danger*Approval for staff perfomance contract was not cancelled, kindly try again!';
            end;
        end;
    end;

    procedure fnLockStaffPerformanceContract(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Released);
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader."Change Status" := PerfomanceContractHeader."change status"::Locked;
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*The perfomance contract was successfully locked, kindy proceed to sign*';
            end else begin
                status := 'danger*The perfomance contract was not locked, kindly try again!';
            end;
        end;
    end;

    procedure fnSignStaffPerformanceContract(contractNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, contractNo);
        PerfomanceContractHeader.SetRange("Approval Status", PerfomanceContractHeader."approval status"::Released);
        PerfomanceContractHeader.SetRange("Change Status", PerfomanceContractHeader."change status"::Locked);
        if PerfomanceContractHeader.FindSet then begin
            PerfomanceContractHeader.Status := PerfomanceContractHeader.Status::Signed;
            if PerfomanceContractHeader.Modify(true) then begin
                status := 'success*The perfomance contract was successfully signed*';
            end else begin
                status := 'danger*The perfomance contract was not signed, kindly try again!';
            end;
        end else begin
            status := 'danger*You must lock the performance contract before signing!!';
        end;
        exit(status)
    end;

    procedure FnSubmitSelectedPLogCategories(strategyid: Code[100]; personalscorecardid: Code[100]; plogNumber: Code[50]; initiativeNumber: Code[50]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, plogNumber);
        if PerformanceDiaryLog.FindSet then begin
            PCObjective.Reset;
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Initiative No.", initiativeNumber);
            if PCObjective.FindSet then begin
                repeat
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Initiative No." := PCObjective."Initiative No.";
                    PlogLines.Validate("Initiative No.");
                    PlogLines."Sub Intiative No" := PCObjective."Objective/Initiative";
                    PlogLines.Description := PCObjective."Objective/Initiative";
                    if PlogLines.Insert(true) then begin
                        status := 'success*The PlogLines was successfully submitted';
                    end else begin
                        status := 'danger*The PlogLines was successfully submitted';
                    end;
                until PCObjective.Next = 0;
            end;
        end;
    end;

    procedure FnNewPerformanceLogEntry(docNo: Code[100]; empNo: Text[30]; scorecardNumber: Code[100]; description: Text) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange("Employee No.", empNo);
        PerformanceDiaryLog.SetRange(No, docNo);
        PerformanceDiaryLog.SetRange("Approval Status", PerformanceDiaryLog."approval status"::Open);
        PerformanceDiaryLog.SetRange(Posted, false);
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog."Personal Scorecard ID" := scorecardNumber;
            PerformanceDiaryLog.Validate("Personal Scorecard ID");
            PerformanceDiaryLog.Description := description;
            if PerformanceDiaryLog.Modify(true) then begin
                ;
                //FnSuggestPlogLines(PerformanceDiaryLog.No,PerformanceDiaryLog."CSP ID",scorecardNumber,empNo);
                //fnSuggestPlogandSubPlogData(PerformanceDiaryLog.No);
                status := 'success* Performance Diary Logs was successfully updated*' + PerformanceDiaryLog.No + '*' + PerformanceDiaryLog."CSP ID" + '*' + PerformanceDiaryLog."Personal Scorecard ID";
            end else begin
                status := 'danger* Performance Diary Logs Was not successfully updated*' + PerformanceDiaryLog.No;
            end;
        end else begin
            //---//
            //  PerformanceDiaryLog.RESET;
            //  PerformanceDiaryLog.SETRANGE("Employee No.",empNo);
            //  PerformanceDiaryLog.SETRANGE("Approval Status",PerformanceDiaryLog."Approval Status"::Open);
            //  IF PerformanceDiaryLog.FINDSET THEN BEGIN
            //    ERROR:='You have an open performance log, kindly re-use it!';
            //  END;
            PerformanceDiaryLog.Init;
            PerformanceDiaryLog."Employee No." := empNo;
            PerformanceDiaryLog.Validate("Employee No.");
            PerformanceDiaryLog."Personal Scorecard ID" := scorecardNumber;
            PerformanceDiaryLog.Validate("Personal Scorecard ID");
            PerformanceDiaryLog.Description := description;
            PerformanceDiaryLog."Approval Status" := PerformanceDiaryLog."approval status"::Open;
            if PerformanceDiaryLog.Insert(true) then begin
                fnSuggestPlogandSubPlogData(PerformanceDiaryLog.No);
                status := 'success* Performance Diary Logs was successfully submitted*' + PerformanceDiaryLog.No;
            end else begin
                status := 'danger* Performance Diary Logs was not successfully submitted*';
            end;
        end;
    end;

    procedure fnGetPlogLines(docNo: Code[100]; empNo: Code[100]) PlogData: Text
    var
        PlogLines: Record "Plog Lines";
    begin
        PlogLines.Reset;
        PlogLines.SetRange("PLog No.", docNo);
        PlogLines.SetRange("Employee No.", empNo);
        if PlogLines.FindSet then begin
            repeat
                PlogData := PlogData + Format(PlogLines.EntryNo) + '*' + Format(PlogLines."PLog No.") + '*' + Format(PlogLines."Initiative No.") + '*' + Format(PlogLines."Personal Scorecard ID") + '*' + Format(PlogLines."Sub Intiative No") + '*' +
                Format(PlogLines."Weight %") + '*' + Format(PlogLines."Achieved Date") + '*' + Format(PlogLines."Target Qty") + '*' + Format(PlogLines."Q1 Achieved Target") + '*' + Format(PlogLines."Q2 Achieved Target") + '*' +
                Format(PlogLines."Q3 AchievedTarget") + '*' + Format(PlogLines."Q4 Achieved Target") + '*' + Format(PlogLines."Achieved Target") + '*' + Format(PlogLines.Comments) + '*' + Format(PlogLines."Achieved Weight(%)") + ':';
            until PlogLines.Next = 0;
        end;
        exit(PlogData)
    end;

    procedure fnGetSubPlogLines(plogNo: Code[100]; initiativeNo: Code[100]; pcNo: Code[100]) PlogData: Text
    var
        SubPlogLines: Record "Sub Plog Lines";
    begin
        SubPlogLines.Reset;
        SubPlogLines.SetRange("PLog No.", plogNo);
        SubPlogLines.SetRange("Initiative No.", initiativeNo);
        SubPlogLines.SetRange("Personal Scorecard ID", pcNo);
        if SubPlogLines.FindSet then begin
            repeat
                PlogData := PlogData + Format(SubPlogLines.EntryNo) + '*' + Format(SubPlogLines.Description) + '*' + Format(SubPlogLines."Achieved Date") + '*' + Format(SubPlogLines."Target Qty") + '*' + Format(SubPlogLines."Achieved Target") + '*' +
                Format(SubPlogLines.Comments) + '*' + Format(SubPlogLines."Weight %") + ':';
            until SubPlogLines.Next = 0;
        end;
        exit(PlogData)
    end;

    procedure FnSuggestPlogLines(docNo: Code[100]; strategyid: Code[100]; personalscorecardid: Code[100]; empNumber: Code[100]) status: Text
    var
        PlogLines: Record "Plog Lines";
        PerformanceDiaryLog: Record "Performance Diary Log";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        StrategicInitiative: Record "PC Objective";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetFilter(No, '<>%1', '');
        PerformanceDiaryLog.SetRange(No, docNo);
        PerformanceDiaryLog.SetRange("Employee No.", empNumber);
        PerformanceDiaryLog.SetRange("Personal Scorecard ID", personalscorecardid);
        PerformanceDiaryLog.SetRange("CSP ID", strategyid);
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog.TestField("Employee No.");
            PerformanceDiaryLog.TestField("Personal Scorecard ID");
            PerformanceDiaryLog.TestField("Activity Start Date");
            PerformanceDiaryLog.TestField("Activity End Date");
            PCObjective.Reset;
            PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
            PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
            if PCObjective.FindSet then begin
                repeat
                    PlogLines.Init;
                    PlogLines."PLog No." := PerformanceDiaryLog.No;
                    PlogLines."Initiative No." := PCObjective."Initiative No.";
                    PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                    PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                    PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                    PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                    PlogLines.Validate("Initiative No.");
                    if PlogLines.Insert(true) then begin
                        status := 'success*The PlogLines was successfully submitted';
                    end else begin
                        status := 'danger*The PlogLines was not successfully submitted';
                    end;
                until PCObjective.Next = 0;
            end;
        end;
        SecondaryPCObjective.Reset;
        SecondaryPCObjective.SetRange("Strategy Plan ID", strategyid);
        SecondaryPCObjective.SetRange("Workplan No.", personalscorecardid);
        if SecondaryPCObjective.FindFirst then begin
            repeat
                PlogLines.Init;
                PlogLines."PLog No." := PerformanceDiaryLog.No;
                PlogLines."Activity Type" := PlogLines."activity type"::"Secondary Activity";
                PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                PlogLines."Initiative No." := SecondaryPCObjective."Initiative No.";
                PlogLines.Validate("Initiative No.");
                if PlogLines.Insert(true) then begin
                    status := 'success*The PlogLines was successfully submitted';
                end else begin
                    status := 'danger*The PlogLines was not successfully submitted';
                end;
            until SecondaryPCObjective.Next = 0;
        end;
    end;

    procedure fnSuggestPlogandSubPlogData(docNo: Code[100])
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
        PlogLines: Record "Plog Lines";
        PCObjective: Record "PC Objective";
        SecondaryPCObjective: Record "Secondary PC Objective";
        SubPlogLines: Record "Sub Plog Lines";
        SubPCObjective: Record "Sub PC Objective";
        SPMGeneralSetup: Record "SPM General Setup";
        PCJobDescription: Record "PC Job Description";
        SubJDObjective: Record "Sub JD Objective";
    begin
        // PerformanceDiaryLog.TESTFIELD("Employee No.");
        // PerformanceDiaryLog.TESTFIELD("Personal Scorecard ID");
        // PerformanceDiaryLog.TESTFIELD("Activity Start Date");
        // PerformanceDiaryLog.TESTFIELD("Activity End Date");
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, docNo);
        if PerformanceDiaryLog.FindSet then begin
            SPMGeneralSetup.Get();
            if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                PCObjective.Reset;
                PCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
                PCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                PCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");//Commented for Kerra
                if PCObjective.FindSet then begin
                    repeat
                        PCObjective.CalcFields("Individual Achieved Targets");
                        PCObjective.TestField("Due Date");
                        //PCObjective.TESTFIELD("Imported Annual Target Qty");
                        PlogLines.Init;
                        PlogLines."PLog No." := PerformanceDiaryLog.No;
                        PlogLines."Activity Type" := PlogLines."activity type"::"Primary Activity";
                        PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                        PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                        PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                        PlogLines."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                        //PlogLines."Key Performance Indicator":=PCObjective."Outcome Perfomance Indicator";
                        PlogLines."Initiative No." := PCObjective."Initiative No.";
                        PlogLines."Unit of Measure" := PCObjective."Unit of Measure";
                        //MESSAGE('PCObjective."Assigned Weight (%)" is %1',PCObjective."Assigned Weight (%)");
                        PlogLines."Weight %" := PCObjective."Assigned Weight (%)";
                        PlogLines.Validate("Initiative No.");
                        PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                        PlogLines.Insert;

                        //Sub Activities
                        SubPCObjective.Reset;
                        SubPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                        SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                        if SubPCObjective.FindSet then begin
                            repeat
                                SubPlogLines.Init;
                                SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                                SubPlogLines."Activity Type" := SubPlogLines."activity type"::"Primary Activity";
                                SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                                SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                                SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                                SubPlogLines."Initiative No." := SubPCObjective."Initiative No.";
                                SubPlogLines."Sub Activity No." := SubPCObjective."Outcome Perfomance Indicator";
                                SubPlogLines.Description := SubPCObjective."Objective/Initiative";
                                SubPlogLines."Sub Activity No." := SubPCObjective."Sub Initiative No.";
                                SubPlogLines."Unit of Measure" := SubPCObjective."Unit of Measure";
                                SubPlogLines."Planned Date" := SubPCObjective."Due Date";
                                SubPlogLines."Target Qty" := SubPCObjective."Imported Annual Target Qty";
                                SubPlogLines."Weight %" := SubPCObjective."Assigned Weight (%)";
                                //SubPlogLines.VALIDATE("Initiative No.");
                                //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                                if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Activity No.", SubPlogLines."Personal Scorecard ID") then
                                    SubPlogLines.Insert(true);
                            until SubPCObjective.Next = 0;
                        end;

                    until PCObjective.Next = 0;
                end;

                SecondaryPCObjective.Reset;
                SecondaryPCObjective.SetRange("Strategy Plan ID", PerformanceDiaryLog."CSP ID");
                SecondaryPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                SecondaryPCObjective.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
                if SecondaryPCObjective.FindFirst then begin
                    repeat
                        SecondaryPCObjective.CalcFields("Individual Achieved Targets");
                        SecondaryPCObjective.TestField("Due Date");
                        //SecondaryPCObjective.TESTFIELD("Imported Annual Target Qty");
                        PlogLines.Init;
                        PlogLines."PLog No." := PerformanceDiaryLog.No;
                        PlogLines."Activity Type" := PlogLines."activity type"::"Secondary Activity";
                        PlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                        PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                        PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                        PlogLines."Initiative No." := SecondaryPCObjective."Initiative No.";
                        //MESSAGE('SecondaryPCObjective."Assigned Weight (%)" is %1',SecondaryPCObjective."Assigned Weight (%)");
                        PlogLines."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                        PlogLines.Validate("Initiative No.");
                        PlogLines."Remaining Targets" := PCObjective."Imported Annual Target Qty" - PCObjective."Individual Achieved Targets";
                        PlogLines.Insert;

                        //Sub Activities
                        SubPCObjective.Reset;
                        SubPCObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                        SubPCObjective.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                        if SubPCObjective.FindSet then begin
                            repeat
                                SubPlogLines.Init;
                                SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                                SubPlogLines."Activity Type" := SubPlogLines."activity type"::"Primary Activity";
                                SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                                SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                                SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                                SubPlogLines."Initiative No." := SubPCObjective."Initiative No.";
                                SubPlogLines."Sub Activity No." := SubPCObjective."Outcome Perfomance Indicator";
                                SubPlogLines.Description := SubPCObjective."Objective/Initiative";
                                SubPlogLines."Sub Activity No." := SubPCObjective."Sub Initiative No.";
                                SubPlogLines."Unit of Measure" := SubPCObjective."Unit of Measure";
                                SubPlogLines."Planned Date" := SubPCObjective."Due Date";
                                SubPlogLines."Target Qty" := SubPCObjective."Imported Annual Target Qty";
                                SubPlogLines."Weight %" := SubPCObjective."Assigned Weight (%)";
                                //SubPlogLines.VALIDATE("Initiative No.");
                                //SubPlogLines."Remaining Targets":=SubPCObjective."Imported Annual Target Qty"- SubPCObjective."Individual Achieved Targets";
                                if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Activity No.", SubPlogLines."Personal Scorecard ID") then
                                    SubPlogLines.Insert(true);
                            until SubPCObjective.Next = 0;
                        end;
                    until SecondaryPCObjective.Next = 0;
                end;
            end;

            if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                PCJobDescription.Reset;
                PCJobDescription.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                PCJobDescription.SetRange("Due Date", PerformanceDiaryLog."Activity Start Date", PerformanceDiaryLog."Activity End Date");
                if PCJobDescription.FindFirst then begin
                    repeat
                        PCJobDescription.CalcFields("Individual Achieved Targets");
                        PCJobDescription.TestField("Due Date");
                        //PCJobDescription.TESTFIELD("Imported Annual Target Qty");
                        PlogLines.Init;
                        PlogLines."PLog No." := PerformanceDiaryLog.No;
                        PlogLines."Activity Type" := PlogLines."activity type"::"JD Activity";
                        PlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                        PlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                        PlogLines."Initiative No." := Format(PCJobDescription."Line Number");
                        PlogLines."Sub Intiative No" := PCJobDescription.Description;
                        PlogLines."Planned Date" := PCJobDescription."Start Date";
                        PlogLines."Achieved Date" := PerformanceDiaryLog."Document Date";
                        PlogLines."Due Date" := PCJobDescription."Due Date";
                        PlogLines."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                        PlogLines."Weight %" := PCJobDescription."Assigned Weight (%)";
                        PlogLines."Remaining Targets" := PCJobDescription."Imported Annual Target Qty" - PCJobDescription."Individual Achieved Targets";
                        PlogLines.Insert;
                        //Sub JD Plog Lines
                        SubJDObjective.Reset;
                        SubJDObjective.SetRange("Workplan No.", PerformanceDiaryLog."Personal Scorecard ID");
                        SubJDObjective.SetRange("Line Number", PCJobDescription."Line Number");
                        if SubJDObjective.FindSet then begin
                            repeat
                                SubPlogLines.Init;
                                SubPlogLines."PLog No." := PerformanceDiaryLog.No;
                                SubPlogLines."Activity Type" := SubPlogLines."activity type"::"JD Activity";
                                SubPlogLines."Strategy Plan ID" := PerformanceDiaryLog."CSP ID";
                                SubPlogLines."Personal Scorecard ID" := PerformanceDiaryLog."Personal Scorecard ID";
                                SubPlogLines."Employee No." := PerformanceDiaryLog."Employee No.";
                                SubPlogLines."Initiative No." := SubJDObjective."Line Number";
                                SubPlogLines."Sub Activity No." := SubJDObjective."Sub Initiative No.";
                                SubPlogLines.Description := SubJDObjective.Description;
                                SubPlogLines."Unit of Measure" := SubJDObjective."Unit of Measure";
                                SubPlogLines."Planned Date" := SubJDObjective."Due Date";
                                SubPlogLines."Target Qty" := SubJDObjective."Imported Annual Target Qty";
                                SubPlogLines."Due Date" := SubJDObjective."Due Date";
                                if not SubPlogLines.Get(SubPlogLines."PLog No.", SubPlogLines."Initiative No.", SubPlogLines."Sub Activity No.", SubPlogLines."Personal Scorecard ID") then
                                    SubPlogLines.Insert(true);
                            until SubJDObjective.Next = 0;
                        end;
                    until PCJobDescription.Next = 0;
                end;
            end;
        end;
    end;

    procedure FnUpdatePerformanceTargetLinesDetails(docNo: Code[100]; entryNumber: Integer; agreedTarget: Decimal; comments: Text) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
        PlogLines: Record "Plog Lines";
    begin
        PlogLines.Reset;
        PlogLines.SetRange(EntryNo, entryNumber);
        PlogLines.SetRange("PLog No.", docNo);
        if PlogLines.FindSet then begin
            PlogLines."Achieved Target" := agreedTarget;
            PlogLines.Comments := comments;
            if PlogLines.Modify(true) then begin
                status := 'success*Performance Target Details was successfully updated';
            end else begin
                status := 'danger*Performance Target Details Was not successfully updated';
            end;
        end;
    end;

    procedure FnRemovePerformanceLogLine(docNo: Code[100]; entryNumber: Integer) status: Text
    var
        PcLines: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        PCObjective: Record "PC Objective";
        performanceContractHeader: Record "Perfomance Contract Header";
        PlogLines: Record "Plog Lines";
    begin
        PlogLines.Reset;
        PlogLines.SetRange(EntryNo, entryNumber);
        PlogLines.SetRange("PLog No.", docNo);
        if PlogLines.FindSet then begin
            if PlogLines.Delete(true) then begin
                status := 'success*Performance update line was successfully removed';
            end else begin
                status := 'danger*Performance update line was not removed, kindly try again!!';
            end;
        end;
    end;

    procedure fnInsertPlogSubActivities(entryNo: Integer; plogno: Code[100]; initiativeno: Code[100]; pcid: Code[100]; achievedtarget: Decimal; comments: Text) status: Text
    var
        SubPlogLines: Record "Sub Plog Lines";
        PlogLines: Record "Plog Lines";
        SubPlogLines1: Record "Sub Plog Lines";
        TotalTarget: Decimal;
        TotalWeight: Decimal;
    begin
        SubPlogLines.Reset;
        SubPlogLines.SetRange(EntryNo, entryNo);
        SubPlogLines.SetRange("PLog No.", plogno);
        SubPlogLines.SetRange("Initiative No.", initiativeno);
        SubPlogLines.SetRange("Personal Scorecard ID", pcid);
        if SubPlogLines.FindSet then begin
            SubPlogLines."Achieved Target" := achievedtarget;
            SubPlogLines.Comments := comments;
            if SubPlogLines.Modify(true) then begin
                PlogLines.Reset;
                PlogLines.SetRange("PLog No.", plogno);
                PlogLines.SetRange("Initiative No.", initiativeno);
                if PlogLines.FindSet then begin
                    //      SubPlogLines.RESET;
                    //      SubPlogLines.SETRANGE("PLog No.",PlogLines."PLog No.");
                    //      SubPlogLines.SETRANGE("Employee No.",PlogLines."Employee No.");
                    //      SubPlogLines.SETRANGE("Personal Scorecard ID",PlogLines."Personal Scorecard ID");
                    //      SubPlogLines.SETRANGE("Strategy Plan ID",PlogLines."Strategy Plan ID");
                    //      SubPlogLines.SETRANGE("Initiative No.",PlogLines."Initiative No.");
                    //      SubPlogLines.CALCSUMS("Target Qty");
                    //      IF SubPlogLines."Target Qty">PlogLines."Target Qty" THEN
                    //         ERROR('Total Sub Activity Targets %1 should be equal to Activity Target %2 ',
                    //               SubPlogLines."Target Qty",PlogLines."Target Qty");


                    SubPlogLines.Reset;
                    SubPlogLines.SetRange("PLog No.", PlogLines."PLog No.");
                    SubPlogLines.SetRange("Employee No.", PlogLines."Employee No.");
                    SubPlogLines.SetRange("Personal Scorecard ID", PlogLines."Personal Scorecard ID");
                    SubPlogLines.SetRange("Strategy Plan ID", PlogLines."Strategy Plan ID");
                    SubPlogLines.SetRange("Initiative No.", PlogLines."Initiative No.");
                    SubPlogLines.CalcSums("Achieved Target");

                    PlogLines."Achieved Target" := SubPlogLines."Achieved Target";
                    TotalWeight := ((PlogLines."Achieved Target" / PlogLines."Target Qty") * 100) * (PlogLines."Weight %" / 100);
                    if TotalWeight > PlogLines."Weight %" then
                        TotalWeight := PlogLines."Weight %";

                    PlogLines."Achieved Weight(%)" := TotalWeight;
                    PlogLines.Modify(true);
                end;
                status := 'success*The plog sub activity has been saved successfully';
            end else begin
                status := 'danger*The plog sub activity was not saved successfully, kindly try again!';
            end;
        end;
    end;

    procedure fnSendPlogApproval(contractNo: Code[100]) status: Text
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, contractNo);
        PerformanceDiaryLog.SetRange("Approval Status", PerformanceDiaryLog."approval status"::Open);
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog."Approval Status" := PerformanceDiaryLog."approval status"::"Pending Approval";
            if PerformanceDiaryLog.Modify(true) then begin
                status := 'success*Your performance update was successfully send for approval*';
            end else begin
                status := 'danger*Your performance update was not send for approval, kindly try again!';
            end;
        end else begin
            status := 'danger*Sorry, you have already sent your performance diary for approval.';
        end;
    end;

    procedure fnCancelPlogApproval(contractNo: Code[100]) status: Text
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, contractNo);
        PerformanceDiaryLog.SetRange("Approval Status", PerformanceDiaryLog."approval status"::"Pending Approval");
        if PerformanceDiaryLog.FindSet then begin
            PerformanceDiaryLog."Approval Status" := PerformanceDiaryLog."approval status"::Open;
            if PerformanceDiaryLog.Modify(true) then begin
                status := 'success*Approval for performance update was successfully cancelled*';
            end else begin
                status := 'danger*Approval for performance update was not cancelled, kindly try again!';
            end;
        end;
    end;

    procedure FnNewStandardAppraisal(docNo: Code[100]; empNo: Code[100]; strategicPlan: Code[100]; Pmp: Code[100]; Tasks: Code[100]; supervisor: Code[100]; description: Text; personalSC: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        PerfomanceEvaluation.SetRange("Employee No.", empNo);
        PerfomanceEvaluation.SetRange("Approval Status", PerfomanceEvaluation."approval status"::Open);
        if PerfomanceEvaluation.FindSet then begin
            PerfomanceEvaluation."Strategy Plan ID" := strategicPlan;
            PerfomanceEvaluation.Validate("Strategy Plan ID");
            PerfomanceEvaluation."Performance Mgt Plan ID" := Pmp;
            PerfomanceEvaluation.Validate("Performance Mgt Plan ID");
            PerfomanceEvaluation."Performance Task ID" := Tasks;
            PerfomanceEvaluation.Validate("Performance Task ID");
            PerfomanceEvaluation."Personal Scorecard ID" := personalSC;
            PerfomanceEvaluation.Validate("Personal Scorecard ID");
            PerfomanceEvaluation."Supervisor Staff No." := supervisor;
            PerfomanceEvaluation.Validate("Supervisor Staff No.");
            PerfomanceEvaluation.Description := description;
            if PerfomanceEvaluation.Modify(true) then begin
                FnLoadCompetencies(PerfomanceEvaluation.No);
                FnAppraisalSuggestObjectivesOutcomes(PerfomanceEvaluation.No);
                status := 'success*New appraisal created*' + PerfomanceEvaluation.No;
            end else begin
                status := 'danger*New appraisal was not created*';
            end;
        end else begin
            PerfomanceEvaluation.Init;
            PerfomanceEvaluation."Employee No." := empNo;
            PerfomanceEvaluation.Validate("Employee No.");
            PerfomanceEvaluation."Strategy Plan ID" := strategicPlan;
            PerfomanceEvaluation.Validate("Strategy Plan ID");
            PerfomanceEvaluation."Performance Mgt Plan ID" := Pmp;
            PerfomanceEvaluation.Validate("Performance Mgt Plan ID");
            PerfomanceEvaluation."Performance Task ID" := Tasks;
            PerfomanceEvaluation.Validate("Performance Task ID");
            PerfomanceEvaluation."Personal Scorecard ID" := personalSC;
            PerfomanceEvaluation.Validate("Personal Scorecard ID");
            PerfomanceEvaluation."Supervisor Staff No." := supervisor;
            PerfomanceEvaluation.Validate("Supervisor Staff No.");
            PerfomanceEvaluation.Description := description;
            if PerfomanceEvaluation.Insert(true) then begin
                FnLoadCompetencies(PerfomanceEvaluation.No);
                FnAppraisalSuggestObjectivesOutcomes(PerfomanceEvaluation.No);
                status := 'success*New appraisal created*' + PerfomanceEvaluation.No;
            end else begin
                status := 'danger*New appraisal was not created*';
            end;
        end;
    end;

    procedure FnLoadCompetencies(docNo: Code[100]) status: Text
    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        SPMGeneralSetup: Record "SPM General Setup";
        AchievedTarget: Decimal;
        PlogLines: Record "Plog Lines";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PCJobDescription: Record "PC Job Description";
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            CompetencyLines.Reset;
            CompetencyLines.SetRange("Competency Template ID", PerfomanceEvaluation."Competency Template ID");
            CompetencyLines.SetRange("Job Grade", PerfomanceEvaluation."Current Grade");
            if CompetencyLines.FindSet then begin
                repeat
                    ProEvaluation.Init;
                    ProEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                    ProEvaluation."Line No" := FnGetLastLineNoB + 1;
                    ProEvaluation."Competency Template ID" := PerfomanceEvaluation."Competency Template ID";
                    ProEvaluation."Competency Code" := CompetencyLines."Competency Code";
                    ProEvaluation.Validate("Competency Code");
                    ProEvaluation."Competency Category" := CompetencyLines."Competency Category";
                    ProEvaluation."Competency Description" := CompetencyLines."Competency Description";
                    ProEvaluation.Description := CompetencyLines.Description;
                    ProEvaluation."Profiency Rating Scale" := PerfomanceEvaluation."Proficiency Rating Scale";
                    ProEvaluation."Target Qty" := CompetencyLines."Weight %";
                    ProEvaluation."Weight %" := CompetencyLines."Weight %";
                    if ProEvaluation.Insert(true) then begin
                        status := 'success*success*';
                    end else begin
                        status := 'danger*failed*';
                    end;
                until CompetencyLines.Next = 0;
            end;
        end;
    end;

    procedure FnAddEvaluationPIP(docNo: Code[100]; category: Code[100]; description: Text) status: Text
    var
        EvaluationPIP: Record "Evaluation PIP";
    begin
        EvaluationPIP.Init;
        EvaluationPIP."Perfomance Evaluation No" := docNo;
        EvaluationPIP."PIP Category" := category;
        EvaluationPIP.Description := description;
        if EvaluationPIP.Insert(true) then begin
            status := 'success*Evaluation PIP has been added successfully';
        end else begin
            status := 'danger*Evaluation PIP was not saved, please try again!';
        end;
    end;

    procedure fnGenerateStandardAppraisalReport(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            if FILE.Exists(FILESPATH14 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH14 + docNo + '.pdf');
                Report.SaveAsPdf(80016, FILESPATH14 + docNo + '.pdf', PerfomanceEvaluation);
                status := 'success*Generated*Downloads\StandardAppraisalReport\' + docNo + '.pdf';
            end else begin
                Report.SaveAsPdf(80016, FILESPATH14 + docNo + '.pdf', PerfomanceEvaluation);
                status := 'success*Generated*Downloads\StandardAppraisalReport\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGeneratePlogReport(docNo: Code[100]) status: Text
    var
        PerformanceDiaryLog: Record "Performance Diary Log";
    begin
        PerformanceDiaryLog.Reset;
        PerformanceDiaryLog.SetRange(No, docNo);
        if PerformanceDiaryLog.FindSet then begin
            if FILE.Exists(FILESPATH15 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH15 + docNo + '.pdf');
                Report.SaveAsPdf(80011, FILESPATH15 + docNo + '.pdf', PerformanceDiaryLog);
                status := 'success*Generated*finance\PlogReport\' + docNo + '.pdf';
            end else begin
                Report.SaveAsPdf(80011, FILESPATH15 + docNo + '.pdf', PerformanceDiaryLog);
                status := 'success*Generated*finance\PlogReport\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateIndividualPcReport(docNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, docNo);
        if PerfomanceContractHeader.FindSet then begin
            if FILE.Exists(FILESPATH16 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH16 + docNo + '.pdf');
                Report.SaveAsPdf(80007, FILESPATH16 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*finance\IndividualPCReport\' + docNo + '.pdf';
            end else begin
                Report.SaveAsPdf(80007, FILESPATH16 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*finance\IndividualPCReport\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateIndividualPcSubIndicatorReport(docNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, docNo);
        if PerfomanceContractHeader.FindSet then begin
            if FILE.Exists(FILESPATH24 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH24 + docNo + '.pdf');
                Report.SaveAsPdf(80024, FILESPATH24 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\IndividualSubIndicator\' + docNo + '.pdf';
            end else begin
                Report.SaveAsPdf(80024, FILESPATH24 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*Downloads\IndividualSubIndicator\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnInsertJDTargets(lineno: Code[100]; workplanno: Code[100]; annualtarget: Integer; assignedtarget: Integer) status: Text
    var
        PCJobDescription: Record "PC Job Description";
    begin
        PCJobDescription.Reset;
        PCJobDescription.SetRange("Line Number", lineno);
        PCJobDescription.SetRange("Workplan No.", workplanno);
        if PCJobDescription.FindSet then begin
            PCJobDescription."Start Date" := Today;
            PCJobDescription."Due Date" := Today;
            PCJobDescription."Imported Annual Target Qty" := annualtarget;
            PCJobDescription."Assigned Weight (%)" := assignedtarget;
            if PCJobDescription.Modify(true) then begin
                status := 'success*Your Plog target were submitted successfully!*';
            end else begin
                status := 'danger*Your Plog target were not saved successfully, kindly try again!*';
            end;
        end;
    end;

    procedure FnSuggestJD(workplan: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
        SpmGeneralSetup: Record "SPM General Setup";
        JobResponsibilities: Record "Positions Responsibility";
        PCJobDescription: Record "PC Job Description";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, workplan);
        if PerfomanceContractHeader.FindSet then begin
            JobResponsibilities.Reset;
            JobResponsibilities.SetRange("Position ID", PerfomanceContractHeader.Position);
            if JobResponsibilities.Find('-') then begin
                repeat
                    PCJobDescription.Init;
                    PCJobDescription."Workplan No." := PerfomanceContractHeader.No;
                    PCJobDescription."Line Number" := Format(JobResponsibilities."Line No");
                    PCJobDescription.Validate("Line Number");
                    PCJobDescription.Description := JobResponsibilities.Description;
                    PCJobDescription."Primary Department" := PerfomanceContractHeader."Responsibility Center";
                    PCJobDescription.Validate("Primary Department");
                    PCJobDescription."Start Date" := PerfomanceContractHeader."Start Date";
                    PCJobDescription."Due Date" := PerfomanceContractHeader."End Date";
                    PCJobDescription.Insert(true);
                until JobResponsibilities.Next = 0;
            end;
        end;
    end;

    procedure fnGetAnnualWorkplanLines(csp: Code[100]; annualcode: Code[100]) AnnualLines: Text
    var
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
    begin
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange("Strategy Plan ID", csp);
        StrategyWorkplanLines.SetRange("Year Reporting Code", annualcode);
        if StrategyWorkplanLines.FindSet then begin
            repeat
                AnnualLines := AnnualLines + '*' + StrategyWorkplanLines."Activity ID" + '*' + StrategyWorkplanLines.Description + '*' + StrategyWorkplanLines."Primary Directorate Name" + ':';
            until StrategyWorkplanLines.Next = 0;
        end;
        exit(AnnualLines);
    end;

    procedure fnInsertSelectedAdditionalActivities(csp: Code[100]; annualcode: Code[100]; personalPc: Code[100]; activityID: Code[100]) status: Text
    var
        SecondaryPCObjective: Record "Secondary PC Objective";
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        StrategyWorkplanLines.Reset;
        StrategyWorkplanLines.SetRange("Activity ID", activityID);
        StrategyWorkplanLines.SetRange("Strategy Plan ID", csp);
        StrategyWorkplanLines.SetRange("Year Reporting Code", annualcode);
        if StrategyWorkplanLines.FindSet then begin
            PerfomanceContractHeader.Reset;
            PerfomanceContractHeader.SetRange(No, personalPc);
            if PerfomanceContractHeader.FindSet then begin
                SecondaryPCObjective.Init;
                SecondaryPCObjective."Workplan No." := personalPc;
                SecondaryPCObjective."Initiative No." := activityID;
                SecondaryPCObjective."Strategy Plan ID" := StrategyWorkplanLines."Strategy Plan ID";
                SecondaryPCObjective."Year Reporting Code" := StrategyWorkplanLines."Year Reporting Code";
                SecondaryPCObjective."Primary Directorate" := StrategyWorkplanLines."Primary Directorate";
                SecondaryPCObjective."Unit of Measure" := StrategyWorkplanLines."Unit of Measure";
                SecondaryPCObjective."Outcome Perfomance Indicator" := StrategyWorkplanLines."Perfomance Indicator";
                SecondaryPCObjective."Objective/Initiative" := StrategyWorkplanLines.Description;
                SecondaryPCObjective."Start Date" := PerfomanceContractHeader."Start Date";
                SecondaryPCObjective."Due Date" := PerfomanceContractHeader."End Date";
                if SecondaryPCObjective.Insert(true) then begin
                    status := 'success*Inserted';
                end else begin
                    status := 'danger*Inserted';
                end;
            end;
        end;
    end;

    procedure fnGenerateCSPReport(docNo: Code[100]) status: Text
    var
        CorporateStrategicPlans: Record "Corporate Strategic Plans";
    begin
        CorporateStrategicPlans.Reset;
        CorporateStrategicPlans.SetRange(Code, docNo);
        if CorporateStrategicPlans.FindSet then begin
            if FILE.Exists(FILESPATH17 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH17 + docNo + '.pdf');
                Report.SaveAsPdf(80001, FILESPATH17 + docNo + '.pdf', CorporateStrategicPlans);
                status := 'success*Generated*finance\CSP\' + docNo + '.pdf';
            end else begin
                Report.SaveAsPdf(80001, FILESPATH17 + docNo + '.pdf', CorporateStrategicPlans);
                status := 'success*Generated*finance\CSP\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateAWPReport(docNo: Code[100]) status: Text
    var
        AnnualStrategyWorkplan: Record "Annual Strategy Workplan";
    begin
        AnnualStrategyWorkplan.Reset;
        AnnualStrategyWorkplan.SetRange(No, docNo);
        if AnnualStrategyWorkplan.FindSet then begin
            if FILE.Exists(FILESPATH18 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH18 + docNo + '.pdf');
                Report.SaveAsPdf(80002, FILESPATH18 + docNo + '.pdf', AnnualStrategyWorkplan);
                status := 'success*Generated*finance\AWP\' + docNo + '.pdf';
            end else begin
                Report.SaveAsPdf(80002, FILESPATH18 + docNo + '.pdf', AnnualStrategyWorkplan);
                status := 'success*Generated*finance\AWP\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnGenerateBoardPCReport(docNo: Code[100]) status: Text
    var
        PerfomanceContractHeader: Record "Perfomance Contract Header";
    begin
        PerfomanceContractHeader.Reset;
        PerfomanceContractHeader.SetRange(No, docNo);
        if PerfomanceContractHeader.FindSet then begin
            if FILE.Exists(FILESPATH19 + docNo + '.pdf') then begin
                FILE.Erase(FILESPATH19 + docNo + '.pdf');
                Report.SaveAsPdf(80019, FILESPATH19 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*finance\BoardPC\' + docNo + '.pdf';
            end else begin
                Report.SaveAsPdf(80019, FILESPATH19 + docNo + '.pdf', PerfomanceContractHeader);
                status := 'success*Generated*finance\BoardPC\' + docNo + '.pdf';
            end
        end else begin
            status := 'danger*The Report could not be generated';
        end;
    end;

    procedure fnSubmitStandardAppraisal(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            PerfomanceEvaluation."Document Status" := PerfomanceEvaluation."document status"::Evaluation;
            PerfomanceEvaluation."Approval Status" := PerfomanceEvaluation."approval status"::Released;
            if PerfomanceEvaluation.Modify(true) then begin
                status := 'success*Your appraisal has been sent to your supervisor for review';
            end else begin
                status := 'danger*Your appraisal could not be sent to your supervisor for review, kindy try again!';
            end;
        end;
    end;

    procedure fnCancelSubmitofStandardAppraisal(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            PerfomanceEvaluation."Document Status" := PerfomanceEvaluation."document status"::Draft;
            PerfomanceEvaluation."Approval Status" := PerfomanceEvaluation."approval status"::Open;
            if PerfomanceEvaluation.Modify(true) then begin
                status := 'success*Your appraisal submission to your supervisor was successfully cancelled';
            end else begin
                status := 'danger*Your appraisal submission to your supervisor was not cancelled, kindy try again!';
            end;
        end;
    end;

    procedure fnSubmitStandardAppraisalObj(docNo: Code[100]; lineno: Integer; appraiserQty: Decimal; comments: Text) status: Text
    var
        ObjectiveEvaluationResult: Record "Objective Evaluation Result";
        tDoc: Code[100];
    begin
        ObjectiveEvaluationResult.Reset;
        ObjectiveEvaluationResult.SetRange("Line No", lineno);
        ObjectiveEvaluationResult.SetRange("Performance Evaluation ID", docNo);
        if ObjectiveEvaluationResult.FindSet then begin
            ObjectiveEvaluationResult."AppraiserReview Qty" := appraiserQty;
            ObjectiveEvaluationResult."Final/Actual Qty" := appraiserQty;
            ObjectiveEvaluationResult.Comments := comments;
            if ObjectiveEvaluationResult.Modify(true) then begin
                status := 'success*Employee appraisal has been submitted successfully';
            end else begin
                status := 'danger*Employee appraisal could not be submitted, kindy try again!';
            end;
        end;
    end;

    procedure fnSubmitStandardAppraisalPE(docNo: Code[100]; lineno: Integer; appraiserQty: Decimal; comments: Text) status: Text
    var
        ProficiencyEvaluationResult: Record "Proficiency Evaluation Result";
        tDoc: Code[100];
    begin
        ProficiencyEvaluationResult.Reset;
        ProficiencyEvaluationResult.SetRange("Line No", lineno);
        ProficiencyEvaluationResult.SetRange("Performance Evaluation ID", docNo);
        if ProficiencyEvaluationResult.FindSet then begin
            ProficiencyEvaluationResult."AppraiserReview Qty" := appraiserQty;
            ProficiencyEvaluationResult."Final/Actual Qty" := appraiserQty;
            ProficiencyEvaluationResult.Comments := comments;
            if ProficiencyEvaluationResult.Modify(true) then begin
                status := 'success*Employee appraisal has been submitted successfully';
            end else begin
                status := 'danger*Employee appraisal could not be submitted, kindy try again!';
            end;
        end;
    end;

    procedure fnInsertStandardAppraisalPIP(docNo: Code[100]; pipcategory: Code[100]; desc: Text) status: Text
    var
        EvaluationPIP: Record "Evaluation PIP";
        tDoc: Code[100];
    begin
        EvaluationPIP.Init;
        EvaluationPIP."Perfomance Evaluation No" := docNo;
        EvaluationPIP."PIP Category" := pipcategory;
        EvaluationPIP.Description := desc;
        if EvaluationPIP.Insert(true) then begin
            status := 'success*Employee appraisal has been submitted successfully';
        end else begin
            status := 'danger*Employee appraisal could not be submitted, kindy try again!';
        end;
    end;

    procedure fnEditStandardAppraisalPIP(docNo: Code[100]; lineno: Integer; pipcategory: Code[100]; desc: Text) status: Text
    var
        EvaluationPIP: Record "Evaluation PIP";
        tDoc: Code[100];
    begin
        EvaluationPIP.Reset;
        EvaluationPIP.SetRange("PIP Number", lineno);
        EvaluationPIP.SetRange("Perfomance Evaluation No", docNo);
        if EvaluationPIP.FindSet then begin
            EvaluationPIP."PIP Category" := pipcategory;
            EvaluationPIP.Description := desc;
            if EvaluationPIP.Modify(true) then begin
                status := 'success*Employee appraisal has been submitted successfully';
            end else begin
                status := 'danger*Employee appraisal could not be submitted, kindy try again!';
            end;
        end;
    end;

    procedure fnRemoveStandardAppraisalPIP(docNo: Code[100]; lineno: Integer) status: Text
    var
        EvaluationPIP: Record "Evaluation PIP";
        tDoc: Code[100];
    begin
        EvaluationPIP.Reset;
        EvaluationPIP.SetRange("PIP Number", lineno);
        EvaluationPIP.SetRange("Perfomance Evaluation No", docNo);
        if EvaluationPIP.FindSet then begin
            if EvaluationPIP.Delete(true) then begin
                status := 'success*The line has been successfully removed';
            end else begin
                status := 'danger*The line would not be removed, kindy try again!';
            end;
        end;
    end;

    procedure fnInsertStandardAppraisalTrainigNeeds(docNo: Code[100]; category: Code[100]; desc: Text) status: Text
    var
        EvaluationTrainingneeds: Record "Evaluation Training needs";
        tDoc: Code[100];
    begin
        EvaluationTrainingneeds.Init;
        EvaluationTrainingneeds."Perfomance Evaluation No" := docNo;
        EvaluationTrainingneeds."Training Need Category" := category;
        EvaluationTrainingneeds.Description := desc;
        if EvaluationTrainingneeds.Insert(true) then begin
            status := 'success*Employee appraisal training needs has been submitted successfully';
        end else begin
            status := 'danger*Employee appraisal could not be submitted, kindy try again!';
        end;
    end;

    procedure fnRemoveStandardAppraisalTrainigNeeds(docNo: Code[100]; lineno: Integer) status: Text
    var
        EvaluationTrainingneeds: Record "Evaluation Training needs";
        tDoc: Code[100];
    begin
        EvaluationTrainingneeds.Reset;
        EvaluationTrainingneeds.SetRange("Training Need Number", lineno);
        EvaluationTrainingneeds.SetRange("Perfomance Evaluation No", docNo);
        if EvaluationTrainingneeds.FindSet then begin
            if EvaluationTrainingneeds.Delete(true) then begin
                status := 'success*The line has been successfully removed';
            end else begin
                status := 'danger*The line would not be removed, kindy try again!';
            end;
        end;
    end;

    procedure fnEditStandardAppraisalTrainigNeeds(docNo: Code[100]; lineno: Integer; category: Code[100]; desc: Text) status: Text
    var
        EvaluationTrainingneeds: Record "Evaluation Training needs";
        tDoc: Code[100];
    begin
        EvaluationTrainingneeds.Reset;
        EvaluationTrainingneeds.SetRange("Training Need Number", lineno);
        EvaluationTrainingneeds.SetRange("Perfomance Evaluation No", docNo);
        if EvaluationTrainingneeds.FindSet then begin
            EvaluationTrainingneeds."Training Need Category" := category;
            EvaluationTrainingneeds.Description := desc;
            if EvaluationTrainingneeds.Modify(true) then begin
                status := 'success*Employee appraisal has been submitted successfully';
            end else begin
                status := 'danger*Employee appraisal could not be submitted, kindy try again!';
            end;
        end;
    end;

    procedure fnSubmitStandardAppraisalConfirmation(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        tDoc: Code[100];
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            PerfomanceEvaluation."Employee Confirm" := true;
            PerfomanceEvaluation."Supervisor Confirm" := true;
            PerfomanceEvaluation."Document Status" := PerfomanceEvaluation."document status"::Submitted;
            if PerfomanceEvaluation.Modify(true) then begin
                fnSendAppraisalEmail(PerfomanceEvaluation.No);
                status := 'success*Employee appraisal has been submitted successfully';
            end else begin
                status := 'danger*Employee appraisal could not be submitted, kindy try again!';
            end;
        end;
    end;

    procedure fnSendAppraisalEmail(docNo: Code[100]) status: Text
    var
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        SupplierReq: Record Contact;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        FileDirectory: Text[100];
        FileName: Text[100];
        ReportID: Integer;
        //"Object": Record "Object";
        Window: Dialog;
        RunOnceFile: Text[1000];
        TimeOut: Integer;
        Customer2: Record Customer;
        Cust: Record Customer;
        cr: Integer;
        lf: Integer;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        DefaultPrinter: Text[200];
        WindowisOpen: Boolean;
        FileDialog: Codeunit Mail;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit Mail;
        DocLog: Record "Document E-mail Log";
        BranchName: Code[80];
        DimValue: Record "Dimension Value";
        SenderAddress: Text[100];
        CustEmail: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Company Information";
        Emp: Record Vendor;
        PayrollMonth: Date;
        PayrollMonthText: Text[30];
        PayPeriodtext: Text;
        PayPeriod: Record "Payroll PeriodX";
        CompInfo: Record "Company Information";
        DateFilter: Text;
        FromDate: Date;
        ToDate: Date;
        FromDateS: Text;
        ToDateS: Text;
        vend: Record Vendor;
        StartDate: Date;
        EndDAte: Date;
        EmailVerifier: Codeunit Payroll3;
        IsEmailValid: Boolean;
        PPayableSetup: Record "Procurement Setup";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        PortalUser: Record "Dynasoft Portal User";
        Password: Text[50];
        ActivationDetails: Text[1000];
        IFSCommitteMembers: Record "IFS Tender Committee Member";
        IFS: Record "Standard Purchase Code";
        CommitteType: Record "Procurement Committee Types";
        CommitteMembers: Record "IFS Tender Committee";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            HRSetup.Get;

            Employee.Reset;
            Employee.SetRange(Employee."No.", PerfomanceEvaluation."Employee No.");
            if Employee.FindSet then begin
                RequesterEmail := Employee."Company E-Mail";
                RequesterName := PerfomanceEvaluation."Employee Name";

                Counter := Counter + 1;

                if HRSetup."E-Mail" = '' then
                    Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
                SenderAddress := HRSetup."E-Mail";

                CompanyDetails := 'Dear,  ' + RequesterName;
                SenderMessage := '<BR>This is to notify you that your appraisal was successfully submitted: ' + PerfomanceEvaluation.No + '</BR>';
                LoginDetails := 'Attached herein, please find an e-copy of your aappraisal report';

                FileDirectory := 'C:\DOCS\';
                FileName := 'AppraisalReport_' + PerfomanceEvaluation.No + '.pdf';

                PerfomanceEvaluation.Reset;
                PerfomanceEvaluation.SetRange(No, PerfomanceEvaluation.No);
                if PerfomanceEvaluation.FindSet then begin
                    // Report.SaveAsPdf(80016, FileDirectory + FileName, PerfomanceEvaluation);
                end;

                //emailhdr := 'PERFORMANCE APPRAISAL ' + PerfomanceEvaluation.No;
                //cu400.CreateMessage(CompInfo.Name, SenderAddress, RequesterEmail, emailhdr,
                //CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
                //cu400.AddAttachment(FileDirectory + FileName, FileName);
                //cu400.AddBodyline(ProcNote);
                // cu400.Send;
                //SendingDate := Today;
                // SendingTime := Time;
            end;
        end;
    end;

    procedure addTrainingParticipants(type: Text[100]; participantEmpno: Text[100]; Destination: Text[100]; noOfDays: Decimal; reqNo: Text[100]) status: Text
    var
        TrainingParticipants: Record "Training Participants";
        TrainingRequests: Record "Training Requests";
    begin
        TrainingRequests.Reset;
        TrainingRequests.SetRange(Code, reqNo);
        if TrainingRequests.FindSet then begin
            TrainingParticipants.Reset;
            TrainingParticipants.SetRange("Training Code", reqNo);
            TrainingParticipants.SetRange("Employee Code", participantEmpno);
            if TrainingParticipants.FindSet then begin
                status := 'error*The participants already exists.'
            end else begin
                TrainingParticipants.Init;
                TrainingParticipants.Type := type;
                TrainingParticipants."Employee Code" := participantEmpno;
                TrainingParticipants.Validate("Employee Code");
                TrainingParticipants.Destination := Destination;
                TrainingParticipants.Validate(Destination);
                TrainingParticipants."Training Code" := reqNo;
                TrainingParticipants."No. of Days" := noOfDays;
                TrainingParticipants.Validate("No. of Days");
                //TrainingParticipants.Destination:=TrainingRequests."Training Venue Region";
                if TrainingParticipants.Insert(true) then begin
                    status := 'success*Training Participant successfully added';
                end else begin
                    status := 'danger*Training Participant was not added, please try again!';
                end
            end;
        end;
    end;

    procedure editTrainingParticipants(lineno: Integer; type: Text[100]; teammember: Text[100]; noOfDays: Integer; docNo: Code[100]) status: Text
    begin
        TrainingParticipants.Reset;
        TrainingParticipants.SetRange("Training Code", docNo);
        TrainingParticipants.SetRange("Line No", lineno);
        if TrainingParticipants.FindSet then begin
            TrainingParticipants.Type := type;
            TrainingParticipants."Employee Code" := teammember;
            //TrainingParticipants.VALIDATE("Employee Code");
            TrainingParticipants."No. of Days" := noOfDays;
            TrainingParticipants.Validate("No. of Days");
            if TrainingParticipants.Modify(true) then begin
                status := 'success*The training Participant was successfully updated';
            end else begin
                status := 'error*The participant could not be updated.Please try again!';
            end;
        end;
    end;

    procedure deleteTrainingParticipants(id: Integer; reqNo: Text[100]) status: Text
    begin
        TrainingParticipants.Reset;
        TrainingParticipants.SetRange("Training Code", reqNo);
        TrainingParticipants.SetRange("Line No", id);
        if TrainingParticipants.FindSet then begin
            TrainingParticipants.Delete;
            status := 'success*Participant was successfully removed';
        end else begin
            status := 'error*The participant could not be removed. Please try again!';
        end
    end;

    procedure addTrainingCost(docNo: Code[100]; costcategory: Integer; unitcost: Decimal; quantity: Integer; description: Text) status: Text
    var
        TrainingCost: Record "Training Cost";
        TrainingRequests: Record "Training Requests";
    begin
        TrainingRequests.Reset;
        TrainingRequests.SetRange(Code, docNo);
        if TrainingRequests.FindSet then begin
            TrainingCost.Init;
            TrainingCost."Training ID" := docNo;
            //  TrainingCost."Employee No.":=empNo;
            //  TrainingCost.VALIDATE("Employee No.");
            TrainingCost."Cost Category" := costcategory;
            TrainingCost."Unit Cost (LCY)" := unitcost;
            TrainingCost.Quantity := quantity;
            TrainingCost.Validate(Quantity);
            TrainingCost.Description := description;
            if TrainingCost.Insert(true) then begin
                status := 'success*The training cost was successfully added*';
            end else begin
                status := 'danger*The training cost was not added, please try again';
            end;
        end;
    end;

    procedure RemoveTrainingCost(docNo: Code[100]; lineno: Integer) status: Text
    var
        TrainingCost: Record "Training Cost";
        TrainingRequests: Record "Training Requests";
    begin
        TrainingCost.Reset;
        TrainingCost.SetRange("Training ID", docNo);
        //TrainingCost.SETRANGE("Line No",lineno);
        if TrainingCost.FindSet then begin
            if TrainingCost.Delete(true) then begin
                status := 'success*The training cost was successfully removed*';
            end else begin
                status := 'danger*The training cost was not removed, please try again';
            end;
        end;
    end;

    procedure FnAppraisalSuggestObjectivesOutcomes(docNo: Code[100]) status: Text
    var
        PCObjective: Record "PC Objective";
        ObjectiveOutcome: Record "Objective Evaluation Result";
        CompetencyLines: Record "Competency Template Line";
        ProEvaluation: Record "Proficiency Evaluation Result";
        SPMGeneralSetup: Record "SPM General Setup";
        AchievedTarget: Decimal;
        PlogLines: Record "Plog Lines";
        SecondaryPCObjective: Record "Secondary PC Objective";
        PCJobDescription: Record "PC Job Description";
        PerfomanceEvaluation: Record "Perfomance Evaluation";
        SubObjectiveEvaluation: Record "Sub Objective Evaluation";
        SubPCObjective: Record "Sub PC Objective";
        AchievedSubActivityTarget: Decimal;
        SubPlogLines: Record "Sub Plog Lines";
    begin
        PerfomanceEvaluation.Reset;
        PerfomanceEvaluation.SetRange(No, docNo);
        if PerfomanceEvaluation.FindSet then begin
            SPMGeneralSetup.Get;
            SPMGeneralSetup.TestField("Appraisal Based On");

            if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Direct Input" then begin
                SPMGeneralSetup.Get();
                if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if PCObjective.FindFirst then begin
                        repeat
                            PCObjective.TestField("Due Date");
                        until PCObjective.Next = 0;
                    end;

                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    PCObjective.TestField("Due Date");
                    PCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCObjective.FindFirst then begin
                        repeat
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                            //Sub Objective OutCome
                            SubPCObjective.Reset;
                            SubPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                            SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                            if SubPCObjective.FindSet then begin
                                repeat
                                    SubObjectiveEvaluation.Init;
                                    SubObjectiveEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                                    SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                    SubObjectiveEvaluation."Scorecard ID" := PCObjective."Workplan No.";
                                    SubObjectiveEvaluation."Intiative No" := PCObjective."Initiative No.";
                                    SubObjectiveEvaluation."Objective/Initiative" := PCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                    SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Primary Directorate" := PerfomanceEvaluation.Directorate;
                                    SubObjectiveEvaluation."Primary Department" := PerfomanceEvaluation.Department;
                                    SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                    SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                    SubObjectiveEvaluation."Target Qty" := PCObjective."Imported Annual Target Qty";
                                    SubObjectiveEvaluation."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                                    SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                    SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                    SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                    SubObjectiveEvaluation.Insert(true);

                                until SubPCObjective.Next = 0;
                            end;
                        //End Sub Objective OutCome
                        until PCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                        //SecondaryPCObjective.TESTFIELD("Due Date");
                        until SecondaryPCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    SecondaryPCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                            //Insert Sub Objective Outcome
                            //Sub Objective OutCome
                            SubPCObjective.Reset;
                            SubPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                            SubPCObjective.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                            if SubPCObjective.FindSet then begin
                                repeat
                                    SubObjectiveEvaluation.Init;
                                    SubObjectiveEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                                    SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                    SubObjectiveEvaluation."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                                    SubObjectiveEvaluation."Intiative No" := SecondaryPCObjective."Initiative No.";
                                    SubObjectiveEvaluation."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                    SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Primary Directorate" := PerfomanceEvaluation.Directorate;
                                    SubObjectiveEvaluation."Primary Department" := PerfomanceEvaluation.Department;
                                    SubObjectiveEvaluation."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    SubObjectiveEvaluation."Key Performance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                                    SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                    SubObjectiveEvaluation."Target Qty" := PCObjective."Imported Annual Target Qty";
                                    SubObjectiveEvaluation."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                                    SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                    SubObjectiveEvaluation."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                                    SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                    SubObjectiveEvaluation.Insert(true);

                                until SubPCObjective.Next = 0;
                            end;
                        //End Sub Objective OutCome
                        //End Insert Sub Objective Outcome

                        until SecondaryPCObjective.Next = 0;
                    end;
                end;

                if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                    PCJobDescription.Reset;
                    PCJobDescription.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    PCJobDescription.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCJobDescription.FindFirst then begin
                        repeat
                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                            ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                            ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                        until PCJobDescription.Next = 0;
                    end;
                end;
            end;

            if SPMGeneralSetup."Appraisal Based On" = SPMGeneralSetup."appraisal based on"::"Plog Input" then begin
                SPMGeneralSetup.Get();
                if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if PCObjective.FindFirst then begin
                        repeat
                            PCObjective.TestField("Due Date");
                        until PCObjective.Next = 0;
                    end;

                    PCObjective.Reset;
                    PCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    //PCObjective.TESTFIELD("Due Date");
                    PCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCObjective.FindFirst then begin
                        repeat

                            AchievedTarget := 0;
                            PlogLines.Reset;
                            PlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                            PlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                            PlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            PlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            /* IF AchievedTarget=0 THEN
                                ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date");*/

                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := PCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := PCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := PCObjective."Assigned Weight (%)";
                            ObjectiveOutcome."Target Qty" := PCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                            ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                            ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                            ObjectiveOutcome.Validate("Final/Actual Qty");
                            ObjectiveOutcome.Insert;

                            //Sub Objective OutCome
                            AchievedSubActivityTarget := 0;
                            SubPlogLines.Reset;
                            SubPlogLines.SetRange("Personal Scorecard ID", PCObjective."Workplan No.");
                            SubPlogLines.SetRange("Initiative No.", PCObjective."Initiative No.");
                            SubPlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            SubPlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            SubPCObjective.Reset;
                            SubPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                            SubPCObjective.SetRange("Initiative No.", PCObjective."Initiative No.");
                            if SubPCObjective.FindSet then begin
                                repeat
                                    SubObjectiveEvaluation.Init;
                                    SubObjectiveEvaluation."Performance Evaluation ID" := PerfomanceEvaluation.No;
                                    SubObjectiveEvaluation."Line No" := FnGetLastSubPcLineNo + 1;
                                    SubObjectiveEvaluation."Scorecard ID" := SubPCObjective."Workplan No.";
                                    SubObjectiveEvaluation."Intiative No" := SubPCObjective."Initiative No.";
                                    SubObjectiveEvaluation."Objective/Initiative" := SubPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Sub Intiative No" := SubPCObjective."Sub Initiative No.";
                                    SubObjectiveEvaluation."Sub Intiative Description" := SubPCObjective."Objective/Initiative";
                                    SubObjectiveEvaluation."Primary Directorate" := PerfomanceEvaluation.Directorate;
                                    SubObjectiveEvaluation."Primary Department" := PerfomanceEvaluation.Department;
                                    SubObjectiveEvaluation."Outcome Perfomance Indicator" := PCObjective."Outcome Perfomance Indicator";
                                    SubObjectiveEvaluation."Key Performance Indicator" := PCObjective."Key Performance Indicator";
                                    SubObjectiveEvaluation.Validate("Outcome Perfomance Indicator");
                                    SubObjectiveEvaluation."Target Qty" := SubPCObjective."Sub Targets";
                                    SubObjectiveEvaluation."Self-Review Qty" := AchievedSubActivityTarget;
                                    SubObjectiveEvaluation."AppraiserReview Qty" := AchievedSubActivityTarget;
                                    SubObjectiveEvaluation."Final/Actual Qty" := AchievedSubActivityTarget;
                                    SubObjectiveEvaluation.Validate("Final/Actual Qty");
                                    SubObjectiveEvaluation."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                                    SubObjectiveEvaluation.Validate("Performance Rating Scale");
                                    SubObjectiveEvaluation."Desired Perfomance Direction" := PCObjective."Desired Perfomance Direction";
                                    SubObjectiveEvaluation."Weight %" := SubPCObjective."Assigned Weight (%)";
                                    SubObjectiveEvaluation.Insert(true);

                                until SubPCObjective.Next = 0;
                            end;
                        //End Sub Objective OutCome


                        until PCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                        //SecondaryPCObjective.TESTFIELD("Due Date");
                        until SecondaryPCObjective.Next = 0;
                    end;

                    SecondaryPCObjective.Reset;
                    SecondaryPCObjective.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    SecondaryPCObjective.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if SecondaryPCObjective.FindFirst then begin
                        repeat
                            AchievedTarget := 0;
                            PlogLines.Reset;
                            PlogLines.SetRange("Personal Scorecard ID", SecondaryPCObjective."Workplan No.");
                            PlogLines.SetRange("Initiative No.", SecondaryPCObjective."Initiative No.");
                            PlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            PlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            /* IF AchievedTarget=0 THEN
                                ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date"); */


                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := SecondaryPCObjective."Workplan No.";
                            ObjectiveOutcome."Intiative No" := SecondaryPCObjective."Initiative No.";
                            ObjectiveOutcome."Objective/Initiative" := SecondaryPCObjective."Objective/Initiative";
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := SecondaryPCObjective."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := SecondaryPCObjective."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                            ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                            ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                            ObjectiveOutcome."Desired Perfomance Direction" := SecondaryPCObjective."Desired Perfomance Direction";
                            ObjectiveOutcome."Weight %" := SecondaryPCObjective."Assigned Weight (%)";
                            ObjectiveOutcome.Insert(true);
                        until SecondaryPCObjective.Next = 0;
                    end;
                end;
                if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                    PCJobDescription.Reset;
                    PCJobDescription.SetRange("Workplan No.", PerfomanceEvaluation."Personal Scorecard ID");
                    PCJobDescription.SetRange("Due Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                    if PCJobDescription.FindFirst then begin
                        repeat
                            AchievedTarget := 0;
                            PlogLines.Reset;
                            PlogLines.SetRange("Personal Scorecard ID", PCJobDescription."Workplan No.");
                            PlogLines.SetRange("Initiative No.", Format(PCJobDescription."Line Number"));
                            PlogLines.SetRange("Achieved Date", PerfomanceEvaluation."Evaluation Start Date", PerfomanceEvaluation."Evaluation End Date");
                            PlogLines.CalcSums("Achieved Target");
                            AchievedTarget := PlogLines."Achieved Target";

                            /*IF AchievedTarget=0 THEN
                               ERROR('Performance Logs for Appraisal of Period  %1 and to %2 must be Updated first',"Evaluation Start Date","Evaluation End Date"); */

                            ObjectiveOutcome.Init;
                            ObjectiveOutcome."Performance Evaluation ID" := PerfomanceEvaluation.No;
                            ObjectiveOutcome."Line No" := FnGetLastLineNo + 1;
                            ObjectiveOutcome."Scorecard ID" := PCJobDescription."Workplan No.";
                            ObjectiveOutcome."Intiative No" := Format(PCJobDescription."Line Number");
                            ObjectiveOutcome."Objective/Initiative" := PCJobDescription.Description;
                            ObjectiveOutcome."Primary Directorate" := PerfomanceEvaluation.Directorate;
                            ObjectiveOutcome."Primary Department" := PerfomanceEvaluation.Department;
                            ObjectiveOutcome."Outcome Perfomance Indicator" := PCJobDescription."Outcome Perfomance Indicator";
                            ObjectiveOutcome.Validate("Outcome Perfomance Indicator");
                            ObjectiveOutcome."Target Qty" := PCJobDescription."Imported Annual Target Qty";
                            ObjectiveOutcome."Performance Rating Scale" := PerfomanceEvaluation."Performance Rating Scale";
                            ObjectiveOutcome."Desired Perfomance Direction" := PCJobDescription."Desired Perfomance Direction";
                            ObjectiveOutcome.Validate("Performance Rating Scale");
                            ObjectiveOutcome."Weight %" := PCJobDescription."Assigned Weight (%)";
                            ObjectiveOutcome."Self-Review Qty" := AchievedTarget;
                            ObjectiveOutcome."AppraiserReview Qty" := AchievedTarget;
                            ObjectiveOutcome."Final/Actual Qty" := AchievedTarget;
                            ObjectiveOutcome.Validate("Final/Actual Qty");
                            ObjectiveOutcome.Insert(true);
                        until PCJobDescription.Next = 0;
                    end;
                end;
            end;
        end;

    end;

    local procedure FnGetLastLineNo() LineNumber: Integer
    var
        Billable: Record "Objective Evaluation Result";
    begin
        Billable.Reset;
        if Billable.Find('+') then
            LineNumber := Billable."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    local procedure FnGetLastLineNoB() LineNumber: Integer
    var
        ProEvalution: Record "Proficiency Evaluation Result";
    begin
        ProEvalution.Reset;
        if ProEvalution.Find('+') then
            LineNumber := ProEvalution."Line No"
        else
            LineNumber := 1;
        exit(LineNumber);
    end;

    procedure FnInsertSubObjectiveEvaluation(lineno: Integer; docNo: Code[100]; initiativeNo: Code[100]; finalTarget: Decimal) status: Text
    var
        SubObjectiveEvaluation: Record "Sub Objective Evaluation";
    begin
        SubObjectiveEvaluation.Reset;
        SubObjectiveEvaluation.SetRange("Line No", lineno);
        SubObjectiveEvaluation.SetRange("Intiative No", initiativeNo);
        SubObjectiveEvaluation.SetRange("Performance Evaluation ID", docNo);
        if SubObjectiveEvaluation.FindSet then begin
            SubObjectiveEvaluation."Final/Actual Qty" := finalTarget;
            if SubObjectiveEvaluation.Modify(true) then begin
                status := 'success*The sub objectives outcome final quantity has been saved successfully';
            end else begin
                status := 'danger*The sub objectives outcome final quantity could not be saved, kindly try again!';
            end;
        end;
    end;

    procedure FnGetLastSubPcLineNo() LineNumber: Integer
    var
        Billable: Record "Sub Objective Evaluation";
    begin
    end;

    procedure fnMergePdfs(tenderNo: Text; finalDocument: Text) status: Text
    var
        isSuccess: Text;
        BaseUrl: Text;
        Method: Text;
        RestMethod: Text;
    // HttpContent: dotnet HttpContent;
    // HttpResponseMessage: dotnet HttpResponseMessage;
    // HttpClient: dotnet HttpClient;
    // Uri: dotnet Uri;
    begin

        // HttpClient := HttpClient.HttpClient();
        // HttpClient.BaseAddress := Uri.Uri(mergePdfsapiPath + tenderNo + '&&finalFile=' + finalDocument);
        // HttpResponseMessage := HttpClient.GetAsync(Method).Result;

        // exit(HttpResponseMessage.Content.ReadAsStringAsync().Result);
        // HttpResponseMessage.EnsureSuccessStatusCode();
    end;

    procedure fnCreateFolder(tenderNo: Text) status: Text
    var
        isSuccess: Text;
        BaseUrl: Text;
        Method: Text;
        RestMethod: Text;
    //HttpContent: dotnet HttpContent;
    // HttpResponseMessage: dotnet HttpResponseMessage;
    // HttpClient: dotnet HttpClient;
    //Uri: dotnet Uri;
    begin

        //  HttpClient := HttpClient.HttpClient();
        //  HttpClient.BaseAddress := Uri.Uri(createFolderapiPath + tenderNo);
        //HttpResponseMessage := HttpClient.GetAsync(Method).Result;

        // exit(HttpResponseMessage.Content.ReadAsStringAsync().Result);
        //HttpResponseMessage.EnsureSuccessStatusCode();
    end;

    local procedure fnCreateF() status: Text
    begin
        status := fnMergePdfs('IFS0061', 'FiNALdOC.pdf');
        exit(status);
    end;

    procedure FnCreateLeaveApplication(leaveNo: Code[20]; employeeNo: Code[20]; leaveType: Code[20]; annualLeaveType: Integer; days: Integer; startDate: Date; reliever: Code[20]; phone: Text; email: Text; examDetails: Text; examDate: Date; userId: Text) status: Text
    var
        tbl_leaveApplications: Record "HR Leave Applications";
    begin
        if leaveNo = '' then begin
            tbl_leaveApplications.Reset();
            tbl_leaveApplications.SetRange(Status, tbl_leaveApplications.Status::Open);
            tbl_leaveApplications.SetRange("Employee No", employeeNo);
            if tbl_leaveApplications.FindSet(true) then begin
                error('You have open leave application number: %1. Kindly use it.', leaveNo);
                status := 'Sorry, you already have an open leave application. Kindly use it.';
            end;
            tbl_leaveApplications.Init;
            tbl_leaveApplications."Employee No" := employeeNo;
            tbl_leaveApplications.VALIDATE("Employee No");
            tbl_leaveApplications."Leave Type" := leaveType;
            // tbl_leaveApplications.VALIDATE("Leave Type");
            tbl_leaveApplications."Annual Leave Type" := annualLeaveType;
            tbl_leaveApplications."Days Applied" := days;
            tbl_leaveApplications."Start Date" := startDate;
            tbl_leaveApplications.VALIDATE("Start Date");
            tbl_leaveApplications.Reliever := reliever;
            tbl_leaveApplications.VALIDATE(Reliever);
            tbl_leaveApplications."Cell Phone Number" := phone;
            tbl_leaveApplications."E-mail Address" := email;
            tbl_leaveApplications."Date of Exam" := examDate;
            tbl_leaveApplications."Details of Examination" := examDetails;
            tbl_leaveApplications."User ID" := 'KURA\' + userId.ToUpper();
            // MESSAGE('%1', days);
            If tbl_leaveApplications.INSERT(TRUE) then begin
                status := 'success*The leave application was successfull*' + tbl_leaveApplications."Application Code" + '*' + FORMAT(tbl_leaveApplications."Return Date");
            end ELSE BEGIN
                status := 'danger*The leave applicat was unsuccessful. Kindly try again later';
            END;
        end ELSE BEGIN
            tbl_leaveApplications.RESET;
            tbl_leaveApplications.SETRANGE("Application Code", leaveNo);
            tbl_leaveApplications.SETRANGE("Employee No", employeeNo);
            IF tbl_leaveApplications.FINDSET THEN BEGIN
                tbl_leaveApplications."Employee No" := employeeNo;
                tbl_leaveApplications.VALIDATE("Employee No");
                tbl_leaveApplications."Leave Type" := leaveType;
                //tbl_leaveApplications.VALIDATE("Leave Type");
                tbl_leaveApplications."Annual Leave Type" := annualLeaveType;
                tbl_leaveApplications."Days Applied" := days;
                tbl_leaveApplications."Start Date" := startDate;
                tbl_leaveApplications.VALIDATE("Start Date");
                tbl_leaveApplications.Reliever := reliever;
                tbl_leaveApplications.VALIDATE(Reliever);
                tbl_leaveApplications."Cell Phone Number" := phone;
                tbl_leaveApplications."E-mail Address" := email;
                tbl_leaveApplications."Date of Exam" := examDate;
                tbl_leaveApplications."Details of Examination" := examDetails;
                tbl_leaveApplications."User ID" := 'KURA\' + userId.ToUpper();
                IF tbl_leaveApplications.MODIFY(TRUE) THEN BEGIN
                    status := 'success*The leave application was successfull*' + tbl_leaveApplications."Application Code" + '*' + FORMAT(tbl_leaveApplications."Return Date");
                END ELSE BEGIN
                    status := 'danger*The leave application was unsuccessfull. Kindly try again later';
                END;
            end;
        end;
    end;

    procedure sendLeaveForApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text

    begin
        leaveApplications.RESET;
        leaveApplications.SETRANGE("Application Code", recordNo);
        leaveApplications.SETRANGE("Employee No", employeeNo);
        IF leaveApplications.FINDSET THEN BEGIN

            leaveApp := leaveApplications;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnSendDocForApproval(leaveApp);
            IF leaveApplications.GET(leaveApplications."Application Code") THEN BEGIN
                IF leaveApplications.Status = leaveApplications.Status::Open THEN BEGIN
                    status := 'warning*Your leave application  could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your leave application was successfully  sent for approval';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

        END ELSE BEGIN
            status := 'danger*The leave does not exist or you are not the requester';
        END;
        EXIT(status);

    end;

    procedure CanceLeaveApproval(employeeNo: Code[50]; recordNo: Code[50]) status: Text
    begin
        leaveApplications.RESET();
        leaveApplications.SETRANGE("Application Code", recordNo);
        leaveApplications.SETRANGE("Employee No", employeeNo);
        leaveApplications.SetRange(Status, leaveApplications.Status::"Pending Approval");
        IF leaveApplications.FINDSET THEN BEGIN
            leaveApp := leaveApplications;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(leaveApp) THEN
                CustomApprovals.OnCancelDocApprovalRequest(leaveApp);
            IF leaveApplications.GET(leaveApplications."Application Code") THEN BEGIN
                IF leaveApplications.Status = leaveApplications.Status::"Pending Approval" THEN BEGIN
                    status := 'warning*Your leave application  could not be cancelled. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your leave application was successfully  cancelled';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;
        END ELSE BEGIN
            status := 'danger*The leave does not exist as pending approval or you are not the requester';
        END;
        EXIT(status);
    end;

    procedure FnInsertVehicleMaitenanceDetails(docNo: Code[100]; vehicleRegNo: Code[100]; employeeNo: Code[100]; odometerReading: Decimal; projectNo: Code[100]; taskNo: Code[100]; maintenanceCost: Decimal; vendor: Code[100]; description: Text; serviceCode: Code[20]; repairs: Text; username: Text) status: Text
    var
        tbl_fuelMaintainanceRequisition: Record "Fuel & Maintenance Requisition";
    begin
        tbl_fuelMaintainanceRequisition.RESET();
        tbl_fuelMaintainanceRequisition.SETRANGE("Requisition No", docNo);
        // tbl_fuelMaintainanceRequisition.SETRANGE("Requested By",employeeNo);
        IF tbl_fuelMaintainanceRequisition.FINDSET THEN BEGIN
            tbl_fuelMaintainanceRequisition."Vehicle Reg No" := vehicleRegNo;
            tbl_fuelMaintainanceRequisition."Odometer Reading" := odometerReading;
            tbl_fuelMaintainanceRequisition.Type := tbl_fuelMaintainanceRequisition.Type::Maintenance;
            // tbl_fuelMaintainanceRequisition."Project Number":=projectNo;
            //tbl_fuelMaintainanceRequisition."Task Number":=taskNo;
            //tbl_fuelMaintainanceRequisition."Maintenance Cost":=maintenanceCost;
            tbl_fuelMaintainanceRequisition."Vendor(Dealer)" := vendor;
            tbl_fuelMaintainanceRequisition.VALIDATE("Vendor(Dealer)");
            tbl_fuelMaintainanceRequisition.Description := description;
            tbl_fuelMaintainanceRequisition."Service Code" := serviceCode;
            tbl_fuelMaintainanceRequisition.VALIDATE("Service Code");
            // tbl_fuelMaintainanceRequisition."Service/ Repairs Done":=repairs;
            IF tbl_fuelMaintainanceRequisition.MODIFY(TRUE) THEN begin
                status := 'success*You have successfully updated your vehicle maintenance request.*' + tbl_fuelMaintainanceRequisition."Requisition No";
            end ELSE begin
                status := 'danger*Your vehicle maintenance request could not be submitted, kindly try again.';
            end
        end ELSE begin
            tbl_fuelMaintainanceRequisition.INIT;
            tbl_fuelMaintainanceRequisition.Type := tbl_fuelMaintainanceRequisition.Type::Maintenance;
            // tbl_fuelMaintainanceRequisition."Requested By":=employeeNo;
            tbl_fuelMaintainanceRequisition."Vehicle Reg No" := vehicleRegNo;
            tbl_fuelMaintainanceRequisition."Odometer Reading" := odometerReading;
            // tbl_fuelMaintainanceRequisition."Project Number":=projectNo;
            // tbl_fuelMaintainanceRequisition."Task Number":=taskNo;
            // tbl_fuelMaintainanceRequisition."Maintenance Cost":=maintenanceCost;
            tbl_fuelMaintainanceRequisition."Vendor(Dealer)" := vendor;
            tbl_fuelMaintainanceRequisition.VALIDATE("Vendor(Dealer)");
            tbl_fuelMaintainanceRequisition.Description := description;
            tbl_fuelMaintainanceRequisition."Service Code" := serviceCode;
            tbl_fuelMaintainanceRequisition.VALIDATE("Service Code");
            tbl_fuelMaintainanceRequisition."Prepared By" := 'KURA\' + username.ToUpper();
            tbl_fuelMaintainanceRequisition."Employee No" := employeeNo;
            tbl_fuelMaintainanceRequisition.Validate("Employee No");
            tbl_fuelMaintainanceRequisition.Driver := employeeNo;
            tbl_fuelMaintainanceRequisition.Validate(Driver);
            if Employee.Get(tbl_fuelMaintainanceRequisition."Employee No") then
                tbl_fuelMaintainanceRequisition."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
            tbl_fuelMaintainanceRequisition.Validate("Shortcut Dimension 1 Code");
            //  tbl_fuelMaintainanceRequisition."Service/ Repairs Done":=repairs;
            IF tbl_fuelMaintainanceRequisition.INSERT(TRUE) THEN begin
                status := 'success*You have successfully submitted your vehicle maintenance request.*' + tbl_fuelMaintainanceRequisition."Requisition No";
            end ELSE begin
                status := 'danger*Your vehicle maintenance request could not be submitted, kindly try again.';
            end;
        end;
    end;


    procedure fncreatePurchaseRequisition(employeeNo: Code[50]; requisitionNo: Text; priorityLevel: Integer; itemcategory: Text; txtdirectorate: Text; txtdepartment: Text; job: Text; jobtask: Text; location: Text; reqDescription: Text[250]; username: Text) status: Text
    var
        tbl_employee: Record Employee;
        tbl_purchaseHeader: Record "Purchase Header";
        tbl_userSetup: Record "User Setup";
        tbl_responsibilityCenter: Record "Responsibility Center";

    begin
        tbl_employee.Reset();
        tbl_employee.SETRANGE("No.", employeeNo);
        IF tbl_employee.FindSet() THEN BEGIN
            PurchaseHeader.RESET;
            PurchaseHeader.SETRANGE("Document Type", PurchaseHeader."Document Type"::"Purchase Requisition");
            PurchaseHeader.SETRANGE("No.", requisitionNo);
            PurchaseHeader.SETRANGE("Request-By No.", employeeNo);
            PurchaseHeader."Request-By Name" := tbl_employee."First Name" + ' ' + tbl_employee."Last Name";
            IF PurchaseHeader.FindSet() THEN BEGIN
                tbl_userSetup.RESET();
                tbl_userSetup.SETRANGE("Portal User", TRUE);
                IF tbl_userSetup.FindSet() THEN BEGIN
                    PurchaseHeader."Requester ID" := 'KURA\' + username.ToUpper();
                    PurchaseHeader."Priority Level" := priorityLevel;
                    PurchaseHeader.VALIDATE("Priority Level");
                    PurchaseHeader."PP Planning Category" := itemcategory;
                    PurchaseHeader.Validate("PP Planning Category");
                    PurchaseHeader."Directorate Code" := txtdirectorate;
                    PurchaseHeader."Department Code" := txtdepartment;
                    PurchaseHeader."Shortcut Dimension 1 Code" := tbl_employee."Global Dimension 1 Code";
                    PurchaseHeader."Shortcut Dimension 2 Code" := tbl_employee."Global Dimension 2 Code";
                    PurchaseHeader.Description := reqDescription;
                    PurchaseHeader."Location Code" := location;
                    PurchaseHeader."Responsibility Center" := location;
                    PurchaseHeader.Job := job;
                    PurchaseHeader.VALIDATE(Job);
                    PurchaseHeader."Job Task No." := jobtask;
                    PurchaseHeader."PRN Type" := PurchaseHeader."PRN Type"::Standard;
                    PurchaseHeader.Region := location;
                    PurchaseHeader."Buy-from Vendor No." := 'VEND01186'; // To ensure the field is not null and allow the final user to approve.
                    // populate  name                   
                    IF PurchaseHeader.MODIFY(TRUE) THEN BEGIN
                        PurchaseHeader."Job Task No." := jobtask;
                        PurchaseHeader.VALIDATE("Shortcut Dimension 1 Code");
                        PurchaseHeader.VALIDATE("Shortcut Dimension 2 Code");
                        status := 'success*Header Modified successfully*' + PurchaseHeader."No.";
                    END ELSE BEGIN
                        status := 'danger*Header not created*';
                    END
                END
            END ELSE BEGIN
                PurchaseHeader.INIT;
                PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition";
                tbl_userSetup.RESET();
                tbl_userSetup.SETRANGE("Portal User", TRUE);
                IF tbl_userSetup.FindSet() THEN BEGIN
                    PurchaseHeader."Requester ID" := 'KURA\' + username.ToUpper();
                    PurchaseHeader."Request-By No." := employeeNo;
                    PurchaseHeader.VALIDATE("Request-By No.");
                    PurchaseHeader."Responsibility Center" := location;
                    ProcurementSetup.GET;
                    PurchaseHeader."Procurement Plan ID" := ProcurementSetup."Effective Procurement Plan";
                    PurchaseHeader."Priority Level" := priorityLevel;
                    PurchaseHeader.VALIDATE("Priority Level");
                    PurchaseHeader."PP Planning Category" := itemcategory;
                    PurchaseHeader.Validate("PP Planning Category");
                    PurchaseHeader."Directorate Code" := txtdirectorate;
                    PurchaseHeader."Department Code" := txtdepartment;
                    PurchaseHeader.Description := reqDescription;
                    PurchaseHeader.Job := job;
                    PurchaseHeader.VALIDATE(Job);
                    PurchaseHeader."Job Task No." := jobtask;
                    PurchaseHeader."Location Code" := location;
                    PurchaseHeader."PRN Type" := PurchaseHeader."PRN Type"::Standard;
                    PurchaseHeader.Region := location;
                    //  PurchaseHeader.VALIDATE("Procurement Plan Entry No");
                    PurchaseHeader."Buy-from Vendor No." := 'VEND01186'; // To ensure the field is not null and allow the final user to approve.
                    IF PurchaseHeader.INSERT(TRUE) THEN BEGIN
                        // Amos (14/08/2023) --> The shortcut dimensions are being overwritten to '' on Insert, therefore, choosing to parse the values here. 
                        PurchaseHeader."Shortcut Dimension 1 Code" := tbl_employee."Global Dimension 1 Code";
                        PurchaseHeader."Shortcut Dimension 2 Code" := tbl_employee."Global Dimension 2 Code";
                        PurchaseHeader."Job Task No." := jobtask;
                        PurchaseHeader.VALIDATE("Shortcut Dimension 1 Code");
                        PurchaseHeader.VALIDATE("Shortcut Dimension 2 Code");
                        status := 'success*Header created successfully*' + PurchaseHeader."No.";
                        ;
                    END ELSE BEGIN
                        status := 'danger*Header not created*';
                    END;
                END;
            END;
        END;

    end;



    procedure createNewPettyCashRequisition(docNo: Text; empNo: Text; pcashNo: Text; narration: Text) status: Text
    begin
        Employee.RESET;
        Employee.SETRANGE("No.", empNo);
        IF Employee.FINDSET THEN BEGIN
            Payments.RESET;
            Payments.SETRANGE("No.", docNo);
            IF Payments.FINDSET THEN BEGIN
                Payments."Payment Narration" := narration;
                IF Payments.MODIFY(TRUE) THEN BEGIN
                    status := 'success*Header created*' + Payments."No.";
                END ELSE BEGIN
                    status := 'danger*Failed to create petty cash requisition*' + Payments."No.";
                END;
            END ELSE BEGIN
                Payments.INIT;
                Payments."Account Type" := Payments."Account Type"::Employee;
                Payments."Payment Type" := Payments."Payment Type"::"Petty Cash";
                Payments."Document Type" := Payments."Document Type"::"Petty Cash";
                Payments."Account No." := pcashNo;
                Payments."Account Name" := Employee."First Name" + ' ' + Employee."Last Name";
                Payments.Payee := Employee."First Name" + ' ' + Employee."Last Name";
                Payments."Payment Narration" := narration;
                // Amos Global Dimension 1 and 2 contain Division code and dept code respectively
                Payments."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                Payments."Responsibility Center" := Employee."Global Dimension 1 Code";
                Payments.Status := Payments.Status::Open;
                //Payments.VALIDATE("Shortcut Dimension 1 Code");
                Payments."Shortcut Dimension 2 Code" := Employee."Global Dimension 2 Code";
                Payments."Department Code" := Employee."Department Code";
                //Payments.VALIDATE("Shortcut Dimension 2 Code");
                IF Payments.INSERT(TRUE) THEN BEGIN
                    status := 'success*Header created*' + Payments."No.";
                END ELSE BEGIN
                    status := 'danger*Failed to create petty cash requisition*' + Payments."No.";
                END
            END;
        END;

    end;

    procedure addPettyCashRequisitionLines(docNo: Text; expenditure: Text; amount: Decimal; description: Text) status: Text
    begin
        PVLines.INIT;
        PVLines.No := docNo;
        PVLines.Type := expenditure;
        PVLines.VALIDATE(Type);
        PVLines.Amount := amount;
        PVLines.VALIDATE(Amount);
        PVLines.Description := description;
        IF PVLines.INSERT(TRUE) THEN BEGIN
            status := 'success*Record saved successfully';
        END ELSE BEGIN
            status := 'danger*Record could not be inserted, please try again.';
        END;

    end;

    procedure deletePettyCashRequisitionLines(docNo: Text; id: Integer) status: Text
    begin
        PVLines.RESET;
        PVLines.SETRANGE(No, docNo);
        PVLines.SETRANGE("Line No", id);
        IF PVLines.FINDSET THEN BEGIN
            PVLines.DELETE(TRUE);
            status := 'success*Record deleted successfully';
        END

    end;

    procedure editPettyCashRequisitionLines2(docNo: Text; id: Integer; description: Text; amount: Decimal) status: Text
    begin
        PVLines.RESET;
        PVLines.SETRANGE(No, docNo);
        PVLines.SETRANGE("Line No", id);
        IF PVLines.FINDSET THEN BEGIN
            PVLines.Type := description;
            PVLines.Amount := amount;
            PVLines.MODIFY(TRUE);
            status := 'success*Record updated successfully';
        END ELSE BEGIN
            status := 'success*The record does not exist';
        END
    end;

    procedure editHelpDeskRequest(jobno: Code[50]; empNo: Code[50]; category: Text; description: Text) status: Text
    begin
        status := 'danger*Your ICT issue request was would not be captured';
        helpdesk.RESET;
        helpdesk.SETRANGE("Job No.", jobno);
        helpdesk.SETRANGE("Employee No", empNo);
        IF helpdesk.FINDSET THEN BEGIN
            helpdesk."ICT Issue Category" := category;
            //  helpdesk.VALIDATE("ICT Issue Category");
            helpdesk."Description of the issue" := description;
            //  helpdesk.VALIDATE("Description of the issue");
            IF helpdesk.MODIFY(TRUE) THEN BEGIN
                status := 'success*Your ICT issue request was successfully edited';
            END ELSE BEGIN
                status := 'danger*Your ICT issue request could not be edited';
            END;
        END;

    end;

    // add purchase requisition file link
    procedure addFileLinks(recordType: Text[100]; recordNo: Code[50]; filename: Text; fileLink: Text; extensionType: Text) status: Text
    var
        tbl_purchaseHeader: Record "Purchase Header";
        tbl_documentAttachments: Record "Document Attachment";
    begin
        if recordType = 'Purchase Requisition' then begin
            status := fnConvertFile(fileLink, extensionType, 38, filename, recordNo, 1);
        end else
            if recordType = 'Imprest Surrender' then begin
                status := fnConvertFile(fileLink, extensionType, 57000, filename, recordNo, 2);

            end else
                if recordType = 'Imprest Memo' then begin
                    status := fnConvertFile(fileLink, extensionType, 57008, filename, recordNo, 3);

                end else
                    if recordType = 'Leave' then begin
                        status := fnConvertFile(fileLink, extensionType, 69205, filename, recordNo, 3);
                    end else
                        if recordType = 'ICTHelpDesk' then begin
                            status := fnConvertFile(fileLink, extensionType, 56050, filename, recordNo, 3);

                        end else
                            if recordType = 'Imprest Requisition' then begin
                                status := fnConvertFile(fileLink, extensionType, 57000, filename, recordNo, 3);
                            end else
                                if recordType = 'Claim' then begin
                                    status := fnConvertFile(fileLink, extensionType, 57000, filename, recordNo, 3);
                                end
                                else
                                    if recordType = 'Petty' then begin
                                        status := fnConvertFile(fileLink, extensionType, 57000, filename, recordNo, 3);
                                    end
                                    else
                                        if recordType = 'Fleet' then begin
                                            status := fnConvertFile(fileLink, extensionType, 59003, filename, recordNo, 3);
                                        end
                                        else
                                            if recordType = 'Store Requisition' then begin
                                                status := fnConvertFile(fileLink, extensionType, 38, filename, recordNo, 11);
                                            end
                                            else
                                                if recordType = 'Petty Cash Surrender' then begin
                                                    status := fnConvertFile(fileLink, extensionType, 57000, filename, recordNo, 3);
                                                end
                                                else
                                                    if recordType = 'Subscriptions' then begin
                                                        status := fnConvertFile(fileLink, extensionType, 50026, filename, recordNo, 3);
                                                    end

    end;

    procedure fnSendImprestSurrenderApproval(employeeNo: Code[50]; imprestNo: Code[50]) status: Text
    var
        tbl_payments: Record Payments;
        CustomApproval: Codeunit "Custom Approvals Codeunit";
        tbl_imprestLines: Record "Imprest Lines";
        Var_Variant: Variant;
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("No.", imprestNo);
        tbl_payments.SetRange("Account No.", employeeNo);
        tbl_payments.SetRange(Status, tbl_payments.status::Open);
        if tbl_payments.FindSet(true) then begin
            tbl_imprestLines.Reset;
            tbl_imprestLines.SetRange(No, tbl_payments."No.");
            tbl_imprestLines.CalcSums("Actual Spent");
            if tbl_imprestLines."Actual Spent" <= 0 then
                status := 'danger* Actual spent must have a value';
            Var_Variant := tbl_payments;
            if CustomApproval.CheckApprovalsWorkflowEnabled(Var_Variant) then
                CustomApproval.OnSendDocForApproval(Var_Variant);
            status := 'success*Your request has been sent for approval successfully.';
        end else begin
            status := 'danger* The surrender could not be sent for approval. Either is it not open, or your are not the requestor.';
        end;


    end;

    procedure fnCancelImprestSurrenderApproval(employeeNo: Code[50]; imprestNumber: Code[50]) status: Text
    var
        tbl_payments: Record Payments;
        CustomApproval: Codeunit "Custom Approvals Codeunit";
        tbl_imprestLines: Record "Imprest Lines";
        Var_Variant: Variant;
    begin
        tbl_payments.Reset();
        tbl_payments.SetRange("No.", imprestNumber);
        tbl_payments.SetRange("Account No.", employeeNo);
        tbl_payments.SetRange(Status, tbl_payments.status::"Pending Approval");
        if tbl_payments.FindSet(true) then begin
            Var_Variant := tbl_payments;
            CustomApproval.OnCancelDocApprovalRequest(Var_Variant);
            status := 'success*Your approval request was successfully cancelled';
        end else begin
            status := 'danger* You could not cancel for approval. Either it is not open, or your are not the requestor.';
        end;



    end;

    procedure fnCancelImprestMemoApproval(employeeNo: Code[50]; imprestNumber: Code[50]) status: Text
    var
        tbl_memo: Record "Imprest Memo";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VarVariant: Variant;
    begin
        tbl_memo.Reset();
        tbl_memo.SETRANGE(Requestor, employeeNo);
        tbl_memo.SETRANGE("No.", imprestNumber);
        tbl_memo.SETRANGE(Status, Payments.Status::"Pending Approval");
        tbl_memo.SETRANGE("Document Type", tbl_memo."Document Type"::"Imprest Memo");

        IF tbl_memo.Findset(true) then begin
            VarVariant := tbl_memo;
            CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
            IF tbl_memo.GET(tbl_memo."No.") THEN BEGIN
                IF tbl_memo.Status = tbl_memo.Status::"Pending Approval" THEN BEGIN
                    status := 'warning*Your approval request could not be cancelled. Kindly try again or contact the administrator if this error persists';
                END ELSE BEGIN
                    status := 'success*Your approval request was successfully cancelled';
                END;
            end else begin
                status := 'danger*Approval workflow is not enabled';
            end;

        end else begin
            status := 'danger*Sorry, your approval request has already been cancelled or you are not the requestor.';

        end;

    end;

    procedure fnConvertFile(fileLink: Text; extensionType: Text; tableId: Integer; fileName: Text; recordNo: Code[30]; documentType: Integer) status: Text
    var
        tbl_documentAttachments: Record "Document Attachment";
        importFile: File;
        fileInstream: InStream;
        fileId: Guid;

    begin
        tbl_documentAttachments.Reset();
        tbl_documentAttachments.Init();
        tbl_documentAttachments."Table ID" := tableId;
        tbl_documentAttachments."File Name" := fileName;
        if documentType = 1 then begin
            tbl_documentAttachments."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition";
        end
        else if documentType = 11 then begin
            tbl_documentAttachments."Document Type" := tbl_documentAttachments."Document Type"::"Store Requisition";//PurchaseHeader."Document Type"::"Store Requisition";
        end;
        //  else if documentType = 2 then begin
        //                 tbl_documentAttachments."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition"

        // end else if documentType = 3 then begin
        //                 tbl_documentAttachments."Document Type" := PurchaseHeader."Document Type"::"Purchase Requisition";

        // end
        tbl_documentAttachments."Line No." := 10000;
        tbl_documentAttachments."No." := recordNo;
        tbl_documentAttachments."File Extension" := extensionType;
        if (extensionType.ToLower() = 'pdf') then begin
            tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::PDF;
        end else
            if (extensionType.ToLower() = 'docx') then begin
                tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Word;
            end
            else
                if (extensionType.ToLower() = 'xlsx') then begin
                    tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Excel;
                end else
                    if ((extensionType.ToLower() = 'png') OR (extensionType.ToLower() = 'jpeg') OR (extensionType.ToLower() = 'jpg')) then begin
                        tbl_documentAttachments."File Type" := tbl_documentAttachments."File Type"::Image;
                    end;
        importFile.Open(fileLink);
        importFile.CreateInstream(fileInstream);
        fileId := tbl_documentAttachments."Document Reference ID".ImportStream(fileInstream, fileName);
        if tbl_documentAttachments.Insert(true) then begin
            status := 'success*The document was successfully attached';
        end else begin
            status := 'error*An error occured during the process of creating a document link. kindly contact the administrator if this error persists';
        end;
        importFile.Close;

    end;


    // doing this because some documents may not exist in a folder, for example,the documents attached directly from Business central. 
    // process --> Export the file from the database and save the document in the server and then read the file from the server.
    procedure fnDownloadFile(fileName: Text; recordNo: Code[30]) status: Text
    var
        tbl_documentAttachments: Record "Document Attachment";
        exportFile: File;
        fileOutstream: OutStream;

    begin
        tbl_documentAttachments.Reset();
        tbl_documentAttachments.SetRange("No.", recordNo);
        tbl_documentAttachments.Setrange("File Name", fileName);
        if tbl_documentAttachments.findset then begin
            exportFile.Create(DOWNLOADFILEPATH + tbl_documentAttachments."File Name" + '.' + Format(tbl_documentAttachments."File Extension"));
            exportFile.CreateOUTSTREAM(fileOutstream);
            exportFile.Close();
            status := 'success*' + DOWNLOADFILEPATH + tbl_documentAttachments."File Name" + '.' + Format(tbl_documentAttachments."File Extension");
        end;
    end;
    // delete document
    procedure deleteFile(fileName: Text; recordNo: Code[30])
    var
        tbl_documentAttachments: Record "Document Attachment";

    begin
        tbl_documentAttachments.Reset();
        tbl_documentAttachments.SetRange("No.", recordNo);
        tbl_documentAttachments.Setrange("File Name", fileName);
        if tbl_documentAttachments.findset then begin
            tbl_documentAttachments.Delete(true);
        end;
    end;
    //approve record
    procedure fnApproveRequest(docNo: Code[20]; username: Text) data: Text
    var
        tbl_approvalEntry: Record "Approval Entry";
        approvalManagement: Codeunit "Approvals Mgmt.";
    begin
        tbl_approvalEntry.reset();
        tbl_approvalEntry.SetRange("Document No.", docNo);
        tbl_approvalEntry.Setrange("Approver ID", username);
        tbl_approvalEntry.Setrange(Status, tbl_approvalEntry.Status::Open);
        if tbl_approvalEntry.findset(true) then begin
            approvalManagement.ApproveApprovalRequests(tbl_approvalEntry);
            // check whether the record has been approved successfully
            tbl_approvalEntry.reset();
            tbl_approvalEntry.SetRange("Document No.", docNo);
            tbl_approvalEntry.Setrange("Approver ID", username);
            tbl_approvalEntry.SetRange(Status, tbl_approvalEntry.Status::Approved);
            if tbl_approvalEntry.findset(true) then begin
                data += 'success*The Record has been approved successfully';
            end else begin
                data += 'danger*Sorry, you could not approve the request. Kindly try again.'
            end;

        end else begin
            data += 'danger*Sorry, the record to be approved could not be found. You may have already approved it or you are not its approver. Kindly contact the ICT team for assistance';
        end;
        exit(data);

    end;
    //approve record
    procedure fnRejectRequest(docNo: Code[20]; username: Text; comment: Text) data: Text
    var
        tbl_approvalEntry: Record "Approval Entry";
        approvalManagement: Codeunit "Approvals Mgmt.";
        tbl_approvalCommentLine: Record "Approval Comment Line";
        userId: Code[20];
    begin
        userId := 'KURA\' + username;
        tbl_approvalEntry.reset();
        tbl_approvalEntry.SetRange("Document No.", docNo);
        tbl_approvalEntry.Setrange("Approver ID", userId);
        tbl_approvalEntry.Setrange(Status, tbl_approvalEntry.Status::Open);
        if tbl_approvalEntry.findset(true) then begin
            approvalManagement.RejectApprovalRequests(tbl_approvalEntry);


            //  tbl_approvalEntry.comment := true;
            // tbl_approvalEntry.modify(true);
            // 0xA60D0100027BFF530056003000300030003000350000000000;
            tbl_approvalCommentLine.INIT();
            tbl_approvalCommentLine."Table ID" := tbl_approvalEntry."Table ID";
            tbl_approvalCommentLine."Record ID to Approve" := tbl_approvalEntry."Record ID to Approve";
            tbl_approvalCommentLine."Document No." := tbl_approvalEntry."Document No.";
            tbl_approvalCommentLine."Document Type" := tbl_approvalEntry."Document Type";
            tbl_approvalCommentLine."Entry No." := 0;
            tbl_approvalCommentLine."User ID" := username;
            tbl_approvalCommentLine."Workflow Step Instance ID" := tbl_approvalEntry."Workflow Step Instance ID";
            tbl_approvalCommentLine.Comment := comment;

            tbl_approvalCommentLine.Insert(true);
            // check whether the record has been rejected successfully
            tbl_approvalEntry.reset();
            tbl_approvalEntry.SetRange("Document No.", docNo);
            tbl_approvalEntry.Setrange("Approver ID", username);
            tbl_approvalEntry.SetRange(Status, tbl_approvalEntry.Status::Rejected);
            if tbl_approvalEntry.findset(true) then begin
                data += 'success*The Record has been rejected successfully';
            end else begin
                data += 'danger*Sorry, you could not reject the request. Kindly try again.';
            end;

        end else begin
            data += 'danger*Sorry, the record to be rejected could not be found. You may have already rejected it or you are not its approver. Kindly contact the ICT team for assistance';
        end;
        exit(data);

    end;

    procedure addFuelExpenseLines(DocNo: Code[20]; ReceiptNo: Code[20]; amount: Decimal; DateOfFueling: Date; OtherExpenses: Decimal; driver: Text; regNo: Code[20]) status: Text
    var
        FuelLine: Record "Vehicle Fuel Card Lines";
    begin
        FuelLine.RESET();
        FuelLine.SetRange("No.", DocNo);
        FuelLine.SetRange("Reciept No", "ReceiptNo");
        if FuelLine.FindFirst then begin
            FuelLine.Amount := amount;
            FuelLine."Date of Fueling" := DateOfFueling;
            FuelLine."Other Expenses" := OtherExpenses;
            FuelLine.Driver := driver;
            FuelLine.Validate(Driver);
            FuelLine."Vehicle RegNo" := regNo;
            FuelLine.Validate("Vehicle RegNo");
            FuelLine.Testfield("Approval Status", FuelLine."Approval Status"::Open);
            if FuelLine.Modify(true) then begin
                status := 'Success*Fuel Expense Modified';
            end else begin
                status := 'Danger*Fuel Expense Could not be Modified';
            end;
        end
        else begin
            FuelLine.RESET();
            FuelLine.SetRange("No.", DocNo);
            if FuelLine.FindFirst then begin
                FuelLine.INIT();
                FuelLine."No." := DocNo;
                FuelLine.Validate("NO.");
                FuelLine."Reciept No" := ReceiptNo;
                FuelLine.Amount := amount;
                FuelLine."Date of Fueling" := DateOfFueling;
                FuelLine."Other Expenses" := OtherExpenses;
                FuelLine.Driver := driver;
                FuelLine.Validate(Driver);
                FuelLine."Vehicle RegNo" := regNo;
                FuelLine.Validate("Vehicle RegNo");
                if FuelLine.Insert(true) then Begin
                    status := 'Success*Fuel Expense Successfully Added';
                End
                else begin
                    status := 'Danger*Fuel Expense Could not Be Added';
                end;
            end
            else begin
                status := 'Danger*Fuel Expense Card Not Found';
            end;

        end;
    end;


    procedure sendFuelCardForApproval(CardNo: Code[20]; ReceiptNo: Code[20]) status: Text
    var
        FuelLine: Record "Vehicle Fuel Card Lines";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
    begin
        FuelLine.RESET();
        FuelLine.SetRange("No.", CardNo);
        FuelLine.SetRange("Reciept No", ReceiptNo);
        if FuelLine.FindFirst then begin
            VarVariant := FuelLine;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                CustomApprovals.OnSendDocForApproval(VarVariant);
            status := 'Success*Fuel Expense Sent For Approval Successfully';
        end
        else begin
            status := 'Danger*Failed to Send for Approval';
        end;

    end;



    procedure CancelFuelExpenseApprovalRequest(CardNo: Code[20]; ReceiptNo: Code[20]) status: Text
    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        FuelLine: Record "Vehicle Fuel Card Lines";
    begin
        FuelLine.RESET();
        FuelLine.SetRange("No.", CardNo);
        FuelLine.SetRange("Reciept No", ReceiptNo);
        if FuelLine.FindFirst then begin
            FuelLine.TESTFIELD("Approval Status", FuelLine."Approval Status"::"Pending Approval");
            VarVariant := FuelLine;
            CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
            WorkflowWebhookMgt.FindAndCancel(FuelLine.RecordId);
            status := 'Success*Fuel Expense Approval Cancelled Successfully';
        end
        else begin
            status := 'Danger*Failed to Cancel Approval';
        end;

    end;

    procedure deleteFuelExpenseLines(DocNo: Code[20]; ReceiptNo: Code[20]) status: Text
    var
        FuelLine: Record "Vehicle Fuel Card Lines";
    begin
        FuelLine.RESET();
        FuelLine.SetRange("No.", DocNo);
        FuelLine.SetRange("Reciept No", "ReceiptNo");
        if FuelLine.FindFirst then begin
            if FuelLine.DELETE(True) then begin
                status := 'Success*Fuel Expense Line Deleted Successfully';
            end
            else begin
                status := 'Danger*Error Deleteting Fuel Expense Line';
            end;
        end
        else begin
            status := 'Danger*Fuel Expense Line Not Found';
        end;
    end;



    procedure FnSendStoreRequisitionForApproval1(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        Plines: Record "Purchase Line";
    begin
        status := 'danger*The Store Requisition could not be sent for approval';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
        if PurchaseHeader.FindFirst() then begin

            begin
                PurchaseHeader.TestField(Description);
                PurchaseHeader.TestField("Shortcut Dimension 1 Code");
                PurchaseHeader.TestField("Shortcut Dimension 2 Code");
                Plines.Reset();
                Plines.SetRange("Document Type", PurchaseHeader."Document Type");
                Plines.SetRange("Document No.", PurchaseHeader."No.");
                if Plines.FindSet() then begin
                    repeat
                        // Plines.TestField("VAT Prod. Posting Group");
                        Plines.TestField("Location Code");
                        Plines.TestField("Unit of Measure");
                        // Plines.TestField("VAT Bus. Posting Group");
                        Plines.TestField("Gen. Bus. Posting Group");
                        Plines.TestField("Gen. Prod. Posting Group");
                    until Plines.Next() = 0;
                end;
                VarVariant := PurchaseHeader;
                //BYPASS EMPTY VENDOR
                if ApprovalsMgmt.CheckPurchaseApprovalPossible(PurchaseHeader) then BEGIN
                    IF PurchaseHeader."Buy-from Vendor No." = '' THEN
                        PurchaseHeader."Buy-from Vendor No." := 'VEND01186';
                END;
                IF PurchaseHeader."Buy-from Vendor No." = '' THEN
                    PurchaseHeader."Buy-from Vendor No." := 'VEND01186';
                if PurchaseHeader.amount = 0 then
                    PurchaseHeader.amount := 1;
                ApprovalsMgmt.OnSendPurchaseDocForApproval(PurchaseHeader);
                // Commit();
                IF PurchaseHeader.Status = PurchaseHeader.Status::"Pending Approval" THEN BEGIN
                    status := 'success*Your Store Requisition was successfully  sent for approval';
                END ELSE BEGIN
                    status := 'warning*Your Store Requisition could not be sent for approval. Kindly try again or contact the administrator if this error persists';
                END;

            end;

        end;
        exit(status);
    end;

    procedure CancelStoreRequisitionApprovalRequest(employeeNo: Code[50]; requisitionNo: Code[50]) status: Text
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
        VarVariant: Variant;
        CustomApprovalEntry: Record "Approval Entry";
        OldStatus: Option;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        TXT0002: label 'An approval request has been cancelled.';
    begin
        status := 'danger*The Store Requisition approval could not cancelled';
        PurchaseHeader.Reset;
        PurchaseHeader.SetRange("Request-By No.", employeeNo);
        PurchaseHeader.SetRange(Status, PurchaseHeader.Status::Open);
        PurchaseHeader.SetRange("No.", requisitionNo);
        PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::"Store Requisition");
        if PurchaseHeader.FindFirst() then begin
            CustomApprovalEntry.Reset;
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Document No.", requisitionNo);
            CustomApprovalEntry.SetRange(CustomApprovalEntry."Record ID to Approve", PurchaseHeader.RecordId);
            CustomApprovalEntry.SetFilter(CustomApprovalEntry.Status, '<>%1|<>%2', CustomApprovalEntry.Status::Canceled, CustomApprovalEntry.Status::Rejected);
            if CustomApprovalEntry.FindSet then
                repeat
                    CustomApprovalEntry.Status := CustomApprovalEntry.Status::Canceled;
                    CustomApprovalEntry.Modify(true);
                until CustomApprovalEntry.Next = 0;
            PurchaseHeader.Status := PurchaseHeader.Status::Open;
            PurchaseHeader."Cancelled?" := true;
            PurchaseHeader.Modify(true);
            IF PurchaseHeader.Status = PurchaseHeader.Status::"Open" THEN BEGIN
                status := 'success*Your Store Requisition was cancelled successfully';
            END ELSE BEGIN
                status := 'warning*Your Storre Requisition could not be Cancelled. Kindly try again or contact the administrator if this error persists';
            END;
        end;
    end;


    procedure fnCreateTrainingRequestHeader(DocumentNo: Code[20]; EmployeeNo: Code[20]; Desc: Text; financial: Code[20]; academic: Code[20]; aspirations: Text; training: Text; age: Text; years: Text) status: Text
    begin
        if DocumentNo <> '' then begin
            TrainingNeedsRequest.Reset;
            TrainingNeedsRequest.SetRange("Code", DocumentNo);
            TrainingNeedsRequest.SetRange("Employee No", EmployeeNo);
            if TrainingNeedsRequest.FindFirst() then Begin
                TrainingNeedsRequest.Code := DocumentNo;
                TrainingNeedsRequest.Validate(Code);
                TrainingNeedsRequest."Employee No" := EmployeeNo;
                TrainingNeedsRequest.Validate("Employee No");
                TrainingNeedsRequest.Description := Desc;
                TrainingNeedsRequest.Validate(Description);
                TrainingNeedsRequest."FY Code" := financial;
                TrainingNeedsRequest."Highest Academic Qualification" := academic;
                TrainingNeedsRequest."Career Aspirations" := aspirations;
                TrainingNeedsRequest."Training Programme Required" := training;
                TrainingNeedsRequest."Age Bracket" := age;
                TrainingNeedsRequest."Years Worked" := years;
                if TrainingNeedsRequest.Modify(true) then begin
                    status := 'Success*Training Request Modified Successfully*' + TrainingNeedsRequest.Code;
                end
                else begin
                    status := 'danger*Training Request Failed To Modify';
                end;
            End
            else begin
                status := 'danger*Training Request does not exist';
            end;
        end
        else begin
            TrainingNeedsRequest.init;
            TrainingNeedsRequest."Employee No" := EmployeeNo;
            TrainingNeedsRequest.Validate("Employee No");
            TrainingNeedsRequest.Description := Desc;
            TrainingNeedsRequest.Validate(Description);
            TrainingNeedsRequest."FY Code" := financial;
            TrainingNeedsRequest."Highest Academic Qualification" := academic;
            TrainingNeedsRequest."Career Aspirations" := aspirations;
            TrainingNeedsRequest."Training Programme Required" := training;
            TrainingNeedsRequest."Age Bracket" := age;
            TrainingNeedsRequest."Years Worked" := years;
            if TrainingNeedsRequest.INSERT(TRUE) then begin
                status := 'Success*Training Request Created Successfully*' + TrainingNeedsRequest.Code;
            end
            else begin
                status := 'danger*Training Request Failed To Create';
            end;

        end;

    end;

    procedure fnCreateTrainingRequestLines(DocumentNo: Code[20]; CourseId: Code[20]; Src: Option; Comment: Text) status: Text
    begin
        TrainingNeedsLine.INIT;
        TrainingNeedsLine."Training Header No." := DocumentNo;
        TrainingNeedsLine.Validate("Training Header No.");
        TrainingNeedsLine."Course ID" := CourseId;
        TrainingNeedsLine.Validate("Course ID");
        TrainingNeedsLine.Source := Src;
        TrainingNeedsLine.Comments := Comment;
        if TrainingNeedsLine.INSERT(True) then begin
            status := 'Success*Successfully created Training needs request line*' + TrainingNeedsLine."Training Header No.";
        end
        else begin
            status := 'danger*Failed to add training need request line';
        end;
    end;

    procedure fnCreatePettyCashSurrender(DocumentNo: Code[20]; EmployeeNo: Code[20]; ImprestNo: Code[20]) status: Text

    begin
        if DocumentNo <> '' then begin
            Payments.reset;
            Payments.SetRange("No.", DocumentNo);
            Payments.SetRange("Account No.", EmployeeNo);
            if Payments.FindFirst() then begin
                Payments."No." := DocumentNo;
                Payments."Account No." := EmployeeNo;
                Payments.Validate("Account No.");
                Payments."Imprest Issue Doc. No" := ImprestNo;
                Payments.Validate("Imprest Issue Doc. No");
                Payments."Payment Type" := Payments."Payment Type"::"Petty Cash Surrender";
                if Payments.Modify(True) then begin
                    status := 'Success*Successfully Modified petty cash surrender*' + Payments."No.";
                end else begin
                    status := 'danger*Failed to Modify petty cash surrender';
                end;

            end
            else begin
                status := 'danger*Petty Cash Surrender does not exist';
            end;
        end
        else begin
            Payments.INIT;
            Payments."Account No." := EmployeeNo;
            Payments.Validate("Account No.");
            Payments."Imprest Issue Doc. No" := ImprestNo;
            Payments.Validate("Imprest Issue Doc. No");
            Payments."Payment Type" := Payments."Payment Type"::"Petty Cash Surrender";
            Payments.Validate("Payment Type");
            if Payments.Insert(True) then Begin
                status := 'Success*Petty Cash Surrender Created Successfully*' + Payments."No.";
            End
            else begin
                status := 'danger*Petty Cash surrender failed to create';
            end;
        end;
    end;

    procedure fnSendApprovalRequestForPettyCashSurrender(DocumentNo: Code[20]) status: Text
    var
        Var_Variant: Variant;
        CustomApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
    begin
        Payments.reset;
        Payments.SetRange("No.", DocumentNo);
        if Payments.FindFirst() then begin
            Var_Variant := Payments;
            if CustomApprovalsMgmt.CheckApprovalsWorkflowEnabled(Var_Variant) then
                CustomApprovalsMgmt.OnSendDocForApproval(Var_Variant);
            if Payments.Status = Payments.Status::Open then begin
                status := 'success*Petty Cash Successfully Sent For approval';
            end
            else begin
                status := 'danger*Petty cash was not sent for approval';
            end;

        end;
    end;

    procedure fnCancelRequestForPettyCashSurrender(DocumentNo: Code[20]) status: Text
    var
        Var_Variant: Variant;
        CustomApprovalsMgmt: Codeunit "Custom Approvals Codeunit";

    begin
        Payments.reset;
        Payments.SetRange("No.", DocumentNo);
        if Payments.FindFirst() then begin
            Var_Variant := Payments;
            CustomApprovalsMgmt.OnCancelDocApprovalRequest(Var_Variant);
            if Payments.Status = Payments.Status::"Open" then begin
                status := 'success*Petty Cash approval Cancelled Successfully';
            end
            else begin
                status := 'danger*Petty cash approval was not Cancelled';
            end;

        end;
    end;

    procedure createPettySurrender(employeeNo: Code[50]; imprestNo: Code[50]; SurrenderNo: Code[50]; region: Code[10]; username: Text) status: Text
    begin
        status := 'danger*Your petty cash surrender could not be captured';
        if SurrenderNo = '' then begin //new imprest surrender

            Payments.Init;
            Payments."Document Type" := Payments."document type"::"Payment Voucher";
            Payments."Created By" := 'KURA\' + username.ToUpper();
            Payments.Validate("Document Type");
            Payments."Payment Type" := Payments."payment type"::"Petty Cash Surrender";
            Payments.Validate("Payment Type");
            Payments."Account Type" := Payments."account type"::Employee;
            Payments.Validate("Account Type");
            Payments."Account No." := employeeNo;
            // Payments."Responsibility Center":=region;
            //Payments.VALIDATE("Responsibility Center");
            Payments.Validate("Account No.");
            Payments."Imprest Issue Doc. No" := imprestNo;
            Payments.Validate("Imprest Issue Doc. No");
            if Payments.Insert(true) then begin
                Payments.Validate("Imprest Issue Doc. No");
                if Employee.Get(employeeNo) then begin
                    Payments."Responsibility Center" := Employee."Global Dimension 1 Code";
                    Payments."Shortcut Dimension 1 Code" := Employee."Global Dimension 1 Code";
                    Payments.Validate("Shortcut Dimension 1 Code");
                    pay.reset;
                    pay.SetRange("No.", imprestNo);
                    if pay.findfirst() then
                        pay."Surrender Created" := true;
                    if not pay.Modify(true) then begin
                        status := 'danger*failed to surrender';
                    end;

                end;
                Payments.Modify(true);

                status := 'success*Your petty cash surrender was successfully captured*' + Payments."No.";
            end else begin
                status := 'danger*Your petty cash surrender could not be captured';
            end;

        end else begin //existing
            Payments.Reset;
            Payments.SetRange("No.", SurrenderNo);
            Payments.SetRange("Account No.", employeeNo);
            Payments.SetRange(Status, Payments.Status::Open);
            if Payments.FindSet then begin
                if not (Payments."Imprest Issue Doc. No" = imprestNo) then begin
                    Payments."Imprest Issue Doc. No" := imprestNo;
                    Payments.Validate("Imprest Issue Doc. No");
                    Payments."Responsibility Center" := Employee."Global Dimension 1 Code";
                    if Payments.Modify(true) then begin
                        status := 'success*Your petty cash surrender was successfully updated';
                    end else begin
                        status := 'danger*Your petty cash surrender could not be updated';
                    end;
                end else begin
                    status := 'success*No changes to be done';
                end;
            end else begin
                status := 'danger*An petty cash surrender with the given number does not exist, you are not the owner or is no longer open';
            end;

        end;
        exit(status);
    end;


    procedure cancelStaffClaimRequestApproval(recordNo: Code[50]) status: Text
    var
        Var_Variant: Variant;
        CustomApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
    begin
        status := 'danger*The record approval could not be cancelled';
        Payments.Reset;
        Payments.SetRange("No.", recordNo);
        begin
            Var_Variant := Payments;
            CustomApprovalsMgmt.OnCancelDocApprovalRequest(Var_Variant);
            if Payments.Status = Payments.Status::Open then
                status := 'success*The record Cancelled Successfully';
        end;
    end;

    procedure fnCreateTrainingEducationAndProfesional(DocumentNo: Code[20]; education: Text; desc: Text; typ: Option) status: Text
    var
        courses: Record CoursesCurrentlyPursuing;
    begin
        courses.init;
        courses."Document No." := DocumentNo;
        courses.Validate("Document No.");
        courses.Name := education;
        courses.Description := desc;
        courses.Type := typ;
        if courses.INSERT(TRUE) then begin
            status := 'Success*Training Request Created Successfully*' + courses."Document No.";
        end
        else begin
            status := 'danger*Training Request Failed To Create';
        end;



    end;

    procedure fnCreateTrainingJobRequirements(DocumentNo: Code[20]; chall: Text; suggest: Text) status: Text
    var
        courses: Record DutyPerformanceChallenges;
    begin


        courses.init;
        courses."Document No." := DocumentNo;
        courses.Validate("Document No.");
        courses.Challenge := chall;
        courses."Training Suggested" := suggest;
        if courses.INSERT(TRUE) then begin
            status := 'Success*Training Request Created Successfully*' + courses."Document No.";
        end
        else begin
            status := 'danger*Training Request Failed To Create';
        end;


    end;

    procedure fnCreateTrainingAttended(DocumentNo: Code[20]; name: Text; duration: Option; support: boolean) status: Text
    var
        courses: Record EmpTrainingAttended;
    begin

        courses.init;
        courses."Document No." := DocumentNo;
        courses.Validate("Document No.");
        courses."Course Name" := name;
        courses."Duration Type" := duration;
        courses."With Support" := support;
        if courses.INSERT(TRUE) then begin
            status := 'Success*Training Request Created Successfully*' + courses."Document No.";
        end
        else begin
            status := 'danger*Training Request Failed To Create';
        end;

    end;

    procedure sendFuelTrainingRequestForApproval(docNo: Code[20]) status: Text
    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        TrainingNeedsHeader: Record "Training Needs Header";
    begin
        status := 'danger*Document failed to send for approval';
        TrainingNeedsHeader.Reset();

        TrainingNeedsHeader.SetRange(Code, docNo);
        begin
            TrainingNeedsHeader.TestField(Status, TrainingNeedsHeader.Status::Open);
            VarVariant := TrainingNeedsHeader;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN begin
                CustomApprovals.OnSendDocForApproval(VarVariant);
            end else begin
                status := 'success*Document successfully sent for Approval';
            end;
        end;
    end;

    procedure cancelFuelTrainingRequestApproval(docNo: Code[20]) status: Text
    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        TrainingNeedsHeader: Record "Training Needs Header";
    begin
        TrainingNeedsHeader.Reset();
        TrainingNeedsHeader.SetRange(Code, docNo);
        TrainingNeedsHeader.TestField(Status, TrainingNeedsHeader.Status::"Pending Approval");
        VarVariant := TrainingNeedsHeader;
        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
        IF TrainingNeedsHeader.Status = TrainingNeedsHeader.Status::Open THEN BEGIN
            status := 'success*Document Approval Successfully Cancelled';
        end
        else begin
            status := 'danger*Failed to Cancel the document';
        end;
    end;

    procedure fnCreateMemebershipFee(DocNo: Code[20]; Desc: Text) status: Text
    var
        membership: Record "Membership Fees Requisitions";
    begin
        if DocNo <> '' then begin
            membership.Reset;
            membership.SetRange("No.", DocNo);
            if membership.FindFirst then begin
                membership."No." := DocNo;
                Membership.Validate("No.");
                membership.Description := Desc;
                if membership.Modify(True) then begin
                    status := 'Success*Membership Fee Modified Successfully *' + membership."No.";

                end
                else begin
                    status := 'danger*Membership Fee failed to be modified';

                end;

            end;
        end
        else begin
            membership.init;
            membership."No." := DocNo;
            Membership.Validate("No.");
            membership.Description := Desc;
            if membership.Insert(True) then begin
                status := 'Success*Membership Fee Created Successfully*' + membership."No.";

            end
            else begin
                status := 'danger*Membership Fee failed to be created';

            end;



        end;

    end;

    procedure fnCreateProfessionalLines(DocumentNo: Code[20]; ProfBody: Code[20]) status: Text
    var
        subscriptionFee: Record "Professional Body Lines";
    begin
        subscriptionFee.init;
        subscriptionFee."Document No." := DocumentNo;
        subscriptionFee."Professional Body No." := ProfBody;
        subscriptionFee.Validate("Professional Body No.");
        if subscriptionFee.Insert(True) then begin
            status := 'Success*Successfully created Professional Body Lines';
        end
        else begin
            status := 'danger*Failed to Add Lines';
        end;

    end;

    procedure sendSubsriptionFeeForApproval(DocumentNo: Code[20]) status: Text
    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        membership: Record "Membership Fees Requisitions";
        DocumentAttachment: Record "Document Attachment";

    begin
        status := 'sucess*Successfully send Membership for approval';
        membership.Reset;
        membership.SetRange("No.", DocumentNo);
        if membership.FindFirst then begin
            // DocumentAttachment.Reset();
            // DocumentAttachment.SetRange("Table ID", membership.RecordId.TableNo);
            // DocumentAttachment.SetRange("No.", DocumentNo);
            // if not DocumentAttachment.FindFirst() then
            //     status := 'danger*Attach Supporting Documents';

            membership.TestField(Status, membership.Status::Open);
            VarVariant := membership;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN begin
                CustomApprovals.OnSendDocForApproval(VarVariant);

            end else begin
                status := 'danger*Failed to send Membership for approval';
            end;
        end;
    end;

    procedure cancelSubscriptionApproval(DocumentNo: Code[20]) status: Text
    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        membership: Record "Membership Fees Requisitions";
    begin
        status := 'success*Successfully sent Request for approval';
        membership.Reset;
        membership.SetRange("No.", DocumentNo);
        if membership.FindFirst then begin
            membership.TestField(Status, membership.Status::"Pending Approval");
            VarVariant := membership;
            CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
            if membership.Status = membership.Status::"Pending Approval" then
                status := 'danger*Failed To cancel Request for Approval';
        end;
    end;


    procedure deleteRequisitionLineSubscription(DocumentNo: Code[20]; LineNo: Integer) status: text
    var
        subscriptionFee: Record "Professional Body Lines";
    begin
        subscriptionFee.Reset;
        subscriptionFee.SetRange("Document No.", DocumentNo);
        subscriptionFee.SetRange("Line No.", LineNo);
        if subscriptionFee.FindFirst then begin
            if subscriptionFee.Delete(true) then begin
                status := 'success*Successfully deleted line';
            end
            else begin
                status := 'danger*Failed to delete document line';
            end;

        end;


    end;

    procedure fnCreateConferenceGeneralDetails(DocumentNo: Code[20]; nam: Text; startDate: Date; endDate: Date; hst: Text; ven: Text; pnts: Decimal) status: Text
    var
        subscriptions: Record "Subscriptions Conferences H";
    begin
        if DocumentNo <> '' then begin
            subscriptions.Reset;
            subscriptions.SetRange("No.", DocumentNo);
            if subscriptions.FindFirst then begin
                subscriptions."No." := DocumentNo;
                subscriptions.Name := nam;
                subscriptions."Conference Date" := startDate;
                subscriptions."Conference End Date" := enddate;
                subscriptions."Conference Venue" := ven;
                subscriptions."Points Per Member" := pnts;
                subscriptions."Conference Host" := hst;
                if subscriptions.Modify(True) then begin
                    status := 'Success*Subscription successfully modified*' + subscriptions."No.";
                end
                else begin
                    status := 'danger*Failed to modify Subscription';
                end;

            end

        end else begin
            subscriptions.init;
            subscriptions."No." := DocumentNo;
            subscriptions.Name := nam;
            subscriptions."Conference Date" := startDate;
            subscriptions."Conference End Date" := enddate;
            subscriptions."Conference Venue" := ven;
            subscriptions."Points Per Member" := pnts;
            subscriptions."Conference Host" := hst;
            if subscriptions.Insert(True) then begin
                status := 'Success*Subscription successfully added*' + subscriptions."No.";
            end
            else begin
                status := 'danger*Failed to add Subscription';
            end;
        end;
    end;

    procedure fnCreateConferenceMemberLines(DocumentNo: Code[20]; memborNo: Code[20]; crse: Decimal; earn: Decimal; feed: Text) status: Text
    var
        SubscriptionConferenceLines: Record "Subscription Conference Lines";
    begin
        SubscriptionConferenceLines.init;
        SubscriptionConferenceLines."Document No." := DocumentNo;
        SubscriptionConferenceLines."Member No." := memborNo;
        SubscriptionConferenceLines.Validate("Member No.");
        SubscriptionConferenceLines."Course Fee" := crse;
        SubscriptionConferenceLines."Points Earned" := earn;
        SubscriptionConferenceLines.feedback := feed;
        if SubscriptionConferenceLines.Insert(True) then begin
            status := 'success*Successfully added member conference Lines';
        end
        else begin
            status := 'danger*Failed to add lines';
        end;

    end;

    procedure deleteConferenceMemberLine(DocumentNo: Code[20]; LineNo: Integer) status: text
    var
        SubscriptionConferenceLines: Record "Subscription Conference Lines";
    begin
        SubscriptionConferenceLines.Reset;
        SubscriptionConferenceLines.SetRange("Document No.", DocumentNo);
        SubscriptionConferenceLines.SetRange("Line No.", LineNo);
        if SubscriptionConferenceLines.FindFirst then begin
            if SubscriptionConferenceLines.Delete(true) then begin
                status := 'success*Successfully deleted line';
            end
            else begin
                status := 'danger*Failed to delete document line';
            end;

        end;


    end;

    procedure fnCreateLeavePlannerHeader(DocumentNo: Code[20]; LeavePeriod: Code[20]; Direct: Code[20]; Dept: Code[20]; employee: Code[20]) status: Text
    var
        planner: Record "HR Leave Planner Header";
    begin
        if DocumentNo <> '' then begin
            planner.Reset;
            planner.SetRange("Application Code", DocumentNo);
            if planner.findFirst() then begin
                planner."Application Code" := DocumentNo;
                planner."Leave Period" := LeavePeriod;
                planner."Shortcut Dimension 3 Code" := Dept;
                planner.Directorate := Direct;
                planner."Employee NO" := employee;
                planner.Validate("Employee No");
                if planner.Modify(true) then begin
                    status := 'Success*Leave Planner Successfully Created*' + planner."Application Code";
                end
                else begin
                    Status := 'danger*Failed to create leave planner details';
                end;
            end

        end
        else begin
            planner.init;
            planner."Application Code" := DocumentNo;
            planner."Leave Period" := LeavePeriod;
            planner."Shortcut Dimension 3 Code" := Dept;
            planner.Directorate := Direct;
            planner."Employee NO" := employee;
            planner.Validate("Employee No");
            if planner.Insert(true) then begin
                status := 'Success*Leave Planner Successfully Created*' + planner."Application Code";
            end
            else begin
                Status := 'danger*Failed to create leave planner details';
            end;
        end;
    end;

    procedure fnCreatePlanningLines(DocNo: Code[20]; startDate: Date; NoOfDays: Integer; relieve: Code[20]; Period: Code[20]; employee: Code[20]) status: text
    var
        Leaveplan: Record "Leave Plan Detailed Lines";
    begin
        Leaveplan.init;
        Leaveplan."Document No." := DocNo;
        Leaveplan."Start Date" := startDate;
        Leaveplan."Days Applied" := NoOfDays;
        Leaveplan.Validate("Days Applied");
        Leaveplan.reliever := relieve;
        Leaveplan.Validate(reliever);
        Leaveplan."Leave Period" := Period;
        Leaveplan."Employee NO." := employee;
        Leaveplan.Validate("Employee No.");
        if Leaveplan.Insert(True) then begin
            status := 'Success*Successfully Added Planning Line';
        end else begin
            status := 'danger*Failed to Add planning line';
        end;

    end;

    procedure deleteLeavePlanningLine(DocumentNo: Code[20]; LineNo: Integer) status: text
    var
        Leaveplan: Record "Leave Plan Detailed Lines";
    begin
        Leaveplan.Reset;
        Leaveplan.SetRange("Document No.", DocumentNo);
        Leaveplan.SetRange("Line No.", LineNo);
        if Leaveplan.FindFirst then begin
            if Leaveplan.Delete(true) then begin
                status := 'success*Successfully deleted line';
            end
            else begin
                status := 'danger*Failed to delete document line';
            end;

        end;


    end;



    procedure sendLeavePlanningForApproval(DocumentNo: Code[20]) status: Text
    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        planner: Record "HR Leave Planner Header";
        DocumentAttachment: Record "Document Attachment";

    begin
        status := 'sucess*Successfully sent Leave Planner for approval';
        planner.Reset;
        planner.SetRange("Application Code", DocumentNo);
        if planner.FindFirst then begin

            planner.TestField("Approval Status", planner."Approval Status"::Open);
            VarVariant := planner;
            IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN begin
                CustomApprovals.OnSendDocForApproval(VarVariant);

            end else begin
                status := 'danger*Failed to send Leave Planner for approval';
            end;
        end;
    end;

    procedure cancelLeavePlannerApproval(DocumentNo: Code[20]) status: Text
    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        planner: Record "HR Leave Planner Header";
    begin
        status := 'success*Successfully sent Request for approval';
        planner.Reset;
        planner.SetRange("Application Code", DocumentNo);
        if planner.FindFirst then begin
            planner.TestField("Approval Status", planner."Approval Status"::"Pending Approval");
            VarVariant := planner;
            CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
            if planner."Approval Status" = planner."Approval Status"::"Pending Approval" then
                status := 'danger*Failed To cancel Request for Approval';
        end;
    end;

    procedure fncreateLeavePlannerLinesForEmp(DocNo: Code[20]; empNo: Code[20]) status: Text
    var
        HRLeavePlannerLines: Record "HR Leave Planner Lines";
    begin
        HRLeavePlannerLines.Init();
        HRLeavePlannerLines."Application Code" := DocNo;
        HRLeavePlannerLines.Validate("Application Code");
        HRLeavePlannerLines."Employee No" := empNo;
        HRLeavePlannerLines.Validate("Employee No");
        if HRLeavePlannerLines.Insert(True) then begin
            status := 'Success*Added';
        end else begin
            status := 'danger*Failed';
        end;

    end;

    procedure deleteLeavePlannerLine(DocumentNo: Code[20]; LineNo: Integer) status: text
    var
        Leaveplan: Record "HR Leave Planner Lines";
    begin
        Leaveplan.Reset;
        Leaveplan.SetRange("Application Code", DocumentNo);
        Leaveplan.SetRange("Line No.", LineNo);
        if Leaveplan.FindFirst then begin
            if Leaveplan.Delete(true) then begin
                status := 'success*Successfully deleted line';
            end
            else begin
                status := 'danger*Failed to delete document line';
            end;

        end;


    end;

    procedure fnCreatePerformanceHeader(DocumentNo: Code[20]; EmpNo: Code[20]; Review: Code[20]; ScoreCard: Code[20]; supervisor: Code[20]; secondsupervisor: Code[20]; Desc: Text; competencyTemplate: Code[20]; reportingCode: Code[20]; strategyPlan: Code[20]; perfomanceMng: Code[20]; perfomanceTask: Code[20]; documentDate: Date; lastEvalution: Date) status: Text
    var
        appraisal: Record "Perfomance Evaluation";
    begin

        if DocumentNo <> '' then begin
            appraisal.Reset;
            appraisal.SetRange("No", DocumentNo);
            if appraisal.findFirst() then begin
                appraisal."No" := DocumentNo;
                appraisal."Employee No." := EmpNo;
                appraisal.Validate("Employee No.");
                appraisal."Review Period" := review;
                appraisal.Validate("Review Period");
                appraisal.Description := Desc;
                appraisal."Personal Scorecard ID" := ScoreCard;
                appraisal.Validate("Personal Scorecard ID");
                appraisal."Supervisor Staff No." := supervisor;
                appraisal.Validate("Supervisor Staff No.");
                appraisal."Second Supervisor Staff No." := secondsupervisor;
                appraisal.Validate("Second Supervisor Staff No.");
                appraisal."Competency Template ID" := competencyTemplate;
                appraisal.Validate("Competency Template ID");
                appraisal."Strategy Plan ID" := strategyPlan;
                appraisal.Validate("Strategy Plan ID");
                appraisal."Annual Reporting Code" := reportingCode;
                appraisal.Validate("Annual Reporting Code");
                appraisal."Performance Mgt Plan ID" := perfomanceMng;
                appraisal.Validate("Performance Mgt Plan ID");
                appraisal."Performance Task ID" := perfomanceTask;
                appraisal.Validate("Performance Task ID");
                appraisal."Document Date" := documentDate;
                appraisal."Last Evaluation Date" := lastEvalution;

                if appraisal.Modify(true) then begin
                    status := 'Success*Perfomance Appraisal Successfully Created*' + appraisal."No";
                end
                else begin
                    Status := 'danger*Failed to create Perfomance Appraisal details';
                end;
            end

        end
        else begin
            appraisal.init;
            appraisal."No" := DocumentNo;
            appraisal."No" := DocumentNo;
            appraisal.Validate("Employee No.");
            appraisal."Review Period" := review;
            appraisal.Validate("Review Period");
            appraisal.Description := Desc;
            appraisal."Personal Scorecard ID" := ScoreCard;
            appraisal.Validate("Personal Scorecard ID");
            appraisal."Supervisor Staff No." := supervisor;
            appraisal.Validate("Supervisor Staff No.");
            appraisal."Second Supervisor Staff No." := secondsupervisor;
            appraisal.Validate("Second Supervisor Staff No.");
            appraisal."Competency Template ID" := competencyTemplate;
            appraisal.Validate("Competency Template ID");
            appraisal."Strategy Plan ID" := strategyPlan;
            appraisal.Validate("Strategy Plan ID");
            appraisal."Annual Reporting Code" := reportingCode;
            appraisal.Validate("Annual Reporting Code");
            appraisal."Performance Mgt Plan ID" := perfomanceMng;
            appraisal.Validate("Performance Mgt Plan ID");
            appraisal."Performance Task ID" := perfomanceTask;
            appraisal.Validate("Performance Task ID");
            appraisal."Document Date" := documentDate;
            appraisal."Last Evaluation Date" := lastEvalution;
            if appraisal.Insert(true) then begin
                status := 'Success*Perfomance Appraisal Successfully Created*' + appraisal."No";
            end
            else begin
                Status := 'danger*Failed to create Perfomance Appraisal details';
            end;
        end;
    end;


    procedure fnCreateMidYrAppraisal(DocNo: Code[20]; results: Decimal; rsn: Text; lineNo: Integer) status: Text
    var
        Targets: Record NewAndChangedApprTargets;
    begin
        Targets.Reset;
        Targets.SetRange("Document No.", DocNo);
        Targets.SetRange("Line No.", lineNo);
        if Targets.FindFirst() then begin
            Targets."Document No." := DocNo;
            Targets.Validate("Document No.");
            Targets."Results Achieved" := results;
            Targets.Validate("Results Achieved");
            Targets.Reasons := rsn;
            if Targets.Modify(True) then begin
                status := 'success*Successfully modified Mid Year Appraisal Line';
            end else begin
                status := 'danger*Failed to modify Mid Year Appraisal Line';
            end;
        end;
    end;
procedure fnCreateMidYrAppraisal1(DocNo: Code[20]; targett:Text;TargetQty:Decimal;results: Decimal; rsn: Text) status: Text
    var
        Targets: Record NewAndChangedApprTargets;
    begin
        Targets.Reset;
        Targets.SetRange("Document No.", DocNo);
        if Targets.FindFirst() then begin
            Targets."Document No." := DocNo;
            Targets.Validate("Document No.");
            Targets."Results Achieved" := results;
            Targets.Validate("Results Achieved");
            Targets.Reasons := rsn;
            Targets.Target:=targett;
            Targets.Validate(Target);
            Targets."Target Qty":=TargetQty;
            TArgets.Validate("Target Qty");
            if Targets.Insert(True) then begin
                status := 'success*Successfully Inserted Mid Year Appraisal Line';
            end else begin
                status := 'danger*Failed to Insert Mid Year Appraisal Line';
            end;
        end;
    end;

    procedure fnCreateObjectivesAndOutcomes(DocNo: Code[20]; results: Decimal; rsn: Text; lineNo: Integer) status: Text
    var
        Targets: Record "Objective Evaluation Result";
    begin
        Targets.Reset;
        Targets.SetRange("Performance Evaluation ID", DocNo);
        Targets.SetRange("Line No", lineNo);
        if Targets.FindFirst() then begin
            Targets."Performance Evaluation ID" := DocNo;
            Targets.Validate("Performance Evaluation ID");
            Targets."Achieved Result" := results;
            Targets.Validate("Achieved Result");
            Targets.Reasons := rsn;
            if Targets.Modify(True) then begin
                status := 'success*Successfully modified Objectives And Outcomes Line';
            end else begin
                status := 'danger*Failed to modify Objectives And Outcomes Line';
            end;
        end;
    end;

    var

    procedure fnCreateObjectivesAndOutcomes(DocNo: Code[20]; results: Decimal; lineNo: Integer) status: Text
    var
        Targets: Record "Proficiency Evaluation Result";
    begin
        Targets.Reset;
        Targets.SetRange("Performance Evaluation ID", DocNo);
        Targets.SetRange("Line No", lineNo);
        if Targets.FindFirst() then begin
            Targets."Performance Evaluation ID" := DocNo;
            Targets.Validate("Performance Evaluation ID");
            Targets."Achieved Result" := results;
            Targets.Validate("Achieved Result");
            if Targets.Modify(True) then begin
                status := 'success*Successfully modified Proficiency Evaluation Result Line';
            end else begin
                status := 'danger*Failed to modify Proficiency Evaluation Result Line';
            end;
        end;
    end;

    procedure fnCreateRecommendations(DocNo: Code[20]; recoType: Option; reco: Text) status: Text
    var
        Targets: Record "Perfomance Evaluation";
    begin
        Targets.Reset;
        Targets.SetRange(No, DocNo);
        Targets.SetRange("Document Type", Targets."Document Type"::"Performance Appraisal");
        Targets.SetRange("Document Status", Targets."Document Status"::"Draft");
        if Targets.FindFirst() then begin
            Targets.No := DocNo;
            Targets."Recommendation Type" := recoType;
            //Targets."R" :=reco;
            if Targets.Modify(True) then begin
                status := 'success*Successfully Added Recommendations';
            end else begin
                status := 'danger*Failed to Add Recommendations';
            end;
        end;
    end;


    procedure fnCreateEvaluation(DocNo: Code[20]; pipNumber: Integer; desc: Text; improveGoal: Text; actionAchieved: Text; startDate: Date; endDate: Date) status: Text
    var
        EvaluationPIP: Record "Evaluation PIP";
    begin
        EvaluationPIP.init;
        EvaluationPIP."Perfomance Evaluation No" := DocNo;
        EvaluationPIP.Validate("Perfomance Evaluation No");
        EvaluationPIP."PIP Number" := pipNumber;
        EvaluationPIP.Description := desc;
        EvaluationPIP."Improvement Goal" := improveGoal;
        EvaluationPIP."Action Required" := actionAchieved;
        EvaluationPIP."Start Date" := startDate;
        EvaluationPIP."End Date" := endDate;
        if EvaluationPIP.Insert(True) then begin
            status := 'success*Evaluation PIP successfully added successfully*' + EvaluationPIP."Perfomance Evaluation No";
        end
        else begin
            status := 'danger*Failed to add Evalution PIP';
        end;

    end;

     procedure deleteMidYearEvaluationLine(DocumentNo: Code[20]; LineNo: Integer) status: text
    var
        MidYear: Record NewAndChangedApprTargets;
    begin
        MidYear.Reset;
        MidYear.SetRange("Document No.", DocumentNo);
        MidYear.SetRange("Line No.", LineNo);
        if MidYear.FindFirst then begin
            if MidYear.Delete(true) then begin
                status := 'success*Successfully deleted line';
            end
            else begin
                status := 'danger*Failed to delete document line';
            end;

        end;


    end;




}
