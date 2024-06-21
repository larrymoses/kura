#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80549 "DCS Performance Reporting"
{
    Caption = 'DCS Annual Workplan Contract';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";

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
                field("Strategy Plan ID"; "Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Functional WorkPlan"; "Functional WorkPlan")
                {
                    ApplicationArea = Basic;
                    Caption = 'AWP Template';
                }
                field("Contract Year"; "Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Goal Template ID"; "Goal Template ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    Caption = 'Division Code';
                }
                field("Responsibility Center Name"; "Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division Name';
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
                // field("Total  Departments Count";"Total  Departments Count")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Total Weight(%)";"Total Weight(%)")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                field("Total Assigned Weight(%)"; "Total Assigned Weight(%)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Assigned Weight(%)';
                    Editable = false;
                }
            }
            part("Core Activities"; "DirectorsPerformance Reporting")
            {
                Caption = 'Core Activities';
                SubPageLink = "Workplan No." = field(No),
                              "Initiative Type" = filter(Activity | Board);
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
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Activities', true) then
                        Error('Activities not Suggested');

                    TestField("Strategy Plan ID");
                    //TESTFIELD("Annual Performance Contract");
                    TestField("Functional WorkPlan");
                    TestField("Annual Reporting Code");

                    SPMGeneralSetup.Get;

                    if (SPMGeneralSetup."Allow Loading of  CSP" = true) then begin
                        PcLinesN.Reset;
                        PcLinesN.SetRange("Strategy Plan ID", "Strategy Plan ID");
                        PcLinesN.SetRange("Workplan No.", "Functional WorkPlan");
                        PcLinesN.SetRange("Primary Directorate", "Responsibility Center");
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
                                PcLines."Primary Department" := PcLinesN."Primary Department";
                                PcLines."Outcome Perfomance Indicator" := PcLinesN."Outcome Perfomance Indicator";
                                PcLines."Assigned Weight (%)" := PcLinesN."Assigned Weight (%)";
                                PcLines."Summary of subactivities" := PcLinesN."Summary of subactivities";
                                PcLines."Strategy Framework" := PcLinesN."Strategy Framework";
                                PcLines."Framework Perspective" := PcLines."Framework Perspective";
                                PcLines."Unit of Measure" := PcLinesN."Unit of Measure";
                                PcLines."Start Date" := "Start Date";
                                PcLines."Due Date" := "End Date";
                                PcLines.Budget := PcLinesN.Budget;
                                PcLines."Imported Annual Target Qty" := PcLinesN."Imported Annual Target Qty";
                                PcLines."Q1 Target Qty" := PcLinesN."Q1 Target Qty";
                                PcLines."Q2 Target Qty" := PcLinesN."Q2 Target Qty";
                                PcLines."Q3 Target Qty" := PcLinesN."Q3 Target Qty";
                                PcLines."Q4 Target Qty" := PcLinesN."Q4 Target Qty";
                                PcLines.Insert(true);

                                //Sub Activities
                                OriginalSubActivities.Reset;
                                OriginalSubActivities.SetRange("Strategy Plan ID", "Strategy Plan ID");
                                OriginalSubActivities.SetRange("Workplan No.", "Functional WorkPlan");
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


                                BoardSubActivities.Reset;
                                BoardSubActivities.SetRange("Strategy Plan ID", "Strategy Plan ID");
                                //BoardSubActivities.SetRange("Workplan No.","Annual Performance Contract");
                                BoardSubActivities.SetRange("Initiative No.", PcLines."Initiative No.");
                                if BoardSubActivities.FindFirst then begin
                                    repeat
                                        PCSubActivities.Init;
                                        PCSubActivities."Strategy Plan ID" := BoardSubActivities."Strategy Plan ID";
                                        PCSubActivities."Workplan No." := No;
                                        PCSubActivities."Initiative No." := BoardSubActivities."Initiative No.";
                                        PCSubActivities."Sub Initiative No." := BoardSubActivities."Sub Initiative No.";
                                        PCSubActivities."Entry Number" := BoardSubActivities."Entry Number";
                                        PCSubActivities.TransferFields(BoardSubActivities, false);
                                        PCSubActivities.Insert(true);
                                    until BoardSubActivities.Next = 0;
                                end;
                            //End Sub Activities
                            until PcLinesN.Next = 0;
                        end;
                    end;
                    //Loading JD
                    if (SPMGeneralSetup."Allow Loading of JD" = true) then begin
                        JobResponsiblities.Reset;
                        if "Acting Job ID" <> '' then begin
                            JobResponsiblities.SetRange("Job ID", "Acting Job ID");
                        end else begin
                            JobResponsiblities.SetRange("Job ID", Position);
                        end;
                        if JobResponsiblities.FindFirst then begin
                            repeat
                                PCJobDescription.Init;
                                PCJobDescription."Workplan No." := No;
                                //   PCJobDescription."Line Number":=Format(JobResponsiblities."Entry No.");
                                //  PCJobDescription.Description:=JobResponsiblities.Responsibility;
                                PCJobDescription."Primary Department" := "Responsibility Center";
                                PCJobDescription.Validate("Primary Department");
                                PCJobDescription.Insert;

                            until JobResponsiblities.Next = 0;
                        end;
                    end;

                    //load JD from New HR Module    \\Kisavi
                    /*IF (SPMGeneralSetup."Allow Loading of JD"=TRUE) THEN BEGIN
                      JobRes.RESET;
                      IF "Acting Job ID"<>'' THEN BEGIN
                        JobRes.SETRANGE("Position ID","Acting Job ID");
                        END ELSE BEGIN
                        JobRes.SETRANGE("Position ID",Position);
                          END;
                        IF JobRes.FINDFIRST THEN BEGIN
                        REPEAT
                          PCJobDescription.INIT;
                          PCJobDescription."Workplan No.":=No;
                          PCJobDescription."Line Number":=FORMAT(JobRes."Line No");
                          PCJobDescription.Description:=JobRes.Description;
                          PCJobDescription."Primary Department":="Responsibility Center";
                          PCJobDescription.VALIDATE("Primary Department");
                          PCJobDescription.INSERT;
                    
                        UNTIL JobRes.NEXT=0;
                      END;
                    END; */


                    //Board Sub-activities
                    /*BoardSubActivities.RESET;
                    BoardSubActivities.SETRANGE("Workplan No.","Annual Workplan");
                    IF BoardSubActivities.FINDSET THEN BEGIN
                    REPEAT
                    PCSubActivities.INIT;
                    PCSubActivities."Workplan No.":=No;
                    PCSubActivities."Initiative No.":=BoardSubActivities."Activity Id";
                    PCSubActivities.TRANSFERFIELDS(BoardSubActivities,FALSE);
                    PCSubActivities.INSERT(TRUE);
                    UNTIL BoardSubActivities.NEXT=0;
                    END;*/

                    Message('Functional PC Populated Successfully');

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
                //RunObject = Page "Worklan capability Matrix";
                // RunPageLink = "Document No"=field(No);
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
                    ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            separator(Action49)
            {
            }
            action("Preview Tagets")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    SetRange(No, No);
                    //REPORT.RUN(80004,TRUE,TRUE,Rec)
                    Report.Run(80053, true, true, Rec)
                end;
            }
            action("Print Individual PC")
            {
                ApplicationArea = Basic;
                Caption = ' Individual Annual Workplan Contract';
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
                RunObject = Report 80017;
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
                        CopyJob: Page 80088;
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
        //  "Document Type":="document type"::"Individual Scorecard PC";
        "Score Card Type" := "score card type"::Directors;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        // "Document Type":="document type"::"Individual Scorecard PC";
        "Score Card Type" := "score card type"::Directors;
    end;

    trigger OnOpenPage()
    begin
        //"Document Type":="document type"::"Individual Scorecard PC";
        "Score Card Type" := "score card type"::Directors;
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
        BoardSubActivities: Record "Board Sub Activities";
        PCSubActivities: Record "Sub PC Objective";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OriginalSubActivities: Record "Sub PC Objective";
        JobRes: Record "Positions Responsibility";
        SubWorkplanActivity: Record 80262;
}

