#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80418 "Regional Staff Scorecard"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type" = const("Individual Scorecard"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                    Caption = 'Contract No';
                    Editable = false;
                }
                field("Responsible Employee No."; "Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee No';
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Regional PC ID"; "Regional PC ID")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; "Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Year"; "Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Goal Template ID"; "Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Change Status"; "Change Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Grade; Grade)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Name"; "Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?"; "Blocked?")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; "Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Assigned Weight(%)"; "Total Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Primary Inititives Weight(%)';
                    Editable = false;
                }
                field("Secondary Assigned Weight(%)"; "Secondary Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Secondary Inititives Weight(%)';
                    Editable = false;
                }
                field("JD Assigned Weight(%)"; "JD Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'JD Inititives Weight(%)';
                    Editable = false;
                }
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'Board PC Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Board);
                Visible = false;
            }
            part(Control60; "Staff Workplan Initiatives")
            {
                Caption = 'Core Initiatives';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = filter(Activity | Board);
            }
            part("Added Activities"; "Secondary Workplan Initiatives")
            {
                Caption = 'Additional Initiatives';
                SubPageLink = "Workplan No." = field(No),
                              "Strategy Plan ID" = field("Strategy Plan ID"),
                              "Year Reporting Code" = field("Annual Reporting Code");
            }
            part(Control25; "PC Job Description")
            {
                Caption = 'Job Description';
                SubPageLink = "Workplan No." = field(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Performance)
            {
                Caption = 'Performance';
                Image = Vendor;
                group("Performance Review")
                {
                    Caption = 'Performance Review';
                    Image = Vendor;
                    action("Performance Appraisal")
                    {
                        ApplicationArea = Basic;
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Standard Perfomance Appraisal";
                        RunPageLink = "Personal Scorecard ID" = field(No),
                                      "Document Type" = const("Performance Appraisal");
                    }
                    action("Performance Appeal")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Performance Appeal';
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Perfomance Appeals";
                        RunPageLink = "Personal Scorecard ID" = field(No),
                                      "Document Type" = const("Performance Appeal");
                    }
                    action(PIPs)
                    {
                        ApplicationArea = Basic;
                        Caption = 'PIPs';
                        Image = AddWatch;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page "Performance Improvement Plans";
                        RunPageLink = "Personal Scorecard ID" = field(No);
                    }
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(7),
                                  "No." = field("No. Series");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        ShowDocDim;
                        CurrPage.SaveRecord;
                    end;
                }
                action("Change Log")
                {
                    ApplicationArea = Basic;
                    Image = Log;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Performance Diary Logs";
                    RunPageLink = "Personal Scorecard ID" = field(No);
                }
            }
        }
        area(creation)
        {
            action("Suggest Objective Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Cascade PC Activities';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Activities', true) then
                        Error('Activities not Suggested');

                    TestField("Strategy Plan ID");
                    TestField("Regional PC ID");
                    TestField("Annual Reporting Code");
                    PCHeader.Reset;
                    PCHeader.SetRange(No, "Regional PC ID");
                    if PCHeader.FindSet then begin
                        SPMGeneralSetup.Get;

                        if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                            PcLinesN.Reset;
                            PcLinesN.SetRange("Strategy Plan ID", "Strategy Plan ID");
                            PcLinesN.SetRange("Workplan No.", "Regional PC ID");
                            //PcLinesN.SETRANGE("Primary Department","Responsibility Center");
                            if PcLinesN.Find('-') then begin
                                repeat
                                    //ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                                    PcLines.Init;
                                    PcLines."Workplan No." := No;
                                    PcLines."Strategy Plan ID" := PcLinesN."Strategy Plan ID";
                                    PcLines."Initiative Type" := PcLinesN."Initiative Type";
                                    PcLines."Initiative No." := PcLinesN."Initiative No.";
                                    PcLines."Goal Template ID" := "Goal Template ID";
                                    PcLines."Objective/Initiative" := PcLinesN."Objective/Initiative";
                                    PcLines."Year Reporting Code" := "Annual Reporting Code";
                                    PcLines."Primary Directorate" := PcLinesN."Primary Directorate";
                                    PcLines."Primary Directorate Name" := PcLinesN."Primary Directorate Name";
                                    PcLines."Primary Department" := PcLinesN."Primary Department";
                                    PcLines."Primary Department Name" := PcLinesN."Primary Department Name";
                                    PcLines."Outcome Perfomance Indicator" := PcLinesN."Outcome Perfomance Indicator";
                                    PcLines."Key Performance Indicator" := PcLinesN."Key Performance Indicator";
                                    PcLines."Unit of Measure" := PcLinesN."Unit of Measure";
                                    PcLines."Start Date" := "Start Date";
                                    PcLines."Due Date" := "End Date";
                                    PcLines."Imported Annual Target Qty" := PcLinesN."Imported Annual Target Qty";
                                    PcLines."Assigned Weight (%)" := PcLinesN."Assigned Weight (%)";
                                    PcLines."Q1 Target Qty" := PcLinesN."Q1 Target Qty";
                                    PcLines."Q2 Target Qty" := PcLinesN."Q2 Target Qty";
                                    PcLines."Q3 Target Qty" := PcLinesN."Q3 Target Qty";
                                    PcLines."Q4 Target Qty" := PcLinesN."Q4 Target Qty";
                                    PcLines.Insert(true);


                                    //Sub Activities
                                    OriginalSubActivities.Reset;
                                    OriginalSubActivities.SetRange("Strategy Plan ID", "Strategy Plan ID");
                                    OriginalSubActivities.SetRange("Workplan No.", "Regional PC ID");
                                    OriginalSubActivities.SetRange("Initiative No.", PcLines."Initiative No.");
                                    if OriginalSubActivities.FindFirst then begin
                                        repeat
                                            PCSubActivities.Init;
                                            PCSubActivities."Strategy Plan ID" := OriginalSubActivities."Strategy Plan ID";
                                            PCSubActivities."Workplan No." := No;
                                            PCSubActivities."Initiative No." := OriginalSubActivities."Initiative No.";
                                            PCSubActivities."Sub Initiative No." := OriginalSubActivities."Sub Initiative No.";
                                            PCSubActivities."Entry Number" := OriginalSubActivities."Entry Number";
                                            PCSubActivities.TransferFields(OriginalSubActivities, false);
                                            PCSubActivities.Insert(true);
                                        until OriginalSubActivities.Next = 0;
                                    end;
                                //End Sub Activities
                                until PcLinesN.Next = 0;
                            end;
                        end;

                        //Loading JD
                        if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                            JobRes.Reset;
                            if "Acting Job ID" <> '' then begin
                                JobRes.SetRange("Position ID", PCHeader."Acting Job ID");
                            end else begin
                                JobRes.SetRange("Position ID", PCHeader.Position);
                            end;
                            if JobRes.FindFirst then begin
                                repeat
                                    PCJobDescription.Init;
                                    PCJobDescription."Workplan No." := No;
                                    PCJobDescription."Line Number" := Format(JobRes."Line No");
                                    PCJobDescription.Description := JobRes.Description;
                                    PCJobDescription."Primary Department" := "Responsibility Center";
                                    PCJobDescription.Validate("Primary Department");
                                    PCJobDescription."Start Date" := "Start Date";
                                    PCJobDescription."Due Date" := "End Date";
                                    PCJobDescription.Insert;

                                until JobRes.Next = 0;
                            end;
                        end;
                    end; //Added by Kisavi to load JD from the new HR Module


                    /*IF (SPMGeneralSetup."Allow Loading of JD"=TRUE) THEN BEGIN
                      JobResponsiblities.RESET;
                        IF "Acting Job ID"<>'' THEN BEGIN
                        JobResponsiblities.SETRANGE("Application No","Acting Job ID");
                      END ELSE BEGIN
                      JobResponsiblities.SETRANGE("Application No",Position);
                        END;
                      IF JobResponsiblities.FINDFIRST THEN BEGIN
                        REPEAT
                          PCJobDescription.INIT;
                          PCJobDescription."Workplan No.":=No;
                          PCJobDescription."Line Number":=FORMAT(JobResponsiblities.Surname);
                          PCJobDescription.Description:=JobResponsiblities."First Name";
                          PCJobDescription."Primary Department":="Responsibility Center";
                          PCJobDescription.VALIDATE("Primary Department");
                          PCJobDescription.INSERT;
                    
                        UNTIL JobResponsiblities.NEXT=0;
                      END;
                    END;
                    END;*/
                    //Board Sub-activities
                    BoardSubActivities.Reset;
                    BoardSubActivities.SetRange("Workplan No.", "Annual Workplan");
                    if BoardSubActivities.FindSet then begin
                        repeat
                            PCSubActivities.Init;
                            PCSubActivities.TransferFields(BoardSubActivities);
                            PCSubActivities."Workplan No." := No;
                            PCSubActivities."Initiative No." := BoardSubActivities."Activity Id";
                            PCSubActivities.Insert(true);
                        until BoardSubActivities.Next = 0;
                    end;

                    Message('PC Populated Successfully');

                end;
            }
            action("Populate Goals Hub")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    GoalTemplateLine.Reset;
                    GoalTemplateLine.SetRange("Goal Template ID", "Goal Template ID");
                    if GoalTemplateLine.Find('-') then begin
                        repeat
                            workplangoalhub.Init;
                            workplangoalhub."Goal ID" := GoalTemplateLine."Goal ID";
                            workplangoalhub."Performance Contract ID" := No;
                            workplangoalhub."Goal Description" := GoalTemplateLine.Description;
                            workplangoalhub."Aligned-To PC ID" := GoalTemplateLine."Corporate Strategic Plan ID";
                            workplangoalhub."Aligned-To PC Goal ID" := GoalTemplateLine."Strategic Objective ID";
                            workplangoalhub.Insert(true);
                        until GoalTemplateLine.Next = 0;
                    end;
                    Message('WorkPlan Hub Populated successfully');
                end;
            }
            action("Aligned Business Goals")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Aligned Business Goals";
                RunPageLink = "Performance Contract ID" = field(No);
                Visible = false;
            }
            action("Risk Analysis")
            {
                ApplicationArea = Basic;
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Workplan Risk";
                RunPageLink = "Document No" = field(No);
            }
            action("Capability Matrix")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Workplan Capability Matrixs";
                RunPageLink = "Document No" = field(No);
            }
            separator(Action34)
            {
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approval;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    //ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                    //   SMTPSetup: Codeunit Mail;
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[250];
                    Subject: Text[80];
                    FileName: Text;
                    FileMangement: Codeunit "File Management";
                    ProgressWindow: Dialog;
                    // SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    //cu400: Codeunit Mail;
                    DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    FundingOpp: Record "Project Contract Header";
                    GrantsSetup: Record "Grants Setup";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                begin
                    TestField("Approval Status", "approval status"::Open);
                    TotalWeight := 0;
                    CalcFields("Total Assigned Weight(%)", "Secondary Assigned Weight(%)", "JD Assigned Weight(%)");
                    TotalWeight := "Total Assigned Weight(%)" + "Secondary Assigned Weight(%)" + "JD Assigned Weight(%)";
                    if not (TotalWeight = 100) then
                        Error('Total Assigned Weight for all Core Mandate Primary Activities should be (100%),Currently is %1', TotalWeight);

                    PcLines.Reset;
                    PcLines.SetRange("Workplan No.", No);
                    if PcLines.FindFirst then begin
                        repeat
                        // PcLines.TESTFIELD("Primary Directorate");
                        // PcLines.TESTFIELD("Primary Department");
                        until PcLines.Next = 0;
                    end;

                    "Approval Status" := "approval status"::Released;
                    Modify;
                    Message('Document has been approved Automatically');
                    /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                     IF ApprovalsMgmt.CheckPerformanceContractApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.IsTSalaryApprovalsWorkflowEnabled(Rec);
                    
                      CompanyInfo.GET();
                        SMTPMailSet.GET;
                        SenderAddress := SMTPMailSet."Email Sender Address";
                        SenderName :=CompanyInfo.Name+' M&E';
                        Subject := STRSUBSTNO('Individual PC');
                           PerfomanceContractHeader.RESET;
                           PerfomanceContractHeader.SETRANGE(No,No);
                           IF PerfomanceContractHeader.FINDFIRST THEN BEGIN
                              FileDirectory :=  'C:\DOCS\';
                              FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                              //Window.OPEN('processing');
                              Window.OPEN('PROCESSING Individual PC ############1##');
                                Window.UPDATE(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);
                    
                              WindowisOpen := TRUE;
                              IF FileName = '' THEN
                                ERROR('Please specify what the file should be saved as');
                    
                    
                               REPORT.SAVEASPDF(80007,FileDirectory+FileName,PerfomanceContractHeader);
                    
                    
                    
                    
                              IF EXISTS(FileDirectory+FileName) THEN BEGIN
                                Counter:=Counter+1;
                    
                              SMTPMailSet.GET;
                              SenderAddress := SMTPMailSet."Email Sender Address";
                    
                    
                    
                             Employee.RESET;
                             Employee.SETRANGE("No.","Responsible Employee No.");
                             IF Employee.FIND('-') THEN BEGIN
                               Recipients :=Employee."Company E-Mail";
                             END;
                             IF Recipients<>'' THEN BEGIN
                               Body:='Dear Team <BR>Please find attached the Individual PC <Br>'+Description;
                                cu400.CreateMessage(CompanyInfo.Name,SenderAddress,Recipients,Subject,Body,TRUE);
                    
                                cu400.AddBodyline(
                                '<BR><BR>Kind Regards,');
                                cu400.AddBodyline('<BR>'+CompInfo.Name);
                                cu400.AddAttachment(FileDirectory+FileName,FileName);
                                cu400.Send;
                    
                                SLEEP(1000);
                                Window.CLOSE;
                            END;
                            END;
                          END;
                    
                    
                      MESSAGE('Document has been approved Automatically');
                      */

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    TestField("Approval Status", "approval status"::"Pending Approval");//status must be open.
                    //ApprovalsMgmt.OnSendTSalaryForApproval(Rec);
                end;
            }
            separator(Action30)
            {
            }
            action("Send Appraisal")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
            }
            separator(Action49)
            {
            }
            action("Print Individual PC")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    SetRange(No, No);
                    Report.Run(80007, true, true, Rec)
                end;
            }
            action("Individual PC-Sub Indicators")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                //RunObject = Report "Individual PC-Sub Indicators";
            }
            action("Board PC")
            {
                ApplicationArea = Basic;
                Caption = 'Board PC';
                Image = print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    SetRange(No, No);
                    Report.Run(80024, true, true, Rec)
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(LockContract)
                {
                    ApplicationArea = Service;
                    Caption = '&Lock Contract';
                    Image = Lock;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Make sure that the changes will be part of the contract.';

                    trigger OnAction()
                    var
                        LockOpenServContract: Codeunit "Lock-OpenServContract";
                    begin
                        TestField("Approval Status", "approval status"::Released);
                        "Change Status" := "change status"::Locked;
                        Modify;
                        Message('Contract Locked Successfully');
                    end;
                }
                action(SignContract)
                {
                    ApplicationArea = Service;
                    Caption = 'Si&gn Contract';
                    Image = Signature;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Confirm the contract.';

                    trigger OnAction()
                    var
                        SignServContractDoc: Codeunit SignServContractDoc;
                    begin
                        TestField("Approval Status", "approval status"::Released);
                        TestField("Change Status", "change status"::Locked);
                        Status := Status::Signed;
                        Modify;
                        Message('Contract signed Successfully');
                    end;
                }
                action(CopyWorkplan)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Copy WorkPlan';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ToolTip = 'Copy a Workplan and its Lines';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy WorkPlan";
                    begin
                        CopyJob.SetFromWorkplan(Rec);
                        CopyJob.RunModal;
                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Document Type" := "document type"::"Individual Scorecard";
        "Score Card Type" := "score card type"::Staff;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Individual Scorecard";
        "Score Card Type" := "score card type"::Staff;
    end;

    trigger OnOpenPage()
    begin
        "Document Type" := "document type"::"Individual Scorecard";
        "Score Card Type" := "score card type"::Staff;
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        JobResponsiblities: Record "Job Application Table";
        PCJobDescription: Record "PC Job Description";
        SPMGeneralSetup: Record "SPM General Setup";
        TotalWeight: Decimal;
        PCHeader: Record "Perfomance Contract Header";
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OriginalSubActivities: Record "Sub PC Objective";
        JobRes: Record "Positions Responsibility";
        Employee: Record Employee;
}

