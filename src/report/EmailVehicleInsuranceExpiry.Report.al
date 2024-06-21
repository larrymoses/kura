#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Report 59008 "Email Vehicle Insurance Expiry"
{
    ProcessingOnly = true;
    ShowPrintStatus = false;

    dataset
    {
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

    trigger OnPostReport()
    begin
        //FileDirectory :=  'E:\DOCS';
        //REPORT.SAVEASPDF(59006,FileDirectory+Filename);
        //IF Emp.GET('00005') THEN BEGIN
        FleetManagementSetup.Get;
        SentMail := FleetManagementSetup."Transport Admin Email";
        Header := 'VEHICLE INSURANCE EXPIRY ALERT ';

        /*if SMTPSetup.Get() then begin
         // SenderEmail:=SMTPSetup."Email Sender Address";
          //SenderName:= SMTPSetup."Email Sender Name";
        end;
        if SentMail <> '' then begin
          SMTPMail.CreateMessage(SenderName,SenderEmail,SentMail,Header,'',true);
          SMTPMail.AppendBody('<br><br>');
          SMTPMail.AppendBody('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
          SMTPMail.AppendBody('<br><br>');
          SMTPMail.AppendBody('Please note that the vehicle insurance is due to expire within a month.');// for the month of January 2014');
          SMTPMail.AppendBody('<br><br>');
          SMTPMail.AppendBody('Thanks & Regards');
          SMTPMail.AppendBody('<br><br>');
          SMTPMail.AppendBody(SenderName);
          SMTPMail.AppendBody('<br><br>');
          //SMTPMail.AddAttachment(FileDirectory+Filename,Filename);
          SMTPMail.AppendBody('<HR>');
          SMTPMail.AppendBody('This is a system generated mail.');
          SMTPMail.AppendBody('<br><br>');
          SMTPMail.Send;
          Message('Mail sent to %1',SentMail);*/
    end;
    //End email
    // END;
    //end;

    var
        Filename: Text;
        // SMTPSetup: Record "SMTP Mail Setup";
        //SMTPMail: Codeunit UnknownCodeunit400;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Emp: Record Employee;
        FileDirectory: Text[100];
        FleetManagementSetup: Record "Fleet Management Setup";
        SentMail: Text;
}
