#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 72722 "Global Study/Survey Budget C"
{
    Caption = 'Global Study/Survey Budget Card';
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
                        Description := 'Annual Construction Budget Ceilings Year: ' + "Financial Year Code";
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
                    Visible = false;
                }
                field("Financial Budget ID"; "Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Line/ Vote Item"; "Budget Line/ Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                field("Total Financial Budget"; "Total Financial Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Budget Ceiling"; "Total Budget Ceiling")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Budget Book Amount';
                    Editable = false;
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
            part("Studies/Surveys Budget Lines"; "Studies/Surveys  Budget Lines")
            {
                Caption = 'Studies/Surveys Budget Lines';
                SubPageLink = "Road Work Program ID" = field(Code);
                // ToolTip = 'Studies/Surveys Budget Lines';
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
                    // RMS.CheckBudgetCeiling(Rec);
                    //RMS.FnCheckWorkPlanLinesExist(NewRoadWorkProgramPackage,Code);
                    CalcFields("Total Budget Ceiling");
                    TestField("Total Budget Ceiling");
                    TestField("Approval Status", "approval status"::Open);

                    //  if ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) then
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
                    TestField("Approval Status", "approval status"::"Pending Approval");
                    //  if ApprovalsMgmt.CheckRWPReqApprovalPossible(Rec) then
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
                    ApprovalsMgmt.OpenApprovalEntriesPage(RecordId);
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
                        Report.Run(72016, true, false, Rec);
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
                        //     RMS.CheckBudgetCeiling(Rec)
                    end;
                }
                action("Suggest Lines From Multi Year")
                {
                    ApplicationArea = Basic;
                    Caption = 'Suggest Lines From Multi Year';
                    Image = SuggestBin;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    begin
                        //                     RMS.SuggstFromMultiYearBudget(NewRoadWorkProgramPackage,DetailedMulti_YearLine,"Financial Year Code",Code,Rec);
                        Dialog.Message('Line(s) inserted successfully');
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
                        //   RMS.FnSuggestProjectsFromBudgetEntriesWorksType(Rec,"Document Type",Workstype::"Studies_Surveys & Design");
                        Dialog.Message('Lines suggested successfully');
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        if "Approval Status" = "approval status"::Released then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if "Approval Status" = "approval status"::Released then begin
            CurrPage.Editable := false;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Document Type" := "document type"::"Global Budget Book";
        "Road Project Category" := "road project category"::"Survey/Study";

        if UserSetup.Get(UserId) then begin
            if UserSetup."Create Development Budget Book" = false then
                Error('You are not allowed to create Budgets');
        end;
    end;

    trigger OnOpenPage()
    begin
        if "Approval Status" = "approval status"::Released then begin
            CurrPage.Editable := false;
        end;
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
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        RoadWorkProgram: Record "Road Work Program";
        RMS: Codeunit "RMS Management";
        UserSetup: Record "User Setup";
        DetailedMulti_YearLine: Record "Detailed Multi_Year Line";
        WorksType: Option " ",Maintenance,Construction,"Studies_Surveys & Design","Axle Load";
}

