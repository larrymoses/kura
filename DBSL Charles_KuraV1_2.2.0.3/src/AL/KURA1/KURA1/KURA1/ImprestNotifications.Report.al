#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 57092 "Imprest Notifications"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(payments; payments)
        {
            DataItemTableView = where("Payment Type" = const(Imprest), Posted = const(true), Status = const(Released), Surrendered = const(false));

            trigger OnAfterGetRecord()
            begin
                HumanResourcesSetup.Get;
                //ImprestNotificationsSetup.GET;
                SenderName := CompanyProperty.DisplayName;
                HumanResourcesSetup.TestField("HR E-mail Address");
                SenderEmailAddress := HumanResourcesSetup."HR E-mail Address";
                if payments."Imprest Deadline" <= Today then begin
                    Employee.Reset;
                    Employee.SetRange(Employee."No.", payments."Account No.");
                    if Employee.FindSet then
                        //Receipients := Employee."Company E-Mail";
                        // Message(Receipients);
                    Receipients.Add(Employee."Company E-Mail");
                    Subject := 'OVERDUE IMPREST(S)';
                    Body := 'Dear' + ' ' + payments."Account Name" + '<br>';
                    Body := Body + ' ' + 'Please note that you have not surrendered imprest(s)' + payments."No." + '<br>';
                    Body := Body + ' ' + 'Kind Regards,' + '<br>';
                    Body := Body + ' ' + CompanyProperty.DisplayName;
                    //SMTPMail.CreateMessage(SenderName,SenderEmailAddress,Receipients,Subject,Body,true);
                    SMTPMail.Create(format(Receipients), Subject, Body);
                    //SMTPMail.Send();
                    Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);

                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        SMTPMailSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        HumanResourcesSetup: Record "Human Resources Setup";
        SenderName: Text[250];
        SenderEmailAddress: Text[250];
        Receipients: List of [Text];
        Subject: Text[250];
        Body: Text[250];
        Employee: Record Employee;
        ImprestNotificationsSetup: Record "Imprest Notifications Setup";
        InsuranceNotifications: Codeunit "Insurance Notifications";
        Smail: Codeunit EMail;
}

