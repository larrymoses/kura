#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 57168 "Archived Imprest Memo-p"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = const(Released),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                Editable = false;
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field(Project; Project)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Promoted;
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Project Description"; "Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                }
                field(Subject; Subject)
                {
                    ApplicationArea = Basic;
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CalcFields(Objective);
                        Objective.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Objective);
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Objective.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin

                        CalcFields("Terms of Reference");
                        "Terms of Reference".CreateInstream(Instr);
                        TOR.Read(Instr);

                        if TORText <> Format(TOR) then begin
                            Clear("Terms of Reference");
                            Clear(TOR);
                            TOR.AddText(TORText);
                            "Terms of Reference".CreateOutstream(OutStr);
                            TOR.Write(OutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                }
                field("Refernce No"; "Refernce No")
                {
                    ApplicationArea = Basic;
                }
                field(Requestor; Requestor)
                {
                    ApplicationArea = Basic;
                }
                field("Requestor Name"; "Requestor Name")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 5 Code"; "Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Code:';
                    Visible = false;
                }
                field("Destination Name"; "Destination Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Imprest Naration"; "Imprest Naration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Narations';
                }
                field("Total Subsistence Allowance"; "Total Subsistence Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Fuel Costs"; "Total Fuel Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Maintenance Costs"; "Total Maintenance Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Total Casuals Cost"; "Total Casuals Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Total Other Costs"; "Total Other Costs")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Job; Job)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Name"; "Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Job  Task"; "Job  Task")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Job Task Name"; "Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Job Task Budget"; "Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Job Task Remaining Amount"; "Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 4 Code"; "Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                }
                field("Division Name"; "Division Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Project Budget"; "Project Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Funding Source"; "Funding Source")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Project Costs"; "Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PO Commitments"; "PO Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Store Requisition Commitments"; "Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Imprest Application Commitment"; "Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Total Budget Commitments"; "Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group(Reasons)
            {
                Caption = 'Reasons';
                field("Reason to Reopen"; "Reason to Reopen")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Travel Details")
            {
                field(From; From)
                {
                    ApplicationArea = Basic;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = Basic;
                }
                field("Time Out"; "Time Out")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Route"; "Journey Route")
                {
                    ApplicationArea = Basic;
                }
            }
            // part(Control1000000020;"Safari Team")
            // {
            //     Editable = not OpenApprovalEntriesExist;
            //     SubPageLink = "Imprest Memo No."=field("No."),
            //                   Type=const(Person);
            // }
            part("Fuel/Maintenance"; Fuel)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
                Visible = false;
            }
            part(Control1000000021; "Execution Plan")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                Visible = false;
            }
            part(Control1000000022; Casuals)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
            part(Control1000000023; "Other Costs")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control1000000017; Notes)
            {
            }
            systempart(Control1000000018; MyNotes)
            {
            }
            systempart(Control1000000019; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = false;

                trigger OnAction()
                begin
                    //Daudi
                    //check if the requester is part of the team
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."No.", Requestor);
                    if ProjectTeam.FindFirst = false then
                        Error(Text001);

                    // if ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(Rec) then
                    //   ApprovalsMgmt.OnSendImpMemoForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = false;

                trigger OnAction()
                begin
                    //  ApprovalsMgmt.OnCancelImpMemoApprovalRequest(Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //    PaymentPost.PostImprestMemo(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Ushindi changes
                    if Status <> Status::Released then
                        Error(Text002);
                    if Status = Status::Released then begin
                        SetRange("No.", "No.");
                        Report.Run(57001, true, true, Rec);
                        Reset;
                    end;
                end;
            }
            action("Create Imprest")
            {
                ApplicationArea = Basic;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;

                trigger OnAction()
                begin
                    //add pv from claims
                    //added on 27/04/2017
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
                    if Confirm(Text004, false, "No.") then begin
                        Memoheaders.Reset;
                        Memoheaders.SetRange(Memoheaders."No.", "No.");
                        if Memoheaders.Find('-') then begin
                            SafariMembers.Reset;
                            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                            SafariMembers.Validate("No.");
                            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                            SafariMembers.Validate("No.");
                            SafariMembers.SetFilter("Outstanding Amount", '<=%1', 0);
                            SafariMembers.SetRange("Imprest Created", false);
                            //SafariMembers.SETRANGE(SafariMembers."No.","No.");
                            if SafariMembers.Find('-') then begin
                                repeat
                                    //ERROR('1');
                                    //get the no. series
                                    CashMgt.Reset;
                                    if CashMgt.Find('-') then begin
                                        Noseries := CashMgt."Imprest Nos";
                                        Email2 := CashMgt."Imprest Email";
                                        //MESSAGE(Email2);
                                    end;

                                    LineNo := 1000;
                                    Imprestheaders.Init;
                                    Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
                                    Imprestheaders.Date := Today;
                                    Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
                                    Imprestheaders."Account No." := SafariMembers."No.";
                                    Imprestheaders.Validate("Account No.");
                                    Imprestheaders."Account Name" := SafariMembers.Name;
                                    //MESSAGE('%1-%2',Imprestheaders."Account Name",Imprestheaders."Account No." );
                                    Imprestheaders."Payment Type" := Imprestheaders."payment type"::Imprest;
                                    Imprestheaders.Payee := SafariMembers.Name;
                                    Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                                    Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                                    Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                                    Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                                    // Imprestheaders.Job:= Memoheaders.Job;
                                    Imprestheaders.Status := Imprestheaders.Status::Released;
                                    Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                                    Imprestheaders."Job Task No." := Memoheaders."Job  Task";
                                    Imprestheaders.Currency := SafariMembers."Currency Code";
                                    Imprestheaders."Created By" := UserId;
                                    //Imprestheaders."Reference No.":="No.";

                                    Email1 := '';
                                    EMp.Reset;
                                    EMp.SetRange("No.", Imprestheaders."Account No.");
                                    if EMp.FindSet then
                                        Email1 := EMp."Company E-Mail";
                                    //MESSAGE(Email1);

                                    Imprestheaders."Travel Date" := Memoheaders."Start Date";
                                    Imprestheaders."Payment Narration" := Memoheaders.Subject;
                                    Imprestheaders.Purpose := Memoheaders.Subject;
                                    Imprestheaders.Validate(Imprestheaders."Travel Date");
                                    Imprestheaders."Document Type" := Imprestheaders."document type"::Imprest;
                                    Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                                    Imprestheaders."On behalf of" := SafariMembers.Name;
                                    Imprestheaders.Status := Imprestheaders.Status::Open;//Changed by Fred after a discusion with Finance for involvement of finance in the approval
                                    Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                    Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
                                    Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code");

                                    // Imprestheaders."Shortcut Dimension 1 Code":=Memoheaders."Global Dimension 1 Code"; commented by Morris
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 1 Code");
                                    // Imprestheaders."Shortcut Dimension 2 Code":=Memoheaders."Global Dimension 2 Code"; commented by Morris
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code");
                                    Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
                                    Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                                    Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
                                    // IF Imprestheaders.INSERT(True) THEN BEGIN
                                    Imprestheaders.Insert(true);



                                    //Start of Imprest lines
                                    Imprestlines.Init;
                                    Imprestlines."Line No" := LineNo;
                                    Imprestlines.No := Imprestheaders."No.";
                                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                    SafariMembers.CalcFields("G/L Account");
                                    Imprestlines."Account No." := SafariMembers."G/L Account";
                                    Imprestlines.Validate(Imprestlines."Account No.");
                                    // Imprestlines.Purpose := SafariMembers."Work Type";
                                    Imprestlines.Purpose := Memoheaders.Subject;
                                    Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                    Imprestlines."No. of Days" := SafariMembers."Time Period";
                                    Imprestlines.Amount := SafariMembers.Entitlement;
                                    Imprestlines."Job No." := SafariMembers.Job;
                                    Imprestlines."Job Task No." := SafariMembers."Job  Task";
                                    Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                    Imprestlines.Insert;

                                    //Insert Other costs
                                    LineNo := LineNo + 10;
                                    FnInsertOtherCostsDetails();
                                    LineNo := LineNo + 10;
                                    FnInsertCasualSDetails();

                                    LineNo := LineNo + 10;
                                    if SafariMembers."Transport Costs" <> 0 then begin
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        SafariMembers.CalcFields("G/L Account");
                                        Imprestlines."Account No." := SafariMembers."G/L Account";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := 'Transport Allowance';
                                        Imprestlines.Purpose := Imprestheaders.Purpose;
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := SafariMembers."Transport Costs";
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Job No." := SafariMembers.Job;
                                        Imprestlines.Project := SafariMembers.Job;
                                        Imprestlines."Job Task No." := SafariMembers."Job  Task";
                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;
                                    end;
                                    /*
                                    IF SafariMembers."Project Lead" = TRUE THEN
                                    BEGIN
                                      ProjectTeam.RESET;
                                      ProjectTeam.SETRANGE(ProjectTeam."Imprest Memo No.","No.");
                                      ProjectTeam.SETRANGE(ProjectTeam.Type,ProjectTeam.Type::Machine);
                                      IF ProjectTeam.FIND('-') THEN BEGIN
                                         REPEAT
                                          Imprestlines.INIT;
                                          Imprestlines."Line No":=LineNo;
                                          Imprestlines.No := Imprestheaders."No.";
                                          Imprestlines."Account Type":=Imprestlines."Account Type"::"G/L Account";
                                          SafariMembers.CALCFIELDS("G/L Account");
                                          Imprestlines."Account No.":= ProjectTeam."G/L Account";
                                          Imprestlines.VALIDATE(Imprestlines."Account No.");
                                          Imprestlines.Purpose := ProjectTeam."Work Type";
                                          Imprestlines."Daily Rate":=SafariMembers."Direct Unit Cost";
                                          Imprestlines."No. of Days":=SafariMembers."Time Period";
                                          Imprestlines.Amount:=ProjectTeam."Expected Maintenance Cost";
                                          Imprestlines."Global Dimension 1 Code":=Memoheaders."Shortcut Dimension 1 Code";
                                          Imprestlines.VALIDATE(Imprestlines."Global Dimension 1 Code");
                                          Imprestlines."Global Dimension 2 Code":=Memoheaders."Shortcut Dimension 2 Code";
                                          Imprestlines.VALIDATE(Imprestlines."Global Dimension 2 Code");
                                          Imprestlines."Currency Code":=SafariMembers."Currency Code";
                                          Imprestlines.INSERT;
                                          LineNo := LineNo+10;
                                         UNTIL ProjectTeam.NEXT=0;
                                       END;


                                    Othercost.RESET;
                                    Othercost.SETRANGE(Othercost."Imprest Memo No.","No.");
                                    IF Othercost.FIND('-') THEN
                                    BEGIN
                                      REPEAT
                                        Imprestlines.INIT;
                                        Imprestlines."Line No":=LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type":=Imprestlines."Account Type"::"G/L Account";
                                        Othercost.CALCFIELDS("No.");
                                        Imprestlines."Account No.":= Othercost."No.";
                                        Imprestlines.VALIDATE(Imprestlines."Account No.");
                                        Imprestlines.Purpose := Othercost."Required For";
                                        Imprestlines."Daily Rate":=SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days":=SafariMembers."Time Period";
                                        Imprestlines.Amount:=Othercost."Line Amount";
                                        Imprestlines."Global Dimension 1 Code":=Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestlines.VALIDATE(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code":=Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestlines.VALIDATE(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Currency Code":=SafariMembers."Currency Code";
                                        Imprestlines.INSERT;
                                        LineNo := LineNo+10;
                                      UNTIL Othercost.NEXT=0;
                                    END;

                                    Casual.RESET;
                                    Casual.SETRANGE(Casual."Imprest Memo No.","No.");
                                    IF Casual.FIND('-') THEN
                                    BEGIN
                                      REPEAT
                                        Imprestlines.INIT;
                                        Imprestlines."Line No":=LineNo;
                                        Imprestlines.No := Imprestheaders."No.";

                                        Imprestlines."Account Type":=Imprestlines."Account Type"::"G/L Account";
                                        Imprestlines."Account No.":= Casual."G/L Account";
                                        Imprestlines.VALIDATE(Imprestlines."Account No.");
                                        Imprestlines.Purpose := Casual.Activity;
                                        Imprestlines."Daily Rate":=Casual.Rate;
                                        Imprestlines."No. of Days":=Casual."No. of Days";
                                        Imprestlines.Amount:=Casual.Amount;
                                        Imprestlines."Global Dimension 1 Code":=Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestlines.VALIDATE(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code":=Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestlines.VALIDATE(Imprestlines."Global Dimension 2 Code");
                                        Imprestlines."Currency Code":=SafariMembers."Currency Code";
                                        Imprestlines.INSERT;
                                        LineNo := LineNo+10;
                                      UNTIL Casual.NEXT=0;
                                    END;
                                    END;
                                    */
                                    Imprestheaders.Validate(Imprestheaders.Status);

                                    //send email to participants
                                    CashMgt.Get;
                                    if CashMgt."Send Email Notification" = true then begin
                                        // if Email1 <> '' then begin
                                        //     Body := 'Your imprest application no. ' + Imprestheaders."No." + ' has been created from memo no. ' + "No." +
                                        //     ' Kindly logon to Microsoft Dynamics 365 Business Central to confirm and send it for approval.';

                                        //     SMTP.CreateMessage('KERRA', Email2,
                                        //     Email1, 'Imprest ' + 'No: ' + Imprestheaders."No.",
                                        //     'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
                                        //     'Your imprest application no. ' + Imprestheaders."No." + ' with the subject, ' + Memoheaders.Subject + ' of amount ' + Format(SafariMembers.Entitlement) + ''' has been created from memo no. ' + "No." +
                                        //     ' and has been fowarded to finance for processing.<BR><BR>', true);

                                        //     SMTP.AddBodyline('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
                                        //     SMTP.Send();

                                        //end;
                                    end;
                                    Message('Imprest requisition %1 created for %2 mail sent to %3', Imprestheaders."No.", Imprestheaders."Account Name", Email1);
                                    SafariMembers."Imprest Created" := true;
                                    SafariMembers.Modify;
                                until SafariMembers.Next = 0;
                            end;

                            SafariMembers.Reset;
                            SafariMembers.SetRange(SafariMembers."Imprest Memo No.", "No.");
                            SafariMembers.SetRange(SafariMembers."Imprest Created", true);
                            TotalChecked := SafariMembers.Count;

                            SafariMembers.Reset;
                            SafariMembers.SetRange(SafariMembers."Imprest Memo No.", "No.");
                            TotalImp := SafariMembers.Count;
                            //MESSAGE('%1-%2',TotalImp,TotalChecked);
                            if TotalImp = TotalChecked then begin
                                Memoheaders."Imprest Created" := true;
                                Memoheaders."Date converted" := Today;
                                Memoheaders."Time converted" := Time;
                                Memoheaders."Converted By" := UserId;
                                Memoheaders.Posted := true;
                                Memoheaders.Modify;
                            end;
                        end;
                        Message('Imprest (s) for the imprest memo No. %1 has been processed', "No.");
                    end else
                        Error('The payment for memo No. %1 has already been processed.', Memoheaders."No.");
                    //END;
                    //CurrPage.CLOSE;

                end;
            }
            action("Create Imprest 2")
            {
                ApplicationArea = Basic;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    //add pv from claims
                    //added on 27/04/2017
                    CalcFields("Total Subsistence Allowance", "Total Fuel Costs", "Total Maintenance Costs", "Total Casuals Cost", "Total Other Costs");
                    TotalImprestAmount := "Total Subsistence Allowance" + "Total Fuel Costs" + "Total Maintenance Costs" + "Total Casuals Cost" + "Total Other Costs";
                    // CashMgmtSetup.GET;
                    // IF (CashMgmtSetup."Check Budget Vailability"=TRUE) THEN BEGIN
                    //IF (TotalImprestAmount>"Job Task Remaining Amount") THEN
                    //ERROR('Applied imprest Memo of Amount (%1) is more than Available Amount (%2)',TotalImprestAmount,"Job Task Remaining Amount");
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
                    if Confirm(Text004, false, "No.") then begin
                        Memoheaders.Reset;
                        Memoheaders.SetRange(Memoheaders."No.", "No.");
                        if Memoheaders.Find('-') then begin
                            SafariMembers.Reset;
                            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                            SafariMembers.SetRange(SafariMembers."Imprest Created", false);
                            if SafariMembers.FindSet(true) then begin
                                repeat
                                    EMp.Reset;
                                    EMp.SetRange(EMp."No.", SafariMembers."No.");
                                    if EMp.FindFirst then
                                        Email1 := EMp."Company E-Mail";
                                    //MESSAGE(Email1);
                                    if EMp.Get(SafariMembers."No.") then begin
                                        EMp.CalcFields(Balance);
                                        if EMp.Balance <> 0 then
                                            //ERROR('This employee %1 has an outstanding balance of %2',EMp."No.",ABS(EMp.Balance))
                                            //ELSE
                                            if EMp.Balance <= 0 then begin

                                                //get the no. series
                                                FnGetNoSeries();
                                                Imprestheaders.Reset;
                                                Imprestheaders.SetRange("Account No.", SafariMembers."No.");
                                                Imprestheaders.SetRange("Imprest Memo No", Memoheaders."No.");
                                                if not Imprestheaders.FindSet then begin
                                                    LineNo := 1000;
                                                    Imprestheaders.Init;
                                                    //Imprestheaders."No.":=NoSeriesMgt.GetNextNo(Noseries,Imprestheaders.Date,TRUE);
                                                    Imprestheaders.Date := Today;
                                                    Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
                                                    Imprestheaders."Account No." := SafariMembers."No.";
                                                    Imprestheaders."Account Name" := SafariMembers.Name;
                                                    Imprestheaders."Payment Type" := Imprestheaders."payment type"::Imprest;
                                                    Imprestheaders.Payee := SafariMembers.Name;
                                                    Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                                                    Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                                                    Imprestheaders.Purpose := Memoheaders.Subject;
                                                    Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                                                    Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                                                    // Imprestheaders.Job:= Memoheaders.Job;
                                                    Imprestheaders.Status := Imprestheaders.Status::Released;
                                                    Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                                                    Imprestheaders."Job Task No." := Memoheaders."Job  Task";
                                                    Imprestheaders.Currency := SafariMembers."Currency Code";
                                                    Imprestheaders."Created By" := UserId;
                                                    if Usersetup.Get(UserId) then
                                                        Imprestheaders."Responsibility Center" := Usersetup."Purchase Resp. Ctr. Filter";
                                                    //Imprestheaders."Reference No.":="No.";
                                                    Imprestheaders."Travel Date" := Memoheaders."Start Date";
                                                    Imprestheaders."Payment Narration" := Memoheaders.Subject;
                                                    Imprestheaders.Validate(Imprestheaders."Travel Date");
                                                    Imprestheaders."Document Type" := Imprestheaders."document type"::Imprest;
                                                    Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                                                    Imprestheaders."On behalf of" := SafariMembers.Name;
                                                    SafariMembers.CalcFields("Job Group");
                                                    Imprestheaders."Job Group" := SafariMembers."Job Group";
                                                    Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                                    Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
                                                    Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                                    //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code");
                                                    Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                                                    Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                                                    Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                                    Imprestheaders.Status := Imprestheaders.Status::Released;
                                                    Imprestheaders.Validate(Status);
                                                    Email1 := '';

                                                    Imprestheaders.Insert;
                                                end;
                                                //Start of Imprest lines
                                                SafariMembers.Reset;
                                                SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                                                SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                                                SafariMembers.SetRange(SafariMembers."No.", SafariMembers."No.");
                                                if SafariMembers.FindSet then
                                                    repeat
                                                        Imprestlines.Init;
                                                        Imprestlines."Line No" := LineNo;
                                                        Imprestlines.No := Imprestheaders."No.";
                                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                        SafariMembers.CalcFields("G/L Account");
                                                        Imprestlines."Account No." := SafariMembers."G/L Account";
                                                        Imprestlines.Validate(Imprestlines."Account No.");
                                                        Imprestlines.Purpose := SafariMembers."Work Type";
                                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                                        Imprestlines.Amount := SafariMembers.Entitlement;
                                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                                        Imprestlines.Insert;
                                                        LineNo := LineNo + 10;
                                                        if SafariMembers."Transport Costs" <> 0 then begin
                                                            Imprestlines.Init;
                                                            Imprestlines."Line No" := LineNo;
                                                            Imprestlines.No := Imprestheaders."No.";
                                                            Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                            SafariMembers.CalcFields("G/L Account");
                                                            Imprestlines."Account No." := SafariMembers."G/L Account";
                                                            Imprestlines.Validate(Imprestlines."Account No.");
                                                            Imprestlines.Purpose := 'Transport Allowance';
                                                            Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                                            Imprestlines."No. of Days" := SafariMembers."Time Period";
                                                            Imprestlines.Amount := SafariMembers."Transport Costs";
                                                            Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                                            Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                                            Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                            Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                                            Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                            Imprestlines.Insert;
                                                            LineNo := LineNo + 10;
                                                        end;
                                                    until SafariMembers.Next = 0;



                                                //IF SafariMembers."Project Lead" = TRUE THEN
                                                //BEGIN
                                                FnInsertOtherCostsDetails();
                                                FnInsertCasualSDetails();
                                                //END;


                                                FnInsertProjectLeadDetails();
                                                Imprestheaders.Validate(Imprestheaders.Status);

                                                //send email to participants
                                                FnSendEmailAlertToParticipants();
                                                SafariMembers."Imprest Created" := true;
                                                SafariMembers.Modify;
                                            end;
                                    end;
                                until SafariMembers.Next = 0;
                            end;
                            SafariMembers.Reset;
                            SafariMembers.SetRange("Imprest Memo No.", "No.");
                            SafariMembers.SetRange("Imprest Created", false);
                            if not SafariMembers.FindSet then
                                repeat
                                    FnModifyMemoHeader();
                                until SafariMembers.Next = 0;

                        end;



                        Message('Imprest (s) %2 for the imprest memo No. %1 has been processed, Kindly send for approval', "No.", Imprestheaders."No.");

                    end else
                        Error('The payment for claim No. %1 has already been processed.', Memoheaders."No.");
                    //END;

                    //CurrPage.CLOSE;
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

                    // ApprovalEntries.Setfilters(DATABASE::"Imprest Memo",6,"No.");
                    // ApprovalEntries.RUN;

                    ApprovalEntries.Setfilters(Database::"Imprest Memo", 5, "No.");
                    ApprovalEntries.Run;
                end;
            }
        }
        area(navigation)
        {
            action("Re&lease")
            {
                ApplicationArea = Basic;
                Caption = 'Re&lease';
                Image = ReleaseDoc;
                ShortCutKey = 'Ctrl+F9';

                trigger OnAction()
                var
                //  ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Releasememo.PerformManualRelease(Rec);
                end;
            }
            action("Re&open")
            {
                ApplicationArea = Basic;
                Caption = 'Re&open';
                Image = ReOpen;

                trigger OnAction()
                var
                // ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    //added on 20/04/2016
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                    TestField("Reason to Reopen");
                    ReopenMemo.PerformManualReopen(Rec);

                    //added on 20/04/2016
                    //increase frequency of reopening to be only once
                    if "Frequency of Reopen" > 0 then begin
                        Error('The memo already reopened you can only reopen once');
                    end else begin
                        "Frequency of Reopen" := 1;
                        "Reopened by" := UserId;
                        "Reopened Date" := CurrentDatetime;
                        Modify;
                    end;
                end;
            }
            action("Update Imprest Memo")
            {
                ApplicationArea = Basic;
                Image = UpdateDescription;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                // RunObject = Report "Update Imprest Memo";
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Show := ((Status = Status::Released));
        SetControlAppearance;
        CalcFields("Terms of Reference", Objective);
        "Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Imprest Memo";
    end;

    trigger OnOpenPage()
    begin
        Show := ((Status = Status::Released));
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        // PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        Text002: label 'The Imprest Memo must be fully approved before printing';
        ReopenMemo: Codeunit "Imprest Memo";
        memo: Record "Imprest Memo";
        Releasememo: Codeunit "Imprest Memo";
        Usersetup: Record "User Setup";
        Imprestlines: Record "Imprest Lines";
        Imprestheaders: Record payments;
        Memolines: Record "PV Lines";
        Memoheaders: Record "Imprest Memo";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        Text004: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
        SafariMembers: Record "Project Members";
        Othercost: Record "Other Costs";
        LineNo: Integer;
        Text005: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
        SMTP: Codeunit Mail;
        Body: Text[1024];
        Email1: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        Text006: label 'your imprest No %1 of Amount %2 has been created,and is being processed';
        ImprestMessage: Text[80];
        TransportReq: Record "Transport Requisition";
        TransSetup: Record "Fleet Management Setup";
        TravelStaff: Record "Travel Requisition Staff";
        TravelNo: Code[50];
        EMp: Record Employee;
        Casual: Record Casuals;
        WorkType: Record "Work Type";
        TotalImprestAmount: Decimal;
        TotalChecked: Integer;
        TotalImp: Integer;

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;


    procedure FnSendimprestEmail(EmpNo: Code[50]; ImprestAmount: Decimal)
    var
        SMTPMail: Codeunit Mail;
        SMTPSetup: Record "Email Account";
        FileName: Text[100];
        Attachment: Text[250];
        CompanyInfo: Record "Company Information";
        Email: Text[50];
        EmpRec: Record Employee;
    begin
        SMTPSetup.Get();

        EmpRec.Reset;
        EmpRec.SetRange(EmpRec."No.", EmpNo);
        if EmpRec.Find('-') then begin

            if EmpRec."E-Mail" <> '' then begin
                // ImprestMessage:=Text006;
                // Email:=EmpRec."Company E-Mail";

                // //SMTPMail.CreateMessage(SMTPSetup."Email Sender Name",SMTPSetup."Email Sender Address",Email,'Imprest Application','',true);
                // //SMTPMail.AddBodyline(StrSubstNo(ImprestMessage,"No.",ImprestAmount,UserId));
                // //SMTPMail.AddBodyline(SMTPSetup."Email Sender Name");
                // //SMTPMail.AddBodyline('<br><br>');
                // SMTPMail.AddAttachment(FileName,Attachment);
                // //SMTPMail.Send;
            end;
        end;
    end;

    local procedure FnGetNoSeries()
    begin
        CashMgt.Reset;
        if CashMgt.Find('-') then begin
            Noseries := CashMgt."Imprest Nos";
            Email2 := CashMgt."Imprest Email";
            //MESSAGE(Email2);
        end;
    end;

    local procedure FnInsertProjectLeadDetails()
    begin
        ProjectTeam.Reset;
        ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", "No.");
        ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
        if ProjectTeam.Find('-') then begin
            repeat
                Imprestlines.Init;
                Imprestlines."Line No" := LineNo;
                Imprestlines.No := Imprestheaders."No.";
                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                SafariMembers.CalcFields("G/L Account");
                Imprestlines."Account No." := ProjectTeam."G/L Account";
                Imprestlines.Validate(Imprestlines."Account No.");
                Imprestlines.Purpose := ProjectTeam."Work Type";
                Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                Imprestlines."No. of Days" := SafariMembers."Time Period";
                Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                Imprestlines.Insert;
                LineNo := LineNo + 10;
            until ProjectTeam.Next = 0;
        end;
    end;

    local procedure FnInsertOtherCostsDetails()
    begin
        Othercost.Reset;
        Othercost.SetRange(Othercost."Imprest Memo No.", "No.");
        if Othercost.Find('-') then begin
            repeat
                Imprestlines.Init;
                Imprestlines."Line No" := LineNo;
                Imprestlines.No := Imprestheaders."No.";
                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                Othercost.CalcFields("No.");
                Imprestlines."Account No." := Othercost."No.";
                Imprestlines.Validate(Imprestlines."Account No.");
                Imprestlines.Purpose := Othercost."Required For";
                Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                Imprestlines."No. of Days" := SafariMembers."Time Period";
                Imprestlines.Amount := Othercost."Line Amount";
                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                Imprestlines."Job No." := SafariMembers.Job;
                Imprestlines."Job Task No." := SafariMembers."Job  Task";
                if Othercost."Employee No To Surrender" = SafariMembers."No." then
                    Imprestlines.Insert;
                LineNo := LineNo + 10;
            until Othercost.Next = 0;
        end;
    end;

    local procedure FnInsertCasualSDetails()
    begin
        Casual.Reset;
        Casual.SetRange(Casual."Imprest Memo No.", "No.");
        if Casual.Find('-') then begin
            repeat
                Imprestlines.Init;
                Imprestlines."Line No" := LineNo;
                Imprestlines.No := Imprestheaders."No.";

                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                Imprestlines."Account No." := Casual."G/L Account";
                Imprestlines.Validate(Imprestlines."Account No.");
                Imprestlines.Purpose := Casual.Activity;
                Imprestlines."Daily Rate" := Casual.Rate;
                Imprestlines."No. of Days" := Casual."No. of Days";
                Imprestlines.Amount := Casual.Amount;
                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                Imprestlines.Insert;
                LineNo := LineNo + 10;
            until Casual.Next = 0;
        end;
    end;

    local procedure FnSendEmailAlertToParticipants()
    begin
        CashMgt.Get;
        if CashMgt."Send Email Notification" = true then begin
            // if Email1 <> '' then begin
            //     Body := 'Your imprest application no. ' + Imprestheaders."No." + ' has been created from memo no. ' + "No." +
            //     'Kindly login to Microsoft Dynamics 365 Business Central to confirm and send it for approval.';
            //     SMTP.CreateMessage('KERRA', CashMgt."Imprest Email",
            //     Email1, 'Imprest ' + 'No: ' + Imprestheaders."No.",
            //    'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
            //    'Your imprest application no. ' + Imprestheaders."No." + 'of amount ' + Format(SafariMembers.Entitlement) + ''' has been created from memo no. ' + "No." +
            //    ' and has been fowarded to finance for processing.<BR><BR>', true);
            //     SMTP.AddBodyline('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
            //     SMTP.Send();
            // end;
        end;
    end;

    local procedure FnModifyMemoHeader()
    begin
        Memoheaders."Imprest Created" := true;
        Memoheaders."Date converted" := Today;
        Memoheaders."Time converted" := Time;
        Memoheaders."Converted By" := UserId;
        Memoheaders.Posted := true;
        Memoheaders.Modify;
    end;

    local procedure FnCreateWarrantyForOtherCosts()
    begin
        Memoheaders.Reset;
        Memoheaders.SetRange(Memoheaders."No.", "No.");
        if Memoheaders.Find('-') then begin
            Othercost.Reset;
            Othercost.SetRange("Imprest Memo No.", Memoheaders."No.");
            if Othercost.FindSet then begin
            end;

        end;
    end;
}

