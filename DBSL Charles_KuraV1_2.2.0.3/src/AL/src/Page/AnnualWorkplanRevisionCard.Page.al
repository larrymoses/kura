#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 80373 "Annual Workplan Revision Card"
{
    Caption = 'Annual Workplan Revision Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Annual Workplan Revision";

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
                field("Annual Workplan"; "Annual Workplan")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Plan ID"; "Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Current AWP"; "Current AWP")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code"; "Year Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                }
            }
            part(Control9; "Workplan Revision Lines")
            {
                SubPageLink = No = field(No),
                              "Strategy Plan ID" = field("Strategy Plan ID"),
                              "Revision Workplan" = field("Annual Workplan");
                ToolTip = '<>';
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Activity Lines")
            {
                ApplicationArea = Basic;
                Image = Suggest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    NumCount: Integer;
                begin
                    TestField("Annual Workplan");
                    StrategyWorkplanLines.Reset;
                    StrategyWorkplanLines.SetRange("Strategy Plan ID", "Strategy Plan ID");
                    StrategyWorkplanLines.SetRange("Year Reporting Code", "Year Reporting Code");
                    StrategyWorkplanLines.SetRange(No, "Annual Workplan");
                    if StrategyWorkplanLines.FindFirst then begin
                        repeat
                            WorkplanLinesRevision.Init;
                            WorkplanLinesRevision.No := No;
                            WorkplanLinesRevision."Revision Workplan" := "Annual Workplan";
                            WorkplanLinesRevision."Strategy Plan ID" := "Strategy Plan ID";
                            WorkplanLinesRevision."Activity ID" := StrategyWorkplanLines."Activity ID";
                            WorkplanLinesRevision.TransferFields(StrategyWorkplanLines, false);
                            WorkplanLinesRevision.Insert;
                        until StrategyWorkplanLines.Next = 0;
                    end;


                    BoardActivities.Reset;
                    BoardActivities.SetRange("AWP No", "Annual Workplan");
                    if BoardActivities.FindFirst then begin
                        repeat
                            BoardActivitiesRevision.Init;
                            BoardActivitiesRevision."Revision Workplan No" := No;
                            BoardActivitiesRevision."AWP No" := "Annual Workplan";
                            BoardActivitiesRevision.TransferFields(BoardActivities);
                            BoardActivitiesRevision.Insert;
                        until BoardActivities.Next = 0;
                    end;
                end;
            }
            separator(Action15)
            {
            }
            separator(Action17)
            {
            }
            action("Update Annual Workplan")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    WorkplanLinesRevision.Reset;
                    WorkplanLinesRevision.SetRange(No, No);
                    if WorkplanLinesRevision.Find('-') then begin
                        repeat
                            StrategyWorkplanLines.Reset;
                            StrategyWorkplanLines.SetRange(No, WorkplanLinesRevision."Revision Workplan");
                            StrategyWorkplanLines.SetRange("Activity ID", WorkplanLinesRevision."Activity ID");
                            if StrategyWorkplanLines.Find('-') then begin
                            end;

                            StrategyWorkplanLines.Reset;
                            StrategyWorkplanLines.SetRange(No, WorkplanLinesRevision."Revision Workplan");
                            StrategyWorkplanLines.SetRange("Activity ID", WorkplanLinesRevision."Activity ID");
                            if not StrategyWorkplanLines.Find('-') then begin
                            end;

                        until WorkplanLinesRevision.Next = 0;
                    end;
                end;
            }
            separator(Action19)
            {
            }
            action("Board Activities")
            {
                ApplicationArea = Basic;
                Image = EmployeeAgreement;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "Board Activities Revision";
                RunPageLink = "Revision Workplan No" = field(No),
                              "AWP No" = field("Annual Workplan");
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                    //  ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*
                         IF ("Approval Status"="Approval Status"::Open) THEN
                        IF ApprovalsMgmt.CheckAnnualStrategyApprovalsWorkflowEnabled(Rec) THEN
                           ApprovalsMgmt.OnSendAnnualStrategyForApproval(Rec);
                           */
                        /*
                        "Approval Status":="Approval Status"::Released;
                        MODIFY;
                        MESSAGE('Document %1 has been approved Automatically',No);
                        */

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
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        /*IF "Approval Status"="Approval Status"::"Pending Approval" THEN
                          ApprovalsMgmt.OnCancelAnnualStrategyApprovalRequest(Rec);*/

                    end;
                }
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: action): Boolean
    var
        ExcelBuffer: Record "Excel Buffer";
    begin
    end;

    var
        WPLines: Record "Strategy Workplan Lines";
        StrategicAct: Record "Strategic Initiative";
        ServerFileName: Text;
        SheetName: Text;
        FIleManagement: Codeunit "File Management";
        Text0001: label 'testing';
        ExcelExt: Text;
        AnnualWorkPlan: Record "Strategy Workplan Lines";
        StrategyEntry: Record "Strategy Sub_Activity Entry";
        WPlanLines: Record "Strategy Workplan Lines";
        I: Integer;
        ThemeID: Code[50];
        ObjectiveID: Code[50];
        StrategicInt: Record "Strategic Initiative";
        SourceType: Option "Strategic Plan","Perfomance Contract";
        YearCode: Record "Annual Reporting Codes";
        QYearCode: Record "Quarterly Reporting Periods";
        QCount: Integer;
        Q1: Code[20];
        Q1date: Date;
        Q2: Code[20];
        Q2date: Date;
        Q3: Code[20];
        Q3date: Date;
        Q4: Code[20];
        Q4date: Date;
        StrategicPlanning: Codeunit "Strategic Planning";
        StrategicIntPlanningLines: Record "Strategic Int Planning Lines";
        //   ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        StrategyWorkplanLines: Record "Strategy Workplan Lines";
        WorkplanLinesRevision: Record "Workplan Lines Revision";
        BoardActivities: Record "Board Activities";
        BoardActivitiesRevision: Record "Board Activities Revision";


    procedure fnPostPlanEntry(WPlanLines: Record "Strategy Workplan Lines")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin
        StrategicInt.Reset;
        StrategicInt.SetRange(Code, WPlanLines."Activity ID");
        if StrategicInt.Find('-') then begin
            ThemeID := StrategicInt."Theme ID";
            ObjectiveID := StrategicInt."Objective ID";
        end;

        QYearCode.Reset;
        QYearCode.SetRange("Year Code", WPlanLines."Year Reporting Code");
        if QYearCode.Find('-') then begin
            repeat
                QCount := QCount + 1;
                if (QCount = 1) then begin
                    Q1 := QYearCode.Code;
                    Q1date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 2) then begin
                    Q2 := QYearCode.Code;
                    Q2date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 3) then begin
                    Q3 := QYearCode.Code;
                    Q3date := QYearCode."Reporting Start Date";
                end;
                if (QCount = 4) then begin
                    Q4 := QYearCode.Code;
                    Q4date := QYearCode."Reporting Start Date";
                end;
            until QYearCode.Next = 0;
        end;


        // I:=0;
        for I := 1 to 4 do begin

            if (I = 1) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                "Year Reporting Code", Q1, Q1date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q1 Target", WPlanLines."Q1 Budget",
                No, Sourcetype::"Strategic Plan");
            end;
            if (I = 2) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                "Year Reporting Code", Q2, Q2date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q2 Target", WPlanLines."Q2 Budget",
                No, Sourcetype::"Strategic Plan");
            end;

            if (I = 3) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                "Year Reporting Code", Q3, Q3date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q3 Target", WPlanLines."Q3 Budget",
                No, Sourcetype::"Strategic Plan");

            end;
            if (I = 4) then begin
                FnInsertEntry(WPlanLines."Strategy Plan ID", ThemeID, ObjectiveID, WPlanLines."Strategy Plan ID", WPlanLines."Activity ID", WPlanLines.Description, WPlanLines."entry type"::Planned,
                "Year Reporting Code", Q4, Q4date, WPlanLines."Primary Directorate", WPlanLines."Primary Department", WPlanLines."Q4 Target", WPlanLines."Q4 Budget",
                No, Sourcetype::"Strategic Plan");
            end;
        end;
    end;


    procedure FnInsertEntry(PlanID: Code[50]; ThemeID: Code[50]; ObjectiveID: Code[50]; StrategyID: Code[50]; Actitvityid: Code[50]; Description: Code[255]; EntryType: Option Planned,Actual; YearCode: Code[50]; QYearCode: Code[50]; PlanningDate: Date; PrimaryDirectorate: Code[100]; PrimaryDepartment: Code[100]; Quantity: Decimal; CostAmount: Decimal; Extdoc: Code[50]; SourceType: Option "Strategic Plan","Perfomance Contract")
    var
        StrategyEntry: Record "Strategy Sub_Activity Entry";
    begin

        StrategyEntry.Init;
        StrategyEntry."Strategic Plan ID" := PlanID;
        StrategyEntry."Theme ID" := ThemeID;
        StrategyEntry."Objective ID" := ObjectiveID;
        StrategyEntry."Strategy ID" := StrategyID;
        StrategyEntry."Activity ID" := Actitvityid;
        StrategyEntry."Entry Description" := Description;
        StrategyEntry."Entry Type" := EntryType;
        StrategyEntry."Year Reporting Code" := YearCode;
        StrategyEntry."Quarter Reporting Code" := QYearCode;
        StrategyEntry."Planning Date" := PlanningDate;
        StrategyEntry."Primary Directorate" := PrimaryDirectorate;
        StrategyEntry."Primary Department" := PrimaryDepartment;
        StrategyEntry.Quantity := Quantity;
        StrategyEntry."Cost Amount" := CostAmount;
        StrategyEntry."External Document No" := Extdoc;
        StrategyEntry."Source Type" := SourceType;
        StrategyEntry.Insert(true);
    end;


    procedure FnGetCount(StrategicInitiative: Record "Strategic Initiative") NumCount: Integer
    var
        StrategicInitiativeYears: Record "Strategic Int Planning Lines";
    begin
        StrategicInitiativeYears.Reset;
        StrategicInitiativeYears.SetRange("Strategic Plan ID", StrategicInitiative."Strategic Plan ID");
        StrategicInitiativeYears.SetRange("Theme ID", StrategicInitiative."Theme ID");
        StrategicInitiativeYears.SetRange("Objective ID", StrategicInitiative."Objective ID");
        StrategicInitiativeYears.SetRange("Strategy ID", StrategicInitiative."Strategy ID");
        StrategicInitiativeYears.SetRange(Code, StrategicInitiative.Code);
        if StrategicInitiativeYears.Find('-') then begin
            NumCount := StrategicInitiativeYears.Count;
        end;
        exit(NumCount);
    end;
}

