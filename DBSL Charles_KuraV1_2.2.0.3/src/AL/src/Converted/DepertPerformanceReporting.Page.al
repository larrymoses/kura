#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80548 "Depert Performance Reporting"
{
    Caption = 'Intiatives & Performance Indicators';
    PageType = ListPart;
    SourceTable = "PC Objective";
    SourceTableView = where("Initiative Type" = filter(Activity));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Initiative Type"; "Initiative Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Initiative No."; "Initiative No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity No';
                }
                field("Objective/Initiative"; "Objective/Initiative")
                {
                    ApplicationArea = Basic;
                    Caption = 'Activity Name';
                }
                field("Outcome Perfomance Indicator"; "Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction"; "Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Previous Annual Target Qty"; "Previous Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Previous Annual Achievements';
                }
                field("Imported Annual Target Qty"; "Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Agreed Targets';
                }
                field("Assigned Weight (%)"; "Assigned Weight (%)")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Summary of subactivities"; "Summary of subactivities")
                {
                    ApplicationArea = Basic;
                    Caption = 'Subactivities Weight';
                    Editable = false;
                }
                field("Achieved Target"; AchievedTarget)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; "Primary Directorate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Primary Department"; "Primary Department")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Framework Perspective"; "Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Strategy Framework"; "Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Strategy Plan ID"; "Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Directors Achieved Targets"; "Directors Achieved Targets")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Department Achieved Target"; "Department Achieved Target")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Budget; Budget)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Additional Comments"; "Additional Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Remarks';
                }
                field("Planning Budget Type"; "Planning Budget Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Q1 Target Qty"; "Q1 Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Q2 Target Qty"; "Q2 Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Q3 Target Qty"; "Q3 Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Q4 Target Qty"; "Q4 Target Qty")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Select Activities")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        PcLines.Reset;
                        PcLines.SetRange("Initiative No.", "Initiative No.");
                        WorkplanInitiatives.SetTableview(PcLines);
                        WorkplanInitiatives.LookupMode(true);
                        if WorkplanInitiatives.RunModal = Action::LookupOK then
;
                    end;
                }
                action("Sub-Indicators")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Sub Objectives/Intiatives";
                    RunPageLink = "Workplan No." = field("Workplan No."),
                                  "Initiative No." = field("Initiative No.");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        AchievedTarget := 0;
        AchievedTarget := FnGetAchievedTargets("Workplan No.", "Initiative No.");
    end;

    var
        PcLines: Record "PC Objective";
        WorkplanInitiatives: Page "Workplan Initiatives";
        AchievedTarget: Decimal;


    procedure FnGetAchievedTargets(PCNumber: Code[50]; ActivityID: Code[50]) AchievedT: Decimal
    var
        PCObjective: Record "PC Objective";
    begin
        AchievedT := 0;
        PCObjective.Reset;
        PCObjective.SetRange("Workplan No.", PCNumber);
        PCObjective.SetRange("Initiative No.", ActivityID);
        if PCObjective.Find('-') then begin
            PCObjective.CalcFields("Individual Achieved Targets", "Functional Achieved Targets", "CEO Achieved Targets", "Board Achieved Targets",
                                  "Directors Achieved Targets", "Department Achieved Target");

            if PCObjective."Individual Achieved Targets" > 0 then
                AchievedT := PCObjective."Individual Achieved Targets";

            if PCObjective."Functional Achieved Targets" > 0 then
                AchievedT := PCObjective."Functional Achieved Targets";

            if PCObjective."CEO Achieved Targets" > 0 then
                AchievedT := PCObjective."CEO Achieved Targets";

            if PCObjective."Board Achieved Targets" > 0 then
                AchievedT := PCObjective."Board Achieved Targets";

            if PCObjective."Directors Achieved Targets" > 0 then
                AchievedT := PCObjective."Directors Achieved Targets";

            if PCObjective."Department Achieved Target" > 0 then
                AchievedT := PCObjective."Department Achieved Target";

        end;
        exit;
    end;
}

