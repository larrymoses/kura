#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80111 "CEO/Corporate PC"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Perfomance Contract Header";
    SourceTableView = where("Document Type" = const("CEO/Corporate PC"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Objective Setting Due Date"; Rec."Objective Setting Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Goal Template ID"; Rec."Goal Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Workplan"; Rec."Annual Workplan")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsible Employee No."; Rec."Responsible Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center Name"; Rec."Responsibility Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Blocked?"; Rec."Blocked?")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Last Evaluation Date"; Rec."Last Evaluation Date")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Objectives and Intiatives"; "Workplan Initiatives")
            {
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
            action("PC Perspectives")
            {
                ApplicationArea = Basic;
                Image = Interaction;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "PC Perspectives";
                RunPageLink = "Document No" = field(No);
                Visible = false;
            }
        }
        area(creation)
        {
            action("Core Mandate")
            {
                ApplicationArea = Basic;
                Image = Hierarchy;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Core Mandates";
            }
            action("Strategic Theme")
            {
                ApplicationArea = Basic;
                Image = Planning;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Strategic Theme";
                RunPageLink = "Strategic Plan ID" = field("Strategy Plan ID");
            }
            action("Strategic Objectives")
            {
                ApplicationArea = Basic;
                Image = Route;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Strategic Objectives";
                RunPageLink = "Strategic Plan ID" = field("Strategy Plan ID");
            }
            action("Suggest Objective Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Cascade PC & CSP Activities';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if not Confirm('Are you sure you want to Suggest Activities', true) then
                        Error('Activities not Suggested');
                    Rec.TestField("Strategy Plan ID");
                    Rec.TestField("Annual Workplan");
                    Rec.TestField("Annual Reporting Code");
                    StrategyObjLines.Reset;
                    StrategyObjLines.SetRange("Strategy Plan ID", Rec."Strategy Plan ID");
                    StrategyObjLines.SetRange(No, Rec."Annual Workplan");
                    if StrategyObjLines.Find('-') then begin
                        repeat
                            // ERROR('Test %1 %2 %3 %4',No,StrategyObjLines."Strategy Plan ID","Goal Template ID",StrategyObjLines."Activity ID");
                            PcLines.Init;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := StrategyObjLines."Strategy Plan ID";
                            PcLines."Initiative No." := StrategyObjLines."Activity ID";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := StrategyObjLines.Description;
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."initiative type"::Activity;
                            PcLines."Primary Directorate" := StrategyObjLines."Primary Directorate";
                            PcLines."Primary Department" := StrategyObjLines."Primary Department";
                            PcLines."Outcome Perfomance Indicator" := StrategyObjLines."Perfomance Indicator";
                            PcLines."Start Date" := Rec."Start Date";
                            PcLines."Due Date" := Rec."End Date";
                            PcLines."Unit of Measure" := StrategyObjLines."Unit of Measure";
                            PcLines."Desired Perfomance Direction" := StrategyObjLines."Desired Perfomance Direction";
                            PcLines."Imported Annual Target Qty" := StrategyObjLines."Imported Annual Target Qty";
                            PcLines."Assigned Weight (%)" := StrategyObjLines."Assigned Weight(%)";
                            PcLines."Q1 Target Qty" := StrategyObjLines."Q1 Target";
                            PcLines."Q2 Target Qty" := StrategyObjLines."Q2 Target";
                            PcLines."Q3 Target Qty" := StrategyObjLines."Q3 Target";
                            PcLines."Q4 Target Qty" := StrategyObjLines."Q4 Target";
                            PcLines."Strategy Framework" := StrategyObjLines."Strategy Framework";
                            PcLines."Framework Perspective" := StrategyObjLines."Framework Perspective";
                            PcLines.Insert(true);
                            //added by daudi to add PC Perspectives
                            PCPerspectives.Reset;
                            PCPerspectives.SetRange(Code, StrategyObjLines."Framework Perspective");
                            PCPerspectives.SetRange("Document No", Rec.No);
                            if not PCPerspectives.FindSet then begin
                                PCPerspectives.Init;
                                PCPerspectives.Code := StrategyObjLines."Framework Perspective";
                                PCPerspectives."Document No" := Rec.No;
                                if CSPPerspective.Get(PCPerspectives.Code) then
                                    PCPerspectives.Description := CSPPerspective.Description;
                                PCPerspectives.Insert;
                            end;
                        until StrategyObjLines.Next = 0;
                    end;


                    BoardActivities.Reset;
                    BoardActivities.SetRange("AWP No", Rec."Annual Workplan");
                    if BoardActivities.Find('-') then begin
                        repeat
                            PcLines.Init;
                            PcLines."Workplan No." := Rec.No;
                            PcLines."Strategy Plan ID" := Rec."Strategy Plan ID";
                            PcLines."Initiative No." := BoardActivities."Activity Code";
                            PcLines."Goal Template ID" := Rec."Goal Template ID";
                            PcLines."Objective/Initiative" := BoardActivities."Activity Description";
                            PcLines."Year Reporting Code" := Rec."Annual Reporting Code";
                            PcLines."Initiative Type" := PcLines."initiative type"::Board;
                            PcLines."Assigned Weight (%)" := BoardActivities."WT(%)";
                            //PcLines."Assigned Weight (%)":=PcLines."Assigned Weight (%)";
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

                    Message('CEO PC Populated Successfully');

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
                    GoalTemplateLine.SetRange("Goal Template ID", Rec."Goal Template ID");
                    if GoalTemplateLine.Find('-') then begin
                        repeat
                            workplangoalhub.Init;
                            workplangoalhub."Goal ID" := GoalTemplateLine."Goal ID";
                            workplangoalhub."Performance Contract ID" := Rec.No;
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

                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                //  ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Open);

                    VarVariant := Rec;
                    IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        CustomApprovals.OnSendDocForApproval(VarVariant);

                    PcLines.Reset;
                    PcLines.SetRange("Workplan No.", Rec.No);
                    if PcLines.FindFirst then begin
                        repeat
                            PcLines.TestField("Primary Directorate");
                            PcLines.TestField("Primary Department");
                        until PcLines.Next = 0;
                    end;


                    //status must be open.
                    //TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                    /* IF ApprovalsMgmt.CheckGFAApprovalsWorkflowEnabled(Rec) THEN
                      ApprovalsMgmt.OnSendGFAForApproval(Rec);*/


                    // "Approval Status" := "approval status"::Released;
                    // Modify;
                    // Message('Document has been approved Automatically');

                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status must be open.
                                                                                                /*TESTFIELD("Created By",USERID); //control so that only the initiator of the document can send for approval
                                                                                                ApprovalsMgmt.""(Rec);*/
                                                                                                // "Approval Status" := "approval status"::Open;
                                                                                                // Modify;
                                                                                                // Message('Document has been Re-Opened');



                    Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");//status 
                                                                                                //
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    Message('Document has been Re-Opened');

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
                Visible = false;

                trigger OnAction()
                begin
                    Rec.TestField("Approval Status", Rec."approval status"::Released);
                    Message('Test');
                end;
            }
            separator(Action45)
            {
            }
            action("Print C.E.O PC")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    //REPORT.RUN(80005,TRUE,TRUE,Rec)
                    Report.Run(80019, true, true, Rec)
                end;
            }
            action("Individual PC-Sub Indicators")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category6;
                //     RunObject = Report "Individual PC-Sub Indicators";
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
                    Visible = false;

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
        Rec."Document Type" := Rec."document type"::"CEO/Corporate PC";
    end;

    trigger OnOpenPage()
    begin
        Rec."Document Type" := Rec."document type"::"CEO/Corporate PC";
    end;

    var
        GoalTemplateLine: Record "Goal Template Line";
        workplangoalhub: Record "PC Goal Hub";
        StrategyObjLines: Record "Strategy Workplan Lines";
        PcLines: Record "PC Objective";
        BoardActivities: Record "Board Activities";
        PCPerspectives: Record "PC Perspective";
        CSPPerspective: Record "Strategy Framework Perspective";
}

#pragma implicitwith restore

