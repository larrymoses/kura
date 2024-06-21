#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80362 "Approved Functional PC Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type" = const("Functional/Operational PC"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Objective Setting Due Date"; "Objective Setting Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Workplan"; "Annual Workplan")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; "Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Annual Reporting Code"; "Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Goal Template ID"; "Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("CEO WorkPlan"; "CEO WorkPlan")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
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
                field("Responsible Employee No."; "Responsible Employee No.")
                {
                    ApplicationArea = Basic;
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
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Name"; "Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center Name"; "Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?"; "Blocked?")
                {
                    ApplicationArea = Basic;
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
                field("Last Evaluation Date"; "Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
                Caption = 'Board PC Initiatives';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Board);
            }
            part("Core Mandate"; "Workplan Initiatives")
            {
                Caption = 'Core Mandate Initiatives';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = const(Activity);
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
            }
            action("Performance Appraisal")
            {
                ApplicationArea = Basic;
                Image = AddWatch;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Personal Scorecard ID" = field(No);
            }
        }
        area(creation)
        {
            action("Suggest Objective Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*TESTFIELD("Strategy Plan ID");
                    TESTFIELD("CEO WorkPlan");
                    TESTFIELD("Annual Reporting Code");
                    PcLinesN.RESET;
                    PcLinesN.SETRANGE("Strategy Plan ID","Strategy Plan ID");
                    PcLinesN.SETRANGE("Workplan No.","CEO WorkPlan");
                    PcLinesN.SETRANGE("Primary Department","Responsibility Center");
                    IF PcLinesN.FIND('-') THEN BEGIN
                       REPEAT
                         //ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                         PcLines.INIT;
                         PcLines."Workplan No.":=No;
                         PcLines."Strategy Plan ID":=PcLinesN."Strategy Plan ID";
                         PcLines."Initiative No.":=PcLinesN."Initiative No.";
                         PcLines."Goal Template ID":="Goal Template ID";
                         PcLines."Objective/Initiative":=PcLinesN."Objective/Initiative";
                         PcLines."Year Reporting Code":="Annual Reporting Code";
                         PcLines."Initiative Type":= PcLines."Initiative Type"::Activity;
                         PcLines."Primary Directorate":=PcLinesN."Primary Directorate";
                         PcLines."Primary Department":=PcLinesN."Primary Department";
                         PcLines."Imported Annual Target Qty":=PcLinesN."Imported Annual Target Qty";
                         PcLines."Q1 Target Qty":=PcLinesN."Q1 Target Qty";
                         PcLines."Q2 Target Qty":=PcLinesN."Q2 Target Qty";
                         PcLines."Q3 Target Qty":=PcLinesN."Q3 Target Qty";
                         PcLines."Q4 Target Qty":=PcLinesN."Q4 Target Qty";
                         PcLines.INSERT(TRUE);
                       UNTIL PcLinesN.NEXT=0;
                      END;
                    MESSAGE('Functional PC Populated Successfully');*/

                    TestField("Strategy Plan ID");
                    TestField("Annual Workplan");
                    TestField("Annual Reporting Code");
                    StrategyObjLines.Reset;
                    StrategyObjLines.SetRange("Strategy Plan ID", "Strategy Plan ID");
                    StrategyObjLines.SetRange(No, "Annual Workplan");
                    StrategyObjLines.SetRange("Primary Directorate", Directorate);
                    //StrategyObjLines.SETRANGE("Primary Department","Responsibility Center");
                    if StrategyObjLines.Find('-') then begin
                        repeat
                            // ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                            PcLines.Init;
                            PcLines."Workplan No." := No;
                            PcLines."Strategy Plan ID" := StrategyObjLines."Strategy Plan ID";
                            PcLines."Initiative No." := StrategyObjLines."Activity ID";
                            PcLines."Goal Template ID" := "Goal Template ID";
                            PcLines."Objective/Initiative" := StrategyObjLines.Description;
                            PcLines."Year Reporting Code" := "Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."initiative type"::Activity;
                            PcLines."Primary Directorate" := StrategyObjLines."Primary Directorate";
                            PcLines."Primary Department" := StrategyObjLines."Primary Department";
                            PcLines."Outcome Perfomance Indicator" := StrategyObjLines."Perfomance Indicator";
                            PcLines."Key Performance Indicator" := StrategyObjLines."Key Performance Indicator";
                            PcLines."Desired Perfomance Direction" := StrategyObjLines."Desired Perfomance Direction";
                            PcLines."Unit of Measure" := StrategyObjLines."Unit of Measure";
                            PcLines."Imported Annual Target Qty" := StrategyObjLines."Imported Annual Target Qty";
                            PcLines."Q1 Target Qty" := StrategyObjLines."Q1 Target";
                            PcLines."Q2 Target Qty" := StrategyObjLines."Q2 Target";
                            PcLines."Q3 Target Qty" := StrategyObjLines."Q3 Target";
                            PcLines."Q4 Target Qty" := StrategyObjLines."Q4 Target";
                            PcLines.Insert(true);
                        until StrategyObjLines.Next = 0;
                    end;

                    BoardActivities.Reset;
                    BoardActivities.SetRange("AWP No", "Annual Workplan");
                    if BoardActivities.Find('-') then begin
                        repeat
                            PcLines.Init;
                            PcLines."Workplan No." := No;
                            PcLines."Strategy Plan ID" := "Strategy Plan ID";
                            PcLines."Initiative No." := BoardActivities."Activity Code";
                            PcLines."Goal Template ID" := "Goal Template ID";
                            PcLines."Objective/Initiative" := BoardActivities."Activity Description";
                            PcLines."Year Reporting Code" := "Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."initiative type"::Board;
                            //PcLines."Primary Directorate":=StrategyObjLines."Primary Directorate";
                            // PcLines."Primary Department":=StrategyObjLines."Primary Department";
                            PcLines."Imported Annual Target Qty" := BoardActivities.Target;
                            /*  PcLines."Q1 Target Qty":=StrategyObjLines."Q1 Target";
                              PcLines."Q2 Target Qty":=StrategyObjLines."Q2 Target";
                              PcLines."Q3 Target Qty":=StrategyObjLines."Q3 Target";
                              PcLines."Q4 Target Qty":=StrategyObjLines."Q4 Target";*/
                            PcLines.Insert(true);
                        until BoardActivities.Next = 0;
                    end;
                    Message('Annual Workplan & Board PC Populated Successfully');

                end;
            }
            action("Populate Goals Hub")
            {
                ApplicationArea = Basic;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    // ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit Mail;
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
                    SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    cu400: Codeunit Mail;
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
            separator(Action35)
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
                    // ApprovalsMgmt.OpenApprovalEntriesPage(RECORDID);
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
                    //    ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit Mail;
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
                    SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    cu400: Codeunit Mail;
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

                    PcLines.Reset;
                    PcLines.SetRange("Workplan No.", No);
                    if PcLines.FindFirst then begin
                        repeat
                        //PcLines.TESTFIELD("Primary Directorate");
                        //PcLines.TESTFIELD("Primary Department");
                        until PcLines.Next = 0;
                    end;


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.OnSendGFAForApproval(Rec);*/


                    "Approval Status" := "approval status"::Released;
                    Modify;
                    /*
                      //MESSAGE('Nofity Team');
                    CompanyInfo.GET();
                    SMTPMailSet.GET;
                    SenderAddress := SMTPMailSet."Email Sender Address";
                    SenderName :=CompanyInfo.Name+' M&E';
                    Subject := STRSUBSTNO('Functional PC');
                       PerfomanceContractHeader.RESET;
                       PerfomanceContractHeader.SETRANGE(No,No);
                       IF PerfomanceContractHeader.FINDFIRST THEN BEGIN
                          FileDirectory :=  'C:\DOCS\';
                          FileName := 'PCA_'+PerfomanceContractHeader.No+'.pdf';
                          //Window.OPEN('processing');
                          Window.OPEN('PROCESSING Functional PC ############1##');
                            Window.UPDATE(1,PerfomanceContractHeader.No+'-'+PerfomanceContractHeader.Description);
                    
                          WindowisOpen := TRUE;
                          IF FileName = '' THEN
                            ERROR('Please specify what the file should be saved as');
                    
                    
                           REPORT.SAVEASPDF(80006,FileDirectory+FileName,PerfomanceContractHeader);
                    
                    
                    
                    
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
                           Body:='Dear Team <BR>Please find attached the Functional PC <Br>'+Description;
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
                                                                                        /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                        ApprovalsMgmt.""(Rec);*/
                    "Approval Status" := "approval status"::Open;
                    Modify;
                    Message('Document has been Re-Opened');

                end;
            }
            separator(Action31)
            {
            }
            action("Send Appraisal")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    TestField("Approval Status", "approval status"::Released);
                    Message('Test');
                end;
            }
            separator(Action48)
            {
            }
            action("Print Functional PC")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    SetRange(No, No);
                    Report.Run(80006, true, true, Rec)
                end;
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyWorkplan)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Copy WorkPlan';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Functional/Operational PC";
    end;

    trigger OnOpenPage()
    begin
        "Document Type" := "document type"::"Functional/Operational PC";
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        PcLinesN: Record "PC Objective";
        BoardActivities: Record "Board Activities";
}

