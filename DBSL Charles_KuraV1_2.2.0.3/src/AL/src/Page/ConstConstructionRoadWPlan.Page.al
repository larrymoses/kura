#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72330 "Const Construction Road W_Plan"
{
    // Caption = 'Regional Maintenance Work Plan';
    // DeleteAllowed = false;
    // PageType = Card;
    // SourceTable = "Road Work Program";

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             field("Code";Code)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Road Planner No";"Road Planner No")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Road Planner Name";"Road Planner Name")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Gloabal Budget Book ID";"Gloabal Budget Book ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Constituency ID";"Constituency ID")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Region ID";"Region ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Financial Budget ID";"Financial Budget ID")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Financial Year Code";"Financial Year Code")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;

    //                 trigger OnValidate()
    //                 begin
    //                     Description:='Annual Maintenance Budget Ceilings Year: '+"Financial Year Code";
    //                 end;
    //             }
    //             field(Description;Description)
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field(Authority;Authority)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Document Date";"Document Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Global Dimension 1 Code";"Global Dimension 1 Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Global Dimension 2 Code";"Global Dimension 2 Code")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Start Date";"Start Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("End Date";"End Date")
    //             {
    //                 ApplicationArea = Basic;
    //             }
    //             field("Total Workplanned Length (Km)";"Total Workplanned Length (Km)")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Total Financial Budget";"Total Financial Budget")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Total Budget Ceiling";"Total Budget Ceiling")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Total Budget Book Amount';
    //                 Editable = false;
    //             }
    //             field("Total Actual Costs";"Total Actual Costs")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Approval Status";"Approval Status")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field(Posted;Posted)
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created By";"Created By")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created Date";"Created Date")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //             field("Created Time";"Created Time")
    //             {
    //                 ApplicationArea = Basic;
    //                 Editable = false;
    //             }
    //         }
    //         part("Construction Budget  Ceilings";"Construction Budget  Ceiling L")
    //         {
    //             SubPageLink = "Road Work Program ID"=field(Code);
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         action("Import Budget Entries")
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = Import;
    //             Promoted = true;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;
    //             RunObject = Page "Config. Packages";
    //             RunPageView = where(Code=const('GLOBALBUDGET'));

    //             trigger OnAction()
    //             begin
    //                 //MESSAGE('Success');
    //             end;
    //         }
    //         action("Send Approval Request")
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = SendApprovalRequest;
    //             Promoted = true;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 RMS.CheckBudgetCeiling(Rec);
    //                 CalcFields("Total Budget Ceiling");
    //                 TestField("Total Budget Ceiling");
    //                 RMS.FnCheckWorkPlanLinesExist(NewRoadWorkProgramPackage,Code);
    //                 if ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) then
    //                   ApprovalsMgmt.OnSendRWPReqForApproval(Rec);
    //             end;
    //         }
    //         action("Cancel Approval Request")
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = CancelApprovalRequest;
    //             Promoted = true;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 TestField("Approval Status","approval status"::"Pending Approval");
    //                 ApprovalsMgmt.OnCancelRWPReqApprovalRequest(Rec);
    //             end;
    //         }
    //         action(Approvals)
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = Approvals;
    //             Promoted = true;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin

    //                 ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
    //             end;
    //         }
    //         action(Print)
    //         {
    //             ApplicationArea = Basic;
    //             Ellipsis = true;
    //             Image = Print;
    //             Promoted = true;
    //             PromotedIsBig = true;
    //             PromotedOnly = true;

    //             trigger OnAction()
    //             begin
    //                 Reset;
    //                 SetRange(Code,Code);
    //                 if FindSet then
    //                 Report.Run(72006,true,false,Rec);
    //             end;
    //         }
    //         group(ActionGroup24)
    //         {
    //             action("G/l Budget Entries")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = LedgerEntries;
    //                 Promoted = true;
    //                 PromotedCategory = Category4;
    //                 RunObject = Page "Road Program G/L budget";
    //                 RunPageLink = "Road Work Program"=field(Code),
    //                               "Road Project Category"=filter("Construction Works");
    //             }
    //             action("Check Budget ")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = CheckLedger;
    //                 Promoted = true;
    //                 PromotedCategory = Process;

    //                 trigger OnAction()
    //                 begin
    //                     RMS.CheckBudgetCeiling(Rec)
    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "Document Type":="document type"::"Schedule Of Projects";
    //     "Planning Type":="planning type"::"Top-Down (New Works)";
    //     "Road Project Category":="road project category"::"Construction Works";


    //     if UserSetup.Get(UserId) then begin
    //       "Road Planner No":=UserSetup."Road Planner No";
    //       Validate("Road Planner No");
    //       end;
    // end;

    // var
    //     NewRoadWorkProgramTask: Record "New Road Work Program Task";
    //     NewRoadWorkProgramPackage: Record "New Road Work Program Package";
    //     PurchaseRequisitionTemplate: Record "Purchase Requisition Template";
    //     RequisitionTemplateLine: Record "BoQ Template Line1";
    //     BoQTemplateBillCode: Record "BoQ Template Bill Code";
    //     NewRoadWorkProgramActivity: Record "New Road Work Program Activity";
    //     TariffCodes1: Record "Tariff Codes1";
    //     Job: Record Job;
    //     JobTask: Record "Job Task";
    //     JobPlanningLine: Record "Job Planning Line";
    //     NoSeriesManagement: Codeunit NoSeriesManagement;
    //     JobsSetup: Record "Jobs Setup";
    //     TAskNo: Integer;
    //     Item: Record Item;
    //     JobList: Page "Job List";
    //     Procurement: Codeunit "Procurement Processing";
    //     ConsRoadWorkProgram: Record "Road Work Program";
    //     ExistingRoadWPPackage: Record "Existing Road WP Package";
    //     ExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
    //     ExistingRoadWPActivity: Record "Existing Road WP Activity";
    //     ConsRoadWorkProgramPackage: Record "Cons Road Work Program Package";
    //     ConsRoadWorkProgramTask: Record "Cons Road Work Program Task";
    //     ConRoadWorkProgramActivity: Record "Con Road Work Program Activity";
    //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    //     RoadWorkProgram: Record "Road Work Program";
    //     RMS: Codeunit "RMS Management";
    //     UserSetup: Record "User Setup";
    //     RoadPackage: Record "New Road Work Program Package";
}

