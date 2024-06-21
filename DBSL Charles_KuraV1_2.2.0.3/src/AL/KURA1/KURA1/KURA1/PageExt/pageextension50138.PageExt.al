/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
PageExtension 50138 "pageextension50138" extends "Set Password"
{
    // var
    //     EmailNotifications: Codeunit "Email Notifications";
    //     SenderEmailAddress: Text[250];
    //     SenderName: Text[250];
    //     RecipientsMail: Text[250];
    //     Subject: Text[250];
    //     Body: Text;
    //     UserSetup: Record "User Setup";
    //     CInfo: Record "Company Information";


    // //Unsupported feature: Code Modification on "OnQueryClosePage".

    // //trigger OnQueryClosePage(CloseAction: Action): Boolean
    // //>>>> ORIGINAL CODE:
    // //begin
    //     /*
    //     IF CloseAction = ACTION::OK THEN BEGIN
    //       IF SetPassword <> ConfirmPassword THEN
    //         ERROR(Text001);
    //       IF IdentityManagement.ValidatePasswordStrength(SetPassword) THEN BEGIN
    //         SETUSERPASSWORD("User Security ID",SetPassword);
    //       END ELSE
    //         ERROR(Text002);
    //     END
    //     */
// //end;
// //>>>> MODIFIED CODE:
// //begin
//     /*
//     #1..7
//     END;

//     //Engineer Added
//     FnNotifyUserOfPasswordCHange();
//     */
// //end;

// local procedure FnNotifyUserOfPasswordCHange()
// begin
//     if ((SetPassword <> '') and (ConfirmPassword <> '')) then begin
//     if UserSetup.Get("User Name") then begin
//     CInfo.Get;
//     SenderEmailAddress:=CInfo."Administrator Email";
//     SenderName:='ERP AUTOMATIC MAILS';
//     RecipientsMail:=UserSetup."E-Mail";
//     Subject:='PASSWORD CHANGE';
//     Body:='<br>Please note that your password has been changed by'+' '+UserId+' '+'Please if you did not request for a password change report to your immediate supervisor</br>';
//     Body:=Body+'<br><b>Kind Regards,</b></br>';
//     Body:=Body+'<br><b>ERP AUTOMATIC MAILS</b></br>';
//     EmailNotifications.FnSendEmail(SenderEmailAddress,SenderName,RecipientsMail,Subject,Body);
//     end
//     end;
// end;

