#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72317 "Global Constructio Budget Card"
{
    Caption = 'Global Maintenance Budget Book';
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
                field("Financial Year Code"; "Financial Year Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Description := 'Annual Maintenance Budget Ceilings Year: ' + "Financial Year Code";
                    end;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Authority; Authority)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; "Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategic Plan ID"; "Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Budget ID"; "Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Line/ Vote Item"; "Budget Line/ Vote Item")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
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
                }
                field("Total Financial Budget"; "Total Financial Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Budget Ceiling"; "Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Work Plan Amount';
                }
                field("Total Actual Costs"; "Total Actual Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date"; "Created Date")
                {
                    ApplicationArea = Basic;
                }
                field("Created Time"; "Created Time")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22; "Construction Budget  Ceilings")
            {
                SubPageLink = "Road Work Program ID" = field(Code);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Import Budget Entries")
            {
                ApplicationArea = Basic;
                Ellipsis = true;
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Config. Packages";
                RunPageView = where(Code = const('ROADPACKAGE'));

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
                    // if ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) then
                    // ApprovalsMgmt.OnSendRWPReqForApproval(Rec);
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
                    //   ApprovalsMgmt.OnCancelRWPReqApprovalRequest(Rec);
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
                    //  ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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

                trigger OnAction()
                begin
                    Reset;
                    SetRange(Code, Code);
                    if FindSet then
                        Report.Run(72006, true, false, Rec);
                end;
            }
            group(ActionGroup5)
            {
                action("G/l Budget Entries")
                {
                    ApplicationArea = Basic;
                    Image = LedgerEntries;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Road Program G/L budget";
                    RunPageLink = "Road Work Program" = field(Code),
                                  "Road Project Category" = filter("Construction Works");
                }
                action("Check Budget ")
                {
                    ApplicationArea = Basic;
                    Image = CheckLedger;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        // RMS.CheckBudgetCeiling(Rec)
                    end;
                }
                action("Suggest Projects")
                {
                    ApplicationArea = Basic;
                    Image = Suggest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = false;

                    trigger OnAction()
                    begin
                        //  RMS.FnSuggestProjectsFromBudgetEntriesWorksType(Rec, "Document Type", Workstype::Construction);
                        Message('Lines suggested successfully');
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Multi-Year Programs";
        "Planning Type" := "planning type"::"Top-Down (New Works)";
        "Road Project Category" := "road project category"::"Road Construction";
        "Type of Project" := "type of project"::MAINTENANCE;
    end;

    var
        NewRoadWorkProgramTask: Record "New Road Work Program Task";
        NewRoadWorkProgramPackage: Record "New Road Work Program Package";
        PurchaseRequisitionTemplate: Record "Purchase Requisition Template";
        RequisitionTemplateLine: Record "BoQ Template Line1";
        BoQTemplateBillCode: Record "BoQ Template Bill Code";
        NewRoadWorkProgramActivity: Record "New Road Work Program Activity";
        TariffCodes1: Record "Tariff Codes1";
        Job: Record Job;
        JobTask: Record "Job Task";
        JobPlanningLine: Record "Job Planning Line";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        JobsSetup: Record "Jobs Setup";
        TAskNo: Integer;
        Item: Record Item;
        JobList: Page "Job List";
        Procurement: Codeunit "Procurement Processing";
        ConsRoadWorkProgram: Record "Road Work Program";
        ExistingRoadWPPackage: Record "Existing Road WP Package";
        ExistingRoadWorkPrograTask: Record "Existing Road Work Progra Task";
        ExistingRoadWPActivity: Record "Existing Road WP Activity";
        ConsRoadWorkProgramPackage: Record "Cons Road Work Program Package";
        ConsRoadWorkProgramTask: Record "Cons Road Work Program Task";
        ConRoadWorkProgramActivity: Record "Con Road Work Program Activity";
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        RoadWorkProgram: Record "Road Work Program";
        RMS: Codeunit "RMS Management";
        WorksType: Option " ",Maintenance,Construction,"Studies_Surveys & Design","Axle Load";
}

