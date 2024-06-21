#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 50004 "Contract Employee Notification"
{
    ProcessingOnly = true;
    ApplicationArea = Basic;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Employee_; Employee)
        {

            trigger OnAfterGetRecord()
            begin
                Employee_.Reset();
                Employee_.SetRange("Employement Terms", Employee_."Employement Terms"::Contract);
                Employee_.SetFilter("Contract End Date", '<>%1', 0D);
                if Employee_.FindFirst() then begin
                    if CalcDate('1M', "Contract End Date") <= Today then begin
                        Recipients.Add('mwanaambai.jc@gmail.com');
                        EmailMessage.Create(Recipients, 'Failed Contract Employee Notifications', sText0001, true);
                        EmailMessage.AppendToBody('<BR><BR>');
                        EmailMessage.AppendToBody('<table border="1">' +
                        '<tr><th>Employees with contract expiring</th>' +
                        '<th>Employee_."No."</th>' +
                        '<th>Employee_.FullName</th>' +
                        '<th>Employee_."Contract End Date"</th>' +
                        '</tr>');
                        EmailMessage.AppendToBody('</table>');
                        EmailMessage.AppendToBody('<CR><LF>');

                        Smail.Send(EmailMessage, Enum::"Email Scenario"::Notification);
                    end;
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
        Smail: Codeunit Email;
        EmmailAccount: Record "Email Account";
        EmailMessage: Codeunit "Email Message";
        HumanResourcesSetup: Record "Human Resources Setup";
        SenderName: Text[250];
        SenderEmailAddress: Text[250];
        //Receipients: Text[250];
        Subject: Text[250];
        Body: Text[250];
        Employee: Record Employee;
        ImprestNotificationsSetup: Record "Imprest Notifications Setup";
        MailMgt: Codeunit "Mail Management";
        sText0001: Label 'The following employees have their contracts expiring next month';
        Recipients: List of [Text];
        SenderList: List of [Text];
        BodyMessage: Text;
}