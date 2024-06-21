#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Codeunit 50002 "Custom Notifications"
{

    // trigger OnRun()
    // begin
    //      SendMaintenanceNotifications;
    //      SendMaintenancereminder;
    //      FnSendHODNotificationIfOfficerHasNotOpenedARFX(ObjProcReq);
    //      FnSendMailAlertOnTenderOpeningDue(ObjProcReq,ObjProcReq.No);
    //      FnSendCommMemberNotificationOneDayBeforeTenderOpening(ObjProcReq,ObjProcReq.No);
    //      FnSendNotificationsOnItemReorderPoint(ItemS);
    // end;

    // var
    //     Factry: Codeunit UnknownCodeunit51511015;
    //     HrSetup: Record "Human Resources Setup";
    //     SmtpSet: Record "Email Account";
    //     Comp: Record "Company Information";
    //     Sender: Text;
    //     Reciept: Text;
    //     Body: Text;
    //     Subject: Text;
    //     Maintenance: Record Maintenance;
    //     PsetUp: Record "Purchases & Payables Setup";
    //     ObjProcReq: Record "Procurement Request";
    //     ItemS: Record Item;

    // local procedure SendMaintenanceNotifications()
    // var
    //     Scheds: Record "Maintenance Registration";
    //     Factry: Codeunit UnknownCodeunit51511015;
    // begin
    //     HrSetup.Get;
    //     Comp.Get;
    //     SmtpSet.Get;
    //     Scheds.Reset;
    //     Scheds.SetRange(Activate,true);
    //     if Scheds.Find('-') then begin
    //       repeat

    //         //For New Schedules
    //         if Scheds."Last Date Done"=0D then begin
    //           end;
    //         //For Existing Schedules
    //         if Scheds."Next Maintenance Date"=Today then begin

    //           Sender:=SmtpSet."User ID";
    //           Reciept:=Comp."Administrator Email";
    //           Subject:='Maintenance Schedule';
    //           Body:='This is to inform you that Maintenance Schedule- '+Scheds."Scheduled Task"+' was planned to be ';
    //           Body:=Body+'excecuted today.<p> Regards<br>ERP Scheduled Reminders.';
    //           Factry.FnSendEmail(Sender,'Sender Name',Reciept,Subject,Body);
    //           Scheds."Next Maintenance Date":=CalcDate(Scheds.Intervals,Today);
    //           Scheds.Modify;

    //           end;

    //         //Notify when notification period reached
    //         if CalcDate(Scheds."Notification Period",Today)=Scheds."Next Maintenance Date" then begin
    //           Sender:=SmtpSet."User ID";
    //           Reciept:=Comp."Administrator Email";
    //           Subject:='Maintenance Schedule';
    //           Body:='This is to inform you that Maintenance Schedule- '+Scheds."Scheduled Task"+' is planned to be ';
    //           Body:=Body+'excecuted on '+Format(Scheds."Next Maintenance Date")+'.<p> Regards<br>ERP Scheduled Reminders.';
    //           Factry.FnSendEmail(Sender,'Sender Name',Reciept,Subject,Body);

    //           end;
    //         until Scheds.Next=0;
    //       end;
    // end;

    // local procedure SendMaintenancereminder()
    // begin
    //     Maintenance.Reset;
    //     Maintenance.SetRange(Category,Maintenance.Category::Maintenance);
    //     Maintenance.SetRange("Maintenance Status",Maintenance."maintenance status"::Reported);
    //     if Maintenance.Find('-') then begin
    //       Sender:=SmtpSet."User ID";
    //           Reciept:=Comp."Administrator Email";
    //           Subject:='Unresolved Maintenance Requests';
    //           Body:='This is to inform you that there are maintenance requests awaiting your action';
    //           Body:=Body+'.<p> Regards<br>ERP Scheduled Reminders.';
    //           Factry.FnSendEmail(Sender,'Sender Name',Reciept,Subject,Body);
    //       end;
    // end;


    // procedure FnSendHODNotificationIfOfficerHasNotOpenedARFX(ProcurementRequest: Record UnknownRecord51511393)
    // var
    //     TOpenH: Record UnknownRecord51511440;
    //     PReq: Record UnknownRecord51511393;
    // begin
    //     PsetUp.Get;
    //     TOpenH.Reset;
    //     TOpenH.SetRange("Tender No",ProcurementRequest.No);
    //     TOpenH.SetRange("Open Tender",false);
    //     if TOpenH.FindSet then begin
    //       if ProcurementRequest."Tender Opening Date" >= CreateDatetime(Today,Time)then begin
    //       repeat
    //         Sender:=SmtpSet."User ID";
    //         Reciept:=PsetUp."Procurement Email";
    //         Subject:='DELAYED TENDER OPENING';
    //         Body:='Please inform your officer '+ TOpenH."User ID"+' that this RFX '+ TOpenH."Tender No"+' is due for opening';
    //         Body:=Body+'.<p> Regards<br>ERP Scheduled Reminders.';
    //         Factry.FnSendEmail(Sender,'Sender Name',Reciept,Subject,Body);
    //       until TOpenH.Next = 0;
    //      end;
    //     end;
    // end;


    // procedure FnSendMailAlertOnTenderOpeningDue(ProcurementRequest: Record UnknownRecord51511393;RFXNo: Code[100])
    // var
    //     TOpenH: Record UnknownRecord51511440;
    //     PReq: Record UnknownRecord51511393;
    //     SMTPMailSetup: Record "Email Account";
    // begin
    //     PsetUp.Get;
    //     ProcurementRequest.Reset;
    //     ProcurementRequest.SetRange(No,RFXNo);
    //     ProcurementRequest.SetRange(Opened,false);
    //     if ProcurementRequest.FindSet(true) then begin
    //       if CalcDate('-'+Format(PsetUp."Tender Opening Alert Duration"),Dt2Date(ProcurementRequest."Tender Opening Date")) = Today then begin
    //         repeat
    //         Sender:=SmtpSet."User ID";
    //         Reciept:=PsetUp."Procurement Email";
    //         SMTPMailSetup.Get;
    //         Subject:='TENDER DUE FOR OPENING';
    //         Body:='This is to inform you that tender'+' '+ ProcurementRequest."Document No"+' '+'titled'+  ' <b>'+ProcurementRequest.Title +'</b> is due for opening';
    //         Body:=Body+'.<p> Regards<br>ERP Scheduled Reminders.';
    //         Factry.FnSendEmail(SMTPMailSetup."User ID",SMTPMailSetup."Send As",Reciept,Subject,Body);
    //       until ProcurementRequest.Next = 0;
    //      end;
    //     end;
    // end;


    // procedure FnSendCommMemberNotificationOneDayBeforeTenderOpening(ProcurementRequest: Record UnknownRecord51511393;RFXNo: Code[200])
    // var
    //     TOpenH: Record UnknownRecord51511440;
    //     PReq: Record UnknownRecord51511393;
    //     CMembers: Record UnknownRecord51511406;
    //     UserSetup: Record "User Setup";
    // begin
    //     PsetUp.Get;
    //     SmtpSet.Get;
    //     ProcurementRequest.Reset;
    //     ProcurementRequest.SetRange(No,RFXNo);
    //     ProcurementRequest.SetRange(Opened,false);
    //     if ProcurementRequest.FindSet(true) then begin
    //         CMembers.Reset;
    //         CMembers.SetRange("Appointment No",ProcurementRequest."Commitee Opening");
    //         if CMembers.FindSet(true) then begin
    //           repeat
    //           if UserSetup.Get(CMembers."Employee No") then
    //             Reciept:=UserSetup."E-Mail";
    //           if CalcDate('-1D',Dt2Date(ProcurementRequest."Tender Opening Date")) = Today then begin
    //            repeat
    //             Sender:=SmtpSet."User ID";
    //             //Reciept:=PsetUp."Procurement Email";
    //             Subject:='TENDER OPENING REMINDER';
    //             Body:='This is to inform you that tender' +' '+ ProcurementRequest."Document No"+' titled '+' '+'<b>'+ ProcurementRequest.Title+'</b>'+' '+'is due for opening';
    //             Body:=Body+'.<p> Regards<br>ERP Scheduled Reminders.';
    //             Factry.FnSendEmail(Sender,SmtpSet."Send As",Reciept,Subject,Body);
    //          until ProcurementRequest.Next = 0;
    //       end;
    //       until CMembers.Next = 0;
    //      end;
    //     end;
    // end;


    // procedure FnSendNotificationsOnItemReorderPoint(Item: Record Item)
    // begin
    //     PsetUp.Get;
    //     SmtpSet.Get;
    //     Item.Reset;
    //     Item.SetRange(Item."No.",Item."No.");
    //     if Item.FindSet then begin
    //        Item.CalcFields(Inventory);
    //        if Item.Inventory < Item."Reorder Point" then begin
    //       repeat
    //            Item.CalcFields(Inventory);
    //            Sender:=SmtpSet."User ID";
    //             Reciept:=PsetUp."Procurement Email";
    //             Subject:='ITEM REORDER POINT';
    //             Body:='This is to notify you that item' +' '+ Item."No."+' has reached its reorder point'+' '+'<b>'+ Format(Item."Reorder Point")+'</b>';
    //             Body:=Body+'.<p> Regards<br>ERP Scheduled Reminders.';
    //             Factry.FnSendEmail(Sender,SmtpSet."Send As",Reciept,Subject,Body);
    //       until Item.Next = 0;
    //       end;
    //       end;
    // end;
}

