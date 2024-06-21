#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 59003 "Transport Requisition"
{
    // DrillDownPageID = "Approved Fleet Requests List";
    // LookupPageID = "Approved Fleet Requests List";

    fields
    {
        field(1; "Transport Requisition No"; Code[20])
        {
        }
        field(2; Commencement; Text[30])
        {
            Editable = false;
        }
        field(3; Destination; Text[100])
        {
            Editable = false;
        }
        field(4; "Vehicle Allocated"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."FA Serial No";

            trigger OnValidate()
            begin
                "Vehicle Allocated by" := UserId;
            end;
        }
        field(5; "Driver Allocated"; Code[20])
        {
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                //    drivers.RESET;
                //    drivers.SETRANGE(drivers.Driver,"Driver Allocated");
                //    IF drivers.FIND('-') THEN
                //   // "Driver Name":=HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";
                //   "Driver Name":=drivers."Driver Name";
                //   "Vehicle Allocated by":=USERID;
            end;
        }
        field(6; "Requested By"; Code[100])
        {
            TableRelation = "User Setup";
        }
        field(7; "Date of Request"; Date)
        {

            trigger OnValidate()
            begin
                /* IF "Date of Request" < TODAY THEN
                 ERROR('Date requested can not be less than today');
                 */

            end;
        }
        field(8; "Vehicle Allocated by"; Code[30])
        {
        }
        field(9; "Opening Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Cancelled,Closed';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;

            trigger OnValidate()
            begin
                if Status = Status::Approved then begin
                    SendEmailNotification;
                    CreateTripDetails;
                    CreateFuelReq;
                    //UpdateDriverToMemo("Approved Imprest Memo");
                end;/* ELSE IF (Status = Status::Cancelled) OR (Status = Status::Closed) THEN
                          MESSAGE('Record %1 Successfully',Status);*/

            end;
        }
        field(13; "Date of Trip"; Date)
        {

            trigger OnValidate()
            begin


                /*  IF "Date of Trip" < TODAY THEN
                ERROR('Date requested can not be less than today');

                 IF "Date of Trip" < "Date of Request"  THEN
                ERROR('Date of Trip can not be less than Date of Requested');
                 */

            end;
        }
        field(14; "Purpose of Trip"; Text[300])
        {
        }
        field(60; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(61; Comments; Text[250])
        {
        }
        field(62; Department; Code[20])
        {
        }
        field(63; "Driver Name"; Text[100])
        {
        }
        field(64; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";

            trigger OnValidate()
            begin

                /*TESTFIELD(Status,Status::Open);
                IF NOT UserMgt.CheckRespCenter(1,Department) THEN
                  ERROR(
                    Text001,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter); */

            end;
        }
        field(65; "Loaded to WorkTicket"; Boolean)
        {
        }
        field(66; "Time out"; Time)
        {
        }
        field(67; "Time In"; Time)
        {
        }
        field(68; "Journey Route"; Text[250])
        {
        }
        field(69; "Time Requested"; Time)
        {
        }
        field(70; "Closing Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(71; "Work Ticket No"; Code[20])
        {
            TableRelation = "Dialy Work Ticket Header"."Daily Work Ticket" where(Status = const(Approved));
        }
        field(72; "No of Days Requested"; Integer)
        {

            trigger OnValidate()
            begin
                "Trip End Date" := CalcDate(Format("No of Days Requested") + 'D', "Date of Trip");
            end;
        }
        field(73; "Authorized  By"; Text[30])
        {
        }
        field(74; Position; Text[200])
        {
        }
        field(75; "User Id"; Code[100])
        {
        }
        field(76; "Added On"; DateTime)
        {
        }
        field(77; HOD; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(78; "Non KeRRA Vehicle Alloc."; Code[10])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Vehicle Allocated by" := UserId;
            end;
        }
        field(70014; "Department Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(70018; "Directorate Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(70019; Division; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Division/Section"),
                                                                   "Direct Reports To" = field("Department Code"));
        }
        field(70020; "Employee No"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                //added on 28/06/2019 to add the HOD
                HrEmployee.Reset;
                HrEmployee.SetRange("No.", "Employee No");
                if HrEmployee.FindSet then begin
                    HOD := HrEmployee.HOD;
                    "Global Dimension 1 Code" := HrEmployee."Global Dimension 1 Code";
                    "Directorate Code" := HrEmployee."Directorate Code";
                    "Department Code" := HrEmployee."Department Code";
                    Division := HrEmployee.Division;
                    "Employee No" := HrEmployee."No.";
                    "Employee Name" := HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name";
                    "Position ID" := HrEmployee."Job ID";
                    Rec.Validate("Position ID");
                    // Amos - Commented out this, some employees lack a job title, making it difficult for them to raise fleet requisition from the portal. 
                    // HrEmployee.CalcFields(HrEmployee."Job Title");
                    // Position := HrEmployee."Job Title";
                end;
                //
            end;
        }
        field(70021; "Date Closed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70022; "Closed By"; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70023; "Approved Imprest Memo"; Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Type of Trip" = const(Safari)) "Project Members"."Imprest Memo No." where("No." = field("Employee No"),
                                                                                                                  Status = filter(Released));

            trigger OnValidate()
            begin
                ObjImprestMemo.Reset;
                ObjImprestMemo.SetRange(ObjImprestMemo."No.", "Approved Imprest Memo");
                if ObjImprestMemo.FindSet then begin
                    //Commencement:=ObjImprestMemo.From;
                    Destination := ObjImprestMemo."Imprest Naration";
                    "Requested By" := ObjImprestMemo.Requestor;

                    "Employee No" := ObjImprestMemo.Requestor;
                    Validate("Employee No");
                    "Date of Request" := ObjImprestMemo.Date;
                    "Time Requested" := Time;
                    "Date of Trip" := ObjImprestMemo."Start Date";
                    "No of Drivers" := ObjImprestMemo."Number of Drivers";
                    "No of Days Requested" := ObjImprestMemo."No. of days";
                    Validate("Date of Trip");
                    Validate("No of Days Requested");
                    ObjImprestMemo.CalcFields(Objective);
                    //MESSAGE(FORMAT(ObjImprestMemo.Objective));
                    "Purpose of Trip" := Format(ObjImprestMemo.Objective);
                    //VALIDATE("Purpose of Trip");
                    Subject := ObjImprestMemo.Subject;
                    Modify;
                    //Create fuel req

                end;

                if Rec."Approved Imprest Memo" <> xRec."Approved Imprest Memo" then
                    ObjTravelStaff.DeleteAll(true);

                ObjTravelStaff.Reset;
                ObjTravelStaff.SetRange(ObjTravelStaff."Req No", "Transport Requisition No");
                if ObjTravelStaff.FindSet then
                    ObjTravelStaff.DeleteAll(true);

                ObjProjMembers.Reset;
                ObjProjMembers.SetRange(ObjProjMembers."Imprest Memo No.", "Approved Imprest Memo");
                if ObjProjMembers.FindSet then begin
                    repeat
                        ObjTravelStaff.Init;
                        ObjTravelStaff."Req No" := "Transport Requisition No";
                        ObjTravelStaff."Employee No" := ObjProjMembers."No.";
                        ObjTravelStaff.Validate("Employee No");
                        ObjTravelStaff."Employee Name" := ObjProjMembers.Name;
                        ObjTravelStaff."Date of Trip" := "Date of Trip";
                        ObjTravelStaff.Validate("Date of Trip");
                        ObjTravelStaff."No of Days Requested" := ObjProjMembers."Time Period";
                        ObjTravelStaff.Validate("No of Days Requested");
                        //ObjTravelStaff.Position:=ObjProjMembers.
                        FltMgtSetup.Get();
                        if ObjTravelStaff."Employee No" <> FltMgtSetup."Default Fleet Driver" then
                            ObjTravelStaff.Insert;

                    until ObjProjMembers.Next = 0
                end;
                /*FuelTravelRequisition.RESET;
                FuelTravelRequisition.SETRANGE(FuelTravelRequisition."Req No","Approved Imprest Memo");
                IF FuelTravelRequisition.FIND('-') THEN BEGIN
                  REPEAT
                    MESSAGE('%1 test',FuelTravelRequisition."Req No");
                    FuelTravel.INIT;
                    FuelTravel."Req No" := Rec."Transport Requisition No";
                    //FuelTravel.TRANSFERFIELDS(FuelTravelRequisition);
                    FuelTravel."Job No" := FuelTravelRequisition."Job No";
                    FuelTravel."Job Name" := FuelTravelRequisition."Job Name";
                    FuelTravel."Job Task" := FuelTravelRequisition."Job Task";
                    FuelTravel."Job Task Name" := FuelTravelRequisition."Job Task Name";
                    FuelTravel."Requested Amount" := FuelTravelRequisition."Requested Amount";
                    IF NOT FuelTravel.INSERT(TRUE) THEN
                      FuelTravel.MODIFY(TRUE);
                  UNTIL FuelTravelRequisition.NEXT=0;
                END;*/
                Validate("Employee No");

            end;
        }
        field(70024; "Trip End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(70025; "Reason for Reopening"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70026; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(70027; Subject; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(70028; "Drivers Imp Memo No"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70029; "Drivers Imp. Memo Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70030; "Number of Hours Requested"; Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Date of Request" = 0D THEN
                // "Date of Request" := TODAY;
                // IF "Date of Trip" = 0D THEN
                // "Date of Trip" := TODAY;
                // "Trip End Time" := "Time Requested" + ("Number of Hours Requested" * 3600000);
                // "Trip End Date" := "Date of Trip";
            end;
        }
        field(70031; "Trip End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(70032; "Type of Trip"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Safari,Local Runing';
            OptionMembers = Safari,"Local Runing";
        }
        field(70050; "Number of Assigned Drivers"; Integer)
        {
            CalcFormula = count("Vehicle Driver Allocation" where("Requisition Number" = field("Transport Requisition No")));
            FieldClass = FlowField;
            //   TableRelation = "Vehicle Driver Allocation"."Driver Code" where("Requisition Number" = field("Transport Requisition No"),
            //                                                                   "Reassigned?" = const(false));
        }
        field(70051; Selected; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70052; "No of Drivers"; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(70053; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(70054; "Driver Remarks"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(70055; "Trip Lead Remarks"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(70056; "Type of Vehicle"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fleet Vehicle Categories";
        }
        field(70057; "No. of Staff"; Integer)
        {
            // FieldClass = FlowField;
            // Editable = false;
            // CalcFormula = count("Travel Requisition Staff" where("Req No" = field("Transport Requisition No")));
        }
        field(70058; "Type of Goods"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70059; "Commencement Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Towns where(Blocked = const(false));

            trigger OnValidate()
            begin
                if "Commencement Code" <> '' then begin
                    Towns.get("Commencement Code");
                    Commencement := Towns.Description;
                end else begin
                    Commencement := '';
                end;
            end;
        }
        field(70060; "Destination Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Towns where(Blocked = const(false));

            trigger OnValidate()
            begin
                if "Destination Code" <> '' then begin
                    Towns.get("Destination Code");
                    Destination := Towns.Description;
                end else begin
                    Destination := '';
                end;
            end;
        }
        field(70061; Closed; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(70062; "Position ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Designations: Record Positions;
            begin
                Designations.Reset();
                Designations.SetRange("Position ID", "Position ID");
                if Designations.FindFirst then begin
                    Position := Designations."Job Title";
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "Transport Requisition No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Transport Requisition No" = '' then begin
            FltMgtSetup.Get;
            FltMgtSetup.TestField(FltMgtSetup."Transport Req No");
            NoSeriesMgt.InitSeries(FltMgtSetup."Transport Req No", xRec."No. Series", 0D, "Transport Requisition No", "No. Series");
        end;

        "User Id":= USERID;
        "Added On":= CURRENTDATETIME;
        
        /*
        //added on 28/06/2019 to add the HOD
        HrEmployee.RESET;
        HrEmployee.SETRANGE("User ID","User Id");
        IF HrEmployee.FINDSET THEN
        BEGIN
          HOD := HrEmployee.HOD;
          "Directorate Code":=HrEmployee."Directorate Code";
          "Department Code":=HrEmployee."Department Code";
          Division:=HrEmployee.Division;
          "Employee No" := HrEmployee."No.";
        END;
    //
    IF UserSetup.GET(USERID) THEN BEGIN
      "Requested By" := UserSetup."Employee No.";
      "Employee No" := UserSetup."Employee No.";
      VALIDATE("Requested By");
      VALIDATE("Employee No");
    END
    */

    end;

    trigger OnModify()
    begin
        /*IF (Status=Status::Approved) OR (Status=Status::Approved) THEN
           ERROR(Text0001);*/
        Validate(Status);

    end;

    var
        FltMgtSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Text0001: label 'You cannot modify an Approved or Closed Record';
        HrEmployee: Record Employee;
        UserMgt: Codeunit "User Management";
        Text001: label 'Your identification is set up to process from %1 %2 only.';
        RespCenter: Record "Responsibility Center";
        drivers: Record "Vehicle Drivers";
        ObjImprestMemo: Record "Imprest Memo";
        ObjTravelStaff: Record "Travel Requisition Staff";
        ObjProjMembers: Record "Project Members";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Emp: Record Employee;
        VehicleDriversAll: Record "Vehicle Driver Allocation";
        VehicleDriverAllocation: Record "Vehicle Driver Allocation";
        VehicleDrivers: Record "Vehicle Drivers";
        ProjectMembers: Record "Project Members";
        UserSetup: Record "User Setup";
        FleetSetup: Record "Fleet Management Setup";
        Towns: Record Towns;

    local procedure SendEmailNotification()
    begin
        VehicleDriverAllocation.Reset;
        VehicleDriverAllocation.SetRange("Requisition Number", "Transport Requisition No");
        //   VehicleDriverAllocation.SetRange("Reassigned?", false);
        /*IF VehicleDriverAllocation.FIND('-') THEN BEGIN
          REPEAT
            IF Emp.GET(VehicleDriverAllocation."Driver Code") THEN BEGIN
                Header:='TRAVEL TRIP NOTIFICATION '+"Transport Requisition No"+' ON '+FORMAT(VehicleDriverAllocation."Date of Trip")+' TO '+FORMAT(VehicleDriverAllocation."Trip End Date");

                IF SMTPSetup.GET() THEN BEGIN
                  SenderEmail:=SMTPSetup."Email Sender Address";
                  SenderName:= SMTPSetup."Email Sender Name";
                END;
                IF Emp."E-Mail" <> '' THEN BEGIN
                  //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',TRUE);
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('Please note that you have been assigend as the driver to the above mentioned trip.');// for the month of January 2014');
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                  //SMTPMail.AddBodyline('<br>');
                  //SMTPMail.AddBodyline('Trip requested by : '+"Employee Name");
                  //SMTPMail.AddBodyline('<br>');
                  //SMTPMail.AddBodyline('Trip From: '+Commencement+' To '+Destination+' on '+FORMAT("Date of Trip")+' return date will be on '+FORMAT("Trip End Date"));
                  //SMTPMail.AddBodyline('<br>');
                  //SMTPMail.AddBodyline('<br>');
                  //SMTPMail.AddBodyline('Vehicle Reg Number: '+VehicleDriverAllocation."Registration Number");
                  ////SMTPMail.AddBodyline('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non KERRA Vehicle Alloc.");
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
                  //MESSAGE('Mail sent to %1',Emp."E-Mail");
                END;
                //End email
              END;
              //notify requester
             // ERROR('here %1',Rec."Employee No");
              IF Emp.GET("Employee No") THEN BEGIN
                Header:='TRAVEL TRIP NOTIFICATION '+"Transport Requisition No"+' ON '+FORMAT(VehicleDriverAllocation."Date of Trip")+' TO '+FORMAT(VehicleDriverAllocation."Trip End Date");

                IF SMTPSetup.GET() THEN BEGIN
                  SenderEmail:=SMTPSetup."Email Sender Address";
                  SenderName:= SMTPSetup."Email Sender Name";
                END;
                IF Emp."E-Mail" <> '' THEN BEGIN
                  //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',TRUE);
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('Please note that you have been assigend driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                  //SMTPMail.AddBodyline('<br>');
                  //SMTPMail.AddBodyline('Driver Name : '+VehicleDriverAllocation."Driver Name");
                  //SMTPMail.AddBodyline('<br>');
                  //SMTPMail.AddBodyline('Vehicle Reg Number: '+VehicleDriverAllocation."Registration Number");
                  //SMTPMail.AddBodyline('<br>');
                  VehicleDrivers.RESET;
                  VehicleDrivers.SETRANGE(VehicleDrivers.Driver,VehicleDriverAllocation."Driver Code");
                  IF VehicleDrivers.FINDSET THEN BEGIN
                    //SMTPMail.AddBodyline('Driver Phone Number : '+VehicleDrivers."Phone Number");
                    //SMTPMail.AddBodyline('<br>');
                  END;
                  //SMTPMail.AddBodyline('Trip From: '+Commencement+' To '+Destination+' on '+FORMAT("Date of Trip"));
                  //SMTPMail.AddBodyline('<br>');
                  ////SMTPMail.AddBodyline('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non KERRA Vehicle Alloc.");
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
                  //MESSAGE('Mail sent to %1',Emp."E-Mail");
                END;
                //End email
              END;
          UNTIL VehicleDriverAllocation.NEXT = 0;
          MESSAGE('Email notifications has been sent');
        END;*/
        /*ObjTravelStaff.RESET;
        ObjTravelStaff.SETRANGE(ObjTravelStaff."Req No",Rec."Transport Requisition No");
        IF ObjTravelStaff.FIND('-') THEN BEGIN
          REPEAT
            IF Emp.GET(ObjTravelStaff."Employee No") THEN BEGIN
                Header:='TRAVEL TRIP NOTIFICATION '+"Transport Requisition No"+' ON '+FORMAT(VehicleDriverAllocation."Date of Trip")+' TO '+FORMAT(VehicleDriverAllocation."Trip End Date");

                IF SMTPSetup.GET() THEN BEGIN
                  SenderEmail:=SMTPSetup."Email Sender Address";
                  SenderName:= SMTPSetup."Email Sender Name";
                END;
                IF Emp."E-Mail" <> '' THEN BEGIN
                  //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',TRUE);
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('Please note that you have been assigend driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                  //SMTPMail.AddBodyline('<br>');
                  //SMTPMail.AddBodyline('Driver Name : '+VehicleDriverAllocation."Driver Name");
                  //SMTPMail.AddBodyline('<br>');
                  VehicleDrivers.RESET;
                  VehicleDrivers.SETRANGE(VehicleDrivers.Driver,VehicleDriverAllocation."Driver Code");
                  IF VehicleDrivers.FINDSET THEN BEGIN
                    //SMTPMail.AddBodyline('Driver Phone Number : '+VehicleDrivers."Phone Number");
                    //SMTPMail.AddBodyline('<br>');
                  END;
                  //SMTPMail.AddBodyline('Trip From: '+Commencement+' To '+Destination+' on '+FORMAT("Date of Trip"));
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
                  //MESSAGE('Mail sent to %1',Emp."E-Mail");
                END;
                //End email
              END;
          UNTIL ObjTravelStaff.NEXT=0;
        END;
        */

    end;

    local procedure CreateTripDetails()
    var
        Trips: Record "Transport Requisition Trips";
    begin
        /*VehicleDriverAllocation.RESET;
        VehicleDriverAllocation.SETRANGE(VehicleDriverAllocation."Requisition Number",Rec."Transport Requisition No");
        IF VehicleDriverAllocation.FIND('-') THEN BEGIN
          REPEAT
            Trips.INIT;
            Trips.TRANSFERFIELDS(Rec);
            Trips."Driver Allocated" := VehicleDriverAllocation."Driver Code";
            Trips."Driver Name" := VehicleDriverAllocation."Driver Name";
            Trips."Vehicle Allocated" := VehicleDriverAllocation."Vehicle Registration No";
            Trips.Status := Trips.Status::Open;
            Trips."Purpose of Trip" := "Purpose of Trip";
            IF NOT Trips.INSERT(TRUE) THEN
              Trips.MODIFY(TRUE);
          UNTIL VehicleDriverAllocation.NEXT=0;
        END;
      */

    end;

    local procedure CreateFuelReq()
    var
        SaveFuelTravel: Record "Fuel & Maintenance Requisition";
        TransportReq: Record "Transport Requisition";
    begin
        /*FuelTravel.RESET;
        FuelTravel.SETRANGE(FuelTravel."Req No",Rec."Transport Requisition No");
        IF FuelTravel.FIND('-') THEN BEGIN
          REPEAT
            SaveFuelTravel.INIT;
            SaveFuelTravel."Project Name" := FuelTravel."Job Name";
            CASE FuelTravel."Expense Type" OF
              FuelTravel."Expense Type"::"0":
                SaveFuelTravel.Type := SaveFuelTravel.Type::Fuel;
              FuelTravel."Expense Type"::"1":
                SaveFuelTravel.Type := SaveFuelTravel.Type::Maintenance;
            END;
            SaveFuelTravel."Date Returned from Maintenance" := FuelTravel."Job No";
            SaveFuelTravel."Job Name" := FuelTravel."Job Name";
            SaveFuelTravel."Job No" := FuelTravel."Job No";
            SaveFuelTravel."Job Task" := FuelTravel."Job Task";
            SaveFuelTravel."Job Task Name" := FuelTravel."Job Task Name";
            SaveFuelTravel."Request Date" := TODAY;
            SaveFuelTravel."Vehicle Reg No" := FuelTravel."Allocated Vehicle Reg No";
            SaveFuelTravel."Prepared By" := USERID;
            SaveFuelTravel."Total Price of Fuel" := FuelTravel."Requested Amount";
            IF FuelTravel."Requested Amount" <> 0 THEN BEGIN
              IF SaveFuelTravel.INSERT(TRUE) THEN;
            END;

          UNTIL SaveFuelTravel.NEXT=0;
          SendFuelMail(FuelTravel."Requested Amount",FuelTravel."Job No");
        END;
        */

    end;

    local procedure SendFuelMail(var Amount: Decimal; var ProjectCode: Code[30])
    begin

        // FleetSetup.Get();
        // FleetSetup.TestField(FleetSetup."Default Fleet Driver");
        // // IF Emp.GET(VehicleDriverAllocation."Driver Code") THEN BEGIN
        // Header := 'FUEL REIMBURSEMENT REQUEST' + "Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

        // // if SMTPSetup.Get() then begin
        // //     SenderEmail := SMTPSetup."Email Sender Address";
        // //     SenderName := SMTPSetup."Email Sender Name";
        // // end;
        // if FleetSetup."Default Fleet Driver" <> '' then begin
        //     //SMTPMail.CreateMessage(SenderName, SenderEmail, FleetSetup."Default Fleet Driver", Header, '', true);
        //     //SMTPMail.AddBodyline('<br><br>');
        //     //SMTPMail.AddBodyline('Dear Sir/Madam');
        //     //SMTPMail.AddBodyline('<br><br>');
        //     //SMTPMail.AddBodyline('Kindly prepare a fuel reimbursement of ' + Format(Amount) + ' from Project ' + ProjectCode + ' to Exchequer Transport vote.');// for the month of January 2014');
        //     //SMTPMail.AddBodyline('<br><br>');
        //     //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
        //     //SMTPMail.AddBodyline('<br>');
        //     //SMTPMail.AddBodyline('Trip requested by : ' + "Employee Name");
        //     //SMTPMail.AddBodyline('<br>');
        //     //SMTPMail.AddBodyline('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip") + ' return date will be on ' + Format("Trip End Date"));
        //     //SMTPMail.AddBodyline('<br>');
        //     ////SMTPMail.AddBodyline('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non KERRA Vehicle Alloc.");
        //     //SMTPMail.AddBodyline('<br>');
        //     //SMTPMail.AddBodyline('Kindly prepare adequately');
        //     //SMTPMail.AddBodyline('<br><br>');
        //     //SMTPMail.AddBodyline('Thanks & Regards');
        //     //SMTPMail.AddBodyline('<br><br>');
        //     //SMTPMail.AddBodyline(SenderName);
        //     //SMTPMail.AddBodyline('<br><br>');
        //     //SMTPMail.AddBodyline('<HR>');
        //     //SMTPMail.AddBodyline('This is a system generated mail.');
        //     //SMTPMail.AddBodyline('<br><br>');
        //     //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
        //     //SMTPMail.AddBodyline('<br><br>');
        //     //SMTPMail.Send;
        //     //MESSAGE('Mail sent to %1',FleetSetup."Project Accountant Email");
        // end;
        // //End email
        // // END;
    end;

    local procedure SendEmailNotificationC(var ReqNo: Code[30]; var Employee: Code[30])
    begin

        //     VehicleDriverAllocation.Reset;
        //     VehicleDriverAllocation.SetRange("Requisition Number", ReqNo);
        //   //  VehicleDriverAllocation.SetRange("Reassigned?", false);
        //     if VehicleDriverAllocation.Find('-') then begin
        //         repeat
        //            // if Emp.Get(VehicleDriverAllocation."Driver Code") then begin
        //                 Header := 'TRIP NOTIFICATION ' + "Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

        //                 if SMTPSetup.Get() then begin
        //                     SenderEmail := SMTPSetup."Email Sender Address";
        //                     SenderName := SMTPSetup."Email Sender Name";
        //                 end;
        //                 if Emp."E-Mail" <> '' then begin
        //                     //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
        //                     //SMTPMail.AddBodyline('<br><br>');
        //                     //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
        //                     //SMTPMail.AddBodyline('<br><br>');
        //                     //SMTPMail.AddBodyline('Please note that you the above mentioned trip has been ' + Format(Status) + ' reason being ' + "Reason for Reopening");// for the month of January 2014');
        //                     //SMTPMail.AddBodyline('<br><br>');
        //                     //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
        //                     //SMTPMail.AddBodyline('<br>');
        //                     //SMTPMail.AddBodyline('Trip requested by : ' + "Employee Name");
        //                     //SMTPMail.AddBodyline('<br>');
        //                     //SMTPMail.AddBodyline('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip") + ' return date will be on ' + Format("Trip End Date"));
        //                     //SMTPMail.AddBodyline('<br>');
        //                     //SMTPMail.AddBodyline('<br>');
        //                     //SMTPMail.AddBodyline('Vehicle Reg Number: ' + VehicleDriverAllocation."Registration Number");
        //                     ////SMTPMail.AddBodyline('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non KERRA Vehicle Alloc.");
        //                     //SMTPMail.AddBodyline('<br>');
        //                     //SMTPMail.AddBodyline('Kindly prepare adequately');
        //                     //SMTPMail.AddBodyline('<br><br>');
        //                     //SMTPMail.AddBodyline('Thanks & Regards');
        //                     //SMTPMail.AddBodyline('<br><br>');
        //                     //SMTPMail.AddBodyline(SenderName);
        //                     //SMTPMail.AddBodyline('<br><br>');
        //                     //SMTPMail.AddBodyline('<HR>');
        //                     //SMTPMail.AddBodyline('This is a system generated mail.');
        //                     //SMTPMail.AddBodyline('<br><br>');
        //                     //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
        //                     //SMTPMail.AddBodyline('<br><br>');
        //                     //SMTPMail.Send;
        //                     Message('Mail sent to %1', Emp."E-Mail");
        //                 end;
        //                 //End email
        //             end;
        //         //notify requester
        //         // ERROR('here %1',Rec."Employee No");

        //         until VehicleDriverAllocation.Next = 0;
        //         Message('Email notifications has been sent');
        //     end;
        //     if Emp.Get(Employee) then begin
        //         Header := 'TRIP NOTIFICATION ' + "Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

        //         if SMTPSetup.Get() then begin
        //             SenderEmail := SMTPSetup."Email Sender Address";
        //             SenderName := SMTPSetup."Email Sender Name";
        //         end;
        //         if Emp."E-Mail" <> '' then begin
        //             //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
        //             //SMTPMail.AddBodyline('<br><br>');
        //             //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
        //             //SMTPMail.AddBodyline('<br><br>');
        //             //SMTPMail.AddBodyline('Please note that you the above mentioned trip has been ' + Format(Status) + ' reason being ' + "Reason for Reopening");// for the month of January 2014');
        //             //SMTPMail.AddBodyline('<br><br>');
        //             //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
        //             //SMTPMail.AddBodyline('<br>');
        //             //SMTPMail.AddBodyline('Driver Name : ' + VehicleDriverAllocation."Driver Name");
        //             //SMTPMail.AddBodyline('<br>');
        //             //SMTPMail.AddBodyline('Vehicle Reg Number: ' + VehicleDriverAllocation."Registration Number");
        //             //SMTPMail.AddBodyline('<br>');
        //             VehicleDrivers.Reset;
        //             VehicleDrivers.SetRange(VehicleDrivers.Driver, VehicleDriverAllocation."Driver Code");
        //             if VehicleDrivers.FindSet then begin
        //                 //SMTPMail.AddBodyline('Driver Phone Number : ' + VehicleDrivers."Phone Number");
        //                 //SMTPMail.AddBodyline('<br>');
        //             end;
        //             //SMTPMail.AddBodyline('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip"));
        //             //SMTPMail.AddBodyline('<br>');
        //             ////SMTPMail.AddBodyline('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non KERRA Vehicle Alloc.");
        //             //SMTPMail.AddBodyline('<br>');
        //             //SMTPMail.AddBodyline('Kindly prepare adequately');
        //             //SMTPMail.AddBodyline('<br><br>');
        //             //SMTPMail.AddBodyline('Thanks & Regards');
        //             //SMTPMail.AddBodyline('<br><br>');
        //             //SMTPMail.AddBodyline(SenderName);
        //             //SMTPMail.AddBodyline('<br><br>');
        //             //SMTPMail.AddBodyline('<HR>');
        //             //SMTPMail.AddBodyline('This is a system generated mail.');
        //             //SMTPMail.AddBodyline('<br><br>');
        //             //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
        //             //SMTPMail.AddBodyline('<br><br>');
        //             //SMTPMail.Send;
        //             Message('Mail sent to %1', Emp."E-Mail");
        //         end;
        //         //End email
        //     end;
        /*ObjTravelStaff.RESET;
        ObjTravelStaff.SETRANGE(ObjTravelStaff."Req No",Rec."Transport Requisition No");
        IF ObjTravelStaff.FIND('-') THEN BEGIN
          REPEAT
            IF Emp.GET(ObjTravelStaff."Employee No") THEN BEGIN
                Header:='TRAVEL TRIP NOTIFICATION '+"Transport Requisition No"+' ON '+FORMAT(VehicleDriverAllocation."Date of Trip")+' TO '+FORMAT(VehicleDriverAllocation."Trip End Date");

                IF SMTPSetup.GET() THEN BEGIN
                  SenderEmail:=SMTPSetup."Email Sender Address";
                  SenderName:= SMTPSetup."Email Sender Name";
                END;
                IF Emp."E-Mail" <> '' THEN BEGIN
                  //SMTPMail.CreateMessage(SenderName,SenderEmail,Emp."E-Mail",Header,'',TRUE);
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('Dear '+Emp."First Name"+' '+Emp."Last Name"+',');
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('Please note that you the above mentioned trip has been '+FORMAT(Status)+' reason being '+"Reason for Reopening");// for the month of January 2014');
                  //SMTPMail.AddBodyline('<br><br>');
                  //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                  //SMTPMail.AddBodyline('<br>');
                  //SMTPMail.AddBodyline('Driver Name : '+VehicleDriverAllocation."Driver Name");
                  //SMTPMail.AddBodyline('<br>');
                  VehicleDrivers.RESET;
                  VehicleDrivers.SETRANGE(VehicleDrivers.Driver,VehicleDriverAllocation."Driver Code");
                  IF VehicleDrivers.FINDSET THEN BEGIN
                    //SMTPMail.AddBodyline('Driver Phone Number : '+VehicleDrivers."Phone Number");
                    //SMTPMail.AddBodyline('<br>');
                  END;
                  //SMTPMail.AddBodyline('Trip From: '+Commencement+' To '+Destination+' on '+FORMAT("Date of Trip"));
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
                  //MESSAGE('Mail sent to %1',Emp."E-Mail");
                END;
                //End email
              END;
          UNTIL ObjTravelStaff.NEXT=0;
        END;
        */

    end;

    local procedure UpdateDriverToMemo(var ApprovedMemo: Code[30])
    var
        ImprestMemo: Record "Imprest Memo";
        DriverAllocation: Record "Vehicle Driver Allocation";
        ProjectMembers: Record "Project Members";
        ProjectMember1: Record "Project Members";
        FleetSetup: Record "Fleet Management Setup";
        DefaultDriver: Code[20];
    begin
        if ImprestMemo.Get(ApprovedMemo) then begin
            FleetSetup.Get;
            FleetSetup.TestField("Default Fleet Driver");
            DefaultDriver := FleetSetup."Default Fleet Driver";

            DriverAllocation.Reset;
            DriverAllocation.SetRange(DriverAllocation."Requisition Number", "Transport Requisition No");
            if DriverAllocation.Find('-') then begin
                repeat
                    ProjectMember1.Reset;
                    ProjectMember1.SetRange(ProjectMember1."Imprest Memo No.", ApprovedMemo);
                    ProjectMember1.SetRange(ProjectMember1."No.", DefaultDriver);
                    if ProjectMember1.FindFirst then begin
                        ProjectMembers.Init;
                        ProjectMembers."Imprest Memo No." := ApprovedMemo;
                        ProjectMembers.Type := ProjectMembers.Type::Person;
                        //  ProjectMembers."No." := DriverAllocation."Driver Code";
                        ProjectMembers.Validate("No.");
                        //ProjectMembers."Time Period" := DriverAllocation."Number of Days";
                        ProjectMembers.Validate("Time Period");
                        ProjectMembers."Vote Item" := ProjectMember1."Vote Item";
                        ProjectMembers.Validate("Vote Item");
                        ProjectMembers."Type of Expense" := ProjectMember1."Type of Expense";
                        ProjectMembers.Validate("Type of Expense");
                        ProjectMembers."Work Type" := ProjectMember1."Work Type";
                        ProjectMembers.Validate("Work Type");
                        ProjectMembers.Job := ProjectMember1.Job;
                        ProjectMembers."Job  Task" := ProjectMember1."Job  Task";
                        ProjectMembers.Validate(Job);
                        ProjectMembers.Validate("Job  Task");
                        if ProjectMembers.Insert(true) then;
                    end;
                until DriverAllocation.Next = 0;
                ProjectMember1.Reset;
                ProjectMember1.SetRange(ProjectMember1."Imprest Memo No.", ApprovedMemo);
                ProjectMember1.SetRange(ProjectMember1."No.", DefaultDriver);
                ProjectMember1.DeleteAll;
            end;
        end;
    end;


    Procedure CheckDriverDoubleBooking(VehicleDriverAllocation: Record "Vehicle Driver Allocation"): Boolean
    var
        VehicleDriverAllocationHist: Record "Vehicle Driver Allocation";
    begin
        VehicleDriverAllocationHist.Reset();
        VehicleDriverAllocationHist.SetRange("Driver Code", VehicleDriverAllocation."Driver Code");
        VehicleDriverAllocationHist.SetFilter("Requisition Number", '<>%1', VehicleDriverAllocation."Requisition Number");
        if VehicleDriverAllocationHist.FindSet() then begin
            repeat
                if (VehicleDriverAllocation."Date of Trip" >= VehicleDriverAllocationHist."Date of Trip") and (VehicleDriverAllocation."Date of Trip" <= VehicleDriverAllocationHist."Trip End Date") then
                    Error('Driver has already been allocated from %1 to %2 for Requisition No. %3', VehicleDriverAllocationHist."Date of Trip", VehicleDriverAllocationHist."Trip End Date", VehicleDriverAllocationHist."Registration Number");
            until VehicleDriverAllocationHist.Next() = 0;
        end
    end;

    Procedure CheckBetweenTwoDates(): Boolean
    begin

    end;
}


