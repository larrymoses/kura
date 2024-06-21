/// <summary>
/// Codeunit HR Job Queue (ID 50020).
/// </summary>
codeunit 50020 "HR Job Queue"
{
    trigger OnRun()
    begin
        NotifyHROnStaffRetirements();
        NotifyAdminFees2BPaid();
       /// ExpireDelegations;
    end;

    local procedure ExpireDelegations()
    var
        DocumentApprovalDelegation: Record "Document Approval Delegation";
    begin
        DocumentApprovalDelegation.Reset();
        DocumentApprovalDelegation.SetRange(Status, DocumentApprovalDelegation.Status::Processed);
        DocumentApprovalDelegation.SetRange(Delegated, true);
        DocumentApprovalDelegation.SetFilter("End Date", '<%1', Today);
        if DocumentApprovalDelegation.FindSet() then begin
            repeat
                DocumentApprovalDelegation.Status := DocumentApprovalDelegation.Status::Expired;
                DocumentApprovalDelegation.Modify();
            until DocumentApprovalDelegation.Next() = 0;
        end;
    end;

    local procedure NotifyHROnStaffRetirements()
    var
        Employee: Record Employee;
        HRSetup: Record "Human Resources Setup";
        EmailRemindersHeader: Record "Email Reminders Header";
        EmailReminderLines: Record "Email Reminder Lines";
        EmailReminderRecepients: Record "Email Reminder Recepients";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        EmailCCRecepient: List of [Text];
        EmailBCCRecepient: List of [Text];
        DueDate: Date;
        DateTxt: Text;
        // txt: Label '%1';
    begin
        HRSetup.Get();

        EmailReminderRecepients.Reset();
        EmailReminderRecepients.SetRange("Document No.", HRSetup."Retirements Notification Temp.");
        EmailReminderRecepients.SetRange("Recepient Type", EmailReminderRecepients."Recepient Type"::Main);
        if EmailReminderRecepients.FindSet() then
            repeat
                EmailRecepient.Add(EmailReminderRecepients."Employee Email");
            until EmailReminderRecepients.Next() = 0;

        EmailReminderRecepients.Reset();
        EmailReminderRecepients.SetRange("Document No.", HRSetup."Retirements Notification Temp.");
        EmailReminderRecepients.SetRange("Recepient Type", EmailReminderRecepients."Recepient Type"::CC);
        if EmailReminderRecepients.FindSet() then
            repeat
                EmailCCRecepient.Add(EmailReminderRecepients."Employee Email");
            until EmailReminderRecepients.Next() = 0;

        EmailReminderRecepients.Reset();
        EmailReminderRecepients.SetRange("Document No.", HRSetup."Retirements Notification Temp.");
        EmailReminderRecepients.SetRange("Recepient Type", EmailReminderRecepients."Recepient Type"::BCC);
        if EmailReminderRecepients.FindSet() then
            repeat
                EmailBCCRecepient.Add(EmailReminderRecepients."Employee Email");
            until EmailReminderRecepients.Next() = 0;

        EmailReminderLines.Reset();
        EmailReminderLines.SetRange("Document No.", HRSetup."Retirements Notification Temp.");
        if EmailReminderLines.FindSet() then
            repeat
                DueDate := 0D;
                DateTxt := Format('<+') + Format(EmailReminderLines.Duration) + Format(EmailReminderLines."Duration Type") + Format('>');
                // Message(DateTxt);
                DueDate := CalcDate(DateTxt, Today);
                Employee.Reset();
                Employee.SetRange(Status, Employee.Status::Active);
                Employee.SetRange("Retirement Date", DueDate);
                if Employee.FindSet() then
                    repeat
                        EmailSubject := 'STAFF RETIREMENT REMINDER';
                        EmailBody := 'This is to remind you that' + ' <B>' + Employee.FullName() +
                        '</B> will be retiring on date' + ' <B>' + Format(Employee."Retirement Date") + '</B>.';

                        EmailMessage.Create(
                            EmailRecepient,
                            EmailSubject,
                            EmailBody,
                            true,
                            EmailCCRecepient,
                            EmailBCCRecepient);

                        Email.Send(EmailMessage);
                    until Employee.Next() = 0;
            until EmailReminderLines.Next() = 0;

        // DueDate := CalcDate('<+3M>', Today);

    end;

    local procedure NotifyAdminFees2BPaid()
    var
        PBody: Record "Professional Bodies";
        SubSetup: Record SubscriptionSetup;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        HRSetup: Record "Human Resources Setup";
        EmailSubject: Text;
        EmailBody: Text;
        EmailRecepient: List of [Text];
        EmailCCRecepient: List of [Text];
        EmailBCCRecepient: List of [Text];
        DueDate: Date;
    begin
        SubSetup.Get();
        DueDate := 0D;
        DueDate := CalcDate('<+1M>', Today);
        PBody.Reset();
        PBody.SetRange(Blocked, false);
        PBody.SetRange("Due Date", DueDate);
        if PBody.FindSet() then
            repeat
                EmailSubject := 'FEE PAYMENT REMINDER';
                EmailBody := 'This is to remind you that the payment fees for Professional Body:' + ' <B>' + PBody."No." + ':' + PBody.Name + '</B> will be due on date' + ' <B>' + Format(PBody."Due Date") + '</B>.';

                EmailRecepient.Add(SubSetup."Admin E-Mail");
                // EmailCCRecepient.Add(Emp."E-Mail");

                EmailMessage.Create(
                    EmailRecepient,
                    EmailSubject,
                    EmailBody,
                    true,
                    EmailCCRecepient,
                    EmailBCCRecepient);

                Email.Send(EmailMessage);

            until PBody.Next() = 0;
    end;
}
