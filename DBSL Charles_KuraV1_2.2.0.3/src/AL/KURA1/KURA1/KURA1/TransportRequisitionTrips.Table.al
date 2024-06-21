#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59031 "Transport Requisition Trips"
{


    fields
    {
        field(1; "Transport Requisition No"; Code[20])
        {
        }
        //     field(2;Commencement;Text[30])
        //     {
        //     }
        //     field(3;Destination;Text[30])
        //     {
        //     }
        //     field(4;"Vehicle Allocated";Code[20])
        //     {
        //         TableRelation = "Fleet Vehicles."."FA Serial No";

        //         trigger OnValidate()
        //         begin
        //             "Vehicle Allocated by":=UserId;
        //         end;
        //     }
        //     field(5;"Driver Allocated";Code[20])
        //     {
        //         TableRelation = "Vehicle Drivers".Driver;

        //         trigger OnValidate()
        //         begin
        //                 drivers.Reset;
        //                 drivers.SetRange(drivers.Driver,"Driver Allocated");
        //                 if drivers.Find('-') then
        //                // "Driver Name":=HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";
        //                "Driver Name":=drivers."Driver Name";
        //                "Vehicle Allocated by":=UserId;
        //         end;
        //     }
        //     field(6;"Requested By";Code[100])
        //     {
        //         TableRelation = "User Setup";
        //     }
        //     field(7;"Date of Request";Date)
        //     {

        //         trigger OnValidate()
        //         begin
        //              /* IF "Date of Request" < TODAY THEN
        //               ERROR('Date requested can not be less than today');
        //               */

        //         end;
        //     }
        //     field(8;"Vehicle Allocated by";Code[30])
        //     {
        //     }
        //     field(9;"Opening Odometer Reading";Decimal)
        //     {
        //         DecimalPlaces = 0:0;
        //     }
        //     field(10;Status;Option)
        //     {
        //         OptionCaption = 'Open,Pending Approval,Approved,Rejected,Cancelled,Closed';
        //         OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;

        //         trigger OnValidate()
        //         begin
        //             /*IF (Status = Status::Closed) AND ("WorkTicket Created" = FALSE) THEN BEGIN
        //               WorkTicketHeader.INIT;
        //               WorkTicketHeader.SETRANGE(WorkTicketHeader."Vehicle Allocated","Vehicle Allocated");
        //               IF WorkTicketHeader.FINDFIRST THEN BEGIN
        //                 //MESSAGE('Here %1',WorkTicketHeader."Daily Work Ticket");
        //                 DailyWorkTicketLines.INIT;
        //                 DailyWorkTicketLines."Transport Requisition No" := "Transport Requisition No";
        //                 DailyWorkTicketLines."Daily Work Ticket" := WorkTicketHeader."Daily Work Ticket";
        //                 DailyWorkTicketLines."Driver Allocated" := "Driver Allocated";
        //                 DailyWorkTicketLines."Driver Name" := "Driver Name";
        //                 //DailyWorkTicketLines."Oil Drawn(Litres)" := "Oil Drawn";
        //                 DailyWorkTicketLines."Fuel Drawn(Litres)" := "Fuel Drawn";
        //                 DailyWorkTicketLines.Commencement := Commencement;
        //                 DailyWorkTicketLines.Destination := Destination;
        //                 //DailyWorkTicketLines.
        //                 DailyWorkTicketLines."Opening Odometer Reading" := "Opening Odometer";
        //                 DailyWorkTicketLines."Closing Odometer Reading" := "Odometer at the End";
        //                 DailyWorkTicketLines."Total Kilometres" := "Odometer at the End" - "Opening Odometer";
        //                 //DailyWorkTicketLines."Authorized By" := "Authorized by Name";
        //                 DailyWorkTicketLines."Authorized By Name" := "Authorized by Name";
        //                 DailyWorkTicketLines."Journey/Route" := "Journey Route";
        //                 DailyWorkTicketLines.Date := "Date of Trip";
        //                 DailyWorkTicketLines."Date of Request" := "Date of Request";
        //                 DailyWorkTicketLines.ReceiptNo := "POL Voucher No";
        //                 IF NOT DailyWorkTicketLines.INSERT(TRUE) THEN
        //                   DailyWorkTicketLines.MODIFY(TRUE);//MESSAGE('Added');
        //                 "Work Ticket No" := WorkTicketHeader."Daily Work Ticket";
        //                 "WorkTicket Created" := TRUE;
        //                 MODIFY;
        //               END;
        //             END;
        //             */

        //         end;
        //     }
        //     field(13;"Date of Trip";Date)
        //     {

        //         trigger OnValidate()
        //         begin


        //               /*  IF "Date of Trip" < TODAY THEN
        //               ERROR('Date requested can not be less than today');

        //                IF "Date of Trip" < "Date of Request"  THEN
        //               ERROR('Date of Trip can not be less than Date of Requested');
        //                */

        //         end;
        //     }
        //     field(14;"Purpose of Trip";Text[300])
        //     {
        //     }
        //     field(60;"No. Series";Code[20])
        //     {
        //         Description = 'Stores the number series in the database';
        //     }
        //     field(61;Comments;Text[250])
        //     {
        //     }
        //     field(62;Department;Code[20])
        //     {
        //     }
        //     field(63;"Driver Name";Text[100])
        //     {
        //     }
        //     field(64;"Responsibility Center";Code[10])
        //     {
        //         Caption = 'Responsibility Center';
        //         TableRelation = "Responsibility Center";

        //         trigger OnValidate()
        //         begin

        //             /*TESTFIELD(Status,Status::Open);
        //             IF NOT UserMgt.CheckRespCenter(1,Department) THEN
        //               ERROR(
        //                 Text001,
        //                 RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter); */

        //         end;
        //     }
        //     field(65;"Loaded to WorkTicket";Boolean)
        //     {
        //     }
        //     field(66;"Time out";Time)
        //     {
        //     }
        //     field(67;"Time In";Time)
        //     {
        //     }
        //     field(68;"Journey Route";Text[250])
        //     {
        //     }
        //     field(69;"Time Requested";Time)
        //     {
        //     }
        //     field(70;"Closing Odometer Reading";Decimal)
        //     {
        //         DecimalPlaces = 0:0;
        //     }
        //     field(71;"Work Ticket No";Code[20])
        //     {
        //         TableRelation = "Dialy Work Ticket Header"."Daily Work Ticket" where (Status=const(Approved));
        //     }
        //     field(72;"No of Days Requested";Integer)
        //     {

        //         trigger OnValidate()
        //         begin
        //             "Trip End Date":=CalcDate(Format("No of Days Requested")+'D',"Date of Trip");
        //         end;
        //     }
        //     field(73;"Authorized  By";Text[30])
        //     {
        //     }
        //     field(74;Position;Text[200])
        //     {
        //     }
        //     field(75;"User Id";Code[100])
        //     {
        //     }
        //     field(76;"Added On";DateTime)
        //     {
        //     }
        //     field(77;HOD;Boolean)
        //     {
        //         DataClassification = ToBeClassified;
        //         Editable = false;
        //     }
        //     field(78;"Non KeRRA Vehicle Alloc.";Code[10])
        //     {
        //         DataClassification = ToBeClassified;

        //         trigger OnValidate()
        //         begin
        //             "Vehicle Allocated by" := UserId;
        //         end;
        //     }
        //     field(70014;"Department Code";Code[30])
        //     {
        //         DataClassification = ToBeClassified;
        //         TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"));
        //     }
        //     field(70018;"Directorate Code";Code[50])
        //     {
        //         DataClassification = ToBeClassified;
        //         TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        //     }
        //     field(70019;Division;Code[50])
        //     {
        //         DataClassification = ToBeClassified;
        //         TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Division/Section"),
        //                                                        "Direct Reports To"=field("Department Code"));
        //     }
        //     field(70020;"Employee No";Code[20])
        //     {
        //         DataClassification = ToBeClassified;
        //         TableRelation = Employee;

        //         trigger OnValidate()
        //         begin
        //             //added on 28/06/2019 to add the HOD
        //             HrEmployee.Reset;
        //             HrEmployee.SetRange("No.","Employee No");
        //             if HrEmployee.FindSet then
        //             begin
        //               HOD := HrEmployee.HOD;
        //               "Directorate Code":=HrEmployee."Directorate Code";
        //               "Department Code":=HrEmployee."Department Code";
        //               Division:=HrEmployee.Division;
        //               "Employee No" := HrEmployee."No.";
        //               "Employee Name" := HrEmployee."First Name" +' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";
        //               HrEmployee.CalcFields(HrEmployee."Job Title");
        //               Position := HrEmployee."Job Title";
        //             end;
        //             //
        //         end;
        //     }
        //     field(70021;"Date Closed";Date)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70022;"Closed By";Code[50])
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70023;"Approved Imprest Memo";Code[40])
        //     {
        //         DataClassification = ToBeClassified;
        //         TableRelation = "Imprest Memo"."No." where (Status=filter(Released));

        //         trigger OnValidate()
        //         begin
        //             /*ObjImprestMemo.RESET;
        //             ObjImprestMemo.SETRANGE(ObjImprestMemo."No.","Approved Imprest Memo");
        //             IF ObjImprestMemo.FINDSET THEN
        //               BEGIN
        //                 Commencement:=ObjImprestMemo.From;
        //                 Destination:=ObjImprestMemo."Imprest Naration";
        //                 "Requested By":=ObjImprestMemo.Requestor;

        //                 "Employee No" := ObjImprestMemo.Requestor;
        //                 VALIDATE("Employee No");
        //                 "Date of Request":=ObjImprestMemo.Date;
        //                 "Time Requested":=TIME;
        //                 "Date of Trip":=ObjImprestMemo."Start Date";
        //                 "No of Days Requested" := ObjImprestMemo."No. of days";
        //                 VALIDATE("Date of Trip");
        //                 VALIDATE("No of Days Requested");
        //                 ObjImprestMemo.CALCFIELDS(Objective);
        //                 //MESSAGE(FORMAT(ObjImprestMemo.Objective));
        //                 "Purpose of Trip":=FORMAT(ObjImprestMemo.Objective);
        //                 VALIDATE("Purpose of Trip");
        //                 Subject:=ObjImprestMemo.Subject;
        //                 MODIFY;
        //                 //Create fuel req

        //                 END;

        //                IF Rec."Approved Imprest Memo" <> xRec."Approved Imprest Memo" THEN
        //                  ObjTravelStaff.DELETEALL(TRUE);

        //               ObjTravelStaff.RESET;
        //               ObjTravelStaff.SETRANGE(ObjTravelStaff."Req No","Transport Requisition No");
        //               IF ObjTravelStaff.FINDSET THEN
        //                 ObjTravelStaff.DELETEALL(TRUE);

        //                 ObjProjMembers.RESET;
        //                 ObjProjMembers.SETRANGE(ObjProjMembers."Imprest Memo No.","Approved Imprest Memo");
        //                 IF ObjProjMembers.FINDSET THEN BEGIN
        //                     REPEAT
        //                       ObjTravelStaff.INIT;
        //                       ObjTravelStaff."Req No":="Transport Requisition No";
        //                       ObjTravelStaff."Employee No":=ObjProjMembers."No.";
        //                       ObjTravelStaff.VALIDATE("Employee No");
        //                       ObjTravelStaff."Employee Name":=ObjProjMembers.Name;
        //                       ObjTravelStaff."Date of Trip":="Date of Trip";
        //                       ObjTravelStaff.VALIDATE("Date of Trip");
        //                       ObjTravelStaff."No of Days Requested":=ObjProjMembers."Time Period";
        //                       ObjTravelStaff.VALIDATE("No of Days Requested");
        //                       //ObjTravelStaff.Position:=ObjProjMembers.
        //                       ObjTravelStaff.INSERT;
        //                       FuelTravelRequisition.INIT;
        //                       FuelTravelRequisition."Req No" := "Transport Requisition No";
        //                       FuelTravelRequisition."Project No" := ObjProjMembers.Project;
        //                       FuelTravelRequisition."Job No" := ObjProjMembers."Job No";
        //                       FuelTravelRequisition."Job Task" := ObjProjMembers."Job Task No";
        //                       FuelTravelRequisition."Requested Amount" := ObjProjMembers."Transport Costs";
        //                       FuelTravelRequisition.INSERT;
        //                     UNTIL ObjProjMembers.NEXT = 0
        //                   END;
        //             VALIDATE("Employee No");*/

        //         end;
        //     }
        //     field(70024;"Trip End Date";Date)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70025;"Reason for Reopening";Text[250])
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70026;"Employee Name";Text[100])
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70027;Subject;Text[250])
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70028;"Drivers Imp Memo No";Code[10])
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70029;"Drivers Imp. Memo Created";Boolean)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70030;"Number of Hours Requested";Decimal)
        //     {
        //         DataClassification = ToBeClassified;

        //         trigger OnValidate()
        //         begin
        //             if "Date of Request" = 0D then
        //             "Date of Request" := Today;
        //             if "Date of Trip" = 0D then
        //             "Date of Trip" := Today;
        //             "Trip End Time" := "Time Requested" + ("Number of Hours Requested" * 3600000);
        //             "Trip End Date" := "Date of Trip";
        //         end;
        //     }
        //     field(70031;"Trip End Time";Time)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70050;"Details of Journey";Text[300])
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70051;"Oil Drawn";Decimal)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70052;"Fuel Drawn";Decimal)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70053;"POL Voucher No";Code[10])
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70054;"Opening Odometer";Integer)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70055;"Odometer at the End";Integer)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70056;"Kilometers of Journey";Integer)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70057;"Authorized by  No";Code[20])
        //     {
        //         DataClassification = ToBeClassified;
        //         TableRelation = Employee;

        //         trigger OnValidate()
        //         begin
        //             //added on 28/06/2019 to add the HOD
        //             HrEmployee.Reset;
        //             HrEmployee.SetRange("No.","Authorized by  No");
        //             if HrEmployee.FindSet then
        //             begin

        //               "Authorized by Name" := HrEmployee."First Name" +' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";

        //             end;
        //             //
        //         end;
        //     }
        //     field(70058;"Authorized by Name";Text[100])
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        //     field(70059;"WorkTicket Created";Boolean)
        //     {
        //         DataClassification = ToBeClassified;
        //     }
        // }

        // keys
        // {
        //     key(Key1;"Transport Requisition No","Driver Allocated")
        //     {
        //         Clustered = true;
        //     }
        // }

        // fieldgroups
        // {
        // }

        // trigger OnInsert()
        // begin
        //     if "Transport Requisition No" = '' then begin
        //          FltMgtSetup.Get;
        //          FltMgtSetup.TestField(FltMgtSetup."Transport Req No");
        //          NoSeriesMgt.InitSeries(FltMgtSetup."Transport Req No",xRec."No. Series",0D,"Transport Requisition No","No. Series");
        //          end;
        //          "User Id":= UserId;
        //          "Added On":= CurrentDatetime;

        //         //added on 28/06/2019 to add the HOD
        //         HrEmployee.Reset;
        //         HrEmployee.SetRange("User ID","User Id");
        //         if HrEmployee.FindSet then
        //         begin
        //           HOD := HrEmployee.HOD;
        //           "Directorate Code":=HrEmployee."Directorate Code";
        //           "Department Code":=HrEmployee."Department Code";
        //           Division:=HrEmployee.Division;
        //           "Employee No" := HrEmployee."No.";
        //         end;
        //     //
        // end;

        // trigger OnModify()
        // begin

        //     Validate(Status);
        // end;

        // var
        //     FltMgtSetup: Record "Fleet Management Setup";
        //     NoSeriesMgt: Codeunit NoSeriesManagement;
        //     Text0001: label 'You cannot modify an Approved or Closed Record';
        //     HrEmployee: Record Employee;
        //     UserMgt: Codeunit "User Management";
        //     Text001: label 'Your identification is set up to process from %1 %2 only.';
        //     RespCenter: Record "Responsibility Center";
        //     drivers: Record "Vehicle Drivers";
        //     ObjImprestMemo: Record "Imprest Memo";
        //     ObjTravelStaff: Record "Travel Requisition Staff";
        //     ObjProjMembers: Record "Project Members";
        //     ProgressWindow: Dialog;
        //     Filename: Text;
        //     SMTPSetup: Record "Email Account";
        //     SMTPMail: Codeunit Mail;
        //     ObjCompany: Record "Company Information";
        //     Header: Text;
        //     SenderEmail: Text;
        //     SenderName: Text;
        //     Emp: Record Employee;
        //     VehicleDriversAll: Record "Vehicle Driver Allocation";
        //     VehicleDriverAllocation: Record "Vehicle Driver Allocation";
        //     VehicleDrivers: Record "Vehicle Drivers";
        //     FuelTravelRequisition: Record "Fuel & Maintenance Requisition";
        //     ProjectMembers: Record "Project Members";
        //     WorkTicketHeader: Record "Dialy Work Ticket Header";
        //     DailyWorkTicketLines: Record "Daily Work Ticket Lines";

        // local procedure SendEmailNotification()
        // begin
        //     VehicleDriverAllocation.Reset;
        //     VehicleDriverAllocation.SetRange("Requisition Number","Transport Requisition No");
        //     VehicleDriverAllocation.SetRange("Reassigned?",false);
        //     if VehicleDriverAllocation.Find('-') then begin
        //       repeat
        //         if Emp.Get(VehicleDriverAllocation."Driver Code") then begin
        //             Header:='TRAVEL TRIP NOTIFICATION '+"Transport Requisition No"+' ON '+Format(VehicleDriverAllocation."Date of Trip")+' TO '+Format(VehicleDriverAllocation."Trip End Date");

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
        //               //SMTPMail.AddBodyline('Trip requested by : '+"Employee Name");
        //               //SMTPMail.AddBodyline('<br>');
        //               //SMTPMail.AddBodyline('Trip From: '+Commencement+' To '+Destination+' on '+Format("Date of Trip")+' return date will be on '+Format("Trip End Date"));
        //               //SMTPMail.AddBodyline('<br>');
        //               ////SMTPMail.AddBodyline('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non kemri Vehicle Alloc.");
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
        //               //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kemri.go.ke');
        //               //SMTPMail.AddBodyline('<br><br>');
        //              // //SMTPMail.Send;
        //               //MESSAGE('Mail sent to %1',Emp."E-Mail");
        //             end;
        //             //End email
        //           end;
        //           //notify requester
        //          // ERROR('here %1',Rec."Employee No");
        //           if Emp.Get("Employee No") then begin
        //             Header:='TRAVEL TRIP NOTIFICATION '+"Transport Requisition No"+' ON '+Format(VehicleDriverAllocation."Date of Trip")+' TO '+Format(VehicleDriverAllocation."Trip End Date");

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
        //               VehicleDrivers.Reset;
        //               VehicleDrivers.SetRange(VehicleDrivers.Driver,VehicleDriverAllocation."Driver Code");
        //               if VehicleDrivers.FindSet then begin
        //                 //SMTPMail.AddBodyline('Driver Phone Number : '+VehicleDrivers."Phone Number");
        //                 //SMTPMail.AddBodyline('<br>');
        //               end;
        //               //SMTPMail.AddBodyline('Trip From: '+Commencement+' To '+Destination+' on '+Format("Date of Trip"));
        //               //SMTPMail.AddBodyline('<br>');
        //               ////SMTPMail.AddBodyline('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non kemri Vehicle Alloc.");
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
        //               //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kemri.go.ke');
        //               //SMTPMail.AddBodyline('<br><br>');
        //               ////SMTPMail.Send;
        //               //MESSAGE('Mail sent to %1',Emp."E-Mail");
        //             end;
        //             //End email
        //           end;
        //       until VehicleDriverAllocation.Next = 0;

        //       Message('Email notifications has been sent');
        //     end;
        // end;

    }
}

