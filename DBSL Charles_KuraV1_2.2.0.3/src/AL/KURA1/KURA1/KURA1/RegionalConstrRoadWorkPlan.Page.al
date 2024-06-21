#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0424, AW0006 // ForNAV settings
Page 72343 "Regional Constr Road Work Plan"
{
    Caption = 'Planned Projects';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Work Program";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = True;
                }
                field("Type of Project"; Rec."Type of Project")
                {
                    ApplicationArea = Basic;
                }
                field("Road Planner No"; Rec."Road Planner No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Road Planner Name"; Rec."Road Planner Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Global Budget Book Id"; Rec."Global Budget Book Id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cash Flow Projections Doc';
                    Visible = true;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID"; Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        Rec.Description := 'Annual Maintenance Budget Ceilings Year: ' + Rec."Financial Year Code";
                    end;
                }
                field("Procurement Plan ID"; Rec."Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Authority; Rec.Authority)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("<Global Dimension 1 Code>"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Workplanned Length (Km)"; Rec."Total Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Budget Amount';
                }
                field("Total Actual Costs"; Rec."Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                // field("Reasons for Reopening"; "Reasons for Reopening")
                //{
                //  ApplicationArea = Basic;
                //Enabled = "Approval Status" <> "Approval Status"::Open;
                // }
            }
            part("Construction Budget Ceilings"; "Road WorkPlan Package Line")
            {
                Caption = 'Construction Budget Ceilings';
                SubPageLink = "Road Work Program ID" = field(Code);
                ToolTip = 'Construction Budget Ceilings';
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Projects")
            {
                ApplicationArea = Basic;
                Caption = 'Suggest Approved Projects';
                Image = Suggest;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = false;
                Visible = false;

                trigger OnAction()
                begin
                    //RMS.FnSuggestProjectsFromBudgetEntries(Rec,"Document Type");
                    //RMS.FnSuggestFundingSourcesFromBudgetEntries(Rec,"Document Type");
                    RMS.FnSuggestProjectsFromProcPlanEntry(Rec, Rec."Type of Project");
                    RMS.FnSuggestFundingSourcesFromProcPlanEntry(Rec, Rec."Type of Project");
                    Message('Lines suggested successfully');
                end;
            }
            action("Suggest Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Select Budget Lines';
                Image = Suggest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = True;

                trigger OnAction()
                begin
                    RoadPackage.Reset;
                    RoadPackage.SetRange(RoadPackage."Road Work Program ID", Rec.Code);
                    if RoadPackage.FindSet then
                        RoadPackage.DeleteAll;

                    DetailedMulti_YearLine.Reset;
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Road Work Program ID", Rec."Global Budget Book Id");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine."Financial Year Code", Rec."Financial Year Code");
                    DetailedMulti_YearLine.SetRange(DetailedMulti_YearLine.Closed, false);
                    //NewRoadWorkProgramPackage.SETRANGE(NewRoadWorkProgramPackage."Region ID","Region ID");
                    if DetailedMulti_YearLine.FindSet then begin
                        repeat
                            RoadPackage.Init;
                            RoadPackage."Road Work Program ID" := Rec.Code;
                            RoadPackage."KeRRA Budget Code" := DetailedMulti_YearLine."KeRRA Budget Code";
                            RoadPackage."Budget Entry No" := DetailedMulti_YearLine."Package No.";
                            RoadPackage."Package Name" := DetailedMulti_YearLine."Package Name";
                            RoadPackage."Funding Source ID" := DetailedMulti_YearLine."Funding Source ID";
                            RoadPackage."Road Works Category" := DetailedMulti_YearLine."Road Works Category";
                            RoadPackage."Pavement Surface Type" := DetailedMulti_YearLine."Pavement Surface Type";
                            RoadPackage."Funding Source ID" := DetailedMulti_YearLine."Funding Source ID";
                            RoadPackage."Global Dimension 1 Code" := DetailedMulti_YearLine."Region ID";
                            RoadPackage."Directorate ID" := DetailedMulti_YearLine."Directorate ID";
                            RoadPackage."Department ID" := DetailedMulti_YearLine."Department ID";
                            DetailedMulti_YearLine.CalcFields("Current Budget Amount");
                            RoadPackage."Total Budget Cost" := DetailedMulti_YearLine."Current Budget Amount";
                            RoadPackage.Validate("Funding Source ID");
                            //  RoadPackage."Procurement Plan Entry No" := DetailedMulti_YearLine."Procurement Plan Entry No";
                            RoadPackage."Region ID" := FnGetRegionID(DetailedMulti_YearLine."Region ID");
                            RoadPackage."Entry No" := RoadPackage.Count + 1;
                            RoadPackage.Validate("Region ID");
                            if not RoadPackage.Insert(true) then
                                RoadPackage.Modify(true);

                            ProjectRoadLink.Reset;
                            ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code", Rec."Global Budget Book Id");
                            ProjectRoadLink.SetRange(ProjectRoadLink."KeRRA Budget Code", DetailedMulti_YearLine."KeRRA Budget Code");
                            if ProjectRoadLink.FindSet then
                                repeat
                                    ObjProjectRoadLink.Init;
                                    ObjProjectRoadLink.TransferFields(ProjectRoadLink);
                                    ObjProjectRoadLink."KeRRA Budget Code" := DetailedMulti_YearLine."KeRRA Budget Code";
                                    ObjProjectRoadLink."Global Budget Book Code" := Rec.Code;
                                    ObjProjectRoadLink."Line No" := ObjProjectRoadLink.Count + 1;
                                    if not ObjProjectRoadLink.Insert(true) then
                                        ObjProjectRoadLink.Modify(true);
                                until ProjectRoadLink.Next = 0;
                        until DetailedMulti_YearLine.Next = 0;
                        Message('Lines Suggested Successfully');
                    end;
                end;
            }
            action("Suggest Bill Items From Template")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Tender BOQ Items';
                Image = SuggestBatch;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    RMS.FnCreateRWProgramTasksFromBOQTemplate(RoadWorkPlanPackage, Job, NewRoadWorkProgramTask, Rec);
                    RMS.FnCreateRWProgramTasksFromBOQTemplatePBRM(RoadWorkPlanPackage, Job, NewRoadWorkProgramTask, Rec);
                    RMS.FnCreateRWPPlanningLinesFromBOQTemplates(RoadWorkPlanPackage, Job, NewRoadWorkProgramActivity, Rec);
                    RMS.FnCreateRWPPlanningLinesFromBOQTemplatesPBRM(RoadWorkPlanPackage, Job, NewRoadWorkProgramActivity, Rec);
                    RMS.FnUpdateBoQDetailsConstruction(Rec);
                    RMS.FnUpdateBoQDetailsPBRM(Rec);
                    RMS.FnCreateEquipmentSpecsTemplate(RoadWorkPlanPackage, ScheduleofPPRequirements, Rec);
                    RMS.FnCreateStaffSpecsTemplate(RoadWorkPlanPackage, ScheduleofPPRequirements, Rec);
                    RMS.FnUpdateAppendixOnRWP(RoadWorkPlanPackage, Rec);
                    Message('Project Tender BOQ Generated Successfully');
                end;
            }
            action("Import Budget Entries")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Config. Packages";
                RunPageView = where(Code = const('GLOBALBUDGET'));

                trigger OnAction()
                begin
                    //MESSAGE('Success');
                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    //NewRoadWorkProgramPackage.TESTFIELD(NewRoadWorkProgramPackage."Procurement Category");
                    Rec.TestField(Rec."Approval Status", Rec."approval status"::Open);
                    //if ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) then
                    //   ApprovalsMgmt.OnSendRWPReqForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Approval Status", Rec."approval status"::"Pending Approval");
                    //ApprovalsMgmt.OnCancelRWPReqApprovalRequest(Rec);
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Approvals;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec.Code, Rec.Code);
                    if Rec.FindSet then
                        Report.Run(72017, true, false, Rec);
                end;
            }
            action("G/l Budget Entries")
            {
                ApplicationArea = Basic;
                Image = LedgerEntries;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Road Program G/L budget";
                RunPageLink = "Road Work Program" = field(Code),
                              "Road Project Category" = filter("Construction Works");
                Visible = false;
            }
            action("Check Budget ")
            {
                ApplicationArea = Basic;
                Image = CheckLedger;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    RMS.CheckBudgetCeiling(Rec)
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Create Project(s)';
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.TestField(Rec."Approval Status", Rec."approval status"::Released);
                    RMS.FnCreateJobsFromWorkPlanLines(RoadWorkPlanPackage, Job, Rec);
                    RMS.FnCreateJobPlanningLinesFromT72135(RoadWorkPlanPackage, Job, JobPlanningLine, Rec, NewRoadWorkProgramActivity);
                    RMS.FnCreateProjectRoadLinksFromPlanToJob(Rec, RoadWorkPlanPackage);
                    // RMS.FnUpdatePPlanEntryFromWorkplan(Rec);
                    //RMS.FnCreateProjectAppendixToJob(RoadWorkPlanPackage,Rec);
                    RMS.FnCreateProjectScopeOfWorks(Rec, RoadWorkPlanPackage, ProjectRoadLink);
                    //RMS.FnCreateProjectConstituencies(Rec, RoadWorkPlanPackage, ProjectRoadLink);
                    //Post To Procurement Plan

                    RoadPackage.RESET;
                    RoadPackage.SETRANGE(RoadPackage."Road Work Program ID", rec.Code);
                    IF RoadPackage.FINDSET THEN
                        REPEAT
                            RoadPackage.TESTFIELD("Procurement Category");
                        UNTIL RoadPackage.NEXT = 0;
                    FnInsertPlanningCategory();
                    FnInsertIntoPPlanEntry();

                    //  FnUpdatePPlanEntry();
                    Rec.Posted := true;
                    Rec.Modify;
                    Message('The document %1 has been posted successfully', Rec.Code);
                end;
            }
            action("Post To Procurement Plan")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Planning;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    //cc//   Rec.TestField(Rec."Approval Status", Rec."approval status"::Approved);
                    Rec.TestField(Rec."Procurement Plan ID");
                end;
            }
            action("Print Schedule Of Project (s)")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec.Code, Rec.Code);
                    if Rec.FindSet then
                        Report.Run(75003, true, false, Rec);
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
                Visible = true;

                trigger OnAction()
                begin
                    //TESTFIELD("Shortcut Dimension 1 Code");
                    //MESSAGE("Shortcut Dimension 1 Code");
                    //DMSManagement.UploadPaymentsDocuments("No.",'Payment Vouchers',RECORDID,"Shortcut Dimension 1 Code");
                    DMSManagement.UploadStaffClaimDocuments(DMSDocuments."document type"::"Payment Voucher", Rec.Code, 'Payment Voucher', Rec.RecordId, Rec."Region ID");
                    //DMSManagement.UploadStaffClaimDocuments(DMSDocuments."Document Type"::"Staff Claim",Code,'BoQ Template',RECORDID,'R48');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Caption = 'Reopen';
                Enabled = "Approval Status" <> "Approval Status"::Open;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Rec.TestField("Reasons for Reopening");
                    Rec."Approval Status" := Rec."approval status"::Open;
                    Rec.Modify(true);
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    Rec."Approval Status" := Rec."approval status"::Released;
                    Rec.Modify;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Schedule Of Projects";
        Rec."Planning Type" := Rec."planning type"::"Top-Down (New Works)";
        Rec."Road Project Category" := Rec."road project category"::"Road Construction";

        //IF "Planning Level"="Planning Level"::Regional THEN BEGIN
        if UserSetup.Get(UserId) then begin
            Rec."Road Planner No" := UserSetup."Road Planner No";
            Rec.Validate(Rec."Road Planner No");
        end;
        //END;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Approval Status" = Rec."approval status"::Released then begin
            CurrPage.Editable := false;
        end;
    end;

    var
        Job: Record Job;
        JobTask: Record "Job Task";
        JobPlanningLine: Record "Job Planning Line";
        Procurement: Codeunit "Procurement Processing";
        ConsRoadWorkProgram: Record "Road Work Program";
        ExistingRoadWPPackage: Record "Existing Road WP Package";
        ExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
        ExistingRoadWPActivity: Record "Existing Road WP Activity";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        RoadWorkProgram: Record "Road Work Program";
        RMS: Codeunit "RMS Management";
        UserSetup: Record "User Setup";
        RoadPackage: Record "Road WorkPlan Package";
        RoadWorkPlanPackage: Record "Road WorkPlan Package";
        NewRoadWorkProgramTask: Record "New Road Work Program Task";
        NewRoadWorkProgramPackage: Record "New Road Work Program Package";
        PurchaseRequisitionTemplate: Record "Purchase Requisition Template";
        RequisitionTemplateLine: Record "BoQ Template Line1";
        BoQTemplateBillCode: Record "BoQ Template Bill Code";
        NewRoadWorkProgramActivity: Record "New Road Work Program Activity";
        TariffCodes1: Record "Tariff Codes1";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        JobsSetup: Record "Jobs Setup";
        TAskNo: Integer;
        Item: Record Item;
        JobList: Page "Job List";
        ProcurementPlanLines: Record "Procurement Plan Lines";
        ProcurementPlanEntry: Record "Procurement Plan Entry";
        ProcurementPlan: Record "Procurement Plan";
        ConsRoadWorkProgramPackage: Record "Cons Road Work Program Package";
        LineNo: Integer;
        LinNo2: Integer;
        ProcurementSetup: Record "Procurement Setup";
        ProjectRoadLink: Record "Project Road Link";
        ObjProjectRoadLink: Record "Project Road Link";
        ProjectRoadLinkConstituency: Record "Project Road Link Constituency";
        DetailedMulti_YearLine: Record "Detailed Multi_Year Line";
        DMSManagement: Codeunit "DMS Management";
        DMSDocuments: Record "DMS Documents";
        ScheduleofPPRequirements: Record 92428;

    local procedure FnPostNewRoadWorkPlan()
    begin
        //Insert Jobs
        JobsSetup.Get;
        NewRoadWorkProgramPackage.Reset;
        NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID", Rec.Code);
        if NewRoadWorkProgramPackage.FindSet then begin
            repeat
                Job.Init;
                Job."No." := '';//NoSeriesManagement.GetNextNo(JobsSetup."Job Nos.",TODAY,TRUE);
                Job.Description := Rec.Description;
                Job."Directorate Code" := NewRoadWorkProgramPackage."Directorate ID";
                Job."Department ID" := NewRoadWorkProgramPackage."Department ID";
                Job."Road Code" := NewRoadWorkProgramPackage."Road Code";
                Job."Record Type" := Job."record type"::"Road Project";
                Job.Validate("Road Code");
                Job."Road Section No" := NewRoadWorkProgramPackage."Road Section No.";
                Job.Validate("Road Section No");
                Job."Road Class ID" := NewRoadWorkProgramPackage."Road Class";
                Job."Bill-to Customer No." := 'CUST00001';
                Job.Insert(true);
            until NewRoadWorkProgramPackage.Next = 0;
        end;

        //Insert Tasks
        NewRoadWorkProgramTask.Reset;
        NewRoadWorkProgramTask.SetRange(NewRoadWorkProgramTask."Road Work Program ID", NewRoadWorkProgramPackage."Road Work Program ID");
        if NewRoadWorkProgramTask.FindSet(true) then
            repeat
                JobTask.Init;
                JobTask."Job No." := Job."No.";
                JobTask."Job Task No." := NewRoadWorkProgramTask."Begin-Total Job Task No.";
                JobTask.Description := NewRoadWorkProgramTask.Description;
                JobTask.Location := RoadWorkPlanPackage."Region ID";
                JobTask."Job Task Type" := JobTask."job task type"::"Begin-Total";
                if not JobTask.Get(JobTask."Job No.", JobTask."Job Task No.") then
                    JobTask.Insert(true);

                JobTask.Init;
                JobTask."Job No." := Job."No.";
                JobTask."Job Task No." := NewRoadWorkProgramTask."Package No.";
                JobTask.Description := NewRoadWorkProgramTask.Description;
                JobTask.Location := RoadWorkPlanPackage."Region ID";
                JobTask."Job Task Type" := JobTask."job task type"::Posting;
                if not JobTask.Get(JobTask."Job No.", JobTask."Job Task No.") then
                    JobTask.Insert(true);

                JobTask.Init;
                JobTask."Job No." := Job."No.";
                JobTask."Job Task No." := NewRoadWorkProgramTask."End-Total Job Task No.";
                JobTask.Description := NewRoadWorkProgramTask.Description;
                JobTask.Location := RoadWorkPlanPackage."Region ID";
                JobTask."Job Task Type" := JobTask."job task type"::"End-Total";
                if not JobTask.Get(JobTask."Job No.", JobTask."Job Task No.") then
                    JobTask.Insert(true);
            until NewRoadWorkProgramTask.Next = 0;

        //Create Job Planning Lines
        NewRoadWorkProgramActivity.Reset;
        NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID", Rec.Code);
        if NewRoadWorkProgramActivity.FindSet then begin
            repeat
                JobPlanningLine.Init;
                JobPlanningLine."Job No." := Job."No.";
                JobPlanningLine."Job Task No." := NewRoadWorkProgramTask."Package No.";
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.", Job."No.");
                if JobPlanningLine.FindLast then
                    JobPlanningLine."Line No." := JobPlanningLine."Line No." + 1000
                else
                    JobPlanningLine."Line No." := 1000;
                JobPlanningLine.Type := JobPlanningLine.Type::Item;
                JobPlanningLine."No." := NewRoadWorkProgramActivity."Activity Code";
                JobPlanningLine.Status := JobPlanningLine.Status::Planning;
                JobPlanningLine."Budget Type" := JobPlanningLine."budget type"::Original;
                JobPlanningLine."Ledger Entry Type" := JobPlanningLine."ledger entry type"::Item;
                JobPlanningLine.Description := NewRoadWorkProgramActivity.Description;
                JobPlanningLine.Quantity := NewRoadWorkProgramActivity."Packaged Quantity";
                JobPlanningLine.Validate(Quantity);
                JobPlanningLine."Road Technology" := NewRoadWorkProgramActivity."Technology Type";
                JobPlanningLine.Validate("Road Technology");
                JobPlanningLine."Road Activity Categories" := NewRoadWorkProgramActivity."Bill Item Category Code";
                JobPlanningLine."Direct Unit Cost (LCY)" := NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                JobPlanningLine."Unit Cost" := NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                JobPlanningLine.Validate("Unit Cost");
                JobPlanningLine.Insert(true);
            until NewRoadWorkProgramActivity.Next = 0;
        end;

        Message('Success');
        Job.Reset;
        Job.SetRange(Job."No.", Job."No.");
        if Job.FindSet then
            JobList.SetTableview(Job);
        JobList.Run();
    end;

    local procedure FnInsertPlanningCategory()
    begin
        ProcurementSetup.Get();
        RoadPackage.Reset;
        RoadPackage.SetRange(RoadPackage."Road Work Program ID", Rec.Code);
        if RoadPackage.FindSet then begin
            repeat
                ProcurementPlan.Reset;
                ProcurementPlan.SetRange(ProcurementPlan."Plan Type", ProcurementPlan."plan type"::Consolidated);
                ProcurementPlan.SetRange(ProcurementPlan.Code, Rec."Procurement Plan ID");
                if ProcurementPlan.FindSet then begin
                    ProcurementPlanLines.Reset;
                    ProcurementPlanLines.SetCurrentkey("Procurement Plan ID", "Planning Category");
                    ProcurementPlanLines.SetRange(ProcurementPlanLines."Procurement Plan ID", RoadPackage."Procurement Plan ID");
                    ProcurementPlanLines.SetRange(ProcurementPlanLines."Planning Category", RoadPackage."Procurement Category");
                    if not ProcurementPlanLines.FindSet then begin
                        ProcurementPlanLines.Init;
                        ProcurementPlanLines."PP Line No" := ProcurementPlanLines.Count + 1;
                        ProcurementPlanLines."Procurement Plan ID" := ProcurementSetup."Effective Procurement Plan";
                        ProcurementPlanLines."Planning Category" := RoadPackage."Procurement Category";
                        ProcurementPlanLines.Validate("Planning Category");
                        ProcurementPlanLines."Procurement Type" := 'WORKS';
                        ProcurementPlanLines."Solicitation Type" := 'OPENTENDER';
                        ProcurementPlanLines."Procurement Method" := ProcurementPlanLines."procurement method"::"Open Tender";
                        ProcurementPlanLines."Primary Source of Funds" := RoadPackage."Funding Source ID";
                        //   if not ProcurementPlanLines.Get(ProcurementPlanLines."Procurement Plan ID", //ProcurementPlanLines."PP Line No") then
                        ProcurementPlanLines.Insert(true);
                    end;
                end;
            until RoadPackage.Next = 0;
        end;
    end;

    local procedure FnInsertIntoPPlanEntry()
    begin
        //Insert In the Procurement Plan Entry Tables
        ProcurementSetup.Get();
        RoadPackage.Reset;
        RoadPackage.SetRange(RoadPackage."Road Work Program ID", Rec.Code);
        if RoadPackage.FindSet then
            repeat
                ProcurementPlanEntry.Init;
                ProcurementPlanEntry."Entry No." := LineNo;
                ProcurementPlanEntry."Procurement Plan ID" := ProcurementSetup."Effective Procurement Plan";
                ProcurementPlanEntry."Planning Category" := RoadPackage."Procurement Category";
                ProcurementPlanEntry."Work Plan Project ID" := RoadPackage."Road Work Program ID";
                ProcurementPlanEntry.Description := RoadPackage."Package Name";
                ProcurementPlanEntry."Procurement Type" := 'WORKS';
                ProcurementPlanEntry."Solicitation Type" := 'OPENTENDER';
                ProcurementPlanEntry."Unit of Measure" := 'PROJECT';
                ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."requisition product group"::Works;
                ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."procurement use"::"Project-Specific Use";
                ProcurementPlanEntry."Procurement Method" := ProcurementPlanEntry."procurement method"::"Open Tender";
                ProcurementPlanEntry."Invitation Notice Type" := ProcurementPlanEntry."invitation notice type"::"Single  Stage Tender";
                ProcurementPlanEntry."Preference/Reservation Code" := 'LOC';
                ProcurementPlanEntry."Funding Source ID" := RoadPackage."Funding Source ID";
                ProcurementPlanEntry."Start Chainage(Km)" := RoadPackage."Start Chainage";
                ProcurementPlanEntry."End Chainage(Km)" := RoadPackage."End Chainage";
                ProcurementPlanEntry."Planning Date" := Today;
                ProcurementPlanEntry.Quantity := 1;
                //RoadPackage.CALCFIELDS(RoadPackage."Budget (Cost) Excl. VAT",RoadPackage."Budget (Cost) Incl. VAT",RoadPackage."Budget (VAT Amount)");
                ProcurementPlanEntry."Unit Cost" := RoadPackage."Total Budget Cost";
                ProcurementPlanEntry."Line Budget Cost" := RoadPackage."Total Budget Cost";
                ProcurementPlanEntry."Section Length(Km)" := RoadPackage."Total Road Section Length";
                ProcurementPlanEntry.Region := RoadPackage."Global Dimension 1 Code";
                ProcurementPlanEntry."Global Dimension 1 Code" := RoadPackage."Global Dimension 1 Code";
                ProcurementPlanEntry.Constituency := RoadPackage."Constituency ID";
                ProcurementPlanEntry."Global Dimension 2 Code" := RoadPackage."Global Dimension 2 Code";
                ProcurementPlanEntry.Department := RoadPackage."Department ID";
                ProcurementPlanEntry.Directorate := RoadPackage."Directorate ID";
                ProcurementPlanEntry."Road No." := RoadPackage."Road Code";
                ProcurementPlanEntry.Validate("Road No.");
                ProcurementPlanEntry."Estimated Cost of Project" := RoadPackage."Total Contract Sum Incl. VAT";
                ProcurementPlanEntry."Total Workplanned Length" := RoadPackage."Workplanned Length (Km)";
                ProcurementPlanEntry."Workplan Task No." := RoadPackage."Project No";
                JobTask.Reset;
                JobTask.SetRange(JobTask."Job No.", RoadPackage."Project No");
                if JobTask.FindSet then begin
                    ProcurementPlanEntry."Budget Control Job No" := JobTask."Job No.";
                    ProcurementPlanEntry."Budget Control Job Task No." := JobTask."Job Task No.";
                end;
                ProcurementPlanEntry.Status := ProcurementPlanEntry.Status::Approved;
                if not ProcurementPlanEntry.Get(ProcurementPlanEntry."Procurement Plan ID", ProcurementPlanEntry."Entry No.") then
                    ProcurementPlanEntry.Insert(true);
            until RoadPackage.Next = 0;
        Message('Posted Successfully');
    end;

    local procedure FnGetRegionID(RegionName: Text[50]): Code[20]
    var
        ObjResponsibilityCenter: Record "Responsibility Center";
    begin
        ObjResponsibilityCenter.Reset;
        ObjResponsibilityCenter.SetRange("Operating Unit Type", ObjResponsibilityCenter."operating unit type"::Region);
        ObjResponsibilityCenter.SetRange(Name, RegionName);
        if ObjResponsibilityCenter.FindSet then
            exit(ObjResponsibilityCenter.Code);
    end;

    local procedure FnUpdatePPlanEntry()
    begin
        //Update the Procurement Plan Entry Table

        ProcurementSetup.Get();
        RoadPackage.Reset;
        RoadPackage.SetRange(RoadPackage."Road Work Program ID", Rec.Code);
        if RoadPackage.FindSet then begin
            repeat
                ProcurementPlan.Reset;
                ProcurementPlan.SetRange(ProcurementPlan."Plan Type", ProcurementPlan."plan type"::Consolidated);
                ProcurementPlan.SetRange(ProcurementPlan.Code, Rec."Procurement Plan ID");
                if ProcurementPlan.FindSet then begin
                    ProcurementPlanEntry.Reset;
                    ProcurementPlanEntry.SetCurrentkey("Procurement Plan ID", "KeRRA Budget Code", "Entry No.");
                    ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Procurement Plan ID", Rec."Procurement Plan ID");
                    ProcurementPlanEntry.SetRange(ProcurementPlanEntry."KeRRA Budget Code", RoadPackage."KeRRA Budget Code");
                    // ProcurementPlanEntry.SETRANGE(ProcurementPlanLines."Planning Category",RoadPackage."Procurement Category");
                    // ProcurementPlanEntry.SetRange(ProcurementPlanEntry."Entry No.",RoadPackage."Procurement Plan Entry No");
                    if ProcurementPlanEntry.FindSet then begin
                        Message(ProcurementPlanEntry."KeRRA Budget Code");
                        ProcurementPlanEntry.Init;
                        ProcurementPlanEntry."Entry No." := RoadPackage."Entry No";
                        ProcurementPlanEntry."Procurement Plan ID" := ProcurementSetup."Effective Procurement Plan";
                        ProcurementPlanEntry."Planning Category" := ProcurementPlanLines."Planning Category";
                        ProcurementPlanEntry."Work Plan Project ID" := RoadPackage."Road Work Program ID";
                        ProcurementPlanEntry.Description := RoadPackage."Package Name";
                        ProcurementPlanEntry."Procurement Type" := 'WORKS';
                        ProcurementPlanEntry."Solicitation Type" := 'OPENTENDER';
                        ProcurementPlanEntry."Unit of Measure" := 'PROJECT';
                        ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."Requisition Product Group"::Works;
                        ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."Procurement Use"::"Project-Specific Use";
                        ProcurementPlanEntry."Procurement Method" := ProcurementPlanEntry."Procurement Method"::"Open Tender";
                        ProcurementPlanEntry."Invitation Notice Type" := ProcurementPlanEntry."Invitation Notice Type"::"Single  Stage Tender";
                        ProcurementPlanEntry."Preference/Reservation Code" := ProcurementPlanEntry."Preference/Reservation Code";
                        ProcurementPlanEntry."Funding Source ID" := RoadPackage."Funding Source ID";
                        ProcurementPlanEntry."Planning Date" := Today;
                        ProcurementPlanEntry.Quantity := 1;
                        ProcurementPlanEntry.Region := RoadPackage."Global Dimension 1 Code";
                        ProcurementPlanEntry."Global Dimension 1 Code" := RoadPackage."Global Dimension 1 Code";
                        ProcurementPlanEntry.Constituency := RoadPackage."Constituency ID";
                        ProcurementPlanEntry."Global Dimension 2 Code" := RoadPackage."Global Dimension 2 Code";
                        ProcurementPlanEntry.Department := RoadPackage."Department ID";
                        ProcurementPlanEntry.Directorate := RoadPackage."Directorate ID";
                        ProcurementPlanEntry."Estimated Cost of Project" := RoadPackage."Total Contract Sum Incl. VAT";
                        ProcurementPlanEntry."Total Workplanned Length" := RoadPackage."Workplanned Length (Km)";
                        ProcurementPlanEntry."Workplan Task No." := RoadPackage."Project No";
                        JobTask.Reset;
                        JobTask.SetRange(JobTask."Job No.", RoadPackage."Project No");
                        if JobTask.FindSet then begin
                            ProcurementPlanEntry."Budget Control Job No" := JobTask."Job No.";
                            ProcurementPlanEntry."Budget Control Job Task No." := JobTask."Job Task No.";
                        end;
                        ProcurementPlanEntry.Status := ProcurementPlanEntry.Status::Approved;
                        //IF NOT ProcurementPlanEntry.GET(ProcurementPlanEntry."Procurement Plan ID",ProcurementPlanEntry."Entry No.") THEN
                        ProcurementPlanEntry.Modify(true);
                    end;
                end;
            until RoadPackage.Next = 0;

            Message('Posted Successfully');
        end;
    end;
}
