#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59012 "Fleet Requisition Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Transport Requisition";
    PromotedActionCategories = 'New,Process,Report,Approve,Invoice,Posting,View,Incoming Document,Request Approval,,Release,Navigate';
    RefreshOnActivate = true;
    Caption = 'Transport Requisition Card';
    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = NotEditable;
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Requested By"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Requested By Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Caption = 'Designation';
                    Editable = false;
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Commencement Code";Rec."Commencement Code")
                {
                    ApplicationArea = All;
                    Caption = 'From';
                }
                field(From; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    // Editable = CommencementEditable;
                }
                field("Destination Code";Rec."Destination Code")
                {
                    ApplicationArea = All;
                    Caption = 'To';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    // Editable = LocalRun;
                    // Enabled = true;
                }
                field("Type of Vehicle";Rec."Type of Vehicle")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    // Editable = LocalRun;
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                    // Editable = LocalRun;
                }
                field("Trip End Date"; Rec."Trip End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No of Drivers"; Rec."No of Drivers")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Staff";Rec."No. of Staff")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Type of Trip"; Rec."Type of Trip")
                // {
                //     ApplicationArea = Basic;
                //     OptionCaption = 'Safari,Local Runing';

                //     trigger OnValidate()
                //     begin
                //         if Rec."Type of Trip" = Rec."type of trip"::"Local Runing" then begin
                //             Safari := false;
                //             LocalRun := true;
                //         end;
                //         if Rec."Type of Trip" = Rec."type of trip"::Safari then begin
                //             Safari := true;
                //             LocalRun := false;
                //         end;
                //     end;
                // }
                // field("Approved Imprest Memo"; Rec."Approved Imprest Memo")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Imprest Memo';
                //     Enabled = Safari;

                //     trigger OnValidate()
                //     begin
                //         Rec.Destination := UpperCase(Rec.Destination);
                //         //Commencement:=UPPERCASE(Commencement);
                //         Rec.Modify;
                //     end;
                // }
                field("Time Requested"; Rec."Time Requested")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time of Trip';
                    Editable = LocalRun;
                    Visible = false;
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    Editable = LocalRun;
                    Visible = false;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    Editable = LocalRun;
                    Visible = false;
                }
                field("Number of Hours Requested"; Rec."Number of Hours Requested")
                {
                    ApplicationArea = Basic;
                    Editable = LocalRun;
                    visible = false;
                }
                field("Trip End Time"; Rec."Trip End Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    visible = false;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    Editable = JourneyEditable;
                    Visible = false;
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = openingMileageEditable;
                    Visible = false;
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = closingMileageEditable;
                    Visible = false;
                }
                
                field("Loaded to WorkTicket"; Rec."Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                    Editable = loadedEditable;
                    Visible = false;
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    Editable = workticketEditable;
                    LookupPageID = "Daily Work Ticket List";
                    Visible = false;
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    visible = false;
                }
                field("Added On"; Rec."Added On")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Code';
                    Visible = false;
                }
            }
            group("Reason for Cancelling")
            {
                Visible = ReasonCancel;
                field("Reason for Reopening"; Rec."Reason for Reopening")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason for Cancelling';
                    Editable = true;
                    MultiLine = true;
                    Visible = Approved;
                }
            }
            group(Purpose)
            {
                Editable = LocalRun;
                Visible = false;
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = commentsEditable;
                    Visible = false;
                }
            }
            // part("Transport Requisition Staff"; "Travel Requisition Staff")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Travelling Staff';
            //     Editable = LocalRun;
            //     SubPageLink = "Req No" = field("Transport Requisition No");
            //     visible = false;
            // }
            // part(Control17; "Non Staff Tavel Request")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Non Staff Travelers';
            //     Editable = Open;
            //     SubPageLink = "Req No" = field("Transport Requisition No");
            //     visible = false;
            // }
            part(Control14; "Driver Vehicle Allocation")
            {
                Caption = 'Driver Vehicle Allocation';
                ApplicationArea = Basic;
                SubPageLink = "Requisition Number" = field("Transport Requisition No");
                Visible = drivervehicleallocationtabsvisible;
            }
            // part(Control22; "Non KeRRA Driver Allocations")
            // {
            //     Caption = 'Non KURA Driver Allocations';
            //     ApplicationArea = Basic;
            //     SubPageLink = "Req No" = field("Transport Requisition No");
            //     // Visible = drivervehicleallocationtabsvisible;
            //     visible = false;
            // }

        }
        area(FactBoxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(59003), "No." =
                FIELD("Transport Requisition No");

            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000019; Links)
            {
            }
        }
        
    }

    actions
    {
        area(creation)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = NotEditable;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.TestField("Commencement Code");
                    Rec.TestField("Destination Code");
                    Rec.TestField("Date of Trip");
                    Rec.TestField("No of Days Requested");


                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //TESTFIELD("Purpose of Trip");

                    //  if ApprovalsMgmtExt.CheckFleetApprovalsWorkflowEnabled(Rec) then
                    //  ApprovalsMgmtExt.OnSendFleetForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    RecRef: RecordRef;
                    customApprovalEntry: Record "Custom Approval Entry";
                    OldStatus: Option;
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    // Rec.TestField("Created By", UserId);

                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    //  ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Close Fleet Requsition")
            {
                ApplicationArea = Basic;
                Image = Change;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = FullyApproved;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Only Approved requisitions can be closed');
                    if Confirm('Are you sure you want to close this Fleet Request?', true) = false then begin
                        exit
                    end else

                        VehicleDriverAllocation.Reset();
                        VehicleDriverAllocation.SetRange("Requisition Number", Rec."Transport Requisition No");
                        if VehicleDriverAllocation.FindSet() then begin
                            Rec.Closed := True;
                            Rec."Closed By" := UserId;
                            Rec."Date Closed" := Today;
                            Rec.Modify;
                            // SendEmailNotificationC(Rec."Transport Requisition No", Rec."Employee No");
                            Message('Transport Requisition No %1 Closed Successfully', Rec."Transport Requisition No", Rec.Status);
                            CurrPage.Close;
                        end else begin
                            error('Please allocate a driver for this trip first.');
                        end;
                end;
            }
            action("Open Fleet Requsition")
            {
                ApplicationArea = Basic;
                Image = Change;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = Canceled;

                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Cancelled then
                        Error('Only Cancelled requisitions can be opened');
                    ReasonCancel := true;
                    if Rec."Reason for Reopening" = '' then
                        Error('Make sure you state the reason for reopening this requisition under purpose fast tab');
                    if Confirm('Are you sure you want to open this Fleet Request?', true) = false then begin
                        exit
                    end else
                        Rec.Status := Rec.Status::Open;
                    Rec."Closed By" := UserId;
                    Rec."Date Closed" := Today;
                    Rec.Modify;
                    Message('Transport Requisition No %1 %2 Successfully', Rec."Transport Requisition No", Rec.Status);
                    CurrPage.Close;
                end;
            }
            action("Suggest New Mode of Transport")
            {
                ApplicationArea = Basic;
                Image = SuggestVendorPayments;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                // Visible = FullyApproved;
                visible = false;

                trigger OnAction()
                var
                    ImprestMemo: Record "Imprest Memo";
                begin
                    Rec.TestField("Approved Imprest Memo");
                    ReasonCancel := true;
                    if Rec.Status = Rec.Status::Closed then
                        Error('Closed Requisitions cannot be canceled');
                    // IF "Reason for Reopening" = '' THEN
                    //  ERROR('Make sure you state the reason for cancelling this requisition under purpose fast tab');

                    if Confirm('Are you sure you want to suggest new mode of transport for this Fleet Request?', true) then begin
                        ImprestMemo.Reset;
                        ImprestMemo.SetRange(ImprestMemo."No.", Rec."Approved Imprest Memo");
                        Report.Run(58998, true, true, ImprestMemo);
                        Rec.Status := Rec.Status::Cancelled;
                        Rec."Closed By" := UserId;
                        Rec."Date Closed" := Today;
                        Rec.Modify;
                        Message('Transport Requisition No %1 %2 Successfully', Rec."Transport Requisition No", Rec.Status);
                        CurrPage.Close;
                        SendEmailNotificationC(Rec."Transport Requisition No", Rec."Employee No");

                    end;
                end;
            }
            action("Cancel Fleet Requsition")
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Fleet Requisition';
                Image = Cancel;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = FullyApproved;

                trigger OnAction()
                begin
                    ReasonCancel := true;
                    if Rec.Status = Rec.Status::Closed then
                        Error('Closed Requisitions cannot be canceled');
                    if Rec."Reason for Reopening" = '' then
                        Error('Make sure you state the reason for cancelling this requisition under purpose fast tab');

                    if Confirm('Are you sure you want to cancel this Fleet Request?', true) = false then begin
                        exit
                    end else
                        Rec.Status := Rec.Status::Cancelled;
                    Rec."Closed By" := UserId;
                    Rec."Date Closed" := Today;
                    Rec.Modify;
                    Message('Transport Requisition No %1 %2 Successfully', Rec."Transport Requisition No", Rec.Status);
                    CurrPage.Close;
                    SendEmailNotificationC(Rec."Transport Requisition No", Rec."Employee No");
                end;
            }
            action("Reject Fleet Requsition")
            {
                ApplicationArea = Basic;
                Caption = 'Reject Fleet Requsition';
                Image = Reject;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = FullyApproved;

                trigger OnAction()
                begin
                    ReasonCancel := true;
                    if Rec.Status = Rec.Status::Closed then
                        Error('Closed Requisitions cannot be canceled');
                    if Rec."Reason for Reopening" = '' then
                        Error('Make sure you state the reason for rejecting this requisition under purpose fast tab');

                    if Confirm('Are you sure you want to cancel this Fleet Request?', true) = false then begin
                        exit
                    end else
                        Rec.Status := Rec.Status::Rejected;
                    Rec."Closed By" := UserId;
                    Rec."Date Closed" := Today;
                    Rec.Modify;
                    Message('Transport Requisition No %1 %2 Successfully', Rec."Transport Requisition No", Rec.Status);
                    CurrPage.Close;
                    SendEmailNotificationC(Rec."Transport Requisition No", Rec."Employee No");
                end;
            }
            action(Attachments)
            {
                ApplicationArea = Basic;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                DocumentAttachmentDetails: Page "Document Attachment Details";
                RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
            action("Create Gate Pass for Request")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Gate Pass';
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    /*IF CONFIRM('You are about to generate a gate pass document for this request\Would you like to proceed?',TRUE) THEN BEGIN
                      FleetItems.RESET;
                      FleetItems.SETRANGE(FleetItems."Requisition Number",Rec."Transport Requisition No");
                      NoOfItems := FleetItems.COUNT;
                      IF NoOfItems > 0 THEN BEGIN
                      END ELSE
                        ERROR('No Items have been listed in this requisition, please check and try again');
                    
                      GatePass.RESET;
                      GatePass.SETRANGE(GatePass."Transport Requisition No","Transport Requisition No");
                      IF GatePass.FINDFIRST THEN BEGIN
                        IF CONFIRM('Gate pass '+GatePass."Transport Requisition No"+' for this request already exists, would you like to open it?',TRUE) THEN
                          PAGE.RUN(59137,GatePass);
                      END ELSE BEGIN
                        GatePass.INIT;
                        GatePass.TRANSFERFIELDS(Rec);
                        GatePass.Status := GatePass.Status::"0";
                        IF GatePass.INSERT(TRUE) THEN BEGIN
                          IF CONFIRM('Gate pass created, would you like to open it?',TRUE) THEN BEGIN
                            GatePass.RESET;
                            GatePass.SETRANGE(GatePass."Transport Requisition No","Transport Requisition No");
                            PAGE.RUN(59137,GatePass);
                          END;
                        END;
                      END;
                    END;
                    */

                end;
            }
            action("Process Driver Allocation")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = approved;

                trigger OnAction()
                begin
                    if Confirm(Confirm0001, true) then begin
                        VehicleDriversAll.Reset;
                        VehicleDriversAll.SetRange(VehicleDriversAll."Requisition Number", Rec."Transport Requisition No");
                        // VehicleDriversAll.SetRange(VehicleDriversAll."Reassigned?", false);
                        if VehicleDriversAll.FindSet() then begin
                            repeat
                                if VehicleDriversAll."Registration Number" = '' then
                                    Error('Please allocate vehicle to driver %1 before proceeding...', VehicleDriversAll."Driver Code")
                                // else begin
                                //     if Rec."Approved Imprest Memo" <> '' then begin
                                //         UpdateDriverToMemo(Rec."Approved Imprest Memo", VehicleDriversAll);
                                //         Rec.CheckDriverDoubleBooking(VehicleDriversAll);
                                //     end;
                                // end;
                            until VehicleDriversAll.Next = 0;
                            // Message('Imprest Memo %1 updated successfuly', Rec."Approved Imprest Memo");
                            if Confirm('Would you like to notify the Drivers and Requestor?', true) then
                                SendEmailNotification(VehicleDriversAll);
                        end else begin
                            Message('No Driver Available for this action');
                        end;
                    end;


                    ObjVehicleDriverAllocation.Reset;
                    ObjVehicleDriverAllocation.SetRange(ObjVehicleDriverAllocation."Requisition Number", Rec."Transport Requisition No");
                    if ObjVehicleDriverAllocation.FindSet then
                        repeat
                            ObjDriverOutofOfficeReq.Init;
                            ObjDriverOutofOfficeReq."Document No" := '';
                            ObjDriverOutofOfficeReq."Driver No" := ObjVehicleDriverAllocation."Driver Code";
                            ObjDriverOutofOfficeReq."Driver Name" := ObjVehicleDriverAllocation."Driver Name";
                            ObjDriverOutofOfficeReq."Trip No" := Rec."Transport Requisition No";
                            ObjDriverOutofOfficeReq."Trip Descrption" := Rec.Subject;
                            ObjDriverOutofOfficeReq."Trip Starting Date" := Rec."Date of Trip";
                            ObjDriverOutofOfficeReq."Trip End Date" := Rec."Trip End Date";
                            ObjDriverOutofOfficeReq."Vehicle Reg No" := ObjVehicleDriverAllocation."Registration Number";
                            ObjDriverOutofOfficeReq."Vehicle Description" := ObjVehicleDriverAllocation."Vehicle Description";
                            if not ObjDriverOutofOfficeReq.Insert(true) then
                                ObjDriverOutofOfficeReq.Modify(true);
                        until ObjVehicleDriverAllocation.Next = 0;
                    Message('Driver Out Of Office Requisitions Generate');

                    // ImprestMemo.RESET;
                    // ImprestMemo.SETRANGE(ImprestMemo."No.","Approved Imprest Memo");
                    // IF ImprestMemo.SETRANGE THEN
                    //  ImprestMemo."Fleet Requisition Created"=TRUE;
                end;
            }
            action("Notify Non Staff Driver")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                // Visible = approved;
                Visible = false;

                trigger OnAction()
                begin
                    if Confirm(Confirm0001, true) then begin
                        NonDriverAllocation.Reset;
                        NonDriverAllocation.SetRange(NonDriverAllocation."Req No", Rec."Transport Requisition No");
                        //VehicleDriversAll.SETRANGE(VehicleDriversAll."Reassigned?",FALSE);
                        if NonDriverAllocation.Find('-') then begin
                            repeat
                                if NonDriverAllocation."Vehicle Registration No" = '' then
                                    Error('Please allocate vehicle to driver %1 before proceeding...', NonDriverAllocation."Driver Name")
                                else begin
                                    //        IF "Approved Imprest Memo" <> '' THEN BEGIN
                                    //          UpdateDriverToMemo("Approved Imprest Memo",VehicleDriversAll);
                                end;
                            until NonDriverAllocation.Next = 0;
                            //MESSAGE('Imprest Memo %1 updated successfuly',"Approved Imprest Memo");
                            if Confirm('Would you like to notify the drivers and Requestors?', true) then
                                SendEmailNotification2();
                        end else begin
                            Message('No Driver Available for this action');

                        end;
                    end;


                    ObjVehicleDriverAllocation.Reset;
                    ObjVehicleDriverAllocation.SetRange(ObjVehicleDriverAllocation."Requisition Number", Rec."Transport Requisition No");
                    if ObjVehicleDriverAllocation.FindSet then
                        repeat
                            ObjDriverOutofOfficeReq.Init;
                            ObjDriverOutofOfficeReq."Document No" := '';
                            ObjDriverOutofOfficeReq."Driver No" := ObjVehicleDriverAllocation."Driver Code";
                            ObjDriverOutofOfficeReq."Driver Name" := ObjVehicleDriverAllocation."Driver Name";
                            ObjDriverOutofOfficeReq."Trip No" := Rec."Transport Requisition No";
                            ObjDriverOutofOfficeReq."Trip Descrption" := Rec.Subject;
                            ObjDriverOutofOfficeReq."Trip Starting Date" := Rec."Date of Trip";
                            ObjDriverOutofOfficeReq."Trip End Date" := Rec."Trip End Date";
                            ObjDriverOutofOfficeReq."Vehicle Reg No" := ObjVehicleDriverAllocation."Registration Number";
                            ObjDriverOutofOfficeReq."Vehicle Description" := ObjVehicleDriverAllocation."Vehicle Description";
                            if not ObjDriverOutofOfficeReq.Insert(true) then
                                ObjDriverOutofOfficeReq.Modify(true);
                        until ObjVehicleDriverAllocation.Next = 0;
                    Message('Driver Out Of Office Requisitions Generate');

                    // ImprestMemo.RESET;
                    // ImprestMemo.SETRANGE(ImprestMemo."No.","Approved Imprest Memo");
                    // IF ImprestMemo.SETRANGE THEN
                    //  ImprestMemo."Fleet Requisition Created"=TRUE;
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = PendingApp;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //CheckAllocationDetails;
                        // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                        //MESSAGE('Requision approved...');
                        CurrPage.Close;
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = PendingApp;

                    trigger OnAction()
                    var
                    //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = PendingApp;

                    trigger OnAction()
                    var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        // CheckAllocationDetails;
                        // ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
            }
            action(Testing)
            {
                ApplicationArea = Basic;
                Visible = false;

                trigger OnAction()
                begin
                    /*IF CONFIRM('You are about to generate a gate pass document for this request\Would you like to proceed?',TRUE) THEN BEGIN
                      VehicleDriverAllocation.RESET;
                      VehicleDriverAllocation.SETRANGE(VehicleDriverAllocation."Requisition Number",Rec."Transport Requisition No");
                      IF VehicleDriverAllocation.FIND('-') THEN BEGIN
                        REPEAT
                          Trips.INIT;
                          Trips.TRANSFERFIELDS(Rec);
                          Trips."Driver Allocated" := VehicleDriverAllocation."Driver Code";
                          Trips."Driver Name" := VehicleDriverAllocation."Driver Name";
                          Trips."Vehicle Allocated" := VehicleDriverAllocation."Vehicle Registration No";
                          Trips.Status := Trips.Status::Open;
                          IF NOT Trips.INSERT(TRUE) THEN
                            Trips.MODIFY(TRUE);
                        UNTIL VehicleDriverAllocation.NEXT=0;
                      END;
                    END;
                    */

                end;
            }
            action(TestRec)
            {
                ApplicationArea = Basic;
                Visible = false;

                trigger OnAction()
                begin
                    CreateFuelReq;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    Req: Record "Transport Requisition";
                begin
                    Req.Reset;
                    Req.SetRange(Req."Transport Requisition No", Rec."Transport Requisition No");
                    Report.Run(59018, true, true, Req);
                end;
            }
            action(AttachDocuments)
            {
                ApplicationArea = Basic;
                Caption = 'Attach Document';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    //DMSManagement.UploadImprestDocuments(DMSDocuments."Document Type"::"13","Transport Requisition No",'Transport Requisition',RECORDID,"Department Code");
                    //DMSManagement.FnUploadAdvancePaymentRequestDocuments("Transport Requisition No",'Transport Requition',RECORDID,'R48');
                    DMSManagement.UploadFleetRequisitionDocuments(Rec."Transport Requisition No", 'Transport Requisition', Rec.RecordId, Rec."Global Dimension 1 Code");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols();
        drivervehicleallocationtabsvisible := false;
        if Rec.Status in [Rec.Status::Approved, Rec.Status::Cancelled, Rec.Status::Closed, Rec.Status::Rejected] then begin
            drivervehicleallocationtabsvisible := true;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        // "Purpose of Trip".CREATEINSTREAM(ObjInstr);
        // Obj.READ(ObjInstr);
        // ObjText:=FORMAT(Obj);
        drivervehicleallocationtabsvisible := false;
        if Rec.Status in [Rec.Status::Approved, Rec.Status::Cancelled, Rec.Status::Closed, Rec.Status::Rejected] then begin
            drivervehicleallocationtabsvisible := true;
        end;
    end;

    trigger OnOpenPage()
    begin
        Approved := false;
        NotEditable := true;
        ViewApprovalButton := false;
        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::"Pending Approval") then
            Approved := true;
        PendingApp := false;
        if Rec.Status = Rec.Status::"Pending Approval" then
            PendingApp := true;
        FullyApproved := false;
        if Rec.Status = Rec.Status::Approved then
            FullyApproved := true;
        OpenApprovalEntriesExistForCurrUser := false;
        if Rec.Status <> Rec.Status::Open then
            NotEditable := false;
        Safari := true;
        LocalRun := false;
        if Rec."Type of Trip" = Rec."type of trip"::"Local Runing" then begin
            Safari := false;
            LocalRun := true;
        end;
        ReasonCancel := false;
        Canceled := false;
        if Rec.Status = Rec.Status::Cancelled then
            Canceled := true;

        drivervehicleallocationtabsvisible := false;
        if Rec.Status in [Rec.Status::Approved, Rec.Status::Cancelled, Rec.Status::Closed, Rec.Status::Rejected] then begin
            drivervehicleallocationtabsvisible := true;
        end;
    end;

    var
        TransportRequisition: Record "Transport Requisition";
        TransportReqEditable: Boolean;
        CommencementEditable: Boolean;
        DensitationEditable: Boolean;
        VehicleEditable: Boolean;
        DriverEditable: Boolean;
        DriverNameEditable: Boolean;
        allocatedbyEditable: Boolean;
        DepartmentEditable: Boolean;
        DaterequestedEditable: Boolean;
        TimeRequestedEditable: Boolean;
        DateofTripEditable: Boolean;
        TimeoutEditable: Boolean;
        TimeInEditable: Boolean;
        JourneyEditable: Boolean;
        openingMileageEditable: Boolean;
        closingMileageEditable: Boolean;
        NoofDaysEditable: Boolean;
        loadedEditable: Boolean;
        workticketEditable: Boolean;
        purposeEditable: Boolean;
        authorisedEditable: Boolean;
        lines: Record "Travel Requisition Staff";
        line: Boolean;
        Requestedby: Boolean;
        PositionEditable: Boolean;
        commentsEditable: Boolean;
        RespEditable: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SMSMessages: Record "Committment Entries";
        iEntryNo: Integer;
        HR: Record Employee;
        Fleetmgmtsetup: Record "Fleet Management Setup";
        Emp: Record Employee;
        Email2: Code[100];
        Body: Code[100];
        SMTP: Codeunit Mail;
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        VehicleDriverAllocation: Record "Vehicle Driver Allocation";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit Mail;
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Approved: Boolean;
        VehicleDrivers: Record "Vehicle Drivers";
        ImprestMemo: Record "Imprest Memo";
        ImprestMemo1: Record "Imprest Memo";
        ProjectMembers: Record "Project Members";
        ProjectMember1: Record "Project Members";
        VehicleDriversAll: Record "Vehicle Driver Allocation";
        NoOfDriv: Integer;
        NoOfItems: Integer;
        PendingApp: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        FullyApproved: Boolean;
        CanCancelApprovalForRecord: Boolean;
        OPen: Boolean;
        VehicleAllocation: Record "Fleet Vehicle Allocation";
        NoSeries: Record "Nonstock Item";
        NonStaff: Record "Travel Requisition Non Staff";
        NonDriverAllocation: Record "Non-KeRRA Driver Allocation";
        NoOfNonD: Integer;
        Trips: Record "Transport Requisition Trips";
        NotEditable: Boolean;
        ViewApprovalButton: Boolean;
        FleetSetup: Record "Fleet Management Setup";
        Safari: Boolean;
        LocalRun: Boolean;
        ReasonCancel: Boolean;
        Canceled: Boolean;
        Confirm0001: label 'You are about to Process Driver Allocation for this request, This will update and send mail Notifications\Would you like to proceed?';
        VehicleDrivers11: Record "Vehicle Drivers";
        ObjTravelStaff: Record "Travel Requisition Staff";
        drivervehicleallocationtabsvisible: Boolean;
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        DriverOutofOfficeReq: Record "Driver Out of Office Req";
        ObjVehicleDriverAllocation: Record "Vehicle Driver Allocation";
        ObjDriverOutofOfficeReq: Record "Driver Out of Office Req";
        ApprovalsMgmtExt: Codeunit "Approval Mgmt. Ext";


    procedure updatecontrols()
    begin

        if Rec.Status = Rec.Status::Open then begin
            TransportReqEditable := false;
            CommencementEditable := true;
            DensitationEditable := true;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := false;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := false;
            workticketEditable := false;
            DaterequestedEditable := true;
            TimeRequestedEditable := true;
            DateofTripEditable := true;
            TimeoutEditable := true;
            JourneyEditable := true;
            openingMileageEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            Requestedby := true;
            PositionEditable := true;
            authorisedEditable := false;
            line := true;
            commentsEditable := true;
            RespEditable := true;
        end else
            if Rec.Status = Rec.Status::"Pending Approval" then begin
                TransportReqEditable := false;
                CommencementEditable := false;
                DensitationEditable := false;
                VehicleEditable := true;
                DriverEditable := true;
                allocatedbyEditable := true;
                closingMileageEditable := false;
                DriverNameEditable := true;
                DepartmentEditable := false;
                loadedEditable := false;
                workticketEditable := false;
                DaterequestedEditable := false;
                TimeRequestedEditable := false;
                DateofTripEditable := false;
                TimeoutEditable := false;
                JourneyEditable := false;
                openingMileageEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                authorisedEditable := false;
                Requestedby := false;
                PositionEditable := false;
                commentsEditable := false;
                RespEditable := false;
                line := false;
            end else
                if Rec.Status = Rec.Status::Approved then begin
                    TransportReqEditable := false;
                    CommencementEditable := false;
                    DensitationEditable := false;
                    VehicleEditable := true;
                    DriverEditable := true;
                    allocatedbyEditable := false;
                    closingMileageEditable := true;
                    DriverNameEditable := false;
                    DepartmentEditable := false;
                    loadedEditable := false;
                    workticketEditable := false;
                    DaterequestedEditable := false;
                    TimeRequestedEditable := false;
                    DateofTripEditable := false;
                    TimeoutEditable := false;
                    TimeInEditable := true;
                    JourneyEditable := false;
                    openingMileageEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    authorisedEditable := false;
                    Requestedby := false;
                    PositionEditable := false;
                    commentsEditable := false;
                    RespEditable := false;

                    line := false;
                end else

                    if Rec.Status = Rec.Status::Rejected then begin
                        TransportReqEditable := false;
                        CommencementEditable := false;
                        DensitationEditable := false;
                        VehicleEditable := false;
                        DriverEditable := false;
                        allocatedbyEditable := false;
                        closingMileageEditable := false;
                        DriverNameEditable := false;
                        DepartmentEditable := false;
                        loadedEditable := false;
                        workticketEditable := false;
                        DaterequestedEditable := false;
                        TimeRequestedEditable := false;
                        DateofTripEditable := false;
                        TimeoutEditable := false;
                        TimeInEditable := false;
                        JourneyEditable := false;
                        openingMileageEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        authorisedEditable := false;
                        line := false;
                        Requestedby := false;
                        PositionEditable := false;
                        commentsEditable := false;
                        RespEditable := false;
                    end
    end;

    local procedure SetControlAppearance()
    var
    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        // OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);
    end;

    local procedure CheckAllocationDetails()
    var
        NoOfDrivers: Integer;
        NoOfVehicles: Integer;
        NoOfStaff: Integer;
        NoOfNonStaff: Integer;
        TotalCarryingCap: Integer;
    begin
        VehicleDriverAllocation.Reset;
        VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Requisition Number", Rec."Transport Requisition No");
        NoOfDrivers := VehicleDriverAllocation.Count;

        NonDriverAllocation.Reset;
        NonDriverAllocation.SetRange(NonDriverAllocation."Req No", Rec."Transport Requisition No");
        NoOfNonD := NonDriverAllocation.Count;


        VehicleAllocation.Reset;
        VehicleAllocation.SetRange(VehicleAllocation."Transport Requisition No", Rec."Transport Requisition No");
        VehicleAllocation.CalcSums(VehicleAllocation.Capacity);
        NoOfVehicles := VehicleAllocation.Count;
        TotalCarryingCap := VehicleAllocation.Capacity;

        if NoOfVehicles = 0 then
            Error('Please assign vehicles to this requisition before proceeding');
        if (NoOfDrivers = 0) and (NoOfNonD = 0) then
            Error('Please assign drivers to this requisition before proceeding');
        lines.Reset;
        lines.SetRange(lines."Req No", Rec."Transport Requisition No");
        NoOfStaff := lines.Count;

        NonStaff.Reset;
        NonStaff.SetRange(NonStaff."Req No", Rec."Transport Requisition No");
        NoOfNonStaff := NonStaff.Count;



        /*IF (NoOfStaff + NoOfNonStaff) > TotalCarryingCap THEN
          ERROR('The total carrying Capacity of this requisition %1 is less than the traveling persons %2\Please change the vehicle or add another vehicle',TotalCarryingCap,(NoOfStaff + NoOfNonStaff));
        IF (NoOfDrivers + NoOfNonD) < NoOfVehicles THEN
          ERROR('The total number of drivers allocated must be equial or more than the allocated vehicles');*/

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

        FleetSetup.Get();
        FleetSetup.TestField(FleetSetup."Default Fleet Driver");
        // IF Emp.GET(VehicleDriverAllocation."Driver Code") THEN BEGIN
        Header := 'FUEL REIMBURSEMENT REQUEST' + Rec."Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

        if SMTPSetup.Get() then begin
            SenderEmail := SMTPSetup."Email Address";
            SenderName := SMTPSetup."Email Address";
        end;
        if FleetSetup."Default Fleet Driver" <> '' then begin
            //SMTPMail.CreateMessage(SenderName, SenderEmail, FleetSetup."Default Fleet Driver", Header, '', true);
            //SMTPMail.AddBodyline('<br><br>');
            //SMTPMail.AddBodyline('Dear Sir/Madam');
            //SMTPMail.AddBodyline('<br><br>');
            //SMTPMail.AddBodyline('Kindly prepare a fuel reimbursement of ' + Format(Amount) + ' from Project ' + ProjectCode + ' to Exchequer Transport vote.');// for the month of January 2014');
            //SMTPMail.AddBodyline('<br><br>');
            //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
            //SMTPMail.AddBodyline('<br>');
            //SMTPMail.AddBodyline('Trip requested by : ' + "Employee Name");
            //SMTPMail.AddBodyline('<br>');
            //SMTPMail.AddBodyline('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip") + ' return date will be on ' + Format("Trip End Date"));
            //SMTPMail.AddBodyline('<br>');
            ////SMTPMail.AddBodyline('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non kemri Vehicle Alloc.");
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
            //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@kemri.go.ke');
            //SMTPMail.AddBodyline('<br><br>');
            //SMTPMail.Send;
            Message('Mail sent to %1', FleetSetup."Default Fleet Driver");
        end;
        //End email
        // END;
    end;

    procedure SendEmailNotificationC(var ReqNo: Code[30]; var Employee: Code[30])
    begin
        VehicleDriverAllocation.Reset;
        VehicleDriverAllocation.SetRange("Requisition Number", ReqNo);
        VehicleDriverAllocation.SetRange("Reassigned?", false);
        if VehicleDriverAllocation.Find('-') then begin
            repeat
                if Emp.Get(VehicleDriverAllocation."Driver Code") then begin
                    Header := 'TRIP NOTIFICATION ' + Rec."Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

                    if SMTPSetup.Get() then begin
                        SenderEmail := SMTPSetup."Email Address";
                        SenderName := SMTPSetup."Email Address";
                    end;
                    if Emp."E-Mail" <> '' then begin
                        //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Please note that you the above mentioned trip has been ' + Format(Status) + ' reason being ' + "Reason for Reopening");// for the month of January 2014');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Trip requested by : ' + "Employee Name");
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip") + ' return date will be on ' + Format("Trip End Date"));
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('<br>');
                        if Rec."Reason for Reopening" <> '' then begin
                            //SMTPMail.AddBodyline('Reason : ' + "Reason for Reopening");
                            //SMTPMail.AddBodyline('<br>');
                            //SMTPMail.AddBodyline('<br>');
                        end;
                        //SMTPMail.AddBodyline('Vehicle Reg Number: ' + VehicleDriverAllocation."Registration Number");
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
                        Message('Mail sent to %1', Emp."E-Mail");
                    end;
                    //End email
                end;
            //notify requester
            // ERROR('here %1',Rec."Employee No");

            until VehicleDriverAllocation.Next = 0;
            Message('Email notifications has been sent');
        end;
        if Emp.Get(Employee) then begin
            Header := 'TRIP NOTIFICATION ' + Rec."Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

            if SMTPSetup.Get() then begin
                SenderEmail := SMTPSetup."Email Address";
                SenderName := SMTPSetup."Email Address";
            end;
            if Emp."E-Mail" <> '' then begin
                //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                //SMTPMail.AddBodyline('<br><br>');
                //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                //SMTPMail.AddBodyline('<br><br>');
                //SMTPMail.AddBodyline('Please note that you the above mentioned trip has been ' + Format(Status));// for the month of January 2014');
                //SMTPMail.AddBodyline('<br><br>');
                if Rec."Reason for Reopening" <> '' then begin
                    //SMTPMail.AddBodyline('<b>Reason : </b>' + "Reason for Reopening");
                    //SMTPMail.AddBodyline('<br>');
                    //SMTPMail.AddBodyline('<br>');
                end;
                //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                //SMTPMail.AddBodyline('<br>');
                //SMTPMail.AddBodyline('Vehicle Reg Number: ' + VehicleDriverAllocation."Registration Number");
                //SMTPMail.AddBodyline('<br>');

                //SMTPMail.AddBodyline('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip"));
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
            end;
            //End email
        end;
        ObjTravelStaff.Reset;
        ObjTravelStaff.SetRange(ObjTravelStaff."Req No", Rec."Transport Requisition No");
        if ObjTravelStaff.Find('-') then begin
            repeat
                if Emp.Get(ObjTravelStaff."Employee No") then begin
                    Header := 'TRAVEL TRIP NOTIFICATION ' + Rec."Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

                    if SMTPSetup.Get() then begin
                        SenderEmail := SMTPSetup."Email Address";
                        SenderName := SMTPSetup."Email Address";
                    end;
                    if Emp."E-Mail" <> '' then begin
                        //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Please note that you the above mentioned trip has been ' + Format(Status) + ' reason being ' + "Reason for Reopening");// for the month of January 2014');
                        //SMTPMail.AddBodyline('<br><br>');
                        if Rec."Reason for Reopening" <> '' then begin
                            //SMTPMail.AddBodyline('<b>Reason : </b>' + "Reason for Reopening");
                            //SMTPMail.AddBodyline('<br>');
                            //SMTPMail.AddBodyline('<br>');
                        end;
                        //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                        //SMTPMail.AddBodyline('<br>');

                        //SMTPMail.AddBodyline('Trip From: ' + Commencement + ' To ' + Destination + ' on ' + Format("Date of Trip"));
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
                    end;
                    //End email
                end;
            until ObjTravelStaff.Next = 0;
        end;
    end;

    local procedure UpdateDriverToMemo(var ApprovedMemo: Code[30]; var DriverAlloc: Record "Vehicle Driver Allocation")
    var
        ImprestMemo: Record "Imprest Memo";
        DriverAllocation: Record "Vehicle Driver Allocation";
        ProjectMembers: Record "Project Members";
        ProjectMember1: Record "Project Members";
        FleetSetup: Record "Fleet Management Setup";
        DefaultDriver: Code[20];
        ProjectMember2: Record "Project Members";
    begin
        if ImprestMemo.Get(ApprovedMemo) then begin
            FleetSetup.Get;
            FleetSetup.TestField("Default Fleet Driver");
            DefaultDriver := FleetSetup."Default Fleet Driver";

            ProjectMember1.Reset;
            ProjectMember1.SetRange(ProjectMember1."Imprest Memo No.", ApprovedMemo);
            if ProjectMember1.FindFirst then begin
                ProjectMembers.Init;
                ProjectMembers."Imprest Memo No." := ApprovedMemo;
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
                //ProjectMembers.VALIDATE("Job  Task");
                if not ProjectMembers.Insert(true) then
                    ProjectMembers.Modify(true);
            end;
            ProjectMember2.Reset;
            ProjectMember2.SetRange(ProjectMember2."Imprest Memo No.", ApprovedMemo);
            ProjectMember2.SetRange(ProjectMember2."No.", DefaultDriver);
            if ProjectMember2.FindSet then
                ProjectMember2.Delete;


        end;
    end;

    local procedure SendEmailNotification(var DriverAlloc: Record "Vehicle Driver Allocation")
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        EmailSubject: Text;
        EmailBody: Text;
        Email1: Codeunit Email;
        EmailMessage1: Codeunit "Email Message";
        EmailBody1: Text;
    begin
        VehicleDriverAllocation.Reset;
        VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Requisition Number", DriverAlloc."Requisition Number");
        // VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Reassigned?", false);
        if VehicleDriverAllocation.FindSet() then begin

            Header := 'TRAVEL TRIP NOTIFICATION ' + Rec."Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

            repeat
                TransportRequisition.Get(Rec."Transport Requisition No");
                if Emp.Get(VehicleDriverAllocation."Driver Code") then begin

                    // if SMTPSetup.Get() then begin
                    //     SenderEmail := SMTPSetup."Email Address";
                    //     SenderName := SMTPSetup."Email Address";
                    // end;
                    if Emp."E-Mail" <> '' then begin

                        EmailBody := '<br><br>Dear '  + Emp."First Name" + ' ' + Emp."Last Name" + ',<br><br>';
                        EmailBody += 'Please note that you have been assigned as the driver to the above mentioned trip.';
                        EmailBody += '<br><br>';
                        EmailBody += '<h5>Trip Details</h5>';
                        EmailBody += '<br>';
                        EmailBody += 'Trip requested by : ' + TransportRequisition."Employee Name";
                        EmailBody += '<br>';
                        EmailBody += 'Trip From: ' + TransportRequisition.Commencement + ' To ' + TransportRequisition.Destination + ' on ' + Format(TransportRequisition."Date of Trip") + ' return date will be on ' + Format(TransportRequisition."Trip End Date");
                        EmailBody += '<br>';
                        EmailBody += 'Vehicle Reg Number: ' + VehicleDriverAllocation."Requisition Number" + ' ' + VehicleDriverAllocation."Vehicle Description";
                        EmailBody += '<br><br>';
                        EmailBody += 'Kindly prepare adequately.';
                        

                        EmailMessage.Create(
                            Emp."E-Mail",
                            Header,
                            EmailBody,
                            true
                        );

                        Email.Send(EmailMessage);
                        //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Please note that you have been assigend as the driver to the above mentioned trip.');// for the month of January 2014');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Trip requested by : ' + TransportRequisition."Employee Name");
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Trip From: ' + TransportRequisition.Commencement + ' To ' + TransportRequisition.Destination + ' on ' + Format("Date of Trip") + ' return date will be on ' + Format("Trip End Date"));
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Vehicle Reg Number: ' + VehicleDriverAllocation."Requisition Number" + ' ' + VehicleDriverAllocation."Vehicle Description");
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
                        Message('Mail sent to %1', Emp."E-Mail");
                    end;
                    //End email
                end;
                //notify requester
                // ERROR('here %1',Rec."Employee No");
                // if Emp.Get(TransportRequisition."Employee No") then begin
                //     Header := 'TRAVEL TRIP NOTIFICATION ' + VehicleDriverAllocation."Requisition Number" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

                //     if SMTPSetup.Get() then begin
                //         SenderEmail := SMTPSetup."Email Address";
                //         SenderName := SMTPSetup."Email Address";
                //     end;
                //     if Emp."E-Mail" <> '' then begin
                //         //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                //         //SMTPMail.AddBodyline('<br><br>');
                //         //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                //         //SMTPMail.AddBodyline('<br><br>');
                //         //SMTPMail.AddBodyline('Please note that you have been assigend driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
                //         //SMTPMail.AddBodyline('<br><br>');
                //         //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                //         //SMTPMail.AddBodyline('<br>');
                //         //SMTPMail.AddBodyline('Driver Name : ' + VehicleDriverAllocation."Driver Name");
                //         //SMTPMail.AddBodyline('<br>');
                //         //SMTPMail.AddBodyline('Vehicle Reg Number: ' + VehicleDriverAllocation."Registration Number" + ' ' + VehicleDriverAllocation."Vehicle Description");
                //         ////SMTPMail.AddBodyline()
                //         VehicleDrivers11.Reset;
                //         VehicleDrivers11.SetRange(VehicleDrivers11.Driver, VehicleDriverAllocation."Driver Code");
                //         if VehicleDrivers11.FindSet then begin
                //             //SMTPMail.AddBodyline('Driver Phone Number : ' + VehicleDrivers11."Phone Number");
                //             //SMTPMail.AddBodyline('<br>');
                //         end;
                //         //SMTPMail.AddBodyline('Trip From: ' + TransportRequisition.Commencement + ' To ' + TransportRequisition.Destination + ' on ' + Format("Date of Trip"));
                //         //SMTPMail.AddBodyline('<br>');
                //         ////SMTPMail.AddBodyline('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non KERRA Vehicle Alloc.");
                //         //SMTPMail.AddBodyline('<br>');
                //         //SMTPMail.AddBodyline('Kindly prepare adequately');
                //         //SMTPMail.AddBodyline('<br><br>');
                //         //SMTPMail.AddBodyline('Thanks & Regards');
                //         //SMTPMail.AddBodyline('<br><br>');
                //         //SMTPMail.AddBodyline(SenderName);
                //         //SMTPMail.AddBodyline('<br><br>');
                //         //SMTPMail.AddBodyline('<HR>');
                //         //SMTPMail.AddBodyline('This is a system generated mail.');
                //         //SMTPMail.AddBodyline('<br><br>');
                //         //SMTPMail.AddBodyline('All Enquires regarding wages should be sent to HR@KERRA.go.ke');
                //         //SMTPMail.AddBodyline('<br><br>');
                //         //SMTPMail.Send;
                //         Message('Mail sent to %1', Emp."E-Mail");
                //     end;
                //     //End email
                // end;
            until VehicleDriverAllocation.Next = 0;
            Emp.Reset();
            Emp.SetRange("No.", TransportRequisition."Employee No");
            Emp.FindFirst();

            if Emp."E-Mail" <> '' then begin

                EmailBody1 := '<br><br>Dear '  + Emp."First Name" + ' ' + Emp."Last Name" + ',<br><br>';
                EmailBody1 += 'Please note that you have been assigned a driver to the above mentioned trip.';
                EmailBody1 += '<br><br>';
                EmailBody1 += '<h1>Trip Details</h1>';
                EmailBody1 += '<br>';
                EmailBody1 += 'Trip requested by : ' + TransportRequisition."Employee Name";
                EmailBody1 += '<br>';
                EmailBody1 += 'Trip From: ' + TransportRequisition.Commencement + ' To ' + TransportRequisition.Destination + ' on ' + Format(TransportRequisition."Date of Trip") + ' return date will be on ' + Format(TransportRequisition."Trip End Date");
                EmailBody1 += '<br>';
                EmailBody1 += '<br>';
                EmailBody1 += 'Vehicle Reg Number: ' + VehicleDriverAllocation."Requisition Number" + ' ' + VehicleDriverAllocation."Vehicle Description";
                EmailBody1 += '<br>';
                EmailBody1 += 'Kindly prepare adequately';

                EmailMessage1.Create(
                    Emp."E-Mail",
                    Header,
                    EmailBody1,
                    true
                );

                Email1.Send(EmailMessage1);

                Message('Mail sent to %1', Emp."E-Mail");
            end;

            Message('Email notifications sent.');
        end;
        /*ObjTravelStaff.RESET;
        ObjTravelStaff.SETRANGE(ObjTravelStaff."Req No",Rec."Requisition Number");
        IF ObjTravelStaff.FIND('-') THEN BEGIN
          REPEAT
            IF Emp.GET(ObjTravelStaff."Employee No") THEN BEGIN
                Header:='TRAVEL TRIP NOTIFICATION '+"Requisition Number"+' ON '+FORMAT(VehicleDriverAllocation."Date of Trip")+' TO '+FORMAT(VehicleDriverAllocation."Trip End Date");
        
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

    local procedure SendEmailNotification2()
    begin
        NonDriverAllocation.Reset;
        NonDriverAllocation.SetRange(NonDriverAllocation."Req No", NonDriverAllocation."Req No");
        //NonDriverAllocation.SETRANGE(VehicleDriverAllocation."Reassigned?",FALSE);
        if NonDriverAllocation.Find('-') then begin
            repeat
                TransportRequisition.Get(Rec."Transport Requisition No");
                if NonDriverAllocation.Get(NonDriverAllocation."Driver Name") then begin
                    Header := 'TRAVEL TRIP NOTIFICATION ' + Rec."Transport Requisition No" + ' ON ' + Format(TransportRequisition."Date of Trip") + ' TO ' + Format(TransportRequisition."Trip End Date");

                    if SMTPSetup.Get() then begin
                        SenderEmail := SMTPSetup."Email Address";
                        SenderName := SMTPSetup."Email Address";
                    end;
                    if NonDriverAllocation."Email Address" <> '' then begin
                        //SMTPMail.CreateMessage(SenderName, SenderEmail, NonDriverAllocation."Email Address", Header, '', true);
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Dear ' + NonDriverAllocation."Driver Name" + ',');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Please note that you have been assigned as the driver to the above mentioned trip.');// for the month of January 2014');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Trip requested by : ' + TransportRequisition."Employee Name");
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Trip From: ' + TransportRequisition.Commencement + ' To ' + TransportRequisition.Destination + ' on ' + Format("Date of Trip") + ' return date will be on ' + Format("Trip End Date"));
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Vehicle Reg Number: ' + NonDriverAllocation."Vehicle Registration No" + ' ' + NonDriverAllocation."Vehicle Description");
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
                        Message('Mail sent to %1', NonDriverAllocation."Email Address");
                    end;
                    //End email
                end;
                //notify requester
                // ERROR('here %1',Rec."Employee No");
                if Emp.Get(TransportRequisition."Employee No") then begin
                    Header := 'TRAVEL TRIP NOTIFICATION ' + VehicleDriverAllocation."Requisition Number" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

                    if SMTPSetup.Get() then begin
                        SenderEmail := SMTPSetup."Email Address";
                        SenderName := SMTPSetup."Email Address";
                    end;
                    if Emp."E-Mail" <> '' then begin
                        //SMTPMail.CreateMessage(SenderName, SenderEmail, Emp."E-Mail", Header, '', true);
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Dear ' + Emp."First Name" + ' ' + Emp."Last Name" + ',');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('Please note that you have been assigend driver(s) to the above mentioned trip as follows.');// for the month of January 2014');
                        //SMTPMail.AddBodyline('<br><br>');
                        //SMTPMail.AddBodyline('<h1>Trip Details</h1>');
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Driver Name : ' + VehicleDriverAllocation."Driver Name");
                        //SMTPMail.AddBodyline('<br>');
                        //SMTPMail.AddBodyline('Vehicle Reg Number: ' + VehicleDriverAllocation."Registration Number" + ' ' + VehicleDriverAllocation."Vehicle Description");
                        //SMTPMail.AddBodyline('<br>');
                        VehicleDrivers11.Reset;
                        //  VehicleDrivers11.SetRange(VehicleDrivers11.Driver, VehicleDriverAllocation."Driver Code");
                        if VehicleDrivers11.FindSet then begin
                            //SMTPMail.AddBodyline('Driver Phone Number : ' + VehicleDrivers11."Phone Number");
                            //SMTPMail.AddBodyline('<br>');
                        end;
                        //SMTPMail.AddBodyline('Trip From: ' + TransportRequisition.Commencement + ' To ' + TransportRequisition.Destination + ' on ' + Format("Date of Trip"));
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
                        //SMTPMail.Send();
                        Message('Mail sent to %1', Emp."E-Mail");
                    end;
                    //End email
                end;
            until VehicleDriverAllocation.Next = 0;
            Message('Email notifications has been sent');
        end;
    end;
}

#pragma implicitwith restore

