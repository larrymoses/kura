#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72730 "Workplan for Studies/Surveys"
{
    Caption = 'Workplan for Studies and Surveys';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Road Work Program";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Planner No"; "Road Planner No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Planner Name"; "Road Planner Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Gloabal Budget Book ID"; "Gloabal Budget Book ID")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; "Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID"; "Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        Description := 'Annual Studies and Surveys Budget Ceilings Year: ' + "Financial Year Code";
                    end;
                }
                field("Procurement Plan ID"; "Procurement Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Authority; Authority)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("<Global Dimension 1 Code>"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; "End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Workplanned Length (Km)"; "Total Workplanned Length (Km)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Cost"; "Total Cost")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Budget Amount';
                }
                field("Total Actual Costs"; "Total Actual Costs")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part("Workplan Studies and Surveys"; "Workplan Studies/Surveys Lines")
            {
                Caption = 'Workplan Studies and Surveys';
                // SubPageLink = "Road Work Program ID"=field(Code);
                ToolTip = 'Workplan Studies and Surveys';
                //         }
                //     }
                // }

                // actions
                // {
                //     area(navigation)
                //     {
                //         action("Suggest Lines")
                //         {
                //             ApplicationArea = Basic;
                //             Caption = 'Select Budget Lines';
                //             Image = Suggest;
                //             Promoted = true;
                //             PromotedIsBig = true;
                //             PromotedOnly = true;

                //             trigger OnAction()
                //             begin
                //                 RoadPackage.Reset;
                //                 RoadPackage.SetRange(RoadPackage."Road Work Program ID", Code);
                //                 if RoadPackage.FindSet then
                //                     RoadPackage.DeleteAll;

                //                 NewRoadWorkProgramPackage.Reset;
                //                 NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID", "Gloabal Budget Book ID");
                //                 //NewRoadWorkProgramPackage.SETRANGE(NewRoadWorkProgramPackage."Region ID","Region ID");
                //                 if NewRoadWorkProgramPackage.FindSet then begin
                //                     repeat
                //                         RoadPackage.Init;
                //                         RoadPackage."Road Work Program ID" := Code;
                //                         RoadPackage."KeRRA Budget Code" := NewRoadWorkProgramPackage."KeRRA Budget Code";
                //                         RoadPackage."Budget Entry No" := NewRoadWorkProgramPackage."Package No.";
                //                         RoadPackage."Package Name" := NewRoadWorkProgramPackage."Package Name";
                //                         RoadPackage."Funding Source ID" := NewRoadWorkProgramPackage."Funding Source ID";
                //                         RoadPackage."Road Works Category" := NewRoadWorkProgramPackage."Road Works Category";
                //                         RoadPackage."Pavement Surface Type" := NewRoadWorkProgramPackage."Pavement Surface Type";
                //                         RoadPackage."Funding Source ID" := NewRoadWorkProgramPackage."Funding Source ID";
                //                         RoadPackage."Project Location ID" := NewRoadWorkProgramPackage."Project Location ID";
                //                         RoadPackage."Global Dimension 1 Code" := NewRoadWorkProgramPackage."Region ID";
                //                         RoadPackage.Validate("Funding Source ID");
                //                         RoadPackage."Total Budget Cost" := NewRoadWorkProgramPackage."Total Budget Cost";
                //                         RoadPackage."Region ID" := FnGetRegionID(NewRoadWorkProgramPackage."Region ID");
                //                         //   MESSAGE('This is the Region ID %1',FnGetRegionID(NewRoadWorkProgramPackage."Region ID"));
                //                         RoadPackage."Entry No" := RoadPackage.Count + 1;
                //                         RoadPackage.Validate("Region ID");
                //                         RoadPackage."BoQ Template Code" := NewRoadWorkProgramPackage."BoQ Template Code";
                //                         RoadPackage."VAT Bus. Posting Group" := "VAT Bus. Posting Group";
                //                         RoadPackage.Validate("VAT Bus. Posting Group");
                //                         RoadPackage."VAT Prod. Posting Group" := "VAT Prod. Posting Group";
                //                         RoadPackage.Validate("VAT Prod. Posting Group");
                //                         if not RoadPackage.Insert(true) then
                //                             RoadPackage.Modify(true);

                //                         ProjectRoadLink.Reset;
                //                         ProjectRoadLink.SetRange(ProjectRoadLink."Global Budget Book Code", "Gloabal Budget Book ID");
                //                         ProjectRoadLink.SetRange(ProjectRoadLink."KeRRA Budget Code", NewRoadWorkProgramPackage."KeRRA Budget Code");
                //                         if ProjectRoadLink.FindSet then
                //                             repeat
                //                                 ObjProjectRoadLink.Init;
                //                                 ObjProjectRoadLink.TransferFields(ProjectRoadLink);
                //                                 ObjProjectRoadLink."KeRRA Budget Code" := NewRoadWorkProgramPackage."KeRRA Budget Code";
                //                                 ObjProjectRoadLink."Global Budget Book Code" := Code;
                //                                 ObjProjectRoadLink."Line No" := ObjProjectRoadLink.Count + 1;
                //                                 if not ObjProjectRoadLink.Insert(true) then
                //                                     ObjProjectRoadLink.Modify(true);
                //                             until ProjectRoadLink.Next = 0;
                //                     until NewRoadWorkProgramPackage.Next = 0;
                //                     Message('Lines Suggested Successfully');
                //                 end;
                //             end;
                //             //             }
                //             //             action("Suggest Bil Items From Template")
                //             //             {
                //             //                 ApplicationArea = Basic;
                //             //                 Caption = 'Generate Project BoQ';
                //             //                 Image = SuggestBatch;
                //             //                 Promoted = true;
                //             //                 PromotedIsBig = true;
                //             //                 PromotedOnly = true;

                //             //                 trigger OnAction()
                //             //                 begin
                //             //                     RMS.FnCreateRWProgramTasksFromBOQTemplate(RoadWorkPlanPackage, Job, NewRoadWorkProgramTask, Rec);
                //             //                     RMS.FnCreateRWProgramTasksFromBOQTemplatePBRM(RoadWorkPlanPackage, Job, NewRoadWorkProgramTask, Rec);
                //             //                     RMS.FnCreateRWPPlanningLinesFromBOQTemplates(RoadWorkPlanPackage, Job, NewRoadWorkProgramActivity, Rec);
                //             //                     RMS.FnCreateRWPPlanningLinesFromBOQTemplatesPBRM(RoadWorkPlanPackage, Job, NewRoadWorkProgramActivity, Rec);
                //             //                     Message('Bill Items inserted successfully');
                //             //                 end;
                //             //             }
                //             //             action("Import Budget Entries")
                //             //             {
                //             //                 ApplicationArea = Basic;
                //             //                 Ellipsis = true;
                //             //                 Image = Import;
                //             //                 Promoted = true;
                //             //                 PromotedIsBig = true;
                //             //                 PromotedOnly = true;
                //             //                 RunObject = Page "Config. Packages";
                //             //                 RunPageView = where(Code = const('GLOBALBUDGET'));

                //             //                 trigger OnAction()
                //             //                 begin
                //             //                     //MESSAGE('Success');
                //             //                 end;
                //             //             }
                //             //             action("Send Approval Request")
                //             //             {
                //             //                 ApplicationArea = Basic;
                //             //                 Ellipsis = true;
                //             //                 Image = SendApprovalRequest;
                //             //                 Promoted = true;
                //             //                 PromotedIsBig = true;
                //             //                 PromotedOnly = true;

                //             //                 trigger OnAction()
                //             //                 begin
                //             //                     //NewRoadWorkProgramPackage.TESTFIELD(NewRoadWorkProgramPackage."Procurement Category");
                //             //                     TestField("Approval Status", "approval status"::Open);
                //             //                     // if ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) then
                //             //                     //   ApprovalsMgmt.OnSendRWPReqForApproval(Rec);
                //                 end;
                //             }
                //             action("Cancel Approval Request")
                //             {
                //                 ApplicationArea = Basic;
                //                 Ellipsis = true;
                //                 Image = CancelApprovalRequest;
                //                 Promoted = true;
                //                 PromotedIsBig = true;
                //                 PromotedOnly = true;

                //                 trigger OnAction()
                //                 begin
                //                     //      ApprovalsMgmt.OnCancelRWPReqApprovalRequest(Rec);
                //                 end;
                //             }
                //             action(Approvals)
                //             {
                //                 ApplicationArea = Basic;
                //                 Ellipsis = true;
                //                 Image = Approvals;
                //                 Promoted = true;
                //                 PromotedIsBig = true;
                //                 PromotedOnly = true;

                //                 trigger OnAction()
                //                 begin
                //                     //   ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
                //                 end;
                //             }
                //             action(Print)
                //             {
                //                 ApplicationArea = Basic;
                //                 Ellipsis = true;
                //                 Image = Print;
                //                 Promoted = true;
                //                 PromotedIsBig = true;
                //                 PromotedOnly = true;

                //                 trigger OnAction()
                //                 begin
                //                     Reset;
                //                     SetRange(Code, Code);
                //                     if FindSet then
                //                         Report.Run(72017, true, false, Rec);
                //                 end;
                //             }
                //             action("G/l Budget Entries")
                //             {
                //                 ApplicationArea = Basic;
                //                 Image = LedgerEntries;
                //                 Promoted = true;
                //                 PromotedCategory = Category4;
                //                 RunObject = Page "Road Program G/L budget";
                //                 RunPageLink = "Road Work Program" = field(Code),
                //                               "Road Project Category" = filter("Construction Works");
                //                 Visible = false;
                //             }
                //             action("Check Budget ")
                //             {
                //                 ApplicationArea = Basic;
                //                 Image = CheckLedger;
                //                 Promoted = true;
                //                 PromotedCategory = Process;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     RMS.CheckBudgetCeiling(Rec)
                //                 end;
                //             }
                //             action(Post)
                //             {
                //                 ApplicationArea = Basic;
                //                 Caption = 'Create Project(s)';
                //                 Image = Post;
                //                 Promoted = true;
                //                 PromotedIsBig = true;
                //                 PromotedOnly = true;

                //                 trigger OnAction()
                //                 begin
                //                     TestField("Approval Status", "approval status"::Released);
                //                     RMS.FnCreateJobsFromWorkPlanLines(RoadWorkPlanPackage, Job, Rec);
                //                     RMS.FnCreateJobPlanningLinesFromT72135(RoadWorkPlanPackage, Job, JobPlanningLine, Rec, NewRoadWorkProgramActivity);
                //                     RMS.FnCreateProjectRoadLinksFromPlanToJob(Rec, RoadWorkPlanPackage);
                //                     //RMS.FnCreateProjectScopeOfWorks(Rec,RoadWorkPlanPackage,ProjectRoadLink);
                //                     //RMS.FnCreateProjectConstituencies(Rec,RoadWorkPlanPackage,ProjectRoadLink);
                //                     //Post To Procurement Plan

                //                     RoadPackage.Reset;
                //                     RoadPackage.SetRange(RoadPackage."Road Work Program ID", Code);
                //                     if RoadPackage.FindSet then
                //                         repeat
                //                             RoadPackage.TestField("Procurement Category");
                //                         until RoadPackage.Next = 0;
                //                     FnInsertPlanningCategory();
                //                     FnInsertIntoPPlanEntry();
                //                     Posted := true;
                //                     Modify;
                //                     Message('The document %1 has been posted successfully', Code);
                //                 end;
                //             }
                //             action("Post To Procurement Plan")
                //             {
                //                 ApplicationArea = Basic;
                //                 Ellipsis = true;
                //                 Image = Planning;
                //                 Promoted = true;
                //                 PromotedIsBig = true;
                //                 PromotedOnly = true;
                //                 Visible = false;

                //                 trigger OnAction()
                //                 begin
                //                     TestField("Approval Status", "approval status"::Released);
                //                     TestField("Procurement Plan ID");
                //                 end;
                //             }
                //             action("Print Schedule Of Project (s)")
                //             {
                //                 ApplicationArea = Basic;
                //                 Image = Print;
                //                 Promoted = true;
                //                 PromotedCategory = "Report";
                //                 PromotedIsBig = true;
                //                 PromotedOnly = true;

                //                 trigger OnAction()
                //                 begin
                //                     Reset;
                //                     SetRange(Code, Code);
                //                     if FindSet then
                //                         Report.Run(75003, true, false, Rec);
                //                 end;
                //             }
                //         }
                //     }

                //     trigger OnAfterGetCurrRecord()
                //     begin
                //         if "Approval Status" = "approval status"::Released then begin
                //             CurrPage.Editable := false;
                //         end;
                //     end;

                //     trigger OnAfterGetRecord()
                //     begin
                //         if "Approval Status" = "approval status"::Released then begin
                //             CurrPage.Editable := false;
                //         end;
                //     end;

                //     trigger OnNewRecord(BelowxRec: Boolean)
                //     begin
                //         "Document Type" := "document type"::"Schedule Of Projects";
                //         "Planning Type" := "planning type"::"Top-Down (New Works)";
                //         "Road Project Category" := "road project category"::"Studies and Surveys";

                //         //IF "Planning Level"="Planning Level"::Regional THEN BEGIN
                //         if UserSetup.Get(UserId) then begin
                //             "Road Planner No" := UserSetup."Road Planner No";
                //             Validate("Road Planner No");
                //         end;
                //         //END;
                //     end;

                //     trigger OnOpenPage()
                //     begin
                //         if "Approval Status" = "approval status"::Released then begin
                //             CurrPage.Editable := false;
                //         end;
                //     end;

                //     var
                //         Job: Record Job;
                //         JobTask: Record "Job Task";
                //         JobPlanningLine: Record "Job Planning Line";
                //         Procurement: Codeunit "Procurement Processing";
                //         ConsRoadWorkProgram: Record "Road Work Program";
                //         ExistingRoadWPPackage: Record "Existing Road WP Package";
                //         ExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
                //         ExistingRoadWPActivity: Record "Existing Road WP Activity";
                //         //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                //         RoadWorkProgram: Record "Road Work Program";
                //         RMS: Codeunit "RMS Management";
                //         UserSetup: Record "User Setup";
                //         RoadPackage: Record "Road WorkPlan Package";
                //         RoadWorkPlanPackage: Record "Road WorkPlan Package";
                //         NewRoadWorkProgramTask: Record "New Road Work Program Task";
                //         NewRoadWorkProgramPackage: Record "New Road Work Program Package";
                //         PurchaseRequisitionTemplate: Record "Purchase Requisition Template";
                //         RequisitionTemplateLine: Record "BoQ Template Line1";
                //         BoQTemplateBillCode: Record "BoQ Template Bill Code";
                //         NewRoadWorkProgramActivity: Record "New Road Work Program Activity";
                //         TariffCodes1: Record "Tariff Codes1";
                //         NoSeriesManagement: Codeunit NoSeriesManagement;
                //         JobsSetup: Record "Jobs Setup";
                //         TAskNo: Integer;
                //         Item: Record Item;
                //         JobList: Page "Job List";
                //         ProcurementPlanLines: Record "Procurement Plan Lines";
                //         ProcurementPlanEntry: Record "Procurement Plan Entry";
                //         ProcurementPlan: Record "Procurement Plan";
                //         ConsRoadWorkProgramPackage: Record "Cons Road Work Program Package";
                //         LineNo: Integer;
                //         LinNo2: Integer;
                //         ProcurementSetup: Record "Procurement Setup";
                //         ProjectRoadLink: Record "Project Road Link";
                //         ObjProjectRoadLink: Record "Project Road Link";
                //         ProjectRoadLinkConstituency: Record "Project Road Link Constituency";

                //     local procedure FnPostNewRoadWorkPlan()
                //     begin
                //         //Insert Jobs
                //         JobsSetup.Get;
                //         NewRoadWorkProgramPackage.Reset;
                //         NewRoadWorkProgramPackage.SetRange(NewRoadWorkProgramPackage."Road Work Program ID", Code);
                //         if NewRoadWorkProgramPackage.FindSet then begin
                //             repeat
                //                 Job.Init;
                //                 Job."No." := '';//NoSeriesManagement.GetNextNo(JobsSetup."Job Nos.",TODAY,TRUE);
                //                 Job.Description := Description;
                //                 Job."Directorate Code" := NewRoadWorkProgramPackage."Directorate ID";
                //                 Job."Department ID" := NewRoadWorkProgramPackage."Department ID";
                //                 Job."Road Code" := NewRoadWorkProgramPackage."Road Code";
                //                 Job."Record Type" := Job."record type"::"Road Project";
                //                 Job.Validate("Road Code");
                //                 Job."Road Section No" := NewRoadWorkProgramPackage."Road Section No.";
                //                 Job.Validate("Road Section No");
                //                 Job."Road Class ID" := NewRoadWorkProgramPackage."Road Class";
                //                 Job."Bill-to Customer No." := 'CUST2006';
                //                 Job.Insert(true);
                //             until NewRoadWorkProgramPackage.Next = 0;
                //         end;

                //         //Insert Tasks
                //         NewRoadWorkProgramTask.Reset;
                //         NewRoadWorkProgramTask.SetRange(NewRoadWorkProgramTask."Road Work Program ID", NewRoadWorkProgramPackage."Road Work Program ID");
                //         if NewRoadWorkProgramTask.FindSet(true) then
                //             repeat
                //                 JobTask.Init;
                //                 JobTask."Job No." := Job."No.";
                //                 JobTask."Job Task No." := NewRoadWorkProgramTask."Begin-Total Job Task No.";
                //                 JobTask.Description := NewRoadWorkProgramTask.Description;
                //                 JobTask.Location := RoadWorkPlanPackage."Region ID";
                //                 JobTask."Job Task Type" := JobTask."job task type"::"Begin-Total";
                //                 if not JobTask.Get(JobTask."Job No.", JobTask."Job Task No.") then
                //                     JobTask.Insert(true);

                //                 JobTask.Init;
                //                 JobTask."Job No." := Job."No.";
                //                 JobTask."Job Task No." := NewRoadWorkProgramTask."Package No.";
                //                 JobTask.Description := NewRoadWorkProgramTask.Description;
                //                 JobTask.Location := RoadWorkPlanPackage."Region ID";
                //                 JobTask."Job Task Type" := JobTask."job task type"::Posting;
                //                 if not JobTask.Get(JobTask."Job No.", JobTask."Job Task No.") then
                //                     JobTask.Insert(true);

                //                 JobTask.Init;
                //                 JobTask."Job No." := Job."No.";
                //                 JobTask."Job Task No." := NewRoadWorkProgramTask."End-Total Job Task No.";
                //                 JobTask.Description := NewRoadWorkProgramTask.Description;
                //                 JobTask.Location := RoadWorkPlanPackage."Region ID";
                //                 JobTask."Job Task Type" := JobTask."job task type"::"End-Total";
                //                 if not JobTask.Get(JobTask."Job No.", JobTask."Job Task No.") then
                //                     JobTask.Insert(true);
                //             until NewRoadWorkProgramTask.Next = 0;

                //         //Create Job Planning Lines
                //         NewRoadWorkProgramActivity.Reset;
                //         NewRoadWorkProgramActivity.SetRange(NewRoadWorkProgramActivity."Road Work Program ID", Code);
                //         if NewRoadWorkProgramActivity.FindSet then begin
                //             repeat
                //                 JobPlanningLine.Init;
                //                 JobPlanningLine."Job No." := Job."No.";
                //                 JobPlanningLine."Job Task No." := NewRoadWorkProgramTask."Package No.";
                //                 JobPlanningLine.Reset;
                //                 JobPlanningLine.SetRange(JobPlanningLine."Job No.", Job."No.");
                //                 if JobPlanningLine.FindLast then
                //                     JobPlanningLine."Line No." := JobPlanningLine."Line No." + 1000
                //                 else
                //                     JobPlanningLine."Line No." := 1000;
                //                 JobPlanningLine.Type := JobPlanningLine.Type::Item;
                //                 JobPlanningLine."No." := NewRoadWorkProgramActivity."Activity Code";
                //                 JobPlanningLine.Status := JobPlanningLine.Status::Planning;
                //                 JobPlanningLine."Budget Type" := JobPlanningLine."budget type"::Original;
                //                 JobPlanningLine."Ledger Entry Type" := JobPlanningLine."ledger entry type"::Item;
                //                 JobPlanningLine.Description := NewRoadWorkProgramActivity.Description;
                //                 JobPlanningLine.Quantity := NewRoadWorkProgramActivity."Packaged Quantity";
                //                 JobPlanningLine.Validate(Quantity);
                //                 JobPlanningLine."Road Technology" := NewRoadWorkProgramActivity."Technology Type";
                //                 JobPlanningLine.Validate("Road Technology");
                //                 JobPlanningLine."Road Activity Categories" := NewRoadWorkProgramActivity."Bill Item Category Code";
                //                 JobPlanningLine."Direct Unit Cost (LCY)" := NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                //                 JobPlanningLine."Unit Cost" := NewRoadWorkProgramActivity."Engineer's Rate (Unit Cost)";
                //                 JobPlanningLine.Validate("Unit Cost");
                //                 JobPlanningLine.Insert(true);
                //             until NewRoadWorkProgramActivity.Next = 0;
                //         end;

                //         Message('Success');
                //         Job.Reset;
                //         Job.SetRange(Job."No.", Job."No.");
                //         if Job.FindSet then
                //             JobList.SetTableview(Job);
                //         JobList.Run();
                //     end;

                //     local procedure FnInsertPlanningCategory()
                //     begin
                //         ProcurementSetup.Get();
                //         RoadPackage.Reset;
                //         RoadPackage.SetRange(RoadPackage."Road Work Program ID", Code);
                //         if RoadPackage.FindSet then begin
                //             repeat
                //                 ProcurementPlan.Reset;
                //                 ProcurementPlan.SetRange(ProcurementPlan."Plan Type", ProcurementPlan."plan type"::Consolidated);
                //                 ProcurementPlan.SetRange(ProcurementPlan.Code, "Procurement Plan ID");
                //                 if ProcurementPlan.FindSet then begin
                //                     ProcurementPlanLines.Reset;
                //                     ProcurementPlanLines.SetCurrentkey("Procurement Plan ID", "Planning Category");
                //                     ProcurementPlanLines.SetRange(ProcurementPlanLines."Procurement Plan ID", RoadPackage."Procurement Plan ID");
                //                     ProcurementPlanLines.SetRange(ProcurementPlanLines."Planning Category", RoadPackage."Procurement Category");
                //                     if not ProcurementPlanLines.FindSet then begin
                //                         ProcurementPlanLines.Init;
                //                         ProcurementPlanLines."PP Line No" := ProcurementPlanLines.Count + 1;
                //                         ProcurementPlanLines."Procurement Plan ID" := ProcurementSetup."Effective Procurement Plan";
                //                         ProcurementPlanLines."Planning Category" := RoadPackage."Procurement Category";
                //                         ProcurementPlanLines.Validate("Planning Category");
                //                         ProcurementPlanLines."Procurement Type" := 'WORKS';
                //                         ProcurementPlanLines."Solicitation Type" := 'OPENTENDER';
                //                         ProcurementPlanLines."Procurement Method" := ProcurementPlanLines."procurement method"::"Open Tender";
                //                         ProcurementPlanLines."Primary Source of Funds" := RoadPackage."Funding Source ID";
                //                         if not ProcurementPlanLines.Get(ProcurementPlanLines."Procurement Plan ID", ProcurementPlanLines."PP Line No") then
                //                             ProcurementPlanLines.Insert(true);
                //                     end;
                //                 end;
                //             until RoadPackage.Next = 0;
                //         end;
                //     end;

                //     local procedure FnInsertIntoPPlanEntry()
                //     begin
                //         //Insert In the Procurement Plan Entry Tables
                //         ProcurementSetup.Get();
                //         RoadPackage.Reset;
                //         RoadPackage.SetRange(RoadPackage."Road Work Program ID", Code);
                //         if RoadPackage.FindSet then
                //             repeat
                //                 ProcurementPlanEntry.Init;
                //                 ProcurementPlanEntry."Entry No." := LineNo;
                //                 ProcurementPlanEntry."Procurement Plan ID" := ProcurementSetup."Effective Procurement Plan";
                //                 ProcurementPlanEntry."Planning Category" := RoadPackage."Procurement Category";
                //                 ProcurementPlanEntry."Work Plan Project ID" := RoadPackage."Road Work Program ID";
                //                 ProcurementPlanEntry.Description := RoadPackage."Package Name";
                //                 ProcurementPlanEntry."Procurement Type" := 'WORKS';
                //                 ProcurementPlanEntry."Solicitation Type" := 'OPENTENDER';
                //                 ProcurementPlanEntry."Unit of Measure" := 'PROJECT';
                //                 ProcurementPlanEntry."Requisition Product Group" := ProcurementPlanEntry."requisition product group"::Works;
                //                 ProcurementPlanEntry."Procurement Use" := ProcurementPlanEntry."procurement use"::"Project-Specific Use";
                //                 ProcurementPlanEntry."Procurement Method" := ProcurementPlanEntry."procurement method"::"Open Tender";
                //                 ProcurementPlanEntry."Invitation Notice Type" := ProcurementPlanEntry."invitation notice type"::"Single  Stage Tender";
                //                 ProcurementPlanEntry."Preference/Reservation Code" := 'LOC';
                //                 ProcurementPlanEntry."Funding Source ID" := RoadPackage."Funding Source ID";
                //                 ProcurementPlanEntry."Start Chainage(Km)" := RoadPackage."Start Chainage";
                //                 ProcurementPlanEntry."End Chainage(Km)" := RoadPackage."End Chainage";
                //                 ProcurementPlanEntry."Planning Date" := Today;
                //                 ProcurementPlanEntry.Quantity := 1;
                //                 //RoadPackage.CALCFIELDS(RoadPackage."Budget (Cost) Excl. VAT",RoadPackage."Budget (Cost) Incl. VAT",RoadPackage."Budget (VAT Amount)");
                //                 ProcurementPlanEntry."Unit Cost" := RoadPackage."Total Budget Cost";
                //                 ProcurementPlanEntry."Line Budget Cost" := RoadPackage."Total Budget Cost";
                //                 ProcurementPlanEntry."Section Length(Km)" := RoadPackage."Total Road Section Length";
                //                 ProcurementPlanEntry.Region := RoadPackage."Global Dimension 1 Code";
                //                 ProcurementPlanEntry."Global Dimension 1 Code" := RoadPackage."Global Dimension 1 Code";
                //                 ProcurementPlanEntry.Constituency := RoadPackage."Constituency ID";
                //                 ProcurementPlanEntry."Global Dimension 2 Code" := RoadPackage."Global Dimension 2 Code";
                //                 ProcurementPlanEntry.Department := RoadPackage."Department ID";
                //                 ProcurementPlanEntry.Directorate := RoadPackage."Directorate ID";
                //                 ProcurementPlanEntry."Road No." := RoadPackage."Road Code";
                //                 ProcurementPlanEntry.Validate("Road No.");
                //                 ProcurementPlanEntry."Workplan Task No." := RoadPackage."Project No";
                //                 JobTask.Reset;
                //                 JobTask.SetRange(JobTask."Job No.", RoadPackage."Project No");
                //                 if JobTask.FindSet then begin
                //                     ProcurementPlanEntry."Budget Control Job No" := JobTask."Job No.";
                //                     ProcurementPlanEntry."Budget Control Job Task No." := JobTask."Job Task No.";
                //                 end;
                //                 ProcurementPlanEntry.Status := ProcurementPlanEntry.Status::Approved;
                //                 if not ProcurementPlanEntry.Get(ProcurementPlanEntry."Procurement Plan ID", ProcurementPlanEntry."Entry No.") then
                //                     ProcurementPlanEntry.Insert(true);
                //             until RoadPackage.Next = 0;
                //         Message('Posted Successfully');
                //     end;

                //     local procedure FnGetRegionID(RegionName: Text[50]): Code[20]
                //     var
                //         ObjResponsibilityCenter: Record "Responsibility Center";
                //     begin
                //         ObjResponsibilityCenter.Reset;
                //         ObjResponsibilityCenter.SetRange("Operating Unit Type", ObjResponsibilityCenter."operating unit type"::Region);
                //         ObjResponsibilityCenter.SetRange(Name, RegionName);
                //         if ObjResponsibilityCenter.FindSet then
                //             exit(ObjResponsibilityCenter.Code);
                //     end;
                // }
            }
        }
    }
}
